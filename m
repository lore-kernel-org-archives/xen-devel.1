Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E5606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hgepfgtu
Received: from list by lists.xenproject.org with outflank-mailman.1464388.1675058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNaN-0005Qg-9D; Thu, 29 Oct 2026 10:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464388.1675058; Thu, 29 Oct 2026 10:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNaN-0005QZ-6V; Thu, 29 Oct 2026 10:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1464388;
 Thu, 29 Oct 2026 10:42:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMNaM-0005QT-Df
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:42:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMNaL-0095oZ-Qm
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 11:42:17 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae32309-e002-0a2a0a5209dd-0a2a450cb26c-0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 11:42:17 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae32309-f479-0a2a450c0019-d1558032ec58-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 11:42:17 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso13620345e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 03:42:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a966a56abesm76404935e9.0.2026.10.29.03.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 03:42:16 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793270537; x=1793875337; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qysdC2k7d0sG9F2jerQoG3RmIk40HztTJ82JvP3wOZA=;
        b=HgepfgtufAJ1qXt+b+WESiS1sT8vBGXOygD1ix5NpsQ3kYqYt9mRokierQfP+JTErW
         WYCA7PrltB7fwqDczW5yUPFR9jtXm5DOznOVqL+zqRh6LRsTO7QbPmRN5uBsvqTVdPMb
         LOi5xrHeEkT4lY9IWBf+JvwzAPB18LoopEC83/dBzSmwdnqWupRA8U20UWpEFmBI/WNv
         mildOTarqnkWFVL4JK7X1lw5kgj8z5dnpbbQRINPZQ6vU+yDSGWVXjLArC3UuGglvy67
         Qiw/rvwPwPSBuJe8pnJsMj1YeiQX7AoB89+ZPMsNmD7iCS/YQf+Zu4rbDddH1zo3Lw5a
         Ykuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270537; x=1793875337;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qysdC2k7d0sG9F2jerQoG3RmIk40HztTJ82JvP3wOZA=;
        b=spPu/gcEMUvE5UdPSIAu56MkVzNnAbM+iWCubXHUmqtdCdiJX1Uwfd8P1X1Qa+Q6jA
         tCl6cQNOg0+80p/If3/WPIpAQSz6oNGPDWZ1ynEzOfUcdFKuWa6XIQFlNnLmzuYtAZ1X
         vyr6y2kpgu9WoWWBCOGkiy+S6S501pT7jATjO3WPaPmPQMd+uw6XO0l/C78cOR5NlUzG
         9++JX+UEeh0ZuY0avcxbiat8ddymLXMd/spmvmHVqbtyq4n7KTV1b2Ujq4DRBfpeJJPF
         AAWbm3B0YMumci2ygnMBYmayS5u8aa4o2JBX4b9qOwFiv1KKirEsvDoMFV7IqGezHqnf
         BYmg==
X-Gm-Message-State: AFq9FYLQ4ncpvy0iAGeBkDBP1jF5l+N/tLycPrxUp7AaJVV+ItL5UUCA
	cMtRVGFM+rfcsmb5eLRJjU3l+vIn3K+pXSc0gK/wE65q5agC1wJpDsUu
X-Gm-Gg: AYBFou1xbznpzWoEdl9ikiHZu/5cEsq6b5sG7a0N6k8YjaKKdhmSVm4NBGLdOKzVh6g
	WJoHDRC1+f5QJU5t1jh9aE7DP2xip5lxqiK9Qz1l9+j/qqOVpi48rNERwCPy5GlC7/BkpafG1pL
	r/M9HTfDSNaCB1pnavrKw7NNbBy5VOsqCnFK2V2w9ObMhBdMxI8QtkIiYeI9xgt/INGZ3C+fU9g
	fs03Qse5X3g7m1HrKczviPH5yMYyoymph8sAJpiiVTH3zs7UoAP/2j9qeIL8oczkDKuHwLxygrA
	I475yPw91EkbBPV+tmsb+U5hnmpOTIjJCpUTe7U0joLag2Fd4ZcfUZ1Jp/NE15l/vKSQccntCo/
	GG+C0pVYJDwnAKBr8k35ZcjW5WyxrhHatNYouGOTrrvAv2lHHHyDP6GlAIFbz4NVHpKDa3yQidD
	hUk6krDl0kx+LazRDb6NWdI6vKt0wSR4ndnp22OJxfHg70DeIkuCxxAu3T7gpJB9oJcQk9S9/T0
	Z03hrZUxIkWxAGzl4R2qHoN0lAlW8qXPU1xXlmWvGDu1d7WJj+dmxBRtBSXSfzFNQXaAyLL/tLx
	uhtzb9vPeAHKOb/BZUc+YXFQtRRBkF24Mr6gOr0GbhbbxD1rLzUAf+gMRehKuhncW4EXpPxOrIJ
	kP9s=
