Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C300C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 10:58:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCDA613B6
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 10:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDCDA613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116172.221787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtVs-0004bo-3R; Fri, 23 Apr 2021 10:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116172.221787; Fri, 23 Apr 2021 10:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtVr-0004bh-Vq; Fri, 23 Apr 2021 10:58:19 +0000
Received: by outflank-mailman (input) for mailman id 116172;
 Fri, 23 Apr 2021 10:58:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtVq-0004as-Tn
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:58:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7252a128-bb93-432c-be5d-c7c5f4ae0642;
 Fri, 23 Apr 2021 10:58:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94519B05E;
 Fri, 23 Apr 2021 10:58:16 +0000 (UTC)
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
X-Inumbo-ID: 7252a128-bb93-432c-be5d-c7c5f4ae0642
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1h7dIq+ewiuqz8410ZJWfplP+tNdNhZw1IeOdaurVQ=;
	b=sVvMyFmiUVUNqmwQkzvW57olf73ljfaCf6dAb6Xv3UVxtU1BBZ2GSg2rwLX13ew2i23kmQ
	H7aC5clPhKI6JKx/UYpmdmbWt7QR87/VJJhAgUABWiBSudTZUOVaMtuWw5wGa+fq17nyOS
	EPBfm+FPZMht/epJ8FHse7lzjaxz/90=
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
 <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
 <YIKYaCr13TiwxqRq@Air-de-Roger>
 <98d0b627-de38-f7a0-7487-cbf83864c82f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <135f8bc2-d07c-c531-e498-9f0e15207cca@suse.com>
Date: Fri, 23 Apr 2021 12:58:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <98d0b627-de38-f7a0-7487-cbf83864c82f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 12:51, Andrew Cooper wrote:
> On 23/04/2021 10:50, Roger Pau Monné wrote:
>> On Fri, Apr 16, 2021 at 04:20:59PM +0200, Jan Beulich wrote:
>>> On 16.04.2021 15:41, Andrew Cooper wrote:
>>>> On 16/04/2021 09:16, Jan Beulich wrote:
>>>>> clang, at the very least, doesn't like unused inline functions, unless
>>>>> their definitions live in a header.
>>>>>
>>>>> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> I agree this will fix the build.  However, looking at the code, I'm not
>>>> sure the original CONFIG_COMPAT was correct.  In particular, ...
>>>>
>>>>> --- a/xen/arch/x86/oprofile/backtrace.c
>>>>> +++ b/xen/arch/x86/oprofile/backtrace.c
>>>>> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>>>>>      return head->ebp;
>>>>>  }
>>>>>  
>>>>> +#ifdef CONFIG_COMPAT
>>>>>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>>>>  {
>>>>>      if (is_hvm_vcpu(vcpu))
>>>> ... this chunk of logic demonstrates that what oprofile is doing isn't
>>>> related to the Xen ABI in the slightest.
>>>>
>>>> I think OProfile is misusing the guest handle infrastructure, and
>>>> shouldn't be using it for this task.
>>> I'm afraid I consider this something for another day. Both the
>>> original #ifdef and the one getting added here are merely
>>> measures to get things to build.
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Without entering on the debate whether CONFIG_COMPAT is the correct
>> conditional to use it's not making the issue any worse, and it will
>> allow to unblock the build. We can discuss about the CONFIG_COMPAT
>> stuff later.
> 
> I disagree.  Fixing this less effort than the time wasted arguing about
> fixing it.
> 
> But if you are going to insist on not fixing it, and putting in a patch
> like this, then at a minimum, it needs to include a TODO comment stating
> that the use of CONFIG_COMPAT is bogus and needs fixing.

I disagree: It is (for now) just you saying this is bogus. The (ab)use
of the handle infrastructure was there before. You could have sent a
fix long ago, therefore, if you were thinking this needs fixing. I can
see that you have good intentions, but orthogonal issues shouldn't be
used to block necessary adjustments (and this applies to other pending
build fixes as well).

Jan

