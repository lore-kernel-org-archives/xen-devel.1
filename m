Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2A6FAD41B
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 06:21:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1291094.1570450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFnRI-0004BT-7b; Thu, 23 Apr 2026 06:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291094.1570450; Thu, 23 Apr 2026 06:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFnRI-0004BJ-4f; Thu, 23 Apr 2026 06:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1291094;
 Wed, 22 Apr 2026 20:08:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wFdsB-0007sW-Uv
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 20:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFdsB-008IiL-Bq
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 22:08:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69e92ac1-2eae-0a2a0a5409dd-0a2a4507c2ea-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:08:35 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69e92ac2-229c-0a2a45070019-d561b338b3d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:08:35 +0200
Received: from 186-249-145-131.shared.desktop.com.br ([186.249.145.131]
 helo=[192.168.1.66]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wFdrw-000QN6-VY; Wed, 22 Apr 2026 22:08:20 +0200
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
	bh=ugLYSHBb5Q9RwOF8EB3ofOp/JXnqmVAR7KYDCMKM5ok=; b=eA7Kx7ySJ0fQcyxXseR3wwYRQu
	BaEOoFBaNOeh2tfFgcRa50/ij6NjkDTNHHLPE/MI4ZVUjkoRfNxSHFT67t5yp85A1LceddlEU1pgW
	xktLdlpLLYEu6lKePNxiWQb5UERyLw64kBiutUmbe3ozGTvFOf1C3nsFc2RKL6wnDxtMhbooPjHey
	OE1+WLBHxqaAOcceUEPEgpjPgilanir0vWxXJ1ZR2lw0UHtCgaK7Fs7+6lhmZejMVzzuJCtPq5bcN
	PDxEaalcmUl8q1AYY5W10ZTFDQ4HUSsdZbRGOohFirJk5AE4JeizDZRrtyCwdzA3WDpFQJvqwi9J0
	0siPg/ow==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 22 Apr 2026 17:07:47 -0300
Subject: [PATCH 3/3] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pvh-kasan-inline-v1-3-7e6194344c92@igalia.com>
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
In-Reply-To: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ef75cf/1776888515-AC961C48-D89686DA/0/0
X-purgate-type: clean
X-purgate-size: 1428

Even with __builtin the compiler may decide to use the out of line function
instead of the inline implementation.

This particular one (still) generated the inline implementation as expected
(at least in these compiler versions), but this is not guaranteed to remain
the case, as seen with the previous commit.

Switch the builtin to the inline implementation to prevent a similar issue.

Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/platform/pvh/enlighten.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -8,6 +8,7 @@
 #include <asm/hypervisor.h>
 #include <asm/e820/api.h>
 #include <asm/x86_init.h>
+#include <asm/string.h>
 
 #include <asm/xen/interface.h>
 
@@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
 	 * This must not compile to "call memset" because memset() may be
 	 * instrumented.
 	 */
-	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
+	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
 
 	hypervisor_specific_init(xen_guest);
 

-- 
2.51.0


