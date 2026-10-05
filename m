Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D03CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 15:05:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440946.1658479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDkFe-0007mY-D0; Mon, 05 Oct 2026 15:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440946.1658479; Mon, 05 Oct 2026 15:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDkFe-0007mR-AK; Mon, 05 Oct 2026 15:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1440946;
 Mon, 05 Oct 2026 15:05:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDkFd-0007mL-PJ
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:05:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDkFd-0020tX-61
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 17:05:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3bc9f-e002-0a2a0a5209dd-0a2a4504d6ce-12
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 17:05:08 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3bca4-b57f-0a2a45040019-d155dd32dda3-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 17:05:08 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so1663063f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 08:05:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62270751sm4130112f8f.13.2026.10.05.08.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 08:05:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1791212708; x=1791817508; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1WwakrSeNK7CtSZLjDPd9Zm+HQjR666BEiZawESMAY=;
        b=BiuOOUBTMpTnJM05UKf09UJSt11XM4BHWJoIvqkgAP15sHrCdiSTlWsWlH1BRwNb8o
         p7BXB5R8G1a76FztmtR/tSddF/2TakXfpbLktvhD+J35u8OS6BoMzEIpwoEVVDqJwc1D
         AsMYRD4Ofw0sY/oWYEHjymzeLX0alrdDXUK9pwX8tHdNV/NOjPg8hNJ7lB6lQgOAxzRu
         vnv7jJy7zA3BuD/VyUvvNns96qxIHgc2FsKZOwDTYkwIr8SYfUEie3RrwSnEWAHwNqjf
         c2BfE4/kUcxMz8KyTHWtLJz0pkOpHaKvxbpg1bbaA8uHZ8/zORJlbSCUiXLPm+ufpaVy
         G1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212708; x=1791817508;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1WwakrSeNK7CtSZLjDPd9Zm+HQjR666BEiZawESMAY=;
        b=vN/4ATY2tUZdh0A9xXgcRfZLyg89lEMdVGHdiXz4UkyVvYeRAW0Q3OGuD3TIvk9Him
         V1+Z9ZNM9BqNIyiHpMtr+XKBsJrumWR4nKFkr+X/8e1n8GQSi6AHHL6OqU8ac4ueZzlS
         CWgvSg8LoQijGaOJxFnPlnAiQXq3ERUGqnDuL5bNGwMjvDmZWiioW0XFkflR8BANtebJ
         ikC4r9RYC3JOV8E1N6WJDMzvyQXWtjk+WPvpHbPeXnbcVnMyTSIBIXFMGkGPgpNSg3dI
         af3I8oimJiL/SIlDUi2tpI/zQj6bJ/9b338aUovNkRTMCK8GMt1wrO5qvxj8YRysJRBU
         7htw==
X-Forwarded-Encrypted: i=1; AKwUvBwctFIXxlgHnJsr6k9Rpf/s57Q9R8KAQq4N/qbONYNncT0TMjH3DaedOvuWLV6Z6WwkaWuMEWsPmJI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLtCmvnmqo6HOcnGsPYpYAtWNr9f4hXXOZlTEQ6GVAxeSGAVCW9
	qyULE3E4M5RVuJdL1U6FndCdmBjbdnBCrJ81WmfaYaqtUqM1XRDAPCrxVu91adYgkQ==
X-Gm-Gg: AYBFou2QcfuaFs0QF/6eqn/KAvqTckL2TBP1VzuKxcYMtsO6FYew/vlXw2cxEz7fRgp
	IDVkT4qnh9RULbhn5zmcaVTVeggInrzekjxUzgP92nUkhWIgzet9dZ/4qvrbH+XzWK0CnRKX7TO
	yiciKsH5WgeFT2AY7sBHw5CE4zpr/aKILpH4xDVyB9enox7UfLd5hQh3nh01HxDV53+sLFMn+rI
	SEwBZgt6FU32ZuevlHkQVbDbniNNVX508RT0jEXLor3CQoRSsKIzjjm/LW0VtWCEiJS3Buq78pB
	aSelSY5aMHGdwFnloC2Cp+Mqo77dNdfTnVBY+xeqvvRW9o3VPtzy/DVTlyCS11A1bTjdnp5dQpP
	P0YHWmj2uYqMvE/clx9E8plaCEl8S7k3w/crH+xetLU4F4sfQgWhZat/Zz1Y8KPgGpcqnqEIl/S
	+JTmc3o/uzN/2HUvpZcOMfDPYlw6uYOtut6TM7Nvt6FgBE2xA3wRFMZ/LQAjtuKqwFdpkdKIfK6
	6KW3wp4Aa0WemTBt3TQiM+8lKNKV5/RiAF0v+3wRsXcqzqfxJQlgyN0SrwPCYIe5AkxRSmm
X-Received: by 2002:a05:6000:490b:b0:488:7da0:fedb with SMTP id ffacd0b85a97d-48c4801353cmr12447128f8f.40.1791212707610;
        Mon, 05 Oct 2026 08:05:07 -0700 (PDT)
Message-ID: <cb0e9719-2153-44b9-a3c0-62a924863163@suse.com>
Date: Mon, 5 Oct 2026 17:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261005144317.2887-1-roger@xenproject.org>
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
In-Reply-To: <20261005144317.2887-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791212708-538C1B50-43E1AA55/10/78276251493
X-purgate-type: spam
X-purgate-size: 501

On 05.10.2026 16:43, Roger Pau Monne wrote:
> XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
> its setting in XENVER_get_features to the is_pv_domain() guarded section,
> with the rest of the PV specific features.  Add an additional build time
> guard to short-circuit the setting of XENFEAT_pae_pgdir_above_4gb if the
> hypervisor has no PV 32bit support.
> 
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


