Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7CECD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 08:27:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341912.1602206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUYp-0007NC-9g; Fri, 19 Jun 2026 08:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341912.1602206; Fri, 19 Jun 2026 08:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUYp-0007N5-6g; Fri, 19 Jun 2026 08:26:47 +0000
Received: by outflank-mailman (input) for mailman id 1341912;
 Fri, 19 Jun 2026 08:26:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waUYo-0007Mx-6Q
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:26:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waUYn-00EsBb-3x
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:26:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a34fd43-e002-0a2a0a5209dd-0a2a4502a33a-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:26:45 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a34fd44-fdf1-0a2a45020019-d155dd35addd-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:26:44 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-462bb734793so1334382f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 01:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46508a053cesm5893094f8f.4.2026.06.19.01.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 01:26:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781857604; x=1782462404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=er04P76T9URwsmi5xWgF3wVt5oxaOpsSBwCHopNK+QQ=;
        b=dwSsdseLRjjvZYfL/IKWovNN8++n8Vor6RnGn9mpKRHHr5a5bzhSHgeaG5swhctRWt
         9GvhEBl8IQfAEc5LXEM1GUyuUGcnbbtcIlXC9ZFvxdZKudyMbjUvMZ08E7B+upu7xhEs
         c36/hh2/FsNwllHO8ygYmLtsu1KZP56IRlQZ0GCxftxVttaIbgrIdgMJmQ2XMsZeLlC3
         V35LtHMa7PgXkTTzrIEGjyg8RE63pP2KMQGjAu3amZY8PCPEldLikifyG3Brb/4N4U54
         OC5we8bvXcgOEoq2A2p4p7+EfhQtXyC1ALMgbtATSZqW0EAZWSDCe4+1LfRx7zMv09n5
         7i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857604; x=1782462404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er04P76T9URwsmi5xWgF3wVt5oxaOpsSBwCHopNK+QQ=;
        b=i/t1UXMs1ki/d6g6Zy3I6B3Zvw4VGP0r8Ws0IgvltuSjjrIscZuKQk3/k1xTAbk99p
         VqM5RaeLmCIpOUGoPrUgVaoaGXeprbUXRXbUn6mEzTBBD6knS5mP6cee/5KL3CJ0QGGH
         C3bfTOVFgcBYcfMfG62MMf/mWCGUb0JoOtsaPS+9MTNONcgngRSowqgVWpCKbK94SdYT
         d6tPs98UwH9fmLXHb7vMLufJ0CtG4m0MgksrBMZn8DzLVysU+pHDN0N0UdO1yNHUzkzn
         40q2EI3tZetLjhKAM9nvSZlsDKjHcnLVCyIRsAMEDNLT29UKn/evr4zfwfxvM7fplSRc
         O6eg==
X-Forwarded-Encrypted: i=1; AFNElJ+5KOR6Va+Yxg8Ji1ewFfUpi4+jNPbGHaltawwLztl2yrIYhgDME5V7R+O0+4E5QDYCb59UYNeSgAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1NIsaTuOp5h1hwAtNQ67dS+A+htNmBGMocNZleGEukqY8+uGQ
	l8++5aDx7iJ+1n64XrvYTjHCB1KkxptixoRhwfga/y43RXw+A0YNISktnVlCvvIFcA==
X-Gm-Gg: AfdE7cnU2++f2QofJTQ4AylDHChw5MA/ruhswfB9uirktr4eJ1cvTpG8O+BiaHC55M2
	NMSWy/ljyaBGtetGak1ehSw7vwR3+pZfghGI79BON34fOpbMFBqKPWppWf5R2BwbraOX1UoeEOV
	iv6kbAdlzQIlaamyAo24tBSw6tIAO+4JXpY0W6JIsit45q5TH80phqxygUyEkknx5vgtITDYauV
	Y+ZQRwBVlS2hK+nTjjnlB5hqaib4JRRXHkL1bv4ypEY5QYG0eUiSQb1Y3skA8ogKY4vWhXbVzuK
	GJRI+Wd042ORjsADq8h1q7V3G7KUc+tAIbDg187ui1JmKqJQu1R4IGpPaNQBgA7E8+fQjFSxDST
	WF56QtuMuTjbFV820ZNR5cgE4cwbmkEYUfI4Wd0R1+J73wmAe7syMj/MC7F66kIm44AIaXvUCPR
	4JK/Zle1piogTpBZdFjIaPMwOpXHtkUNGPxM61WzXDj+FfCPhINek6OGv+gz0vxwOeneOjxpbuH
	IP8
X-Received: by 2002:a05:6000:609:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-465ba53b0f1mr1319185f8f.23.1781857603882;
        Fri, 19 Jun 2026 01:26:43 -0700 (PDT)
Message-ID: <e5cd5952-d01d-4233-b771-cfbdd40615ac@suse.com>
Date: Fri, 19 Jun 2026 10:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA
 config option
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-5-taka@valinux.co.jp>
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
In-Reply-To: <20260619075011.377116-5-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781857604-4DC663F3-0C04B8A5/0/0
X-purgate-type: clean
X-purgate-size: 542

On 19.06.2026 09:49, Hirokazu Takahashi wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -188,6 +188,14 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config NUMA_DISTANCE_MAP
> +	bool
> +
> +config DEVICE_TREE_NUMA
> +	bool
> +	select NUMA
> +	select NUMA_DISTANCE_MAP
> +
>  config NUMA
>  	bool
>  

You want to insert below NUMA, not above. It may also make sense to move
"select NUMA" to NUMA_DISTANCE_MAP. I don't think the latter should be
selected when NUMA isn't also wanted.

Jan

