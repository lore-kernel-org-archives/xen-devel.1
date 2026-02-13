Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510ACEDF141
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 09:58:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1230530.1536021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpwC-0001IE-OR; Fri, 13 Feb 2026 09:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230530.1536021; Fri, 13 Feb 2026 09:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpwC-0001I6-LT; Fri, 13 Feb 2026 09:58:12 +0000
Received: by outflank-mailman (input) for mailman id 1230530;
 Fri, 13 Feb 2026 09:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpol-0001Na-9g
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e29dd21-08c1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 10:50:30 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-HKw9Op8PPjWopkCu_sg3xA-1; Fri,
 13 Feb 2026 04:50:25 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 20FCD195FDE0; Fri, 13 Feb 2026 09:50:24 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3453619560BD; Fri, 13 Feb 2026 09:50:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6e29dd21-08c1-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jM55cKZhaLYd8jeB1eDli6p7CvLSuDmkHDqz2KhxR1g=;
	b=h3UVB8tNDRf3MDzi1oenT3Bo/ty4GP17r+RukgshcugBaqH39+Km2wG2s6+iZjETgYjzJt
	/tzQ7q6+jkmk6AK4EJQqg28LgNzo0sG0cqtPoii4z2r/Mhz8xxXTWaspdRS7Jsl4BifNeg
	Sr/HTvy4HW4nmWOpCkCdNXwKDy4qLgc=
X-MC-Unique: HKw9Op8PPjWopkCu_sg3xA-1
X-Mimecast-MFC-AGG-ID: HKw9Op8PPjWopkCu_sg3xA_1770976224
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL v2 13/15] error-report: make real_time_iso8601() public
Date: Fri, 13 Feb 2026 10:49:32 +0100
Message-ID: <20260213094938.4074478-14-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: OzU2S9aB7JYJK05V94Oazw0IKUz2EC_qwiyZ9FVDBgo_1770976224
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

To be reused in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260201173633.413934-3-vsementsov@yandex-team.ru>
---
 include/qemu/error-report.h | 6 ++++++
 util/error-report.c         | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 3ae2357fda5..dc423d36071 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -74,4 +74,10 @@ extern bool message_with_timestamp;
 extern bool error_with_guestname;
 extern const char *error_guest_name;
 
+/*
+ * Return current datetime in ISO 8601 format.
+ * Caller is responsible to g_free() the returned string.
+ */
+char *real_time_iso8601(void);
+
 #endif
diff --git a/util/error-report.c b/util/error-report.c
index 1b17c11de19..d6b7448183a 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -169,8 +169,7 @@ static void print_loc(void)
     }
 }
 
-static char *
-real_time_iso8601(void)
+char *real_time_iso8601(void)
 {
     g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
     return g_date_time_format_iso8601(dt);
-- 
2.52.0


