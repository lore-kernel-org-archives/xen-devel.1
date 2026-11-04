Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE427606A330
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IGh9+RKs
Received: from list by lists.xenproject.org with outflank-mailman.1472537.1680462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRQ-00020g-I8; Wed, 04 Nov 2026 20:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472537.1680462; Wed, 04 Nov 2026 20:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRQ-0001wl-0j; Wed, 04 Nov 2026 20:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1472537;
 Wed, 04 Nov 2026 20:18:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRN-0001XZ-H3
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRM-007PCO-TH
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:36 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9312-e002-0a2a0a5209dd-0a2a450997ac-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:36 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb931b-be1a-0a2a45090019-aa0a857cb83f-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:36 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-XnmutKvYO4KxXFQRP6T0vA-1; Wed,
 04 Nov 2026 15:18:33 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5AABD1800610; Wed,  4 Nov 2026 20:18:31 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 106D51848D44; Wed,  4 Nov 2026 20:18:30 +0000 (UTC)
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
	s=mimecast20190719; t=1793823515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3nROunoF4CikVbyQLt/Mk8W5QtQdfAuIa85rpQ5scA=;
	b=IGh9+RKsTS8OSbM+Z+pC0cTU9uieecyvFxYbpqC9ZSMffRT66A3nxQmD6YYLjWBT7xpMH4
	VkyhbDF26Vpc+ImGYBkKtoTx6NYsGIgVjTyDZ9/3rHecsnsDR1QwrraY1Jv+32+utjwZQZ
	r77749YXZOijuzz4088StE6MQdgG2to=
X-MC-Unique: XnmutKvYO4KxXFQRP6T0vA-1
X-Mimecast-MFC-AGG-ID: XnmutKvYO4KxXFQRP6T0vA_1793823511
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
Subject: [PULL v2 16/25] trace: eliminate dupe trace_event_get_state_dynamic_by_id() calls
Date: Wed,  4 Nov 2026 15:17:52 -0500
Message-ID: <20261104201802.11556-17-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 62vJSNOYvI7lj5YEErOwgtr9Nj-3kvWLUo0xtxBA5jM_1793823511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793823516-3A0C5034-5C1A1BD6/35/111497
X-purgate-type: clean
X-purgate-size: 8670
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

Each backend generates the same trace_event_get_state_dynamic_by_id()
call for the TRACE....DSTATE() macro body, so when multiple backends
are enabled, the same check is repeated:

 #define TRACE_TEST_WIBBLE_BACKEND_DSTATE() ( \
     QEMU_TEST_WIBBLE_ENABLED() || \
     trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
     trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
     trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
     trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
     tracepoint_enabled(qemu, test_wibble) || \
     false)

Expanding the use of the 'backend.check_trace_event_get_state'
attr in the C header generator removes the duplication, in the
same way that the Rust generator already does.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-17-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/tracetool/all.h                 | 22 ++++++++--------------
 scripts/tracetool/backend/__init__.py |  4 ++--
 scripts/tracetool/backend/ftrace.py   |  4 ----
 scripts/tracetool/backend/log.py      |  4 ----
 scripts/tracetool/backend/simple.py   |  5 -----
 scripts/tracetool/backend/syslog.py   |  4 ----
 scripts/tracetool/format/h.py         |  8 +++++++-
 7 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/tests/tracetool/all.h b/tests/tracetool/all.h
index 41fa4d0e8a2..5627c1d8930 100644
--- a/tests/tracetool/all.h
+++ b/tests/tracetool/all.h
@@ -44,11 +44,8 @@ void _simple_trace_test_wibble(void *context, int value);
 
 #define TRACE_TEST_BLAH_BACKEND_DSTATE() ( \
     QEMU_TEST_BLAH_ENABLED() || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) || \
     tracepoint_enabled(qemu, test_blah) || \
+    trace_event_get_state_dynamic_by_id(TRACE_TEST_BLAH) || \
     false)
 
 static inline void trace_test_blah(void *context, const char *filename)
@@ -58,26 +55,23 @@ static inline void trace_test_blah(void *context, const char *filename)
     if (trace_event_get_state(TRACE_TEST_BLAH)) {
 #line 4 "trace-events"
         ftrace_write("test_blah " "Blah context=%p filename=%s" "\n" , context, filename);
-#line 62 "all.h"
+#line 59 "all.h"
         if (qemu_loglevel_mask(LOG_TRACE)) {
 #line 4 "trace-events"
             qemu_log("test_blah " "Blah context=%p filename=%s" "\n", context, filename);
-#line 66 "all.h"
+#line 63 "all.h"
         }
         _simple_trace_test_blah(context, filename);
 #line 4 "trace-events"
         syslog(LOG_INFO, "test_blah " "Blah context=%p filename=%s" , context, filename);
-#line 71 "all.h"
+#line 68 "all.h"
     }
 }
 
 #define TRACE_TEST_WIBBLE_BACKEND_DSTATE() ( \
     QEMU_TEST_WIBBLE_ENABLED() || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
