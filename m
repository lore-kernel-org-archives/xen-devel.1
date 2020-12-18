Return-Path: <SRS0=cMO7=FW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F22CC4361B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 13:58:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0B723A9F
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 13:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB0B723A9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56519.98993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqGH6-000138-4j; Fri, 18 Dec 2020 13:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56519.98993; Fri, 18 Dec 2020 13:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqGH6-000131-1e; Fri, 18 Dec 2020 13:58:28 +0000
Received: by outflank-mailman (input) for mailman id 56519;
 Fri, 18 Dec 2020 13:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP3M=FW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kqGH5-00012u-30
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 13:58:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e38f7502-b5f3-489a-a7db-233305f8f86a;
 Fri, 18 Dec 2020 13:58:25 +0000 (UTC)
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
X-Inumbo-ID: e38f7502-b5f3-489a-a7db-233305f8f86a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608299905;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bPk7JmgfQ2TY/TAcyUiq/DCeSRf+2wqwb71nVJq4/OE=;
  b=ML5t33qUz/K9+VzjpzdLWORo39nkbNzpNJg0haF8hqj/b/R8hQPihOMK
   Faqg0KMGuoBf9PyVS7Arrdfkfok9qdyA7roW7UNs+UDtdDc7Yx7g+4Uzh
   racf0XUXjPVfygZQmIQWr9Ao8C7jtYhwGk8+Mnuxct90BUITj521CRGX0
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: S7jw0Ff2I5FRGxVWvD8CaTGXEoK5ljSNye9a4L5+btRtzd9YEhJjdjOnNtuGY+lvm7Yk4blkkS
 c+omn26ucbONGvWdb3RGGP0aXM/ERIdGdoaH1DNxO5o8jyRdEKghVTu4ekP9RdDT5KxyOCjNMz
 2UnUEUUd5DN2S9HIQA38yVvfFqO139efNh8BziwzkMWQu9IJahiaVq3RN1UzjvjDTPuecL0IsH
 Lo5QOXbhmtGUxbkncfxN3fFf0pS9LAaXpNiSAFtSR8lZs1f6i2dIneQLfNhtOBZEQd2U+1KYuk
 kfM=
X-SBRS: 5.2
X-MesageID: 33571494
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,430,1599537600"; 
   d="scan'208";a="33571494"
Subject: Re: [PATCH] xen/x86: Fix memory leak in vcpu_create() error path
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan
	<tim@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>
References: <20200928154741.2366-1-andrew.cooper3@citrix.com>
 <33331c3a-1fd5-1ef6-16a3-21d2a6672e90@suse.com>
 <9556aeb3-2a7c-7aea-4386-6e561dd9ef6e@citrix.com>
 <9e652863-5ada-0327-5817-cdb2e652e066@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e26f0cc3-1893-6cd9-71b3-4e0c011318b3@citrix.com>
Date: Fri, 18 Dec 2020 13:58:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9e652863-5ada-0327-5817-cdb2e652e066@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 18/12/2020 08:27, Jan Beulich wrote:
> On 17.12.2020 22:46, Andrew Cooper wrote:
>> On 29/09/2020 07:18, Jan Beulich wrote:
>>> On 28.09.2020 17:47, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>> @@ -563,30 +563,37 @@ void hap_final_teardown(struct domain *d)
>>>>      paging_unlock(d);
>>>>  }
>>>>  
>>>> +void hap_vcpu_teardown(struct vcpu *v)
>>>> +{
>>>> +    struct domain *d = v->domain;
>>>> +    mfn_t mfn;
>>>> +
>>>> +    paging_lock(d);
>>>> +
>>>> +    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
>>>> +        goto out;
>>> Any particular reason you don't use paging_get_hostmode() (as the
>>> original code did) here? Any particular reason for the seemingly
>>> redundant (and hence somewhat in conflict with the description's
>>> "with the minimum number of safety checks possible")
>>> paging_mode_hap()?
>> Yes to both.  As you spotted, I converted the shadow side first, and
>> made the two consistent.
>>
>> The paging_mode_{shadow,hap})() is necessary for idempotency.  These
>> functions really might get called before paging is set up, for an early
>> failure in domain_create().
> In which case how would v->arch.paging.mode be non-NULL already?
> They get set in {hap,shadow}_vcpu_init() only.

Right, but we also might end up here with an error early in
vcpu_create(), where d->arch.paging is set up, but v->arch.paging isn't.

This logic needs to be safe to use at any point of partial initialisation.

(And to be clear, I found I needed both of these based on some
artificial error injection testing.)

>> The paging mode has nothing really to do with hostmode/guestmode/etc. 
>> It is the only way of expressing the logic where it is clear that the
>> lower pointer dereferences are trivially safe.
> Well, yes and no - the other uses of course should then also use
> paging_get_hostmode(), like various of the wrappers in paging.h
> do. Or else I question why we have paging_get_hostmode() in the
> first place.

I'm not convinced it is an appropriate abstraction to have, and I don't
expect it to survive the nested virt work.

> There are more examples in shadow code where this
> gets open-coded when it probably shouldn't be. There haven't been
> any such cases in HAP code so far ...

Doesn't matter.  Its use here would obfuscate the code (this is one part
of why I think it is a bad abstraction to begin with), and if the
implementation ever changed, the function would lose its safety.

> Additionally (noticing only now) in the shadow case you may now
> loop over all vCPU-s in shadow_teardown() just for
> shadow_vcpu_teardown() to bail right away. Wouldn't it make sense
> to retain the "if ( shadow_mode_enabled(d) )" there around the
> loop?

I'm not entirely convinced that was necessarily safe.  Irrespective, see
the TODO.  The foreach_vcpu() is only a stopgap until some cleanup
structure changes come along (which I had queued behind this patch anyway).

~Andrew

