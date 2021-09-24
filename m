Return-Path: <SRS0=CWmW=OO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6519C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 00:41:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C2560F3A
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 00:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73C2560F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194700.346907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZHF-00042P-FR; Fri, 24 Sep 2021 00:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194700.346907; Fri, 24 Sep 2021 00:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZHF-00042G-CX; Fri, 24 Sep 2021 00:41:21 +0000
Received: by outflank-mailman (input) for mailman id 194700;
 Fri, 24 Sep 2021 00:41:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZHE-0003v3-US
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:41:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21e828e9-1cd0-11ec-ba94-12813bfff9fa;
 Fri, 24 Sep 2021 00:41:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ADC061211;
 Fri, 24 Sep 2021 00:41:19 +0000 (UTC)
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
X-Inumbo-ID: 21e828e9-1cd0-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632444079;
	bh=4wOFVZiPcSpldLBMYtIEqdq2wNSrUafgFrAxx9/05G4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V3Ms6Kz2VBOeqOeynJ3+bg3MUoR0OJAdlkUu0Y/OO8d4TVE6tKj38d7FduD/cOQH4
	 /KvzltuCXQ0iS4BYvs16S4n+9bk7GT7FXZ3jegtpBAamLNt8KMhW2wG0WQEMC3VcLM
	 O/ETOrGoYG1E2SNzCH3Y4/uThq0Sw/Xe60039+67uWI/laWKWO4VccvpwsFjIqcaCa
	 /jehIWtJIukoEWpicdPbM1ac9wM/15qtUBVm94JfYdfo1ZGDZMiBDlNyqY6KTNqEUm
	 NEMPEk9YCLzkWCrmNTXeT+8kV1ivBnpqTdaFMFer5B5fuVCeGnf0i0N9ctkLYL/8AV
	 fUNf3E1sc/Zjg==
Date: Thu, 23 Sep 2021 17:41:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 17/37] xen/x86: use CONFIG_NUMA to gate numa_scan_nodes
In-Reply-To: <20210923120236.3692135-18-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231741100.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-18-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> As we have turned numa_scan_nodes to neutral function. If we
> still use CONFIG_ACPI_NUMA in numa_initmem_init to gate
> numa_scan_nodes that doesn't make sense. As CONFIG_ACPI_NUMA
> will be selected by CONFIG_NUMA for x86. So in this patch,
> we replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 8a4710df39..509d2738c0 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -260,7 +260,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>      start = pfn_to_paddr(start_pfn);
>      end = pfn_to_paddr(end_pfn);
>  
> -#ifdef CONFIG_ACPI_NUMA
> +#ifdef CONFIG_NUMA
>      if ( !numa_off && !numa_scan_nodes(start, end) )
>          return;
>  #endif
> -- 
> 2.25.1
> 

