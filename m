From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: [PATCH RFC 05/16] Save/Restore Support: Add kernel
	shutdown logic to shutdown.c
Date: Tue, 19 Dec 2017 15:42:00 -0800
Message-ID: <1513726931-7516-6-git-send-email-bruno.alvisio@gmail.com>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2424689312498665044=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2vxx=dp=balvisio-mac.localdomain=balvisio@srs-us1.protection.inumbo.net>)
 id 1eRRWf-00043U-0S
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 23:42:21 +0000
In-Reply-To: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, samuel.thibault@ens-lyon.org, wei.liu2@citrix.com, Bruno Alvisio <bruno.alvisio@gmail.com>
List-Id: xen-devel@lists.xenproject.org

--===============2424689312498665044==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Created shutdown.c for the shutdown thread and all the shutdown related
functions.

Signed-off-by: Bruno Alvisio <bruno.alvisio@gmail.com>
---
 Makefile           |   1 +
 include/shutdown.h |  11 ++++
 shutdown.c         | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 200 insertions(+)
 create mode 100644 include/shutdown.h
 create mode 100644 shutdown.c

diff --git a/Makefile b/Makefile
index 88315c4..6a05de6 100644
--- a/Makefile
+++ b/Makefile
@@ -53,6 +53,7 @@ src-y += mm.c
 src-$(CONFIG_NETFRONT) += netfront.c
 src-$(CONFIG_PCIFRONT) += pcifront.c
 src-y += sched.c
+src-y += shutdown.c
 src-$(CONFIG_TEST) += test.c
 src-$(CONFIG_BALLOON) += balloon.c
 
