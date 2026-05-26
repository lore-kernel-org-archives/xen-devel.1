Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AE1CD5BD0
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 14:53:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1319972.1587410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRt9S-0003cN-Qw; Tue, 26 May 2026 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319972.1587410; Tue, 26 May 2026 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRt9S-0003cG-NY; Tue, 26 May 2026 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1319972;
 Tue, 26 May 2026 14:53:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wRt9R-0003b9-GU
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:53:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRt9Q-00DAfa-SN
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 16:53:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a15b3c2-5cb7-0a2a0a5109dd-0a2a45019a54-32
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 16:53:00 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a15b3cc-c1f2-0a2a45010019-d561b338dc20-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 16:53:00 +0200
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161]
 helo=[192.168.1.68]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRt9P-008TwX-IX; Tue, 26 May 2026 16:52:59 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gJKjWXfILv4BRccqYgfSFnf+b13WkiYn/6GuwfAO050=; b=OesFYrIBBOauSSY3AjjpMej7ph
	hJ248d7jDB7xvJ41ugaGoBXE1n/qxNNG9q9C4d7IDIlr5JZw8AKJ7CMf78LHGqnHVAkvIRMQL6s6l
	ajpvLYA8iUA0R3szIb9A//tTX/rFpCyULIUoz+mQXlZi00WnBEmq+RcRRU01a2fCx/Rh8dw/gQi5k
	QP8x3PBNb7gDGrClTdZhImkXmJpiM2+qj8B9eOzp30jaL20bichpfZEnmHpAQwePZLnF/r4UNF2s/
	HzBMg7x8ZJvBRX5y9PFxNC2AbMbhkrPB3gY1lQrRX5IhUUV3LahNH1ftxzJuJBcyH0hQVdL+GbsUA
	tixH9UfQ==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 26 May 2026 11:52:35 -0300
Subject: [PATCH v4 3/4] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-pvh-kasan-inline-v4-3-a310e6a25ecd@igalia.com>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
In-Reply-To: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-d62444/1779807180-AD9A9FF4-E1028600/0/0
X-purgate-type: clean
X-purgate-size: 1458

Even with __builtin the compiler may decide to use the out of line function
instead of the inline implementation.

The existing code is broken with gcc-14/15 but not gcc-12/13 (Ubuntu 25.10)
and vmlinux no longer boots with CONFIG_PVH if CONFIG_KASAN_GENERIC is set.

For testing purposes, if the size argument is reduced from 12 to 8 then the
compiler decides to use the inline implementation; that shows results vary.

Switch the builtin to the inline implementation to address it.

Fixes: 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/cpuid/api.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82eddfa2347b32b76c2ea9b85f005ca5416ac71f..2d9f3d4d63de6e721f275d9e80d372edbdfedf30 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 		 * from PVH early boot code before instrumentation is set up
 		 * and memcmp() itself may be instrumented.
 		 */
-		if (!__builtin_memcmp(sig, signature, 12) &&
+		if (!__inline_memcmp(sig, signature, 12) &&
 		    (leaves == 0 || ((eax - base) >= leaves)))
 			return base;
 	}

-- 
2.51.0


