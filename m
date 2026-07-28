Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF8FC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:19:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374346.1621494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woieW-0007Pb-1f; Tue, 28 Jul 2026 14:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374346.1621494; Tue, 28 Jul 2026 14:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woieV-0007PU-VC; Tue, 28 Jul 2026 14:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1374346;
 Tue, 28 Jul 2026 14:19:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woieU-0007PO-Vp
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:19:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woieT-00Bd1g-Tr
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:19:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ba67-2eae-0a2a0a5409dd-0a2a450ae1d0-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:19:25 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ba6d-f2d2-0a2a450a0019-d155802dccc2-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:19:25 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so37480485e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:19:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b842691sm315529465e9.1.2026.07.28.07.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:19:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248365; x=1785853165; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fha2EpEI7oaqSPAAqQzfTEeY8QllM999aorM3rzoaPQ=;
        b=LKi0/35ShXu3eN69wsfdod3YkMe/OswZzUDvRmjSluNxQjBOLEPdQNmjeHCRRiaSWl
         ootkunanLrJz0E7ZTueYkn+igDxiBIlxtC0lO5T7v/ICol0zcEC3ChpyOQXQgFLdHyNW
         TNUXDGEKaj2iw85eyuJNqTd3EGTwDwydVmcy5ZTKH/wmNeOlE0xdratchss9mVTKBW9Z
         mVGs73ZdWxwKMaKCzoTa32jp9ZMNvqXkbiQX0xgeLn+u6XPLCKmZsHs3IBgRgdf7qYsy
         GQnSxNrH+DA6PEk6y8wOoy89WZfGY4tDhYGXAcLPOz7LEgpFQn+zNR3oyVoLCt2MaSQJ
         U9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248365; x=1785853165;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fha2EpEI7oaqSPAAqQzfTEeY8QllM999aorM3rzoaPQ=;
        b=i57QHfsYeLNsZY4xF5MX0MGSaJ9pyMKYSbIpeTVsY0wXXI4sluR8igRyzGxnvAcScU
         SsrTM+NROVkYca0jyUI1RgUFs+OiZJyIrkzJngtDAjG44MOlbXXL5sg/p5xdnms3drRW
         Q6KejMpW32bEfLty6/otf5+yLdbFVH3oK6ERRasrRQvKFU+M2ev+GM+qq3xoLLg66peV
         KG52pJ1DThz3wB2C7xSRIcVShdNgVDWXvmktP1sUvGdB4AxANObXh0AXKM7g8O5YtctU
         49BegTllk9avfW9zIMC9Acw2T0quFPoe7RcgCkIIJHLFCOFsXKWysl5//ESgjRf4G+IJ
         dN6Q==
X-Gm-Message-State: AOJu0Yx7PrZzZq8QicrpzfyWJQ6i+VijEBQKS3aduUVyNPPSCMUuuHn3
	ayqJ3KjJjHRHLpyGkxAwG+2oM4Gq7tWqxdW+KkazJkFchyg7cSMqAhpJKVCjo+SQKgTZUodfra8
	QXn2KeA==
X-Gm-Gg: AR+sD137xvAl7PWgBihK+QdO5Cosl7YBqFI9VYxPzqYPM8RmGMErBqxEI/vzx9J1A3j
	HkVWgyRLHsZZmABSQIPTnd3G83hRmEDe9n5O7B/0LZTgoRQQTXfcy9dUd3IvwBgcythOp8dO4LZ
	WJI+ePrqfyTXZxqzB2NlzNlKUMtBq6qdtfU8Fb+urJV2tCBolshBvQQqXqD09Yul03u03UX/BSE
	E4gsoos3TZYCmbRVfG+B5jrWljlzi05xJLJ9xKCU639ThhWSWTTBrhACClDQyXNZ5C6t3qGKNdp
	M3Ef9OOT37YpGqNB2qKjgRkkLGnPvYGr6FjFGFB+71tyKm3D+B1HccoLAomygpPMLYl170u3yjs
	fLdtEb4810AfiayqQ5wkyBF21uT4jxbLtQ7hV4Cw8DMX6BpsoxCZY81CZchCWfbQpuE1y8UEKrN
	Uy+jc+Ds4razT0YZrMtF1PPVNKRGuyKyeqc5AsaMx7Sh6BFEO6Ywg6KbVIp3P0w1AMuw==
X-Received: by 2002:a05:600c:524e:b0:495:63f5:7a4f with SMTP id 5b1f17b1804b1-496c6591b63mr27223185e9.33.1785248364940;
        Tue, 28 Jul 2026 07:19:24 -0700 (PDT)
Message-ID: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
Date: Tue, 28 Jul 2026 16:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v15 00/10] x86/shadow: original work for what became XSA-495
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
X-purgate-ID: tlsNG-4011c0/1785248365-4ABD8CFC-90A3260C/0/0
X-purgate-type: clean
X-purgate-size: 1167

Work was partially done in an attempt to correct behavior rather than
deprecating shadow mode, but the part yet to be done were evaluated as
too intrusive / involved for a component that was consider to deprecate
already before. Nevertheless I'm submitting this, to consider whether
to still commit some of it. Some parts are ack-ed, so the ones at the
beginning of the series could in principle go in right away. Yet I
think I'll leave some time to determine whether to put in any of this
in the first place.

01: shadow: add preemption support to shadow_blow_tables()
02: shadow: blow away tables first when tearing down
03: shadow: 1-bit-disable doesn't need to detach old tables
04: shadow: reduce amount of work to do by shadow_unhook_mappings()
05: shadow: make clean-dirty-bitmap post-processing preemptable
06: mm: make more of log-dirty mode enable/disable preemptable
07: shadow: fold _shadow_prealloc() with shadow_blow_tables()
08: shadow: make log-dirty mode enable/disable properly preemptable
09: shadow: make forced (L1TF) mode enable properly preemptable
10: shadow: limit the number of pages which may be in use as shadows

Jan

