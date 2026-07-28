Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30AAC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 23:34:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375095.1622374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1worJD-0001Pi-Os; Tue, 28 Jul 2026 23:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375095.1622374; Tue, 28 Jul 2026 23:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1worJD-0001Pb-LF; Tue, 28 Jul 2026 23:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1375095;
 Tue, 28 Jul 2026 23:34:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1worJB-0001PV-LS
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 23:34:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1worJA-00FzzM-NZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 01:34:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a693bf4-5cb7-0a2a0a5109dd-0a2a4508e1c2-44
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:34:00 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a693c68-f659-0a2a45080019-416d716c8b76-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:34:00 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5EBAC40E00E6; 
 Tue, 28 Jul 2026 23:33:59 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id x3ufB0EG3hup; Tue, 28 Jul 2026 23:33:49 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D143E40E00C3;
 Tue, 28 Jul 2026 23:33:35 +0000 (UTC)
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
	t=1785281629; bh=BZMdPuQinJISZTZHQlTHGCynNapMMtcWSMKh359hUuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHiQV5hlef0rkWel34orSzsGD68DGqhZx+z5YOPob5mabwkqCqvL7WpZUzyGgfzSH
	 Oqh4c+fMa1KDyxutfsALJh4t3589gwUZdfdC6FH5MZH47bGxcvOkT97HUCfyiR0TUG
	 MoLKcsXikVMpfblhC61NRQRSu5OQ+gwutjuv2pOx1PfkM/jJjnDXaoJxXUuwJNrIlb
	 ITEIfAZ+sIvFHtw96d+fuFvE/GHp7H/L2GB3xMipcjL1lHiVFokgGlHIVf4dy48rwO
	 ZH2lJIRolNdL++p+uLs7sv2b2H6XMLEUAr0lGsghBNpN0HV9op22qNLGado0oU4ciS
	 HFzzJZC1m6LEXyiULpylVPC52b9imxnXN8BuE19NnuvhwwRtqgSoCmfFFZnOvMdzDn
	 haSaPijyPob0unAaq8M7MXaT2iasP1mrQWgTuao98orrttP6hmM0gBsplAleBU+Wf1
	 rSGDzFfrmUOBFbetpyp5YZ9nyNDJ+HLy+Hyd5lN+CFVnN4k0A1tnZoJe70H7JtqgSm
	 B5CNe3bQrlPS5OXBSPjjNCg5R7YRw3R1XECsi5SKYh91LW4vZyP8egr3ovkjBWz8oe
	 m6C5uPzA+E1lR6WFazQo268sWEqFQdQHKMttz9TwA9P3oVoUVqAelHEHboScitYWqk
	 h1CDnq5U6NOgoHLZIVTAPsTg=
Date: Tue, 28 Jul 2026 16:33:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Brian Gerst <brgerst@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Mauricio Faria de Oliveira <mfo@igalia.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
Message-ID: <20260728233332.GCamk8TN3cyN-Ohr31@fat_crate.local>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
 <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com>
 <2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com>
 <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1785281640-CE54487B-D223EFC7/0/0
X-purgate-type: clean
X-purgate-size: 823

On Thu, Jul 23, 2026 at 08:49:13PM -0400, Brian Gerst wrote:
> Your suggestion is good, but should have a comment explaining why it's there
> to someone reading the code in the future.

I have this there now:

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 6827551720dd..7bc34f9272fb 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -32,6 +32,11 @@
 int memcmp(const void *s1, const void *s2, size_t len)
 {
 	bool diff;
+
+	/*
+	 * Make sure ZF is properly set in the len==0 case because in it,
+	 * RCX==0 and the REPE; CMPSB won't get executed.
+	 */
 	asm volatile("test %3, %3\n\t"
 		     "repe cmpsb"
 		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

