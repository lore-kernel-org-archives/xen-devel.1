Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C6606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJOlc1mz
Received: from list by lists.xenproject.org with outflank-mailman.1468582.1677672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHe-0007c0-PU; Mon, 02 Nov 2026 19:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468582.1677672; Mon, 02 Nov 2026 19:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHe-0007bp-MJ; Mon, 02 Nov 2026 19:01:30 +0000
Received: by outflank-mailman (input) for mailman id 1468582;
 Mon, 02 Nov 2026 19:01:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHd-0007a1-QR
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHd-000KSU-7D
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:29 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de04-bab6-0a2a0a5309dd-0a2a4507a9a8-6
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:28 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de07-b4ea-0a2a45070019-aa0a857c9391-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:28 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-P0nOpbXnMIuwIVoBbPrD2A-1; Mon,
 02 Nov 2026 14:01:21 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BBBF41954B09; Mon,  2 Nov 2026 19:01:19 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 65A7730001A2; Mon,  2 Nov 2026 19:01:19 +0000 (UTC)
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
	s=mimecast20190719; t=1793646087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+Fb/pNuDVJKjUmAlJEVqK84jM77qkTAumiP1SiO8JU=;
	b=ZJOlc1mz+Vcp59a8UnpTVpecvvMVAUtDQb0QjDGpOi7xinOF9tQfPo/bUMYq8JmXtA7Yl4
	LFkOEDBYYsvEbOWObeWXqDamdBMtJ3HfSgbmdaYrYcOYeeww+mxMdftKk0r4zNR5RKyW16
	jWvCOF2P0w8cCTtH1S3aYeD61FNo5sk=
X-MC-Unique: P0nOpbXnMIuwIVoBbPrD2A-1
X-Mimecast-MFC-AGG-ID: P0nOpbXnMIuwIVoBbPrD2A_1793646080
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
Subject: [PULL 08/25] trace: drop 'id' from TraceEvent struct when not required
Date: Mon,  2 Nov 2026 13:58:14 -0500
Message-ID: <20261102185831.1880189-9-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: qdHuj8bmrHqy7ydog_5PyPqVfjWmjzRrcTIJLyMj0PA_1793646080
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793646088-A52CCAE4-FB94639D/35/111497
X-purgate-type: clean
X-purgate-size: 7751
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

Only "simpletrace" uses the "id" field from the TraceEvent struct.
Omit it when this backend is not enabled to save memory.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-9-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/control-internal.h      | 2 ++
 trace/control.h               | 3 ++-
 trace/event-internal.h        | 2 ++
 tests/tracetool/dtrace.c      | 4 ++++
 tests/tracetool/ftrace.c      | 4 ++++
 tests/tracetool/log.c         | 4 ++++
 tests/tracetool/simple.c      | 4 ++++
 tests/tracetool/syslog.c      | 4 ++++
 tests/tracetool/ust.c         | 4 ++++
 trace/control.c               | 4 +++-
 scripts/tracetool/format/c.py | 2 ++
 11 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/trace/control-internal.h b/trace/control-internal.h
index 8d818d359be..f626b047264 100644
--- a/trace/control-internal.h
+++ b/trace/control-internal.h
@@ -19,11 +19,13 @@ static inline bool trace_event_is_pattern(const char *str)
     return strchr(str, '*') != NULL;
 }
 
+#ifdef CONFIG_TRACE_SIMPLE
 static inline uint32_t trace_event_get_id(TraceEvent *ev)
 {
     assert(ev != NULL);
     return ev->id;
 }
+#endif
 
 static inline const char * trace_event_get_name(TraceEvent *ev)
 {
diff --git a/trace/control.h b/trace/control.h
index 20033fb6669..e77c07a8e68 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -81,13 +81,14 @@ TraceEvent *trace_event_name(const char *name);
  */
 static bool trace_event_is_pattern(const char *str);
 
-
+#ifdef CONFIG_TRACE_SIMPLE
 /**
  * trace_event_get_id:
  *
  * Get the identifier of an event.
  */
 static uint32_t trace_event_get_id(TraceEvent *ev);
+#endif
 
 /**
  * trace_event_get_name:
diff --git a/trace/event-internal.h b/trace/event-internal.h
index cc095a6ad54..ecf2caabd03 100644
--- a/trace/event-internal.h
+++ b/trace/event-internal.h
@@ -20,7 +20,9 @@
  * Opaque generic description of a tracing event.
  */
 typedef struct TraceEvent {
+#ifdef CONFIG_TRACE_SIMPLE
     uint32_t id;
+#endif
     const char * name;
     const bool sstate;
     uint16_t *dstate;
diff --git a/tests/tracetool/dtrace.c b/tests/tracetool/dtrace.c
index 9f862fa14d2..05a93918240 100644
--- a/tests/tracetool/dtrace.c
+++ b/tests/tracetool/dtrace.c
@@ -8,13 +8,17 @@
 uint16_t _TRACE_TEST_BLAH_DSTATE;
 uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_blah",
     .sstate = TRACE_TEST_BLAH_ENABLED,
     .dstate = &_TRACE_TEST_BLAH_DSTATE
 };
 TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_wibble",
     .sstate = TRACE_TEST_WIBBLE_ENABLED,
     .dstate = &_TRACE_TEST_WIBBLE_DSTATE
diff --git a/tests/tracetool/ftrace.c b/tests/tracetool/ftrace.c
index 9f862fa14d2..05a93918240 100644
--- a/tests/tracetool/ftrace.c
+++ b/tests/tracetool/ftrace.c
@@ -8,13 +8,17 @@
 uint16_t _TRACE_TEST_BLAH_DSTATE;
 uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_blah",
     .sstate = TRACE_TEST_BLAH_ENABLED,
     .dstate = &_TRACE_TEST_BLAH_DSTATE
 };
 TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_wibble",
     .sstate = TRACE_TEST_WIBBLE_ENABLED,
     .dstate = &_TRACE_TEST_WIBBLE_DSTATE
