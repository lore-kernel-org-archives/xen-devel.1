Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973D2C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 14:19:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389134.1630057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9np-0008Cv-2S; Wed, 12 Aug 2026 14:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389134.1630057; Wed, 12 Aug 2026 14:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9no-0008Co-Vu; Wed, 12 Aug 2026 14:19:32 +0000
Received: by outflank-mailman (input) for mailman id 1389134;
 Wed, 12 Aug 2026 14:19:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu9nn-0008Ci-KJ
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 14:19:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9nm-006RH2-Aj
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 16:19:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c80f1-8faa-0a2a0a5109dd-0a2a4501d118-4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:19:30 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c80f1-5984-0a2a45010019-d155dd36c5cd-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:19:29 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so584746f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 07:19:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf5c13sm7520310f8f.7.2026.08.12.07.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 07:19:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1786544369; x=1787149169; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYIvVHFALMhhhABLu01nMlsX5hc7W0tduk2QlSjUgYE=;
        b=JSDoOsBgKxyEfzHmO4TuOXUzsjNYnB+BhxkzQlSuAzLkDrQUEvPzmO7ylvM2JRlHpA
         MPzxj6yJZKtId4ziqpx442llKAflYJswbM/GWarBjo9z9rZDEFCaOiRxnDMuUw+ThP6U
         n6VTH3CR/f5ixLCMgTS1zmVSDAo7JYkK8RBt8LahDuVBFo4K3nJKkrn+LV1UZUYkt/wj
         KyL2ZvwmZjojLSlLAn5th9ZZyPQ+ZUOh5F0GCNoUq/vcFDyXVq8lyXiGk/dhISyZfNRG
         YrOG2gYBlCmuyfs2+Qv1tyc4aOqjbjDphqMAGzcpFQGW5qPUPbwkrpZkiw4NtOYxgqd0
         RhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544369; x=1787149169;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYIvVHFALMhhhABLu01nMlsX5hc7W0tduk2QlSjUgYE=;
        b=OeklTL4phc6NJzc4txPL8x78VmES/KM/HLCc9LAOm/kFp4dMf4nOzQgXNAZ9gxKb1H
         acjlUAp74zv/f6cqr/xL4pCJx1YvqNeiT4s6CXjuc2n6ih23gnZN3y1ZgIrcojNL0Hzs
         jcvnJG01pSRj5dCtPexqcXluG2nUkCeveDGTJbXUCgpA0ukXRwez/YzYicjMdQ4iD2qn
         DlB+dTst/VpBOIUeGl/dktGoqY2aMl4+RYnYP2iG81SPCxnUkH4UgdLzjv7HF8CBoUh7
         PM7ClaYD2N3I1HpTIlZgt7FXknPsYRhZP5ZlA2/Re/28YWwcIs0DWJogTUOUCdLwyQT0
         NKRA==
X-Forwarded-Encrypted: i=1; AHgh+RpmQAQQDkMUyAskKW7rHZRnbcv7Oka8br6OobGn1chIJkSS1SzaVpmTfcKOlbrVys3SvtN6qxgLfxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyrmVChaLx4tkQdePrP5QnfDTIDixiNyNf56M+1L6oV9JWSTsH
	bbaA04QHwe/OfJsySDWkSdrXkJshGXC5tJIMq35Ao8QUZ3TvefD71Nl1rxM3HOlbnQ==
X-Gm-Gg: AR+sD10rJKMfUUUWPD/Ob0jnsaBGHIGukHUNdYtD4i6d5LDx/IHvz0bUMy6ykNfsLJy
	kShUw5wGU1EUBnq+MCwMaTXsK7Ugejlqbk5O915KzXTcejZoHOB/OnXFpn3twRLxghMyLTpiszN
	bShOZ3LWCVcU2rj59JNAl8Dq+3Icp7pTKXqlzR6x9djyCZ5JRfApBUpvdsji0hMO1uL/8QiPx0n
	WLmorpcie/zdWFX/ZepUVJL8KcAYiPFddz/ZWAerEjHKaWpr/rcBP1+fe+6s8miHP+aVNSiKoTg
	J4JTMyhNnenswUsZ/qVgNkpeQrI1DedQ+kS6dn5NT0D4oyJ5E6+G3NlNzprTxj2R4b24/KtIqDE
	K69IzN0+IcCNmnqmyzMPqawTL9Q4QO0/+Ky+PyHlbYTpOM44A185jcvnRCIFlSbmdjZa9dzU1zn
	e/dyW4SjN3PniMUj8WCWYLKNE/GH6p08HmLHTjUuNTylxzTulR5QDa4hF5goQQyTsBexV7IW3L6
	DRRzbvTM9300p3J3rk3ldSuG4iDhXoj+Lg1iGZVVG+Fx7zmgHkfipFYaZgy6TWK
X-Received: by 2002:a5d:64e4:0:b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-48152913c57mr7138948f8f.18.1786544369391;
        Wed, 12 Aug 2026 07:19:29 -0700 (PDT)
Message-ID: <675c8106-a515-4567-ba30-09f2b0631634@suse.com>
Date: Wed, 12 Aug 2026 16:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/17] xen/riscv: add vAPLIC state save/restore hooks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b8aad28481520eb241a1f7519336d3e4bc9aff9f.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b8aad28481520eb241a1f7519336d3e4bc9aff9f.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786544369-C5146757-CEC5108F/0/0
X-purgate-type: clean
X-purgate-size: 1419

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/vaplic.h
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -34,4 +34,7 @@ struct vaplic {
>  int domain_vaplic_init(struct domain *d);
>  void domain_vaplic_deinit(struct domain *d);
>  
> +void vaplic_state_save(struct vcpu *v);
> +void vaplic_state_restore(struct vcpu *v);

Why would these be needed? Can't ...

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -400,9 +400,27 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>      .write = vaplic_mmio_write,
>  };
>  
> +void vaplic_state_save(struct vcpu *v)

... both be static? And don't they want to be cf_check?

> +{
> +    if ( has_msi_support() )
> +        imsic_state_save(v);
> +    else
> +        BUG_ON("unimplemented");
> +}
> +
> +void vaplic_state_restore(struct vcpu *v)
> +{
> +    if ( has_msi_support() )
> +        imsic_state_restore(v);
> +    else
> +        BUG_ON("unimplemented");
> +}

If you're merely forwarding the calls, why can't ...

>  static const struct vintc_ops vintc_ops = {
>      .vcpu_init = vaplic_init,
>      .vcpu_deinit = vaplic_deinit,
> +    .store_state = vaplic_state_save,
> +    .restore_state = vaplic_state_restore,

... imsic_state_{save,restore}() be used directly here? And whatever other
pair of handlers for the case when it's not IMSIC?

Jan

