Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C4606A330
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iRg0dxrM
Received: from list by lists.xenproject.org with outflank-mailman.1472582.1680538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRj-0005eV-Lh; Wed, 04 Nov 2026 20:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472582.1680538; Wed, 04 Nov 2026 20:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRi-0005ZX-EP; Wed, 04 Nov 2026 20:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1472582;
 Wed, 04 Nov 2026 20:18:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRc-0004Kb-FZ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRb-007PIv-S1
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:51 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb92ed-e002-0a2a0a5209dd-0a2a450b9f1c-46
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:51 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb932a-b7e8-0a2a450b0019-aa0a857c7239-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:51 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-9LKdvOF9PRmCp-mtU7SZQQ-1; Wed,
 04 Nov 2026 15:18:46 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3B3D018002C0; Wed,  4 Nov 2026 20:18:44 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DE5B3187C36F; Wed,  4 Nov 2026 20:18:43 +0000 (UTC)
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
	s=mimecast20190719; t=1793823530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1r5cewGuHrpbpbmxHK1RLiqtliFySIlR2NRA4f1vA0=;
	b=iRg0dxrMWWwXXeEqaI+tn3TyYzG4rM+PRUc/WLVjfE9Sdr2EIw/1iYHlHF9A2HBr+UCUiE
	vex7Gi6Qxy6pLdQ8cqpEUsQo+v+8/g39nSW+yUPjcblvkYuHqwiZVH9rlZernrogPcbQA/
	430KpWqZYdz/Pu6GXNiNtz3onchGE/c=
X-MC-Unique: 9LKdvOF9PRmCp-mtU7SZQQ-1
X-Mimecast-MFC-AGG-ID: 9LKdvOF9PRmCp-mtU7SZQQ_1793823524
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 25/25] trace: remove 'trace_event_get_state' wrapper
Date: Wed,  4 Nov 2026 15:18:01 -0500
Message-ID: <20261104201802.11556-26-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: WJjpYbs1bWKRPkBsFxZI7k6CUs3B1R_OCHS0FbBH2Cg_1793823524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793823531-A96C29EA-440EB7E2/35/111497
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
index 0e7909efe8b..4f620c5492f 100644
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


