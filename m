Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227096071AD5
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ej7nom9d
Received: from list by lists.xenproject.org with outflank-mailman.1472522.1680408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRG-0008VZ-HT; Wed, 04 Nov 2026 20:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472522.1680408; Wed, 04 Nov 2026 20:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRG-0008UX-5Q; Wed, 04 Nov 2026 20:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1472522;
 Wed, 04 Nov 2026 20:18:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRE-0008L4-5l
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRD-007PCO-J9
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:27 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9312-e002-0a2a0a5209dd-0a2a450997ac-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:27 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9312-be1a-0a2a45090019-aa0a817c5105-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:27 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-O9dhJazzNeeykFcfvJtPlA-1; Wed,
 04 Nov 2026 15:18:22 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5A91219560B2; Wed,  4 Nov 2026 20:18:20 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CE1A4195604C; Wed,  4 Nov 2026 20:18:19 +0000 (UTC)
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
	s=mimecast20190719; t=1793823505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DFGAhqQ+xaxqaeHjSPXfZYHtf1rW7LNoujQ+nr96Ekg=;
	b=Ej7nom9dH3aY91VeyU5MoAyi3xVXbXxXsAqTkX5nB7BTU/93H6bgGjx1Xmns9/pQoTeisc
	zuuRA+SMtFB6UZBFUSnxpxQl+NAYiO/IeHQi+b4w7leppCP/eoyCAgdhxAqaBVclwcFjpN
	bD1o2sfMFR1JOCcOOrfBhhM1023B5Sc=
X-MC-Unique: O9dhJazzNeeykFcfvJtPlA-1
X-Mimecast-MFC-AGG-ID: O9dhJazzNeeykFcfvJtPlA_1793823500
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
Subject: [PULL v2 09/25] trace: change "DSTATE" variables from uint16_t to uint8_t
Date: Wed,  4 Nov 2026 15:17:45 -0500
Message-ID: <20261104201802.11556-10-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: SCr4T_OPOhU8n5gGfgOSrSBulP9CaKOsVpXUByFZNQ4_1793823500
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793823507-3B6D2034-A49F11F8/35/111497
X-purgate-type: clean
X-purgate-size: 13802
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

Previously these variables had two distinct semantics. For
most probes DSTATE was treated as a simple boolean, while
for vcpu probes it was treated as a bitmask of vCPU indexes.

With vcpu probes removed, it is now exclusively a boolean
and thus using uint16_t is a waste of memory.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-10-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/tracetool/dtrace.h       | 4 ++--
 tests/tracetool/ftrace.h       | 4 ++--
 tests/tracetool/log.h          | 4 ++--
 tests/tracetool/simple.h       | 4 ++--
 tests/tracetool/syslog.h       | 4 ++--
 tests/tracetool/ust.h          | 4 ++--
 trace/event-internal.h         | 2 +-
 tests/tracetool/dtrace.c       | 4 ++--
 tests/tracetool/ftrace.c       | 4 ++--
 tests/tracetool/log.c          | 4 ++--
 tests/tracetool/simple.c       | 4 ++--
 tests/tracetool/syslog.c       | 4 ++--
 tests/tracetool/ust.c          | 4 ++--
 scripts/tracetool/format/c.py  | 2 +-
 scripts/tracetool/format/h.py  | 2 +-
 scripts/tracetool/format/rs.py | 4 ++--
 tests/tracetool/dtrace.rs      | 6 +++---
 tests/tracetool/ftrace.rs      | 6 +++---
 tests/tracetool/log.rs         | 6 +++---
 tests/tracetool/simple.rs      | 6 +++---
 tests/tracetool/syslog.rs      | 6 +++---
 21 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/tests/tracetool/dtrace.h b/tests/tracetool/dtrace.h
index c8931a8d7b3..0b5b47089e8 100644
--- a/tests/tracetool/dtrace.h
+++ b/tests/tracetool/dtrace.h
@@ -8,8 +8,8 @@
 
 extern TraceEvent _TRACE_TEST_BLAH_EVENT;
 extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint16_t _TRACE_TEST_BLAH_DSTATE;
-extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+extern uint8_t _TRACE_TEST_BLAH_DSTATE;
+extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 #ifndef SDT_USE_VARIADIC
diff --git a/tests/tracetool/ftrace.h b/tests/tracetool/ftrace.h
index 1dfe4239413..b34eef17d10 100644
--- a/tests/tracetool/ftrace.h
+++ b/tests/tracetool/ftrace.h
@@ -8,8 +8,8 @@
 
 extern TraceEvent _TRACE_TEST_BLAH_EVENT;
 extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint16_t _TRACE_TEST_BLAH_DSTATE;
-extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+extern uint8_t _TRACE_TEST_BLAH_DSTATE;
+extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 #include "trace/ftrace.h"
diff --git a/tests/tracetool/log.h b/tests/tracetool/log.h
index c7795871f85..ff510d54908 100644
--- a/tests/tracetool/log.h
+++ b/tests/tracetool/log.h
@@ -8,8 +8,8 @@
 
 extern TraceEvent _TRACE_TEST_BLAH_EVENT;
 extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint16_t _TRACE_TEST_BLAH_DSTATE;
-extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+extern uint8_t _TRACE_TEST_BLAH_DSTATE;
+extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 #include "qemu/log-for-trace.h"
diff --git a/tests/tracetool/simple.h b/tests/tracetool/simple.h
index ec6fcb22c3c..735cb21d911 100644
--- a/tests/tracetool/simple.h
+++ b/tests/tracetool/simple.h
@@ -8,8 +8,8 @@
 
 extern TraceEvent _TRACE_TEST_BLAH_EVENT;
 extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint16_t _TRACE_TEST_BLAH_DSTATE;
-extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+extern uint8_t _TRACE_TEST_BLAH_DSTATE;
+extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 void _simple_trace_test_blah(void *context, const char *filename);
diff --git a/tests/tracetool/syslog.h b/tests/tracetool/syslog.h
index ed4305554c1..4203b8b37dc 100644
--- a/tests/tracetool/syslog.h
+++ b/tests/tracetool/syslog.h
@@ -8,8 +8,8 @@
 
 extern TraceEvent _TRACE_TEST_BLAH_EVENT;
 extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint16_t _TRACE_TEST_BLAH_DSTATE;
-extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+extern uint8_t _TRACE_TEST_BLAH_DSTATE;
+extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 #include <syslog.h>
diff --git a/tests/tracetool/ust.h b/tests/tracetool/ust.h
index b7acd0c39b1..079b2c74491 100644
--- a/tests/tracetool/ust.h
+++ b/tests/tracetool/ust.h
@@ -8,8 +8,8 @@
 
 extern TraceEvent _TRACE_TEST_BLAH_EVENT;
 extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint16_t _TRACE_TEST_BLAH_DSTATE;
-extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+extern uint8_t _TRACE_TEST_BLAH_DSTATE;
+extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 #include <lttng/tracepoint.h>
diff --git a/trace/event-internal.h b/trace/event-internal.h
index ecf2caabd03..ad1578aa2c5 100644
--- a/trace/event-internal.h
+++ b/trace/event-internal.h
@@ -25,7 +25,7 @@ typedef struct TraceEvent {
 #endif
     const char * name;
     const bool sstate;
-    uint16_t *dstate;
+    uint8_t *dstate;
 } TraceEvent;
 
 #endif /* TRACE__EVENT_INTERNAL_H */
diff --git a/tests/tracetool/dtrace.c b/tests/tracetool/dtrace.c
index 05a93918240..f83d06252ea 100644
--- a/tests/tracetool/dtrace.c
+++ b/tests/tracetool/dtrace.c
@@ -5,8 +5,8 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint16_t _TRACE_TEST_BLAH_DSTATE;
-uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+uint8_t _TRACE_TEST_BLAH_DSTATE;
+uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
 #ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
