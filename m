Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB75C531FA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:14:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369678.1618264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2cU-0008UA-69; Thu, 23 Jul 2026 23:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369678.1618264; Thu, 23 Jul 2026 23:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2cU-0008U3-26; Thu, 23 Jul 2026 23:14:26 +0000
Received: by outflank-mailman (input) for mailman id 1369678;
 Thu, 23 Jul 2026 23:14:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn2cS-0008Qm-Nl
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:14:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2cS-002RKf-4b
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:14:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a04f-bab6-0a2a0a5309dd-0a2a450cde10-0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:14:23 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a04e-f479-0a2a450c0019-d561b338ed68-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:14:23 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn2cP-003dsJ-Jn; Fri, 24 Jul 2026 01:14:21 +0200
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
	bh=zBAAE6UPiVcuOT4Hdx5zYoG+Uei+rPkEJSxQ4+nbtAc=; b=R/gjQH2VSgkl4pACIKZMge3cYq
	mEx2tgfcbgdYNPGm9D38BSk4JWIG350FyRZnrJ91Nq159jjVPzrr1xs+sq6JH2ShauIebrVQxZP36
	/MYI/+PJf26/q+EoxLTiK9i45/spWyDtNoWXurvB/GR/hhSeDa/E6VmDZKq6qiIZouVE59xVJimjh
	7hUhbvPPVIHB09zhVgv1TmM+7R0x+q7HIkcsj5KkPE9EK1iKOx2hE1J1flI3vNqpufm5F9iKRFh/Y
	BHK8Vu1JA9EtzvVAx20riQAcho0e8+ppozUg/YXzlBOwMIuFxBBUn9kPS9/IxMiEX4MardB9mTFjI
	mRKV173A==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Thu, 23 Jul 2026 20:13:54 -0300
Subject: [PATCH v8 4/4] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pvh-kasan-inline-v8-4-c1f62c156f52@igalia.com>
References: <20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com>
In-Reply-To: <20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-d25034/1784848463-00ACCA5B-16A44BEB/0/0
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


