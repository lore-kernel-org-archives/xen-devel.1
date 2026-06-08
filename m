Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7496CD8CA4
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 20:03:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332055.1594694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgBu-0005xM-Lo; Mon, 08 Jun 2026 20:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332055.1594694; Mon, 08 Jun 2026 20:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgBu-0005xF-IS; Mon, 08 Jun 2026 20:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1332055;
 Mon, 08 Jun 2026 20:03:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWgBu-0005x9-2q
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:03:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWgBt-00B12K-Fk
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:03:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a271ff4-2eae-0a2a0a5409dd-0a2a4505dbca-44
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:03:21 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a272007-aaa8-0a2a45050019-888fbc3352af-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:03:21 +0200
Received: by mx.zohomail.com with SMTPS id 1780948990837219.678681917547;
 Mon, 8 Jun 2026 13:03:10 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780948992; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F4DLcMwMS3DMmkdMzHXOZOJ6TYBkcrB4S+mF0C+kthDuNYOKfw31xQU7JhOFMVIR/5UX7wHODatqUyOPFyAA7HXvbs4qmrAJprubFaNOwgOo2PMfEbV1ctKZhVM9ulun1rSKE8xJ1N0U/jUa093qWwZulwHJdr4Ia2H7F1gbS0c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780948992; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3nDwcGyJWc0QjmeFPQZFlxHYN5Ndm7fycB/h/bsWgKc=; 
	b=W18tmI0id1Q3L5yyGt7IJn+k+K8e0fdt7Tk50oyHMYf0lGHfOKVU6IvVlxjWVaFdOw1RJFEFn4PywiHf7qPehXUsAobnt/ZJP2nscvul+iZkvo0Lk7AUqUgfFnRzGeHfdirgBCvivqACL7VaOUL5yBap3jdCKY8YV7hr0wTW04Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780948992;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3nDwcGyJWc0QjmeFPQZFlxHYN5Ndm7fycB/h/bsWgKc=;
	b=tQ5j8ZruhXHkcUty2TP3oPvE6emEUKXow4o04v/wY5QyDtew4R/RjDRqF1wlVe2B
	FgqzY5e6XDHrf/I/ScUdgOSU/iXZVZkECDvqKCm6x5SRjaIIPeT+/c4HESBfPR93vPL
	Upi2CvUeM50GudqvJTf9pnjfclkhf6zGhGlyncSY=
Message-ID: <1a19ec4c-d85c-41d6-8bf5-9257b81b160d@apertussolutions.com>
Date: Mon, 8 Jun 2026 16:03:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] argo: drop argo prefix from argo_dprintk() calls
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com,
 Mykola Kvach <mykola_kvach@epam.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-4-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c201ff/1780949001-D937C443-99D1466E/0/0
X-purgate-type: clean
X-purgate-size: 2611


On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> argo_dprintk() prefixes all log lines with "argo: " automatically.
> 
> Remove duplicate prefixes from log messages in the Argo module where
> applicable.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes since v2:
> - n/a
> ---
>   xen/common/argo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 5da14c929e14..ffa1f43437ab 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -1467,7 +1467,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
>       if ( ring_info->mfns )
>       {
>           /* Ring already existed: drop the previous mapping. */
> -        argo_dprintk("argo: vm%u re-register existing ring "
> +        argo_dprintk("vm%u re-register existing ring "
>                        "(vm%u:%x vm%u) clears mapping\n",
>                        d->domain_id, ring_info->id.domain_id,
>                        ring_info->id.aport, ring_info->id.partner_id);
> @@ -1527,7 +1527,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
>       {
>           ASSERT(ring_info->nmfns == NPAGES_RING(len));
>   
> -        argo_dprintk("argo: vm%u ring (vm%u:%x vm%u) %p "
> +        argo_dprintk("vm%u ring (vm%u:%x vm%u) %p "
>                        "mfn_mapping %p len %u nmfns %u\n",
>                        d->domain_id, ring_info->id.domain_id,
>                        ring_info->id.aport, ring_info->id.partner_id, ring_info,
> @@ -1741,7 +1741,7 @@ register_ring(struct domain *currd,
>           list_add(&ring_info->node,
>                    &currd->argo->ring_hash[hash_index(&ring_info->id)]);
>   
> -        argo_dprintk("argo: vm%u registering ring (vm%u:%x vm%u)\n",
> +        argo_dprintk("vm%u registering ring (vm%u:%x vm%u)\n",
>                        currd->domain_id, ring_id.domain_id, ring_id.aport,
>                        ring_id.partner_id);
>       }
> @@ -1781,7 +1781,7 @@ register_ring(struct domain *currd,
>               goto out_unlock2;
>           }
>   
> -        argo_dprintk("argo: vm%u re-registering existing ring (vm%u:%x vm%u)\n",
> +        argo_dprintk("vm%u re-registering existing ring (vm%u:%x vm%u)\n",
>                        currd->domain_id, ring_id.domain_id, ring_id.aport,
>                        ring_id.partner_id);
>       }

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

