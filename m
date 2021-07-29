Return-Path: <SRS0=/1jQ=MV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7476DC4338F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jul 2021 11:48:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA5460560
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jul 2021 11:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FA5460560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161921.297118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m94Vs-0006iv-QO; Thu, 29 Jul 2021 11:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161921.297118; Thu, 29 Jul 2021 11:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m94Vs-0006io-NO; Thu, 29 Jul 2021 11:47:44 +0000
Received: by outflank-mailman (input) for mailman id 161921;
 Thu, 29 Jul 2021 11:47:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wMqg=MV=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m94Vr-0006ii-8p
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 11:47:43 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c7cea0c4-f062-11eb-9825-12813bfff9fa;
 Thu, 29 Jul 2021 11:47:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F89C6D;
 Thu, 29 Jul 2021 04:47:41 -0700 (PDT)
Received: from [10.57.11.94] (unknown [10.57.11.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A286E3F70D;
 Thu, 29 Jul 2021 04:47:38 -0700 (PDT)
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
X-Inumbo-ID: c7cea0c4-f062-11eb-9825-12813bfff9fa
Subject: Re: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210729104258.6320-1-michal.orzel@arm.com>
 <4a5ac822-3078-de0e-8f84-6881d47ad3eb@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <dd9859ec-a3a9-6a74-bdae-fde092f26ac0@arm.com>
Date: Thu, 29 Jul 2021 13:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a5ac822-3078-de0e-8f84-6881d47ad3eb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 29.07.2021 13:20, Julien Grall wrote:
> Hi Michal,
> 
> On 29/07/2021 11:42, Michal Orzel wrote:
>> According to ARMv8A architecture, AArch64 registers
>> are 64bit wide even though in many cases the upper
>> 32bit is reserved. Therefore there is no need for
>> function vreg_emulate_sysreg32 on arm64. This means
>> that we can have just one function vreg_emulate_sysreg
>> using new function pointer:
>> typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>>                                register_t *r, bool read);
>>
>> Modify vreg_emulate_cp32 to use the new function pointer
>> as well.
>>
>> This change allows to properly use 64bit registers in AArch64
>> state and in case of AArch32 the upper 32 bits of AArch64
>> registers are inaccessible and are ignored(D1.20.1 ARM DDI 0487A.j).
> 
> What you wrote only says that the bits are ignored. It doesn't say whether the bits will be 0.
> 
> They are probably, but as I wrote yesterday, I couldn't confirm it.
> 
Should I then remove this part of the commit or write below?:
"We can assume that those bits will be 0 but the architecture
reference manual does not clarify this."
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> Please provide a change log.
> 
Ok.
> Cheers,
> 
Cheers,

