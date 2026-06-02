Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C486CD6E5D
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 18:49:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325359.1590851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUAm-0005Dc-AX; Tue, 02 Jun 2026 18:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325359.1590851; Tue, 02 Jun 2026 18:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUAm-0005DV-7e; Tue, 02 Jun 2026 18:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1325359;
 Tue, 02 Jun 2026 18:49:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wUUAk-0005DP-1K
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:49:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUUAj-00CbGC-Ao
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 20:49:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a1f2577-2eae-0a2a0a5409dd-0a2a4505ae22-40
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 20:49:05 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bp@alien8.de>)
 id 6a1f25a0-aaa8-0a2a45050019-416d716ce830-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 20:49:05 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 382AF40E00BA; 
 Tue,  2 Jun 2026 18:49:04 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EI8TXzxJ_DQh; Tue,  2 Jun 2026 18:48:54 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7E21D40E015D;
 Tue,  2 Jun 2026 18:48:40 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780426134; bh=gxy9i9FFvFhWXdjT/xh3AljV8dg0OtulHYJ71ySt4sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxTBmQNRLIIDTgn03xIkm4JiSfQNgj4A53/DBf8Zk1l19kTr8JH26hpk0m323uYtq
	 Zq0chQprcuU2EQQea9dMk6LPH127tKWCJ2siaRA9UNCYF2dWqTyxHmaBa6Zvr8N5jN
	 GRsYm07tvh7Bp9y4Q6MOCfrKjCalhjq2fPaiNKC/3Z5Ux07OAsQEI5GHIcR49B36qT
	 4Z2SYNYXdMma4Hh+HmAawzmNM8InIzUVdv59RBbtNAbFOIAxbFiA/y5xGMAEBMWoKr
	 oyDaenykAXiqbS7CZOUvYteJX3sA2y3c9p61f4L52ZZzVo4saJxB+gpLPlVh/5oGYe
	 s5PBS0GlkaGoHcZ1umxUtYFoCDVLItfXH7+gVinw1ALbFYun8JdaJe1Q+lcNkoH2yC
	 R9ZUM3L2l1yBaah4kdJCuYBW6A7/nkn02olv3eiBEWhUTFuwHfDFHgztVD5plCLOyb
	 JWKGlCs0u16IXiWKeJeR8/DVjkH+UW8RMwNJKJJ9tm/XEg5wcarpinzk37bGcLcxib
	 AgghQjW+PNxXhgTvhWpN23Z7h1u/eDqHEU7bmb2BInWoFSKQQqaemNiUinSlMHEuZI
	 LvyCelgGfBHWttRrQkHDjxkLZlrSvRx2GhaD3p5L07cX1kvmD/eqfC4aIgP+EaO/19
	 c8GMhlrBSEvwrXnV9S3lKOqU=
Date: Tue, 2 Jun 2026 11:48:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: Penny Zheng <penny.zheng@amd.com>
Cc: x86@kernel.org, ray.huang@amd.com, Jason.Andryuk@amd.com,
	stefano.stabellini@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] x86/amd_node: harden amd_smn_init() against Xen
 dom0 topology
Message-ID: <20260602184823.GKah8ld2QJLm28xoa9@fat_crate.local>
References: <20260506055528.476493-1-penny.zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506055528.476493-1-penny.zheng@amd.com>
X-purgate-ID: tlsNG-c201ff/1780426145-E1D9D443-1E3BDAC7/0/0
X-purgate-type: clean
X-purgate-size: 1508

On Wed, May 06, 2026 at 01:55:17PM +0800, Penny Zheng wrote:
> While booting a recent linux-next kernel as a Xen PVH dom0 on x86, the kernel
> oopses very early during fs_initcall:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:amd_smn_init+0x188/0x2e0
> 
> Followed: on a kernel that survives the divide, it will fail by a NULL pointer
> dereference from the first SMN consumer (amd_pmc_probe -> amd_smn_read).
> 
> Root cause
> ==========
> 
> To prevent each dom0 vCPU from looking like an SMT sibling of another
> vCPU, Xen synthesizes guest x2APIC IDs as vcpu_index * 2. This spacing every
> vCPU's APIC ID by 2 can push the synthesized IDs past the package-field
> boundary. Linux then infers more "packages" and therefore more AMD
> nodes via amd_num_nodes() than the platform actually has, while the
> PCI-side host-bridge scan correctly reports the number of root complex.

Does that work?

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 0be01725a2a4..0f1ad1883883 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -249,6 +249,9 @@ static int __init amd_smn_init(void)
 	u16 count, num_roots, roots_per_node, node, num_nodes;
 	struct pci_dev *root;
 
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		return 0;
+
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 

Totally untested ofc.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

