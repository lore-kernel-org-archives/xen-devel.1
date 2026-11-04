Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAC3606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NEZPIZ/5
Received: from list by lists.xenproject.org with outflank-mailman.1471439.1679814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUd7-0001La-Vx; Wed, 04 Nov 2026 06:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471439.1679814; Wed, 04 Nov 2026 06:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUd7-0001LT-RX; Wed, 04 Nov 2026 06:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1471439;
 Wed, 04 Nov 2026 06:37:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOUd6-0001LM-8S
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 06:37:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOUd5-00FSZM-Ht
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 07:37:51 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aead2b3-2eae-0a2a0a5409dd-0a2a45059dac-16
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:37:51 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aead2bd-4cb1-0a2a45050019-d155dd2bec9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:37:50 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so282551f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 22:37:49 -0800 (PST)
Received: from ?IPV6:2003:ca:b725:cdd3:6826:c9b1:b0c4:292e?
 (p200300cab725cdd36826c9b1b0c4292e.dip0.t-ipconnect.de.
 [2003:ca:b725:cdd3:6826:c9b1:b0c4:292e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed0844c8sm2137565f8f.26.2026.11.03.22.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 22:37:48 -0800 (PST)
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
        d=suse.com; s=google; t=1793774269; x=1794379069; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBykQPXKQvCmNmfGJvktyb+oW6DEUfPfa7BOi1X0UzY=;
        b=NEZPIZ/5t5OcrreQHOI+Vfa9MZSBUUkBH3Cs9a4xLTNwoI8L8p/dgQOn4Vy1W+ZVMB
         hvtiZSfZONGw5n0xr5ZWV1c9HpvnwQEqvD9Cjv++3oWzMzyxRxMtKXLeXoH6T6dIIzko
         qUjt3wOrpw1ah0mrShaMTDOmnSDyuIRxOqQjz0Umh5sahbKKrDjO4We28ZjeuBPwJN26
         HGyYYFvQZax4VT3ZqKKCO9q3tyc7tKCYDCIhKT2eZFwbb8BAduFOXS5bsMZH84wj95/5
         qnUgKGdIDreLtysKUd2eUDDegvsvhY2y1fVcqOV+ohlaELK089t1ltrbd+KvBtSz1gN/
         aI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774269; x=1794379069;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBykQPXKQvCmNmfGJvktyb+oW6DEUfPfa7BOi1X0UzY=;
        b=WQ30owD5i22dKe874W2OLlBW0JtjAwfiNvuxneqDZWVcgPtNLWjG0dZMf0cVBMgZMv
         CBQRvmFkhpLxmxD5jSC/yWF4qo5/a3p2KdMwBe3GV0ATWXWjLSxfweCCDophsvoRbEiS
         qj3I0o4TR0Io9hVea70/1mtpOix00TLAcjnGOzmq7+1rkfu8gVugSnN04mAvDLhUXSHp
         CJZ5RqD/Bpz1M/zAqPsvstVd/+QamsvEUqRmSyS+RrHzBmNklbBfcgkGRRhyYGlUefif
         A3gv0+HVUkffEs+geFAIFsnBWfWtRI8MqNeB40Rb3xJT7gyR/qGGGNis8BcbPzxTqITO
         clbg==
X-Forwarded-Encrypted: i=1; AKwUvBzRy/KgQQ6BUMZwtA+a21v3zi4TYuz80uLzn0cxTvHwTncn8DNIWQIkBB2BZIfx9xK7KSNVmmHkjGM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9bMOJ+xf4Y4FMonoSe4zOyV3teU+j0UVfgRFmPdZaXmhDRtURj
	YcS0+mPh2+/1gwb15gjoQWfxjcF8SetrnLL4aJkm64s0Hp3hpux8b4avvYwnLwZZtA==
X-Gm-Gg: AYBFou0s+rWcM4/4oxwOeb2RoSqgz4LQOigXWXAi27rwfvwQYzsr1/03cPW6TlnBpFQ
	T5wEm67VNmoDZkSleSKVkOwT1RFW/NeoAKmEFiXYhC1km7FaJIHexqLJ5fcoIFwad1Cg9TNZnlS
	k9upTFvuM5yC58amvkyL3MNN+CehBUY7zWUnDUP1rccxvjtQUZIDVm5T0aMaP4JlyHe0t8Oc5X5
	RoGGkWEPG/x3QdFg07vJO27GZGcfZ+wYz6H1p5FaKnWFt4+SoRfBhFvPjMX+Hp2Urre5QShBKcs
	DRjF309BRLRD3zXzICcWXFXlhi8pxmVsq3dqG6cwRx8KriDFRUfYLfuMCcFpBU0vompMEhxNZAs
	JhFlsS+dvizZmJHwVmlALrRGwEbfwySATGMs3Ch+BgHa9yr0b7IPQuzMpvXF3ViLNx/pHZqx5hg
	BIuwvwCl+12HcN6s5FDMqcEv+9Y8qeBFpLf51RAoVKZeAt6/b0r32UirBKke64tv0sbudhhmcBI
	ZjUq4LmdMpnZmSowBii3x9qmGsWSl1Nn4w1KBxJVoVXxqPEmkCC+U0cky1Z8QOujWNWhd4XOsvL
	Yeg2lTpX8U34fBVTXgiVVs2mn425vFnf6kw8KdCvWKsMQq3RlRwryFXDRDzvbwz3ZYQAJFIT7fd
	4GB16gVFjWtyEb1GCnm6YCFjctudH/a8dfK+BpPxgsztvX+2FsBZf10dkNDdJ
X-Received: by 2002:a05:6000:186f:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-48fdb476f92mr2428209f8f.38.1793774269558;
        Tue, 03 Nov 2026 22:37:49 -0800 (PST)
Message-ID: <e81c4959-401c-48ee-8fae-a7cc39e45a2c@suse.com>
Date: Wed, 4 Nov 2026 07:37:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform: fix the MTRR rollback in XENPF_add_memtype
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261104045058.1434821-1-oss.patchbox@gmail.com>
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
In-Reply-To: <20261104045058.1434821-1-oss.patchbox@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793774270-F7CB82A1-23BFDE63/10/78276251493
X-purgate-type: spam
X-purgate-size: 1300
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 05:50, Yuho Choi wrote:
> If copying the result back to the caller fails, XENPF_add_memtype
> tries to undo mtrr_add_page() with mtrr_del_page(ret, 0, 0). By then
> ret holds -EFAULT, so mtrr_del_page() looks up an MTRR with base and
> size 0 and releases nothing. The register that was added, or whose
> usage count was raised, stays in use, and the caller only gets
> -EFAULT, without the register number it would need to delete it.
> 
> Pass the register number saved in op->u.add_memtype.reg instead.
> 
> Fixes: 8ee614278c2d ("[XEN] Fix memtype accessor domctls.")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
for the immediate purpose. However, I wonder if we shouldn't drop the
rollback. Elsewhere when the final copy-out of a hypercall fails, we
don't do any such rollback.

Jan

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -295,7 +295,7 @@ ret_t do_platform_op(
>              ret = __copy_field_to_guest(u_xenpf_op, op, u.add_memtype) ?
>                    -EFAULT : 0;
>              if ( ret != 0 )
> -                mtrr_del_page(ret, 0, 0);
> +                mtrr_del_page(op->u.add_memtype.reg, 0, 0);
>          }
>          break;
>  


