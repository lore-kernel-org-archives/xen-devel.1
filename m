Return-Path: <SRS0=3DVc=65=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910B6C433E2
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2020 15:15:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706CF207C4
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2020 15:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706CF207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZc3K-0008WV-7a; Fri, 15 May 2020 15:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZc3I-0008WQ-Ht
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 15:15:08 +0000
X-Inumbo-ID: dc357d7a-96be-11ea-a585-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc357d7a-96be-11ea-a585-12813bfff9fa;
 Fri, 15 May 2020 15:15:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E91E1AC6E;
 Fri, 15 May 2020 15:15:08 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] x86/mem-paging: correct p2m_mem_paging_prep()'s
 error handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
 <2cccf9bb-3930-436d-65de-f0eb7dd0c498@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83f6463c-6a61-e79b-cf1b-77589ef287c1@suse.com>
Date: Fri, 15 May 2020 17:15:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2cccf9bb-3930-436d-65de-f0eb7dd0c498@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.05.2020 16:40, Andrew Cooper wrote:
> On 23/04/2020 09:37, Jan Beulich wrote:
>> @@ -1816,9 +1816,19 @@ int p2m_mem_paging_prep(struct domain *d
>>              goto out;
>>          /* Get a free page */
>>          ret = -ENOMEM;
>> -        page = alloc_domheap_page(p2m->domain, 0);
>> +        page = alloc_domheap_page(d, 0);
>>          if ( unlikely(page == NULL) )
>>              goto out;
>> +        if ( unlikely(!get_page(page, d)) )
>> +        {
>> +            /*
>> +             * The domain can't possibly know about this page yet, so failure
>> +             * here is a clear indication of something fishy going on.
>> +             */
> 
> This needs a gprintk(XENLOG_ERR, ...) of some form.  (which also reminds
> me that I *still* need to finish my patch forcing everyone to provide
> something to qualify the domain crash, so release builds of Xen get some
> hint as to what went on or why.)

First of all - I've committed the patch earlier today, with Roger's
R-b, and considering that it had been pending for quite some time.

As to the specific aspect:

>> +            domain_crash(d);

This already leaves a file/line combination as a (minimal hint). I
can make a patch to add a gprintk() as you ask for, but I'm not
sure it's worth it for this almost dead code.

>> @@ -1843,13 +1852,24 @@ int p2m_mem_paging_prep(struct domain *d
>>      ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
>>                          paging_mode_log_dirty(d) ? p2m_ram_logdirty
>>                                                   : p2m_ram_rw, a);
>> -    set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
>> +    if ( !ret )
>> +    {
>> +        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
>>  
>> -    if ( !page_extant )
>> -        atomic_dec(&d->paged_pages);
>> +        if ( !page_extant )
>> +            atomic_dec(&d->paged_pages);
>> +    }
>>  
>>   out:
>>      gfn_unlock(p2m, gfn, 0);
>> +
>> +    if ( page )
>> +    {
>> +        if ( ret )
>> +            put_page_alloc_ref(page);
>> +        put_page(page);
> 
> This is a very long way from clear enough to follow, and buggy if anyone
> inserts a new goto out path.

What alternatives do you see?

Jan

