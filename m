Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E99CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:00:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446307.1662410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFde-0008Om-ER; Mon, 12 Oct 2026 13:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446307.1662410; Mon, 12 Oct 2026 13:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFde-0008Of-BZ; Mon, 12 Oct 2026 13:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1446307;
 Mon, 12 Oct 2026 13:00:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGFdc-0008OP-Pc
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:00:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFdc-00FTUn-6H
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:00:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd9dd-2eae-0a2a0a5409dd-0a2a450ced44-28
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:00:20 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd9e4-f479-0a2a450c0019-d155dd34e5ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:00:20 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso1067445f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 06:00:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac02cfsm18407157f8f.39.2026.10.12.06.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 06:00:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1791810019; x=1792414819; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJQGPJanJDXg6DbqvTSjWrKAiReORlhKwHO8IL2DMA8=;
        b=gQoDj5O2+Bm5JHkDHvWNq/GeZ6cUAwq+PiG2J+LFN9ouX1v3you+wkjMCObfOYLFYa
         t/VdPhDHP5txRRGu2ZAMqsSPl2OABDC2eOM1WieyXULBorw+LKTXuyzw3bTqh/YIaOxK
         i3TS80NmbEWvrTUJbYsLkySLt2eLQlQRWdoq4cYwfKMWQAUsx9rOR+22H3QtRfGvDksI
         DIbNJapAO5CAhQCwNjlpyxNeYo4Rs8StBKCM32cfbH3dClLn5J6WGRrjJFLseZDatwqU
         TQ1xMWE2gdTCAtpmkLkNwQNRGyHrJtDBsbIlAw5X4y9+PCWGgoKs+rskwubzAWbH5KOq
         Kh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810019; x=1792414819;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJQGPJanJDXg6DbqvTSjWrKAiReORlhKwHO8IL2DMA8=;
        b=Hf4G2GV4yk3rJ+Li5rbD1+FtLd0pfGzCPqfV19sIkI2c+Ewx5Sg3zKqxpcpjAaKI/k
         n4q2ziFFw+dKaF71OMHp+RvJ1Gq5ly7zqbrzBefq5OSrsQi4wJSsbmnACgmHcN3a2gLO
         hlOF+4QwIRrKFTvqN4XNTJl0+mKH+eWcN7mzA7E26MkREETG3RbhbdB7mVQKOU7L4RO9
         F9BOa9M++4uiDhAZ4wp5pyv26Ri6PSXVGN6GUsVWvSXCInxzOU6i7lxEXsCXP3+15CUi
         c0kqBncEXDtO8IGnCZGl9FvbHmNjSNYGRhquHxMksEpHyH3/TdSFieyDUBEZMmyeaQGB
         rgVA==
X-Forwarded-Encrypted: i=1; AKwUvBx7eYQ+kOktWeS/CdXshNtMKuUxaNyqUkoxh6z1FFuOeSJDsC4nz0nhAQZaBMOcKqrHIRzEySy7rd0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKqKAQKa1eD0ukRsnFIssqwMk9A25Ox1zJ2v8ZfKB+JqRSDr4ew
	zOjsLmesC+uEA8Ie+hReiIM/VQCwabViRdQKIF0eArv0REDHP/GVAdII2eomS4tYIQ==
X-Gm-Gg: AYBFou2SkEqtETQ0CbLGxylsExvt9FQEAWPGVko7/a0cjrhNMPYnZV7lgIuPpcIQf2E
	dEbXRPa1YHAHPYoLv0zuTdP7h0D9PQF7QvwMWqx3LfIyRh+Tp02OEhKkZIBKCUXasxhCAKSSGFP
	Ceg11Z4bnu1Bzrq91m8sT58mS+m3LoGMWHButTIID8tZ15UoR6hTjVCHkijmWXgB1Cfrv4IIcLU
	6D1CvWPM0yqvIxXp/B+taqg0CEDNdDnd7gO4lSEmjJoojYtu7yFDTf2lxOJAfdpp9L5otTBKlZ1
	1PiGiHVjD97MHb8Z+ZUFK7Y9CsPSqYXQAEP/hGfxmGy612t+TGhhJwRVpkWVq7AfGp1wE88XjWT
	fcOxEHiKDIQgMHf9hsHScvY6bBB66OY9yziu+f4FoEEgb3lGn0nsgf7JG94xOLmak+CMruwg16/
	wqx/2wrvB6jc1bcvt4MojUEo9jQh4wMGYxvBV7Knj5Z4f8cDdZ0LteD5yZRlaScdRwHwVF73Kc/
	zTNmRNnSnqH4GY45x2qsKepc1A2GyAsFnq6Sm33pxcAibr/Eve8eVAO2AJ3aw==
X-Received: by 2002:a5d:5d83:0:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48dba9d326amr17562080f8f.33.1791810019466;
        Mon, 12 Oct 2026 06:00:19 -0700 (PDT)
Message-ID: <2415e2b7-3066-450b-9917-d1267a1c2b90@suse.com>
Date: Mon, 12 Oct 2026 15:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
 <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
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
In-Reply-To: <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1791810020-03CD3A5B-36B47E1A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1284

On 12.10.2026 12:20, Oleksii Kurochko wrote:
> On 10/10/26 5:14 AM, Zhang Zheng wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -427,6 +427,10 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
>>   #endif
>>       }
>>   
>> +    /* Preserve output queued by firmware before taking over the UART. */
> я'
> Could the comment say why the wait is needed at this point? Something
> like:
> 
>      /*
>       * Output written before ns16550 takes over (e.g. by firmware or the
>       * early console) may still be in the transmitter. Let it drain before
>       * ns16550_setup_preirq() reprograms the line settings and resets the
>       * FIFOs.
>       */
> 
>> +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
>> +        cpu_relax();
>> +
> 
> IMO waiting for TEMT rather than THRE is the right choice: besides
> resetting the FIFOs, ns16550_setup_preirq() reprograms the divisor and
> LCR, which would corrupt a character still being shifted out. (Linux
> waits for UART_LSR_BOTH_EMPTY, i.e. THRE | TEMT, but on a 16550 TEMT
> already implies THRE.)

Then again we have the .lsr_mask field. Not using it here would then call
for justification in the description.

Jan

