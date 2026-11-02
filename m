Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1B606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eBGIsbKn
Received: from list by lists.xenproject.org with outflank-mailman.1468616.1677781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHz-00031T-6r; Mon, 02 Nov 2026 19:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468616.1677781; Mon, 02 Nov 2026 19:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHy-00030v-TH; Mon, 02 Nov 2026 19:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1468616;
 Mon, 02 Nov 2026 19:01:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHw-0002db-TQ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHw-000wRK-AC
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:48 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de1c-2eae-0a2a0a5409dd-0a2a4504cee6-0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:48 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de1b-b57f-0a2a45040019-aa0a857c95ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:48 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-yX8_BfRaNQe1Cyd_Mm-UjA-1; Mon,
 02 Nov 2026 14:01:42 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 370CB1954102; Mon,  2 Nov 2026 19:01:39 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5D0771800347; Mon,  2 Nov 2026 19:01:38 +0000 (UTC)
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
	s=mimecast20190719; t=1793646107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7tj2P/oslojgIW5ujruyi9WhhnGXEZAXlDkuQg0Gso=;
	b=eBGIsbKnO+Qcw/GdvGNaj25WktSnCLVymLdAES7HwO+m1MiEfzmaC5rsDmeTr5BssM2vl3
	Kf8K4vaNNCXBYVhYTOkwbwD1fRxzH+bg4vcR8FDbLVt6x0FP6mbkaK+GB3xDqU67o2Mbay
	DHksLBe9n9DJOxwIuG0hbRkr0lIUFfM=
X-MC-Unique: yX8_BfRaNQe1Cyd_Mm-UjA-1
X-Mimecast-MFC-AGG-ID: yX8_BfRaNQe1Cyd_Mm-UjA_1793646100
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
Subject: [PULL 19/25] monitor: remove mistaken use of trace_event_get_state()
Date: Mon,  2 Nov 2026 13:58:25 -0500
Message-ID: <20261102185831.1880189-20-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Lk11a3J5XRdo9HQB16QTbhX21kajii_eCrUtMhXgX5Y_1793646100
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793646108-C20D5B50-24030023/35/111497
X-purgate-type: clean
X-purgate-size: 1697
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-20-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 monitor/qmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index eb44012643f..8fad090fbe3 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -439,7 +439,7 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
 
         /* Process request */
         if (req_obj->req) {
-            if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
+            if (trace_event_get_state_backends(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
                 QDict *qdict = qobject_to(QDict, req_obj->req);
                 QObject *id = qdict ? qdict_get(qdict, "id") : NULL;
                 GString *id_json;
@@ -495,7 +495,7 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 
     if (qdict && qmp_is_oob(qdict)) {
         /* OOB commands are executed immediately */
-        if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_OUT_OF_BAND)) {
+        if (trace_event_get_state_backends(TRACE_MONITOR_QMP_CMD_OUT_OF_BAND)) {
             QObject *id = qdict_get(qdict, "id");
             GString *id_json;
 
-- 
2.56.0


