Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9D606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S15jnX6G
Received: from list by lists.xenproject.org with outflank-mailman.1460981.1671875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGyT-0003Nl-0B; Mon, 26 Oct 2026 09:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460981.1671875; Mon, 26 Oct 2026 09:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGyS-0003Ne-Tu; Mon, 26 Oct 2026 09:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1460981;
 Mon, 26 Oct 2026 09:26:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLGyR-0003NY-NV
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:26:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGyQ-002XOf-Se
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:26:34 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1cc4-8faa-0a2a0a5109dd-0a2a450397c2-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:26:34 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1cca-fae8-0a2a45030019-d155dd35f04f-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:26:34 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e04773687so808517f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:26:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0a9cafsm192708315e9.5.2026.10.26.02.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:26:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1793006794; x=1793611594; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaGO36gSEPYcn7Mp3rAIMpcHZaeEsH3//SiEMxr+Bos=;
        b=S15jnX6GUIfYZd6us7zC4EwMbiBVefNZ+nozuComtNN9U53rgN0lJHOCc4kr11ck18
         lGI927JRcRJJ0/b/ND6JLezTf2dvVx69vg4Sxd6It7qMnQRjtrSX1Lko7LQKjWPowoQc
         4r19SXmPk8Us0MllrWVMh5Iv9p/DQFv5J7iHsCrxfd1GrcpTDNLm7PthNmvvVcS4RtCw
         6Bi/wWEZzLV0Jv7q7ef/fNtV/biIJJ0ZC4lHKbrSeBuf8kzGHLukN2qHvbPWan6CTZHC
         r417CQHI80kXNRkEpmG/bdmeeYeVv8kwV9AbAf/nlb1+sD67bk6M6Ivfhnuf4r3P8aCG
         MtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006794; x=1793611594;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaGO36gSEPYcn7Mp3rAIMpcHZaeEsH3//SiEMxr+Bos=;
        b=RCX8EbcEuR3hlaaH/D67P2EZ+1B373UGVpVZ84Qe2BzWAeSZc3V1r6qysQ57nEbFoX
         Fpq3i5sC3jjZETnPiBm+pFc+AowSkSyWJuUG25agbgiQvGlpSpkFEAPkJMusN5gKz483
         arlOZvzCSulvLJqPErP3dTKqCbmKqMTi1E61QocsuxXam5LhVIyvMxZAGtLlDewgoXAz
         cDtWinc7Jp4uTuNjwe+x7R8gMQ7WaU1gAOUIKEpxfDbLfgX/0+b9//gGI1S1wVxw6JLm
         LWozNwifF2nTMCPtV1DSbYSTe/s8XSxag+B7D6FxfXXBJS6b9ZHXVGwYm/2CQ2gP7AeC
         IRgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNnOIyClore8WfPHKyH8rCt0eA/LCZegiE/LzGsp/z5Bb6oVYEeLK3famzi+q9Mg/0MP+cgVUwgnk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJSBK4MlxpFpnKlG2Tm+IXQ2pAyricKhe7JD4lDL5VGY4SQVT69
	hh3oeOf9NEtO081WGcwzDnuuZqppTOMp8NrwhlkPAnQlOaCZo8nrCpPDtahrNasuzg==
X-Gm-Gg: AYBFou275aXUGLFTsYCclxWGaCDJd47cLUUJLKbimsTwzs2JzHqWJUhAPMGoXlfqQ3T
	N6dMRG7JMkOVjQtD5/L8/D9tAEL6FSsfxjk32YtF0STRlrfviLsmwLoK/mFdYC8dCJJ77uxFh6x
	v6h5M1zzqjUH2PxjLLb/U0uUoqaEn+kG9ow/4tbV9wEtsn6ZbCTpIIJKA+gdtVRq4NCvYJLpItW
	5v+z2DqEkxeZOdnPh5cILpxdtIIUvl26/gAMG/LcN0gMCKfKoML/t7rntu3o+QoehozcI24Cbyo
	vr2ZBn2x7PdunHKitWWP2Dh4xaz1oKzvcjIsZEDLE7jp9p337Dld/UiJsisjdIWkQhLmJjFM4w6
	ItEdjJM08XMeut9bCORRruOHTmtllm80rHtXmTzBnaJH9rqw7mWT9BjfI9aw57h7RVWccFpJVcb
	kjNMmZgqj4WbJsgVwP3ymjFN9iFWOW/EAJWL0dNMDHPjFXSEvk04xC2roImNz9nsXjZhohrDlI0
	tPyVVvOb3oPSBTbT0cevBkTtiQB4REm/eNho64xyAGOm0JygGZdvA4kWdHMc2I3SE9AUBe7twZK
	zzDocXGwtrLXNxQGtfrFECQd8JhDnuRQW3xaARiYGH8=
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr120992755e9.16.1793006794187;
        Mon, 26 Oct 2026 02:26:34 -0700 (PDT)
Message-ID: <6ae519b7-61a5-4bb3-ba58-2685cc953556@suse.com>
Date: Mon, 26 Oct 2026 10:26:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164866.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@vates.tech>
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
In-Reply-To: <1792164866.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793006794-750864E9-C9FA785C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1222
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.10.2026 17:34, Baptiste Le Duc wrote:
> Use pte_is_valid() instead of open-coding the PTE_VALID check.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v6:
> - no changes, already reviewed and waiting to be merged.
> ---
> Changes since v5:
> - no changes, already reviewed and waiting to be merged.

One of these isn't correct: You moved the patch ahead in the series, which
changed ...

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -187,7 +187,7 @@ static inline bool pte_is_mapping(pte_t p)
>      /* See pte_is_table() */
>      ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
>  
> -    return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
> +    return pte_is_valid(p) && (p.pte & PTE_ACCESS_MASK);
>  }

... patch context here. That's a non-trivial rebase, not a "no change".

Further, "waiting to be merged" isn't quite correct either: There's still
an ack missing. Which is only coming now:

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

