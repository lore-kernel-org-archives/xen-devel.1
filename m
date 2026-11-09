Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA009606A335
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=b6Dxz8HO
Received: from list by lists.xenproject.org with outflank-mailman.1479745.1683656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQM0Q-0004H4-AS; Mon, 09 Nov 2026 09:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479745.1683656; Mon, 09 Nov 2026 09:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQM0Q-0004Gx-5G; Mon, 09 Nov 2026 09:49:38 +0000
Received: by outflank-mailman (input) for mailman id 1479745;
 Mon, 09 Nov 2026 09:49:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQM0O-0004Gl-FK
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:49:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQM0N-00Ah2W-Js
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:49:35 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1972b-e002-0a2a0a5209dd-0a2a4507ec1e-14
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:49:35 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1972f-b4ea-0a2a45070019-d155dd2dddbe-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:49:35 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso388199f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 01:49:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597748acbsm8848408f8f.44.2026.11.09.01.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 01:49:34 -0800 (PST)
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
        d=suse.com; s=google; t=1794217775; x=1794822575; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIQ0JRDAE3/eD937wKB/SbmMc58744zQIh3zMqiopr4=;
        b=b6Dxz8HOk9+r3LfgcaB9Q6YiBQ8R5IYsVGJtHiKumqaI12iwnDICd0r+N3OxkfW3WL
         S0gO7ZA/SWzM+tXKv+zbeapil5h0P29Bng6/NkxxeXQ90OkVf/ghpLa5O/gOk6xFq70m
         FLMudLb2jWPz0/cuL0sn/AwXtPH9npml/TCsVAGx7/fRY2z+K6Ju8WLtRXYaVg11CHOp
         tehfGAWD6BrejqoiYQc1fQdipLmz+CSDCbV0csxIzPcJowG7peXFTqoBIq9zH+7FK11K
         iVi90fsLoxfLsdDpjmnwQ9zlzlrIMvCtDw2TisuqJqXdjD2zDeWhxoy9/LM+QuXpnDkZ
         Ay6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217775; x=1794822575;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIQ0JRDAE3/eD937wKB/SbmMc58744zQIh3zMqiopr4=;
        b=PknETFXPaER+c1/uEVjq96eOx2Wa8T3IXJMFs/xu6ytVhn++nbvjF8BkRnWTV39gVt
         TURNt+Anmvj/C3Yf3UN/zZ+RbFvEV2yFE2SPRqM6bo0/8McINrmVuPYRSBpaJmylOcje
         WcHaM9bVEcniyT0yuaeUgaGqKIgKSxU9EA2VVKqB8K6FH81DFT6fCJ2oJQyNrC6P5uKi
         NJCQBZbWP9SXOf+7wRPaQg9mBn/Zuj1N2NUPbtUrSKE29O+4lbMPFFruKyUHvsRQIV3R
         qWQiSFC/Ja6hZ2r/MvEAsF0c36Nbb3AMH/X2OFXgPKjk1PruTFFWLmN1cLWU+Z/QYqz8
         PSGg==
X-Forwarded-Encrypted: i=1; AL+hErHIo5L4BgjP+0NSeUK9Us8lfbKAHBrUSjbbK0L5MpUbGZeV2WWnhWoIL/ioqvvEZAIji+zvcTz3gq8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9LvZseJZ6Yzgajek2itXPzmHEHap/wpxle+mwQu6UIWe72orh/
	4ZSErxdDoHOr6k3/l7/05SRwWq5l5cw0L3bP/zLrSahjZtF8nf2cXS+7S51pI7jXBw==
X-Gm-Gg: AYBFou3PN0ltcTsxkC2Mv+EeYkAJVux6uFMZyjdD6AyaVR8cRY6kiHF4z+jaIGcm9WB
	oau9Wb3i538//0IsiuY2rwUjrBOT2rQ0nMachqjCLUY0EYjZ5ji9xW5OnclAJnHOFUqpm8YQRvL
	VPNRKZPS9MkRJ2/k/mVrOgQwct5U6aq0NkJz4zgwDbVXAQiQGDEG2o3iqoj0J/kaJJcQ3VxBStu
	cXf8h0TecsQ72kU5DIVuPZALAKkemh6KRp/Ec/RqwsfuIwuOUF7bIbyLtlHvDPm5kKAUQkaGcdJ
	V86+iKnQ7zBn6Y8QXinbqLjlPRqIKh77VNRRhhaU+gnK5tmZv2QOZ5Xn+MFinTdccL+ICajDMn9
	5+VtCcO8/0Vi0qofTRGYoaLyRLl7JFF8xrt+AEZIOFupxkE15JXkpIVWXwe9GGAnqRg1qNdmImK
	r1JLjc+Orb8b5YWb5UIzEqRqr0wzO1GtRazbRRdg0vnsS58Fj7Asfzn1iuaGlJaR3fClG3jmtKE
	1dIaK4vrb/OifNaYMaBg/+2paue2o6Mt5S8qizdjLMnLvBCsBuwC7cg5czUpQJ7l5zFU6Wrg1wm
	PPc1NodyMhDun3eViL5KZGZULIfspc8kiMqtVO2MIG3vxNjJ4xviCeEI9nEkqafrF+2CeNMKA3E
	XnLWlakbVKfDQ1Zk=
