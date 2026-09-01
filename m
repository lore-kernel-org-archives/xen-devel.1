Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D9EC61DD3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:02:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404480.1638158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IVE-00074e-Ki; Tue, 01 Sep 2026 07:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404480.1638158; Tue, 01 Sep 2026 07:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IVE-00074X-Gx; Tue, 01 Sep 2026 07:01:52 +0000
Received: by outflank-mailman (input) for mailman id 1404480;
 Tue, 01 Sep 2026 07:01:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1IVE-00074R-14
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:01:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1IVD-00Fsml-8l
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:01:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96785f-e002-0a2a0a5209dd-0a2a4501d422-0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:01:51 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96785e-5984-0a2a45010019-d1558030bc67-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:01:51 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so42490845e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:01:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1a3fesm46873915e9.12.2026.09.01.00.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:01:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1788246110; x=1788850910; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWJvhunbu2wsQEy2Tx4KY7Dc3vJnkE4zsqOa7hH4Qik=;
        b=UeHzDyCN9GCaYepQD8TYzOez9FG816lUK/mz2xGkimqt7tBewa4J1d++SU0Fvcbd/q
         P092PBLRneRFnfeMbZ4xQYIkwSSGj+cegmn+H88LCp5/gZK1iJm7/JPn8qz6h9yPun5m
         8KTwx/NZRysW2wcqE7DM1iMytJ0EGatoObdVeopvOjuymMaQyeXrsRP8BOsgZmrLOdw9
         3O10YXLI9Hp/4lW+uLcjVNKiGipd1Ia8XzQdcx3wjojl600PsEyoPtbevLmYkpi7pzF9
         q4LcqCK8XUkcrIfa5IqdC6oOgjUefoXRKno6goPlWHLX/spzXXTVJmv63W5FCN0aPt8N
         12QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246110; x=1788850910;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWJvhunbu2wsQEy2Tx4KY7Dc3vJnkE4zsqOa7hH4Qik=;
        b=g4/lbNejf42Aq/tLkwf9W6jkHAJ+zFltm+gfnt/H2E2fwJu6WBDNDM9xZoJosTpWZx
         eT1d9E0iQtsfPIy8bWrFBlnn68p36ftOvWgzmz/1mDffrNGOprPiA0iOLthFHo5n4p+G
         oMP/CG30atST4qNzQ0qGiiyE6PxHBK+VJqrHQb0rnnsAdO9VfVSqBV+7DoZQrvEZTg0V
         mg4ajpPQYtkx38UKfJJxgZd9kAI1RdQM2rI1N6eGP1u9euC0Z6Qx1+MRdrtjBiO+oi8A
         wCkw7XCujtOWoIwzn3TUgYixs0dDu/TCowxit+E30RA5we42ChI6OT2IF7LhCuLcW39G
         as3g==
X-Forwarded-Encrypted: i=1; AHgh+RoU33urFROYeXfqHsQMa4NtHZmxoINm/hXeHcr48DZjjyFRxFD/r0cuceq2NolbhQ/NZVRiorMl+Sk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kcGhuGeluPmV7nx7RR1RiVr8KDfz123bugC+v/8B/NOtIBF74s
	h6iB6V9OE7PjKfeqqO0SEnY8g/JyDKqqHr5zanlPJnmTYXVBrkjIiANzKacFYJBMYg==
X-Gm-Gg: AR+sD12uDxLM+lOnt1OLyRMW2E/KJjq6dQUx/Vq6GeX7xM8U2z8XnIpsUiaT4QcHlop
	DPl6siCbOQclwkPatX0nzwOCpAkX283Npb2lgALp5y5QU4bzCXEu6WjLUwr1z6VreoCVnL22NFR
	vRIbaURBRQZybFxjGewsPnjWn2qK9tbBxjfdgBmlBc36CIDaxNAW/Sr+ntTAthTvW+FlUVJubum
	mHnHvqETXu018AMb6JwLZ9P2/ESBgyQg2ZfdfaW9vwEnQjTqHcX45SuKZOmWB5yV/nfndMqE7jd
	b4KrrEq9iBMrlOSVnNavOSj5K4V4mBidyOQFxuYV7dCrd/gMgpq4Eapk0Xugcxhjli6m8ZWfp5o
	XfXr0fx/eUvDd9NLRCim3P1JjtNcbeOQDEivdFbueZjkdNu9LAdcEK5oQ/g2KZU1h0GyZ824yIH
	lPKNen+w4iO33UU7zCMhpzuX7jY5sPQxMtkA1twLiOL+8LrVSyUN1P8kr9qL1ITC8EiiGP1IkAV
	uEFTD4cv1Z8DpJNJA8kXHAxNaJ68VR10jzpNvpupvnIaab+jgUh+A==
X-Received: by 2002:a05:600c:5391:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49cdc555577mr113961735e9.16.1788246107503;
        Tue, 01 Sep 2026 00:01:47 -0700 (PDT)
Message-ID: <fba838ed-b6a0-4cef-8dcc-8b5d1f8a8aab@suse.com>
Date: Tue, 1 Sep 2026 09:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/39] xen/riscv: drop bug.h's duplicate instruction
 length helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788246111-1E465757-21C22137/10/73395122804
X-purgate-type: spam
X-purgate-size: 1375

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> asm/riscv_encoding.h already provides INSN_16BIT_MASK and INSN_LEN(), and
> emulate.c uses them, so the tree carried two spellings of the same thing
> which could drift apart. COMPRESSED_INSN_MASK never had a user.
> 
> No functional change.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

As I'm happy to see the duplication go away:
Acked-by: Jan Beulich <jbeulich@suse.com>
However, ...

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -214,7 +214,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>                  die();
>              }
>  
> -            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
> +            cpu_regs->sepc += INSN_LEN(*(uint16_t *)pc);

... for one I'd prefer if we took the opportunity and add "const" to the
pointer target here.

And then

#define INSN_16BIT_MASK			0x3
#define INSN_32BIT_MASK			0x1c

are really named backwards, seeing e.g. their use in

#define INSN_IS_16BIT(insn)		\
	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
#define INSN_IS_32BIT(insn)		\
	(((insn) & INSN_16BIT_MASK) == INSN_16BIT_MASK && \
	 ((insn) & INSN_32BIT_MASK) != INSN_32BIT_MASK)

Furthermore,

#define INSN_LEN(insn)			(INSN_IS_16BIT(insn) ? 2 : 4)

fails to use INSN_32BIT_MASK / INSN_IS_32BIT() altogether.

Jan

