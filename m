Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04A606F60F
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CzzDlcp/
Received: from list by lists.xenproject.org with outflank-mailman.1500264.1696489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVP2j-0000Io-8d; Mon, 23 Nov 2026 08:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500264.1696489; Mon, 23 Nov 2026 08:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVP2j-0000Ih-4a; Mon, 23 Nov 2026 08:04:53 +0000
Received: by outflank-mailman (input) for mailman id 1500264;
 Mon, 23 Nov 2026 08:04:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVP2i-0000IN-Dz
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:04:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVP2h-002rzI-FA
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 09:04:51 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03f392-2eae-0a2a0a5409dd-0a2a450aa198-48
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:04:51 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03f3a3-f2d2-0a2a450a0019-d1558030e85f-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:04:51 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so20448355e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 00:04:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b3a7sm379556105e9.3.2026.11.23.00.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 00:04:50 -0800 (PST)
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
        d=suse.com; s=google; t=1795421091; x=1796025891; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xectmDOxRnd4UNdzPo8Bnom/1nV3EDYUcIprZWZ3tY=;
        b=CzzDlcp/QNv8eaVcMuw5RHbwWjZ9XI5SPxwJA3dDiRXN+lIbyk91bfoumPgsBeTe+2
         J4jgsyUOrFC1URhaeYuoyhOQE6UlUkpps06qryNp+MtN2m5mx8eKK8N1uNOkzVaP6lLK
         8JobqqOPIj/Urcof0bKXBdSS/igjNbXsDFEgWVoZ8sS/B0xgPjF82JG54D+HMKflh9rw
         3G87xgDpAwpCXYlJFjUleSdEYjlj5h7Sn7M0Zadee1PjSYKfFBvzmXXfxUMzVeDtGSZs
         WXuhFQzu3uCACvMyUd2jPElbdA4neR8hwuP70hpPoxlPb3jfKEFboa+64IDlr7y3KXAF
         Ywhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421091; x=1796025891;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xectmDOxRnd4UNdzPo8Bnom/1nV3EDYUcIprZWZ3tY=;
        b=i5pKcgV6f5mJKhg2thWLCzLn1wRz4eymKy8GoLy5a2jquZwhiu44Qft6MDlQ3gMt+M
         ABppk+rP+acmw7L/OFR440l+pXUFe6queLhFCnjWPawjCODdf4J4XwoRip5Rm2XBTGoA
         MO39HS0yamLYO33ULwV1vdi6gF5HIBw/vKDAv7TOtm53kWZnscsqIByezWqwS3DPUZXZ
         tDUtaRDm8fJ9mdTj3gFeAG7I770B5DNDoPYtZ13aOziOtxK8f5qWqt0D+0x4cz67UxU7
         Hg8HEqf47WdconAkV8nm3aRBBeyUaejhui004TBgBPWRyhcqcXGKg7bVD8R3b1zq6gcB
         usvA==
X-Forwarded-Encrypted: i=1; AL+hErExN/Mjn0CRbx7nPlfUgV/cKwZdihtkN3DQtOSRjHHoNMkLIoHVps+KVIaGoaftjXyCpPxmE5u6KPw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+df2JJYfqZI3kGAYj2uIAWhZ1O15rNn9joX0l0SdE1oV6ljAwQ
	1Xr8xNgkNx9qd523Dj4zLke2mcD12PnbH/7iQlm2QUsVYHO39SxvuZ+vLQfVgo2pbA==
X-Gm-Gg: AZFdTZfSAjYl3lmn8XyEOeWOnUmp7ofnO/UUHAly8YFtPFfsx09EnUnONvJWA/zL7bI
	OlCKjWLktR2WDaAo32GuWx5G+tOLRNGGWnuLG4ZOeqG1C+h+aW66/Lcn5rAuKaF2IWUK+tTqMlO
	PhHj00M2CgBX/17kH3itV5Fgyz8CA70M/jjDijTrd+kXDdvPeo1Z9n7Hyb7bhei1UQkOal+1ui+
	bpiolfR5AnCpSS1kgGKSbT1CqCd1NbsGPInf7V0qt3doeZIijgsYqVbRNWe6IrFFy68PO19FIy3
	iyc39hVrQhgOe1WoR0emFMK6xDX2xfLFpsk4LWm8ovOceSeNe2ia0f19utcMrbzqTUhGqX7o2yd
	XEYykqWkAy/+HntwnI1CO/23sbi90ka4DMbDGsnnECn7CE7CuhIVBV3PJ1hvAb+i8SJjuh8ad5Z
	StpV8laxYhhfABOR0kCk7PLI4nH7itYxlfoJPXFV/yfOFmeOhhom+RFIL/xtgDi20wpanEVi0Y8
	AxU55frE779j4Jy2kosOIm0Vw0+mcZ+iQuobo0/cn5MEK206YYlUWmYVya9I1Ro5vGVXHUyVdRF
	QMC4DEUWzrq9HDmQixXV86q9WzySPzRaOoATgtM4Thse6EhhgdLomL98eXTArf+wqYIT8Rvv92s
	iSDvSUUhgM035J1tO
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr143684915e9.26.1795421090866;
        Mon, 23 Nov 2026 00:04:50 -0800 (PST)
Message-ID: <5ab98397-7a25-4571-a404-8f123bcf8921@suse.com>
Date: Mon, 23 Nov 2026 09:04:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add Directive 4.3 to rules.rst
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9981629dc9ea12a2bae9a06b70a4d2daa0556dc3.1795361846.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <9981629dc9ea12a2bae9a06b70a4d2daa0556dc3.1795361846.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795421091-595C3CFC-151B58FA/10/78276251493
X-purgate-type: spam
X-purgate-size: 327
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22.11.2026 16:39, Dmytro Prokopchuk1 wrote:
> Directive 4.3 is accepted and ECLAIR reports no violations for it,

... and is already marked clean. Then ...

> record it with the other directives.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

