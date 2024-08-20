an iOS application designed to display rescue-related information using a table view with dynamic content. The app leverages custom table view cells to represent different sections, such as Support Cast, Current Rescuer, and Rescuer History. Each section has unique styling and functionality, including collapsible headers and custom UI elements.

Key Features:
Dynamic Table View Layout:

The table view is divided into three sections, each representing different types of data.
Custom cells, such as SupportCastTableViewCell and RescuerHistoryTableViewCell, are used to display information related to support cast members, current rescuers, and rescuer history.
Custom Header Views:

Each section features a custom header view with a title and a toggle button.
Headers are non-floating, providing a stable visual structure.
The toggle button in the header allows users to collapse or expand sections dynamically.
Flexible Cell Content:

The cell content is configured based on the index path, allowing different data and styles for each row.
Section 2, "Rescuer History," includes a separator image between rows, providing visual separation.
Color Customization:

Colors are assigned dynamically based on hex values, ensuring consistent theming across the application.
Gradient backgrounds are applied to certain views, adding a modern touch to the UI.
Automatic Row Height:

The row height is set to adjust automatically based on content, ensuring an optimal user experience.
Toggleable Section Heights:

Users can tap the toggle button in the header to change the height of the section dynamically, either expanding or collapsing it as needed.
This codebase is designed with a focus on clean UI and UX, making it a flexible and user-friendly component for any iOS project dealing with similar data structures.
