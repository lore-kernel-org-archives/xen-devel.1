Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA6C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 10:37:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381363.1624953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqq2k-0002MZ-QM; Mon, 03 Aug 2026 10:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381363.1624953; Mon, 03 Aug 2026 10:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqq2k-0002MS-Mp; Mon, 03 Aug 2026 10:37:14 +0000
Received: by outflank-mailman (input) for mailman id 1381363;
 Mon, 03 Aug 2026 10:37:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqq2k-0002MH-07
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 10:37:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqq2i-004fKp-Hp
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:37:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a706f4f-e002-0a2a0a5209dd-0a2a4507ca84-28
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:37:12 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a706f58-b4ea-0a2a45070019-d1558034ccd5-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:37:12 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so17849745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:37:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a6besm30189824f8f.22.2026.08.03.03.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 03:37:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1785753432; x=1786358232; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1YOnSiXDFhTOBMMsgIEia7N6LZYw+jLgptOHs4zxWg=;
        b=SLbETNjhWzYILVPBwHWG9/LWpor6ZsSC+L3Ij5OuOnMstXU9AbD2yJ9S4Xv7Da2bbT
         3Ba7cX8McoVO/106neU8za4wQZpgtHn2RhBLetPp+zmTutlKJQZyP+P4Mw+azdldW2vi
         q9ISdK58wP3Ov7kBQ4g0iaha73BD3zsjj5qU8xJphQRNOWLf9cDK42TnHm8Zt4Lhm5ab
         Ky9h2+lagY3nQLia2L1E2FHNHdfIFjksV81NTsZgriri1wODHAR4hYHYHutrDtJAbKMl
         lDy6dfBK3KJWPepPhFXsIIXVdR6rPsdWB4ja2oxdmdz/8nZX3oZ7yuMXzCYAyh0vmyt3
         Xz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753432; x=1786358232;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1YOnSiXDFhTOBMMsgIEia7N6LZYw+jLgptOHs4zxWg=;
        b=Y6+qaMlarSGQ5OIkQzAz3r+qhhus5Nn6QacZ4sbxgkf4wcznlk0DfdsOcjN60zN/Wj
         B2JInbWW8nuDX7Wd+hhK85rNbbCBUMM/GBZxg7PWny6N8g4zoHgmN5HXxSIOSHMWd3i2
         RhEGs/3XBYGTAL2vBGeYTXEhLFeowPSa2hZfszsWSF5scYEsTN6wRa5MPeCr18Xx0Th0
         3rXhVXFmcjqqRRdm0j5k2s5K/FWkw4OYckkpGsekxv4JC5+6nHHRUITIpYaeXglSk2EQ
         pGTUBOjygxkej5sqEjQw5p1iw/llx2eM2A8vEInVUsrg9pyRJ7s4nYCnOGhENTQjvKvh
         ODwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtJYP9kuDP+tg8mYKQhgC6X6/IF9lcZLpfO+nrRkt1dAJdJsx+QmZNokZ3RROXWefLEaTX1K0Eja8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7cbB3wzL4M+MVl/oWBQJJ0R5ppfr6wi0SYPSG1dANnPFlhT3j
	f7dODg13Mxf/1bnAkz8oY7+7E5A/Tvh1fecMyuwwjVymNVYp3JVf/4OdtzNJCegdrA==
X-Gm-Gg: AR+sD13dvl2i3fKIxyiDUo7thAupV5mdVfn8bRs875jEdf0LNakXRN5T5IE02ijJC9R
	lNzRdzi+TlOkBHLaTzk/EC9zENRrSjf7XMPwqwgL/CR6yv2OdwnPB6qbFWNACSxE6++DDhAOYQd
	/O7g3WibB4bdl4+y8hV+WkX+ipgGn5SEgCsEDsSG9rzDfeYdTRfJPbAD/FoJmGe1otonUQpH/4c
	1jsEXKFmWwJ4+v8XmQfa18J1oyd+L68xbz80979pzOlEVt2OkUsJIYI0gqd7rz+NCgepIYEWpR6
	OEovdaLZp2pwslmCD1WCBuxOKtQaJyKWRCdQmu9lmKc6Z6fO6plsRPWDwFLLguheOyxGKm+BsMX
	MZxpIGLRaO6qgShQAwp6VrmpeoLxxcndd8xMcsEyZ1W0GsXPkwGyjLUhSIPwuO9kzgrynZT6acd
	oti57ypbrwPrPh4wT+pgA6yzYcfsIct14Evm5c90zE+yqVO3/Bsnek/p0fQCnxUgu1bwKm/1hOl
	Ija2LB8/K5ZozRyI48dN1/QDR6yIFcRkIVgcP0+CuogqIYcJgSF
