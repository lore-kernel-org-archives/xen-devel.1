Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9D606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N0/D77Ax
Received: from list by lists.xenproject.org with outflank-mailman.1461506.1672531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMRm-00074c-5u; Mon, 26 Oct 2026 15:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461506.1672531; Mon, 26 Oct 2026 15:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMRm-00074U-2W; Mon, 26 Oct 2026 15:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1461506;
 Mon, 26 Oct 2026 15:17:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMRl-00074H-80
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:17:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMRk-007XYD-Kv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:17:12 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf6eea-8faa-0a2a0a5109dd-0a2a45048ee2-30
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:17:12 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf6ef8-b57f-0a2a45040019-d1558035bd81-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:17:12 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so14739515e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:17:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdfd8dsm16088086f8f.56.2026.10.26.08.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:17:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1793027832; x=1793632632; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh9DCh6BnCIe7U1+Jq4ZLGGkRv6UNGL+JzO2IuJFWE8=;
        b=N0/D77AxLlt09awgnAr3ChXgWawWkZH2i0pRVy+5vqcGKj7DpPHqxqZfc8ptjwHfF3
         UWvz6AWSXWU30TopWh5Ms700nkEJRDUVOb2l+HY3rm0Q5Ln3UGl4SsLIuVF8oEVhuCWA
         5snPQm3qR7iFCFSOrptDvEC0D3ij+p9NOgula3pLJ3NFaRPa22J0rV8xpOp1lYUeB79v
         /gmTETiMy5VODfrxp1Te/4rJo3xR6lPlVjiCyxsZbPmWRnnZ6uG+oRCcT9j5us9DTNgH
         E74HifIhIFcjanQ9HhpbzgJ0x4jlh5yKNje31GENDj3nBVuOlF/mBt4qvYh1EEkneQpq
         N+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027832; x=1793632632;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wh9DCh6BnCIe7U1+Jq4ZLGGkRv6UNGL+JzO2IuJFWE8=;
        b=C7OCKKhg/P3Zwu9FurNdFeezyG2cPQjTTLH/pW057xtiCOZwsdYH/3J1m42tVDVFNZ
         N1D91KVD/SQqoQFZZVlHWNI/Hpg0kAd4x1weIs6gKjY73O1q039VdisjoyVRjYStWgJ9
         Mp7f/UZciOu4NRBpvFqeu/2exjn4k7R8mugKhnp5Keq32u9wnbAtDbh4bLuZOor1BP+3
         hCoKeM03rrAEtnyZ7RJUruXGN4y878TJhoveuiqF9sdXevj3l7uivaD09B877pz4XiJQ
         3zT/c8UaPimtKgtg91vJpHSjl1JtFolz3Hl/l+Q0VxzE3wFMoMAf7N8ErgA6pfMBg4vq
         jAKw==
X-Forwarded-Encrypted: i=1; AKwUvBw0jo2XjTm/J8ChfK4M5cXqqjOC2M1ga6lIx//4Hj2679p5UVNU34e8FXSDK9nnN8cOUVTWrd5JVdU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI53V4cotHT0QYrVYdGHTTSMwn7C+SeXOuI2Js7/o/ur49WvqSw
	VCkFXEZXKcnVzUuCr069le5PaqN6tGxuI+WzaET8UDtTq/McM6dJwjXTs/TClCHvdQ==
X-Gm-Gg: AYBFou19Jj285mXraU7Z49V55TU40sV/4ZtRMMYSK2werVnZfLLC0rxcBxXadOJffbI
	/ys9fI9+mHp3mlNsl1Uv4CtuCyJzWULlGcSGZa9rU1b48DiMWUiW/OgG3yYvfdp2vzNoWplzz7n
	DfEJRzOrawmsNCbpX5Wmcjqu1hb3uo+QSbxYEsmKcO96erb+drI5TPX/HferzFm+9x4InHg8oLC
	qERW92WXMoIwGEE0kDH6HTUkpDA7r9WAJR9wPQYzeQVLPuDSXeKi1+nQ7HOPsAbMXkdwal1HlD8
	25zJNVuBMC4xcosnP20aa6AbKzURYDqmN63xk1dRj/GCkvHURL8PfGbe0s9SdjtH9/5TKNmRt1S
	caZClazPLcjMdXJTHg+RAj9B3AGY3VAXvNTGXaEZTeVoRBD3G0edjZjttFmv7sWN/LT6BNchUYD
	0rPUPO3BzEJ97tDZcFjzWnqQgvupgcCsXYePZ5Z4xmykraQDUxOFEKkzFG8h7cDxNhgg1IWNJEd
	JzNcmd6zkWhCBf7sfVTKZITW+lMwO7rQ0KXm2cPDP8z17Rcn3OhvataHshBpv1aiVMyNWhJymp/
	oPjVy9kmnpahOv9lQxItD5xdOdQRSBB5JTw3D3SFuBs=
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr140871985e9.16.1793027831844;
        Mon, 26 Oct 2026 08:17:11 -0700 (PDT)
Message-ID: <f4aa19e4-6f48-4b8f-a648-c040e5f06f18@suse.com>
Date: Mon, 26 Oct 2026 16:17:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41d073a1c07e10f0d86da4a31e7a91b7ffadd8d3.1790947567.git.oleksii_moisieiev@epam.com>
 <abf320fd-daa0-4057-a6c4-b56c4e336ee6@suse.com>
 <fb0e223c-44e2-4c28-ab24-50ce5a726185@epam.com>
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
In-Reply-To: <fb0e223c-44e2-4c28-ab24-50ce5a726185@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793027832-C36C2B50-B319CB12/10/78276251493
X-purgate-type: spam
X-purgate-size: 1553
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 15:52, Oleksii Moisieiev wrote:
> On 05/10/2026 11:52, Jan Beulich wrote:
>> On 02.10.2026 15:26, Oleksii Moisieiev wrote:
>>> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
>>> allow for building Xen without support for booting a regular domain (Dom0).
>>> This functionality is primarily intended for the ARM architecture.
>> I (still) wonder why this would be, but well ...
> For v6, I'm going to describe this as a common option for legacy Dom0
> boot, with Arm implementing the code exclusion initially. My immediate
> use case is an Arm deployment where guests are launched through
> dom0less and legacy Dom0 boot is not needed. I'm going to clarify that
> this use case motivates the initial Arm implementation, rather than
> make the interface Arm-specific. Is that scope OK?
>>> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
>>> default for ARM and X86 architecture. This symbol signifies that an
>>> architecture has the capability to support a Dom0.
>> Oleksii - what's your take towards RISC-V here? Should it select the new
>> symbol right away as well?
> In the staging branch RISC-V's start_xen() does not have a legacy Dom0 
> construction path.
> I'm therefore going to leave HAS_DOM0 unselected on RISC-V and explain
> that selection should accompany implementation of legacy Dom0 boot.
> Its existing HAS_DOM0LESS selection does not provide that path.
> Does it sounds ok to you?

FTAOD - my earlier question was to the other (RISC-V) Oleksii.

Jan

