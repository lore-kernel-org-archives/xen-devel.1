Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC63606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VyH8d70q
Received: from list by lists.xenproject.org with outflank-mailman.1461052.1671989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHcQ-00086s-4O; Mon, 26 Oct 2026 10:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461052.1671989; Mon, 26 Oct 2026 10:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHcQ-00086l-1B; Mon, 26 Oct 2026 10:07:54 +0000
Received: by outflank-mailman (input) for mailman id 1461052;
 Mon, 26 Oct 2026 10:07:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLHcP-00086f-AC
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:07:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHcO-002fmy-NA
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:07:52 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf2677-bab6-0a2a0a5309dd-0a2a450ac042-2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:07:52 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf2678-f2d2-0a2a450a0019-d155da32a9fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:07:52 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so589901466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:07:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb902sm16175077f8f.24.2026.10.26.03.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 03:07:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1793009272; x=1793614072; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVoqQ6RIPgM65w22oOHXYi39Fuub3PS56mQpRz0rWxg=;
        b=VyH8d70q9o2zrfl5TxDle7oRrDxrTcxzkk8tgPoSL/fjLUCfVwcS2oA+W8JD0Rd6lG
         0s9G3koCx/stgdf7TJii96uGQwusCRQgbbv1fi+ygaAC2CePRPU4Gav4KoFBGscMayHW
         Lh1J5OBNNd7Lfx8kCOM7qfC8wdUU5EkWOZTD82eqTGOGPYe/5cYbUPmTndB5HuJr9f4u
         uA0KJ/KfK+fPFDx6MupckAXGYAL2quEcPb5LXJ1tH8ejqEEirfk8yQw24FR/tMIYh15o
         SOBt2IedbEWrBrlMWBBGKphK5QTpsikQxQnxCCJLwJZ0lBjtg2aeCLaHHTeYZ60p4DGQ
         g43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009272; x=1793614072;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVoqQ6RIPgM65w22oOHXYi39Fuub3PS56mQpRz0rWxg=;
        b=LgrUXkPaatnbsstffmBvo8xWP2eXBaTla6Bt8LnwdnMzijkqDCfj6LzOgY+8lSal6a
         G8zrZmv7oM2Lhleuz/roCoSlxjoEEqCghVZid/pkyIfALAnc5Cxy9We/yNus2qO+HryR
         2qP3STDi4yBiE5pMBLPmI5kCKiP2RNuZ5bINGfQmwzpSIN4h2j/lBjABy14lvFGg/vz8
         rPBZbptlJWbJg3ao7/VoMp+PlPpuuzirNHT3OSmI+fablGjL6R7SrCsCCVanp3ZhjgBs
         HKgd+T5vjwPZ15cJx2NGfip/8l1JfOcdMvhvmowVUnW5TVtD0JHHQQ3XMa8Dx1hoSa3+
         otnA==
X-Forwarded-Encrypted: i=1; AKwUvBz3XU0yBDnWt0pl+pjJsVDldk93u0SmKKWfj6K86ROeVScrKFQdHDidItbpJm7XZHCrGjoB+eQyyRQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJvpSUqzIhp4ivPbW6nAcYf6O3i1SlMwol2lSgGYuHCX/ZKFecH
	lxr4PcMMxtFVXgHqFs2A5L08NXwJ9mogq57oLCjMz92c55MLKKeoT40hje9zRD6aLA==
X-Gm-Gg: AYBFou0RV6Ae1bgPgWQZry5Zb5kxjSwS/Q34E1NPw/m+gju5hDg66gnSYmUk5HahvSd
	OHFOZ+E7gPoS16IhsHl3as/EEjIBLcbn/1GIq+5zCKv3uO9XofCemLjrToQnUKwud+a5glZq960
	oojQuSruYxdSHISPPWP9cvLzsAy+ZQCEmir7Aka505b0NDkxBgcZKaqmEPnf9tMqAvFQN6yFWMd
	hkPQsS2Gop4fy2qv817KAzPDljdXO7/pZvbcGChTTz/KRfvYmdE1g+spf20iAwa44PrncxF7ltc
	WGPvyMppeJXtl3RfqrzBuuVaUzmwU/YuYi1E2XWVfpQUW78IMrrn3225duejSE8KWOwbdXDxb5N
	6C8K0wY/Ou4zJ4TUichlyBjPi+wi47mB6cWwQDRY7+VxQF62v86hISXhmNNsuvDp3JPi1QZIqNn
	Wzsg5on3JxObP7nyluCL9Cqs/szN5TniUa9WwEKrN+U3Wsh63Yi4ELVMZP7t/HAh8gcJzqdNd6c
	MeI3b4yn/V+8tIUyHXwFLyzHF0wBXw3rwKIeV2uM+QCFXKTTsavBfRI3KcE/AowCpDo0UXfJgCb
	donsXUomIkQcNMUG3osEki/D8G5GcQe2qeCs8VDHuTId
X-Received: by 2002:a17:907:9711:b0:c2a:ac35:95fb with SMTP id a640c23a62f3a-c46bddb8aacmr753802766b.24.1793009272130;
        Mon, 26 Oct 2026 03:07:52 -0700 (PDT)
Message-ID: <0d3071fd-fa44-4769-90cd-8fe8779c3fde@suse.com>
Date: Mon, 26 Oct 2026 11:07:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/rangeset: Fix rangeset_remove_range() with e == ~0UL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: roger@xenproject.org, xen-devel@lists.xenproject.org
References: <863a0654-7a34-976a-4c08-159cc34c26bf@kernel.org>
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
In-Reply-To: <863a0654-7a34-976a-4c08-159cc34c26bf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793009272-4B8D5CFC-B7945C59/10/78276251493
X-purgate-type: spam
X-purgate-size: 969
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24.10.2026 02:28, Stefano Stabellini wrote:
> When the removal spans several ranges, the last one is trimmed by
> setting its start to e + 1, and destroyed if that leaves it empty.  For
> e == ~0UL, e + 1 wraps to 0, so the range is kept as [0, end] and the
> removal adds everything below it.
> 
> This is hit by pv_shim_shutdown(), whose iomem_deny_access(d, 0, ~0UL)
> on resume turns the guest's grant frame permissions into [0, highest
> grant frame].  arch_iommu_hwdom_init() can hit it too, for a PVH
> hardware domain with an E820 entry above its 48-bit iomem_caps.
> 
> Destroy the range when it ends within [s, e] instead.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Roger Pau Monné <roger@xenproject.org>

This again could have done with a Fixes: tag. Yes, digging out offending
commits is extra work, but if patch authors don't do so, someone else
will (often) need to do so in their stead.

Jan

