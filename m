Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF6606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VX3RlKqw
Received: from list by lists.xenproject.org with outflank-mailman.1491157.1692049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSylF-0004Wf-6i; Mon, 16 Nov 2026 15:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491157.1692049; Mon, 16 Nov 2026 15:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSylF-0004WY-3x; Mon, 16 Nov 2026 15:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1491157;
 Mon, 16 Nov 2026 15:36:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSylD-0004WS-Mi
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:36:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSylD-00Fm75-2r
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:36:47 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb2305-8faa-0a2a0a5109dd-0a2a4503b81e-20
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:36:46 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb230e-fae8-0a2a45030019-d155dd31c171-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:36:46 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1792896f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:36:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49d673ce75fsm16498630f8f.55.2026.11.16.07.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 07:36:45 -0800 (PST)
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
        d=suse.com; s=google; t=1794843406; x=1795448206; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLstwGeMbltc5bYe8WHRP+mhN4R6PH65liBk/pcCEQU=;
        b=VX3RlKqw5rutKJIpAp3sIMl+CiECk4F+0RyQoVu6xDaWwN41+YV3etnkXsJbeMfuTL
         NAayLoOy/qk99marpchXWXqbdhHwhDTUo8Q2RLKm2iJSS0475CYQtpJaCrSE8RWDOcfL
         U21Ouwxs2KazhW8UaJ+kRavIdGz4x9uDlOwN0DA0i9kk2LRZ+zUf3Q2ryc/9jRTsgcot
         8wu6HtKhxmbtV8XT3VXBt5BX2KdybQEieLAUqU+R03ohn4t/Y+rYHvLFCsgYIvcEFxZv
         1uchTeoEM/sKmn/UsLfK9pLSlwJxv6TDFGwpOFVkfqDmw/JeUwtAQ3Q/u++ITAwBpy+D
         6gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843406; x=1795448206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLstwGeMbltc5bYe8WHRP+mhN4R6PH65liBk/pcCEQU=;
        b=binacoEtzwizUx+JQSOvHhwWnlnQLBLUroPUQ0ossjzljZJd6rs+WV60zQIkTJFlKH
         qBGEYFFe1+whzt8Vyuu9RtkoXxuCJodLWVDcEkvDYI7YmY5MZ3fm6ZIwV9x2pFKXQ1na
         snSR6ZzGM76j14d95aZZwSREWmQMoj5iO9ONg2cDXC4rhgEWf8mpsL+lp4MCuaolc7t2
         S1ZimD416kYE2jysATIuIXzIxMnf0s2ZsPtllAehGCRUy05rVn+pVPfjEx1pFSr+y78K
         yFgBH52gPZw4HOMvAoQgRb6jjPL9pwR7WRr+pr4mLTlQM9BVEXX8PuXdF03RFXBkJH9r
         XZhw==
X-Forwarded-Encrypted: i=1; AL+hErGqnynb1RLij6KTNngzgWs/BlNJqHwYcbk/4SNUPpy9AFA4IsbVO5TaZaN87JXgODSyDj4rfbOvZSw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8lxN1ixa9ivrxzQoZYKz/am2ijLD3XwZQFuxU/QYlt8GxnIwA/
	XZwWvpKQSy5fOx8PGRwpoKnpNp2X5BMTjCLce762UwotzSqvGHNDJLtyTnTBWxkCdA==
X-Gm-Gg: AZFdTZf+LG/Hj3KMtunZF/Q2ip7NQ7hXktg7wpU1b6O7k1k9GVq/sAHkvyAglrx4Tc9
	pcahj/qBDShruEzwstb4SRSSocHEsydEhOkPs1JqC+nq30MggKhFnW+jST5u7+zqPYxma3BUr2z
	DX0LpDuAI1GmgKbHJF9xiTDG2yIb9d/HXKRovLS6b5LW4eNa0ioHFdE8ofc8jVMhxI21qBxTjEq
	EI6QZ1enScVzB3COpGGPsijPscKC8BlSPNJP+Ws5wpkGS0vYFD23CtiG2q7YF22wKvsgQ/zYMvs
	TrCFBiNRCAvXrKkF8njlkyyNwVc7ZT2f4LFbgiB8N7Lr554ajHIsJacDzlWrHulfWhDs+mVo2Kk
	WBebwO/M4AtxfNrTM96i2v0rs8VS2q/EZV5iBQlc4CbOV9FgGje3Rk4Qm/HRrTLui2Vq6GAQeZR
	NPNDgSxD1my10gV27p68cccJrJZ54cYUFdOTih7pjyjc9byWEKd0qQmPLjoAypdK0nl8oi8Preo
	YFH3iVPI882W4apQyqPQodTEv5pW16alDbjqEAIMsFb2jLPqyaGcNq+vKpuqOmdoSf/FPnvMEei
	VW/Y8Cp8+A6kIPXtSs9p6XAUXq1RE5v8qyi5Y0rJI1e6H1HKM3VQ9m6FmJ3+yI5R7q4m3qsfr06
	2PhCemAc4ffJ1URLV
X-Received: by 2002:adf:e191:0:b0:491:d3b4:4e42 with SMTP id ffacd0b85a97d-49c73ce587dmr20846882f8f.52.1794843406349;
        Mon, 16 Nov 2026 07:36:46 -0800 (PST)
Message-ID: <d37e0e49-3822-4088-9016-31178facac0c@suse.com>
Date: Mon, 16 Nov 2026 16:36:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
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
In-Reply-To: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794843406-776F34E9-5B204EBD/10/78276251493
X-purgate-type: spam
X-purgate-size: 2127
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 16:29, Baptiste Le Duc wrote:
> @@ -442,15 +442,34 @@ int __init imsic_init(const struct dt_device_node *node)
>              goto imsic_init_err;
>          }
>  
> -        if ( mmios[i].size != expected_mmio_size )
> +        /* A register set must not run past the end of its group. */
> +        offset = mmios[i].base_addr & (group_size - 1);
> +        if ( mmios[i].size + offset > group_size )
>          {
>              rc = -EINVAL;
> -            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
> -                   node->name, mmios[i].size, expected_mmio_size);
> +            printk(XENLOG_ERR
> +                   "%s: IMSIC MMIO regset %u (offset %#lx + size %#lx) exceeds group size %#lx\n",
> +                   node->name, i, offset, mmios[i].size, group_size);
>              goto imsic_init_err;
>          }
> +
> +        /* The last slot may be cut short, see the lookup below. */
> +        nr_slots += DIV_ROUND_UP(mmios[i].size,
> +                                 IMSIC_HART_SIZE(imsic_cfg.guest_index_bits));
>      }
>  
> +    /*
> +     * Parent irq i is given hart slot i, counting slots across the register
> +     * sets in order. A slot with no hart behind it therefore shifts every
> +     * later irq one slot early, onto the previous hart's interrupt file.
> +     * Counting can't tell that from harmless unused slots at the end, hence
> +     * only a warning.
> +     */
> +    if ( nr_slots > nr_parent_irqs )
> +        printk(XENLOG_WARNING
> +               "%s: %lu hart slots in IMSIC MMIO regsets for %u parent irqs, unused slots must only be at the end of the last regset\n",

I'll leave full review to Oleksii, just a remark here: This wants shortening some.
Not only for source line length (we allow going past 80 cols, but please not this
much), but also for what actually ends up on a serial console. For example, I
wonder whether what follows after the comma really needs to go to the log. If the
message appears, context info can be obtained by consulting the source.

Jan

