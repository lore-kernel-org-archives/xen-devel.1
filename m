Return-Path: <SRS0=eaQF=F2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B562C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 10:51:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2133823103
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 10:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2133823103
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57748.101157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfFk-00046f-BZ; Tue, 22 Dec 2020 10:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57748.101157; Tue, 22 Dec 2020 10:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfFk-00046Y-8R; Tue, 22 Dec 2020 10:50:52 +0000
Received: by outflank-mailman (input) for mailman id 57748;
 Tue, 22 Dec 2020 10:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krfFj-00046R-4M
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:50:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31beeb7b-083d-4d8f-949a-ab5b74e4902b;
 Tue, 22 Dec 2020 10:50:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44C6AACF1;
 Tue, 22 Dec 2020 10:50:49 +0000 (UTC)
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
X-Inumbo-ID: 31beeb7b-083d-4d8f-949a-ab5b74e4902b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608634249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZ9msnHzXOIrKSwlT5b6ErSNQh9Pxq1XTa8Z/4JrXWs=;
	b=kxGDk+XmgNBARKHVRRWMaGCmsOPZyx/gcpslPi5+fG9jR2IgeAAN3DEgwqP0vWcVpQR5g9
	Oy6xtbWn5IZcrlvymYV1rod5IuD8qEwie2Qv6PlgyY5g8e4P5hnVWxLTbmrz7lF0rqXR5d
	vrBprd5j+BeuyJ+MxE9tQAiIrWSoazE=
Subject: Re: [PATCH 1/3] xen/domain: Reorder trivial initialisation in early
 domain_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-2-andrew.cooper3@citrix.com>
 <3397707d-ba05-4db2-7dfd-e18dbe044a26@suse.com>
 <472745b0-7b9b-1412-85c7-6186711fadd8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6551c44-4fc9-480e-ed96-70e22ffb1e98@suse.com>
Date: Tue, 22 Dec 2020 11:50:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <472745b0-7b9b-1412-85c7-6186711fadd8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.12.2020 11:24, Andrew Cooper wrote:
> On 22/12/2020 10:10, Jan Beulich wrote:
>> On 21.12.2020 19:14, Andrew Cooper wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -391,25 +391,7 @@ struct domain *domain_create(domid_t domid,
>>>  
>>>      TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
>>>  
>>> -    /*
>>> -     * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
>>> -     * resources want to be sized based on max_vcpus.
>>> -     */
>>> -    if ( !is_system_domain(d) )
>>> -    {
>>> -        err = -ENOMEM;
>>> -        d->vcpu = xzalloc_array(struct vcpu *, config->max_vcpus);
>>> -        if ( !d->vcpu )
>>> -            goto fail;
>>> -
>>> -        d->max_vcpus = config->max_vcpus;
>>> -    }
>>> -
>>> -    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
>> Wouldn't this also count as "trivial initialization", and hence while
>> moving want to at least be placed ...
>>
>>> -    if ( (err = xsm_alloc_security_domain(d)) != 0 )
>>> -        goto fail;
>>> -
>>> +    /* Trivial initialisation. */
>>>      atomic_set(&d->refcnt, 1);
>>>      RCU_READ_LOCK_INIT(&d->rcu_lock);
>>>      spin_lock_init_prof(d, domain_lock);
>>> @@ -434,6 +416,27 @@ struct domain *domain_create(domid_t domid,
>>>      INIT_LIST_HEAD(&d->pdev_list);
>>>  #endif
>>>  
>>> +    /* All error paths can depend on the above setup. */
>> ... ahead of this comment?
> 
> Can do.

At which point

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

