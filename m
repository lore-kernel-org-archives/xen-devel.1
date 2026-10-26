Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6D606A322
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BmctXon3
Received: from list by lists.xenproject.org with outflank-mailman.1461141.1672102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIre-00039R-3X; Mon, 26 Oct 2026 11:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461141.1672102; Mon, 26 Oct 2026 11:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIre-00039K-0G; Mon, 26 Oct 2026 11:27:42 +0000
Received: by outflank-mailman (input) for mailman id 1461141;
 Mon, 26 Oct 2026 11:27:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLIrc-000354-98
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIrb-000SAC-6J
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:27:39 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf3919-2eae-0a2a0a5409dd-0a2a450a9a50-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:27:39 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf392a-f2d2-0a2a450a0019-d1558031c98b-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:27:39 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so23829615e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:27:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd8c05sm20166262f8f.49.2026.10.26.04.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:27:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1793014058; x=1793618858; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIke+zQbhnjT6EriiY1LasI+Y32faj088B2DokbT1lg=;
        b=BmctXon3/L6wfnMGd/tX/oVl/gHJQSo0GgaqOvgulS7Ck3sN/qzPOumLfRWk1xkKtu
         ttgKSHWdYVqKto6p0ejYaMm0ORLzd5h8kUHTOskCZVWJEFDggbsWTSK2E0z13UXYiKWM
         QxcSMUvV1C6hLI24Ytj2D8MhTDlhkLoTGnjSXqycbSpEmy8ok1tMh7U43LE8VhpZbIty
         8MWRL6pIS3PO7dwdZArpebfUmVkclUDzmoWA76YeRy4qQq3ECz1ayGzr/19JYYA7iNdp
         IKiJiUJGaqwjfpjrBf8v2pgQgLI9G8cutAeAsgvmejOLYQlltaInodajTf/T+E7HLTyq
         NvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014058; x=1793618858;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIke+zQbhnjT6EriiY1LasI+Y32faj088B2DokbT1lg=;
        b=B1BFlFZJFRKHIctbMewXA8sGbyq9Jmp20W0z6eAPBuMpiVxjf5RdXhwQJn5/uvA13+
         JIThz18J24sFi1CEMoJ2AUYTkSpB4/U4r+CXnEzul0xrmd0S5fRxqFxaxof5iFbgXBdW
         NlOhOBhwM0QVsyQu9gSKiTMV/r6qBPGi3+AgouMXcamb0p2l6Es9jVR/bE2riPOGzLKM
         LK/j+o8Lxstjmy6w2hoorcm9Z7KrKWC5NTIrQIOwpHKjw4m4OzDG7w3ttprCv8cLY901
         UXRvIHjcOn7gdH4Qw7pod6Jo6VLB3ctM02BBuwcL16NVcAHTwGbv+4/2HSaxBbetnYnU
         psRA==
X-Forwarded-Encrypted: i=1; AKwUvBw/YSSB7R8Wj7HkcR0uU9xRnaQgAvjNfxiqt7+5rJeBbozyMXvhy/wKwTcIJyIGBMrcKVffS9zLojQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIuwuyaGZYD4J25OLz7Uvh0xpsl+mYVI0TIMnezkHYtf3HX+kKT
	I3tuWzDLENxJEaHd2rFahHVCCOIG54Z1iwjSQ5SvYeQjJvbgxFGwtVj+zzZjmhvgDQ==
