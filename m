Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FF7606A33E
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YEZmWTA7
Received: from list by lists.xenproject.org with outflank-mailman.1494026.1693706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbDh-00066r-PN; Wed, 18 Nov 2026 08:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494026.1693706; Wed, 18 Nov 2026 08:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbDh-00066k-Ll; Wed, 18 Nov 2026 08:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1494026;
 Wed, 18 Nov 2026 08:40:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbDf-00066e-Ns
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbDe-00EvRd-TJ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:40:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd6489-e002-0a2a0a5209dd-0a2a4502c7d4-12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:40:42 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd648a-4900-0a2a45020019-d155dd2cac29-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:40:42 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so297139f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:40:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a650d2efcdsm3402317f8f.5.2026.11.18.00.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:40:41 -0800 (PST)
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
        d=suse.com; s=google; t=1794991242; x=1795596042; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUBA9iYCy1e9MNaB8PR8ycmXblID/jv0VbT9UcJXYA8=;
        b=YEZmWTA75Bn+TKGwpRuBmbd/tkcLltjHQNnCkRDCzck48FePpb+437PwkUi3viearM
         JW19hCaZ4+lBHfXhhg1DU3Tbsgr9wm3elhLxVbPvk1p/tdzUmq4ITjRrEPo+eUJNxyuT
         XbwB9OEpkRqwe60RTewzpdAs8MAI2IOzcQ/dZXkscnqhxeND3M6EBjKoB35A/ozNjxat
         pmLWPJZX06smJghHCKiOhgMNML6Mbw3p/hAbIHM7V6Oxt6Aw41XjwCMljKdm9BQftXxS
         OEcsvSAgQQLXVYK09dMpoPUd327z0123mbztjbI4JqxtiRXmvRzw4LO9XtGsEIZTOkME
         aRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991242; x=1795596042;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUBA9iYCy1e9MNaB8PR8ycmXblID/jv0VbT9UcJXYA8=;
        b=uIygad6xd7DKUiH+ak1W6bfooNeCin4HXUStkZ/Y1TC/TTkR8sA/vE2Ch4Wfb+qVan
         10/CeUGQ1cZ/S/kJN9dNDrNoh3tM6iSjEoxEStc/teehgmHUviINwhw06WjMhe1pzDRd
         /EIFqbGgOYCMhtvcLAGPmzUOz9paVH8W5SZfKJPKJ4eqOuHBaajKo60fsyt3Uzyv/f1i
         XCkfQRy6yRgrmF9yiIrS9g9ikLpRk8mOuG/5K+lKVUXjSJUYompDrB4fqOf2YJVIhCeX
         p1xyWb3VEffO/CaFWZ7dTnqx35Ju0mVjYaucXhDV3EwH/l2fRk+d7b1nyTg5qxiRIp0r
         scBA==
X-Forwarded-Encrypted: i=1; AL+hErH85oZgRenaSHsdvisRG4TZZXtm0c/M3zYKHFhaiGwstbo2XbpnBZ9EsR2mvxIYos6RBJPMgHe5x8s=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9mefYTZzPhD32XSAokp1PDKd03ODxYbwyQ1fDAqhNLHOwSNY1/
	/aby+lxbRNv+BItXLmSSBxsM7nkdbBlGbZcktet2WU4vOKwSonMosIhG4Rpvb3w1yQ==
X-Gm-Gg: AZFdTZf5rex1dnl2js2N/7Kg2x17AeyaJqxTul7I53ezCrdCcBHaEkBMC54OQSzU9ZP
	ulwgnyyyp+to9tqvi8SqzG61XoBhXChGPDEJviuriHFg8+QGVJ75hMkC0DEBo3gBhZgEHgHz0vM
	OywqhLeYGwe2z/Cm5FKyfeZlXoSCghSjh1FoCbIWBs02doc03yvUdL0xQwiT+7rT4NavHnHZZY1
	NHFHTtkiqOUKO/vMXUrqsuaA01o8wNqeeN/55OgR6pyeykLU5Mx0jm/Tn3TxuXoAdIyHiCBNeKP
	duI4/HDnGo5UxFXsABAlrv79vl9Am977RshTEQ2tEX3wogvtJhtxW7X2qTBelQqfaUIb5QM5Tnt
	6j76JAYov3tQNtHXMoP4NS9TQbmfxoBw2rvbR7OdfFTUZgSciLVRO3wyoYVjfIJEBO49aS6p0/Y
	RCSR3qNTfj/Ue8uFg7Od8Iv0yVw8y6HOdbsWxv8O8dWSuQDZ0LHbPyMw6CmzkMBgkz2Y9hYq0+H
	H1viyWqf3ZoP3zlqKafWyPOiMKqp6ztowavw0v1HsJ971WezfICt+buUJmqZF7B5pTfWUfDOpIc
	3wLhEWRrmd6b/Q+Gj8C0epGjMt4ZlqbSjnqnSFMcVT+XeSS363l9zj99STdppsUaAcPsxG4+AYd
	nAIs+JCpykf9lvIpcMw==
