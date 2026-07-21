Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DBFC4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:57:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367909.1617595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCqG-0004Tk-0n; Tue, 21 Jul 2026 15:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367909.1617595; Tue, 21 Jul 2026 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCqF-0004Tb-TG; Tue, 21 Jul 2026 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1367909;
 Tue, 21 Jul 2026 15:57:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wmCqF-0004SE-47
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:57:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCqE-00FUhY-HK
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:57:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96d3-5cb7-0a2a0a5109dd-0a2a45028c22-8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:10 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96d5-6ca4-0a2a45020019-d561b338c1ba-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:10 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wmCq5-001fqi-KV; Tue, 21 Jul 2026 17:57:01 +0200
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
	bh=H2GAc7mtrFpKl87p+adcJZhrkVbc1evwDywNzt1ulrU=; b=jkKx9H55MATnseHJXY81Cspvjl
	99yL1XY80tw3CjNdRhms7d2OgdbbPrMwjer7mpauJndcaay8k1gKRvA6DRea0FRzmmy7Z83AOFCo6
	2Do13QujniJVM+JrS0AyG87eUPc5rB4EzSE8Mj062ssbo2Pwmr2WhEVZh5vEFZ5neyOZss4rYM7aO
	nnA55l0uLXkxNJyDs0lm7ZJ7THEVb099ufQ2eQ2hYrBdIqw+8AVIqDC9gS/Qvl6mYEPV9E/NfodXs
	aEtW05edbcx6O0H8EWeIxodq5SF69Wp3FXOCUgxpj7fJhtLoI0uSHaZeytExSJQT2z/CvOMr9FVaC
	I/xKiP8g==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 21 Jul 2026 12:56:45 -0300
Subject: [PATCH v7 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pvh-kasan-inline-v7-4-38979a50cef0@igalia.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
In-Reply-To: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-720697/1784649430-F3CBA2AC-9A7A3234/0/0
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


