Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9B6070F28
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRENEx/2
Received: from list by lists.xenproject.org with outflank-mailman.1472521.1680401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRF-0008RE-Ux; Wed, 04 Nov 2026 20:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472521.1680401; Wed, 04 Nov 2026 20:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRF-0008Pz-Nq; Wed, 04 Nov 2026 20:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1472521;
 Wed, 04 Nov 2026 20:18:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRD-0008Is-QG
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRD-00BuCu-7K
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:27 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9305-2eae-0a2a0a5409dd-0a2a450acd02-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:27 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9311-f2d2-0a2a450a0019-aa0a817cddd5-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:27 +0100
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-h-2ICopVPpm5iXv0ERIT1A-1; Wed,
 04 Nov 2026 15:18:20 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BC28818003FD; Wed,  4 Nov 2026 20:18:18 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 66A0F26C; Wed,  4 Nov 2026 20:18:18 +0000 (UTC)
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
	bh=1+Fb/pNuDVJKjUmAlJEVqK84jM77qkTAumiP1SiO8JU=;
	b=DRENEx/2pmI70rkqwflSY87z7ZvWlmReXZeIhEAcaHaK1IRWMDIa+a7b3DazBlirDRS/uw
	dDp7mXhFG+hosjeg/cKrCy1DhjLCS3zllHKp1ZjJ6ATVoLL42cCK6sKY3gjfFwE/sJ2062
	gEF/RsYLZCgAqkB3b6nyrEtO15FCOaM=
X-MC-Unique: h-2ICopVPpm5iXv0ERIT1A-1
X-Mimecast-MFC-AGG-ID: h-2ICopVPpm5iXv0ERIT1A_1793823499
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
Subject: [PULL v2 08/25] trace: drop 'id' from TraceEvent struct when not required
Date: Wed,  4 Nov 2026 15:17:44 -0500
Message-ID: <20261104201802.11556-9-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: _Mj7Yljal7Dx5mIS5YZoK_ldI0DY9LqjqSZqNvq2NUw_1793823499
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793823507-595C3CFC-FC3E2BE1/35/111497
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


