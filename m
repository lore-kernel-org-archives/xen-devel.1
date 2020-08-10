Return-Path: <SRS0=UpcS=BU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A70DC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 20:30:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2281206B5
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 20:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQK33hiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2281206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5EQG-0006Hy-WF; Mon, 10 Aug 2020 20:29:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWL+=BU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5EQF-0006Ht-1g
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 20:29:31 +0000
X-Inumbo-ID: dadc102b-93cb-4dd0-92dc-4f0f9d4275c5
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dadc102b-93cb-4dd0-92dc-4f0f9d4275c5;
 Mon, 10 Aug 2020 20:29:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id k13so5449960lfo.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BD3Vbwi+oq2LFO2ToiTTgKWN0QCnSaB8lgbwysBqW58=;
 b=bQK33hiwmvWSB0PSKI0qgzCS975J2m4mttz1+ObwWo5jkCGHcmhoErzAks0mxXEg5r
 sTmwUgY+fPmhMMu3msHi6wP6dXgb2Ry5PivXrNFP5QtWCvnj8xkYYrGqRpmLZ7s1L1JN
 z/qqJ2QcxZgFsMykcr4PxM0so99tJWLnCt6mvsGp8Kob6Tys/4N2QMpM8TQo3m+PuGvH
 4Cv2HKldaVX/5RXiwrKXzVBj0VUQ0if+ADJpUCuQ1uUPqI32xLxHByl8M7Qnm37HCq3w
 sbNV2t2W9CntBXjHqjRxlF6YwJ5yLT2V2UDGEfKGkHNuZBqckp39p9qBv1wgR3FaGtNx
 Rjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BD3Vbwi+oq2LFO2ToiTTgKWN0QCnSaB8lgbwysBqW58=;
 b=PZbq/7gWeHKH0VjvqNM1bL/C8/RhFdLqSqlhLdbK0GJ4Vfu1EEW+NBEb8zTVcyIf7l
 BlyrdFWKTaZ+py1mFyZ0mMJVcDCGXs7SzsQXOw0ndWHh23KG1hPcdpIqG7CdLucc8RDF
 qXRkjvIjliwZdzapp6+Mpe6IYeJS4RVTM5mRfWLdZFohXgf/Bzm3g64At2pWuwYuuotW
 p6SU/Ebrqa1KAbmRF38DgP3WcZ9ZaVeDKUeGfMfpPPKh0PxmhxdijKk2zRzalxMMayDT
 0EWQpqIWO/akvr8ROZfASl8I97rb3sukCuj40jQIzB+CFGKI9xD/nMuOfBqdsXQ/XY2h
 BfrA==
X-Gm-Message-State: AOAM530EjTc4zdJZqHhSYBlULLFZa0runItjexCuN4bxBqbScUFVArRT
 yrICKS6vPYRlj+A+kehzs/s=
X-Google-Smtp-Source: ABdhPJylUbJdP83G68k67pcp+SNO2xrODP/C/otX700w96K1H1511nNo0RPaTSRCG3IkjyL6bRlNjg==
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr1404300lfq.89.1597091368413;
 Mon, 10 Aug 2020 13:29:28 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j6sm10563647ljc.18.2020.08.10.13.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 13:29:27 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
 <659a5b45-a37a-5cf2-0bcd-ba1ea3d47cc4@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <48a130dc-57fd-0627-d188-ddff4abf6778@gmail.com>
Date: Mon, 10 Aug 2020 23:29:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <659a5b45-a37a-5cf2-0bcd-ba1ea3d47cc4@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 10.08.20 22:00, Julien Grall wrote:

Hi Julien

>
>>>
>>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>>>    */
>>>>>   void leave_hypervisor_to_guest(void)
>>>>>   {
>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>> +    /*
>>>>> +     * XXX: Check the return. Shall we call that in
>>>>> +     * continue_running and context_switch instead?
>>>>> +     * The benefits would be to avoid calling
>>>>> +     * handle_hvm_io_completion on every return.
>>>>> +     */
>>>>
>>>> Yeah, that could be a simple and good optimization
>>>
>>> Well, it is not simple as it is sounds :). 
>>> handle_hvm_io_completion() is the function in charge to mark the 
>>> vCPU as waiting for I/O. So we would at least need to split the 
>>> function.
>>>
>>> I wrote this TODO because I wasn't sure about the complexity of 
>>> handle_hvm_io_completion(current). Looking at it again, the main 
>>> complexity is the looping over the IOREQ servers.
>>>
>>> I think it would be better to optimize handle_hvm_io_completion() 
>>> rather than trying to hack the context_switch() or continue_running().
>> Well, is the idea in proposed dirty test patch below close to what 
>> you expect? Patch optimizes handle_hvm_io_completion() to avoid extra 
>> actions if vcpu's domain doesn't have ioreq_server, alternatively
>> the check could be moved out of handle_hvm_io_completion() to avoid 
>> calling that function at all.
>
> This looks ok to me.
>
>> BTW, TODO also suggests checking the return value of 
>> handle_hvm_io_completion(), but I am completely sure we can simply
>> just return from leave_hypervisor_to_guest() at this point. Could you 
>> please share your opinion?
>
> From my understanding, handle_hvm_io_completion() may return false if 
> there is pending I/O or a failure.

It seems, yes


>
> In the former case, I think we want to call handle_hvm_io_completion() 
> later on. Possibly after we call do_softirq().
>
> I am wondering whether check_for_vcpu_work() could return whether 
> there are more work todo on the behalf of the vCPU.
>
> So we could have:
>
> do
> {
>   check_for_pcpu_work();
> } while (check_for_vcpu_work())
>
> The implementation of check_for_vcpu_work() would be:
>
> if ( !handle_hvm_io_completion() )
>   return true;
>
> /* Rest of the existing code */
>
> return false;

Thank you, will give it a try.

Can we behave the same way for both "pending I/O" and "failure" or we 
need to distinguish them?

Probably we need some sort of safe timeout/number attempts in order to 
not spin forever?


-- 
Regards,

Oleksandr Tyshchenko


