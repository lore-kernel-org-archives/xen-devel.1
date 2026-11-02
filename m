Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ACC606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eBgD/wCh
Received: from list by lists.xenproject.org with outflank-mailman.1468578.1677664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHY-0007FD-EP; Mon, 02 Nov 2026 19:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468578.1677664; Mon, 02 Nov 2026 19:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHY-0007Ex-Al; Mon, 02 Nov 2026 19:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1468578;
 Mon, 02 Nov 2026 19:01:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHX-00070g-5m
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHW-000wMH-Iz
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:22 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8dddf-2eae-0a2a0a5409dd-0a2a450793c4-48
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:22 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de01-b4ea-0a2a45070019-aa0a817c546b-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:22 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-pri0MwLOPtaWKx9vB82Row-1; Mon,
 02 Nov 2026 14:01:19 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3D0381954B12; Mon,  2 Nov 2026 19:01:17 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D03401800446; Mon,  2 Nov 2026 19:01:16 +0000 (UTC)
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
	s=mimecast20190719; t=1793646080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UH5nYrF7hB5atKv+0kCjyLnZFXkjL/Cltw+H/p8G/s=;
	b=eBgD/wChEiM6Oefh9bmq/aaN1KR3wfo+g47xA5CydvKUUYZXdWXMlSsbEQXTzoFCu+//15
	lYkI77Nyy7iVYsHAdWNMYWQE1x3lZcB0+n5e42JOGd9GfpfsQiNDTUJuOxoJVCtImOgJWV
	JC5zeARynLVyxBoEe/b3caRFYwsWQdg=
X-MC-Unique: pri0MwLOPtaWKx9vB82Row-1
X-Mimecast-MFC-AGG-ID: pri0MwLOPtaWKx9vB82Row_1793646077
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
Subject: [PULL 06/25] trace: drop unused trace_event_set_state_dynamic_init()
Date: Mon,  2 Nov 2026 13:58:12 -0500
Message-ID: <20261102185831.1880189-7-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: CniuZUKFEtWnhIsNWysS2RTh4eXVGZXrbTFAYtmPgbA_1793646077
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793646082-378D1AE4-550CB860/35/111497
X-purgate-type: clean
X-purgate-size: 2438
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

The use of this method was mistakenly dropped in 0d4e995c73.
When the 'vcpu' property was dropped, however, this became
functionally identical to trace_event_set_state_dynamic().

Fixes: 0d4e995c7368 ("trace: convert code to use event iterators")
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-7-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/event-internal.h |  2 --
 stubs/trace-control.c  |  5 -----
 trace/control-target.c | 21 ---------------------
 3 files changed, 28 deletions(-)

diff --git a/trace/event-internal.h b/trace/event-internal.h
index 0c24e01b521..1d57b0ff1b5 100644
--- a/trace/event-internal.h
+++ b/trace/event-internal.h
@@ -37,6 +37,4 @@ typedef struct TraceEvent {
     uint16_t *dstate;
 } TraceEvent;
 
-void trace_event_set_state_dynamic_init(TraceEvent *ev, bool state);
-
 #endif /* TRACE__EVENT_INTERNAL_H */
diff --git a/stubs/trace-control.c b/stubs/trace-control.c
index b428f34c878..3f196835db0 100644
--- a/stubs/trace-control.c
+++ b/stubs/trace-control.c
@@ -11,11 +11,6 @@
 #include "trace/control.h"
 
 
-void trace_event_set_state_dynamic_init(TraceEvent *ev, bool state)
-{
-    trace_event_set_state_dynamic(ev, state);
-}
-
 void trace_event_set_state_dynamic(TraceEvent *ev, bool state)
 {
     bool state_pre;
diff --git a/trace/control-target.c b/trace/control-target.c
index 57ceac21084..24d9b7abbde 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -10,27 +10,6 @@
 #include "qemu/osdep.h"
 #include "trace/control.h"
 
-
-void trace_event_set_state_dynamic_init(TraceEvent *ev, bool state)
-{
-    bool state_pre;
-    assert(trace_event_get_state_static(ev));
-    /*
-     * We ignore the "vcpu" property here, since no vCPUs have been created
-     * yet. Then dstate can only be 1 or 0.
-     */
-    state_pre = *ev->dstate;
-    if (state_pre != state) {
-        if (state) {
-            trace_events_enabled_count++;
-            *ev->dstate = 1;
-        } else {
-            trace_events_enabled_count--;
-            *ev->dstate = 0;
-        }
-    }
-}
-
 void trace_event_set_state_dynamic(TraceEvent *ev, bool state)
 {
     assert(trace_event_get_state_static(ev));
-- 
2.56.0


