Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7080CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:57:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446295.1662392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFaN-00067O-Rl; Mon, 12 Oct 2026 12:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446295.1662392; Mon, 12 Oct 2026 12:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFaN-00067H-O1; Mon, 12 Oct 2026 12:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1446295;
 Mon, 12 Oct 2026 12:56:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGFaM-000678-E3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFaL-00GFKY-3I
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:56:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd913-2eae-0a2a0a5409dd-0a2a4503e690-22
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:56:57 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd918-fae8-0a2a45030019-d1558034b1d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:56:56 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so16051685e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:56:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a193f2c992sm201361645e9.5.2026.10.12.05.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 05:56:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1791809816; x=1792414616; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u95/uf81bePCKi/y4LbsZNAPkynnjwYKUeGvgiq9Vls=;
        b=T8t6OMC/Jm3mesiyqCg3CWK3nhVmWCagpURSBU28dK3PfjtHSMvYs9aNv66jq9PTJX
         ENly1uwQTiIuyaS/ehohyeH3AUwo6uZFPPZ/oYq7hiphntrPL7gM8+0Gfj/HmyzMBYkQ
         7XBwMhWExr665RnDPGWOC62BJ5cTQyI5DtE/4TeDqrQhByaeqLkkTAB4P1sC87uwvRfR
         Lk2i+8S5nHLnruV7lHOuOZbc0e0RQsCN4+O1MGuqmsnPPqh/KnRdRhqnp+op1J/XFTy2
         TGyPTgCv0H6jvRNhpAYBkLqB7HSN4OUzqlAWbGmcDz0n62s6uEKKNAtf6KiXyLTUKf0h
         HJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809816; x=1792414616;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u95/uf81bePCKi/y4LbsZNAPkynnjwYKUeGvgiq9Vls=;
        b=t/Thl/2ai6CRZSVoqogyB0SW3IKqXtdpuqHX/dYyyWGIrd9RTqFBS1jgjp58RjYg+a
         a8FDcijqUzFCIwPIkUIxLrLpSJYQ6H7aRzdI7DbvXQFKUg7w4xQFRM5fk0R/4RjgJBuL
         7fwl1dQg1hDe5yOCTpftdAX9npJXpRRDLXC07ZCN/m8tmNctHl8dw6z2h/nIar7EmSU7
         JmRR6F42jZwPL/ZISiyQDd5uxAPUruyW9hPszT1W7PEC1NqcNSq+kFzTB4GJ12tMu7FK
         YxesedMz3zqXycHDX6qgdc68ZZM0a4Bqvoq+oEckWvXMK8M3Vb6ekl4vLYaJraaq/6RC
         7SSA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7GpGjQih9KFeaDa84eU3wgGIIcfSffTCqr4X5jCNoDjvjOx5Y1ka+w5n4sJE1nHzN087vKXl5AM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKWfyYKxjmhDyKEGnHAGud30Ah6ESPSuvw5HAfkFA/+vp0f6HM3
	faiGgcDwuEwJO0+VnGeJX4GrgTvBs1vSS7VTkuy3jetQDU2w4cWyJr/slyTugK2HkQ==
X-Gm-Gg: AYBFou1KFHejTf8mmRqESyzwEiKIyqLcTO6GaDnnJmVTQRJXzmLqrtzc0kIvPJf59d/
	1VESbl8bq1M62uVpb0H2Kd03kCTkW8CxqQiDPt4LPF8HM8+xcoi0FUb1Yaz7djJ1+lDOj0eQhtQ
	fpuP6/TyIdkvujeo63juB609FNkSXGtJgbST4Sf42XLgxaYkBG26DEwP/rhmKaF3mfAIUPPzORz
	k6um7KwJhqhkB8OYhIcomkx9W1bT5NH+g7x/7B+B/7ZWHmJbhY6gDYEEzl5omfRnXO26fZ8s+Gw
	Uy1m10vCvqBL+OLIAw+yCjJovayXsNGKwdONda6CeY60af0ywR92wQUkRmkE0xigeNMUx5eA2Gw
	LSCiH4NX25ttTt3fU/USLTzEpSnPJAj2/1jgYU0uBC/bhuyuTtO4bcoihZSd151h3cx4CN1ivu/
	IassfEMUvKp7EgOozdLim18xwZMyszdQVZo8w9hZBimZL/YNMbVwmM4c2ULEdVVixckhuUlEs9T
	lUwnRAXZzDRFKu3mMEBU1IqnLZUkElQvoXPLrRUtX5S6Gtvj9rpLOYgx8cTNU0=
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr164344215e9.12.1791809816361;
        Mon, 12 Oct 2026 05:56:56 -0700 (PDT)
Message-ID: <be9c9f29-e211-4b84-a3b1-fd65f3b52315@suse.com>
Date: Mon, 12 Oct 2026 14:56:56 +0200
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
X-purgate-ID: tlsNG-33051d/1791809816-77AF14E9-D51F6DD3/10/78276251493
X-purgate-type: spam
X-purgate-size: 2111

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
> 
> The unbounded wait can hang early Xen boot if the UART never reports 
> TEMT for some reason(?). Bounding the wait would make console 
> initialization more robust, allowing boot to continue when the UART is 
> unavailable
> 
>      for ( i = 0; i < 50000; i++ )
>      {
>          if ( ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT )
>              break;
>          udelay(10);
>      }
> 
> would need udelay() on RISC-V, which is still a BUG_ON() stub, so a
> separate patch would be needed for that. On x86, udelay() doesn't delay
> yet at this point (cpu_khz is only set by early_time_init()), so there
> the loop would just be an iteration count. Perhaps someone has a better
> idea of how to implement a timeout here.

Whatever it is, it's going to be more or less crude. See e.g. Marek's
solution for a similar issue (yet to be committed):
https://lists.xen.org/archives/html/xen-devel/2026-10/msg00439.html

Jan

