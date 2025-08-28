import json
from datetime import datetime, timedelta
from ics import Calendar, Event

def find_next_available_slot(start_time):
    next_time = start_time

    # If before 8 AM, set to 8 AM
    if next_time.hour < 8:
        next_time = next_time.replace(hour=8, minute=0, second=0, microsecond=0)
    
    # If 5:30 PM or later, move to 8 AM the next day
    if next_time.hour > 17 or (next_time.hour == 17 and next_time.minute >= 30):
        next_time += timedelta(days=1)
        next_time = next_time.replace(hour=8, minute=0, second=0, microsecond=0)

    # Skip weekends (Saturday or Sunday) and reset time to 8 AM
    while next_time.weekday() >= 5: # Saturday is 5, Sunday is 6
        next_time += timedelta(days=1)
        next_time = next_time.replace(hour=8, minute=0, second=0, microsecond=0)
        
    return next_time

def assign_interview_slots(candidates):
    # Start scheduling from the next available slot from now
    next_slot = find_next_available_slot(datetime.now())
    interview_duration = timedelta(minutes=45)
    break_duration = timedelta(minutes=15)

    for candidate in candidates:
        candidate['interview_date'] = next_slot
        # Calculate the start of the next slot
        next_slot += interview_duration + break_duration
        # Ensure the next slot is a valid working time
        next_slot = find_next_available_slot(next_slot)

def create_combined_calendar_file(candidates):
    # Create a single calendar to hold all events
    combined_calendar = Calendar()
    
    for candidate in candidates:
        event = Event()
        event.name = f"Interview with {candidate['name']}"
        event.begin = candidate['interview_date']
        event.end = event.begin + timedelta(minutes=45)
        event.description = f"Discussing skills: {', '.join(candidate['skillset'])}."
        event.location = "Online / Office"
        
        # Add the event to our single calendar
        combined_calendar.events.add(event)

    output_filename = "all_interviews.ics"
    
    # Write the single calendar with all events to one file
    with open(output_filename, 'w') as f:
        f.write(combined_calendar.serialize())
    
    print(f"Generated combined calendar file: {output_filename}")

def main():
    try:
        with open('candidates.json', 'r') as f:
            candidates = json.load(f)
    except FileNotFoundError:
        print("Error: candidates.json not found in the current directory.")
        return

    # Sort candidates by percentage in descending order
    candidates.sort(key=lambda x: x['likelihoodPercentage'], reverse=True)
    
    # Assign interview slots based on the sorted list
    assign_interview_slots(candidates)
    
    # Create a single .ics file with all the scheduled interviews
    create_combined_calendar_file(candidates)

    print("\nSuccessfully scheduled all interviews into a single file.")

if __name__ == "__main__":
    main()