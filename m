Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6C606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g2w3CayH
Received: from list by lists.xenproject.org with outflank-mailman.1468634.1677828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxI8-0004hd-Jr; Mon, 02 Nov 2026 19:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468634.1677828; Mon, 02 Nov 2026 19:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxI7-0004ed-Ec; Mon, 02 Nov 2026 19:01:59 +0000
Received: by outflank-mailman (input) for mailman id 1468634;
 Mon, 02 Nov 2026 19:01:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxI3-0003sm-RX
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxI3-000wUb-8B
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de22-2eae-0a2a0a5409dd-0a2a450a9dd8-2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:55 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de21-f2d2-0a2a450a0019-aa0a817c8423-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:54 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-QpPQZrGqOGWkL1Q-bCpvkA-1; Mon,
 02 Nov 2026 14:01:50 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B23151954B2A; Mon,  2 Nov 2026 19:01:48 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5F04D1956088; Mon,  2 Nov 2026 19:01:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793646113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bJ+MsD8/YM7jmhRRHSgSa9gB390FKakWl0PZSBzNXqg=;
	b=g2w3CayHyHTe1f0RaBWckdZvkuBzgAocwKDDg02JOsSilocYuuwGBwWIw4UQdU3PINBaox
	ylUA6ATjUW5aCg4uil1wsEF1vqXeJ6EAiuaaJG1XyTTxN2IhdULW8+LCW+QnLMb9X1LwPM
	QOcvuDsdvxBm3JytEetEDpUOqCcLWWQ=
X-MC-Unique: QpPQZrGqOGWkL1Q-bCpvkA-1
X-Mimecast-MFC-AGG-ID: QpPQZrGqOGWkL1Q-bCpvkA_1793646108
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Helge Deller <deller@gmx.de>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 25/25] trace: remove 'trace_event_get_state' wrapper
Date: Mon,  2 Nov 2026 13:58:31 -0500
Message-ID: <20261102185831.1880189-26-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 59S8iY7TzlCjAwogXUdOLqWv59a0NiBwMtXaUQLzntQ_1793646108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793646115-591C5CFC-43EE6842/35/111497
X-purgate-type: clean
X-purgate-size: 9567
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The 'trace_event_get_state' macro is a wrapper around the
'trace_event_get_state_dynamic_by_id' macro, which is a direct
check of the _TRACE_...._DSTATE global variable.

The only code that should be using this is the generated trace
probes, but the name looks rather appealing causing it to be
mistakenly used in other places, instead of the recommended
'trace_event_get_state_dynamic_backends'.

Removing the 'trace_event_get_state' macro reduces the potential
for confusion.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-26-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/tracetool/all.h                 | 8 ++++----
 tests/tracetool/ftrace.h              | 4 ++--
 tests/tracetool/log.h                 | 4 ++--
 tests/tracetool/simple.h              | 4 ++--
 tests/tracetool/syslog.h              | 4 ++--
 trace/control.h                       | 9 ---------
 scripts/tracetool/backend/__init__.py | 3 ++-
 scripts/tracetool/backend/log.py      | 2 +-
 scripts/tracetool/format/h.py         | 2 +-
 9 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/tests/tracetool/all.h b/tests/tracetool/all.h
index 01971827e4b..d4c91cdd1a4 100644
--- a/tests/tracetool/all.h
+++ b/tests/tracetool/all.h
@@ -51,14 +51,14 @@ void _simple_trace_test_wibble(void *context, int value);
 static inline void trace_test_blah(void *context, const char *filename)
 {
     QEMU_TEST_BLAH(context, filename);
-    if (trace_event_get_state(TRACE_TEST_BLAH) &&
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) &&
         qemu_loglevel_mask(LOG_TRACE)) {
 #line 4 "trace-events"
             qemu_log("test_blah " "Blah context=%p filename=%s" "\n", context, filename);
 #line 59 "all.h"
     }
     tracepoint(qemu, test_blah, context, filename);
