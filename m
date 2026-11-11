Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD5606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TYb+Ueph
Received: from list by lists.xenproject.org with outflank-mailman.1483135.1686688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR2y1-0002Vz-EJ; Wed, 11 Nov 2026 07:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483135.1686688; Wed, 11 Nov 2026 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR2y1-0002Vs-BT; Wed, 11 Nov 2026 07:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1483135;
 Wed, 11 Nov 2026 07:41:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR2xz-0002Vm-Dr
 for xen-devel@lists.xen.org; Wed, 11 Nov 2026 07:41:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR2xy-00DZlb-Q3
 for xen-devel@lists.xen.org; Wed, 11 Nov 2026 08:41:58 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af41c37-e002-0a2a0a5209dd-0a2a4503c6a6-40
 for <xen-devel@lists.xen.org>; Wed, 11 Nov 2026 08:41:58 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af41c46-fae8-0a2a45030019-d155dd32c18a-3
 for <xen-devel@lists.xen.org>; Wed, 11 Nov 2026 08:41:58 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1768048f8f.3
 for <xen-devel@lists.xen.org>; Tue, 10 Nov 2026 23:41:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498361f674fsm9390092f8f.33.2026.11.10.23.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 23:41:57 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794382918; x=1794987718; darn=lists.xen.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=um7ys9bc1I9I9W8c8NbVY8QSXJ2a9F3ZU3jrNGsOsgw=;
        b=TYb+Uephf9Vhf7/thCrmOUi63cq2Xbs322/OnJC35yuxsBCCg2sitnUWzKl+wKzaA1
         mR86mcA8qJVFHAbMlg4tRFZZT1tlGw3yy3OzHBipIbr1o1j5xBHzgIIqvXhiHH4xQKg6
         cAfqzdkLfd4uILNU0ydHtNrth+xRtrurtBvghPiBjzWKS/9PuYhQiLO5cyQvxHTNV0E7
         Kzoau59DizRZF/ggXOrIEBJNCHH8V9DuTBzrfAM6VvsuRiV/JBcYWrsWISNwZIBSNfl1
         +hrOEvz+g2GujkHhiR/Ln1Y1k4F/Gff2CzYAkB/TYhui0T0h/C/MlEzm/R3Sa2OI6vcY
         64Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382918; x=1794987718;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=um7ys9bc1I9I9W8c8NbVY8QSXJ2a9F3ZU3jrNGsOsgw=;
        b=wUDu5i4MrG3HYHD5wRt6gc3oyKFOX+na3uwQNvPsNirQErIyFfxIRuR6XqqTTZjEac
         bk2RxXI7+cCGFjGEM6MHHdTY7uUVEriwUasWfhHZFeHRAsnSqrfOhC0aYjHwdl4Ce5X2
         z+vxOqL6aE2e90xZIjAlJHedDbVvsqg0ONhZNyU+8kliw+IzpOSkRtiucyRtz804InXg
         RTGASv7KiEGjc40WElvRzPaT11LD0EsDDAyj2csanodV5Vk0o79WIXkqqA2HZ5Ym0l4F
         KoFPkdf+6a4/fcIMBGGTz3UOFp5TOsfcdJ+A4zAawJ+HDTMD6jgzueEp9T0072T9MUGl
         pQVw==
X-Forwarded-Encrypted: i=1; AL+hErETO/MfzEuufDo9tZMtgCaHOEQX9ZjepVGE5pmSUK0jVOPrKyoTeYDQGrFAHwI0vkiDIokuVwVOFDs=@lists.xen.org
X-Gm-Message-State: APuU4Z8Ug1S5ECLM1KZJLLS+Y4kju7gqF4UsUWDm8l/MwhvkTCmNX56K
	euxkb29iUNBBI4b/3mYbUeGw6x8D9BT6c2l9ydr7VbKVi6LaiyX2rw8sA6c1PoAspg==