X-Received: by 2002:a5d:5d12:0:b0:4a7:14d0:9c4c with SMTP id ffacd0b85a97d-4a714d0b8b5mr1915843f8f.6.1794991241949;
        Wed, 18 Nov 2026 00:40:41 -0800 (PST)
Message-ID: <8bea775d-19a5-402f-bc29-bbdb76164621@suse.com>
Date: Wed, 18 Nov 2026 09:40:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Don't save or load HVM context of a domain with
 no vCPUs
To: Lin Liu <lin.liu01@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <0ccd6c2bb95cfdd80f430aebf62d788c825ae939.1794985346.git.lin.liu01@citrix.com>
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
In-Reply-To: <0ccd6c2bb95cfdd80f430aebf62d788c825ae939.1794985346.git.lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794991242-3379D6C6-CFBFA7B1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2792
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 08:02, Lin Liu wrote:
> XEN_DOMCTL_createdomain allocates d->vcpu[] but the vCPUs themselves are
> only created by a later XEN_DOMCTL_max_vcpus.  In that window
> XEN_DOMCTL_gethvmcontext{,_partial} on the domain reach the per-domain
> save handlers with d->vcpu[0] == NULL.  A dom0 tool polling xen-hvmctx
> across all domains while a VM was being restored took the host down:
> 
>   (XEN) HVM d25 save: PIC
>   (XEN) RIP:    e008:[<ffff82d04030dc98>] arch/x86/hvm/vpic.c#vpic_save+0x8/0x8f
>   (XEN) rdi: 0000000000000000
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d04030dc98>] R arch/x86/hvm/vpic.c#vpic_save+0x8/0x8f
>   (XEN)    [<ffff82d04021009f>] S arch/x86/hvm/save.c#hvm_save.cold+0x9b/0xf7
>   (XEN)    [<ffff82d04036d99c>] S arch_do_domctl+0x1a2c/0x28a6
>   (XEN)    [<ffff82d04025341a>] S do_domctl+0x139a/0x1642
>   (XEN)    [<ffff82d04033331e>] S pv_hypercall+0x3ae/0x59a
>   (XEN)    [<ffff82d0402003b5>] S lstar_enter+0x105/0x10a
>   (XEN)
>   (XEN) Panic on CPU 0:
>   (XEN) FATAL PAGE FAULT
>   (XEN) [error_code=0000]
>   (XEN) Faulting linear address: 0000000000000018
> 
> XEN_DOMCTL_sethvmcontext has the same problem on the load side, e.g.
> pit_load() uses d->vcpu[0] for the guest time.
> 
> Refuse to save or load the whole context until vCPU 0 exists, and look up
> the vCPU in hvm_save_one() with domain_vcpu(), failing with -ENOENT as
> for other absent vCPUs.
> 
> Fixes: d0d8980138c4 ("x86/hvm: remove redundant save functions")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lin Liu <lin.liu01@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/hvm/save.c
> +++ b/xen/arch/x86/hvm/save.c
> @@ -139,12 +139,11 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
>           !hvm_sr_handlers[typecode].save )
>          return -EINVAL;
>  
> -    if ( hvm_sr_handlers[typecode].kind != HVMSR_PER_VCPU )
> -        v = d->vcpu[0];
> -    else if ( instance >= d->max_vcpus || !d->vcpu[instance] )
> +    /* Per-domain records are saved via vCPU 0, absent before max_vcpus. */
> +    v = domain_vcpu(d, hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU
> +                       ? instance : 0);

... this wrapped differently (happy to adjust while committing):

    v = domain_vcpu(d,
                    hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU
                    ? instance : 0);

or

    v = domain_vcpu(d,
                    hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU ? instance
                                                                     : 0);

When an argument is too long to fit on a line, I don't think it should share
a line with any earlier (or later) arguments.

Jan

