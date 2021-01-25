Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332FEC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 16:32:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE10B22510
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 16:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE10B22510
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74197.133314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l44mC-0001ta-96; Mon, 25 Jan 2021 16:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74197.133314; Mon, 25 Jan 2021 16:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l44mC-0001tT-5y; Mon, 25 Jan 2021 16:31:40 +0000
Received: by outflank-mailman (input) for mailman id 74197;
 Mon, 25 Jan 2021 16:31:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l44mB-0001tO-BO
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 16:31:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1976afbd-7bf6-41c0-9d36-006fcfd1420c;
 Mon, 25 Jan 2021 16:31:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 366E4AF27;
 Mon, 25 Jan 2021 16:31:37 +0000 (UTC)
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
X-Inumbo-ID: 1976afbd-7bf6-41c0-9d36-006fcfd1420c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611592297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ow5iAOBOzr3NoUdxlAtqGTf5XcUqc6XvwHg/NcZfrs=;
	b=TvMYHX/knvge1vlwiUlaEOWLXPYzDmRIFmN8vRspYI9aVIGS/HeU831FjMaYAvNmO1EtPt
	Yad/uEBe0vSck+buvVgPE9QvyCUzT1R+X8Jp3nY1rZFIME97+VVXIkK1jnHG+w/1ph6kFW
	e6pkWB6Ea8eNZdJihWYKVZARU93CBzk=
Subject: Re: [PATCH v7 04/10] xen/memory: Add a vmtrace_buf resource type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7702d1d6-86c9-af43-c9a9-f5ec082bad2d@suse.com>
Date: Mon, 25 Jan 2021 17:31:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 22:27, Andrew Cooper wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1068,11 +1068,35 @@ static unsigned int resource_max_frames(const struct domain *d,
>      case XENMEM_resource_grant_table:
>          return gnttab_resource_max_frames(d, id);
>  
> +    case XENMEM_resource_vmtrace_buf:
> +        return d->vmtrace_frames;
> +
>      default:
>          return arch_resource_max_frames(d, type, id);
>      }
>  }
>  
> +static int acquire_vmtrace_buf(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    const struct vcpu *v = domain_vcpu(d, id);
> +    unsigned int i;
> +    mfn_t mfn;
> +
> +    if ( !v || !v->vmtrace.buf ||
> +         nr_frames > d->vmtrace_frames ||
> +         (frame + nr_frames) > d->vmtrace_frames )
> +        return -EINVAL;


I think that for this to guard against overflow, the first nr_frames
needs to be replaced by frame (as having the wider type), or else a
very large value of frame coming in will not yield the intended
-EINVAL. If you agree, with this changed,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

