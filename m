Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF821606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NMJ1cLj2
Received: from list by lists.xenproject.org with outflank-mailman.1463074.1674040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1Ag-0003Mu-0Z; Wed, 28 Oct 2026 10:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463074.1674040; Wed, 28 Oct 2026 10:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM1Af-0003Mn-U6; Wed, 28 Oct 2026 10:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1463074;
 Wed, 28 Oct 2026 10:46:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM1Af-0003Mh-39
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:46:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM1Ae-00Aica-7W
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:46:16 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1d271-e002-0a2a0a5209dd-0a2a4505cc2e-42
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:46:16 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1d277-4cb1-0a2a45050019-d155dd2fb060-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:46:15 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso484550f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:46:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb902sm29196460f8f.24.2026.10.28.03.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 03:46:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1793184375; x=1793789175; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYaL/UAyYGY1+l41s79f/K+xV0JStq9HH+IMzKIz5lQ=;
        b=NMJ1cLj2XsUKmkUS3RyTitaQ0OB1t7bYHPEJsYHqUpStCY2GWV8rOEtx7vsx7j+4PO
         wB1A/CF/zb3fcoIydVIAZLwfPXNLPHeOQNqpPuV9bprApv/um/NxMnQnENP4SMlD76ru
         Hrl78f7kvazq64r4L0nZOLiCeuHa7CUrs49XLfd5pW2UTiQvkJt3JcKVUEJbp3CT/CpB
         kxlrCAVgHzM2Z7G/PWjH7XSUzdtibFjh7ufbc2B+/r6F0f+0gH4nt8ZCa1tAVpApONv6
         o48t3+hlrA8jHjdvlYCJFpH/exfXPHKlagnbAEVKpecH3erjEsxcZ12G6ATshq1CJaiF
         rLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184375; x=1793789175;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYaL/UAyYGY1+l41s79f/K+xV0JStq9HH+IMzKIz5lQ=;
        b=zjJqTXztXwx9sHLb8jGas0rCmvoLckTPPwJEPD34EHaD1LXScejv4Mu5EB19ntQo3b
         tC0k3cEHmrtcCFQse1fhMPUFPZ9jEezjHNIS4NRGLH322p3cNjGT9ZZfjy1pAt43tr0C
         jJ6K2ju2VukJktRo8578bYdrGKW4ligE7iTg+sRU4eMA6ZsDgFItWaus+DYh8MbpbCVa
         AhyLNB8ztw/nD4p3Ze4ncfbquc1Y/cAxdqQofdHEavpAPC8ykra7Z71tE9V6Kf5zqExX
         V8Y6+9zMmkZq7V3f3Bdn5WiOasb6RBMPF2AggNtNXpchuVF7oqRxK4hprAApR0EWkmVM
         i3Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwVtTmEE7A0eeiY8VA8aNUKQnBHKKpsJupX6mCT85wqs0NRhOsm69Yxk17SpjgrjWkpXLJTPlznOBg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLhzpYnX8ZPpaVPkWlPTK1G/wxofvsPhK/VGikMq9FRAMC89yw2
	cEHTlLX4RRwVP/n4dNZQECYbualSjWF9pxc0POlvy5WzD2xfqw4lDO/7YTL7l+JpWQ==
X-Gm-Gg: AYBFou0W/jw5bV0MJToK3dy4EzdQGYP4zm91FwVVvAUHa+UbyiC58CLkarchpVC6qxa
	BeXRl8ueJKxPE6KpK73m5bYfL2rW+DwRmRBId3npdpDnEUPBZw+WDorQtGrhe4v6UJvVHTCKnNf
	KF0G7+ScOEGdY/E2Lak4u6ftihrZRq7GnhdnTWTmTDMBBokLtqjJOCBpc6+elX9uRN/rSbIcYgz
	GOKJ9DLIAMawZl8GehPteXRlKb5Bdpse6yVmlJ2L/AIditJghvzwmO+bBgiMe5XjGidmjJ8Abji
	3Mrye3mFe0oxKqwgPUoyXOU1aWIzAvISJ+fKg5QvDpzqvN6aeDctLU9tvJthYqkULDaA3nGdvMD
	GoiXmU6iVpt0DXlC6WPwtzsqK5cvPf/uplKPkUcrn52TmmYT7DKohNgojPRt8QA4sR0UkHMohCj
	vAOvh8UREF5Keh4oJedvbY+7/4waJLeWSRYL6Imi8BevdPZLiYhm6oRm0rD2/Sqjh/qiVB/GZNb
	Ai2WXh9PRBt1M+PvKQmR5eRESZ5fTtCTbaNNJ/0/O3LECgGoJOfrI4ItUx4ExZBiAjggyPSYNVX
	GgQ3Td1uBYKBnmiYFhxD6nT3gheQa4F06FTWEQK+lL2Dbz/OxNKu5W2dqi6h5HXeTYeoc6XLSEY
	8sfchdCfVE9K4NUFOqQ==
X-Received: by 2002:a05:6000:46dc:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e5d5d9113mr2910060f8f.44.1793184375183;
        Wed, 28 Oct 2026 03:46:15 -0700 (PDT)
Message-ID: <dcb3d1e9-0189-4350-8aa3-7ddd8fa566de@suse.com>
Date: Wed, 28 Oct 2026 11:46:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/ns16550: identify XScale UARTs from device
 tree
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
 <3e8fac86f88d9d3d002b86469b87c20aea53fcef.1792467713.git.zhangzheng@iscas.ac.cn>
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
In-Reply-To: <3e8fac86f88d9d3d002b86469b87c20aea53fcef.1792467713.git.zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793184375-F7EB92A1-28D672DE/10/78276251493
X-purgate-type: spam
X-purgate-size: 621
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 05:45, Zhang Zheng wrote:
> Identify XScale UARTs using intel,xscale-uart, since IER bit 6 has other
> meanings on some UART variants. Keep UUE set when writing IER so the
> UART stays enabled when switching to polling, and enable RTOIE along
> with receive interrupts.

The RTOIE part needs more than just mentioning; it may even want splitting
off into a separate patch. It's not clear to me why setting this bit is
entirely benign to existing code, i.e. in particular why the present
interrupt handler doesn't need any adjustment to cope with the new reason
that it may be invoked for.

Jan

