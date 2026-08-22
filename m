Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F32C5DF98
	for <xen-devel@archiver.kernel.org>; Sat, 22 Aug 2026 18:33:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398249.1634710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWv-0006fG-EA; Sat, 22 Aug 2026 18:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398249.1634710; Sat, 22 Aug 2026 18:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWv-0006f9-9w; Sat, 22 Aug 2026 18:33:21 +0000
Received: by outflank-mailman (input) for mailman id 1398249;
 Sat, 22 Aug 2026 18:33:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wxqWt-0006cv-AV
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 18:33:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxqWs-00A7NX-NA
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 20:33:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eaf9-e002-0a2a0a5209dd-0a2a4501c03e-42
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:18 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb6e-5984-0a2a45010019-d561b338cbd2-3
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:18 +0200
Received: from 186-249-148-4.shared.desktop.com.br ([186.249.148.4]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wxqWj-007bWT-Vu; Sat, 22 Aug 2026 20:33:10 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=H2GAc7mtrFpKl87p+adcJZhrkVbc1evwDywNzt1ulrU=; b=H7scH/f9ODImbbUeyRMgVs7MXe
	Nr3swyCLfgndRrDO16yiFdMGz4KKClK2UPeUFBZKVfLxmIqMoKb3T/QUykYiNYSaZ+lSiBkOAWs8K
	mPeTyiyzWVBYg9kn5vwI13IGSEJN/hnVR7zvusHc8vC26fNDy9EUiMtHFDEj94edspLbLPj0qPZq4
	ef0YCA0Glz2UqWlN13YuFbgT6H+EpD/oSjikDrT4RmtRcavY+AxKlreaSo2i+Izsrzy5b2QqYq13E
	x23H4ImJH+EvyLOnra8OZnARhQqFHaeyv6Doe0SPuSjiGkp9KCVP5E1viUqPqeS0iUv4cIYeaQW6V
	m0Hwf4Qg==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Sat, 22 Aug 2026 15:33:20 -0300
Subject: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
In-Reply-To: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-d62444/1787423598-C4359757-A7687FBB/0/0
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