-    trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
     tracepoint_enabled(qemu, test_wibble) || \
+    trace_event_get_state_dynamic_by_id(TRACE_TEST_WIBBLE) || \
     false)
 
 static inline void trace_test_wibble(void *context, int value)
@@ -87,16 +81,16 @@ static inline void trace_test_wibble(void *context, int value)
     if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
 #line 5 "trace-events"
         ftrace_write("test_wibble " "Wibble context=%p value=%d" "\n" , context, value);
-#line 91 "all.h"
+#line 85 "all.h"
         if (qemu_loglevel_mask(LOG_TRACE)) {
 #line 5 "trace-events"
             qemu_log("test_wibble " "Wibble context=%p value=%d" "\n", context, value);
-#line 95 "all.h"
+#line 89 "all.h"
         }
         _simple_trace_test_wibble(context, value);
 #line 5 "trace-events"
         syslog(LOG_INFO, "test_wibble " "Wibble context=%p value=%d" , context, value);
-#line 100 "all.h"
+#line 94 "all.h"
     }
 }
 #endif /* TRACE_TESTSUITE_GENERATED_TRACERS_H */
diff --git a/scripts/tracetool/backend/__init__.py b/scripts/tracetool/backend/__init__.py
index 9109a783c72..72f549c77c4 100644
--- a/scripts/tracetool/backend/__init__.py
+++ b/scripts/tracetool/backend/__init__.py
@@ -133,8 +133,8 @@ def generate_begin(self, events, group):
     def generate(self, event, group, check_trace_event_get_state=None):
         self._run_function("generate_%s", event, group, check_trace_event_get_state=check_trace_event_get_state)
 
-    def generate_backend_dstate(self, event, group):
-        self._run_function("generate_%s_backend_dstate", event, group)
+    def generate_backend_dstate(self, event, group, check_trace_event_get_state=None):
+        self._run_function("generate_%s_backend_dstate", event, group, check_trace_event_get_state=check_trace_event_get_state)
 
     def generate_end(self, events, group):
         self._run_function("generate_%s_end", events, group)
diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index e304ef21999..94cffc45a9d 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -40,10 +40,6 @@ def generate_h(event, group):
         argnames=argnames)
 
 
-def generate_h_backend_dstate(event, group):
-    out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
-        event_id="TRACE_" + event.name.upper())
-
 def generate_rs(event, group):
     out('        let format_string = c"%(fmt)s\\n";',
         '        unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, %(args)s);}',
diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 9e3e5046f5f..577ee158584 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -41,10 +41,6 @@ def generate_h(event, group):
         argnames=argnames)
 
 
-def generate_h_backend_dstate(event, group):
-    out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
-        event_id="TRACE_" + event.name.upper())
-
 def generate_rs(event, group):
     out('        let format_string = c"%(fmt)s\\n";',
         '        if (unsafe { bindings::qemu_loglevel } & bindings::LOG_TRACE) != 0 {',
diff --git a/scripts/tracetool/backend/simple.py b/scripts/tracetool/backend/simple.py
index e22683c7d2a..15f27e26bd5 100644
--- a/scripts/tracetool/backend/simple.py
+++ b/scripts/tracetool/backend/simple.py
@@ -42,11 +42,6 @@ def generate_h(event, group):
         args=", ".join(event.args.names()))
 
 
-def generate_h_backend_dstate(event, group):
-    out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
-        event_id="TRACE_" + event.name.upper())
-
-
 def generate_c_begin(events, group):
     out('#include "trace/simple.h"',
         '')
diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
index 746efd35fb9..ba269cb6a33 100644
--- a/scripts/tracetool/backend/syslog.py
+++ b/scripts/tracetool/backend/syslog.py
@@ -43,7 +43,3 @@ def generate_rs(event, group):
         '        unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, %(args)s);}',
         fmt=expand_format_string(event.fmt, event.name + " "),
         args=event.args.rust_call_varargs())
-
-def generate_h_backend_dstate(event, group):
-    out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
-        event_id="TRACE_" + event.name.upper())
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index 6ffb7256e31..5ad3a419f82 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -55,7 +55,13 @@ def generate(events, backend, group):
             api=e.api(e.QEMU_BACKEND_DSTATE))
 
         if "disable" not in e.properties:
-            backend.generate_backend_dstate(e, group)
+            backend.generate_backend_dstate(e, group, check_trace_event_get_state=False)
+
+            if backend.check_trace_event_get_state:
+                event_id = 'TRACE_' + e.name.upper()
+                out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
+                    event_id=event_id)
+                backend.generate_backend_dstate(e, group, check_trace_event_get_state=True)
 
         out('    false)')
 
-- 
2.56.0


