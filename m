Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45800CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:24:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442413.1659966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESZT-0004b3-Uc; Wed, 07 Oct 2026 14:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442413.1659966; Wed, 07 Oct 2026 14:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESZT-0004aw-Rq; Wed, 07 Oct 2026 14:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1442413;
 Wed, 07 Oct 2026 14:24:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xESZS-0004ao-3D
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESZR-008Rgk-GJ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:24:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac65608-2eae-0a2a0a5409dd-0a2a450ca07c-48
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:24:37 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac65622-f479-0a2a450c0019-d155802ac0ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:24:35 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so16326785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 07:24:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1fec3sm5803750f8f.37.2026.10.07.07.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 07:24:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1791383074; x=1791987874; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+UlPByOSDDKiYU85ckUaf2MWo/G2nQzS4XpVT5HQnU=;
        b=aDQl/ZhNjX+rfKKhh4wgZ+7wXXk4kt97ZCIxOtVfQ7uAMAR2W30nQWXmrFhiQpz4Mv
         hcRiY1+DSpCkuOSxdqX18go+mvFGX0HIN3lU1vpeaXHRXt2TPWmu2ey1ntjSvn14VVgh
         yfTIrPGwjM7lEk5AXkjNfMEauORC5Pen4713I0ZSAVN3MdRgI/J5kGAAusAO3QBlU8Se
         lyT3hIbWb412zgsSbHvCOdKnbVOqoWnWk+ItycACY2BLmzkyIJf6/dvy0Vdfi01RZI4g
         k6S/vQQnodPoU1MNOfX+6IkrTBIqDCMlTyoNf7O/7bxQ7B51fZgoLNkPgB8aW9rCQSCa
         N4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383074; x=1791987874;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+UlPByOSDDKiYU85ckUaf2MWo/G2nQzS4XpVT5HQnU=;
        b=A5LAHnmczh1z2cfDDnXz20xxrzhdqHKqRoFfF9uTywDlU5GTgJQKoEmngxrG+ZpdWt
         WZ3WvI7MhHoD2u74mIL748tkzcUrKReUYIsaxavULxgaORU6LZxZn5kWD3pGsx9CwjaP
         yJO+G2wpKSiEOBMiiQu0S+5cjIkgYX49RPojTAND22KwG+I7BoeIV2wsWTjHlFO2BHdN
         j+HX5ahqmU0Cx1JzT6xdCcxCiszp3VZwbor5ahbXII2zBlgyPrcuidjXWQGGC6+ojE1V
         3ILtwPda9n1nWOsnLskNFzjCG73yiVbBrL/w0Scm5v/0rd+e6rHLbroD3YodLsJR0fmy
         eGTQ==
X-Gm-Message-State: AFuF++kZpoEMSNUd9kd0tGFWM/xH3LXlek/SHQcyMcMuK8zk2RHDJl3K
	UfsAuK0Z1L9nAfkwDkDvbX5zV0abX5nnoqEieYSViAL5+xe9OOw4d8H8uNYXt8REjQ==
X-Gm-Gg: AYBFou18pKZNHMDNqiuTeD2zSZ0UXiKwylf/1/qp7UujSBO1rJRc50vYePi5PiRyAGN
	ytWtYLhlad2T6Ox6fgLTCNYPtPqpiBGJisgEDkvL4WhRZGePsaDVqEQ4cf+vQKjGCAnFvq6L4Sc
	1OJIpEJ/y7oByDAXDLb/VWqJSci+123WEEFjY/9vOYxu4zrBVkyu5F4noPgKUuob905ffkLpNbN
	kQn8aiLARAEh/8oS6xnWCFVEWAAb4jdsnP5Sg2TaybO3xLxYunk/p+zgO/aa+FwCR2caCB98Cn1
	4P8XKcKLPg15RQTjGf94e79zaMYEM052Pkq7jyPxVBhhw7LexNtv5BTR2KTU3J54tmtVofujYvy
	OGLRkFr1r1bJ3ws4YgbYBnDRgajH35OGcZIuKVqT6ozqokxbV6aiCLr9MuX1PsZwj+un2OwWzo3
	IXV0LTrlpx1c61NR6w8v0QkWMSpt5MDAGhfK3hJSTmFabf35CJ/bxpFJoIbDxDeDDex81Tah0J7
	wZwAsEmaO23Fw2vuLojmZ9zxpZb3TvEvHtAjUQFmREhnkEPatS80KdgRnXFpg==
X-Received: by 2002:a05:600c:4ecf:b0:4a1:7d08:780e with SMTP id 5b1f17b1804b1-4a1800ca15fmr40613235e9.1.1791383074420;
        Wed, 07 Oct 2026 07:24:34 -0700 (PDT)
Message-ID: <41713068-b683-4971-af8b-1dea1bba500c@suse.com>
Date: Wed, 7 Oct 2026 16:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] x86/mm: purge unneeded
 destroy_perdomain_mapping()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-3-gwd@xenproject.org> <asZRz9iFoTWXTVFx@Mac.lan>
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
In-Reply-To: <asZRz9iFoTWXTVFx@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1791383075-768DDA5B-7FE46A45/10/78276251493
X-purgate-type: spam
X-purgate-size: 387

On 07.10.2026 16:06, Roger Pau Monné wrote:
> Otherwise LGTM, but I don't think I can RB or Ack it being also the
> author.

You can, as per earlier discussions of the topic. George's S-o-b effectively
implies an R-b on the code he's taken unchanged. Your R-b then covers the
parts he has changed (and the overall result). That fulfills the 2-pairs-of-
eyes requirement.

Jan