diff --git a/include/shutdown.h b/include/shutdown.h
new file mode 100644
index 0000000..a5ec019
--- /dev/null
+++ b/include/shutdown.h
@@ -0,0 +1,11 @@
+#ifndef _SHUTDOWN_H_
+#define _SHUTDOWN_H_
+
+#include <mini-os/hypervisor.h>
+
+void init_shutdown(start_info_t *si);
+
+void kernel_shutdown(int reason) __attribute__((noreturn));
+void kernel_suspend(void);
+
+#endif
diff --git a/shutdown.c b/shutdown.c
new file mode 100644
index 0000000..b3cea6d
--- /dev/null
+++ b/shutdown.c
@@ -0,0 +1,188 @@
+/*
+ *          MiniOS
+ *
+ *   file: fromdevice.cc
+ *
+ *          NEC Europe Ltd. PROPRIETARY INFORMATION
+ *
+ * This software is supplied under the terms of a license agreement
+ * or nondisclosure agreement with NEC Europe Ltd. and may not be
+ * copied or disclosed except in accordance with the terms of that
+ * agreement. The software and its source code contain valuable trade
+ * secrets and confidential information which have to be maintained in
+ * confidence.
+ * Any unauthorized publication, transfer to third parties or duplication
+ * of the object or source code - either totally or in part – is
+ * prohibited.
+ *
+ *      Copyright (c) 2014 NEC Europe Ltd. All Rights Reserved.
+ *
+ * Authors: Filipe Manco <filipe.manco@neclab.eu>
+ *
+ * NEC Europe Ltd. DISCLAIMS ALL WARRANTIES, EITHER EXPRESS OR IMPLIED,
+ * INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTIES OF MERCHANTABILITY
+ * AND FITNESS FOR A PARTICULAR PURPOSE AND THE WARRANTY AGAINST LATENT
+ * DEFECTS, WITH RESPECT TO THE PROGRAM AND THE ACCOMPANYING
+ * DOCUMENTATION.
+ *
+ * No Liability For Consequential Damages IN NO EVENT SHALL NEC Europe
+ * Ltd., NEC Corporation OR ANY OF ITS SUBSIDIARIES BE LIABLE FOR ANY
+ * DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS
+ * OF BUSINESS PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION, OR
+ * OTHER PECUNIARY LOSS AND INDIRECT, CONSEQUENTIAL, INCIDENTAL,
+ * ECONOMIC OR PUNITIVE DAMAGES) ARISING OUT OF THE USE OF OR INABILITY
+ * TO USE THIS PROGRAM, EVEN IF NEC Europe Ltd. HAS BEEN ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGES.
+ *
+ *     THIS HEADER MAY NOT BE EXTRACTED OR MODIFIED IN ANY WAY.
+ */
+#include <mini-os/os.h>
+#include <mini-os/events.h>
+#include <mini-os/kernel.h>
+#include <mini-os/sched.h>
+#include <mini-os/shutdown.h>
+#include <mini-os/lib.h>
+#include <mini-os/xenbus.h>
+#include <mini-os/xmalloc.h>
+
+
+static start_info_t *start_info_ptr;
+
+static const char *path = "control/shutdown";
+static const char *token = "control/shutdown";
+static xenbus_event_queue events = NULL;
+static int end_shutdown_thread = 0;
+
+#ifdef CONFIG_XENBUS
+/* This should be overridden by the application we are linked against. */
+__attribute__((weak)) void app_shutdown(unsigned reason)
+{
+    printk("Shutdown requested: %d\n", reason);
+    if (reason == SHUTDOWN_suspend) {
+        kernel_suspend();
+    } else {
+        struct sched_shutdown sched_shutdown = { .reason = reason };
+        HYPERVISOR_sched_op(SCHEDOP_shutdown, &sched_shutdown);
+    }
+}
+
+static void shutdown_thread(void *p)
+{
+    char *shutdown, *err;
+    unsigned int shutdown_reason;
+
+    xenbus_watch_path_token(XBT_NIL, path, token, &events);
+
+    for ( ;; ) {
+        xenbus_wait_for_watch(&events);
+        if ((err = xenbus_read(XBT_NIL, path, &shutdown))) {
+            free(err);
+            do_exit();
+        }
+
+        if (end_shutdown_thread)
+            break;
+
+        if (!strcmp(shutdown, "")) {
+            /* Avoid spurious event on xenbus */
+            /* FIXME: investigate the reason of the spurious event */
+            free(shutdown);
+            continue;
+        } else if (!strcmp(shutdown, "poweroff")) {
+            shutdown_reason = SHUTDOWN_poweroff;
+        } else if (!strcmp(shutdown, "reboot")) {
+            shutdown_reason = SHUTDOWN_reboot;
+        } else if (!strcmp(shutdown, "suspend")) {
+            shutdown_reason = SHUTDOWN_suspend;
+        } else {
+            shutdown_reason = SHUTDOWN_crash;
+        }
+        free(shutdown);
+
+        /* Acknowledge shutdown request */
+        if ((err = xenbus_write(XBT_NIL, path, ""))) {
+            free(err);
+            do_exit();
+        }
+
+        app_shutdown(shutdown_reason);
+    }
+}
+#endif
+
+static void fini_shutdown(void)
+{
+    char *err;
+
+    end_shutdown_thread = 1;
+    xenbus_release_wait_for_watch(&events);
+    err = xenbus_unwatch_path_token(XBT_NIL, path, token);
+    if (err) {
+        free(err);
+        do_exit();
+    }
+}
+
+void init_shutdown(start_info_t *si)
+{
+    start_info_ptr = si;
+
+    end_shutdown_thread = 0;
+    create_thread("shutdown", shutdown_thread, NULL);
+}
+
+void kernel_shutdown(int reason)
+{
+    char* reason_str = NULL;
+
+    switch(reason) {
+        case SHUTDOWN_poweroff:
+            reason_str = "poweroff";
+            break;
+        case SHUTDOWN_reboot:
+            reason_str = "reboot";
+            break;
+        case SHUTDOWN_crash:
+            reason_str = "crash";
+            break;
+        default:
+            do_exit();
+            break;
+    }
+
+    printk("MiniOS will shutdown (reason = %s) ...\n", reason_str);
+
+    fini_shutdown();
+
+    stop_kernel();
+
+    for ( ;; ) {
+        struct sched_shutdown sched_shutdown = { .reason = reason };
+        HYPERVISOR_sched_op(SCHEDOP_shutdown, &sched_shutdown);
+    }
+}
+
+void kernel_suspend(void)
+{
+    int rc;
+
+    printk("MiniOS will suspend ...\n");
+
+    pre_suspend();
+    arch_pre_suspend();
+
+    /*
+     * This hypercall returns 1 if the suspend
+     * was cancelled and 0 if resuming in a new domain
+     */
+    rc = HYPERVISOR_suspend(virt_to_mfn(start_info_ptr));
+
+    arch_post_suspend(rc);
+    post_suspend(rc);
+
+    if (rc) {
+        printk("MiniOS suspend canceled!");
+    } else {
+        printk("MiniOS resumed from suspend!\n");
+    }
+}
-- 
2.3.2 (Apple Git-55)



--===============2424689312498665044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2424689312498665044==--
