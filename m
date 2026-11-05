Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A3606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Xy0NTGfp
Received: from list by lists.xenproject.org with outflank-mailman.1474231.1681411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsuf-0004m5-Jx; Thu, 05 Nov 2026 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474231.1681411; Thu, 05 Nov 2026 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsuf-0004ly-HH; Thu, 05 Nov 2026 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1474231;
 Thu, 05 Nov 2026 08:33:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsud-0004kn-Ut
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:33:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsud-00EycH-BP
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:33:35 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3f55-e002-0a2a0a5209dd-0a2a4505dbe0-48
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:33:35 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3f5f-4cb1-0a2a45050019-d1558031e1da-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:33:35 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so18317825e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:33:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b413312a4fsm55599495e9.1.2026.11.05.00.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:33:34 -0800 (PST)
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
        d=suse.com; s=google; t=1793867615; x=1794472415; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgBsQi3zqXIoKdloFOzVef5/fwP3iiWfivDpkhQruC8=;
        b=Xy0NTGfpoogXc8dg2FnBbL1MyKca1jBUIwqTHafSj6fcZ2oijVMN53hnZJ/kA3E//X
         3TjCMO25e+/XHaCh68aBkR/o/aLQ954DgZi5+PSDXDtyzOzallUeZ4b5Ahdc2RzZO3iD
         TRk9mzZm1ALdV6b1SFxhq3bmWG3U+YBKr4PimykKoKDkARECYwrgMcGVixCDVpmV2yMh
         U1L7F16yAzxGuT2i9JDPlZAv8JwZaQEWoh5DJj1PukK//LbWmHGgKK5Si1zOsc9rn1ii
         o7snCedbWxhxZzzwT6Cz/TIQ+yHB9Qdx0dwOTRHVP4CgCpBiGwpAWVXK0w6QZuZ94I1g
         FVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867615; x=1794472415;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgBsQi3zqXIoKdloFOzVef5/fwP3iiWfivDpkhQruC8=;
        b=ciRe0MnIjSjtPJATke2BajwP5x3yJE63029y68tau8Kldh3kIQa6WdA26kOoMtsYB6
         OmoXgsa7NBSnuBzyodCJiQsK8wJgu9jxjJ8e4TkKjlGSvxKxePtJCRpCGkNVHiT6+jjU
         lCv3dxDzSK4cJgEypro19bUJ/+Q/oGhV8LL1FatLQ4Jk6AkvAatsCCe9/Z7G5hOqgX1K
         GaMR9VGN60CHrDfK6Or9bFcK3dT5HSjC7RA9V1O1E7x99V8d2BG2Ao8BBw2ZW44OXZaT
         LKlFq12LrPKyDM0gKNse/1B4/ndQlewOTsiKubBpbSpXJLg/+rqH/8kgrNewsvG86v1V
         6TkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNCjE+yr3/p4Xtdnin4qd03CKY7KX7EefUt3peXrjslq0vyjQTfWX37C3MzmtwwoQ+fi9kzdhMr0o=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8MzWF7AbYXeOh0017PUktRi6UgkhmQMbjJdJ6HIF36K+x9zylC
	6jD9nHru8uKWMGOtumA9T3FB2gXm1p0mv+ikcr8M76UXPFfdB8eqBq666iA43oZQFg==
X-Gm-Gg: AYBFou3hQGPvxcp7GxpsLHeUeYHFTLW4Dzbwt0joQrJaIbZkrCynWQZPICp5IkGB5CJ
	ouVBFaFomJzdpUaiTrXq7dLN0Q4sErQM2T/o081f78Z7yufMof1kOE+3on6CpuUzfFIr2e/xWcN
	quyXv8o4h+dQR28mNA4dfMMLmbYnMLRVyDjvkd0j0XxGP2R/Bb6NHUpkE1EZ56rdv2pNQEttfly
	wKZiE0wEUfw+YUd3KNGCFvgkf8TQvus7kvCrIz492RTlDJQDN1MEKJkrSZcs6ueDQKo38mU7YAy
	DUW7vyZIiwRQ17sd1Wb5XbthoVrtcL0mnNxzsfRq+uVN2oyhmS/bQb+dBZahAJHZIA6kU+pn8z/
	VCKSltgV7SDFhxl0xZs17cHIDF8Ycrc/jcr+Gas3l6wVWy4goyH0RZX1x9j1qn4iJJbdAF/jsqB
	Y449Ls0kHn08wWzxgDMAkBuS+6w5pZTr6sevpMoziavoe6K19RcgG5y6D3DtjiqLPKn1mL8Vm7Z
	mzrzR+Zki9qpzQ9bl1j5NZp7jv2O+iNOYu6S63Lw5cPLWVwXxF2q/f4G8JSVl3dxgt+7v6fsCKN
	jIpGxwxTuaRrqiXj79g/PwX1zR4bmWyR1p9DXyumFxPA6pfUZrift2NyZnDMMs9h3REmoyaG+BS
	BYlY+M/+InoElp2HQUw==
X-Received: by 2002:a05:600c:310e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ac1709ae70mr407820245e9.15.1793867614696;
        Thu, 05 Nov 2026 00:33:34 -0800 (PST)
Message-ID: <022aebef-ed2a-460f-81ca-4fce5742f904@suse.com>
Date: Thu, 5 Nov 2026 09:33:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/28] x86/hvm: vlapic: update signatures of both
 vlapic_{clear,test}_*
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-15-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-15-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793867615-243112A1-4B63C031/10/78276251493
X-purgate-type: spam
X-purgate-size: 1767
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -85,14 +85,14 @@ static int vlapic_find_highest_vector(const void *bitmap)
>   * IRR-specific bitmap update & search routines.
>   */
>  
> -static int vlapic_test_and_set_irr(int vector, struct vlapic *vlapic)
> +static int vlapic_test_and_set_irr(struct vlapic *vlapic, uint8_t vec)
>  {
> -    return vlapic_test_and_set_vector(vector, &vlapic->regs->data[APIC_IRR]);
> +    return vlapic_test_and_set_vector(vec, &vlapic->regs->data[APIC_IRR]);
>  }
>  
> -static void vlapic_clear_irr(int vector, struct vlapic *vlapic)
> +static void vlapic_clear_irr(struct vlapic *vlapic, uint8_t vec)
>  {
> -    vlapic_clear_vector(vector, &vlapic->regs->data[APIC_IRR]);
> +    vlapic_clear_vector(vec, &vlapic->regs->data[APIC_IRR]);
>  }
>  
>  static int vlapic_find_highest_irr(struct vlapic *vlapic)

Each of the functions only having ...

> @@ -166,7 +166,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
>  
>      if ( hvm_funcs.deliver_posted_intr )
>          alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
> -    else if ( !vlapic_test_and_set_irr(vec, vlapic) )
> +    else if ( !vlapic_test_and_set_irr(vlapic, vec) )
>          vcpu_kick(target);
>  }
>  
> @@ -1414,7 +1414,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack)
>           !viridian_synic_is_auto_eoi_sint(v, vector) )
>          vlapic_set_vector(vector, &vlapic->regs->data[APIC_ISR]);
>  
> -    vlapic_clear_irr(vector, vlapic);
> +    vlapic_clear_irr(vlapic, vector);
>  
>      return 1;
>  }

... a single caller: Do we actually need those helpers?

Jan

