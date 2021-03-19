Return-Path: <SRS0=uIhg=IR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF61AC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 19 Mar 2021 11:26:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8510864F6D
	for <xen-devel@archiver.kernel.org>; Fri, 19 Mar 2021 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8510864F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.99174.188403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDGH-0003HC-KG; Fri, 19 Mar 2021 11:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99174.188403; Fri, 19 Mar 2021 11:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDGH-0003H5-Gf; Fri, 19 Mar 2021 11:25:49 +0000
Received: by outflank-mailman (input) for mailman id 99174;
 Fri, 19 Mar 2021 11:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai2o=IR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lNDGH-0003H0-1G
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 11:25:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2e306f-e8d4-4871-9f35-c569a93774a8;
 Fri, 19 Mar 2021 11:25:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B553AE05;
 Fri, 19 Mar 2021 11:25:47 +0000 (UTC)
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
X-Inumbo-ID: ea2e306f-e8d4-4871-9f35-c569a93774a8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616153147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gX7dBS8PxOqB1DHdSEvhEbIqa4PyVCfh0UAbbhQCg3E=;
	b=J8Jq+P+ryR8k3dNIDTRk+kbGkTaEFc3Qlv6BFTsgcYp+8DtNBtKdVxQsxKHa5a8AmQMB6e
	myvdhpvT/DPIKN3WPxBre9zOaojAu0KSXaE048L5P/z9GD1pZWtAwNN5RA4txdF1rN4Nsr
	FEveI5Zl8v8mGOgSSrgvEJiaXNLEWsI=
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
 <193bfae5-a80a-d02a-377d-c9e11ad038a8@suse.com>
 <CABfawhmaUXSJkEG3hOQGFHMD=anN5Vs-uGosXP2NDTUDS2HDvA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <960d2a7a-7be0-58f8-56cc-26d1fa90b7a0@suse.com>
Date: Fri, 19 Mar 2021 12:25:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmaUXSJkEG3hOQGFHMD=anN5Vs-uGosXP2NDTUDS2HDvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.03.2021 12:06, Tamas K Lengyel wrote:
> On Fri, Mar 19, 2021, 6:23 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 18.03.2021 22:36, Tamas K Lengyel wrote:
>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>> @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct
>> domain *d)
>>>          return rc;
>>>
>>>      copy_tsc(cd, d);
>>> +    p2m_get_hostp2m(cd)->max_mapped_pfn =
>> p2m_get_hostp2m(d)->max_mapped_pfn;
>>
>> Makes sense to me, yes, but then an immediate question is: What
>> about the somewhat similar {min,max}_remapped_gfn fields? Which
>> of course implies the more general question of how alternate
>> p2m-s (are supposed to) get treated in the first place. From my
>> looking at it, fork() doesn't appear to also fork those, but
>> also doesn't appear to refuse cloning when altp2m is in use.
>>
> 
> It's untested, forking and altp2m is not currently used simultaniously.
> Don't know if it should be restricted as not working as I haven't tested
> it. Both forking and altp2m is experimental so there be dragons. At some
> point I would like to be able to use altp2m in forks but forking a domain
> that has altp2m enabled will likely be a setup that's too insane to try to
> get working.

Well, I see only two (consistent) options - either the other two
fields mentioned get copied as well, or altp2m use results in
forking getting refused.

Jan

