Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739A8C5DF82
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 08:50:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396117.1634160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyTt-00029J-KH; Thu, 20 Aug 2026 08:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396117.1634160; Thu, 20 Aug 2026 08:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyTt-00029C-HN; Thu, 20 Aug 2026 08:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1396117;
 Thu, 20 Aug 2026 08:50:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwyTs-000296-Bh
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 08:50:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwyTr-001PHQ-DD
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 10:50:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86bfd6-bab6-0a2a0a5309dd-0a2a4509966c-24
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:50:35 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86bfdb-be1a-0a2a45090019-d155dd29b989-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:50:35 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f84023916so1880121f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 01:50:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c45f1sm11548299f8f.31.2026.08.20.01.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 01:50:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787215835; x=1787820635; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oWC0qrg1/ryjfHCPvG8g/18CQ7An+WEUhSShGNRO3z8=;
        b=P/oOmHFxWygc/TQ3/OvuJ30kJKtr83pIpj8q6teir69fPyNj03zTqxPH4MlbOc6hxr
         6Kwb0jGG87fPOBwUwDtpF/R4Z9wZ1LEuUI+66DXeMfNcFJuc4vdRvYlfF0ydNnN/EiTb
         2yBw1Cjw9ywYHFiQ+iwZkwLCtdwEFKZJkS4d8PyUvcB/uMFNGGRzkKfSyR8non524mGQ
         FSpkk/dOf1rw91RnBPFapnygSguUdBde92VLOAI/YgAgXVzJh8RVsmz4N/usfnojOcV0
         m9xczbmnGshHZCnWukp6EyU8QM7CPm/K+a+6HKrSh1YwcxyDpFBx1Ltz1T+M4CYrxlT/
         b3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215835; x=1787820635;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWC0qrg1/ryjfHCPvG8g/18CQ7An+WEUhSShGNRO3z8=;
        b=VPnlXY4wCnobOGL0PJzBFaLXpKkZ8VuwQjngNZV2bX+qhIytZvUlkCpIc7Dg7UfeR4
         vBS3ufnP3oMstyggxHYVdtzeHoC1iilD3XkAwUhN1wHFhyskCop4uyjXbslKY0VMMkhm
         bCiwokps3oIdcWMT/tj435ohHYUj1/QFhYQF1HefKdTpg0ZF7KOW70N07qtpQFssrY+X
         qetp9obcGpaGKx0t6S28MDyj1UlLniqb9TesKI18L3i12fqgQ21/XgHAvADE+kAxbFzf
         lqUtJnOgdyyLR2mFYWNWnL7EyL3lRtx8AtqKlDjLHJtGZjiYrawCG5Y1mNSxi7a4Sb8F
         SmVA==
X-Gm-Message-State: AFuF++kwJJN35mhlYWiorAgg6ILuwreaYoMV2z1OoqfSnLCRfc/YdfiR
	uxdmsr+2DVG66OjNIMa8CkaORVE8+OPAY3njmCJffUYPpN/9k47UeMTkX+8VcOCtDZD7p3l6VIG
	b+M6mkQ==
X-Gm-Gg: AR+sD12Etjg+lBpoSwYAi3VQ+3zgKKmdoWYaawpeYrwsDKicR5vwgqLpW78H55mryff
	3jZQ1F9pgit+jSqXilc2ovDqLhRVHKLnV19st1bTRL82UEuTPK1azfEbe+hqA9x0ZSALQkcTaDA
	pZQQXj2R92svq1/JiUoBJkG0t80vkMIQGuHRwOvQs4i5I5QQDvl73nJQPw0nCCRfSdAu+VKLlh6
	qFYZrbEpdZ1PozbC0hXXnAI51Polq+zogHZOmZogNo505CfIviXDWuYdZfEjYxhfdMgK1tBTflt
	erNhzlCyHlIezeM4RY0xkG5gsi0UoJmosY15rxH8wxUHdvALpuywtEJWbDNKoTrV73ZbstBPNRo
	2cchK0R0gC3d6m85PVFY1L6cxuAR0o3eE2TaLj7hGTOph3lCTB0XG3e5Rwl9SJYmXLJRyF1xacs
	EkQWmKzXlkG2SMYJlFByVKvWGX3p+7Cm8r76ZplnqrU1i+iUixkNSl8Bv6FaaU65NTvX8RuR3DY
	Rp+cJ3NT93mm7fF3U6L0RtDsFC+zXj1EH+rxKqK+n8i0l+5sxgOrI4GoWGjYCk=
X-Received: by 2002:a05:6000:1846:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-482b1fe83d6mr19691556f8f.17.1787215834513;
        Thu, 20 Aug 2026 01:50:34 -0700 (PDT)
Message-ID: <0c3cb1ae-4888-4319-a348-263f7913a7f2@suse.com>
Date: Thu, 20 Aug 2026 10:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Andrew Mbugua <andrewprecious388@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86emul: XCR0 handling
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
X-purgate-ID: tlsNG-bad1c0/1787215835-BD2CC034-FBCCACCE/0/0
X-purgate-type: clean
X-purgate-size: 428

Prompted by Andrew's report [1] I thought it may help if we accelerated two
of the patches I have pending as part of the (so far unposted) APX series.
We previously discussed latching some control register state once early, so
let's start with doing so for XCR0.

[1] https://lists.xen.org/archives/html/xen-devel/2026-08/msg01006.html

1: latch XCR0 early during decode
2: use latched XCR0 in x86emul_get_fpu()

Jan

