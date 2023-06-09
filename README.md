# katim_task

A new Flutter project.

## Getting Started

The project is developed with

* Clean Architecture
* BLoC(cubit) for State Management
* get_it package for service locator


## Folder structure

```
├─ assets
└─ lib
    ├─ data
    │   ├─ datasources
    │   │   ├─ offline
    │   │       ─   event_offline_datasource.dart
    │   │   └─ online
    │   │       ─   event_remote_datasource.dart
    │   ├─ models
    │   │   ─   event_model.dart
    │   └─ repositories_impl
    │       ─  online_repository_impl.dart
    │       ─  offline_repository_impl.dart
    ├─ domain
    │   ├─ repositories (abstract class)
    │   │   ─  online_repository.dart
    │   │   ─  offline_repository.dart
    │   └─ usecases
    │       └─ get_event.dart
    |
    └─ presentation
    │   ├─ view
    │   │  ├─ pages
    │   │  │   ─   event_detail.dart
    │   │  │   ─   listing_page.dart
    │   │  └─ widget
    │   │       ├─ divider.dart
    │   │       │─ event_card.dart
    │   │       │─ favorite.dart
    │   │       └─ search_text.dart
    │   └─ cubits
    │        ├─ base
    │        │   └─ base_cubit.dart
    │        ├─ local_event
    │        │    ─   local_event_cubit.dart
    │        │    ─   local_event_state.dart
    │        └─ remote_event
    │             ─   remote_event_cubit.dart
    │             ─   remote_event_state.dart
    └─ ultis
        ├─ config
        ├─ service
        └─ constants
    ─   main.dart
    ─   di.dart
─   analysis_options.yaml
─   build.yaml
─   pubspec.yaml
```
## Mobile Screenshot
![](/sreanshot/mobile.jpg)

## MacOS Screenshot
![](/sreanshot/macos.png)

## Demo
![](/sreanshot/demo.gif)

