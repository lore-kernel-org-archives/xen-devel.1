Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B303606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FUy7rUMd
Received: from list by lists.xenproject.org with outflank-mailman.1461635.1672693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLO3Z-0008EC-5U; Mon, 26 Oct 2026 17:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461635.1672693; Mon, 26 Oct 2026 17:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLO3Z-0008E5-2E; Mon, 26 Oct 2026 17:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1461635;
 Mon, 26 Oct 2026 17:00:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLO3X-0008Dv-Jx
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:00:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLO3W-00HVgU-Pv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 18:00:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf8721-e002-0a2a0a5209dd-0a2a4508cf70-8
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 18:00:18 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf8721-f659-0a2a45080019-d155dd29b97c-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 18:00:17 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e0d885929so2144085f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:00:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb9cesm18300319f8f.27.2026.10.26.10.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 10:00:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1793034017; x=1793638817; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EU9qzBj3Qx+LtSG4rL+zWiwoGCFOX1fxvjpbTQiQ6VQ=;
        b=FUy7rUMdMgiRbdBbgd+dItPhoMJbFP10mzFqhnJEE6v9Kq8DhWD1gOooImQpaJ1PUF
         cuqBWJoN7ut9rj7mYxuNgY2FZWGWxI9fGP0n+8LW7nZF0ODiZNkIiGkmiflOmKyU3AKb
         fy58XgZX/l/4U8oKdcMioLXqP5e0PQwDzUGruA7UqbV1rEUGSv7i4IRnj0JRfyrJw4m+
         Wk3PKVHL1wApdx/2h08tRa6DcNFPPSXiKSSXhThZegmo62PsIE2ZEEdzSCszTyIhCnW6
         3kEf2J8OueMa1brqxbITsgHRpdK2ikY2DpEMbCXS1mlanQlURnJh+qFLlKTzjcJ1zyRL
         KLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034017; x=1793638817;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU9qzBj3Qx+LtSG4rL+zWiwoGCFOX1fxvjpbTQiQ6VQ=;
        b=G05ddPnfAGDgekgIai91frZXisJbgNTx2ld1mS73b0/nt2SSLSw0jhlRNJDgln19x1
         NKPnaSm9w2b0aa0uyhiATyl5jKq6WOt9kfF17mN/CXwSKctQ9KXyMoKrLMFCTYPbmaUx
         tZRMw5SkHiFRGAmW5l4JaPs7h2ooktXNOG0iqzYCWJ17j8GIZ5nNEPZ2w8BbUI8se6Ug
         uqSun3y2o7ph3q+OsufBQMX0srBeyYOWH3wyVgMluY5quvtAChn+hztxF5EzsDuHTAQC
         f+78zAAXpUiJVaeZ/Y8O/RqGh51cGP40Pv1xQx50e7m/FcpB+/BTMPMrPHui4/TyVoYO
         fqTQ==
X-Forwarded-Encrypted: i=1; AKwUvByRjIREjLEexJVkWHBcCF4+aa03CexfOWJc80amq6RlpoospZncsr6GA18RN5XaOXXbS7V6h0WIYWc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKEwpbPqIbSPC7YFk+5yg4asqcTecqKAX3NAfvl3a+GKeWS/RNc
	qkYUS+oKsH9u98rsWDQupkXqJL4CQjIr91i+XAdi9QEsZxRD4vXp+94CbWUoLDhrpA==
X-Gm-Gg: AYBFou3HvmCubCjK7wfaEGGOoz60thAYF/NDHxSOeAj0dmfu5xmMgx5VMQinXtvCXIp
	8NZmyQcAxyZvRIoHhdJTm087fBj0bNUDFnXjndD11PUKHGk7xSavQGLMYNdQT5Lp2Ow1tcEO5BN
	JcbNwr/eIppS1qARpki1MuUxpPyj5gexavymiPqH97dAs1HqkpiK2VmkyGDkd/VovnfckvOclj6
	QYNlWLoESQCKaV6xZ+GDTBnFusVx3yO0jnk2ac0TsAeKIIkYjPaYaBZMMQsAUi8TZSPkhuEZhWM
	3iY2FAzCUNKflUsN35ckjy8KA2PFZERGXHxLxOdyRiWYXz6y5DWYDdGuG+RZsrlrWNRQ32h2szJ
	o/VylMt1/QvV5P7xIHpNYpjmG3TZz9izAFcPsERljX0/clnuLn1DKzPQu8XbXfnqW3+Ne/Z3STo
	1dGB6ihd8gcFz79dcC+kXTPzldrxI8qHOyEj8fBOazDXqAwV1TfqTNRcp2jjGpdIj1PI7NX79EO
	SgGmRGyy6wVt/g0PSVsmHZWDRtB56C6WLhExCw9BRgB45eh4IZFe8IAGDlsogSyO1tUUkX/gOlG
	AlV9op8Lsl/IJQNv/NoBi+ZE37Redp2hoD3Z55wbEfrm
X-Received: by 2002:a05:6000:27c9:10b0:48e:d88:55e5 with SMTP id ffacd0b85a97d-48e3eb457f9mr10319124f8f.6.1793034017023;
        Mon, 26 Oct 2026 10:00:17 -0700 (PDT)
Message-ID: <fb7c9336-10ca-4395-bc1f-1b99d6c113cf@suse.com>
Date: Mon, 26 Oct 2026 18:00:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] xen/riscv: rework the A/D bits comment in
 p2m_set_pte_flags()
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
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73b94000f79f@vates.tech>
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
In-Reply-To: <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73b94000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793034017-CCB7187B-8D8C9AC8/10/78276251493
X-purgate-type: spam
X-purgate-size: 1084
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 16:14, Baptiste Le Duc wrote:
> The comment in p2m_set_pte_flags() quotes the spec at length to describe
> the two A/D bits schemes, and its TODO mixes two things: why A/D are preset
> today (OpenSBI delegates the resulting page faults to a lower privilege
> mode, so Xen would take them with no handler) and what remains to be done.
> 
> Summarize the two schemes as a short list. The reason for presetting A/D is
> not future work, so move it out of the TODO, next to the schemes. The TODO
> now keeps only the later work, handling these page faults instead of
> presetting A/D, which only concerns Svade as A/D page faults cannot happen
> otherwise.
> 
> Also note that presetting the A/D bits is harmless when the device
> tree advertises both Svade and Svadu and the platform uses hardware
> A/D updating.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


