Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4096071ADB
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VMqSnzMn
Received: from list by lists.xenproject.org with outflank-mailman.1472546.1680485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRW-00034D-LB; Wed, 04 Nov 2026 20:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472546.1680485; Wed, 04 Nov 2026 20:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRV-0002zP-7u; Wed, 04 Nov 2026 20:18:45 +0000
Received: by outflank-mailman (input) for mailman id 1472546;
 Wed, 04 Nov 2026 20:18:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhRS-0002My-Fa
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhRR-00BuII-Qn
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9305-2eae-0a2a0a5409dd-0a2a450acd02-30
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:41 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb9320-f2d2-0a2a450a0019-aa0a817ce11b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:41 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-8gi46V3fPbuorzIqtOGZcA-1; Wed,
 04 Nov 2026 15:18:37 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C696A1956055; Wed,  4 Nov 2026 20:18:35 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7AEE11848D40; Wed,  4 Nov 2026 20:18:35 +0000 (UTC)
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
	bh=Uufc4nv38yI9zDdiGbNpg4ZIN69J3LElu5ZGq15CX2Y=;
	b=VMqSnzMnsrLR2mlc3qXu7nTmeB5FT1/gkfv/ZXAP32oN55sgZg82BQzvzrlsiBRyupuvzn
	76P7pkkPLzzNvnLvNkcRA8LDvxGPWljwMKHlDJaNpswu0JJ5EfS5Z32BDYtsr1JrOo6khT
	rPugs2b9JT07YuCDZA474a0fWKj18dA=
X-MC-Unique: 8gi46V3fPbuorzIqtOGZcA-1
X-Mimecast-MFC-AGG-ID: 8gi46V3fPbuorzIqtOGZcA_1793823515
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
Subject: [PULL v2 19/25] monitor: remove mistaken use of trace_event_get_state()
Date: Wed,  4 Nov 2026 15:17:55 -0500
Message-ID: <20261104201802.11556-20-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: wkH5n77aLcWUjxyz2LEavSJ-y432_Tdz8KhxVaR7gj0_1793823515
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793823521-5A3DCCFC-589374A5/35/111497
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
index d2e45d3993b..2f66257e4ad 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -440,7 +440,7 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
 
         /* Process request */
         if (req_obj->req) {
-            if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
+            if (trace_event_get_state_backends(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
                 QDict *qdict = qobject_to(QDict, req_obj->req);
                 QObject *id = qdict ? qdict_get(qdict, "id") : NULL;
                 GString *id_json;
@@ -496,7 +496,7 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 
     if (qdict && qmp_is_oob(qdict)) {
         /* OOB commands are executed immediately */
-        if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_OUT_OF_BAND)) {
+        if (trace_event_get_state_backends(TRACE_MONITOR_QMP_CMD_OUT_OF_BAND)) {
             QObject *id = qdict_get(qdict, "id");
             GString *id_json;
 
-- 
2.56.0


