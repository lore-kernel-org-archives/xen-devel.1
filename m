Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D997606A321
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V2Z107F3
Received: from list by lists.xenproject.org with outflank-mailman.1460904.1671776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGpF-0005GM-LO; Mon, 26 Oct 2026 09:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460904.1671776; Mon, 26 Oct 2026 09:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGpF-0005GF-Ir; Mon, 26 Oct 2026 09:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1460904;
 Mon, 26 Oct 2026 09:17:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLGpE-0005G9-Nk
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:17:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGpD-004yPQ-TZ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:17:03 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1a88-e002-0a2a0a5209dd-0a2a4501c2e6-36
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:03 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1a8e-5984-0a2a45010019-d1558035c5a6-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:17:02 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso20802035e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:17:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0aa097sm199195505e9.3.2026.10.26.02.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:17:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1793006222; x=1793611022; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkYVOE+KTU5yhmG9VnOr3WKgKHikxZLRzv9/tv3cFiQ=;
        b=V2Z107F3LxYwWyKZWP3sBQk9SVgyHuiWb+zM3Ac1K69MDD2gA+DVTsWM/DvgdXe5EW
         1TY1IPow0OhPtEWfTfUbHHKYODnTjWDak9+9fyEujim/Fcn2drP3+muDcbSyPRPXaLDZ
         raadnHo8bzvE0rwwR/6CcAuBjWPSbGfZPdf516aPtqjQZjnrABDOlERxCc+1CW08JywZ
         hJAeahPnLHizzjoAosszTraKagGPaB8ReTP+aifJJcAolD81ACG6DkZA04A0m15CmgnC
         6d6wZgHUYlZILzFALHyRD4Htcd4cpHqb89oOxu9uhTVbcr131rdBZhHK5mJ7DltIXzPF
         NmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006222; x=1793611022;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkYVOE+KTU5yhmG9VnOr3WKgKHikxZLRzv9/tv3cFiQ=;
        b=0ztCxS1m2uJfaCRpaIxbe7bR4APJswBI8PAYPTxNhjZKXkmcDRE8CXaFddGAyOSV+r
         it/hscWvBInmqwLnVpwC+VEi8ZZQYv+mREgsutjB4gTi2SvRwqTkpx9Ho8yIt4pqOIkE
         hUuEf8RT13nWUvE10RYFuh2dD6tPB8jS9CxFztYWrRPbdb4zjHxddhz1QCBq3UTp8CWS
         0N06Rfo7dFm5WoQ+Af8Dz7koAlPBRxv+qsjWNRBzHwS+cVjtNCVc7kX5/FGKrogsoZdS
         ZUn2y1/rWkbcz4IiqXops02MR97pZoQ5Jl0+/H5GEAfZf0RGU9gt1Udm/rgpXlyHFMOE
         IXXA==
X-Forwarded-Encrypted: i=1; AKwUvBwHXo/qqe6ltzWwt0SJj6/rdy4u5tLeQcFP9tc/lSh7iGEthrXyqfhFK7+28g1Y8fH/STxBvca2I1g=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL86NSyLxQI4bgGORaXRfTRlG2zLnNSfUBNardycqXpGQiWPO8p
	T7EpH8FCUnwGWHwtQxSDsGzUahG0ku4YeELbR/G4kVD4vhJTcmra0MvPixszsdLx4Q==
X-Gm-Gg: AYBFou1n8FRrR3xS1v4O2rMtfDFiRgTymGSNccXlwV8qEh5UkvnmgwQQOVTa0kGBeG2
	t8Ifvc/zhZcLPEhFqdLv1TS/sFWh1Kv1NemTYAqR0h5QFqUen8e10jXd//eRmpFwaAW+cax2+Co
	9AKORc41SbBgBYw6rb67qwd05nkSE0n2U2+U2uR+FwQG7Sbav58rF49k1M3YfHtb0zQqQAc4reo
	ftjKJ+TnSnoS3msQNEmSzma/IeEACRe4XfPs8XPM0JQjP3Z+LSQ6I/3j8YiKVzUKKmsnSHof7mq
	eVsC2qPrCBOdBueVNshsonAOK0vaLrtff110AyXHXkAKOEaca5W2iqPwUUr4TQvYtbg/FmMvJR4
	3JiPri56itiSXFL6d1Gfg1D5FlDSsOOQq8mclz1SPctbJWAuZmgVhXpWwIWwb94A6qfARLBndyI
	2MV47vNzYQBuC+8OQbrhBetzCP0gFWgp13hB4m4wI21c1tTfcRHAzwAbs7ZA8Jw+gieslZtdZcr
	6hiAzUWFIH7z/HOUwk7KiPn7DBs723/W2kvTFSkyJEwvLKMwJAzzDZ1obFM8C0Lo2GTA/p8qXhp
	zFVuBC972Xca42rvniObJyhRliq3pq6GEh77cXp7e6U=
X-Received: by 2002:a05:600c:8183:b0:4a1:d893:263e with SMTP id 5b1f17b1804b1-4a35acaa170mr93744585e9.28.1793006221778;
        Mon, 26 Oct 2026 02:17:01 -0700 (PDT)
Message-ID: <2d97c039-ac94-4504-86de-4a0b945f8b9c@suse.com>
Date: Mon, 26 Oct 2026 10:17:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
 <2fb71ea8cfe221f25b1dbbb50bdc5a74be09194c.1792480416.git.mykyta_poturai@epam.com>
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
In-Reply-To: <2fb71ea8cfe221f25b1dbbb50bdc5a74be09194c.1792480416.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793006222-BE27A757-6DE1ECD9/10/78276251493
X-purgate-type: spam
X-purgate-size: 543
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 11:39, Mykyta Poturai wrote:
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
>      }
>  }
>  
> +/*
> + * We currently don't support SMT on ARM so we don't need any special logic for
> + * CPU disabling
> + */
> +bool arch_cpu_keep_online(unsigned int cpu)
> +{
> +    return true;
> +}

According to the Kconfig dependency, isn't this unreachable code when
ARM && (HAS_ITS || TEE)? I.e. a new Misra rule 2.1 violation?

Jan

