Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDABC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 09:10:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D263C22285
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 09:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D263C22285
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69470.124339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QXu-0003Ft-A7; Mon, 18 Jan 2021 09:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69470.124339; Mon, 18 Jan 2021 09:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QXu-0003Fm-6w; Mon, 18 Jan 2021 09:09:58 +0000
Received: by outflank-mailman (input) for mailman id 69470;
 Mon, 18 Jan 2021 09:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1QXt-0003Fe-4j
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:09:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b2800fa-91f2-42ee-bc1d-70c33b80ff76;
 Mon, 18 Jan 2021 09:09:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62282ACF4;
 Mon, 18 Jan 2021 09:09:55 +0000 (UTC)
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
X-Inumbo-ID: 5b2800fa-91f2-42ee-bc1d-70c33b80ff76
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610960995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qxhGDHI1HvPISsKluhf3pThKIorGhbLjGga87mJBOc=;
	b=J+UQbgUautNrb4sz6boNYDI0VPY/zL/W0qZclR5XdDSCPegOt/Hy7F8bLzbUep3wOxHwzx
	dFV6FDdGenYvf8uhn9ZvGUp+FrYY4QRwCQPRV7VXsN5RZN3nYmAam/GjYyHdmOPkqSKqIm
	ohV4uLzyNb0/w9bwsd8vob95UTjiU54=
Subject: Re: [PATCH] x86/mem_sharing: silence ubsan warning
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
 <0405f97f-ee4f-6379-c0f4-3db149386bc2@citrix.com>
 <CABfawhnGC2S3StnzcCkS0bQr3h_J1=i6LE7ma8vkZYJK_WoQuQ@mail.gmail.com>
 <CABfawh=7A8HAU9Jh5MU9UPApUOLJM1VbdghVC7PGn2VbodRdLw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <857cda4e-e31e-c98c-cd67-c9175d3f6cc4@suse.com>
Date: Mon, 18 Jan 2021 10:09:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=7A8HAU9Jh5MU9UPApUOLJM1VbdghVC7PGn2VbodRdLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.01.2021 02:38, Tamas K Lengyel wrote:
> On Mon, Jan 4, 2021 at 12:21 PM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>>
>> On Mon, Jan 4, 2021 at 7:31 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>
>>> On 03/01/2021 18:47, Tamas K Lengyel wrote:
>>>> Running Xen compiled with UBSAN produces a warning for mismatched size. It's
>>>> benign but this patch silences the warning.
>>>>
>>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>>> ---
>>>>  xen/arch/x86/mm/mem_sharing.c | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
>>>> index c428fd16ce..6920077dbf 100644
>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>> @@ -1638,7 +1638,10 @@ static int fork_hap_allocation(struct domain *cd, struct domain *d)
>>>>      rc = hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted);
>>>>      paging_unlock(cd);
>>>>
>>>> -    return preempted ? -ERESTART : rc;
>>>> +    if ( preempted )
>>>> +        rc = -ERESTART;
>>>> +
>>>> +    return rc;
>>>
>>> I can't repro this at all, even with some simplified examples.
>>>
>>> -ERESTART is int (it is an enum constant in C files), as is rc, so I
>>> can't spot a legitimate UBSAN complaint here.
>>>
>>> Which compiler, and/or do you have the exact complaint available?
>>
>> It was with gcc-7 on debian buster but can't recreate it after a make
>> clean & make, it's now gone ¯\_(ツ)_/¯, seems like it was just a bad
>> build. Sorry for the noise.
> 
> In a recent build with gcc-10 I got the warning again:
> 
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in mem_sharing.c:1659:34
> (XEN) load of value 6 is not a valid value for type '_Bool'

Isn't this rather referring to the value found in "preempted"?
After all neither 6 nor -6 is related to ERESTART. If so, your
proposed change would paper over an issue elsewhere and the
issue would be liable to show up again when the if() gains
similar treatment to the conditional operator by the compiler.

And indeed, looking at the two functions the issue appears to
be that hap_set_allocation() only ever writes "true" to
*preempted, while fork_hap_allocation() fails to initialize
its variable to "false".

Jan

