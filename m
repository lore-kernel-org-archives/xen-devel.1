Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AAEC5DF8C
	for <xen-devel@archiver.kernel.org>; Sat, 22 Aug 2026 18:33:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398250.1634718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWx-0006vl-PP; Sat, 22 Aug 2026 18:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398250.1634718; Sat, 22 Aug 2026 18:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWx-0006vc-MF; Sat, 22 Aug 2026 18:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1398250;
 Sat, 22 Aug 2026 18:33:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wxqWx-0006tv-22
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 18:33:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxqWw-006G9Z-FG
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 20:33:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89ead9-bab6-0a2a0a5309dd-0a2a450bb682-48
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:22 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb71-b7e8-0a2a450b0019-d561b338ce4e-3
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:22 +0200
Received: from 186-249-148-4.shared.desktop.com.br ([186.249.148.4]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wxqWn-007bWT-T1; Sat, 22 Aug 2026 20:33:14 +0200
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
	bh=zBAAE6UPiVcuOT4Hdx5zYoG+Uei+rPkEJSxQ4+nbtAc=; b=dMe2VFbXG6LVZ97XCcOZogZ+Xl
	pKsLTJrh/GztxOCmUVySpFIS2alUMuV7GQayR1mRTdceykiWxoYxkoXRUr9C11Pz+F5zH8JYYNNBn
	Yi34qxXxtXJTg9qskyzCCk3Jp0JFGk+HajY3LrNFeIupDUyEn8sDEd69O8PSekVprWRmtrcY6qz0h
	dUJQRc9gZjDsw6kVPls2+HBH9cXK6TLxG74P7DLapJem2fZLzH96NXtGfJcYVp2IOW7ZVmk1fr3ma
	GCZ4xsK38gihLmcLo7yiNGxFgLlrLScn9kh7auOPKiiCL0IrA/QuBeKySEhAsDxw/ap2dp4nINRux
	PDVnSvmg==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Sat, 22 Aug 2026 15:33:21 -0300
Subject: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
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
X-purgate-ID: tlsNG-42698a/1787423602-2C39B9EA-375CAE9E/0/0
X-purgate-type: clean
X-purgate-size: 1416

Even with __builtin the compiler may decide to use the out of line function
instead of the inline implementation.

This particular one (still) generated the inline implementation as expected
(at least in these compiler versions) but this is not guaranteed to remain.

Switch the builtin to the inline implementation to address it.

Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
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
2.47.3


