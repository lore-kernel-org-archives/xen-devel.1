Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADB6606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ABXeLW/3
Received: from list by lists.xenproject.org with outflank-mailman.1468585.1677701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHi-0008J3-1P; Mon, 02 Nov 2026 19:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468585.1677701; Mon, 02 Nov 2026 19:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHh-0008ID-QW; Mon, 02 Nov 2026 19:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1468585;
 Mon, 02 Nov 2026 19:01:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHg-000822-Uj
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHg-00Bp7W-BL
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:32 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8ddf8-8faa-0a2a0a5109dd-0a2a4503b136-46
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:32 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de06-fae8-0a2a45030019-aa0a857cdde7-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:27 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-FYOnKF7dNwWxwGciaH3gdA-1; Mon,
 02 Nov 2026 14:01:20 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 70EEF19560B1; Mon,  2 Nov 2026 19:01:18 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 243541800765; Mon,  2 Nov 2026 19:01:18 +0000 (UTC)
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
	s=mimecast20190719; t=1793646086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2fQy26Nzh4pevOCqiRqluICNBTrWSgxg/L8ugtFtns=;
	b=ABXeLW/3CNHTi9lV/IRFZVGQaYqoPnSXfdM4YTOuDXTlzdiibTz/ObE9YM1Dm4XViNTMyo
	EEy397jRdn5d4idPyqYo7maKoBpc2R9LldXXhPXKqjdHfeNgGA3xaA6ZzzQn/9qWM1LU9t
	5og5W7r7m+c5dB2oQFL43pUHlV+a5MY=
X-MC-Unique: FYOnKF7dNwWxwGciaH3gdA-1
X-Mimecast-MFC-AGG-ID: FYOnKF7dNwWxwGciaH3gdA_1793646078
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PULL 07/25] trace: remove obsolete references to vcpu property
Date: Mon,  2 Nov 2026 13:58:13 -0500
Message-ID: <20261102185831.1880189-8-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: uzrzJe2fISCg8lzu_gQGZreSfhv5_yg1dOXuYUxrhWA_1793646078
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793646087-76AF94E9-C4CBEED9/35/111497
X-purgate-type: clean
X-purgate-size: 4069
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The 'vcpu' property for trace events was removed 2 years ago
but some mentions of it remain in the code.

Fixes: 7ffc4894a63b ("trace: Remove deprecated 'vcpu' field from QMP trace events")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-8-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/control.h        | 12 ------------
 trace/event-internal.h | 11 -----------
 trace/control-target.c |  6 ------
 trace/control.c        |  6 ------
 4 files changed, 35 deletions(-)

diff --git a/trace/control.h b/trace/control.h
index 6754bfe052b..20033fb6669 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -139,8 +139,6 @@ static bool trace_event_get_state_static(TraceEvent *ev);
  * trace_event_get_state_dynamic:
  *
  * Get the dynamic tracing state of an event.
- *
- * If the event has the 'vcpu' property, gets the OR'ed state of all vCPUs.
  */
 static bool trace_event_get_state_dynamic(TraceEvent *ev);
 
@@ -149,8 +147,6 @@ static bool trace_event_get_state_dynamic(TraceEvent *ev);
  *
  * Set the dynamic tracing state of an event.
  *
- * If the event has the 'vcpu' property, sets the state on all vCPUs.
- *
  * Pre-condition: trace_event_get_state_static(ev) == true
  */
 void trace_event_set_state_dynamic(TraceEvent *ev, bool state);
@@ -203,14 +199,6 @@ extern QemuOptsList qemu_trace_opts;
  */
 void trace_opt_parse(const char *optstr);
 
-/**
- * trace_get_vcpu_event_count:
- *
- * Return the number of known vcpu-specific events
- */
-uint32_t trace_get_vcpu_event_count(void);
-
-
 #include "control-internal.h"
 
 #endif /* TRACE__CONTROL_H */
diff --git a/trace/event-internal.h b/trace/event-internal.h
index 1d57b0ff1b5..cc095a6ad54 100644
--- a/trace/event-internal.h
+++ b/trace/event-internal.h
@@ -10,12 +10,6 @@
 #ifndef TRACE__EVENT_INTERNAL_H
 #define TRACE__EVENT_INTERNAL_H
 
-/*
- * Special value for TraceEvent.vcpu_id field to indicate
- * that the event is not VCPU specific
- */
-#define TRACE_VCPU_EVENT_NONE ((uint32_t)-1)
-
 /**
  * TraceEvent:
  * @id: Unique event identifier.
@@ -23,11 +17,6 @@
  * @sstate: Static tracing state.
  * @dstate: Dynamic tracing state
  *
- * Interpretation of @dstate depends on whether the event has the 'vcpu'
- *  property:
- * - false: Boolean value indicating whether the event is active.
- * - true : Integral counting the number of vCPUs that have this event enabled.
- *
  * Opaque generic description of a tracing event.
  */
 typedef struct TraceEvent {
diff --git a/trace/control-target.c b/trace/control-target.c
index 24d9b7abbde..87b0f5037df 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -14,12 +14,6 @@ void trace_event_set_state_dynamic(TraceEvent *ev, bool state)
 {
     assert(trace_event_get_state_static(ev));
 
-    /*
-     * There is no longer a "vcpu" property, dstate can only be 1 or
-     * 0. With it, we haven't instantiated any vCPU yet, so we will
-     * set a global state instead, and trace_init_vcpu will reconcile
-     * it afterwards.
-     */
     bool state_pre = *ev->dstate;
     if (state_pre != state) {
         if (state) {
diff --git a/trace/control.c b/trace/control.c
index 49f0a4c5cda..6971157cbe7 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -37,7 +37,6 @@ typedef struct TraceEventGroup {
 static TraceEventGroup *event_groups;
 static size_t nevent_groups;
 static uint32_t next_id;
-static uint32_t next_vcpu_id;
 #ifdef CONFIG_TRACE_SIMPLE
 static bool init_trace_on_startup;
 #endif
@@ -304,8 +303,3 @@ void trace_opt_parse(const char *optstr)
     trace_opts_file = g_strdup(qemu_opt_get(opts, "file"));
     qemu_opts_del(opts);
 }
-
-uint32_t trace_get_vcpu_event_count(void)
-{
-    return next_vcpu_id;
-}
-- 
2.56.0


