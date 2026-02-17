Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A753E909AE
	for <xen-devel@archiver.kernel.org>; Tue, 17 Feb 2026 15:21:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1235138.1538182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMsg-0005p8-11; Tue, 17 Feb 2026 15:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235138.1538182; Tue, 17 Feb 2026 15:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMsf-0005p1-U9; Tue, 17 Feb 2026 15:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1235138;
 Tue, 17 Feb 2026 15:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsMsf-0005ov-6T
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 15:20:53 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ebe7f0c-0c14-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 16:20:51 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so26166585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 07:20:52 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48396d1d544sm130305e9.23.2026.02.17.07.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 07:20:50 -0800 (PST)
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
X-Inumbo-ID: 3ebe7f0c-0c14-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771341651; x=1771946451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Sk2zHM1ahDdGYPc9wYlwPm2BKr3vNH/73NPzUFOCxQ=;
        b=gw3wMZMr2JlbIermsT7weYbImIUx4eoUhIwr2sO6JyGP5wreWUlXYoGIU+irxBxciA
         1+oSpI0UcVUyAiZu4w39mk7+61dqqyeB4jg/lyGqU9KXlRCGUigYcCLiC/5lLZ+pSehY
         oFTv6/MWojJ5FEO6+Ig4CGup4ElOjVLUnsLDrsd4ps7Fep2tYe0SVO1RkBdME12UtYS/
         D8C8QzSeX0hlhO+TQAN5MvaVH4Claol6w5UnI3NyRWNoU+WWxCZCKhr6m2DA8MDGQemh
         2Jz5L2UFNqtCTQY/Ew5XXbUT1JSK2mP2wJNshhzZmPJCgChDl1ZyM8P/N65Ywwp9srG0
         B8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341651; x=1771946451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Sk2zHM1ahDdGYPc9wYlwPm2BKr3vNH/73NPzUFOCxQ=;
        b=BKnqrXZWsVSJTAb3NvRoav3LCrKMguQ60edl6np3daEbMD92U3caEcFVHYXD0/kmWT
         8UxrtJGVBPqluLS5nZHDdb1LQSfa5dmEJEleJL4glCGdSa9EtdIr++JllemAMWCsBT3k
         5bfoUYgEoBrUCOULOvQ1fiNGu8RciT7QQ+WXnuUSWRFOt6cBExjxFh0R6W2DSwn3+eqY
         r/5+saUR3JBtj6UFCMlEFq2cTmwhBughfaJTPHSZJPFR3o+qN1OjCpOJc4DDSITGYWZ2
         4U+zSLp2RKNSpACOcgeDNZdyqJIimmGaymfod1b6YLjd4Fsk+Xp1kIDEa/BuRWakVz0Q
         7hNA==
X-Forwarded-Encrypted: i=1; AJvYcCWxr3a455U1xvYuK/UblBFXRsnGifIQ8XkeJM82F3PxJ5IX7MPxecPUN0GODEQkQm6ZMlyQeBed0PE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJ4iQZ/0UCU64Fas4+dlnMmyv03R5SYnyGkhINTmgWZ9yYoVUZ
	9apuvhF6/BVBexXDqWb3BrwLnvxG0se8Ttc8j6LXDB2h9nvvb89ZF1lr
X-Gm-Gg: AZuq6aIDi6vNXROvXyeWncPD/+FTtYg+yT3R8HUG4WO7QoslYBxxUKZH0WDrflZIZrh
	n2VZQpGLYfRjpmrGr4zgpUnbdl57i+tXVWVhku6sXF/nwpcFYrnAUIEjZF3psrJE3cD9DWr9jZo
	0rQP0RIVCfkGZ8+vDANwBEkXYgepi+bqbnxL7viWZ7Y3opuRr+2XwY44FtVCwqsp6XMg0rWuQEA
	hSgE6GvXPANwv1ByY9VkWvq7XSLqUq9jhWLQdUmlLHOhIlm1iPcexn1aQaQhzOhWpinDDzioO8L
	2jAvgLok5EWReTZEKz5TfYLrY/DJnYeqGP2KWlCvp5EOPHKA1wW8HcX59CUfLr7XKd9Nqkz9D7O
	AP+2pctDYAKG1MSNVFy7l2jQFqlxZo7gVmQcFb5S286PB08Nbd9n8xIQkuz3YDT1L2QO8SwTcDT
	mEOxrFd6QcmapwyTi/HHyiNxiR1uAX35wEzR5doeq7eKlqpRvPwa9edULNi7Kn1VORfv/t2ufAk
	10=
X-Received: by 2002:a05:600c:6814:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-48379c14894mr201939215e9.33.1771341651115;
        Tue, 17 Feb 2026 07:20:51 -0800 (PST)
Message-ID: <211c492f-23e1-44ae-8601-ecbce8650e0d@gmail.com>
Date: Tue, 17 Feb 2026 16:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <7426e2d974bfe67786c67709d487c7f64c22ae58.1770999383.git.oleksii.kurochko@gmail.com>
 <f7a05f4d-b547-4b5e-aaa5-88e249c88b4e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f7a05f4d-b547-4b5e-aaa5-88e249c88b4e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/17/26 3:59 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
>> Lay the groundwork for guest timer support by introducing a per-vCPU
>> virtual timer backed by Xen’s common timer infrastructure.
>>
>> The virtual timer is programmed in response to the guest SBI
>> sbi_set_timer() call and injects a virtual supervisor timer interrupt
>> into the vCPU when it expires.
>>
>> While a dedicated struct vtimer is not strictly required at present,
>> it is expected to become necessary once SSTC support is introduced.
>> In particular, it will need to carry additional state such as whether
>> SSTC is enabled, the next compare value (e.g. for the VSTIMECMP CSR)
>> to be saved and restored across context switches, and time delta state
>> (e.g. HTIMEDELTA) required for use cases such as migration. Introducing
>> struct vtimer now avoids a later refactoring.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with a question and a remark.
>
>> @@ -126,6 +130,8 @@ int arch_vcpu_create(struct vcpu *v)
>>   
>>   void arch_vcpu_destroy(struct vcpu *v)
>>   {
>> +    vcpu_timer_destroy(v);
> It feels pretty late to do this, yet I notice vcpu_teardown() doesn't invoke
> any per-arch function (yet). There's arch_domain_teardown(), though, which
> technically could do this for all vCPU-s in a domain.

Why it isn't enough to be implicitly called by domain_destroy()?

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/vtimer.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * (c) 2023-2024 Vates
>> + */
> Is this correct? Is this needed here?

I'll just drop that to be aligned with other headers.

~ Oleksii


