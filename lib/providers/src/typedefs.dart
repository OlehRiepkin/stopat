part of providers;

typedef ProviderScope = riverpod.ProviderScope;

//
// Widgets
//
typedef Consumer = riverpod.Consumer;
typedef ConsumerWidget = riverpod.ConsumerWidget;
typedef ConsumerStatefulWidget = riverpod.ConsumerStatefulWidget;
typedef ConsumerState<T extends ConsumerStatefulWidget>
    = riverpod.ConsumerState<T>;

typedef WidgetRef = riverpod.WidgetRef;

//
// Providers
//

typedef Provider<T> = riverpod.Provider<T>;

typedef FutureProvider<T> = riverpod.FutureProvider<T>;

typedef StreamProvider<T> = riverpod.StreamProvider<T>;

typedef Notifier<T> = riverpod.Notifier<T>;
typedef NotifierProvider<NotifierT extends Notifier<T>, T>
    = riverpod.NotifierProvider<NotifierT, T>;

typedef AsyncValue<T> = riverpod.AsyncValue<T>;
typedef AsyncNotifier<T> = riverpod.AsyncNotifier<T>;
typedef AsyncNotifierProvider<NotifierT extends AsyncNotifier<T>, T>
    = riverpod.AsyncNotifierProvider<NotifierT, T>;

/// (legacy)
// typedef StateProvider<T> = riverpod.StateProvider<T>;

/// (legacy)
// typedef StateNotifierProvider<NotifierT extends StateNotifier<T>, T>
//     = riverpod.StateNotifierProvider<NotifierT, T>;
// typedef StateNotifier<T> = riverpod.StateNotifier<T>;

/// (legacy)
// typedef ChangeNotifierProvider<T extends ChangeNotifier?>
//     = riverpod.ChangeNotifierProvider<T>;

//
// Other
//
typedef ProviderObserver = riverpod.ProviderObserver;
typedef ProviderBase<T> = riverpod.ProviderBase<T>;
typedef ProviderContainer = riverpod.ProviderContainer;
