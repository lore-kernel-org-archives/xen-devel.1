Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E19C624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:58:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406047.1639483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mPg-000827-0w; Wed, 02 Sep 2026 14:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406047.1639483; Wed, 02 Sep 2026 14:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mPf-000820-UZ; Wed, 02 Sep 2026 14:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1406047;
 Wed, 02 Sep 2026 14:58:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1mPe-00081u-SN
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:58:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1mPe-00C3p2-92
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:58:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a983955-8faa-0a2a0a5109dd-0a2a45069bac-46
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:58:06 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a98397d-195a-0a2a45060019-d155802ec486-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:58:06 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso8513305e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 07:58:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce0b456sm177152935e9.2.2026.09.02.07.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 07:58:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1788361085; x=1788965885; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmuvBDjWYJHnqA0vMM7pZs59UdG/idKMXME5CHSaBio=;
        b=D7X1lZQ8XCBQM4mn3qksswRDEG+sEhcj0NArtdkcilEQM7P/n2qGFPKabxbcWthZlM
         Hv5Q2BZpq/GyCKKsooOftY/uaREM9d7YnGDhJ9Y/6U+HulP4Mf73xmFAXlAXo6GoXhvh
         Wzews+FUidYPWXO+zwlblK/QrwcfcEarPS+adDMUgvpRbLzfTW9p4xPt7pZKUvypdWy6
         CJa5DXWkKS3/TbrCXWhHtszB11dVFusFDUmBafoTGBh4HxOO7vupwdZjKr6V5UzFotWm
         V43j7hFphjf5PPZ5Am9AukpKMmPeBmLtn+UbPV3E+tXkDxjMQvDlxomtITkJ6NZnk3GM
         4HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361085; x=1788965885;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmuvBDjWYJHnqA0vMM7pZs59UdG/idKMXME5CHSaBio=;
        b=E46CEY6wtx1CeAyFagT/JmMbQ1ZuEaUeNRymJ1JEyx7ILhmUMc1bw8+A59t2FSR5qh
         NZfQcQjxFsN/7QAE70gc0lLrL2Huu8Q/IvPc6DrYQS1S7lOszR7aG5smcACy9RINtsNP
         +QLjZMldiB5E/Uwiiq+48wIiKQAk7kTSqaC3rrJ9le6cfhg3vfkOgd7iGGH94x3xKf4W
         Ihx0s/DqSXujT5BZw7/Az1ap/X74H7L7rgopkdpdqRdh8N6q5nUeq9XFzBhKbRwc45s5
         Jogo8lJJrkJhHVclSF+Xv7EmqIkUw01aqg3XJvnwOM2P63ksWSvxa5qB3vc8D6X3VkFK
         xAeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT02fC29rEcSXdyHtySAzKmsoU1iNgGukGK7hpkJQtr9AL9p9MKxtDcThnJb6DfRzV5d76L+Ppr/E=@lists.xenproject.org
X-Gm-Message-State: AFuF++l0pzQ3RBH4GMFOijC4OCDJ5FljLTjwPSgFTvaJKvWlpEjZ+HxN
	i+zJa113RsiT5Oh/0V1GH7lWGWjLWOezrymyMlguJEB9X6stuVxVtyqxiwWmoeoWkw==
X-Gm-Gg: AR+sD11l9ZeQZyx3KeSsx79dCgOuxPaHPEcA4TkFwZG0YBzaHdsnxagqXbbLgAcqFrB
	4srrtuhEkYjJNRlth/dDBeDd4oBRfwXv7p9E5ChKALw3O3CFjhxODvHujjIvjuV7zhZlAf3YPyh
	j52MCN8xh1Y6G/J4YjuRQFmLPLY++eyQQZsT8D78AZOfOFiRE5orsnGM6J2vSpeMVJU+fo8f73p
	iZpq0o1xdL3AkhhOaKEbU3/mK3ttILCTmi8k+rfaff7uVzwzRyqGRjH1b543gXYde0di3OxK0M0
	s/oX02RumT/W65HXC6ympSH7rx4Tz27ExWYLVJWmoM2hV/AjkU4w+UvoZADriIBa0huGllcvMDJ
	40CZa5CJZKYY8hw5oA+jJ8gYxj8MINcoQtiMWjmigliKSxnm7pZbBn0+XnoAM2CJQUFyeEZK1/j
	BF70zE01nKLTWc/ghmm6usG2TfGZD175Bt869K/TfVZ4CmFNSOwGdftgg3gMhACsP9rg/eme/Rn
	Ba9sMEPwW3OJe8n3JRynCWRFysD6EyBRFFXrfo+pqiB6wZ3jvyM
