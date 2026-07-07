Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6457DC43458
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2026 14:41:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356279.1610909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6z5-0000Ba-V2; Tue, 07 Jul 2026 14:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356279.1610909; Tue, 07 Jul 2026 14:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6z5-0000BT-Ru; Tue, 07 Jul 2026 14:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1356279;
 Tue, 07 Jul 2026 14:41:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh6z5-0000BN-0M
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 14:41:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh6z4-00Cimh-DO
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:41:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1007-2eae-0a2a0a5409dd-0a2a4509e214-14
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:41:14 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1009-97e6-0a2a45090019-d155802abdf4-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:41:13 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so31732345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 07:41:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f40912sm57590185e9.4.2026.07.07.07.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 07:41:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783435273; x=1784040073; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqz/x6mkXNjI2+5LqRIe50O8E2Z/sdWtVx0UZEM1OYs=;
        b=YYWQNrprf9JkQBRlkkqTNyZwl5/+OwMDFJxv/fNvs608C9rKCVYWsEG/ul7UlfSAUL
         CioW1DjKY6//3c2+YtQp8dPVnvHGM4flEMRt3Ywozq1MTDRhDLSHG7WPTBZIVeqxXOoi
         MVrbAcPEySEGZwi4AFHqZk4gO3WA9DdFSdYL8tYuuhbghUug5M5r/ypnqxDt4elxobWX
         zLJbfm2FAw4lauP6o6QnJPRu+6jP8N0bn9Ibtg2k02i4UTkPK8WGFLNfeRQKC9IloGoN
         zoyWWI/ZcR3MuVRlotmUf+hqVMT1W8B6viA3vHUx5aCeoEkDW5FtS0WTMVieWdWNDmnO
         ycLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435273; x=1784040073;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqz/x6mkXNjI2+5LqRIe50O8E2Z/sdWtVx0UZEM1OYs=;
        b=FIAsuRL+8MFFlj4KcTrYKxqaFuAcJcqDVzcDMH59iFOVBZwXXOPEpdbHLKy4/2MQSI
         p+kuZ3ecPsXcVjgXi3d5slRsDlypzJn+lddOBm8nRNre/VUUbSN7Qm14xugFM3qyl12+
         BF2W+y3otQHQfyJWmLh6gQ7cTVc38GpGwBd463gMQyWsNMHvdOhIWHr8Nardtym52pWW
         wyhtxHAQY7/5IIsv5/Pf3A11/R9MJ9gBXeUa1JALgJKIk4vJYZ2+ACr5xOPTbZW9ZGAp
         us3ahS/riP67UVibuVvwrf2S8YLXIbClvlH523Ns2aHXBRNKq1a79e8PU/G6hQeJG6bU
         s9pg==
X-Gm-Message-State: AOJu0Yz18w0vyfe3MSGhGn+HtT3VZFvyk57cbLDj0g6R7JvyF9PVp7ez
	RiQqIVXIPAG3j1nHs+R04c60qEb1h678FqGd7d+U4INQCzqCudwhu3/ZQTh1rg+hvg//eiadb1h
	3eaVJtw==
X-Gm-Gg: AfdE7ckGNXOBBcXu8ttvMJ0boi07Qr60YVF1VLJBqLLbByTCGnevs+ZxStrmdOcYjx/
	RXDi2s7g4NyNqFbwJUUb9rO2t4eeAqKcNYzL/fz6NN9agltEswUkBLeMir1kfQYZMC29J5mQJ3i
	Ka36f5MtU4OvRIaQbtAEZOBHCQuBznsZjbBLS2sBc7aALrQmfEOXLPGx6IZgOktUmpzH63/IvP/
	k93GFV6xtzDPYmJBmurOxqYiqk9bhowLZqdulhXUm2kgxYUmgAmlMN5SHwJUhxnfTz7olmeJJdR
	iKkky5JESAagzsYf/HSJ1TET9EyY23ahX9BLGtiEkqqWUdAZnGj/IsIAX3f0I99JrkpWxgtNAyo
	hs6h8hSaVF2BuLg9ksNa3m4x78ehGl56XAzOAZ2k0a4Okg6tl4ydX4cdWp1yiVT2Ok/rgru3n3O
	gyrQirZ+d9NhAXfrDN1mlbo8wn1KeGoqRNWMy5bzhaL8esMQVeO7SA8LxbmJQ7syY1mLw9p+Se8
	Skf
X-Received: by 2002:a05:600c:8011:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-493df048928mr63550105e9.17.1783435273446;
        Tue, 07 Jul 2026 07:41:13 -0700 (PDT)
Message-ID: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
Date: Tue, 7 Jul 2026 16:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86: ELF note handling
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
X-purgate-ID: tlsNG-bad1c0/1783435274-46126986-2B57DFBA/0/0
X-purgate-type: clean
X-purgate-size: 472

This v2 submission primarily serves as a reminder that the sole original
patch (now patch 2 in this series) is still pending. As there was no
feedback in almost a year, I further did the other change that was
mentioned there (patch 3 here). In the course of doing so, I further
found it desirable to do some up front tidying - patch 1.

1: x86/mkelf32: tidy what is written out
2: ELF: correct .note.* alignment handling
3: x86/mkelf32: re-write ELF notes

Jan

