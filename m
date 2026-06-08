Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C265CD6E79
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 20:02:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332050.1594684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgAX-0005Ol-CC; Mon, 08 Jun 2026 20:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332050.1594684; Mon, 08 Jun 2026 20:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgAX-0005Oe-9a; Mon, 08 Jun 2026 20:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1332050;
 Mon, 08 Jun 2026 20:01:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWgAW-0005OW-HT
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:01:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWgAV-00FAo6-UZ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:01:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a271fad-e002-0a2a0a5209dd-0a2a450b8e34-12
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:01:55 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a271fb1-212f-0a2a450b0019-888fbc3352a5-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:01:55 +0200
Received: by mx.zohomail.com with SMTPS id 1780948903681310.06137832133425;
 Mon, 8 Jun 2026 13:01:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1780948907; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n7GrCsS8aJnY7XVi8l4wHSLvV9RwBF4A0jfTwoNRs4ImTm9l8J3VeB2WH3IYPoILhp/HKiEPOMMMIAUFBhbuFmgf0mzcN3g/fvwaurB53FQUaSelysJR+8z4VlkQXv8ryIccfCvR/EUZ8Ny3ouYiSF/ij4L4d5e+MAjvUw91pEE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780948907; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sVbb64weEsi9fQUfpudjFmtAY89A5xkBgUiio/briYU=; 
	b=bo5WmW/evMc0PRFM05GxnrjjwA9q4lGbZiAPkpjw0lAxlJzU10paAcPLBVyvIioQYVDSHXMJjMthjStW5nYQnctEnCuQj4sk8kCLyzDtMcMgTOoq7SiMV98fdhP4Igk//iiKXaVN/h9TSLokRTBv1ge21Voy+lg5FwSE+rRDrBc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780948906;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sVbb64weEsi9fQUfpudjFmtAY89A5xkBgUiio/briYU=;
	b=NIq6AAbfo2rw8CHYwVoG+74Ih+nuZ9f0KhQ6AtH/ZG/Ke9Ij7uttBdg7HVavB4HI
	pWIBoWTTsKIZp4JCZJmvzAtp1WE9Kab1YUmZv3azPQz7HxOzQ5E+0VlTHpoul9pxIHX
	gY7s50OPHKUAG/fSn73ZAXW5fRXrWaycszbF4xpc=
Message-ID: <1524a72e-b531-46cc-9a7d-64e8aa20d72d@apertussolutions.com>
Date: Mon, 8 Jun 2026 16:01:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] argo: correct logline in ring_unmap()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com,
 Mykola Kvach <mykola_kvach@epam.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-3-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-42698a/1780948915-1B374F3B-C57D0060/0/0
X-purgate-type: clean
X-purgate-size: 1215


On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Drop XENLOG_ERR from the logline since argo_dprintk() already injects
> the proper log level indicator.
> 
> Also, drop "argo: " prefix, since it is also injected by argo_dprintk()
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes since v2:
> - n/a
> ---
>   xen/common/argo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 98a3db7fd070..5da14c929e14 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -474,7 +474,7 @@ ring_unmap(const struct domain *d, struct argo_ring_info *ring_info)
>               continue;
>   
>           ASSERT(!mfn_eq(ring_info->mfns[i], INVALID_MFN));
> -        argo_dprintk(XENLOG_ERR "argo: unmapping page %"PRI_mfn" from %p\n",
> +        argo_dprintk("unmapping page %"PRI_mfn" from %p\n",
>                        mfn_x(ring_info->mfns[i]), ring_info->mfn_mapping[i]);
>   
>           unmap_domain_page_global(ring_info->mfn_mapping[i]);

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