diff --git a/tests/tracetool/ftrace.c b/tests/tracetool/ftrace.c
index 05a93918240..f83d06252ea 100644
--- a/tests/tracetool/ftrace.c
+++ b/tests/tracetool/ftrace.c
@@ -5,8 +5,8 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint16_t _TRACE_TEST_BLAH_DSTATE;
-uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+uint8_t _TRACE_TEST_BLAH_DSTATE;
+uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
 #ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
diff --git a/tests/tracetool/log.c b/tests/tracetool/log.c
index 05a93918240..f83d06252ea 100644
--- a/tests/tracetool/log.c
+++ b/tests/tracetool/log.c
@@ -5,8 +5,8 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint16_t _TRACE_TEST_BLAH_DSTATE;
-uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+uint8_t _TRACE_TEST_BLAH_DSTATE;
+uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
 #ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
diff --git a/tests/tracetool/simple.c b/tests/tracetool/simple.c
index 490d6f379a5..820ddb575b0 100644
--- a/tests/tracetool/simple.c
+++ b/tests/tracetool/simple.c
@@ -5,8 +5,8 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint16_t _TRACE_TEST_BLAH_DSTATE;
-uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+uint8_t _TRACE_TEST_BLAH_DSTATE;
+uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
 #ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
diff --git a/tests/tracetool/syslog.c b/tests/tracetool/syslog.c
index 05a93918240..f83d06252ea 100644
--- a/tests/tracetool/syslog.c
+++ b/tests/tracetool/syslog.c
@@ -5,8 +5,8 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint16_t _TRACE_TEST_BLAH_DSTATE;
-uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+uint8_t _TRACE_TEST_BLAH_DSTATE;
+uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
 #ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
diff --git a/tests/tracetool/ust.c b/tests/tracetool/ust.c
index 05a93918240..f83d06252ea 100644
--- a/tests/tracetool/ust.c
+++ b/tests/tracetool/ust.c
@@ -5,8 +5,8 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint16_t _TRACE_TEST_BLAH_DSTATE;
-uint16_t _TRACE_TEST_WIBBLE_DSTATE;
+uint8_t _TRACE_TEST_BLAH_DSTATE;
+uint8_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
 #ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index abe738ac423..de1c154a881 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -30,7 +30,7 @@ def generate(events, backend, group):
         '')
 
     for e in events:
-        out('uint16_t %s;' % e.api(e.QEMU_DSTATE))
+        out('uint8_t %s;' % e.api(e.QEMU_DSTATE))
 
     for e in events:
         out('TraceEvent %(event)s = {',
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index dd58713a158..4dc1ad7eb15 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -32,7 +32,7 @@ def generate(events, backend, group):
             event = e.api(e.QEMU_EVENT))
 
     for e in events:
-        out('extern uint16_t %s;' % e.api(e.QEMU_DSTATE))
+        out('extern uint8_t %s;' % e.api(e.QEMU_DSTATE))
 
     # static state
     for e in events:
diff --git a/scripts/tracetool/format/rs.py b/scripts/tracetool/format/rs.py
index 7d9af7edfee..1fddcee1ad2 100644
--- a/scripts/tracetool/format/rs.py
+++ b/scripts/tracetool/format/rs.py
@@ -26,7 +26,7 @@ def generate(events, backend, group):
         '',
         '#[allow(dead_code)]',
         '#[inline(always)]',
-        'fn trace_event_state_is_enabled(dstate: u16) -> bool {',
+        'fn trace_event_state_is_enabled(dstate: u8) -> bool {',
         '    (unsafe { trace_events_enabled_count }) != 0 && dstate != 0',
         '}',
         '',
@@ -39,7 +39,7 @@ def generate(events, backend, group):
 
     for e in events:
         out('    #[allow(dead_code)]',
-            '    static mut %s: u16;' % e.api(e.QEMU_DSTATE))
+            '    static mut %s: u8;' % e.api(e.QEMU_DSTATE))
     out('}',
         '')
 