X-Gm-Gg: AYBFou38JAD/cbvq9oIZPipebCcgGql2hNjem3GLDlJm2IJNwTVOLkFpVW4HXND87fX
	B93Nnju+9r7l9Oa7GLWQpuEcUyn+0woIuSNVv70TwcRogo4uzNNE4L4EAbc3OzbBK73QxzeFQnJ
	TDmnZML+8FHdRA0DLqLPzR27J1iDiHdGP7Zpuo2WsjsdT515Dzd9WuK9qMpvnW+pUv3pFunlxhY
	p3p1qfwtnrAMk2izwTyEYLacb/UV5F4WH+kJZfTX9AbRJcNltjjjvAifzc5CFCUApB8sJNUILqW
	uJsgBCrDA3iiNRYUmaj0D21eTKGgrbRFHILRtFeHNdpCpM8PMSj0djJLCXMniK2Kb3/vFap+El9
	AOm9/Hoje6AUKzsospic096FUVb0cVkRp4Iv+/hp2OzvuQ6T8VYSchyb9EWwAnI7Lc5nc0pMZ51
	w+6H6IJBgjIHVyQPhNBuU3izMfJz4MhdHu4KFTsHWmr6mYIFQxCL+HMYah1N43WZDMD0W53MhJB
	YNs119D805M//S/ki1OIGVQ/uEzMPUB2VfkKbI1pZyPCqPZ78Pbuj5UcqD5H9DPl3uk9M8cKmat
	h/B1hrDCceRQjQovy2Et9cybX5e/J5Iv+4/fyqsg9zFiRS+cmkqqHu9INWYqK/Q6YUWl2EluLiq
	8lnoid+ZRKd7WNm0x
X-Received: by 2002:a05:6000:2c05:b0:492:fcfd:f281 with SMTP id ffacd0b85a97d-499c72712b3mr2312072f8f.17.1794382918095;
        Tue, 10 Nov 2026 23:41:58 -0800 (PST)
