Return-Path: <SRS0=rTFK=FF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2AAC64E7B
	for <xen-devel@archiver.kernel.org>; Tue,  1 Dec 2020 10:49:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A18820674
	for <xen-devel@archiver.kernel.org>; Tue,  1 Dec 2020 10:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="nkfDCEzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A18820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.41825.75297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk3E7-0004R9-0b; Tue, 01 Dec 2020 10:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41825.75297; Tue, 01 Dec 2020 10:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk3E6-0004R2-Tt; Tue, 01 Dec 2020 10:49:42 +0000
Received: by outflank-mailman (input) for mailman id 41825;
 Tue, 01 Dec 2020 10:49:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk3E5-0004Qx-Ig
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 10:49:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83d024e0-b26c-49f4-b781-36d511790e18;
 Tue, 01 Dec 2020 10:49:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 998B6AC90;
 Tue,  1 Dec 2020 10:49:39 +0000 (UTC)
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
X-Inumbo-ID: 83d024e0-b26c-49f4-b781-36d511790e18
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606819779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRa7yuoH4jgSQKC7xkeLfahP/u1wYvFmASAmGAH6kOs=;
	b=nkfDCEzViB0nRB8DYyrodsOTbRqWJLodX4GeZ4zJMcU6CaKA4kgi1B82D/DwihvPs9/oa6
	f+WCiR9X+JwPIQoJFUXVy80C8WZkw6TSwK4jFkP37efd0U8R2CV/EAveeKD+JViafpgUeM
	jEe0if4cQhUdWGsHdESRQAcoGWp80iw=
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Julien Grall <julien@xen.org>, Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
 <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
 <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b6c5dd4-fcff-2ed6-2295-d70e204c26a0@suse.com>
Date: Tue, 1 Dec 2020 11:49:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 11:30, Julien Grall wrote:
> Hi Jan,
> 
> On 01/12/2020 07:55, Jan Beulich wrote:
>> On 01.12.2020 00:27, Oleksandr wrote:
>>> On 30.11.20 23:03, Volodymyr Babchuk wrote:
>>>> Oleksandr Tyshchenko writes:
>>>>> --- a/xen/include/asm-arm/traps.h
>>>>> +++ b/xen/include/asm-arm/traps.h
>>>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
>>>>>            (unsigned long)abort_guest_exit_end == regs->pc;
>>>>>    }
>>>>>    
>>>>> +/* Check whether the sign extension is required and perform it */
>>>>> +static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>>>>> +{
>>>>> +    uint8_t size = (1 << dabt.size) * 8;
>>>>> +
>>>>> +    /*
>>>>> +     * Sign extend if required.
>>>>> +     * Note that we expect the read handler to have zeroed the bits
>>>>> +     * outside the requested access size.
>>>>> +     */
>>>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>>>> +    {
>>>>> +        /*
>>>>> +         * We are relying on register_t using the same as
>>>>> +         * an unsigned long in order to keep the 32-bit assembly
>>>>> +         * code smaller.
>>>>> +         */
>>>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>>>> +        r |= (~0UL) << size;
>>>> If `size` is 64, you will get undefined behavior there.
>>> I think, we don't need to worry about undefined behavior here. Having
>>> size=64 would be possible with doubleword (dabt.size=3). But if "r"
>>> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
>>> we deal with byte, halfword or word operations (dabt.size<3). Or I
>>> missed something?
>>
>> At which point please put in a respective ASSERT(), possibly amended
>> by a brief comment.
> 
> ASSERT()s are only meant to catch programatic error. However, in this 
> case, the bigger risk is an hardware bug such as advertising a sign 
> extension for either 64-bit (or 32-bit) on Arm64 (resp. Arm32).
> 
> Actually the Armv8 spec is a bit more blurry when running in AArch32 
> state because they suggest that the sign extension can be set even for 
> 32-bit access. I think this is a spelling mistake, but it is probably 
> better to be cautious here.
> 
> Therefore, I would recommend to rework the code so it is only called 
> when len < sizeof(register_t).

This would be even better in this case, I agree.

Jan

