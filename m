Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369B8106B52B
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2026 12:52:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1262222.1554807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Nif-00021a-4E; Wed, 25 Mar 2026 12:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262222.1554807; Wed, 25 Mar 2026 12:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Nif-00021T-1Z; Wed, 25 Mar 2026 12:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1262222;
 Wed, 25 Mar 2026 12:52:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5Nid-00021N-Hf
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:52:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Nib-00CeoI-6K
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:52:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3da7a-e002-0a2a0a5209dd-0a2a450880d2-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:52:18 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3da82-1950-0a2a45080019-d155802dec51-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:52:18 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-486507134e4so29499265e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 05:52:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487165ba70dsm21817955e9.3.2026.03.25.05.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 05:52:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1774443138; x=1775047938; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xVrLyiOzdoV4vF9CYA7wz8r+UywYJtBVKxDjTLF4KcE=;
        b=ZxXmA/cS2zwxZOe62ZDb53E6wKOB8cSK4U977IHfrXxcZJXZsaQ9UK/Ffy0GJOlfMk
         A5k0K3Q+jdTqeYNlwsKzVI85rWuOcQoK8GF3kQ/68v38xyUPvI76MRcdfNplV7MQ/+VN
         Pi02FtOWS8zSyGzRLdFB03wLSSIPPSsUKawreJDJLOma74XD/XwBjXCa/NKV9J/8mlOL
         SRRi+j5xMOD3I/26nzgnLz/YDVxRgOc1IE/36pEHtKdNx9ozLoypM0w5fkMYgtfEnUkB
         ak7tkeF4DZTL2JwKYgHD8gifQvW5LMx3QN2KGj66kx1lXnkvmKcA/lka6zix7EK0Lm7k
         +Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443138; x=1775047938;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVrLyiOzdoV4vF9CYA7wz8r+UywYJtBVKxDjTLF4KcE=;
        b=j9CE8CPMNK8UPTes/kh/zJLT8869LnB8QjrE/0KTzpL918RsttWW2mi58YzirCT7SC
         rVADQ117Iqbgak3v5G1FOMVOMiURokhHk3cIYybbb/h9CPZYaIB8jBwFwXkAo8zkiky/
         MvKYyr3aHwf+aw9lRQtgF6nQ2UczBrX7qbEIpsk9PytiSGBfkmpAiw5QHZI9tYSbMdsA
         5OZ+HPR7kDFOf8gp6cVbJAf1pd+n9EL/JvabY5zFfxZ5G++oi3o31wPpBSANwInV9bzA
         t0mMYkEh9Cjx1ZB2m+Q49ezoGmbuW68f7uQWV2EDDrOmfDxwEegRGfaSA5K4YA2wvV86
         R3SQ==
X-Gm-Message-State: AOJu0Yw8xd1WtfkBBbWAQQIKYWAcKVUZBF+8YSgK4UJL5LSw7DJGsG9N
	cXqAk2t0/xX8Ys2sRsJCGp8sP+NbltpvfwbzB2GjP6mhG7MKsvI4Dvu5SdJv1lXcEctoNQdXJ18
	GxEjF6A==
X-Gm-Gg: ATEYQzyjz4GV0v0PcNnWyQSVBmYmKAjYaFK3XfFvQZNJqQ/+GiOTBSU7Fe8Q3rxoWwu
	jKhuSTIeETMiYt72SkBPiD8Pquvoqlm7awwmEa/vyoz6PpOuqk7ty6MOprtvrlwXJRo0A2x5Xqn
	aRHYMbRiciUO12/NcPFlpgNEfuJzBTENcu6/+mr5U5jDKaaUbryB5qCKwpYhE7RahLFCKvoywEG
	maTQ7xjV6hadNg40C4wURhgPhuoTs1WOty4gAGSjXOeGtV2b5nW9LFMsv8ytgHCRejgN38HpeQg
	XOgadyVwD2O5lZPckeoaZkCLoKYAtOrHQ0aiAE/ktyu2sooJrorBVbjYj+Tu8BIVmC8RXiAul6n
	mV8/NPciPcnCumx0cB0pOD1zhZ5LcNWb9xpER2xiojjlnwdIhTpgHOJKeNFxvSxHyPpqg8SWpN6
	iv1djU81GALrKjwMn4op4GlfS3B5hq2ZSvJXdK8D780eeccRJdYNlXJ++fnGMk8P/CJ2bc4a19N
	HPwD0sGYsWoOyJk/xvl8b6omA==
X-Received: by 2002:a05:600c:3b12:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-48715fc370fmr55488815e9.2.1774443137909;
        Wed, 25 Mar 2026 05:52:17 -0700 (PDT)
Message-ID: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
Date: Wed, 25 Mar 2026 13:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] arinc653: misc small adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
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
X-purgate-ID: tlsNG-c1860d/1774443138-F141E726-F859D3C4/0/0
X-purgate-type: clean
X-purgate-size: 125

1: overwrite entire .dom_handle[] for Dom0 slots
2: don't assume Dom0 is the control domain
3: avoid array overrun

Jan

