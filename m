Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C00C433FE
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 18:45:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5274061250
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 18:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5274061250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184745.333468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOlWY-0001Bu-I5; Fri, 10 Sep 2021 18:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184745.333468; Fri, 10 Sep 2021 18:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOlWY-0001Bn-Eq; Fri, 10 Sep 2021 18:45:18 +0000
Received: by outflank-mailman (input) for mailman id 184745;
 Fri, 10 Sep 2021 18:45:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOlWX-0001Bh-SN
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 18:45:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3da3eacc-1267-11ec-b276-12813bfff9fa;
 Fri, 10 Sep 2021 18:45:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 008C961209;
 Fri, 10 Sep 2021 18:45:15 +0000 (UTC)
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
X-Inumbo-ID: 3da3eacc-1267-11ec-b276-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631299516;
	bh=80PZEAVpmtJQ9Y24Fvr58NoHO7NPdZB30fqvyK+khYM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aymawEC+KOtspruSMgp1DP9jTIdM16Q1TKzf6QjsDymJwkIWP/8pazP8jVw5llhJD
	 rlBdNyOV2wMF5DnHDP4sPd9QxYbaCwlyMr0aBG9Ak/v0gh/2GwJ/2iVI2gYnTz4CjM
	 llnArayXVO6VQYs35CO4j7HcUoTmQgb/HJn4xGOS5iXYegVIPR2H3N/0gsh8j0pmg1
	 hfQxbk1Cpb0VzX02Xr8ymkxu4yGzzYYoInIzPDKoZvPqMZVajwUi9i2YyqJ3P+pjtM
	 2KniCysHm6y7kvXlPJuGGX6hiciyS6S1J80uTNMtfYi/M+5luCywfHVNvaH9lzP4/N
	 FeysNyquzXMfw==
Date: Fri, 10 Sep 2021 11:45:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com
Subject: Re: [PATCH 06/11] xen/domain: Call pci_release_devices() when
 releasing domain resources
In-Reply-To: <20210903083347.131786-7-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109101143550.10523@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-7-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is the very same what we do for DT devices. What is more
> that x86 already calls pci_release_devices().

Rewording suggestion:

This is the very same that we already do for DT devices. Moreover, x86
already calls pci_release_devices().



> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/arch/arm/domain.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index d99c653626e4..4e40c4098280 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>   * function which may return -ERESTART.
>   */
>  enum {
> -    PROG_tee = 1,
> +    PROG_pci = 1,
> +    PROG_tee,
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> @@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
>  #ifdef CONFIG_IOREQ_SERVER
>          ioreq_server_destroy_all(d);
>  #endif
> +#ifdef CONFIG_HAS_PCI
> +    PROGRESS(pci):
> +        ret = pci_release_devices(d);
> +        if ( ret )
> +            return ret;
> +#endif
>  
>      PROGRESS(tee):
>          ret = tee_relinquish_resources(d);
> -- 
> 2.25.1
> 

