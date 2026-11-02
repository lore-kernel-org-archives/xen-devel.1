Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C947606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dP2bgzQm
Received: from list by lists.xenproject.org with outflank-mailman.1468586.1677710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHj-00006x-Eg; Mon, 02 Nov 2026 19:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468586.1677710; Mon, 02 Nov 2026 19:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHj-00006E-6A; Mon, 02 Nov 2026 19:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1468586;
 Mon, 02 Nov 2026 19:01:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHh-000860-3B
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHg-000wMH-Fz
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:32 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de01-2eae-0a2a0a5409dd-0a2a4501dc2a-8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:32 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de09-5984-0a2a45010019-aa0a817cb50f-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:30 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-bDpS0_1SNbuIVeQYkiMFXQ-1; Mon,
 02 Nov 2026 14:01:25 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4FBC3180134F; Mon,  2 Nov 2026 19:01:24 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EC01B1800444; Mon,  2 Nov 2026 19:01:23 +0000 (UTC)
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
	s=mimecast20190719; t=1793646089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNaYu08RePiA3/TOJj7oi5LlAFNAX4bokf8QMENnVcY=;
	b=dP2bgzQmj8iF9VsTpqt6XFPtKrLCmtv3UafsXMrNaQ416UGl4fEMMvN5Op/8NWmWNE7Sf/
	IPeeKcGGiyaWvDCgAhaBZAFwk9Zw/OoYtkMfE/M/AMCJTLe8o0/OlnOpT8KRdC4Zwk+vTk
	JSByF3JVVRzBBLcGS17qgrDjbqx070s=
X-MC-Unique: bDpS0_1SNbuIVeQYkiMFXQ-1
X-Mimecast-MFC-AGG-ID: bDpS0_1SNbuIVeQYkiMFXQ_1793646084
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
Subject: [PULL 11/25] trace: don't emit TraceEvent structs when 'nop' backend is used
Date: Mon,  2 Nov 2026 13:58:17 -0500
Message-ID: <20261102185831.1880189-12-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: KZSBWA2C3_g40TxhN05B77iyNLrKQ1dnRUFpjnQUzv4_1793646084
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793646090-BD67C757-4A1E55FD/35/111497
X-purgate-type: clean
X-purgate-size: 6154
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The 'nop' backend is a short-hand for no trace probe usage
at all. The emitted functions become a no-op, and as such
there is no need to emit the TraceEvent structs, nor the
DSTATE variables they reference.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-12-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/tracetool/nop.h         |  6 +--
 tests/tracetool/nop.c         | 29 ---------------
 scripts/tracetool/format/c.py | 69 ++++++++++++++++++-----------------
 scripts/tracetool/format/h.py | 14 ++++---
 4 files changed, 46 insertions(+), 72 deletions(-)

diff --git a/tests/tracetool/nop.h b/tests/tracetool/nop.h
index 443f5e0cf6e..64b6b005684 100644
--- a/tests/tracetool/nop.h
+++ b/tests/tracetool/nop.h
@@ -6,10 +6,8 @@
 
 #include "trace/control.h"
 
-extern TraceEvent _TRACE_TEST_BLAH_EVENT;
-extern TraceEvent _TRACE_TEST_WIBBLE_EVENT;
-extern uint8_t _TRACE_TEST_BLAH_DSTATE;
-extern uint8_t _TRACE_TEST_WIBBLE_DSTATE;
+#define _TRACE_TEST_BLAH_DSTATE 0
+#define _TRACE_TEST_WIBBLE_DSTATE 0
 #define TRACE_TEST_BLAH_ENABLED 1
 #define TRACE_TEST_WIBBLE_ENABLED 1
 
diff --git a/tests/tracetool/nop.c b/tests/tracetool/nop.c
index f83d06252ea..d34cc0ca742 100644
--- a/tests/tracetool/nop.c
+++ b/tests/tracetool/nop.c
@@ -5,32 +5,3 @@
 #include "qemu/module.h"
 #include "trace-testsuite.h"
 
