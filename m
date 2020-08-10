Return-Path: <SRS0=UpcS=BU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0EBC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 18:22:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE1B207FF
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 18:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4BHEQHL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE1B207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5CQt-00048x-4Y; Mon, 10 Aug 2020 18:22:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWL+=BU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5CQs-00048q-73
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 18:22:02 +0000
X-Inumbo-ID: 28c427e4-5203-4baf-97a4-9b7c74f2f84c
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28c427e4-5203-4baf-97a4-9b7c74f2f84c;
 Mon, 10 Aug 2020 18:22:01 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m15so5239493lfp.7
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HgKgbfmapv2awSuIkdFWqh6I3NOLVUpRMGCZLQRgbvU=;
 b=o4BHEQHLQVzhxOQIpuCS0N0fjZEQLNKzceFZXiMeDHQbekjBQ2BrADsjWgaMsFt3fK
 6xW2Gxn9Vmfv4KqMZbVGf3eCIpj6mErgYR/Cpm42RESW4bsLgjHBiX0iEz7tZTYqVLRq
 FWlu/TjqSYDpbC4O1zAgAlqU3bls7yIOsY4RzJlBGHSzvqHSDUoACi+xRdY+8a382juF
 VAYFRcE5Tb1jSRQL2PKd4m0crwc1j7psOcrKnXNe/mqvBWo7F15Cbg6o1aOTlC9kFm6q
 fY1Q+UAMbsl0OgZtg4XSfMij8zBqZgyE1tiPBzLGC4bMqAfthFTTQuWz2p++51zf344z
 mbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HgKgbfmapv2awSuIkdFWqh6I3NOLVUpRMGCZLQRgbvU=;
 b=PITKP/wX9SWHJ4IdY8ldorvvF0BrWVFVKcnjDHOSntrAoHYjydh/Vyvgl9AyHOk6lU
 7jbD/jw2PmPaDjvlw74M6/JNryh1DEDi7d1sjNhHQJC58BY3PGSMtRTTfgzDZ/aVCL0s
 ka1/a6L0WwILxvcsP9W3C+PaEN8QdKbfOlR/FwgCr4kB7S+Kc+ZufRbYz6axEggQ10WP
 dFAPCqsSVKOYi8foSYvW3qP/oBghgSo7zjOCpricg/wpSsoWpnAtLPY2IsgPjkdkKu7Z
 eglxuJTRoo0IqV1OdFy5xJVgTJgTYxzGMEJxZwq3R7ycQNxplAwhlHByEWL73SKlK0lW
 dKsw==
X-Gm-Message-State: AOAM531d0E+dGhVjvbY0QDGcELQriQzWp6vmFxBFY+k8hZsGX0+nGTVB
 wooJitL7HKz4ABMxdlLB7hY=
X-Google-Smtp-Source: ABdhPJyf4+dPC7Vy5zvO7YwkLzPG7rvMvMuOPYbhu2xkp+evAhFVOBxNnRBuBf6rhbhBfd9qApbQDQ==
X-Received: by 2002:a19:f808:: with SMTP id a8mr1197210lff.62.1597083720172;
 Mon, 10 Aug 2020 11:22:00 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m15sm9394695ljh.62.2020.08.10.11.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 11:21:59 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
Message-ID: <6a5022c9-ad55-1513-e808-e74e58442551@gmail.com>
Date: Mon, 10 Aug 2020 21:21:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
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


Hi


>
>>
>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>>    */
>>>>   void leave_hypervisor_to_guest(void)
>>>>   {
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    /*
>>>> +     * XXX: Check the return. Shall we call that in
>>>> +     * continue_running and context_switch instead?
>>>> +     * The benefits would be to avoid calling
>>>> +     * handle_hvm_io_completion on every return.
>>>> +     */
>>>
>>> Yeah, that could be a simple and good optimization
>>
>> Well, it is not simple as it is sounds :). handle_hvm_io_completion() 
>> is the function in charge to mark the vCPU as waiting for I/O. So we 
>> would at least need to split the function.
>>
>> I wrote this TODO because I wasn't sure about the complexity of 
>> handle_hvm_io_completion(current). Looking at it again, the main 
>> complexity is the looping over the IOREQ servers.
>>
>> I think it would be better to optimize handle_hvm_io_completion() 
>> rather than trying to hack the context_switch() or continue_running().
> Well, is the idea in proposed dirty test patch below close to what you 
> expect? Patch optimizes handle_hvm_io_completion() to avoid extra 
> actions if vcpu's domain doesn't have ioreq_server, alternatively
> the check could be moved out of handle_hvm_io_completion() to avoid 
> calling that function at all. BTW, TODO also suggests checking the 
> return value of handle_hvm_io_completion(), but I am completely sure 
> we can simply
> just return from leave_hypervisor_to_guest() at this point. 

Sorry, made a mistake in last sentence).  s / I am completely sure / I 
am not completely sure


-- 
Regards,

Oleksandr Tyshchenko


