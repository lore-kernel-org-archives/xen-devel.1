Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD93C4741F
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 16:45:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5AE20704
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 16:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="uyiMOurH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B5AE20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.16065.39337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYXX6-0006Ye-2I; Fri, 30 Oct 2020 16:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16065.39337; Fri, 30 Oct 2020 16:45:44 +0000
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
	id 1kYXX5-0006YX-VW; Fri, 30 Oct 2020 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 16065;
 Fri, 30 Oct 2020 16:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYXX4-0006YS-WC
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:45:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a62748b3-0937-4bfb-ad0b-5d504495e643;
 Fri, 30 Oct 2020 16:45:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D331AFC8;
 Fri, 30 Oct 2020 16:45:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYXX4-0006YS-WC
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:45:43 +0000
X-Inumbo-ID: a62748b3-0937-4bfb-ad0b-5d504495e643
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a62748b3-0937-4bfb-ad0b-5d504495e643;
	Fri, 30 Oct 2020 16:45:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604076341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVwYz1mmi+3+Dv477cF609gV4yrRxlQ26ujOAA6fyEk=;
	b=uyiMOurHJDmGckxgMKbtxr1aUEyaD0vFisIaYWsS99LKxuZacgv+MWarI0USXqS+iMARqx
	xgukliPAmsKsqkBi3YSwWN8ZZDtk62CYYt5u69mGPWsvQ//pVH6N5nPBRsnhQzwN8CwulD
	mDZW/v5Ga/tJU+LIRNri/WLAE0GtU0M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1D331AFC8;
	Fri, 30 Oct 2020 16:45:41 +0000 (UTC)
Subject: Re: [PATCH 3/5] libxl / iommu / domctl: introduce
 XEN_DOMCTL_IOMMU_SET_ALLOCATION...
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4e9b1ff-cd0e-c90c-ff00-09f68c358617@suse.com>
Date: Fri, 30 Oct 2020 17:45:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201005094905.2929-4-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.10.2020 11:49, Paul Durrant wrote:

Just two nits, in case the op is really needed:

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -515,6 +515,14 @@ static int iommu_ctl(
>  
>      switch ( ctl->op )
>      {
> +    case XEN_DOMCTL_IOMMU_SET_ALLOCATION:
> +    {
> +        struct xen_domctl_iommu_set_allocation *set_allocation =
> +            &ctl->u.set_allocation;

const please, or drop the local variable.

> +        rc = iommu_set_allocation(d, set_allocation->nr_pages);
> +        break;
> +    }
>      default:

Blank line above here please.

Jan

