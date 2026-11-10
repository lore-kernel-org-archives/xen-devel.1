Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55832606B14B
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QQkZcYP3
Received: from list by lists.xenproject.org with outflank-mailman.1481374.1685229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiMp-0000Qh-S1; Tue, 10 Nov 2026 09:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481374.1685229; Tue, 10 Nov 2026 09:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiMp-0000QH-P0; Tue, 10 Nov 2026 09:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1481374;
 Tue, 10 Nov 2026 09:42:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQiMo-0000E7-Aw
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:42:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiMn-00E2t9-O2
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:42:13 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e6ee-8faa-0a2a0a5109dd-0a2a4505ab8a-24
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:42:13 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e6f5-4cb1-0a2a45050019-d155dd29d1f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:42:13 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so1189744f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:42:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbfc6sm4283488f8f.41.2026.11.10.01.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 01:42:12 -0800 (PST)
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
        d=suse.com; s=google; t=1794303733; x=1794908533; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKK8i5Z3ddSunFX/U1Cqkik39MrH5kU3DzIJrX+1QAc=;
        b=QQkZcYP3TdwpBc1JC3yjuonkO9LTkW9DTsPW9qgjYaI/ekB4RzEOxceDxgmCYVoj4r
         6E/F/t2ArrV75XJNOpsT38MbViBLhic1UaPNHk83KUohMDudpUySN9uZD9Ax74e4YKTx
         OEtj+QduQ8lY5Q/o9FYExx//bDA4+ZlHvJHHixYRE2DZZMUikKPMhmBBATtKYCsCB8jA
         B7oLlAhlTkc27nqwbvKGML4gMxEIrYarjdmDJyU20fMHYLI9NHbcetAYUSGZV0wXsgjo
         Y+mZ4QBSijju9UvmLdwLki5q61Dk8X4qmhKe08qYEGfyyyqx/nkm9CNZFQ9ORTzL9VrE
         ggZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303733; x=1794908533;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKK8i5Z3ddSunFX/U1Cqkik39MrH5kU3DzIJrX+1QAc=;
        b=1k5pp6EKjM7UxQree+4jx+ja43ZnhAktJZLaEwpXnEFKAr8y7pmPXIwjTz1kGW8L9T
         hISvbRFTrk3u3S1rtLZVmZg6ytW0OPvT+hv4DhZFG9Zk9Fj4ZZgFqsuP7dUPRdhWsH1h
         KJjxz1xQyj1wTUbnaVL1D+fllVw5pmySiv9IPzMqW2VKnJ3qVNpxxawtsic1iBhZtW6R
         EhuWaXAP3Or9fYlxKSTlCl9k/D4BCMgl4W8LIoOOiTy+Z5VVvg7KSjzNUrB6u8fTxKGh
         j/Gja52kypawtBmJ8gJLjT7s1BVSarixQ23jvwZfZh7GZOVBSTHTqz6DsSbN1/vk2ibT
         2UJg==
X-Forwarded-Encrypted: i=1; AL+hErEWft7isT/y03Q56xYhSAP34s3R+z1sHjtOaDoDs2C0daldfrfhqXlDIP/Q8x4bvuoPp0+JEQSDpvQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z98opIeJSwu/Vs0QCBdG1MgSHpFveYU4aUVs9PeFNlK5RhOXGAj
	tidOMtA70fW0uTtqShb51VQaf8HmXp/H+aWCQ5npfbVy63qXfewgpCu2lHIewlLreA==
X-Gm-Gg: AYBFou1P2DRLTqriT/LY+reT6uAgMhBgozYPbZfAw2I/ezMCAYkslWX/fZTk31JUe6W
	G8nYaC9qCK9gjVpHd5K5qM4JtRV2xmzaFTAl1flAqb0JqQZPJoB/vSYPr58lmH8w7ykqDMgS3QG
	uW6DZmclhr9mKv8ZZccCjOuI2Yz6XA5DcBcjf0HPMukkPlPebPArae/r2ADk8wZo33/OWN8awsj
	LZgxAQVkdSqy5QI7oyTkxvpmRq+L6ZKzMhx0jDi7ShSTwl+P3n7WGhA/5Se3ryEIW3m6iTth2Th
	PTIxcWNNxJj6dcXNMEVI9LNKwK+5j5kzDL1E2jCfttgXJ7Sar72snoG4e1Ni7pXfx4NL9EcchrX
	pBImLVpAJpWfPMXcd/J7l8mJJs1QySN4Z3hUYmZnDLLyyadek7bmsfcYPiuTT/Ohw4HJSKm/50h
	F2W0ejjdIhNvGvOP86smIkwzsnzYgPU7FMcMf2LpHfFgcCK69CrNWhLzAaD227+TyW+UypMh5Tv
	iLKeijsOP8mcnLPzKW47mNyr/korf0iPfHbFKa2IgPZNIdawZXJ2zo3/QEU0z/wgkQz+qbdJP52
	osI4GV/6E1MAZqJ0M99pRH23F0r33dPvhEpaINRi7nkwY8mpKCJ3S3q0mM3AxZDfdARvlPqQcbi
	asPJy20y+godBej2grw==
X-Received: by 2002:a05:6000:616:b0:48d:df08:307c with SMTP id ffacd0b85a97d-49830f6aeeemr4024878f8f.44.1794303733062;
        Tue, 10 Nov 2026 01:42:13 -0800 (PST)
Message-ID: <768d4dfa-6e06-4c2f-9f47-7ecb0d97d0fd@suse.com>
Date: Tue, 10 Nov 2026 10:42:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/riscv: skip disabled CPU nodes when probing
 ISA extensions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794303733-F4EA12A1-3FEA65FA/10/78276251493
X-purgate-type: spam
X-purgate-size: 787
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 10:27, Oleksii Kurochko wrote:
> riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
> node under /cpus, including the ones with status = "disabled". Such a
> hart is never used by Xen, yet it can still remove extensions from the
> host ISA: e.g. a disabled hart without the H extension makes Xen panic
> with "Xen requires extension: h", even though every hart Xen runs on
> implements it.
> 
> Skip CPU nodes which aren't available, both there and in
> has_isa_extensions_property(), so that the two agree on which harts are
> taken into account.
> 
> Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


