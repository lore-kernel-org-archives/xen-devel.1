Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C39C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 09:25:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351444.1608608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDfp-0004Zj-6O; Thu, 02 Jul 2026 09:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351444.1608608; Thu, 02 Jul 2026 09:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDfp-0004Zc-3e; Thu, 02 Jul 2026 09:25:33 +0000
Received: by outflank-mailman (input) for mailman id 1351444;
 Thu, 02 Jul 2026 09:25:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfDfo-0004ZW-0r
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:25:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDfn-00Dwwg-9x
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:25:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462e71-e002-0a2a0a5209dd-0a2a4509d3f0-30
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:25:31 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462e8a-97e6-0a2a45090019-d155dd31d107-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:25:31 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso1282634f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:25:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94cde8sm7871441f8f.22.2026.07.02.02.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:25:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782984330; x=1783589130; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DiRjE3SzKDTgBcvOhNeMqXfYe3N5EKCN8Jmz5cizP8U=;
        b=GV9xGVoinGBIHZ0Bhec0Xe8R8UGZxgViuIcjrA/rVVvdWa0DYA4SziSTztUHKiNaZI
         xJGrhgRZuQm0tymLFEkZKG/NDsuq87KxyTR+w+SZzW52GMnduoozdELVIaCa8Ozhc9Fp
         DEM11nazUrw2ljPX9uKRp8GizXJNzPLVc/l5e1d9uAWAw+AeROHw4mB5aN8rFxA0z8Mn
         4MOSIzqcG7R30G/opMMifXfxWc3jheYKT3/eV4Qk6AEQTrEm3F41fylECv5T8x3maXaH
         3GB0vozEey5CNs6tUIAUZgyIRhVQjTZ73wc9/xU0aYZnKNlOdkaK3/nQe3HTYcwVmbu4
         6xBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984330; x=1783589130;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DiRjE3SzKDTgBcvOhNeMqXfYe3N5EKCN8Jmz5cizP8U=;
        b=HN575kV94hO97QqCHRT+gGi4+yM/1+ltyyuYw3Z7EUcuOTrTxWol5rKNNLkVZdAo6n
         MQhBTVbYU4v4gnkIWAPji8M6q3Qc6bcrZK1uA0JXLQyaxnryB3rxE2Ocqb5OduIscCXC
         8ZK5/GOxz2gWVEVKha+3ZeTQJSrH2lFEuDyMFQYFcsUFo+KnuAoPE4D7JYTlxwrbRIqh
         XqnopPs+Xj9XTVXiWi5RvyPe8jX52FiiURIXqeQa2vdY/zXPPNu8A8s3xyIlCgRdgxh5
         z4JqPyQSML4fWp7etz6o9G/HasX5K843JD4EzG9xuT50A49DJjwL1+Iq9XznVih24Nil
         gsIw==
X-Gm-Message-State: AOJu0YxkSpr0cTVRYSwbV9Cnx6SlmIBnNQJy7MNTSchXkpyKAQua3hsX
	W+BcqAjmORYQNXv5gRCLGxUdGOSIagjAGUoMxkZW2R4u747CyhUTabcAkwczkU42jfKx4QldAj5
	wpSl+4w==
X-Gm-Gg: AfdE7cnuRdNMw0ZHXTrt4QO34KdJDQr6xwj4NoLsHNXdh1+Xow0xKaDCg97xB7OZPSG
	uVGSnLsrNOphXgICAYzIvmSejbpthdfC6qSjgcvbDKiwLKUIoN6kz7eR7WgG+o7yMN2VYeU8Vyq
	9wjqmNHlMyMefg3Qn/JqlZZ9S2ZXMZm6fhFH6+UBVFrp+lPRYpSSYELWd1eD81NOfpMt0FqJug9
	13jhA/Z3Vy4TcAFw/DourMWej1YrArsEP5ixHQKmams9jtEn/EPllYs1l6JafgFIzJ6Ml8xcCdR
	9YtRsws1e1T4jZCOm/eP0nOzUAJNl8t5EVY7MX828qbjo3i4ArRPEtZ9o2G9yZfuaxzzXm90p8x
	WGE1WYruj81TaxVPw85X+ENjmd5wOoqCjddqYeHldwYgw65x8JGXL3hQ/tLqyYpuF2KXiSwQQcD
	HpPIB187MoAjflPewBOMewrGk7ZvFw7NXilrn3GNZBgAaoyDqsPioOTdj1MBmlXtSwU2K2KQ2Xo
	QHD
X-Received: by 2002:adf:ecd0:0:b0:475:cff8:b465 with SMTP id ffacd0b85a97d-47758511955mr6667203f8f.18.1782984330614;
        Thu, 02 Jul 2026 02:25:30 -0700 (PDT)
Message-ID: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
Date: Thu, 2 Jul 2026 11:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86/time: CMOS RTC century byte
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
X-purgate-ID: tlsNG-bad1c0/1782984331-47530986-445D5707/0/0
X-purgate-type: clean
X-purgate-size: 389

While meanwhile we at least consume this ourselves, I'm still surprised that we
got away with also not emulating it for HVM guests.

There's now some other (more or less related) cleanup here as well.

1: x86/time: CMOS RTC may run in binary mode
2: time: shorten year determination loop
3: x86/vRTC: the use_timer field is a boolean one
4: x86/vRTC: support century field

Jan

