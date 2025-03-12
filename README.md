# star-wars-api

## Overview
This is a sample iOS application integrating with SWAPI (https://swapi.dev/). The app fetches Star Wars planets from the API and displays additional information, such as planet residents.

## Features
- Displays a list of planets on the initial page. Scrolling to the bottom of the page will automatically load more planets.
- The planet detail page shows additional information and a list of residents.
- The resident detail page shows additional information about Star Wars characters.

## Technologies Used
- **SwiftUI**: For the UI framework.
- **Alamofire**: For networking and API requests.
- **CoreData**: For local persistence.
- **SwiftTesting**: For unit tests.

## Considerations
- The current implementation assumes that the data for any given response will not change, however, I added a lastEditDate property in CoreData, so that stale data can be re-fetched if necessary.
- The code is split in to Data, Presentation and Utility layers, following Domain Driven Design principles.
- I followed a protocol-oriented approach. This allows me to inject different environment variables for different targets and simplifies unit testing.
- SwiftUI views follow the MVVM pattern. To avoid storing a @StateObject ViewModel in the parent, each View constructs its own ViewModel on init, but the dependencies (conforming to protocols) can be injected on initialisation.

## Future Improvements
- Add more debugging and logging options for Alamofire requests.
- Expand unit tests and add UI automation tests.
- Store additional entities from the API, such as vehicles and starships.
- Improve data modeling by introducing struct models with proper types (e.g., `Int`, `Double`, `Enum`) instead of only using `String` values. This will require custom parsing of responses, because SWAPI returns JSON Strings, even for Int and Double values.

## Installation
1. Clone the repository.
2. Open the project in Xcode.
3. Run the app on a simulator or a physical device.

## License
This project is available for educational purposes and can be freely modified and distributed.


