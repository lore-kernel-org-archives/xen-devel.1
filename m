Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB173C63777
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 11:32:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5866121534
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 11:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="H3DZCuzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5866121534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39201.72015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibyx-0004of-95; Fri, 27 Nov 2020 11:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39201.72015; Fri, 27 Nov 2020 11:32:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibyx-0004oY-5X; Fri, 27 Nov 2020 11:32:07 +0000
Received: by outflank-mailman (input) for mailman id 39201;
 Fri, 27 Nov 2020 11:32:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eONm=FB=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kibyv-0004oS-LM
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:32:06 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d11e0816-5014-4931-8c25-8a2fcfd6e1bd;
 Fri, 27 Nov 2020 11:32:03 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0ffb00d5ac34a4508c2f14.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:fb00:d5ac:34a4:508c:2f14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C8BD21EC0323;
 Fri, 27 Nov 2020 12:32:02 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eONm=FB=alien8.de=bp@srs-us1.protection.inumbo.net>)
	id 1kibyv-0004oS-LM
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:32:06 +0000
X-Inumbo-ID: d11e0816-5014-4931-8c25-8a2fcfd6e1bd
Received: from mail.skyhub.de (unknown [5.9.137.197])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d11e0816-5014-4931-8c25-8a2fcfd6e1bd;
	Fri, 27 Nov 2020 11:32:03 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0ffb00d5ac34a4508c2f14.dip0.t-ipconnect.de [IPv6:2003:ec:2f0f:fb00:d5ac:34a4:508c:2f14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C8BD21EC0323;
	Fri, 27 Nov 2020 12:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1606476722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=ugdjThtrhUGuPIVjsesMvfGYF6EvCSTLiEMoM1kV7p0=;
	b=H3DZCuzv0GbI72+5hcncMOCBvU3bwbQjV3Xg05BJXfrUY9iAwMey2+iadrW0uv0ZNz8JVW
	H5tHbow1z7hsKPg3aLpNWsikw0IR8bez7Yd35BVVGZVFqwLMPfDKicMg1TIF3sq/9OMGYs
	yNNdq7lFily/ytxwflNIuveYBKeRHuc=
Date: Fri, 27 Nov 2020 12:31:56 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, peterz@infradead.org,
	luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/12] x86/pv: switch SWAPGS to ALTERNATIVE
Message-ID: <20201127113156.GB13163@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-4-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:21PM +0100, Juergen Gross wrote:
> SWAPGS is used only for interrupts coming from user mode or for
> returning to user mode. So there is no reason to use the PARAVIRT
> framework, as it can easily be replaced by an ALTERNATIVE depending
> on X86_FEATURE_XENPV.
> 
> There are several instances using the PV-aware SWAPGS macro in paths
> which are never executed in a Xen PV guest. Replace those with the
> plain swapgs instruction. For SWAPGS_UNSAFE_STACK the same applies.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andy Lutomirski <luto@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/entry/entry_64.S             | 10 +++++-----
>  arch/x86/include/asm/irqflags.h       | 20 ++++++++------------
>  arch/x86/include/asm/paravirt.h       | 20 --------------------
>  arch/x86/include/asm/paravirt_types.h |  2 --
>  arch/x86/kernel/asm-offsets_64.c      |  1 -
>  arch/x86/kernel/paravirt.c            |  1 -
>  arch/x86/kernel/paravirt_patch.c      |  3 ---
>  arch/x86/xen/enlighten_pv.c           |  3 ---
>  8 files changed, 13 insertions(+), 47 deletions(-)

I love patches like this one! Give me more...

Reviewed-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

