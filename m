Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8243606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fjrroI+r
Received: from list by lists.xenproject.org with outflank-mailman.1463090.1674057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1UX-0007Bl-VG; Wed, 28 Oct 2026 11:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463090.1674057; Wed, 28 Oct 2026 11:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1UX-0007Be-SE; Wed, 28 Oct 2026 11:06:49 +0000
Received: by outflank-mailman (input) for mailman id 1463090;
 Wed, 28 Oct 2026 11:06:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM1UW-0007BY-WD
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:06:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM1UW-009lDq-29
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:06:48 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1d747-e002-0a2a0a5209dd-0a2a4509b05e-0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:06:47 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1d747-be1a-0a2a45090019-d155da33e09b-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:06:47 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c46822eefb6so98641766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:06:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39a8sm28989042f8f.11.2026.10.28.04.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 04:06:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1793185607; x=1793790407; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeV+agtu0OoQTdFIxx3hW2Px70NutSPsDtlt7O2PwKM=;
        b=fjrroI+rlpNcjONCefx/yWzbj+XW7hceI2HgIJBlJMoCPRNB+ljWVt4WfJGP3d3g/T
         4vt47fKT0K52zI7LI5/1Rgez0kzyzWkQh0igT2SToKr/wOKZSw59MWVJ4DeZg4W6nrED
         IzHHVinANnMndM1qsNC17CYzGH56F3whqYHw70tYEXGtRZlwPcdBtZ/BLOFJ8ZwEFNsV
         Vt10oacHhiuBMjT+0Th4MyxR8CMGvhhO2grr56G/B6ByaluMFPVdLxKxwGnMHd9Vovfr
         hGydqj56Tf4d4/pokor3hbysHEaAZKvEcL+cYDKoAozNSe/686Y82Iwphp6jnZuUXZrN
         BQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185607; x=1793790407;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeV+agtu0OoQTdFIxx3hW2Px70NutSPsDtlt7O2PwKM=;
        b=SNmaDrnGvjDHLkc2IEv7HsMn3aPn7btM081hGGgFTuvd5oFuHS4CRHjTrzGpc2TGfk
         itD0xMtNzhAiGloqscAw8KFAYbQtydBBZbSKg53oFDqqHwmH45iV5YOsl7iR0EXcxd1z
         UGTJKqePm1OLj8WbIDwaR5fFE/vSCysUBMuqCW2luPFhgUDzG+X6u15JToBu5KSVOxNy
         zgYxEdsCa2FbNtW6zXv3b2c/+6k+rr7FHgnhzdK/UxXcYtf5ttW0Mv1LsgeqEwMaSHHU
         w7B67nqVn1OOkG1iTSuLDVQldTCwtYWj8doU5d+r4TqIYxA32u0QE2pd6vZVOuvE5UQT
         tsEg==
X-Forwarded-Encrypted: i=1; AKwUvBxVGRNa52WgSvR4wz/vnddDREyGeB28lcE280e9302evZc10jgQVslHWFQcDNqcpsi+o4XkGYoLRZE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ4bkgGbzJkwMM/G1KDhYX1dBs0z3V9U2eV+0t5qgcl/OyeI6Ix
	YK9bdGRekTjMv5cFfd17gVwqrIAUeyyzmDb+NgCfqV6mNy2E0l38eyMyD9vOicV+CA==
X-Gm-Gg: AYBFou2106KC2UHJh9NHR4dfdOMWjxk4B4Hlnts1Vadn/cjhSN6akMnVRzTB34mmk9e
	K2jj0CWs2uD1lDRx+7Q3S1xfiT5BUR1PTnrp22eoV82Wbkf8pkfGnkz2WZoieXRqvwpBpQGxX6+
	TAAxad7INYgFLFogmrSZxoo9YyqY19WEg8dYhimOdbA3qfOalCh+hDOn3iANU2cxL2wPJS+mDWa
	oOWnw4slmNHWD7zXuwQGNbAqV3NfLfH+AKyEVW0VTMTz/+wLc7zjvH9KUhtTcZBLuWUxTETlvPA
	VLLW4tNRQsD3M0VKF8TjZ0GnThx7GNl18Wt3BtE3UfUljt2t9Q7Evcx3LJvPByiC6cRS0d5y+Lq
	XkfPW5sQaWg4/lB+Dg2PYV+EPW+8VhMJJA2gVTqiipILQEf0+jPVKRwDq+CX/to5n6R3zreeAew
	5PKy/Na11/p2A2e8E2GohFFUj0XJcb416F8Tf4+dPR7GKyb9PyL0tB/hnyfduJjnOS3usCiHM2d
	yNipk0uDzygh7rdzMdoFEybttCljCtFNQQmhnp5vqypghSl+ywSqWAy7VBOFCvFXq1IUejbjqNU
	zz5NMIrsaKDs7kTlKDk3WEwJwIrw+6rDGW1+zM1tBFWSH4W1B4HPGsr7CofPBm/JPL2h3Y6f/bz
	QWbbRlGVRLxgQIf4Z
X-Received: by 2002:a17:906:c143:b0:c40:91fb:b76 with SMTP id a640c23a62f3a-c49bdf898e4mr144992966b.33.1793185607316;
        Wed, 28 Oct 2026 04:06:47 -0700 (PDT)
Message-ID: <d00441c4-6ef6-4f40-bc32-1d4c267a6687@suse.com>
Date: Wed, 28 Oct 2026 12:06:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nestedsvm: remove dead code for shadow-paging L1
 hosts
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <c7cfb94a-1424-4ed8-bd3f-0216edb2c799@suse.com>
 <20261027073711.30963-1-chunjie.zhu@citrix.com>
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
In-Reply-To: <20261027073711.30963-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793185607-FCC15034-0248F30A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2112
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 08:37, chunjie.zhu@citrix.com wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -237,27 +237,10 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
>      hvm_update_guest_cr(v, 2);
>  
>      /* CR3 */
> -    /* Nested paging mode */
> -    if ( nestedhvm_paging_mode_hap(v) )
> -    {
> -        /* host nested paging + guest nested paging. */
> -        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
> -    }
> -    else if ( !paging_mode_shadow(v->domain) )
> -    {
> -        /* host nested paging + guest shadow paging. */
> -        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
> -    }
> -    else
> -    {
> -        /* host shadow paging + guest shadow paging. */
> +    /* Nested virt requires HAP, so the host is never in shadow mode. */
> +    BUG_ON(paging_mode_shadow(v->domain));

See below as to the use of "host" in the comment.

> @@ -517,10 +500,13 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      v->arch.hvm.guest_cr[2] = ns_vmcb->_cr2;
>      hvm_update_guest_cr(v, 2);
>  
> +    /* Nested virt requires HAP, so the host is never in shadow mode. */
> +    BUG_ON(paging_mode_shadow(v->domain));
> +
>      /* Nested paging mode */
>      if ( nestedhvm_paging_mode_hap(v) )
>      {
> -        /* host nested paging + guest nested paging. */
> +        /* Guest uses nested paging. */
>          vmcb_set_np(n2vmcb, true);

"Guest" alone ends up ambiguous. The "host" / "guest" terminology used before
wasn't quite clear either, but at least there was some distinction. Easiest
may be to drop "Guest uses" here (and below). Else, to be unambiguous, it may
need to be something like "L1 runs L2 under nested paging".

If you agree with dropping "Guest uses" and replacing "host" by "L1", I can
make these adjustments while committing, implying
Acked-by: Jan Beulich <jbeulich@suse.com>
in that shape. Otherwise please submit a v3 with adjustments you consider
suitable.

Jan

