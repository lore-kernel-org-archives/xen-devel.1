Return-Path: <SRS0=azK0=I5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EFBC433B4
	for <xen-devel@archiver.kernel.org>; Wed, 31 Mar 2021 15:24:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F30760725
	for <xen-devel@archiver.kernel.org>; Wed, 31 Mar 2021 15:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F30760725
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103998.198421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRchV-0007sB-PC; Wed, 31 Mar 2021 15:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103998.198421; Wed, 31 Mar 2021 15:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRchV-0007s4-LX; Wed, 31 Mar 2021 15:24:09 +0000
Received: by outflank-mailman (input) for mailman id 103998;
 Wed, 31 Mar 2021 15:24:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRchU-0007rz-IM
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 15:24:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f87977e7-8225-427d-83a8-f6f88007e537;
 Wed, 31 Mar 2021 15:24:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88074B02A;
 Wed, 31 Mar 2021 15:24:06 +0000 (UTC)
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
X-Inumbo-ID: f87977e7-8225-427d-83a8-f6f88007e537
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617204246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kyThAaDQClUp3NuwHF6UpoU3ZCInu+cosD9+lU6rEE=;
	b=DvUvEoS/EJJPH8fh/Wl7fDBTrK6T70NBcVcJJR0i717d6os6XRKrbHeX97Yj/uYb/8+kqK
	HpbO2Vxqc232I1xJVU0a175MzjYrvWSLC8yBfyB285Dy/+9NB8FujhdDpOdRB05yjOczzD
	OWj/t2g2htpthAiV71eW7p9qWkQ+dOE=
Subject: Re: [PATCH 15/21] libs/guest: obtain a compatible cpu policy from two
 input ones
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-16-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f66e61d5-e4a0-cba3-f15c-73ca54ac4964@suse.com>
Date: Wed, 31 Mar 2021 17:24:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-16-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> Introduce a helper to obtain a compatible cpu policy based on two
> input cpu policies. Currently this is done by and'ing all CPUID leaves
> and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
> bit or'ed.

I'm afraid this is too simplistic. It might do as an initial
approximation if limited to the feature flag leaves, but you
can't reasonably AND together e.g. leaf 0 output.

> @@ -1115,3 +1116,117 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
>  
>      return false;
>  }
> +
> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> +{
> +    uint64_t val;
> +
> +    switch( index )
> +    {
> +    case MSR_ARCH_CAPABILITIES:
> +        val = val1 & val2;

Considering you need this even here, how about making this the
initializer of the variable, allowing to drop "default:"
altogether?

Also, nit: Missing blank after "switch".

> +    index = 0;
> +    for ( i = 0; i < p1_nr_leaves; i++ )
> +        for ( j = 0; j < p2_nr_leaves; j++ )
> +            if ( p1_leaves[i].leaf == p2_leaves[j].leaf &&
> +                 p1_leaves[i].subleaf == p2_leaves[j].subleaf )
> +            {
> +                leaves[index].leaf = p1_leaves[i].leaf;
> +                leaves[index].subleaf = p1_leaves[i].subleaf;
> +                leaves[index].a = p1_leaves[i].a & p2_leaves[j].a;
> +                leaves[index].b = p1_leaves[i].b & p2_leaves[j].b;
> +                leaves[index].c = p1_leaves[i].c & p2_leaves[j].c;
> +                leaves[index].d = p1_leaves[i].d & p2_leaves[j].d;
> +                index++;
> +            }
> +    nr_leaves = index;
> +
> +    index = 0;
> +    for ( i = 0; i < p1_nr_msrs; i++ )
> +        for ( j = 0; j < p2_nr_msrs; j++ )
> +            if ( p1_msrs[i].idx == p2_msrs[j].idx )
> +            {
> +                msrs[index].idx = p1_msrs[i].idx;
> +                msrs[index].val = level_msr(p1_msrs[i].idx,
> +                                            p1_msrs[i].val, p2_msrs[j].val);
> +                index++;
> +            }
> +    nr_msrs = index;

Mid- to long-term I'd be afraid of this going to take too long for
at least the MSRs. Can't we build on some similarity in the ordering
of both arrays, to avoid the double for()s?

Jan

