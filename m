Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1984C9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 09:29:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435826.1654616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7fL-00077v-6z; Mon, 28 Sep 2026 09:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435826.1654616; Mon, 28 Sep 2026 09:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7fL-00077m-3P; Mon, 28 Sep 2026 09:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1435826;
 Mon, 28 Sep 2026 09:28:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xB7fK-00077e-5y
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB7fJ-0078eL-J4
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:28:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba3348-2eae-0a2a0a5409dd-0a2a4505be2c-28
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:28:53 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba3355-4cb1-0a2a45050019-4a7de14cb3ec-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:28:53 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843cedd129so1533486f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 02:28:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355c65sm26127206f8f.19.2026.09.28.02.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:28:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790587733; x=1791192533; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCDfEElOEhfvXJllwHLVXJqo9Ye2+F36isR6KwGOgyk=;
        b=buvchQvWvxZbhZ6/4eqcjNhU9/yXJB9LqGskM53we47WIZwFJB0amLsbSqeOtTQMEw
         ODoY3uqlhUK2Shyqtdk24I5uWCjaeI4QtBl5jxiiwa/MHcjnDQnmSdRxZGu1Wr2wMXu1
         7s53sBh1q51QpDzSobg3u01P/lHLI33cbHZSIiPgZpHa9w5IoEL57hJWy8n8Uq/dfDBA
         TB3EmXg7Q6fjPVhIvJCaGBI9fXHFR7iSmGHXp8DMezdsMZojtIU0KWpeEbXpHMkV3rVP
         g/uezYpDIdAQfK7Ncd6x88/7/Hj2Y/n3adJaFSl4XhPlE7xxjb/6LeDYxSsLw9/GdL8Z
         1cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587733; x=1791192533;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCDfEElOEhfvXJllwHLVXJqo9Ye2+F36isR6KwGOgyk=;
        b=hgOQtFWIuajx1DR4t1Yi9mU6hxAsgE/kxJOJZDTojrMz8djw+0jdAGE04hzZGSwPgb
         9ReJTWVDE0HL1qaLEl2vWCPOwHuFEwVmR8EzO7kXRTA6jl2e+4/lcQD1s29Hs1Kydm9Z
         lE0sMbuPkFVacFFUF11ZdJSjL2HYxF5J0oA37dHoTR3gny3sN0mtFrhkt5rOxgckCi8y
         NifiHyOODym4ScB5UR2T+GBRsxfRzQqcQdP/QzbGcrSHKqPRR+/N3Ey29ghsu1RAUQS9
         J+A+QpEFANhk8HogvpOaYokF5xJGcufRBT0fKg9KfXAtW9fLfmdGBBrNlhdxHPVwAkk2
         +oJg==
X-Forwarded-Encrypted: i=1; AKwUvByX1eWqwAG0EjPz8vHiH4vRfR67IZbN7yo+5/P1fYNwRIdQk5lbOw70MRVWYzYjjXPYsikyqrrRQmI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIkoXGWBBfnEn2cApzGjqdacLmN3WuypqwiYWyquHZVKShqnUq4
	WLE0D8l5IQGZN0ZGsj9eWGvk2hne6oBcHdsfuOxPFbASI7srGEinfWiUgy/NDQl3hQ==
X-Gm-Gg: AYBFou1fkMuzpIXVtzEv0JD0Kt+HgEdSg5xxaEArGVBuq+2hINCNM7Pn15ldRs0dKt6
	foHu9qoHw/s/vUbdXY1o/it/pQPxhUujTacXodT15MaCLFBn2m7zj/qKC+1eXUVUvGehXNfnpkc
	/d4jTvvZxIi8HS2rN+7sAX85MFMIMZDCKWuHbI7HCGoUPbIQhjvTViP9foSSuqQc+zEbQtM4c/C
	tnCq7Jrt+5qG2BshUHh263rhX9AVgR4mmfFi/loxqj3GAf6mnGzWRXqQBCLohZ84imiq5OYhIur
	Aab6bcOYQwHESG+Jh6wBVH8YVsblirZQWz8da/wWV0ZmWyUCT06xu2vwDuBWv0BRKNVq8kA/TuK
	Bj2ZfUppwoex3tjt1Q4WqJ/WlA1IO9UQkrfihk3skklkMIdhktYszdRhrKy+N+DrSRFcfZ38SC6
	Q6wAYGhXdVAKmixFVWPbdFr2r7CxGE9Njlw2CBAjJrnlCO6KfKnCrZqh1vxKqAIxzeDjE1iQwz3
	rJ+2TKev/p8iA3Btw2evRBCNsfc9n9pdecL94xkh1bsAT5UsYf/VkZZWC0KSdU=
X-Received: by 2002:a05:6000:2088:b0:487:27f6:a4e3 with SMTP id ffacd0b85a97d-488716bc4bdmr21398063f8f.51.1790587732996;
        Mon, 28 Sep 2026 02:28:52 -0700 (PDT)
Message-ID: <8903012d-906f-4643-af76-ad733c9e0641@suse.com>
Date: Mon, 28 Sep 2026 11:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
To: Lin Liu <lin.liu01@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <8bc996ec-09c0-4241-bc3a-64dbf44c5e5f@suse.com>
 <20260928092647.1558693-1-lin.liu01@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260928092647.1558693-1-lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790587733-F60AA2A1-B33CA68F/0/0
X-purgate-type: clean
X-purgate-size: 963

On 28.09.2026 11:26, Lin Liu wrote:
>>> On 23.09.2026 11:51, Lin Liu wrote:
>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>      ns_vmcb->_efer = n2vmcb->_efer;
>>>  
>>>      /* CRn */
>>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>>>      ns_vmcb->_cr0 = n2vmcb->_cr0;
>>
>> In addition to mirroring the change to CR0 and EFER, doesn't CR2 also
>> need handling the same way? Effectively the inverse direction of anything
>> respective that nsvm_vmcb_prepare4vmrun() does?
> 
> CR2 is different, it store the page fault address on #PF.
> If #PF happens, xen as hardware emulator, should write back the CR2 as part of
> guest state area. so copy from n2vmcb is the right behavior.

But besides by #PF, CR2 may also be changed by the guest writing to it.

Jan

