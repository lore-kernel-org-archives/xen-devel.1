Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D68C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 23:14:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351038.1608393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf48A-00036b-3H; Wed, 01 Jul 2026 23:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351038.1608393; Wed, 01 Jul 2026 23:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf489-00036G-Vf; Wed, 01 Jul 2026 23:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1351038;
 Wed, 01 Jul 2026 23:14:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wf488-00035C-MA
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 23:14:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf488-00C8tC-37
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 01:14:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a459f3d-bab6-0a2a0a5309dd-0a2a4508e37a-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 01:14:08 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a459f3f-edec-0a2a45080019-d561b338e1da-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 01:14:07 +0200
Received: from 186-249-148-121.shared.desktop.com.br ([186.249.148.121]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wf486-007mwb-7X; Thu, 02 Jul 2026 01:14:06 +0200
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
	bh=H2GAc7mtrFpKl87p+adcJZhrkVbc1evwDywNzt1ulrU=; b=XF50oGI0B1AVA0SygXsrbkAJWO
	MPzZrCGnsc/X6R8NUQ+rMJcfIphLSA+9BgtQUxVku1RqpDCKHq2aRByKjxjXSdH4ZnQZOhclsCQDd
	GWMzKLslUvsUcv1b4SSD77qASJJZ89bR5R0re7Xw7wARnZdAp22rcLDA8uCs+WoerdE7pYTGX6uzT
	8pWn5T7OXnOYqZRP3jn1Lnl8hlXPjsGgF2idGEfVFVlMQUyTrsTg1iy112bvUnrC4S1gWOMHlp8Qy
	2Ys8KsaGnKCxln7TSjNCrYXzyCLaSP7HY6fJS2Hr9U8NUiFfoGtSKNmQ2cc0H5BhGrhv6iu0hrPft
	74vVrLig==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 01 Jul 2026 20:13:52 -0300
Subject: [PATCH v6 3/4] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-pvh-kasan-inline-v6-3-ba99045dfa9f@igalia.com>
References: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
In-Reply-To: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-c1860d/1782947647-4253F3FC-93952711/0/0
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
2.47.3


