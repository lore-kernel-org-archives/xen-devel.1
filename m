Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18682E9E2FC
	for <xen-devel@archiver.kernel.org>; Wed, 11 Feb 2026 12:30:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1227446.1533842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9MR-00022F-Kw; Wed, 11 Feb 2026 12:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227446.1533842; Wed, 11 Feb 2026 12:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9MR-000228-IG; Wed, 11 Feb 2026 12:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1227446;
 Wed, 11 Feb 2026 12:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9MP-0001nh-QF
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7024e63f-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:30:25 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-AMhWbVJWNvKZZaJjRa3M1w-1; Wed,
 11 Feb 2026 07:30:20 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 54D9918003FC; Wed, 11 Feb 2026 12:30:18 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A0C611956056; Wed, 11 Feb 2026 12:30:16 +0000 (UTC)
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
X-Inumbo-ID: 7024e63f-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGj9xk/Pm83KB03G6LVj5ElLZzoxkSGN+CQtNgApbDQ=;
	b=NTzxXaF/dqhF7rO7lTRBGTdc9cQth5htbc9b25uTkkiVJhpeTL2nTW2KZzjv1IIThXuK25
	Djcmaosh72zv+ctf47a+xu8CDYy2OGhB9eid5ybLygVDPWN+CyBLDho531zQVSludb7s+Z
	78UxVU6uBZ/rGb8/iuq4aFHezlSYjy4=
X-MC-Unique: AMhWbVJWNvKZZaJjRa3M1w-1
X-Mimecast-MFC-AGG-ID: AMhWbVJWNvKZZaJjRa3M1w_1770813018
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Eric K <erickra@cs.utexas.edu>
Subject: [PULL 01/14] char-udp: Fix initial backend open status
Date: Wed, 11 Feb 2026 16:29:48 +0400
Message-ID: <20260211123007.3569932-2-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: rQbXHHOJa2k9xHdIpfE5LbVHQ99WRIDPJ52gohL9nHo_1770813018
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric K <erickra@cs.utexas.edu>

This patch removes the `*be_opened = false` override for the UDP chardev
backend. Since UDP is connectionless it never sends a `CHR_EVENT_OPENED`
so it is never marked open. This causes some frontends (e.g. virtio-serial)
to never perform any operations on the socket.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2993
Signed-off-by: Eric K <erickra@cs.utexas.edu>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20251208225849.705554-1-erickra@cs.utexas.edu>
---
 chardev/char-udp.c     | 2 --
 tests/unit/test-char.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 572fab0ad13..1025f577a0d 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -215,8 +215,6 @@ static void qmp_chardev_open_udp(Chardev *chr,
     g_free(name);
 
     s->ioc = QIO_CHANNEL(sioc);
-    /* be isn't opened until we get a connection */
-    *be_opened = false;
 }
 
 static void char_udp_class_init(ObjectClass *oc, const void *data)
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 8a98e42cad0..2869c4e09df 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -1012,6 +1012,8 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
         qemu_chr_fe_init(fe, chr, &error_abort);
     }
 
+    g_assert(chr->be_open);
+
     d.chr = chr;
     qemu_chr_fe_set_handlers(fe, socket_can_read_hello, socket_read_hello,
                              NULL, NULL, &d, NULL, true);
-- 
2.52.0


