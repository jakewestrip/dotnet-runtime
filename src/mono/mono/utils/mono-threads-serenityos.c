#include <config.h>

#if defined(HOST_SERENITYOS)

#include <mono/utils/mono-threads.h>
#include <pthread.h>
#include <serenity.h>
#include <unistd.h>

void mono_threads_platform_get_stack_bounds (guint8 **staddr, size_t *stsize)
{
	*staddr = NULL;
	*stsize = (size_t)-1;

	uintptr_t base;
	size_t size;
	int rslt = get_stack_bounds(&base, &size);

	*staddr = base;
	*stsize = size;
}

guint64 mono_native_thread_os_id_get (void)
{
	return (guint64)gettid();
}

#else

#include <mono/utils/mono-compiler.h>

MONO_EMPTY_SOURCE_FILE (mono_threads_serenity);

#endif
