Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627B6C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:49:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383971.1627066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkQZ-0006HU-8t; Wed, 05 Aug 2026 22:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383971.1627066; Wed, 05 Aug 2026 22:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkQZ-0006HN-61; Wed, 05 Aug 2026 22:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1383971;
 Wed, 05 Aug 2026 22:49:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wrkQX-0006HG-PV
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:49:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkQW-00AyQD-W0
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:49:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73bdca-5cb7-0a2a0a5109dd-0a2a450584ba-34
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:49:32 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73bdfb-4cb1-0a2a45050019-aceafc1fd156-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:49:32 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0EA3940815;
 Wed,  5 Aug 2026 22:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E261F000E9;
 Wed,  5 Aug 2026 22:49:29 +0000 (UTC)
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
	s=k20260515; t=1785970170;
	bh=fHVmsCi75+bOy9xF1TMBrC/j7NUcRqJEe7b8M5dGgho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Uq/0Az7dFA0DuUlaa/qWDjeOEXo6q0B1nwKSMlQpZbklPFPI5YVDoI7McTLLkVgCp
	 wa98kE2yqy4Lwrf42VlFfsMO9k0G9YMqArWcqQO9CxT8VFUG53YadBfAvQMbSHZKfP
	 E742IrgSoxWHH3/69/WZ/zhkuRZU0QwATTUMO9e5mVLkvn2546G0NWL53iChWNVXTS
	 pCbHvmj/aVtyTikPcx7QAGHRsezXQmNp4XdN4FhnWLAW2N6mI/BgrlDCivQVG4thqu
	 bqVZ4DZkCE+A/3uE1woFV98GEyVvBnUxDqBQnDwr0RdR/jtP8AGmox80U+jWGw7azY
	 CVOX8j92u6zLA==
Date: Wed, 5 Aug 2026 15:49:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
In-Reply-To: <20260805082137.1214967-5-jgross@suse.com>
Message-ID: <ed8559a3-d955-826c-7646-2c98b4a781ed@kernel.org>
References: <20260805082137.1214967-1-jgross@suse.com> <20260805082137.1214967-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1785970172-F46A52A1-86B8FFDB/0/0
X-purgate-type: clean
X-purgate-size: 1337

On Wed, 5 Aug 2026, Juergen Gross wrote:
> CONFIG_XEN_PVHVM_SMP is referenced only on x86 in Xen specific code,
> so it can be replaced with CONFIG_SMP.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/x86/xen/Kconfig  | 4 ----
>  arch/x86/xen/Makefile | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index 9e5bb51eecf4..609e79942fcb 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -50,10 +50,6 @@ config XEN_PV_DOM0
>  	def_bool y
>  	depends on XEN_PV && XEN_DOM0
>  
> -config XEN_PVHVM_SMP
> -	def_bool y
> -	depends on XEN && SMP
> -
>  config XEN_PVHVM_GUEST
>  	bool "Xen PVHVM guest support"
>  	default y
> diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
> index 32d651aa9bc2..9c7e9ffffb85 100644
> --- a/arch/x86/xen/Makefile
> +++ b/arch/x86/xen/Makefile
> @@ -37,8 +37,8 @@ obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
>  obj-$(CONFIG_EVENT_TRACING)	+= trace.o
>  
>  obj-$(CONFIG_SMP)		+= smp.o
> +obj-$(CONFIG_SMP)		+= smp_hvm.o
>  obj-$(CONFIG_XEN_PV_SMP)  	+= smp_pv.o
> -obj-$(CONFIG_XEN_PVHVM_SMP)  	+= smp_hvm.o
>  
>  obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinlock.o
>  
> -- 
> 2.55.0
> 
> 

