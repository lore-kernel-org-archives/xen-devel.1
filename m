Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC4F606E560
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7qtQ5+X
Received: from list by lists.xenproject.org with outflank-mailman.1475183.1682054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzpQ-0007JO-TP; Thu, 05 Nov 2026 15:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475183.1682054; Thu, 05 Nov 2026 15:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzpQ-0007JH-Qh; Thu, 05 Nov 2026 15:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1475183;
 Thu, 05 Nov 2026 15:56:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOzpO-0007JB-Ub
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:56:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzpN-004OBc-Vn
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:56:37 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeca717-e002-0a2a0a5209dd-0a2a4505b582-46
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:56:37 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeca735-4cb1-0a2a45050019-d1558032e046-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:56:37 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so17515135e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 07:56:37 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57373f7f1sm85043575e9.15.2026.11.05.07.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 07:56:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894197; x=1794498997; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKA1X1TpOQEUg5qbNgjqdXJevgFe79vEWtHeQL6Wkrc=;
        b=Q7qtQ5+XQNUU4uho2hohKN6K0WT1DPU3yHVQZ88YK0IX/+iwu+dsYiVGX6N9yTngJK
         KmxNMRwTRG/G15YdLfxf3ETIJS2vlgz8lMrLKbAan9/8EM245mH4lX97wePtejI0dEcC
         bXvVmQqgd2LVDV7VkgEll+6BE1zEzkIqhDi8/j2hJDifNpryUBXEkyGr8DjtKgLXA9B6
         kk5dlOyTXvbQ3ioznn4RR/TA77sso3vCvaFu1ShO8MxOpEaq01xMMiKajx7/rJU3CIH1
         4WdoUX2nJ9VsaJkBkJw/vm0RKdy5IWXo9VF5gB4CJ2ERFAXc5+imyGKer1i0F42akYaL
         ByqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894197; x=1794498997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKA1X1TpOQEUg5qbNgjqdXJevgFe79vEWtHeQL6Wkrc=;
        b=a7dX0y8evVBUyCOlPJW8YEzZVzO/XkEgKKqIMfjqnk4dkLN7PQphxkycn69XB7bBQZ
         O1dxajOk49zBEUWspje5Cd3mew0PDePwkhvaC/S4JJIct/p2do6efGFgiazBwQURGa1v
         L2KbZ16oAe6y+F2tkuLDbZWFprkb89l9y9uFgKqBR8eXOfzmo1mzA7IEts2xso0isikG
         jQa07INgyoFKFlOZ+F6jjZc2GffkxZptMZLBj2t3BxiEHL5fk6s5ixniXz7mqnyAgdsI
         x6GOHpF0HLVGudANm59bTDYhPKZhsU+H4N3/WvC+WftFMaBxBJY/2M/OjIJnTvgFuyBP
         5m+Q==
X-Forwarded-Encrypted: i=1; AKwUvBza9c+zFOs8ShRCZBpyuXqHNOiMdMIgNAiEqQBT/D6RJFI9U51hyEivwo2wOSTwMdyRav8SY4DT+SY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+kNwPTJEbAArfDFEZ7r6ZXULiNZ1uL5BQ+AGj15c2j9MbliCwM
	kzt++qYzXiIBPOffsQnV7yx/UdIG1JMgvv2axvb6+4cB6fOKtlW0ckS1
