Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32C6071A2E
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DkZlVMzT
Received: from list by lists.xenproject.org with outflank-mailman.1472517.1680384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRC-0007uP-95; Wed, 04 Nov 2026 20:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472517.1680384; Wed, 04 Nov 2026 20:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRC-0007tB-28; Wed, 04 Nov 2026 20:18:26 +0000
Received: by outflank-mailman (input) for mailman id 1472517;
 Wed, 04 Nov 2026 20:18:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRA-0007O9-SN
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRA-007PCO-94
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:24 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb92f6-e002-0a2a0a5209dd-0a2a4509bbbc-44
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:24 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb930f-be1a-0a2a45090019-aa0a857ce6fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:24 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-mjBi57jdNC6N6sRwpfIbiA-1; Wed,
 04 Nov 2026 15:18:19 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 63BDD1800542; Wed,  4 Nov 2026 20:18:17 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CE7E8301D916; Wed,  4 Nov 2026 20:18:16 +0000 (UTC)
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
	s=mimecast20190719; t=1793823503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2fQy26Nzh4pevOCqiRqluICNBTrWSgxg/L8ugtFtns=;
	b=DkZlVMzT8xvU4Ak5SavTGHhHNw1gXHxOA6p9+JQiKGH55awodDEQpPtyVEuP9baCB5wrWh
	BT7NSDMUAcPULIN0cQtzqcWgiIsWANkK6ZNE8i/F6KHnFztR9ma/FBv4SyorEcik2K6AUi
	9N4aLnGM91v1v6nLQ11XV6Ro9KeYrBw=
X-MC-Unique: mjBi57jdNC6N6sRwpfIbiA-1
X-Mimecast-MFC-AGG-ID: mjBi57jdNC6N6sRwpfIbiA_1793823497
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PULL v2 07/25] trace: remove obsolete references to vcpu property
Date: Wed,  4 Nov 2026 15:17:43 -0500
Message-ID: <20261104201802.11556-8-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: wQCs9WlhuiLLZJEe648mq-LKD63sc5iiQ_lk14WmhtY_1793823497
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793823504-FC817034-7B5B5309/35/111497
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


