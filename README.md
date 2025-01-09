# FitFolio

FitFolio is a Swift-based mockup app designed to explore calorie counting functionality while learning iOS development. The app showcases a variety of features, including food management, progress tracking, and visual representation of nutritional data through custom views and UI components.

## Figma Mockup

The wireframes for the navigation pages can be viewed <a href="https://www.figma.com/design/azRoBRkMs4jbUaR8fpYn5e/FitFolio-Wireframes?node-id=0-1&t=YVl2gSpTNgc4DQ2P-1
">here</a>

Below is the Figma navigation screens image for those who prefer not to click the link:

<img width="530" alt="image" src="https://github.com/user-attachments/assets/ef513790-e2ff-4928-9362-cb38992660aa" />

## Features
### 1. Food Management
- #### Food Class:
  - Represents food items with multiple constructors.
  - Includes a description property for a string representation of the class. 
- #### Serving Class:
  - Handles serving size and includes a metric-to-imperial conversion function.

### 2. Custom Views
FitFolio implements several custom views to enhance the user experience:

- #### FoodCardView:
  - Displays the header, background, body, image, and a button for food-related actions.
- #### FoodSummaryView:
  - Summarizes total calories, fats, carbs, and protein consumed for the day.
- #### CircularImageWithOutlineView:
  - Creates a circular image with a border for a clean, modern look.
- #### CircularProgressView:
  - A customizable circular progress bar indicating progress (e.g., 0.0-1.0).
- #### MacroProgressView:
  - Tracks weekly progress for calories, fats, carbs, and protein using horizontal progress bars.
 
### 3. Journal Management
- #### JournalEntry:
  - Tracks timestamp, calories, fats, carbs, and protein for each entry.
- #### JournalEntryViewModel:
  - Provides functionalities such as adding, updating, inserting, and removing journal entries.
  - Includes utility methods like checking if the journal is empty and retrieving the number of entries.

- #### JournalEntryView:
  - Displays journal entries with hourly timestamps and placeholders for food data.
  - Implements a function to generate 24-hour timestamps dynamically.

### 4. Navigation Views
FitFolio includes five main navigation views:

- #### AddView:
  - Allows users to add foods or goals (no functionality as of today).

- #### PathView:
  - Displays the user's progress toward goals and their projected timeline.

- #### MoreView:
  - Offers additional customization options, including settings, weekly highlights, and steps tracking.

- #### JournalView:
  - Displays journal entries with progress bars and food-related data.
  - Circular progress bars for tracking daily goals.
 
- #### DashboardView:
- Displays the main interface with the following features:
  - Greeting based on the time of day (e.g., "Good morning", "Good afternoon", "Good evening").
  - Daily target progress bars (horizontal).
  - Cards with placeholders for goal graphs.

### 5. Utility Functions
- #### Timestamp Utilities:
  - Functions to generate large and small timestamps.
- #### Daily Target Progress Bars:
  - Horizontal bars for tracking daily goals like calorie intake and macronutrient consumption.

## Learning Objectives
FitFolio was developed to:

- Gain familiarity with the Swift programming language.
- Explore iOS app development concepts like MVVM architecture and custom views.
- Implement progress tracking and nutritional calculations in a user-friendly interface.

## Technologies Used
- Language: Swift
- Framework: SwiftUI
- Development Tools: Xcode, Figma