X-Gm-Gg: AYBFou3GtTmrQ8JOHueQvbjMtclcpNzGzlxXtpI1DRa3mmKilt3ii0yst4aY8V3L61y
	uxPEuf7LMHheWN3r4Yo4WhRQKJredwCAeEC1To/bVIcYy2Ea7xaABijtyqw6dszET8zpuZomjri
	J2dSFJbj7qH57k4m0+5aYGwZKQFS5JtcaR3R48DRoornyz0OXbTSiI71Px9qlG2C6r5tymuQI6e
	tQ1eDlEo5tyh5c1mJDUjYxLEHHLHQUAbdOzeDjjIhszgrhDUGbDz3Tifn7tp70TWX5riksGjoVP
	ZXHk/dk1CFPKzMMfMBgnVHEo9pzYjSpfBxTSvZ2+dJdgVan+qQno8OsVcaQn7CK8T7CcZvcGAxY
	BiG2o8t7FktfjnExF1/axYnpfdVc68H/b1BgoZnvrVS2R0+2qY67O9VMSrvXrIpYm1yGMw3tr6E
	k/kvrgphWsvda7tmT/1klSocbkNXsekRfuFAy7UTQf/usgKZGD3On1tfomraFnRLv+VM8aoOkyY
	+BrTHUJ4KFxcuG7rMtW3ebZqjfsaAURZuloZqZA8OHruEYitSf99bBQwEyoRycvigCHEjHW+Sgk
	RDq+d+TxPHLD6YsXl+toqUmVUYHAPKCGVy3ihf3WH+ZO
X-Received: by 2002:a05:600c:a06:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4a35acaaacfmr119777995e9.31.1793014058506;
        Mon, 26 Oct 2026 04:27:38 -0700 (PDT)
Message-ID: <c7cfb94a-1424-4ed8-bd3f-0216edb2c799@suse.com>
Date: Mon, 26 Oct 2026 12:27:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/nestedsvm: remove dead code for shadow-paging L1
 hosts
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261020030509.308211-1-chunjie.zhu@citrix.com>
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
In-Reply-To: <20261020030509.308211-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793014059-51EC2CFC-AFD55368/10/78276251493
X-purgate-type: spam
X-purgate-size: 2699
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 05:05, chunjie.zhu@citrix.com wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -304,21 +304,12 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
>          /* host nested paging + guest nested paging. */
>          /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
>      }
> -    else if ( paging_mode_hap(v->domain) )
> -    {
> -        /* host nested paging + guest shadow paging. */
> -        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
> -    }
>      else
>      {
> -        /* host shadow paging + guest shadow paging. */
> -
> -        /* Reset MMU context  -- XXX (hostrestore) not yet working*/
> -        if ( !pagetable_is_null(v->arch.guest_table) )
> -            put_page(pagetable_get_page(v->arch.guest_table));
> -        v->arch.guest_table = pagetable_null();
> -        /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
> +        /* host shadow paging + guest shadow paging cannot happen */
> +        BUG_ON(paging_mode_shadow(v->domain));

How's "guest shadow paging" relevant here; the BUG_ON() solely depends on
"host", doesn't it? IOW I think the comment wants wording differently.

Also, nit: Please correct comment style while touching comments.

Furthermore: Why would the check be relevant only on the "else" path? It
could equally well live ahead of it, with the comments in if() and "else"
then talking of just the guest mode.

(All comments apply elsewhere as well.)

> @@ -1341,12 +1319,14 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
>              /* l2 guest intercepts #PF unnecessarily */
>              return NESTEDHVM_VMEXIT_INJECT;
>          }
> -        if ( !paging_mode_hap(v->domain) )
> -            /* host shadow paging + guest shadow paging */
> -            return NESTEDHVM_VMEXIT_HOST;
> +        else
> +        {
> +            /* host shadow paging + guest shadow paging cannot happen */
> +            BUG_ON(!paging_mode_hap(v->domain));
>  
> -        /* host nested paging + guest shadow paging */
> -        return NESTEDHVM_VMEXIT_INJECT;
> +            /* host nested paging + guest shadow paging */
> +            return NESTEDHVM_VMEXIT_INJECT;
> +        }
>      case VMEXIT_VMMCALL:
>          /* Always let the guest handle VMMCALL/VMCALL */
>          return NESTEDHVM_VMEXIT_INJECT;

This results in (apparently) un-annotated fall-through. As both if() and
"else" now return NESTEDHVM_VMEXIT_INJECT, those return-s want folding.
Then also please add a blank line between return and next case.

Jan

