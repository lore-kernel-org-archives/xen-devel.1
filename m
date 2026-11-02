Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0B606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=brprPtGP
Received: from list by lists.xenproject.org with outflank-mailman.1468607.1677756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHt-0001qo-3g; Mon, 02 Nov 2026 19:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468607.1677756; Mon, 02 Nov 2026 19:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHs-0001p4-NG; Mon, 02 Nov 2026 19:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1468607;
 Mon, 02 Nov 2026 19:01:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHr-0001Wh-EJ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHq-00AdPD-Q7
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:42 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de10-8faa-0a2a0a5109dd-0a2a4504ac8c-28
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:42 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de15-b57f-0a2a45040019-aa0a857c53e9-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:42 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-s3xJ6PC9PZKK1SFQ37zHSg-1; Mon,
 02 Nov 2026 14:01:38 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 46DEA1955D7D; Mon,  2 Nov 2026 19:01:36 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F012A433; Mon,  2 Nov 2026 19:01:35 +0000 (UTC)
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
	s=mimecast20190719; t=1793646101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMzIqwZzfLbxitsjp49xs/Ty7Ev+lHRLVyhej1u9jzk=;
	b=brprPtGPJEGvkW2E5a1jEle743a7lmWwDF44RqmoPjdweXroP0wNTPXlseveGaZ9WClOTM
	rTOBJfmdM5LL23hk12dvrs1asBvymd7Y1pBsj9uEk9D84E0nFzFgabhJPdWXTSi7VZlktg
	1+h/MHBH1Jx2LozUSxsdkebZCzdNYkY=
X-MC-Unique: s3xJ6PC9PZKK1SFQ37zHSg-1
X-Mimecast-MFC-AGG-ID: s3xJ6PC9PZKK1SFQ37zHSg_1793646096
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
Subject: [PULL 17/25] audio: remove mistaken use of trace_event_get_state()
Date: Mon,  2 Nov 2026 13:58:23 -0500
Message-ID: <20261102185831.1880189-18-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: uzQAn-k69PF0DXhIiVfcA4hmaW9wf0Lc54F-Prf8WY8_1793646096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793646102-50EDEB50-AEA6C338/35/111497
X-purgate-type: clean
X-purgate-size: 1364
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-18-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 audio/audio-mixeng-be.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio-mixeng-be.c b/audio/audio-mixeng-be.c
index f6fd5014e0e..815d4fad2f5 100644
--- a/audio/audio-mixeng-be.c
+++ b/audio/audio-mixeng-be.c
@@ -1179,7 +1179,7 @@ void audio_run(AudioMixengBackend *s, const char *msg)
     audio_run_in(s);
     audio_run_capture(s);
 
-    if (trace_event_get_state(TRACE_AUDIO_RUN_POLL)) {
+    if (trace_event_get_state_backends(TRACE_AUDIO_RUN_POLL)) {
         /* Convert seconds to microseconds for trace event */
         int64_t elapsed_us = g_timer_elapsed(s->run_timer, NULL) * MICROSECONDS_PER_SECOND;
         trace_audio_run_poll(msg, elapsed_us);
-- 
2.56.0