X-Received: by 2002:a05:600c:2294:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4980c67af97mr170252525e9.15.1785753431921;
        Mon, 03 Aug 2026 03:37:11 -0700 (PDT)
Message-ID: <3b1e19f9-ed72-4898-aa1a-f9f43c1700a0@suse.com>
Date: Mon, 3 Aug 2026 12:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
 <6501f040-ea59-4e78-8854-030f786dbcf7@suse.com>
 <191a9ddc-9f37-4d26-9141-7dfaf88cb26c@gmail.com>
 <489a1b05-4ae5-44ac-a73b-485669190b59@suse.com>
 <aca9e72d-ff6d-49e0-b128-6675c5521493@gmail.com>
 <79ea95df-29bf-4c9e-8097-2c2b991f27bf@suse.com>
 <39aa93bb-edb8-4f05-8b62-c2677d12fb0b@gmail.com>
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
In-Reply-To: <39aa93bb-edb8-4f05-8b62-c2677d12fb0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785753432-A68D9AE4-5E3DCEC8/0/0
X-purgate-type: clean
X-purgate-size: 3987

On 31.07.2026 16:59, Oleksii Kurochko wrote:
> 
> 
> On 7/30/26 6:03 PM, Jan Beulich wrote:
>> On 30.07.2026 17:46, Oleksii Kurochko wrote:
>>> On 7/30/26 9:42 AM, Jan Beulich wrote:
>>>> On 29.07.2026 16:55, Oleksii Kurochko wrote:
>>>>> On 7/27/26 5:41 PM, Jan Beulich wrote:
>>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>>> It was decided to add support for IMSIC from the start instead of having APLIC
>>>>>>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>>>>>>> which is not optimal from a performance standpoint.
>>>>>>>
>>>>>>> AIA provides a hardware-accelerated mechanism for delivering external
>>>>>>> interrupts to domains via "guest interrupt files" located in IMSIC.
>>>>>>> A single physical hart can implement multiple such files (up to GEILEN),
>>>>>>> allowing several virtual harts to receive interrupts directly from hardware.
>>>>>>>
>>>>>>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>>>>>>> for systems implementing AIA specification. Each CPU maintains
>>>>>>> a bitmap describing which guest interrupt files are currently in use.
>>>>>>>
>>>>>>> Add helpers to initialize the bitmap based on the number of available
>>>>>>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>>>>>>> when no longer needed. When assigning a VGEIN, the corresponding value
>>>>>>> is written to the VGEIN field of the guest hstatus register so that
>>>>>>> VS-level external interrupts are delivered from the selected interrupt
>>>>>>> file.
>>>>>>
>>>>>> And when exactly is this "assignment" intended to occur? vgein_assign() and
>>>>>> vgein_release() have no callers here, so this remains entirely unclear.
>>>>>
>>>>> [A] Agreed, I should have added that information to the commit message:
>>>>>
>>>>> VGEIN is assigned (via vgein_assign()) before jumping to the new vCPU
>>>>> execution context (in continue_new_vcpu()) and is re-assigned during
>>>>> vCPU migration from one pCPU to another.
>>>>>
>>>>> VGEIN is released (via vgein_release()) on the old pCPU during migration.
>>>>
>>>> That is, state of that vCPU is held in hardware for perhaps an extended
>>>> period of time after the vCPU was last de-scheduled. That's a fair
>>>> optimization (we do something similar on x86, albeit that has been
>>>> increasingly under question lately). However, doesn't this then require
>>>> sync_local_execstate() to become non-empty?
>>>
>>> IIUC, sync_local_execstate() is needed for the lazy context switch case
>>> when switching from vCPUA to the idle vCPU.
>>
>> Or when full state is to be obtained for a vCPU, for example.
> 
> I assume you're referring to XEN_DOMCTL_getvcpucontext, right?

Yes.

> In general, it seems that sync_local_execstate() is primarily an 
> optimization. If lazy switching isn't supported, then every time a vCPU 
> is de-scheduled, its state must be fully saved to memory. My 
> understanding is that everything will still work correctly, just less 
> efficiently.

The lazy switching is an optimization, yes. If any state is kept in
hardware, sync_local_execstate() has to be used when full state of a
vCPU is to be obtained. Supplying back stale state of "guest interrupt
files" can't be correct. (Of course you can also arrange to obtain
up-to-date state by custom means, but imo that's likely less desirable.)

> I'm curious how much this optimization actually helps. How often does it 
> happen that a vCPU is de-scheduled from a pCPU and then immediately 
> scheduled back onto the same pCPU without any other vCPU being scheduled 
> in between?

That heavily depends on overall load of the system. When pCPU-s aren't
over-subscribed, a HVM vCPU getting de-scheduled to wait for qemu to
handle a certain operation may very well be able to resume on the same
pCPU after completion of the ioreq. The less overhead there, the better.
(Just to give an example.)

Jan

