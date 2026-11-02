Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E9E606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dEM0IBrV
Received: from list by lists.xenproject.org with outflank-mailman.1468584.1677684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHg-0007tg-9z; Mon, 02 Nov 2026 19:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468584.1677684; Mon, 02 Nov 2026 19:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNxHg-0007su-6T; Mon, 02 Nov 2026 19:01:32 +0000
Received: by outflank-mailman (input) for mailman id 1468584;
 Mon, 02 Nov 2026 19:01:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xNxHe-0007bM-II
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:01:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNxHd-000KSU-VT
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:01:29 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8ddf5-bab6-0a2a0a5309dd-0a2a450ab18a-34
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:29 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6ae8de08-f2d2-0a2a450a0019-aa0a817cb279-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 20:01:29 +0100
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-O__lPeZ8OP6EyAo73df12Q-1; Mon,
 02 Nov 2026 14:01:25 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EF7571954AC2; Mon,  2 Nov 2026 19:01:22 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A5A451800446; Mon,  2 Nov 2026 19:01:22 +0000 (UTC)
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
	s=mimecast20190719; t=1793646088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKP5HFz810ebf9alfWmuhAqqhtocmxxt5vjo0KJQomg=;
	b=dEM0IBrVz1IKjnhPAg10oKciC7Ipi9TjsfkJNAZAz+h4cZYMcs1QGk1nS9ny2ybNveu8hw
	SEzTvUExOr86hBBY1EXWvRBTz+fHBfVipP2mPTOiTxbjxuCASw4MYOh6nX/NWfg5Xq4yBO
	9Vog3k9yWsH7DyOYAFsUmbRE3brDeKY=
X-MC-Unique: O__lPeZ8OP6EyAo73df12Q-1
X-Mimecast-MFC-AGG-ID: O__lPeZ8OP6EyAo73df12Q_1793646083
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
Subject: [PULL 02/25] trace: use 'ignore_value()' instead of a dummy variable
Date: Mon,  2 Nov 2026 13:58:08 -0500
Message-ID: <20261102185831.1880189-3-stefanha@redhat.com>
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: biIa1pgL0_rTm-2xbtXQXzP7KIPtrt-jqyxj6R4Kc_0_1793646083
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793646089-504CFCFC-114BAB7A/35/111497
X-purgate-type: clean
X-purgate-size: 2669
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

This pattern is more concise than using a dummy variable which
in turn needs annotating as unused.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-3-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/ftrace.c | 3 +--
 trace/simple.c | 9 ++++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/trace/ftrace.c b/trace/ftrace.c
index 6875faedb9c..c1ed6ad4454 100644
--- a/trace/ftrace.c
+++ b/trace/ftrace.c
@@ -41,7 +41,6 @@ static int find_mount(char *mount_point, const char *fstype)
 void ftrace_write(const char *fmt, ...)
 {
     char ftrace_buf[MAX_TRACE_STRLEN];
-    int unused __attribute__ ((unused));
     int trlen;
     va_list ap;
 
@@ -50,7 +49,7 @@ void ftrace_write(const char *fmt, ...)
     va_end(ap);
 
     trlen = MIN(trlen, MAX_TRACE_STRLEN - 1);
-    unused = write(trace_marker_fd, ftrace_buf, trlen);
+    ignore_value(write(trace_marker_fd, ftrace_buf, trlen));
 }
 
 bool ftrace_init(void)
diff --git a/trace/simple.c b/trace/simple.c
index c0aba00cb7f..e148ca44530 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -163,7 +163,6 @@ static gpointer writeout_thread(gpointer opaque)
     } dropped;
     unsigned int idx = 0;
     int dropped_count;
-    size_t unused __attribute__ ((unused));
     uint64_t type = TRACE_RECORD_TYPE_EVENT;
 
     for (;;) {
@@ -179,13 +178,13 @@ static gpointer writeout_thread(gpointer opaque)
             } while (!g_atomic_int_compare_and_exchange(&dropped_events,
                                                         dropped_count, 0));
             dropped.rec.arguments[0] = dropped_count;
-            unused = fwrite(&type, sizeof(type), 1, trace_fp);
-            unused = fwrite(&dropped.rec, dropped.rec.length, 1, trace_fp);
+            ignore_value(fwrite(&type, sizeof(type), 1, trace_fp));
+            ignore_value(fwrite(&dropped.rec, dropped.rec.length, 1, trace_fp));
         }
 
         while (get_trace_record(idx, &recordptr)) {
-            unused = fwrite(&type, sizeof(type), 1, trace_fp);
-            unused = fwrite(recordptr, recordptr->length, 1, trace_fp);
+            ignore_value(fwrite(&type, sizeof(type), 1, trace_fp));
+            ignore_value(fwrite(recordptr, recordptr->length, 1, trace_fp));
             writeout_idx += recordptr->length;
             free(recordptr); /* don't use g_free, can deadlock when traced */
             idx = writeout_idx % TRACE_BUF_LEN;
-- 
2.56.0


