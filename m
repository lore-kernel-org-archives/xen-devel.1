Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F56071A2C
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C+4TKrkQ
Received: from list by lists.xenproject.org with outflank-mailman.1472516.1680379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRB-0007og-UD; Wed, 04 Nov 2026 20:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472516.1680379; Wed, 04 Nov 2026 20:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRB-0007nD-OD; Wed, 04 Nov 2026 20:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1472516;
 Wed, 04 Nov 2026 20:18:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRA-0007GN-Co
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhR9-00FVOo-Pb
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:23 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb930e-bab6-0a2a0a5309dd-0a2a4501af60-6
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:23 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb930e-5984-0a2a45010019-aa0a857cd18b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:23 +0100
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-QalMV7oEOzeCMKM3d8bdqg-1; Wed,
 04 Nov 2026 15:18:18 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D5B5D195609D; Wed,  4 Nov 2026 20:18:15 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 36D281956089; Wed,  4 Nov 2026 20:18:15 +0000 (UTC)
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
	s=mimecast20190719; t=1793823502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UH5nYrF7hB5atKv+0kCjyLnZFXkjL/Cltw+H/p8G/s=;
	b=C+4TKrkQjp85hBKO/8387ujrynR58YEYatQZmQI88+3ZQKdJvoJln7OcH2/GnN/a4ZZIgO
	x7uN6rCqxoxX28uQ4hhvG+GW52eooVvolCl9SWw5oavn1G4fZlOqib1oiK7UQuliSB9Wch
	Cwv+W3JheLElsHHD8aaQ3b9qyYQCWAM=
X-MC-Unique: QalMV7oEOzeCMKM3d8bdqg-1
X-Mimecast-MFC-AGG-ID: QalMV7oEOzeCMKM3d8bdqg_1793823496
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
Subject: [PULL v2 06/25] trace: drop unused trace_event_set_state_dynamic_init()
Date: Wed,  4 Nov 2026 15:17:42 -0500
Message-ID: <20261104201802.11556-7-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Ikgqgbf0-ca2nAZrgR23FoBVEhXw90OCwKdQVVRyp8Q_1793823496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793823503-1F86F757-4F664800/35/111497
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