Message-ID: <0d3f95a2-6eb7-47d1-9910-bee2a048af22@suse.com>
Date: Wed, 11 Nov 2026 08:41:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
 <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
 <b35c6a2f-753c-4691-aa9f-f67f2f7f37ef@cortex-media.de>
 <eff24ce3-bb48-4d2b-993c-65974d3af00e@cortex-media.de>
 <ad48ac1c-176d-407f-87e1-ae303e8eb195@suse.com>
 <8138ed44-727f-45bc-9673-9684e922595b@cortex-media.de>
 <ecfac9d0-eb72-4bb4-8aab-879cfa5dffd9@suse.com>
 <2a44faa9-9a9f-4681-84d6-8267acbec9b0@cortex-media.de>
 <a1785adc-93e9-42dc-a3cb-9e8edf00289c@suse.com>
 <d39dd9e5-b58c-4504-b559-cc449a8f7f87@cortex-media.de>
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
In-Reply-To: <d39dd9e5-b58c-4504-b559-cc449a8f7f87@cortex-media.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794382918-778C54E9-32EFDC58/10/78276251493
X-purgate-type: spam
X-purgate-size: 8467
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 10:59, Peter Deggendorfer wrote:
> Am 02.11.2026 um 13:54 schrieb Jan Beulich:
>> On 31.10.2026 14:44, Peter Deggendorfer wrote:
>>> As requested, I added a printk to mcheck_mca_logout(), and the BUG() in
>>> mc_ec2type() is still replaced. These are the only changes against the
>>> Debian package:
>>>
>>> --- a/xen/arch/x86/cpu/mcheck/mce_amd.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
>>> @@ -97,7 +97,7 @@
>>>        if ( errorcode & MC_EC_TLB_TYPE )
>>>            return MC_EC_TLB_TYPE;
>>>        /* Unreached */
>>> -    BUG();
>>> +    printk(XENLOG_WARNING "MCE: unknown AMD error code %#x\n", errorcode);
>>>        return 0;
>>>    }
>>>
>>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>>> @@ -304,3 +304,6 @@
>>>            if ( !(status & MCi_STATUS_VAL) )
>>>                continue; /* this bank has no valid telemetry */
>>>
>>> +        if ( who == MCA_POLLER )
>>> +            printk(XENLOG_WARNING "MCE: CPU%u bank %d status %#"PRIx64"\n",
>>> +                   smp_processor_id(), i, status);
>>>
>>>
>>> We now have some data points:
>>>
>>> (XEN) [2026-10-27 13:42:10.588] MCE: CPU2 bank 23 status 0x830824448b48ffff
>>> (XEN) [2026-10-27 18:19:55.593] MCE: CPU2 bank 23 status 0xffffffffffffffff
>>> (XEN) [2026-10-27 22:11:10.596] MCE: CPU2 bank 17 status 0xffff832036a40048
>>> (XEN) [2026-10-27 22:11:10.596] MCE: unknown AMD error code 0x48
>>> (XEN) [2026-10-28 00:33:55.597] MCE: CPU2 bank 10 status 0xffff82d04022a8af
>>> (XEN) [2026-10-28 05:26:40.599] MCE: CPU2 bank 17 status 0xffff82d0402408e3
>>> (XEN) [2026-10-29 23:17:25.618] MCE: CPU2 bank 17 status 0xffff82d04022a8af
>>> (XEN) [2026-10-30 03:25:10.622] MCE: CPU2 bank 23 status 0xffffffffffffffff
>>> (XEN) [2026-10-30 10:05:55.625] MCE: CPU2 bank 10 status 0xffffffffffffffff
>>> (XEN) [2026-10-31 00:58:10.625] MCE: CPU2 bank 17 status 0xffff888100b872e8
>>> (XEN) [2026-10-31 00:58:10.625] MCE: unknown AMD error code 0x72e8
>>> (XEN) [2026-10-31 04:17:55.632] MCE: CPU2 bank 23 status 0xffff831f00006000
>>> (XEN) [2026-10-31 04:17:55.632] MCE: unknown AMD error code 0x6000
>>>
>>> Only 3 of these would have hit the BUG(); the others have UC clear or
>>> an error code that happens to contain a type bit.
>>>
>>> The values look like pointers rather than status registers:
>>>
>>>     ffff82d040......  Xen text/data -- the prefix of every RIP in my
>>>                       earlier panic dumps
>>>     ffff831f........ / ffff8320........  same range as rsp in those
>>>                       dumps (e.g. ffff831fe6b3fc38, ffff832036a87c38)
>>>     ffff888100b872e8  dom0 Linux range?
>> Plus the very first of the entries above is a pointer value rotated by 16 bits.
>>
>>> Two things that make me doubt these are real status values at all:
>>> 0xffff82d04022a8af appears twice, 47 hours apart, for two different
>>> banks (10 and 17). And all timestamps are congruent mod 15 seconds,
>>> i.e. this is the poller hitting it on a small fraction of passes.
>> There's no question that the values are garbage. We just need to find out why
>> that is. As we have to explore all (remote) possibilities, first of all - you
>> don't play any games involving the XEN_MC_msrinject hypercall, do you? For
>> the immediate purpose here, and since ...
> 
> No, I never used XEN_MC_msrinject hypercall on this host; it's a
> plain Debian trixie installation.
> 
> 
>>> I don't know where the read goes wrong.
>> ... I can't make sense of the behavior either, I'm inclined to suggest that
>> you add this hunk to your debugging patch:
>>
>> --- a/xen/arch/x86/cpu/mcheck/mce.h
>> +++ b/xen/arch/x86/cpu/mcheck/mce.h
>> @@ -79,7 +79,6 @@
>>   static inline uint64_t mca_rdmsr(unsigned int msr)
>>   {
>>       uint64_t val;
>> -    if (intpose_lookup(smp_processor_id(), msr, &val) == NULL)
>>           rdmsrl(msr, val);
>>       return val;
>>   }

Can you please replace this by