X-Received: by 2002:a5d:5e89:0:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-4958bbf18b2mr5854927f8f.42.1794217774892;
        Mon, 09 Nov 2026 01:49:34 -0800 (PST)
Message-ID: <7f2c4a93-5f3a-4bff-909e-50c73861600f@suse.com>
Date: Mon, 9 Nov 2026 10:49:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Cleanup vintr_t type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Denis Mukhin <dmukhin@ford.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20261106235629.2799832-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261106235629.2799832-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794217775-3C610AE4-FC5E9FAC/10/78276251493
X-purgate-type: spam
X-purgate-size: 3572
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 00:56, Andrew Cooper wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Rearrange the union to drop the .fields infix, rename bytes to the more
> common raw, adjust types where appropriate, and simplify some names.
> Adjust the users accordingly.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a suggestion (below). Also - doesn't this now need your S-o-b as well?

> @@ -153,15 +153,14 @@ void asmlinkage svm_intr_assist(void)
>          intblk = hvm_interrupt_blocked(v, intack);
>  
>          /*
> -         * When vNMI is active, NMIs can be injected by setting vnmi_pending
> +         * When vNMI is active, NMIs can be injected by setting nmi_pending
>           * and hardware will deliver them at the next appropriate opportunity.
>           * Consider them not blocked, to avoid trying to open an NMI Window.
>           *
>           * Correctness here relies on the fact that all vNMI capable hardware
>           * has vGIF, and vGIF is always activated when appropriate.
>           */
> -        if ( intblk == hvm_intblk_nmi_iret &&
> -             vmcb->_vintr.fields.vnmi_enable )
> +        if ( intblk == hvm_intblk_nmi_iret && vmcb->_vintr.vnmi_en )
>              intblk = hvm_intblk_none;

In the comment, may I suggest to prefix nmi_pending with a dot, to clarify that
a struct/union field is meant?

> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -328,28 +328,25 @@ typedef union {
>      uint64_t raw;
>  } intstat_t;
>  
> -typedef union
> -{
> -    u64 bytes;
> -    struct
> -    {
> -        u64 tpr:          8;
> -        u64 irq:          1;
> -        u64 vgif:         1;
> -        u64 :             1;
> -        u64 vnmi_pending: 1;
> -        u64 vnmi_blocking:1;
> -        u64 :             3;
> -        u64 prio:         4;
> -        u64 ign_tpr:      1;
> -        u64 rsvd1:        3;
> -        u64 intr_masking: 1;
> -        u64 vgif_enable:  1;
> -        u64 vnmi_enable:  1;
> -        u64 :             5;
> -        u64 vector:       8;
> -        u64 rsvd3:       24;
> -    } fields;
> +typedef union {
> +    struct {         /* Cleanbit 3 (TPR),  APM Name */
> +        uint8_t tpr;                /* c   V_TPR */
> +        bool    intr_pending:1;     /* c   V_IRQ */
> +        bool    gif:1;              /*     VGIF */
> +        bool    :1;
> +        bool    nmi_pending:1;      /* c   V_NMI */
> +        bool    nmi_blocked:1;      /* c   V_NMI_MASK */
> +        uint8_t :3;
> +        uint8_t intr_prio:4;        /* c   V_INTR_PRIO */
> +        bool    ign_tpr:1;          /* c   V_IGN_TPR */
> +        uint8_t :3;
> +        bool    vintr_masking:1;    /* c   V_INTR_MASKING */
> +        bool    vgif_en:1;          /*     VGIF_EN */
> +        bool    vnmi_en:1;          /*     V_NMI_ENABLE */
> +        uint8_t :5;
> +        uint8_t vector;             /* c   V_INTR_VECTOR */
> +    };
> +    uint64_t raw;
>  } vintr_t;

As said in reply to Ross'es v1 - imo uint8_t bitfields would better be
avoided; afaict there's no issue with using unsigned int there. (While
I'd like us to avoid such unnecessary uses of compiler extensions, I'm
also not going to insist here, as we have too many other instances of
this same pattern.)

Jan

