Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8FCCD6E55
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2026 17:58:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324068.1589750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6tp-0006ZE-IT; Mon, 01 Jun 2026 17:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324068.1589750; Mon, 01 Jun 2026 17:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6tp-0006Z5-FV; Mon, 01 Jun 2026 17:58:05 +0000
Received: by outflank-mailman (input) for mailman id 1324068;
 Mon, 01 Jun 2026 17:58:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wU6to-0006Yd-M2
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:58:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU6to-009LeU-2q
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 19:58:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1dc80f-5cb7-0a2a0a5109dd-0a2a4504c288-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:58:04 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1dc82b-1dec-0a2a45040019-d561b3389538-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:58:03 +0200
Received: from 186-249-147-15.shared.desktop.com.br ([186.249.147.15]
 helo=[192.168.1.68]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wU6tl-00B8VT-OV; Mon, 01 Jun 2026 19:58:03 +0200
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
	bh=gVOYRAOO+Mh5oBl1QeoqitXujUCY2P63meD8Qlv2Ukw=; b=IwtnTfG8tJ/FMypnBeTUkihO38
	HVJ13BsRTPj0/nrXa5tUXqDm37o9WVph3mB0YM1MDMx7ZHXBg3CrTqMN6miuBsG/4bXNZA+5InYVL
	a/Uu4xwqoD3CjtDi8GYVIfqEwoXGhxpTxZ93NLMaYb1PSzMTmyM7pXxmCo9w24bFRTUDG+/hmPXRc
	O4bYpQiE4rmbqr5nwBWImZWYkDLKWMtSPgcNG7o0WnQ7/QulbcYqcax1H1yo4DBM2GrtyngrZ7gA3
	f1uBNBbuR6ETdxle9N1OmqQmHCu6s+txURhbgBOe+u9sTukzSAdPFwX2hL2Mgvn6/VfCWT5+nSgpD
	DWHZEHTA==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 01 Jun 2026 14:56:59 -0300
Subject: [PATCH v5 3/3] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-pvh-kasan-inline-v5-3-c996e92dfe9a@igalia.com>
References: <20260601-pvh-kasan-inline-v5-0-c996e92dfe9a@igalia.com>
In-Reply-To: <20260601-pvh-kasan-inline-v5-0-c996e92dfe9a@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ebf023/1780336684-2A9623FF-56C0D30D/0/0
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
2.51.0


