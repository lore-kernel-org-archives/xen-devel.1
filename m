Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF03C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 12:32:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6556D2076D
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 12:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6556D2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61167.107367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwP1U-0004Rh-FK; Mon, 04 Jan 2021 12:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61167.107367; Mon, 04 Jan 2021 12:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwP1U-0004Ra-C0; Mon, 04 Jan 2021 12:31:44 +0000
Received: by outflank-mailman (input) for mailman id 61167;
 Mon, 04 Jan 2021 12:31:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwP1S-0004RS-UY
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 12:31:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05d47252-6e5e-4478-90c5-d3cb603e4a0a;
 Mon, 04 Jan 2021 12:31:41 +0000 (UTC)
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
X-Inumbo-ID: 05d47252-6e5e-4478-90c5-d3cb603e4a0a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609763501;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=NY9OCftFzcq2Zgz7n1oITPGzs7qieKiDPpfttGXPB7I=;
  b=BbKMdKytuDllh0SwzKeEtMOiAMCScW51k2GHAgcfZD28eIPeCrcG43yx
   /KB5ydJoYwg4imD6SaZHfO5CUDvNQaHZkaN6266wonJwkVxMnqBCe3UTz
   y9eZSdYIjuwhwbxEcZhGiJqmpz0hiZ+qg4/m9t7rjfzDDLRQMbPuy0QYe
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W/7/T8D/ViDAgJDn2cObo/NQykH8Gh5Y19ano2ocnYNjydAsIUgdfhzWR82uovqa5DX+Ym2huR
 o6kVRM5zvEOjOHOWwod5unIXwlIpB00rhmxSRwqareHQpKtU9SBy0PHF2zRMB5au5fjPDck6UD
 0oyn2VPuWzvLryjm6dWw6anp2ARN264hzLjg0euYQStUT7gR4N937HdnNOnzGCWI+2zPMqCe+W
 rpHm/MjyJzWwh8P/lPNm9d90XUZcgosvuGHdcPxjHLV2/xa+LKgVvcCYVpHbCPMPdttIB+Mpkx
 MKc=
X-SBRS: 5.2
X-MesageID: 34332905
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34332905"
Subject: Re: [PATCH] x86/mem_sharing: silence ubsan warning
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0405f97f-ee4f-6379-c0f4-3db149386bc2@citrix.com>
Date: Mon, 4 Jan 2021 12:31:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 03/01/2021 18:47, Tamas K Lengyel wrote:
> Running Xen compiled with UBSAN produces a warning for mismatched size. It's
> benign but this patch silences the warning.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index c428fd16ce..6920077dbf 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1638,7 +1638,10 @@ static int fork_hap_allocation(struct domain *cd, struct domain *d)
>      rc = hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted);
>      paging_unlock(cd);
>  
> -    return preempted ? -ERESTART : rc;
> +    if ( preempted )
> +        rc = -ERESTART;
> +
> +    return rc;

I can't repro this at all, even with some simplified examples.

-ERESTART is int (it is an enum constant in C files), as is rc, so I
can't spot a legitimate UBSAN complaint here.

Which compiler, and/or do you have the exact complaint available?

~Andrew