-uint8_t _TRACE_TEST_BLAH_DSTATE;
-uint8_t _TRACE_TEST_WIBBLE_DSTATE;
-TraceEvent _TRACE_TEST_BLAH_EVENT = {
-#ifdef CONFIG_TRACE_SIMPLE
-    .id = 0,
-#endif
-    .name = "test_blah",
-    .sstate = TRACE_TEST_BLAH_ENABLED,
-    .dstate = &_TRACE_TEST_BLAH_DSTATE
-};
-TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
-#ifdef CONFIG_TRACE_SIMPLE
-    .id = 0,
-#endif
-    .name = "test_wibble",
-    .sstate = TRACE_TEST_WIBBLE_ENABLED,
-    .dstate = &_TRACE_TEST_WIBBLE_DSTATE
-};
-TraceEvent *testsuite_trace_events[] = {
-    &_TRACE_TEST_BLAH_EVENT,
-    &_TRACE_TEST_WIBBLE_EVENT,
-  NULL,
-};
-
-static void trace_testsuite_register_events(void)
-{
-    trace_event_register_group(testsuite_trace_events);
-}
-trace_init(trace_testsuite_register_events)
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index de1c154a881..5f6669c917c 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -29,41 +29,42 @@ def generate(events, backend, group):
         '#include "%s"' % header,
         '')
 
-    for e in events:
-        out('uint8_t %s;' % e.api(e.QEMU_DSTATE))
+    if len(list(backend.backend_modules())):
+        for e in events:
+            out('uint8_t %s;' % e.api(e.QEMU_DSTATE))
 
-    for e in events:
-        out('TraceEvent %(event)s = {',
-            '#ifdef CONFIG_TRACE_SIMPLE',
-            '    .id = 0,',
-            '#endif',
-            '    .name = \"%(name)s\",',
-            '    .sstate = %(sstate)s,',
-            '    .dstate = &%(dstate)s',
+        for e in events:
+            out('TraceEvent %(event)s = {',
+                '#ifdef CONFIG_TRACE_SIMPLE',
+                '    .id = 0,',
+                '#endif',
+                '    .name = \"%(name)s\",',
+                '    .sstate = %(sstate)s,',
+                '    .dstate = &%(dstate)s',
+                '};',
+                event = e.api(e.QEMU_EVENT),
+                name = e.name,
+                sstate = "TRACE_%s_ENABLED" % e.name.upper(),
+                dstate = e.api(e.QEMU_DSTATE))
+
+        out('TraceEvent *%(group)s_trace_events[] = {',
+            group = group.lower())
+
+        for e in events:
+            out('    &%(event)s,', event = e.api(e.QEMU_EVENT))
+
+        out('  NULL,',
             '};',
-            event = e.api(e.QEMU_EVENT),
-            name = e.name,
-            sstate = "TRACE_%s_ENABLED" % e.name.upper(),
-            dstate = e.api(e.QEMU_DSTATE))
+            '')
 
-    out('TraceEvent *%(group)s_trace_events[] = {',
-        group = group.lower())
+        out('static void trace_%(group)s_register_events(void)',
+            '{',
+            '    trace_event_register_group(%(group)s_trace_events);',
+            '}',
+            'trace_init(trace_%(group)s_register_events)',
+            group = group.lower())
 
-    for e in events:
-        out('    &%(event)s,', event = e.api(e.QEMU_EVENT))
-
-    out('  NULL,',
-        '};',
-        '')
-
-    out('static void trace_%(group)s_register_events(void)',
-        '{',
-        '    trace_event_register_group(%(group)s_trace_events);',
-        '}',
-        'trace_init(trace_%(group)s_register_events)',
-        group = group.lower())
-
-    backend.generate_begin(active_events, group)
-    for event in active_events:
-        backend.generate(event, group)
-    backend.generate_end(active_events, group)
+        backend.generate_begin(active_events, group)
+        for event in active_events:
+            backend.generate(event, group)
+        backend.generate_end(active_events, group)
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index 4dc1ad7eb15..6ffb7256e31 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -27,12 +27,16 @@ def generate(events, backend, group):
         '#include "%s"' % header,
         '')
 
-    for e in events:
-        out('extern TraceEvent %(event)s;',
-            event = e.api(e.QEMU_EVENT))
+    if len(list(backend.backend_modules())):
+        for e in events:
+            out('extern TraceEvent %(event)s;',
+                event = e.api(e.QEMU_EVENT))
 
-    for e in events:
-        out('extern uint8_t %s;' % e.api(e.QEMU_DSTATE))
+        for e in events:
+            out('extern uint8_t %s;' % e.api(e.QEMU_DSTATE))
+    else:
+        for e in events:
+            out('#define %s 0' % e.api(e.QEMU_DSTATE))
 
     # static state
     for e in events:
-- 
2.56.0


