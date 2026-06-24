Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E15CDB47F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 12:40:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344885.1603901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMtw-00071X-TY; Wed, 24 Jun 2026 12:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344885.1603901; Wed, 24 Jun 2026 12:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMtw-00071Q-QI; Wed, 24 Jun 2026 12:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1344885;
 Wed, 24 Jun 2026 12:40:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcMtv-00071K-QH
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:40:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcMtv-00FeOJ-3U
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:40:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd032-5cb7-0a2a0a5109dd-0a2a45078cb0-20
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:40:18 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd032-9c8e-0a2a45070019-d155dd2be8aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:40:18 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so657472f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 05:40:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9371sm6690024f8f.21.2026.06.24.05.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 05:40:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782304818; x=1782909618; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DP8GIjgr3aGRZN5nVUccQ6GUWDqVASxyCQqjsgLsDuU=;
        b=BntbvVnitqls/62yXw6WmUBy6PDGs9VPHtUiaUMTLCQ+J+ACeTi2Hpp84naXWj3BGD
         7fCF1E2JKQQpB/vCi2BKaHHZbfyh9U0OA1LDdwHiNHgcwSoeJ7oaMwxhjPCHm8JeBWnY
         QflWzQGMw6QtiOkldHsvJS5bmISQWm4mP1Wp1InPFBqE6HVlXoBPRfNRAJk2Gz8O6qCj
         f2ZFjFLXr2uNN/AGb4giIvpJ/nFTTWLBXY1HKa++c9FsnJm1s7EdcLv/PA9qG5ChlqYE
         pBUfUC9AuTubknVKJDAW47PyURypYLFj74nqGnPB9tLX1yG8sy5mYyUWNzvSQ9B0BmFq
         s0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304818; x=1782909618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP8GIjgr3aGRZN5nVUccQ6GUWDqVASxyCQqjsgLsDuU=;
        b=QBljSTQyN6sKVt14zoXpq3rMz6wLg6lV5oAa9RdPh0PA9bgYnqrA1j7dCrtw84GSk7
         +Oz18ycFcwN4H8qeD6GJUEyGeo6n0lbNu4bDdW32d1lj9R2zQvzf0/0LSQi/8ar6Zvyp
         txY5Mzakv3pzDySY9gp0mNliZJtw0mV0b+nmt9QbCLdKBS8iZxNsylSmvGTLLuuRbtg3
         uAFybePaRbLst6u2lnJV8LqZSCzRX9YmLMGvb8tX30MmCc27JJDe6DPLBt28MjRD63XG
         +roscs2aABi1xJ95HPDqdIJoKsdTeh42Sbqls2O0ewJbMpucZEurLcYI4uySxjWV1joO
         QU6A==
X-Forwarded-Encrypted: i=1; AHgh+RoHQig8Mj1OVjLpGMMjK+JUXwZ3zYZWl7IY2Ny7qUgEq8uH1onC1w+IndPW/M4gvp3ewOeeYTE1O1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSehVorm1XuzL3VjVuwF1xIE5yycngdvfBGNVnDDBWZXaHXTeo
	CUXYOW0RyVCMHsohCFpZ6EnUHj1pRrALDAo4vjImynTGdss86rU09LhsI26GdQwaPQ==
X-Gm-Gg: AfdE7cmwMBBaZiW4qhqOqFMJo4JKlih+hhGYJVrNnMBcI5Xls69BWdgH/oXkYvkHiFH
	bAa3i7AzDkrytBdFlp3GZL0P8z6SrqLMV7jDfRm8ZoL+GHOC+/xm+aebKIzIZdMiFFXunDWuKnh
	ecK68ymdl1/xH27mthNDQXHNeX7HwD5kS2e7RL7QkjW9f2P38L+gNvf+7M4+U92QKIEqMViWpU5
	uFfBYiXzcawaTpAnD9TGfmPHdwP1AE+f4oQSPHDXUA3Gcs6TpVHF/v54TRryw35ofypADkD6a/o
	uKhzQgmqqz0I8nFdRQthCBT3s+KlVSWPqLD7YUKrj2mxdr+1JTc5f8CI28GdFZIgljm9otlnSr4
	Am5ErNriN7Xh/+WqjRHZxZ9kf9V+7cUG1i0NDnpXQ76f4Y/IujJLBv3p62J1oteAWLZVaMRtL9d
	eVWytkCCgqcgRl3eWqoMlwTmtNHQCZN2rTH/RjgdVDdW9isLeV9/xF9FQE6cxi1cH//bW06ObSs
	gX/
X-Received: by 2002:a05:6000:4007:b0:452:8286:86bf with SMTP id ffacd0b85a97d-46c09ec8318mr5133923f8f.1.1782304818363;
        Wed, 24 Jun 2026 05:40:18 -0700 (PDT)
Message-ID: <f649bec4-c603-4ad0-8269-33a9c9d2d8fa@suse.com>
Date: Wed, 24 Jun 2026 14:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <3fb06376e057fa99b0df78e97761b8cff56ca9eb.1781693963.git.oleksii.kurochko@gmail.com>
 <aa19d6b0-9407-423b-a786-a43a72b50df5@suse.com>
 <29fbbfe2-579c-4506-96d8-930c03a65c61@gmail.com>
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
In-Reply-To: <29fbbfe2-579c-4506-96d8-930c03a65c61@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782304818-FFD3425E-9F1128D1/0/0
X-purgate-type: clean
X-purgate-size: 1914

On 24.06.2026 12:43, Oleksii Kurochko wrote:
> 
> 
> On 6/22/26 4:09 PM, Jan Beulich wrote:
>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>> Introduce generation of the riscv,isa string passed to the guest via the
>>> Device Tree riscv,isa property.
>>>
>>> Introduce the per-domain isa string and guest isa bitmap, populated
>>> during domain creation by calling init_guest_isa().
>>>
>>> Introduce guest_unsupp to filter out ISA extensions that should not be
>>> exposed to guests:
>>>
>>> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>>>    for guests.
>>
>> I may have asked before - what about Zfinx, Zdinx (and the supposed Zqinx)?
>> They aren't in riscv_isa_ext[], yes, but perhaps wrongly so? And hence they
>> may want at least mentioning?
> 
> They are not supported by Xen so they aren't in riscv_isa_ext so it 
> looks fine for me.
> 
> They are not in guest_unsupp as they aren't present in riscv_isa_ext and 
> so it won't be propagated to guest anyway because of:
>    +    bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>    +                  RISCV_ISA_EXT_MAX);
> 
> While it isn't in riscv_isa_ext[] I think it is fine not to add them to 
> guest_unsupp, so I will add to the commit message that:
> ```
> - Zfinx, Zdinx and Zqinx are not implemented for guests either; as they 
> are not present in the riscv_isa_ext[] array, they can never be set in 
> riscv_isa and thus are never exposed to a guest, so there is no need to 
> list them explicitly in guest_unsupp.
> ```
> 
> I think it is fine for now but probably it will need to be reworked in 
> future.

Especially as long as F/D/Q aren't supported by Xen, I would consider it
pretty desirable to allow the (cheaper to implement on the Xen side) Z*inx.
Provided of course there's actual hardware offering any of Z*inx in place
of F/D (not so much Q).

Jan