X-Received: by 2002:a05:600c:4e4a:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49ce55ecde6mr98125635e9.1.1788361084286;
        Wed, 02 Sep 2026 07:58:04 -0700 (PDT)
Message-ID: <8520ca5b-d7d6-4e5c-a6f3-2969762fadd3@suse.com>
Date: Wed, 2 Sep 2026 16:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/20] xen/riscv: introduce guest riscv,isa string
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
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <2eb660bd05c6bf5946a7eae09406266db0c5108f.1787836900.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2eb660bd05c6bf5946a7eae09406266db0c5108f.1787836900.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788361086-1FACA77B-7DB1F857/10/73395122804
X-purgate-type: spam
X-purgate-size: 3464

On 27.08.2026 17:18, Oleksii Kurochko wrote:
> Introduce build_guest_isa_str() to generate the riscv,isa string to be
> passed to the guest via the Device Tree riscv,isa property.
> 
> Introduce the per-domain guest ISA bitmap, populated during domain
> creation by calling init_guest_isa().
> 
> Introduce struct riscv_isa_ext_entry with a new guest_flags field
> to filter out ISA extensions that should not be exposed to guests:
> 
> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>   for guests.
> - Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they
>   can never be set in riscv_isa and thus never reach a guest, and no
>   current hardware/guest-OS advertises or expects them. Supporting them
>   would be cheaper than F/D/Q (FP values stay in integer registers Xen
>   already context-switches), but is left as future work.
> - h: Nested virtualisation is not supported.
> - sstc: Xen owns the supervisor timer; guests must use SBI.
> - svade: Xen manages hardware A/D bit updates in stage-2 page tables.
> - svpbmt: Page-based memory types are not yet wired up in stage-2 code.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

In principle
Acked-by: Jan Beulich <jbeulich@suse.com>
Nevertheless I again have something for you to further consider:

> @@ -34,9 +36,64 @@ struct riscv_isa_ext_data {
>      .name = #ext_name,                          \
>  }
>  
> +/*
> + * Which guests an extension may be handed out to, by guest XLEN.
> + *
> + * These flags express Xen's policy, not the ISA's rules: extensions which
> + * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
> + * treatment here, as they can only ever appear in the "riscv,isa" of a host
> + * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
> + * They are only of use for extensions Xen chooses not to expose to guests of
> + * a given width despite the hardware implementing them.
> + */
> +#define RISCV_ISA_EXT_GUEST_NONE 0
> +#define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
> +#define RISCV_ISA_EXT_GUEST_RV64 (1U << 1)
> +#define RISCV_ISA_EXT_GUEST_ANY  (RISCV_ISA_EXT_GUEST_RV32 | \
> +                                  RISCV_ISA_EXT_GUEST_RV64)
> +
> +/*
> + * Guests are of the same width as Xen itself for the time being; once guest
> + * XLEN can differ from host XLEN (hstatus.VSXL), this becomes a per-domain
> + * property, just as guest_isa below does.
> + */
> +#if defined(CONFIG_RISCV_32)
> +#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV32
> +#elif defined(CONFIG_RISCV_64)
> +#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV64
> +#else
> +# error "Unsupported RISC-V bitness"
> +#endif
> +
> +struct riscv_isa_ext_entry {
> +    unsigned int id;
> +    const char *name;
> +    unsigned int guest_flags;
> +};
> +
> +#define RISCV_ISA_EXT_ENTRY(ext_name, guest_flgs)       \
> +{                                                       \
> +    .id          = RISCV_ISA_EXT_ ## ext_name,          \
> +    .name        = #ext_name,                           \
> +    .guest_flags = guest_flgs,                          \

As you're using token concatenation here already anyway, why not

    .guest_flags = RISCV_ISA_EXT_GUEST_ ## guest_flgs,     \

helping the use sites quite a bit? (Whether guest_flgs [then] is
a good parameter name is a separate question.)

Jan