X-Received: by 2002:a05:600c:8b28:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a96720304cmr116968855e9.22.1793270536964;
        Thu, 29 Oct 2026 03:42:16 -0700 (PDT)
Message-ID: <83fd251c-4a1e-4057-8990-0f8a2f3d38b5@gmail.com>
Date: Thu, 29 Oct 2026 11:42:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
 <35fa29d5-fafc-43da-a5a5-72df8f367e3c@citrix.com>
 <1793208322.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793208322.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793270537-50D3CA5B-FD9A1B00/10/73395122804
X-purgate-type: spam
X-purgate-size: 2920
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/26 6:25 PM, Baptiste Le Duc wrote:
>>> +    asm_inline goto (
>>> +        "1: lw zero, 0(%[va])\n"
>>> +        ASM_EXTABLE(1b, %l[out])
>>> +        :
>>> +        : [va] "r" (va)
>>> +        : "memory"
>>> +        : out );
>>> +
>>> +    /* Order the load, and so its A bit update, before reading the PTE */
>> /* Check to see if hardware set A. */
> It doesn't explain the fence, but mine doesn't either. If you think it
> doesn't matter, then I will use what you propose in v11.
>>> +    RISCV_FENCE(r, r);
>>> +    a_set = read_pte(entry).pte & PTE_ACCESSED;
>>> +
>>> + out:
>> It's better to name this label 'fault' because that's what happened to
>> use it.
>>
>> What happens if you neither fault, and A doesn't get set?  Right now
>> you'll report Svade despite there being no fault.
> I don't know if such a case is allowed by the spec, but afaiu, and we
> talked a lot about that with Jan B and Oleksii, if we don't fault then
> we should report Svade.
>> You might or might not care to cover this case; that's up to the RISC-V
>> maintainers as to how likely it is to encounter in real life.
> I'm waiting for Jan B's and Oleksii's opinion on that point.

I think that architecturally, per the RISC-V Privileged ISA 
specification, this outcome is not possible. During the execution of lw 
zero, 0(%[va]), there are only two valid spec-defined behaviors:
- Hardware A/D update (Svadu): The load instruction succeeds, and the 
hardware atomically sets the A bit (PTE_ACCESSED) in the PTE.
- Software A/D update (Svade): The load instruction triggers a Load Page 
Fault because the A bit is clear.

The specification does not allow (or at least, I don't see it.) a third 
case where the load succeeds without setting the A bit.

However, I agree that if we encounter non-compliant hardware or a buggy 
emulator where the load succeeds without setting the A bit, concluding 
that it is Svade (which strictly implies a page fault occurred) would be 
logically incorrect.

Considering this is incorrect behavior per the spec, and given that 
having Svade support by default is safe, nothing bad will happen if we 
report Svade in such a case. So I would be okay with the current 
behavour in v10 and it seems to me enough for now.

At the same time, I won't NACK the suggested approach below as it is 
harmless; I just think this scenario will never happen in practice, so 
it would essentially be dead code.

>> But, if you do want to handle it, then you want something like
>>
>>      asm goto (...);
>>
>>      if ( 0 )
>>      {
>>      fault:
>>          got_fault = true;
>>      }
>>
>>      ...
>>
>>      if ( !got_fault && !a_set )
>>          panic("Neither Svade nor Svadu !?!\n");
>>
>>
>> The if (0) is a bit ugly but it's the only way to avoid needing a second
>> label.

~ Oleksii


