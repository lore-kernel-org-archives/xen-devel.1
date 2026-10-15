Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3475CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:08:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450077.1665588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHRZ-0007Ay-DC; Thu, 15 Oct 2026 09:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450077.1665588; Thu, 15 Oct 2026 09:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHRZ-0007Am-AL; Thu, 15 Oct 2026 09:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1450077;
 Thu, 15 Oct 2026 09:08:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHHRX-00078Y-Un
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:08:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHRX-00G9aN-3q
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:08:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad097f2-e002-0a2a0a5209dd-0a2a450adf16-36
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:08:07 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad097f6-f2d2-0a2a450a0019-d155dd35c01f-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:08:07 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so3702479f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:08:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac37acsm17406299f8f.34.2026.10.15.02.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 02:08:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792055286; x=1792660086; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rmY6RMTwWmvPvdqvm6YNXVFC8rzWA37Z4pzMneAPBDc=;
        b=UXKWFvQEaF7o2vbIR+D8UfuONAA7Grt1Vu1Rq4cTQPsmQb98W/9vvccGWRpt9K6TZy
         wW8HPheN15RP0uwmM02fuDs6mUlp+wPegzxpiuz0LoCIRcouX4u6fUvSnN8BRAnOhQsF
         qP+6FVhVJPRGrP7McBikC7m/Xvk5IKzskSmbkayrIqr+1uuOUB0n5bPgNN6QSfjYK6Wn
         PVVK+odR3otnhvThSpQ3l7Pu2XWlqewlcFamATMTXtQlScTeexdf+hScd8KyzGiNaTw9
         WVE6B6x7LMvIWQLe/SngQI1DNy/PnVanqGjOp+hn0qZuEon4MMpdGyp3rRxKgv45NJyR
         ZJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055286; x=1792660086;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmY6RMTwWmvPvdqvm6YNXVFC8rzWA37Z4pzMneAPBDc=;
        b=prGMjBH2ARoepZNtKMhW3T43rKlce3vzT1Lgqc0IfdmkTf9bBmxHp+TaGVYwRMsG4v
         Nmns5YdOFRYWT4hddA6XSNEoG2xMIOVklHNxzL4tHNbqzJ1HJt8FqviMQsbGgGGIzRcF
         LYGLzxViWP8JrmL03gACGXiRoxfiyuCpjZOq8xWxA/n3L5mP91qs4haeT63beaqkC89d
         H0/cudWOYMeczuEl5l/n2HdZdq//+sfij2Diwyhi6GlDFr3NdXOSA9SV5gtXEId9MOV2
         jDfiok+nRdzgeXCf4PwUKo7pSnM6jE3n79uYntcsb79wQHrwBFHdaAYO6oB9HVIZGo3T
         sCDg==
X-Gm-Message-State: AFq9FYLB0gKlX6QG6QA0/QYm8XTZXwl8NQ3hxQK6cveP8fk2Vho9l39N
	7pZ1Q2dWdexMhWIR83dCCzkMN5hpa36u+ADC6yYyKug4kcLm88hzWBy3fmPk7Cl9Usyxgxfx5Vp
	QwI2cmA==
X-Gm-Gg: AYBFou25IpaN0XNH8HxTKpeGPII4L9crA/m9ni9FDybM7X8f6btan+IUf5yRfAXY7IM
	n4q8tivgCfx+0kCJ69hsJh6gdwatdmx65Ik4MzBi9L2PAV2R1t4Kgc/BMK/Gowcuu88dHKLSe9D
	FOoiFvi970N5Hs8Dld0Zq7DEOTpywjHiYv4MoAHQWMZKrDXBlT2uVZ9aOy+bTMeMghG71AAqX0D
	s9JAWlPjiINhHVkW3p/WlpgdtmMQYrLum+uc1dXv+yFg9g3sgK1HUG/MsS0h2dwllRYcU6Ckdtx
	mx7VwY16Wozqilj6bLE7OgsLMeTQtIUIaBUaf/bpIe71TF9CkKg8vguzYRAQ7klGqtWmhbiT3aR
	go8ZGwJ68TyB9Q+k0Hv+E/WMECDzfm7RyEazY0Cv6yNvN4aUZalTorYCCn4fvnwaTdYRvAafpQB
	TSAl80f60P/9KU0gTyiDyKVugTGEIH1//lQ9t/cTZGSgZaDgA5qv4nGs6f1dJ8qQGrIg5zIpIjc
	DQDZQhSGDSafCbxcSIxvKU5rgNogm1rrImILSLlbinvtPau+JD7OsTVjPJhPs50
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr24245377f8f.14.1792055286096;
        Thu, 15 Oct 2026 02:08:06 -0700 (PDT)
Message-ID: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
Date: Thu, 15 Oct 2026 11:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] x86: allow Kconfig control over psABI level
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1792055287-50CCBCFC-B33B3100/10/78276251493
X-purgate-type: spam
X-purgate-size: 368

As discussed in Prague.

v4 drops the apparently controversial patch "build: permit Kconfig control
over how to deal with unsatisfiable choices" and updates things now that
gcc5 is our baseline.

1: allow Kconfig control over psABI level
2: use POPCNT for hweight<N>() when available
3: short-circuit certain cpu_has_* when x86-64-v{2,3} are in effect

Jan

