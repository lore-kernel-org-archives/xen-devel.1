Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F9C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:31:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383908.1627004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrk8I-000191-Iz; Wed, 05 Aug 2026 22:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383908.1627004; Wed, 05 Aug 2026 22:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrk8I-00018t-DF; Wed, 05 Aug 2026 22:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1383908;
 Wed, 05 Aug 2026 22:30:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wrk8G-00018n-RB
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:30:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrk8F-00GHO2-F1
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:30:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73b977-5cb7-0a2a0a5109dd-0a2a4504ea92-16
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:30:39 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73b98e-b57f-0a2a45040019-ac6904fe9736-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:30:39 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 860B260A63;
 Wed,  5 Aug 2026 22:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8DF1F000E9;
 Wed,  5 Aug 2026 22:30:35 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785969037;
	bh=UyQFCcMMSY/nbGntlznDMnICY2Uy0xvxXdgPyh8X9mI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=nA4o5PUKLu5Wv3Zh23xrawOuZwiesBL+Dxbv59c0yLNJxxlb9OzysC1lbb+pTmbEB
	 Jm8covCACK8+kqbiKbYME+GvCT9MgbNSg4WB7gDBfYgjoVWys6Wgdq84DV2L/R9uig
	 nFSryxPCP/KCqg41N/Shytj15TmmuTTGMfTqntCYL9lqGOX953dPQbkszejKiayb1Z
	 LKdiFW6nJUBumNhq8lcUgJDPEhPh1/pcrzG4XclhhrkISxmLVRZDwjOGH87wkuUhzM
	 EOXXiRuSqMxUOAh2+67Sx3xC89MNCXObS5C3QS7jmIMUWiUZ3JEOtkWU8cBf98XIZb
	 eNvaTplYNP/zw==
Date: Wed, 5 Aug 2026 15:30:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] x86/xen: Remove redundant config dependency on
 X86_LOCAL_APIC
In-Reply-To: <20260805082137.1214967-2-jgross@suse.com>
Message-ID: <740aa008-a1ec-5c94-27cd-afad1f1b0495@kernel.org>
References: <20260805082137.1214967-1-jgross@suse.com> <20260805082137.1214967-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ebf023/1785969039-528C9B50-4F71B5FC/0/0
X-purgate-type: clean
X-purgate-size: 765

On Wed, 5 Aug 2026, Juergen Gross wrote:
> CONFIG_XEN depends on CONFIG_X86_LOCAL_APIC already, so the dependency
> of CONFIG_XEN_PVHVM on CONFIG_X86_LOCAL_APIC can be dropped.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/x86/xen/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index 99b06f5c47cd..bb420a4cb75f 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -52,7 +52,7 @@ config XEN_PV_DOM0
>  
>  config XEN_PVHVM
>  	def_bool y
> -	depends on XEN && X86_LOCAL_APIC
> +	depends on XEN
>  
>  config XEN_PVHVM_SMP
>  	def_bool y
> -- 
> 2.55.0
> 
> 

