Return-Path: <SRS0=ZRtW=JL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B5EC433B4
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 13:37:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BED61107
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 13:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17BED61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110627.211156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfhS-0003uP-8P; Wed, 14 Apr 2021 13:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110627.211156; Wed, 14 Apr 2021 13:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfhS-0003uI-51; Wed, 14 Apr 2021 13:36:58 +0000
Received: by outflank-mailman (input) for mailman id 110627;
 Wed, 14 Apr 2021 13:36:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWfhR-0003uD-0g
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:36:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f668348c-b336-42ee-8f8b-56c468d8ef25;
 Wed, 14 Apr 2021 13:36:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F41D0AEF8;
 Wed, 14 Apr 2021 13:36:54 +0000 (UTC)
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
X-Inumbo-ID: f668348c-b336-42ee-8f8b-56c468d8ef25
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618407415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwXYZUsNAPlU3TCDm0e4/thm+p5NJtUWnxek+st3b+c=;
	b=Ecdi9v41zn6eORTjiQA4va6umg/ccuTTdDX/ulg6smpJDXS79wj/JEOyCdGg8wLEJUZEk7
	xZ9WQeghiciM59Qbhh5RZPqQkFtZzc87Eqd3tsEoteO+1RzX+RJgzaqL3SzHUmFy49nUme
	pwvgAeOmGOAyqojdhxObxggvPpqr8j8=
Subject: Re: [PATCH v2 14/21] libs/guest: introduce helper to check cpu policy
 compatibility
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-15-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f20144fb-9ed5-1819-1d00-13506ba2178e@suse.com>
Date: Wed, 14 Apr 2021 15:36:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210413140140.73690-15-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.04.2021 16:01, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -925,3 +925,22 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
>  
>      return rc;
>  }
> +
> +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> +                                 const xc_cpu_policy_t guest)
> +{
> +    struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
> +    struct cpu_policy h = { &host->cpuid, &host->msr };
> +    struct cpu_policy g = { &guest->cpuid, &guest->msr };
> +    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
> +
> +    if ( !rc )
> +        return true;
> +
> +    if ( err.leaf != -1 )
> +        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
> +    if ( err.msr != -1 )
> +        ERROR("MSR index %#x is not compatible", err.msr);

Personally I'm against making assumptions like these ones about what
(in this case) INIT_CPU_POLICY_ERRORS actually expands to (i.e. three
times -1). I can see how alternatives to this are quickly going to
get ugly, so I'll leave it to others to judge.

Jan

