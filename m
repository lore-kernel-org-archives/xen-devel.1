Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29662CD6E57
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 15:22:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325213.1590707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQwG-00035Y-JB; Tue, 02 Jun 2026 15:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325213.1590707; Tue, 02 Jun 2026 15:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQwG-00035R-FY; Tue, 02 Jun 2026 15:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1325213;
 Tue, 02 Jun 2026 15:21:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUQwF-00035K-GC
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:21:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQwE-008hSZ-Eq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:21:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef512-bab6-0a2a0a5309dd-0a2a450b9efc-2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:21:54 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef512-212f-0a2a450b0019-d1558034e956-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:21:54 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so11130025e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:21:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm162878295e9.5.2026.06.02.08.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:21:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780413714; x=1781018514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fGuzSM1duAm10WbI6xI5JDK7TXHdqiR+Wu0yDEysX0=;
        b=qiFKhplIAR/6NlttdZKr9O5+wrAt1yh4+vC1Zk4bOndTOD++Zh8ReQCjKFvKXrH58K
         1fQuzSj11xjrKRiIyeEDe3puUMrqcQll3gRVF7Ra9uMwa1u5wgWwTi2n9i7F0BNwVMHP
         K36kF6tnslEyNytMgTc4ph7mKqtWAO5/pw++9Y40zYi6yNHLmqtMbEb7lSw2ryh3pypj
         HDOwz5rB58pZq/chGDzYdQuN9UplAYu3gwduHuuZbeyVBsCBbda1j2AswSeONcVKevHZ
         EUnq2p31CQCnnPpyP+8aWQLUfJ5cR2NSXoB53eXcGLaEzStKw8k8945N1pm0RvmvM+gL
         YCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413714; x=1781018514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fGuzSM1duAm10WbI6xI5JDK7TXHdqiR+Wu0yDEysX0=;
        b=GOAhrNrZpJyt3H4luh1amRnThI6Tsi5JO6Yj//YDZq9+RKGJKL5bWpvlol6FliQLez
         Y1Vo6yCFeu3zYGcYRrx3756EJMulTSFSFBDboVlLvNSGohqKOoZrZRXBVbBqRdGruG+U
         2zm6wTYDwTDN/OJn6Njc7hKrXGXPI33WfmrDv0dTnIYKBgIIaBEobLH0bBhpRuVruifr
         H40DOGBHiL9EFaAxALh9HdmbAmvLCe6zCsWDCXD0/u2g306qgLYXWUYZnYWqIX/HFDe1
         vIb9/39Hn1lshggdAp46/NfVDxA+GSIhPAoz8its/MQYVLjL9LvxiMx1DAe7sqtpwJyp
         NWzg==
X-Forwarded-Encrypted: i=1; AFNElJ/rYSyFcYvnUgVt1QyWH9VktGQLQ4R5SKKu3rlqs/1lgc07sv+7BKEwRVX4/+UIt2oU4e3lXC6cVho=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySJJybk/RvDjNyVynTyQbbIca1BM5po4vxPycHUog7FpYFVil/
	WlgSkQMFwP8DwLU/0+PAb5vLIeaiV7buNIgx0uJ3j9gx9j2wPP9C5KmU
X-Gm-Gg: Acq92OEMm02lxMhlMhsIVXgkgCIVvLie2qkLB95zdkV2yX2cXKCzqdAdQszE1m61MPt
	oYfJmi5q6ZRTpP+W3E0oRFo5X2hfm52rwvvS2irBfhPYUSh5QL/C97DCHDKPZuUx1zQDI6mYdCy
	liIr44Q9Mj1wYbBG0r5LR2QW51R/Xg/bhAAaBtihu3GYT0RNQNd8kvggxhsSPZCnTFNq+p2N39T
	jjJ47izPnbaCi3UqYeOwUVFuAOyrGb56O0e4CltluTpnccTnTOy0KBjCZDmHslKIaeUOWDOlGkv
	sq2WnArNxqzm9R0BAIWUwpUkYuYgkChrOMiabhAo92o8KTg7ZWsg1r0YP7Rc69BMTLWwQ6oDoel
	Mh52XIEtfR+H0kQlJXLA3qdqeBDTXQB8beb7TAxo7yfypxt5d7gyvVz96g/VV0+fI/8eU2zozvd
	n4XJ85RxxZ49jvNld7jyqQjvMMH1494DhW4OWqqCYlUfFTdPuO/xIObTlToKc/xmLrCiNWIi5Na
	CjoURBRqaqyr1A8/CX1pDy2pL0=
X-Received: by 2002:a05:600c:348c:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490b506a773mr3813005e9.8.1780413713554;
        Tue, 02 Jun 2026 08:21:53 -0700 (PDT)
Message-ID: <59f901aa-a3dc-4704-a1d2-93a2f8f67cc6@gmail.com>
Date: Tue, 2 Jun 2026 17:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: fix switch_stack_and_jump() for range
 beyond 1M
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <21bc40d4a09bb4cfe0999430ea7e65b369fd4033.1779712171.git.oleksii.kurochko@gmail.com>
 <9ada8585-9c93-4212-9184-9babc566eebd@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9ada8585-9c93-4212-9184-9babc566eebd@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780413714-12573F3B-FE9749FF/10/73395122804
X-purgate-type: spam
X-purgate-size: 2561



On 6/2/26 1:21 PM, Andrew Cooper wrote:
> On 25/05/2026 2:20 pm, Oleksii Kurochko wrote:
>> The `j` instruction (JAL x0) used in switch_stack_and_jump() is a
>> J-type instruction with only a ±1MB range, and that this can
>> be exceeded in some configurations, causing a linker error:
>>
>>    relocation truncated to fit: R_RISCV_JAL against `<symbol>'
>>
>> Replace `j` with `jr` (JALR x0) via an explicit register, which has
>> unlimited range.
>>
>> Found in a downstream branch when UBSAN instrumentation was enabled.
>>
>> Note that the `tail` instruction looks more natural here, but `jr` is
>> chosen instead to avoid depending on how the assembler expands `tail`
>> and which scratch register it uses (`t1` in GAS), which would need to
>> be listed in the clobber section of `asm volatile`.
>>
>> Fixes: e66003e7be199 ("xen/riscv: introduce setup_initial_pages")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Changes in v2:
>>   - Update the commit message and subject
>> ---
>>   xen/arch/riscv/include/asm/current.h | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
>> index 5fbee8182caa..cc004670d18c 100644
>> --- a/xen/arch/riscv/include/asm/current.h
>> +++ b/xen/arch/riscv/include/asm/current.h
>> @@ -51,11 +51,11 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
>>   #define vcpu_guest_cpu_user_regs(vcpu) \
>>       (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
>>   
>> -#define switch_stack_and_jump(stack, fn) do {               \
>> -    asm volatile (                                          \
>> -            "mv sp, %0\n"                                   \
>> -            "j " #fn :: "r" (stack), "X" (fn) : "memory" ); \
>> -    unreachable();                                          \
>> +#define switch_stack_and_jump(stack, fn) do {                    \
>> +    asm volatile (                                               \
>> +            "mv sp, %0\n"                                        \
>> +            "jr %1" :: "r" (stack), "r" (fn) : "memory" );       \
>> +    unreachable();                                               \
>>   } while ( false )
> 
> Just as a note, with this simplified again, the \'s can avoid moving, at
> which point the diff becomes a single line.
> 
> Can be fixed on commit.

I would be happy with that.

Thanks.

~ Oleksii