diff --git a/tests/tracetool/dtrace.rs b/tests/tracetool/dtrace.rs
index 3490fcb271a..07398f4731b 100644
--- a/tests/tracetool/dtrace.rs
+++ b/tests/tracetool/dtrace.rs
@@ -8,7 +8,7 @@
 
 #[allow(dead_code)]
 #[inline(always)]
-fn trace_event_state_is_enabled(dstate: u16) -> bool {
+fn trace_event_state_is_enabled(dstate: u8) -> bool {
     (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
 }
 
@@ -18,9 +18,9 @@ fn trace_event_state_is_enabled(dstate: u16) -> bool {
 }
 extern "C" {
     #[allow(dead_code)]
-    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_BLAH_DSTATE: u8;
     #[allow(dead_code)]
-    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u8;
 }
 
 use std::cell::UnsafeCell;
diff --git a/tests/tracetool/ftrace.rs b/tests/tracetool/ftrace.rs
index 34f66004902..ff0bcde4b8b 100644
--- a/tests/tracetool/ftrace.rs
+++ b/tests/tracetool/ftrace.rs
@@ -8,7 +8,7 @@
 
 #[allow(dead_code)]
 #[inline(always)]
-fn trace_event_state_is_enabled(dstate: u16) -> bool {
+fn trace_event_state_is_enabled(dstate: u8) -> bool {
     (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
 }
 
@@ -18,9 +18,9 @@ fn trace_event_state_is_enabled(dstate: u16) -> bool {
 }
 extern "C" {
     #[allow(dead_code)]
-    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_BLAH_DSTATE: u8;
     #[allow(dead_code)]
-    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u8;
 }
 
 #[inline(always)]
diff --git a/tests/tracetool/log.rs b/tests/tracetool/log.rs
index 770758611d1..0f052bb2c9c 100644
--- a/tests/tracetool/log.rs
+++ b/tests/tracetool/log.rs
@@ -8,7 +8,7 @@
 
 #[allow(dead_code)]
 #[inline(always)]
-fn trace_event_state_is_enabled(dstate: u16) -> bool {
+fn trace_event_state_is_enabled(dstate: u8) -> bool {
     (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
 }
 
@@ -18,9 +18,9 @@ fn trace_event_state_is_enabled(dstate: u16) -> bool {
 }
 extern "C" {
     #[allow(dead_code)]
-    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_BLAH_DSTATE: u8;
     #[allow(dead_code)]
-    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u8;
 }
 
 #[inline(always)]
diff --git a/tests/tracetool/simple.rs b/tests/tracetool/simple.rs
index 92f896ef178..976feddde5b 100644
--- a/tests/tracetool/simple.rs
+++ b/tests/tracetool/simple.rs
@@ -8,7 +8,7 @@
 
 #[allow(dead_code)]
 #[inline(always)]
-fn trace_event_state_is_enabled(dstate: u16) -> bool {
+fn trace_event_state_is_enabled(dstate: u8) -> bool {
     (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
 }
 
@@ -18,9 +18,9 @@ fn trace_event_state_is_enabled(dstate: u16) -> bool {
 }
 extern "C" {
     #[allow(dead_code)]
-    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_BLAH_DSTATE: u8;
     #[allow(dead_code)]
-    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u8;
 }
 
 #[inline(always)]
diff --git a/tests/tracetool/syslog.rs b/tests/tracetool/syslog.rs
index 378d03d34b2..9688dac84a5 100644
--- a/tests/tracetool/syslog.rs
+++ b/tests/tracetool/syslog.rs
@@ -8,7 +8,7 @@
 
 #[allow(dead_code)]
 #[inline(always)]
-fn trace_event_state_is_enabled(dstate: u16) -> bool {
+fn trace_event_state_is_enabled(dstate: u8) -> bool {
     (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
 }
 
@@ -18,9 +18,9 @@ fn trace_event_state_is_enabled(dstate: u16) -> bool {
 }
 extern "C" {
     #[allow(dead_code)]
-    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_BLAH_DSTATE: u8;
     #[allow(dead_code)]
-    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u8;
 }
 
 #[inline(always)]
-- 
2.56.0