diff --git a/tests/tracetool/log.c b/tests/tracetool/log.c
index 9f862fa14d2..05a93918240 100644
--- a/tests/tracetool/log.c
+++ b/tests/tracetool/log.c
@@ -8,13 +8,17 @@
 uint16_t _TRACE_TEST_BLAH_DSTATE;
 uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_blah",
     .sstate = TRACE_TEST_BLAH_ENABLED,
     .dstate = &_TRACE_TEST_BLAH_DSTATE
 };
 TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_wibble",
     .sstate = TRACE_TEST_WIBBLE_ENABLED,
     .dstate = &_TRACE_TEST_WIBBLE_DSTATE
diff --git a/tests/tracetool/simple.c b/tests/tracetool/simple.c
index 0484177481c..490d6f379a5 100644
--- a/tests/tracetool/simple.c
+++ b/tests/tracetool/simple.c
@@ -8,13 +8,17 @@
 uint16_t _TRACE_TEST_BLAH_DSTATE;
 uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_blah",
     .sstate = TRACE_TEST_BLAH_ENABLED,
     .dstate = &_TRACE_TEST_BLAH_DSTATE
 };
 TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_wibble",
     .sstate = TRACE_TEST_WIBBLE_ENABLED,
     .dstate = &_TRACE_TEST_WIBBLE_DSTATE
diff --git a/tests/tracetool/syslog.c b/tests/tracetool/syslog.c
index 9f862fa14d2..05a93918240 100644
--- a/tests/tracetool/syslog.c
+++ b/tests/tracetool/syslog.c
@@ -8,13 +8,17 @@
 uint16_t _TRACE_TEST_BLAH_DSTATE;
 uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_blah",
     .sstate = TRACE_TEST_BLAH_ENABLED,
     .dstate = &_TRACE_TEST_BLAH_DSTATE
 };
 TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_wibble",
     .sstate = TRACE_TEST_WIBBLE_ENABLED,
     .dstate = &_TRACE_TEST_WIBBLE_DSTATE
diff --git a/tests/tracetool/ust.c b/tests/tracetool/ust.c
index 9f862fa14d2..05a93918240 100644
--- a/tests/tracetool/ust.c
+++ b/tests/tracetool/ust.c
@@ -8,13 +8,17 @@
 uint16_t _TRACE_TEST_BLAH_DSTATE;
 uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 TraceEvent _TRACE_TEST_BLAH_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_blah",
     .sstate = TRACE_TEST_BLAH_ENABLED,
     .dstate = &_TRACE_TEST_BLAH_DSTATE
 };
 TraceEvent _TRACE_TEST_WIBBLE_EVENT = {
+#ifdef CONFIG_TRACE_SIMPLE
     .id = 0,
+#endif
     .name = "test_wibble",
     .sstate = TRACE_TEST_WIBBLE_ENABLED,
     .dstate = &_TRACE_TEST_WIBBLE_DSTATE
diff --git a/trace/control.c b/trace/control.c
index 6971157cbe7..947b220056a 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -36,8 +36,8 @@ typedef struct TraceEventGroup {
 
 static TraceEventGroup *event_groups;
 static size_t nevent_groups;
-static uint32_t next_id;
 #ifdef CONFIG_TRACE_SIMPLE
+static uint32_t next_id;
 static bool init_trace_on_startup;
 #endif
 static char *trace_opts_file;
@@ -65,10 +65,12 @@ QemuOptsList qemu_trace_opts = {
 
 void trace_event_register_group(TraceEvent **events)
 {
+#ifdef CONFIG_TRACE_SIMPLE
     size_t i;
     for (i = 0; events[i] != NULL; i++) {
         events[i]->id = next_id++;
     }
+#endif
     event_groups = g_renew(TraceEventGroup, event_groups, nevent_groups + 1);
     event_groups[nevent_groups].events = events;
     nevent_groups++;
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index 50e03313cbf..abe738ac423 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -34,7 +34,9 @@ def generate(events, backend, group):
 
     for e in events:
         out('TraceEvent %(event)s = {',
+            '#ifdef CONFIG_TRACE_SIMPLE',
             '    .id = 0,',
+            '#endif',
             '    .name = \"%(name)s\",',
             '    .sstate = %(sstate)s,',
             '    .dstate = &%(dstate)s',
-- 
2.56.0


