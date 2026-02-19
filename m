Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973FBE9A048
	for <xen-devel@archiver.kernel.org>; Thu, 19 Feb 2026 12:35:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1236212.1538950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3FH-0005cg-OX; Thu, 19 Feb 2026 12:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236212.1538950; Thu, 19 Feb 2026 12:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3FH-0005cZ-Ln; Thu, 19 Feb 2026 12:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1236212;
 Thu, 19 Feb 2026 12:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vt3FG-0005cT-8D
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 12:35:02 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67387bfd-0d8f-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 13:35:00 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771504484423733.3181470285288;
 Thu, 19 Feb 2026 04:34:44 -0800 (PST)
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
X-Inumbo-ID: 67387bfd-0d8f-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771504486; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lBepdT/Ew5vZqsL1fXGwvGxejPXdmhZByteLxv/5t36CwgqzF7lnTugvFtJsSRDvhKCBVbiylcrvEMSwl86MnczXe4WVoRu69MiZcblNFH+vuy5Cf6ijU/B5BbivREVqSyLZlHK4GBYBk0otNwZ8MwABiMLCzspEFzFoE/S7YSo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771504486; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F1wZfFOs0/T43vHPOK5xak/XPmakW0Otq8nN80dcJhE=; 
	b=RzmQhtbfLQnQUjCSiMdSjX/B7g6l8aJjoUe/vsquDLm7L2POTsFZIs/s6Yo3xrLyT+T6yB47snGM5akJne6ARm13gfU42Yf3yN8pnguAUL1iyRnpvBlUDba2BefwZvlO+xHujxMHG3nOJ3R6ZImVUkddggtCqzTh9xJh1x2HbQ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771504486;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=F1wZfFOs0/T43vHPOK5xak/XPmakW0Otq8nN80dcJhE=;
	b=us9n8T2XRdNjx7DZyMl/dXWWcfCvN75IP7IPkf0gXXXre4uUpgjmslZ2Qa8PenRV
	kyiwsfzM99SnKzLNxkYu8s4hhaFVta5ff68E9NXyFjvhz7H7bO7Yjng7fN2egIEchhD
	4kZt9D+lb8dsAgh/bokIZa90dWY27ya2O9UDlP40=
Message-ID: <e176fc10-bc1a-40fe-a129-dc862e964761@apertussolutions.com>
Date: Thu, 19 Feb 2026 07:34:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <afc94229-16d9-442b-974c-9f038f2300a1@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <afc94229-16d9-442b-974c-9f038f2300a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/19/26 06:11, Jan Beulich wrote:
> On 18.02.2026 20:08, Daniel P. Smith wrote:
>> @@ -238,28 +242,39 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>   
>>       while ( dom_state_changed )
>>       {
>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
>>           if ( dom >= DOMID_FIRST_RESERVED )
>>               break;
>> +
>> +        d = rcu_lock_domain_by_id(dom);
>> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
>> +        {
>> +            rcu_unlock_domain(d);
>> +            d = NULL;
> 
> This looks unnecessary; the next loop iteration will set d unconditionally,
> and d isn't (and wasn't) used past the loop. Plus there is also no such
> clearing after the other rcu_unlock_domain().
> 

If the src domain didn't have the permission on any of the target 
domains, then *d will leak the last domain checked back to the caller. 
While I didn't see it being used after the call site, it's a good 
principle not to leak from a function an object for which access was denied.

This is not an issue for the later location where rcu_unlock_domain() is 
called, because at that point the src domain does have domain state 
privilege for the target domain.

>> +            continue;
>> +        }
> 
> This cleanup here also is redundant with the one done further down. Imo where
> possible we should prefer to have only a single such instance, which looks to
> be easily possible by using ...
> 
>>           if ( test_and_clear_bit(dom, dom_state_changed) )
> 
> 
>          if ( (!d || !xsm_get_domain_state(XSM_XS_PRIV, d)) &&
>               test_and_clear_bit(dom, dom_state_changed) )
> 
> or
> 
>          if ( (d && xsm_get_domain_state(XSM_XS_PRIV, d)) ||
>               !test_and_clear_bit(dom, dom_state_changed) )
>          {
>               ...
>               continue;
>          }
> 
> albeit then the reduction of indentation of the subsequent code would cause
> quite a bit more code churn.
> 

I would prefer the latter to keep the clearing of d to NULL only when 
access was denied.

>>           {
>>               *domid = dom;
>>   
>> -            d = rcu_lock_domain_by_id(dom);
>> -
>>               if ( d )
>>               {
>>                   set_domain_state_info(info, d);
>> -
>>                   rcu_unlock_domain(d);
>>               }
>>               else
>>                   memset(info, 0, sizeof(*info));
>>   
>>               rc = 0;
>> -
>>               break;
> 
> I don't think the blank lines need dropping for the purpose of the patch?
> Yes, they may seem excessive, but nevertheless some prefer to have rather
> too many of them than too few. (Personally I don't mind their removal,
> but that really doesn't look to belong here.)
> 

Okay, but as you state above, with the compounding of the if statement, 
the indentation will go away and the whole section will a remove/add 
section to the diff. Would you still want the line spacing maintained?

>>           }
>> +
>> +        if ( d )
>> +        {
>> +            rcu_unlock_domain(d);
>> +            d = NULL;
>> +        }
>>       }
>>   
>>    out:
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -860,12 +860,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>           break;
>>   
>>       case XEN_DOMCTL_get_domain_state:
>> -        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
>> -        if ( ret )
>> -            break;
>> -
>> -        copyback = 1;
>>           ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
>> +        if ( !ret )
>> +            copyback = 1;
> 
> Nit: As you need to touch this, please switch to using "true".

Just to be clear, you mean switching to a conditional statement vs 
testing for not zero?

v/r,
dps

