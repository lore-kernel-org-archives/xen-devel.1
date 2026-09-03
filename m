Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0CBC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 09:21:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406597.1639804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x23ck-0000zU-1r; Thu, 03 Sep 2026 09:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406597.1639804; Thu, 03 Sep 2026 09:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x23cj-0000zN-VU; Thu, 03 Sep 2026 09:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1406597;
 Thu, 03 Sep 2026 09:20:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x23ch-0000zH-VN
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:20:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x23ch-00CKRo-4p
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:20:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a993bdc-2eae-0a2a0a5409dd-0a2a4505cc2e-46
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 11:20:43 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a993bea-4cb1-0a2a45050019-d155802fb97a-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 11:20:43 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso22316345e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:20:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5dec54sm66723905e9.12.2026.09.03.02.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 02:20:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1788427242; x=1789032042; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPnZU8Fk7i1glkEtaHqrSSe4depEmhgbzuFlNVw/JT8=;
        b=MpEVZMaAcGDQhnuixUAR7En2mA1+Nrggg+lXLlTZHLcJbi9Rinr9NIHpEMCYiEVNti
         IDs1y5MwMKf+VSjAzl0aM0X5ljz7HIuG1G75x0x+OnzsydSjw+nNLDRL2V/ZWewOBr1t
         x6pYdTo4lMppAqKwvSKS8BrOJkQ6vFyetkMz7r1vt3/e2adL7PIKYSF9BTHrjJJvUMu/
         jRru5agjPlf9m64CIDLoN0lfe8J1of9EYymDw/hTANsDfWaJB+XaGaEYrPn38nW0NkTf
         P/1K6mmvQWv1yyYEL1P4v3kE+Qgrm988t+g90qKOq6ldiJ1UN2+JxQeGCyBkXewdnfZg
         Rufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427242; x=1789032042;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPnZU8Fk7i1glkEtaHqrSSe4depEmhgbzuFlNVw/JT8=;
        b=hqrtwEPem0GBkSMZ+qQnTGHW0siR2lxJUqxC4rl0E0HwdUDbKbQVxriKD2Ecbcc5k1
         jr8a/66lFubn6S0S7Yt1h9/iYTeLEhaUj/FMn53LrpEatI+7y81KtHcWLrrbvn6yQ2/1
         8CVyUsQusUhCdWWGU1O27cZjT7D4lXyYRmdwD71dz/K4gTDHWw7XGxpY1J9NKtRtSn7x
         TjcBqm3+ek9cGR29P6tvSt3079eoRCFCE6BNeS8TFqDpX8H6LbjmsX8c6fjqS9w6NOgr
         p9ROu05oDxsHll6xOMJofxde4HbIpgJszqdNnVSF4WeOu2DySKdNvF7++FBK6KjIIoAC
         1XCg==
X-Forwarded-Encrypted: i=1; AKwUvBwv9+EaGLWhXFgtiI5coGJjR4U5Um4QfxFEfLlZdmjpZdfci5T+IIZHHQTOjmgSd+X++ArgAhDFSHw=@lists.xenproject.org
X-Gm-Message-State: AFuF++lqVL+HYbkZnlvB9E02vfWGxWSWuOjPIr8FdPNnt0/6AX9bv/Se
	QJsISew3ovgRkAluTIxpG9M82ReJZpbuZq8gx983hiOvVcZNWzuQNZCX3wZiSCpepg==
X-Gm-Gg: AYBFou2sUjHkeCi1/Tmb8CrsjQ4oSLI4N9/1RKToCfknkNfqImkhl4YN5RIrTzYlP9z
	JOAjv7di+KBN8vcrVOMmBevISHl6R8cnSg0pUQAWhE0PdSUcoak0mNEqkEWaEYvM5JzaDVKqllD
	B+NhcVvqw5shcI0vH8eOO+ePRmabuNPK1Yrtm5ZEUIhg5PZkC5iYlKcPBcvIJtaM3rR6/ESl/Rc
	fGr34H+Ji9T0IGZppMwZyAgUkRT9P/P8+1Adcy3kGPpBLfNuxp+wDwUzP/62uQ86gHN15x/l+It
	LqWdAErk+WRH/dDeKsvBoiB1Z5U7IKNXBCgyoNEItSU/mi32nI9ePtnrn6nTOuWDNnsya91nHDU
	J6eL6yGdBEZSHN5eFu0Ykl4NBxVQRHAZWvMsHqlQhQJtMNEnFPwXsXIz6Zed6DB2nBC5QJQjAm6
	WockCrGx/HSclsq0gRUW9PzbRpRN76BCnxi+Tf0AK62T2wnkuAmJT9H5A5iNwcTz9lpN+mkI/6M
	oCzdCFFkjfo+b/vqhysSXS/8+36xEqPq5PnWDnO9KnPG0aJGQQA
X-Received: by 2002:a05:600c:1385:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49ce583e8c8mr177678425e9.9.1788427242320;
        Thu, 03 Sep 2026 02:20:42 -0700 (PDT)
Message-ID: <be618606-3b3a-41e7-ad99-bf427f1e723e@suse.com>
Date: Thu, 3 Sep 2026 11:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/20] xen/riscv: introduce (de)initialization helpers
 for vINTC
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
 <688352e340872a50af99a51082966669787b1f72.1787836900.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <688352e340872a50af99a51082966669787b1f72.1787836900.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788427243-24B1D2A1-6CCF2F7F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1172

On 27.08.2026 17:19, Oleksii Kurochko wrote:
> Add common helpers domain_vintc_init() and domain_vintc_deinit() to
> allocate and deallocate a virtual interrupt controller (vINTC)
> structure and initialize basic virtual interrupt controller registers.
> 
> domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
> is implemented as stub at the moment.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v8:
>  - Add call of domain_vintc_deinit() to arch_domain_destroy().

Why only there? With ...

> @@ -308,6 +310,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = p2m_init(d, config)) != 0)
>          goto fail;
>  
> +    if ( (rc = domain_vintc_init(d)) )
> +        goto fail;
> +
>      return rc;

... anything added between the newly added code and the return, ...

>   fail:

... you will also need to call it here. Since it is (supposed to remain)
idempotent, I think you'd better add that call right away (as long as
domain_create() calls arch_domain_destroy() only when
arch_domain_create() succeeded). Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

