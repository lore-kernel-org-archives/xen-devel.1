Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F676071A39
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M+BTIXjm
Received: from list by lists.xenproject.org with outflank-mailman.1472514.1680358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRA-0007Fi-92; Wed, 04 Nov 2026 20:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472514.1680358; Wed, 04 Nov 2026 20:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhRA-0007El-0T; Wed, 04 Nov 2026 20:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1472514;
 Wed, 04 Nov 2026 20:18:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@redhat.com>) id 1xOhR8-0007AC-Ns
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:18:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhR8-00FVOo-3Q
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:18:22 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb92f2-bab6-0a2a0a5309dd-0a2a45029e7a-26
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:22 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefanha@redhat.com>)
 id 6aeb930b-6ca4-0a2a45020019-aa0a857cb3ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:18:20 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-Saaa4D5FPI6OohZgO6qhLQ-1; Wed,
 04 Nov 2026 15:18:16 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 07399180059D; Wed,  4 Nov 2026 20:18:07 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1D6A5195604E; Wed,  4 Nov 2026 20:18:05 +0000 (UTC)
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
	s=mimecast20190719; t=1793823499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqkKXu2f79+4gbliMkvun6ZA/q+B5xT3gEohpgAcSnM=;
	b=M+BTIXjmFCKYbfi4/cUOI0p3p5YdORd8tOlUy9cNVMdxVf1mXPCvb3ZvJ8dgDsDWxUeQqa
	+BYi3j+TcKboSoYEMDe1hD/501+YBdmXyt69DiPp0od8R9zL7QPMp38ihgdnb7YAkJPVri
	CwiWfEzz4sL/0nLH53g1ydTx5vHbeMo=
X-MC-Unique: Saaa4D5FPI6OohZgO6qhLQ-1
X-Mimecast-MFC-AGG-ID: Saaa4D5FPI6OohZgO6qhLQ_1793823487
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
Subject: [PULL v2 01/25] osdep: add 'ignore_value(x)' macro
Date: Wed,  4 Nov 2026 15:17:37 -0500
Message-ID: <20261104201802.11556-2-stefanha@redhat.com>
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
References: <20261104201802.11556-1-stefanha@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: djIbAbOIj9JWaQFMUGCl6wej_c-6GcysoPrp4ZMXLjA_1793823487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793823500-F26B72AC-F8AF51CE/35/111497
X-purgate-type: clean
X-purgate-size: 1574
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

Functions annotated with 'warn_unused_result' cannot be cast
to (void) to silence the compiler. Add the ignore_value()
macro which tricks the compiler into thinking the result is
genuinely used, avoiding the need for manual workarounds where
the return value is intentionally ignored.

This clever macro is derived from one originating with the
GNULIB project:

  https://gitweb.git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=lib/ignore-value.h;hb=HEAD

but simplified since we don't need compat with old GCC and
optimizing on clang is overkill.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20261102142844.3464712-2-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/osdep.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 50c7ce33b6a..b27d159d5bb 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -251,6 +251,14 @@ extern "C" {
 #endif
 
 
+/*
+ * Merely casting to (void) is not sufficient for functions
+ * annotated with the "warn_unused_result" attribute
+ */
+#define ignore_value(x) \
+    (__extension__ ({ __typeof__(x) __x = (x); (void) __x; }))
+
+
 /*
  * For mingw, as of v6.0.0, the function implementing the assert macro is
  * not marked as noreturn, so the compiler cannot delete code following an
-- 
2.56.0