-    if (trace_event_get_state(TRACE_TEST_BLAH)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH)) {
 #line 4 "trace-events"
         ftrace_write("test_blah " "Blah context=%p filename=%s" "\n" , context, filename);
 #line 65 "all.h"
@@ -80,14 +80,14 @@ static inline void trace_test_blah(void *context, const char *filename)
 static inline void trace_test_wibble(void *context, int value)
 {
     QEMU_TEST_WIBBLE(context, value);
-    if (trace_event_get_state(TRACE_TEST_WIBBLE) &&
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) &&
         qemu_loglevel_mask(LOG_TRACE)) {
 #line 5 "trace-events"
             qemu_log("test_wibble " "Wibble context=%p value=%d" "\n", context, value);
 #line 88 "all.h"
     }
     tracepoint(qemu, test_wibble, context, value);
-    if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE)) {
 #line 5 "trace-events"
         ftrace_write("test_wibble " "Wibble context=%p value=%d" "\n" , context, value);
 #line 94 "all.h"
diff --git a/tests/tracetool/ftrace.h b/tests/tracetool/ftrace.h
index 4eba6b4d599..b55ee08bbfe 100644
--- a/tests/tracetool/ftrace.h
+++ b/tests/tracetool/ftrace.h
@@ -19,7 +19,7 @@ extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 
 static inline void trace_test_blah(void *context, const char *filename)
 {
-    if (trace_event_get_state(TRACE_TEST_BLAH)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH)) {
 #line 4 "trace-events"
         ftrace_write("test_blah " "Blah context=%p filename=%s" "\n" , context, filename);
 #line 26 "ftrace.h"
@@ -32,7 +32,7 @@ static inline void trace_test_blah(void *context, const char *filename)
 
 static inline void trace_test_wibble(void *context, int value)
 {
-    if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE)) {
 #line 5 "trace-events"
         ftrace_write("test_wibble " "Wibble context=%p value=%d" "\n" , context, value);
 #line 39 "ftrace.h"
diff --git a/tests/tracetool/log.h b/tests/tracetool/log.h
index 9afbe721a47..02bb1309e20 100644
--- a/tests/tracetool/log.h
+++ b/tests/tracetool/log.h
@@ -20,7 +20,7 @@ extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 
 static inline void trace_test_blah(void *context, const char *filename)
 {
-    if (trace_event_get_state(TRACE_TEST_BLAH) &&
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) &&
         qemu_loglevel_mask(LOG_TRACE)) {
 #line 4 "trace-events"
             qemu_log("test_blah " "Blah context=%p filename=%s" "\n", context, filename);
@@ -35,7 +35,7 @@ static inline void trace_test_blah(void *context, const char *filename)
 
 static inline void trace_test_wibble(void *context, int value)
 {
-    if (trace_event_get_state(TRACE_TEST_WIBBLE) &&
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) &&
         qemu_loglevel_mask(LOG_TRACE)) {
 #line 5 "trace-events"
             qemu_log("test_wibble " "Wibble context=%p value=%d" "\n", context, value);
diff --git a/tests/tracetool/simple.h b/tests/tracetool/simple.h
index 9b066364b0a..0b9e7cba35c 100644
--- a/tests/tracetool/simple.h
+++ b/tests/tracetool/simple.h
@@ -20,7 +20,7 @@ void _simple_trace_test_wibble(void *context, int value);
 
 static inline void trace_test_blah(void *context, const char *filename)
 {
-    if (trace_event_get_state(TRACE_TEST_BLAH)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH)) {
         _simple_trace_test_blah(context, filename);
     }
 }
@@ -31,7 +31,7 @@ static inline void trace_test_blah(void *context, const char *filename)
 
 static inline void trace_test_wibble(void *context, int value)
 {
-    if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE)) {
         _simple_trace_test_wibble(context, value);
     }
 }
diff --git a/tests/tracetool/syslog.h b/tests/tracetool/syslog.h
index 6a9304489f6..173b35dcf69 100644
--- a/tests/tracetool/syslog.h
+++ b/tests/tracetool/syslog.h
@@ -19,7 +19,7 @@ extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 
 static inline void trace_test_blah(void *context, const char *filename)
 {
-    if (trace_event_get_state(TRACE_TEST_BLAH)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH)) {
 #line 4 "trace-events"
         syslog(LOG_INFO, "test_blah " "Blah context=%p filename=%s" , context, filename);
 #line 26 "syslog.h"
@@ -32,7 +32,7 @@ static inline void trace_test_blah(void *context, const char *filename)
 
 static inline void trace_test_wibble(void *context, int value)
 {
-    if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
+    if (trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE)) {
 #line 5 "trace-events"
         syslog(LOG_INFO, "test_wibble " "Wibble context=%p value=%d" , context, value);
 #line 39 "syslog.h"
diff --git a/trace/control.h b/trace/control.h
index 71f254728d4..dfb52b23ac4 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -97,15 +97,6 @@ static uint32_t trace_event_get_id(TraceEvent *ev);
  */
 static const char * trace_event_get_name(TraceEvent *ev);
 
-/**
- * trace_event_get_state:
- * @id: Event identifier name.
- *
- * Get the tracing state of an event, both static and the QEMU dynamic state.
- */
-#define trace_event_get_state(id)                       \
-    (trace_event_get_state_dynamic_by_id(id))
-
 /**
  * trace_event_get_state_backends:
  * @id: Event identifier name.
diff --git a/scripts/tracetool/backend/__init__.py b/scripts/tracetool/backend/__init__.py
index 72f549c77c4..2749c4e6315 100644
--- a/scripts/tracetool/backend/__init__.py
+++ b/scripts/tracetool/backend/__init__.py
@@ -26,7 +26,8 @@
                             considered "public".
 CHECK_TRACE_EVENT_GET_STATE If exists and is set to 'True', the backend-specific
                             code inside the tracepoint is emitted within an
-                            ``if trace_event_get_state()`` conditional.
+                            ``if trace_event_get_state_dynamic_by_id()``
+                            conditional.
 =========================== ====================================================
 
 
diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 4a622dd4dcb..00a0dd9c9dc 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -28,7 +28,7 @@ def generate_h(event, group):
     if len(event.args) > 0:
         argnames = ", " + argnames
 
-    out('    if (trace_event_get_state(%(event_id)s) &&',
+    out('    if (trace_event_get_state_dynamic_by_id(%(event_id)s) &&',
         '        qemu_loglevel_mask(LOG_TRACE)) {',
         '#line %(event_lineno)d "%(event_filename)s"',
         '            qemu_log("%(name)s " %(fmt)s "\\n"%(argnames)s);',
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index f719fe09397..ad4ce4414fe 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -66,7 +66,7 @@ def generate(events, backend, group):
 
         if backend.check_trace_event_get_state:
             event_id = 'TRACE_' + e.name.upper()
-            cond = "trace_event_get_state(%s)" % event_id
+            cond = "trace_event_get_state_dynamic_by_id(%s)" % event_id
             out('    if (%(cond)s) {',
                 cond=cond)
             backend.generate(e, group, check_trace_event_get_state=True)
-- 
2.56.0