X-Gm-Gg: AYBFou1KLHGumqebMX2Hp0rKpBQrUzaEDXuDn89wfrhWg+QNmhvpDjkoq+xaZ0P4V8y
	6l+YePMboTOQinZZRsJNsWUEG5sND2cG9jTzJ3q+7F4VSC+CghPRCTcl3/NRKhn+LyEYmDa+i9F
	0BcP9AHunDajm5W69/pf1nQ7/DEs26kahfPx7haFiieTIYtAMOdiZS3yVQj0CUilpahE/dd/D8K
	CW8l/eWuVUZ5436UytR1n+y1xWkIomfG8Z9dGx4GdKAqnpqwH5XeMyQI8ce60NQhfkmLrw+OX43
	dIOoZpI6dE47W9OTiT6HeVYM2iqmt5c0Ln5AJn1hmnRNVFaUDUgcmPOFn3sMKmEdZJsb04tJPdz
	FdUlS4upNxaDafwPY8/UdWggloato8eUw65RIyiDSusBW4ptXOdd4t0HhvHPFGqwBLwYGdX5eDF
	/1dYexxhS6z+VNPQ4sA++wOjKVW6Ux/LjF79l0x3F3BEi+MnAhCz2wE1a5ZC6m69YSuFXl6Hmi8
	uG9z+ycUh2QrdIgwFprGJmxU7Exbcer/IANNrtvLts5o9Gh20sfMzbf/NJ7zNaPnThJ7bIhG8rX
	CYBSJDr/VzUq5vytWbscgk3CCxGO3bJ4m7c85CB3s63cZRkb6Euh045mcGBZ374PBTedndpsJ9A
	U
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr459694345e9.3.1793894197241;
        Thu, 05 Nov 2026 07:56:37 -0800 (PST)
Message-ID: <8c2b7338-e65b-4d14-af62-9f300e2becb5@gmail.com>
Date: Thu, 5 Nov 2026 16:56:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: align header inclusion guards with
 CODING_STYLE
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org
References: <20261105150336.25751-1-oleksii.kurochko@gmail.com>
 <573590f0-1a94-4113-a76c-3ae644bebdff@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <573590f0-1a94-4113-a76c-3ae644bebdff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793894197-726B52A1-DEF470ED/10/78276251493
X-purgate-type: spam
X-purgate-size: 2015
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 4:44 PM, Jan Beulich wrote:
> On 05.11.2026 16:03, Oleksii Kurochko wrote:
>> Commit 7abea85c9f12 ("CODING_STYLE: Updated header guard
>> recommendations") changed the recommended naming of inclusion guards
>> for arch-specific headers to <arch>_<something>_H. Most RISC-V headers
>> still use the ASM__RISCV__<FILENAME>_H form required by the previous
>> rules, and a few use ASM_RISCV_<FILENAME>_H, which follows neither.
>>
>> Rename the guards to RISCV_<SOMETHING>_H. While doing so, also fix two
>> guards which don't match their file names: extable.h used
>> ASM__RISCV__ASM_EXTABLE_H and intc.h used the misspelt
>> ASM__RISCV__INTERRUPT_CONTOLLER_H. For riscv_encoding.h, don't repeat
>> the architecture name and use RISCV_ENCODING_H.
> 
> I'd recommend against that. If you want this tag, renamed the file as
> well. Otherwise stick to the naming rules.
> 
>> No functional change.
>>
>> Assisted-by: Claude-Code:claude-opus-5-5
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> With the above (and possibly also the below) adjustment(s)
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Which way to make the adjustment you will need to indicate. Changing the
> tag identifier can be done while committing. If you want to rename the
> file, I could drop that one hunk from here while committing. Please
> indicate intentions.

I think I prefer then to follow the naming rules and name tag identifier 
as RISCV_RISCV_ENCODING_H.
> 
>> --- a/xen/arch/riscv/include/asm/vsbi.h
>> +++ b/xen/arch/riscv/include/asm/vsbi.h
>> @@ -1,7 +1,7 @@
>>   /* SPDX-License-Identifier:  GPL-2.0-only */
>>   
>> -#ifndef ASM_RISCV_VSBI_H
>> -#define ASM_RISCV_VSBI_H
>> +#ifndef RISCV_VSBI_H
>> +#define RISCV_VSBI_H
>>   
>>   struct cpu_user_regs;
>>   
> 
> I think at this occasion the #endif also wants to gain the usual comment.

Oh, missed that.

I will appreciate if it could be done during committing.

Thanks a lot!

~ Oleksii