--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -79,8 +79,18 @@ extern bool intpose_inval(unsigned int c
 static inline uint64_t mca_rdmsr(unsigned int msr)
 {
     uint64_t val;
-    if (intpose_lookup(smp_processor_id(), msr, &val) == NULL)
-        rdmsrl(msr, val);
+
+    if ( !intpose_lookup(smp_processor_id(), msr, &val) )
+    {
+        unsigned long lo = 0x555555555555UL, hi = 0xaaaaaaaaU;
+
+        asm volatile ( "rdmsr"
+                       : "+a" (lo), "+d" (hi)
+                       : "c" (msr) );
+
+        val = (hi << 32) | lo;
+    }
+
     return val;
 }
 
From ...

>>> /dev/mcelog records match the log lines one-to-one (same banks,
>>> same order, all CPU 2), but carry status zero in every case. The record's
>>> status comes from the second read in mca_init_bank(), before
>>> mcabank_clear(), so that second read returned 0.
>> Based on this observation, another thing you may want to try is extend the
>> existing hunk you have to
>>
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -304,6 +304,17 @@
>>            if ( !(status & MCi_STATUS_VAL) )
>>                continue; /* this bank has no valid telemetry */
>>
>> +        if ( who == MCA_POLLER )
>> +        {
>> +            printk("MCE: CPU%u bank %d status %#"PRIx64"\n",
>> +                   smp_processor_id(), i, status);
>> +            status = mca_rdmsr(MSR_IA32_MCx_STATUS(i));
>> +            printk("MCE: CPU%u bank %d -> %#"PRIx64"\n",
>> +                   smp_processor_id(), i, status);
>> +            if ( !(status & MCi_STATUS_VAL) )
>> +                continue;
>> +        }
>> +
>>           /*
>>            * For Intel Latest CPU CMCI/MCE Handler caller, we need to
>>            * decide whether to clear bank by MCi_STATUS bit value such as
>>
> 
> 
> Since 2026-11-03 the host runs Xen 4.20.5-pre (Debian
> 4.20.4+39-gf1e1321c87-0+deb13u1) with your two debugging hunks
> (intpose_lookup() removed from mca_rdmsr(), re-read in the poller) and
> your "x86/MCE: reduce redundant code" series (both patches). In 7 days:
> 
> 
> (XEN) [2026-11-03 13:54:50.378] MCE: CPU2 bank 25 status 0x8000001fe67e1163
> (XEN) [2026-11-03 13:54:50.378] MCE: CPU2 bank 25 -> 0
> (XEN) [2026-11-03 14:52:20.360] MCE: CPU2 bank 7 status 0x8000000080000000
> (XEN) [2026-11-03 14:52:20.360] MCE: CPU2 bank 7 -> 0
> (XEN) [2026-11-03 20:01:20.264] MCE: CPU2 bank 25 status 0xffff82d04022a8ef
> (XEN) [2026-11-03 20:01:20.264] MCE: CPU2 bank 25 -> 0
> (XEN) [2026-11-05 14:31:19.276] MCE: CPU2 bank 25 status 0x8000001fe67e1163
> (XEN) [2026-11-05 14:31:19.276] MCE: CPU2 bank 25 -> 0
> (XEN) [2026-11-06 11:27:18.812] MCE: CPU2 bank 24 status 0xffff832036a754c0
> (XEN) [2026-11-06 11:27:18.812] MCE: CPU2 bank 24 -> 0
> (XEN) [2026-11-06 18:26:48.671] MCE: CPU2 bank 7 status 0xffff831fe6b154c0
> (XEN) [2026-11-06 18:26:48.671] MCE: CPU2 bank 7 -> 0
> (XEN) [2026-11-07 06:31:48.345] MCE: CPU2 bank 16 status 0xffff8313f11d2010
> (XEN) [2026-11-07 06:31:48.345] MCE: CPU2 bank 16 -> 0
> (XEN) [2026-11-07 09:41:48.243] MCE: CPU2 bank 16 status 0xffffffffffffffff
> (XEN) [2026-11-07 09:41:48.243] MCE: CPU2 bank 16 -> 0
> (XEN) [2026-11-07 21:32:17.875] MCE: CPU2 bank 7 status 0xffff83203a5ea2d0
> (XEN) [2026-11-07 21:32:17.875] MCE: CPU2 bank 7 -> 0
> (XEN) [2026-11-08 06:25:47.633] MCE: CPU2 bank 16 status 0xffffffffffffffff
> (XEN) [2026-11-08 06:25:47.633] MCE: CPU2 bank 16 -> 0
> (XEN) [2026-11-08 15:11:17.390] MCE: CPU2 bank 16 status 0xffff82d040588f80
> (XEN) [2026-11-08 15:11:17.390] MCE: CPU2 bank 16 -> 0
> (XEN) [2026-11-09 07:29:46.980] MCE: CPU2 bank 16 status 0xffffffffffffffff
> (XEN) [2026-11-09 07:29:46.980] MCE: CPU2 bank 16 -> 0
> (XEN) [2026-11-09 10:49:46.880] MCE: CPU2 bank 7 status 0xffffffffffffffff
> (XEN) [2026-11-09 10:49:46.880] MCE: CPU2 bank 7 -> 0
> (XEN) [2026-11-09 13:09:16.822] MCE: CPU2 bank 7 status 0xffffffffffffffff
> (XEN) [2026-11-09 13:09:16.822] MCE: CPU2 bank 7 -> 0

... this it almost looks as if the first RDMSR is "skipped" altogether. The
changed debugging hunk might further confirm that, at which point I think
we need to assume that there is some issue with the hardware here (which is
already suggested by all instances being confined to CPU2).

Jan

