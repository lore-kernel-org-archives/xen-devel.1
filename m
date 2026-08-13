Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D390C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 13:06:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390036.1630604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV8J-0008Jh-0h; Thu, 13 Aug 2026 13:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390036.1630604; Thu, 13 Aug 2026 13:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV8I-0008Ja-UL; Thu, 13 Aug 2026 13:06:06 +0000
Received: by outflank-mailman (input) for mailman id 1390036;
 Thu, 13 Aug 2026 13:06:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wuV8H-0008JU-Pp
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:06:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuV8H-00D9y6-6V
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:06:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dc123-bab6-0a2a0a5309dd-0a2a4504c416-40
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:06:05 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a7dc137-b57f-0a2a45040019-888fbc3352c1-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:06:01 +0200
Received: by mx.zohomail.com with SMTPS id 1786626347572260.334875759615;
 Thu, 13 Aug 2026 06:05:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1786626350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LiUSGrmhk2ZhvxRfEFpgKDlczechpijQwejuBUmUWCPqyEK6UBWozlhj4js6lPZYf97Om800VALQ2PW2VLypI2FhG0E0Pl4NA8cL5IqMmQWDmJjKPQuCEsGeJ3tdLrahkk1F8ryONfIws3tOQ1x6BTwzCkF8oivl2yvTJxFbEnQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786626350; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kXW7GqtSaqRdViB1IIgSUOxZ0Dvm1wRhEC//zZj7GcU=; 
	b=AQD+gDfYuxVRq9BmzFBOj6u/ZWVbnSpnsh5by0/h/KjMyH3FknXohcAr/wklynOpeOVCRIZjfZCkMN5NULR2Rzo6TnKI4uSEwIh10Fk7uLVnYDMyNPbhymp61bepq7kJUb+qtVZVY75ChMwnLe2c52MXJHJCW9fR6HAipjWc9+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786626349;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kXW7GqtSaqRdViB1IIgSUOxZ0Dvm1wRhEC//zZj7GcU=;
	b=SvcSVIoFzMq1Gku6+lMtOnAAcUaoquc3hKti12y30KQBKPjfQukuoaZgtMsK9JMQ
	4UkM94c6YoF+jG60df/T6c7YZo0UahxVC6UglrGF0ceZ/LhiQgwYTAu4YL0SJPYoZgD
	XSxsiD1cyM3n6sRfRRrIOF19KpaPEVJtbvLT8egM=
Message-ID: <7b70fa40-0b1b-4c84-b6a7-d4505e2af0de@apertussolutions.com>
Date: Thu, 13 Aug 2026 09:05:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] XSM: fold xsm_{,un}map_domain_pirq() hooks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
 <f99a285e-bd3d-4d8d-94ef-997c238c7f85@apertussolutions.com>
 <274a27cb-13f0-47c3-aa73-1534925dc350@suse.com>
 <7828588f-38d7-4039-95c3-8ffd386a8509@apertussolutions.com>
 <9e1a3252-c126-4c09-8425-feee14a1237b@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9e1a3252-c126-4c09-8425-feee14a1237b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1786626361-C26CAB50-B76F904E/0/0
X-purgate-type: clean
X-purgate-size: 3023



On 8/13/26 9:02 AM, Jan Beulich wrote:
> On 13.08.2026 14:42, Daniel P. Smith wrote:
>> On 8/6/26 3:36 AM, Jan Beulich wrote:
>>> On 06.08.2026 03:10, Daniel P. Smith wrote:
>>>> On 7/28/26 9:23 AM, Jan Beulich wrote:
>>>>> --- a/xen/xsm/flask/hooks.c
>>>>> +++ b/xen/xsm/flask/hooks.c
>>>>> @@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
>>>>>     
>>>>>     #ifdef CONFIG_HAS_PIRQ
>>>>>     
>>>>> -static int cf_check flask_map_domain_pirq(struct domain *d)
>>>>> +static int cf_check flask_map_domain_pirq(struct domain *d, bool access)
>>>>>     {
>>>>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
>>>>> -}
>>>>> -
>>>>> -static int cf_check flask_unmap_domain_pirq(struct domain *d)
>>>>> -{
>>>>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
>>>>> +    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>>>>>     }
>>>>>     
>>>>>     #endif /* CONFIG_HAS_PIRQ */
>>>>>
>>>>
>>>> I am not opposed to collapsing the calls as long as the semantic is not
>>>> lost, which I feel the reuse of the xsm_map_domain_pirq does looses it
>>>> much less provides an opportunity for confusion. Something like
>>>> xsm_domain_pirq(..., access) makes more semantic sense to me, as it
>>>> would read, grant domain pirq access T/F.
>>>
>>> In fact I was as well wondering about naming (and a possible name change)
>>> here. I decided against it because of the other hooks (touched by patch
>>> 19), which all follow a similar model of their names really more expressing
>>> the "positive" form than the "negative" one. Further, entirely losing "map"
>>> from the name also doesn't look quite right, as physdev_{,un}map_pirq() is
>>> where they're called from. To follow the naming of some of the other hook,
>>> maybe xsm_domain_pirq_mapping(..., bool map)? Possibly even with "domain"
>>> dropped from the name, fully fitting xsm_io{mem,port}_mapping()? Which
>>> would then further raise the question whether patch 19 should maybe rename
>>> the parameters of those two hooks to "map" at the same time.
>>
>> Sound like you and I were running through the same argument with
>> ourselves, except you went right and I went left.
>>
>> For me, I find the false case of xsm_map_domain_pirq(..., access) reads
>> a bit weird, "Can the target map domain pirq access=false?" I do like
>> your mapping suggestion along with the parameter rename to map. It
>> changes the reading to "Is target allowed map(true)/unmap(false) for the
>> domain pirq mapping?" This could be carried through to the other cases.
> 
> Will do. As to patch 19: I'm inclined to leave the parameters as "allow"
> in dummy.h, but change at least the flask_io{mem,port}_mapping() ones to
> "map". Will that be okay with you? Else what scheme would you prefer?

I am good with that. Those weren't bad, it was this one that I found 
that the original name really didn't work well with the collapse.

v/r,
dps



