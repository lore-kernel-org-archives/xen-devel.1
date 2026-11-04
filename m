Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E1606A330
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QTtF1gEh
Received: from list by lists.xenproject.org with outflank-mailman.1472547.1680499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRa-0003qo-Cq; Wed, 04 Nov 2026 20:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472547.1680499; Wed, 04 Nov 2026 20:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRZ-0003jt-4W; Wed, 04 Nov 2026 20:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1472547;
 Wed, 04 Nov 2026 20:18:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRS-0002Nv-Ip
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRR-00FVOo-TO
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:41 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9321-bab6-0a2a0a5309dd-0a2a4508d822-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:41 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9320-f659-0a2a45080019-aa0a817c61f1-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:41 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-zdS2rWdHNv-Xv-3HeQGrHg-1; Wed,
 04 Nov 2026 15:18:36 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9307C1800547; Wed,  4 Nov 2026 20:18:34 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 44EF21829C21; Wed,  4 Nov 2026 20:18:34 +0000 (UTC)
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
	s=mimecast20190719; t=1793823520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/XTSFHkdQ+Pw5IV0/sk+ny/n4mSrenG0IJ4ieTlAdY=;
	b=QTtF1gEh99e+JihTEvARNIkW/y6jJ/VGO42k1HZ8BMNwItp6bBbq+yjdq9B3OL/C+NY/Sj
	qbLbSsENtC2WWEd3J3ow3dZ9YEpfpK91KWZJQGeWAvZN2M8+OTF8p/RPSPzg0+M7xoA5yc
	5l7Q/CoUojHOxBq9dnxoKxfU/izxhvo=
X-MC-Unique: zdS2rWdHNv-Xv-3HeQGrHg-1
X-Mimecast-MFC-AGG-ID: zdS2rWdHNv-Xv-3HeQGrHg_1793823514
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
Subject: [PULL v2 18/25] hw/ppc: remove mistaken use of trace_event_get_state()
Date: Wed,  4 Nov 2026 15:17:54 -0500
Message-ID: <20261104201802.11556-19-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: i5JMgSt7Tf6LynCT1WCPk195l8ZxaaPbsH7HYHsyO4o_1793823514
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793823521-CE54487B-ECF4AC11/35/111497
X-purgate-type: clean
X-purgate-size: 2737
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

Conditional checks must call trace_event_get_state_backends()
which checks the state of all backends (dtrace, ftrace, log,
syslog, simple & ust), while trace_event_get_state() only
validates state for backends using QEMU's internal state
tracking (ftrace, log, syslog, simple).

Furthermore, checking qemu_loglevel_mask() is inappropriate since
there are many trace backends, of which 'log' is only one.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-19-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/ppc/vof.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 873e967f1e4..e2ff9bf96a3 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -252,8 +252,7 @@ static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
              */
             ret = proplen;
             /* Do not format a value if tracepoint is silent, for performance */
-            if (trace_event_get_state(TRACE_VOF_GETPROP) &&
-                qemu_loglevel_mask(LOG_TRACE)) {
+            if (trace_event_get_state_backends(TRACE_VOF_GETPROP)) {
                 prop_format(trval, sizeof(trval), prop, ret);
             }
         }
@@ -337,8 +336,7 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
         goto trace_exit;
     }
 
-    if (trace_event_get_state(TRACE_VOF_SETPROP) &&
-        qemu_loglevel_mask(LOG_TRACE)) {
+    if (trace_event_get_state_backends(TRACE_VOF_SETPROP)) {
         prop_format(trval, sizeof(trval), val, vallen);
     }
     ret = vallen;
@@ -584,8 +582,7 @@ static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
         }
 
         /* FIXME: there is no backend(s) yet so just call a trace */
-        if (trace_event_get_state(TRACE_VOF_WRITE) &&
-            qemu_loglevel_mask(LOG_TRACE)) {
+        if (trace_event_get_state_backends(TRACE_VOF_WRITE)) {
             tmp[cb] = '\0';
             trace_vof_write(ihandle, cb, tmp);
         }
@@ -599,9 +596,7 @@ static void vof_claimed_dump(GArray *claimed)
     int i;
     OfClaimed c;
 
-    if (trace_event_get_state(TRACE_VOF_CLAIMED) &&
-        qemu_loglevel_mask(LOG_TRACE)) {
-
+    if (trace_event_get_state_backends(TRACE_VOF_CLAIMED)) {
         for (i = 0; i < claimed->len; ++i) {
             c = g_array_index(claimed, OfClaimed, i);
             trace_vof_claimed(c.start, c.start + c.size, c.size);
-- 
2.56.0


