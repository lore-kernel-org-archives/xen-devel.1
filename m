Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52088C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 08:06:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC0F61153
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 08:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBC0F61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115092.219415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUM4-0000nB-Ux; Thu, 22 Apr 2021 08:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115092.219415; Thu, 22 Apr 2021 08:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUM4-0000n4-Rt; Thu, 22 Apr 2021 08:06:32 +0000
Received: by outflank-mailman (input) for mailman id 115092;
 Thu, 22 Apr 2021 08:06:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZUM4-0000mz-5E
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:06:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8607b41f-53a5-433a-840f-2c05ce48c5f9;
 Thu, 22 Apr 2021 08:06:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EF53B011;
 Thu, 22 Apr 2021 08:06:30 +0000 (UTC)
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
X-Inumbo-ID: 8607b41f-53a5-433a-840f-2c05ce48c5f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619078790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLaw38itUV8ekonOYsPv8OLtOA/Fwt7kCXWA1t6Hx7Q=;
	b=XdMNwXFGMJtmj/eKJxZRMzInCrls6dyzBRszSTrDvzY4QOaoQjWKqxoRnLhyR8Lr+Hqneg
	khlBFyhj0Lbnqc4oRh+44j5aplJ0yPIo3ZoBfzBl616+lgXXGx7SIpbg8Ni4ejweHAZ3HE
	ggHW7hQ/W9pqdRciEIlLSB0g5S+lRxY=
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
 <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
 <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
 <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
 <ADF98BE7-02CA-48C1-B0CF-E4C7B4C0E828@arm.com>
 <dbcf10ef-0d40-a687-d242-f01a01bca342@suse.com>
 <91B2399E-2E91-44A9-A5F2-C55F42F52F52@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62112712-7ace-3cad-8bc5-b5656fdd42f8@suse.com>
Date: Thu, 22 Apr 2021 10:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <91B2399E-2E91-44A9-A5F2-C55F42F52F52@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 09:39, Luca Fancellu wrote:
>> On 20 Apr 2021, at 11:27, Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.04.2021 11:42, Luca Fancellu wrote:
>>>> On 20 Apr 2021, at 10:14, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 20.04.2021 10:46, Luca Fancellu wrote:
>>>>>> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 19.04.2021 11:12, Luca Fancellu wrote:
>>>>>>> - */
>>>>>>> -
>>>>>>> -/*
>>>>>>> - * Reference to a grant entry in a specified domain's grant table.
>>>>>>> - */
>>>>>>> -typedef uint32_t grant_ref_t;
>>>>>>
>>>>>> Why does this get moved ...
>>>>>>
>>>>>>> -
>>>>>>> -/*
>>>>>>> + *
>>>>>>> * A grant table comprises a packed array of grant entries in one or more
>>>>>>> * page frames shared between Xen and a guest.
>>>>>>> + *
>>>>>>> * [XEN]: This field is written by Xen and read by the sharing guest.
>>>>>>> + *
>>>>>>> * [GST]: This field is written by the guest and read by Xen.
>>>>>>> + *
>>>>>>> + * @addtogroup grant_table Grant Tables
>>>>>>> + * @{
>>>>>>> */
>>>>>>>
>>>>>>> -/*
>>>>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>>>> +/**
>>>>>>> + * Reference to a grant entry in a specified domain's grant table.
>>>>>>> */
>>>>>>> +typedef uint32_t grant_ref_t;
>>>>>>
>>>>>> ... here, past a comment unrelated to it?
>>>>>
>>>>> The comment “Version 1 of the grant table entry […]” was moved on top of the struct grant_entry_v1, in this way
>>>>> Doxygen associate the comment to that structure.
>>>>>
>>>>> The comment “Reference to a grant entry in a specified domain's grant table.” Is moved on top of typedef uint32_t grant_ref_t
>>>>> for the same reason above
>>>>
>>>> But it's the other comment ("A grant table comprises ...") that I
>>>> was asking about.
>>>
>>> I thought it was part of the brief about grant tables, am I wrong? For that reason I moved it.
>>
>> Well, the comment talks about grant table entries (the layout of which
>> gets defined immediately below, as visible in the original patch), not
>> grant references.
> 
> Hi Jan,
> 
> Of course this can be reverted back if it is wrong. 
> 
> I’ve prepared a page with the output of all my commits (some of them are not yet in the ML),
> so anyone can have a look on what is the output and how can sphinx+doxygen improve
> the quality of the documentation.
> 
> Here: 
> 
> https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/arm64.html

The doc looks fine in this regard, but the C header should remain
properly ordered as well.

>>>>>>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>>>>>>    * In that case, the frame field has the same semantics as the
>>>>>>>    * field of the same name in the V1 entry structure.
>>>>>>>    */
>>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>>   struct {
>>>>>>>       grant_entry_header_t hdr;
>>>>>>>       uint32_t pad0;
>>>>>>>       uint64_t frame;
>>>>>>>   } full_page;
>>>>>>> +    /** @endcond */
>>>>>>>
>>>>>>>   /*
>>>>>>>    * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>>>>>>    * @domid is allowed to access bytes [@page_off,@page_off+@length)
>>>>>>>    * in frame @frame.
>>>>>>>    */
>>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>>   struct {
>>>>>>>       grant_entry_header_t hdr;
>>>>>>>       uint16_t page_off;
>>>>>>>       uint16_t length;
>>>>>>>       uint64_t frame;
>>>>>>>   } sub_page;
>>>>>>> +    /** @endcond */
>>>>>>>
>>>>>>>   /*
>>>>>>>    * If the grant is GTF_transitive, @domid is allowed to use the
>>>>>>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>>>>>>    * The current version of Xen does not allow transitive grants
>>>>>>>    * to be mapped.
>>>>>>>    */
>>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>>   struct {
>>>>>>>       grant_entry_header_t hdr;
>>>>>>>       domid_t trans_domid;
>>>>>>>       uint16_t pad0;
>>>>>>>       grant_ref_t gref;
>>>>>>>   } transitive;
>>>>>>> +    /** @endcond */
>>>>>>
>>>>>> While already better than the introduction of strange struct tags,
>>>>>> I'm still not convinced we want this extra clutter (sorry). Plus -
>>>>>> don't these additions mean the sub-structures then won't be
>>>>>> represented in the generated doc, rendering it (partly) useless?
>>>>>
>>>>> Are you suggesting to remove the structure from docs?
>>>>
>>>> Just yet I'm not suggesting anything here - I was merely guessing at
>>>> the effect of "@cond" and the associated "skip ..." to mean that this
>>>> construct makes doxygen skip the enclosed section. If that's not the
>>>> effect, then maybe the comment wants rewording? (And then - what does
>>>> @cond mean?)
>>>
>>> Yes you were right, in the documentation the structure grant_entry_v2 won’t display the
>>> anonymous union.
>>
>> In which case I'm now completely unclear about your prior question.
> 
> We have to choose just if the struct is useful even if it’s partially documented or if
> it’s better to hide it completely from the docs since it can’t be fully documented.

I've never suggested to hide it completely (aiui doing so would
mean widening the scope of the @cond, i.e. there would still be
extra clutter). Instead I was trying to suggest to make sure the
struct gets fully documented despite the absence of struct tags.

Jan

