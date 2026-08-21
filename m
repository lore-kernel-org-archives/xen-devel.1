Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E54C5DF7D
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 08:45:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397212.1634583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxKsW-0005Qr-Gh; Fri, 21 Aug 2026 08:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397212.1634583; Fri, 21 Aug 2026 08:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxKsW-0005Qk-E1; Fri, 21 Aug 2026 08:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1397212;
 Fri, 21 Aug 2026 08:45:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wxKsV-0005Qe-2t
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 08:45:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxKsU-002iPY-5T
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 10:45:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a881026-bab6-0a2a0a5309dd-0a2a4508a2c2-8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 10:45:30 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a881029-f659-0a2a45080019-d155da36e17b-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 10:45:30 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c1c50c1e29bso118717966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 01:45:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c246366aa88sm292453366b.38.2026.08.21.01.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 01:45:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1787301929; x=1787906729; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBbFK2jV5MuGwqpe35Vzt6pdsmgB9MKRf+D1wVaaeBY=;
        b=YfQppZeYPZxAPIXcgaTd1yItScaDsbWF2IwQOBoH3HfQflhnjo8a2X0ly3G2SJW89C
         lVXTWJ3NfpQ/MqvhJIbEn5nn2fkZBYZzqW7Zs0dV7dtMpCP/WRPoJmQqKCkHfnrftdU7
         ljHhPyQAd9cYrNaF2vQ1x9u2etKlglQnb2ovhJIhuebFREHWcWvjSuvxxTeShN8nusrS
         TNUHIyHBOw+J/3n3mtYlSwOZK9HqmzwJpGDJjUkqRerPF5yJrn5ycYUWW0vtXKAypsEc
         bWxgWJQ7j+85ATfv9AmpQUkX5rEFMmoSxrHcYSYP1SvxjOWKMk0Mz8ax7BI1EQ6z5GUa
         4c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301929; x=1787906729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBbFK2jV5MuGwqpe35Vzt6pdsmgB9MKRf+D1wVaaeBY=;
        b=VwWF1QFDvWeGUmdQNto2beSBxJteaGBo3Vfndt2Nryejkq+Snblm3WiClgEA5Hu2LV
         LTt67ncmi61pXHfDGKAvqlzrpbbS5hUPRFpnMxmeUMTuv9XjjIBsvCyMugdr6B4FIAGH
         AAUFepnzDld4Q5pkJFn2hSmh/E2zW1CUPH3T41bGFrsdp+Zw6KIobIklZ0Zd0/4uC7rB
         pjYjwPXDQed2IS9VKSYGumM9fZMW7xkGaSMl5IHZHucarELn0oUVDSsClZfsQBfIVcs4
         6hz6vsdCj9N7lzlKvCJs+DZuCgQJcrR1PysvG5DPyIi1gWG7JiPrB7jet6uo8+cisInu
         hr/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrgsrxmeiJ2v5w6o1Z8CK5YSCTn3pI/CK/TFZMHnGQj1k2b/p09e07DeMgdYZqWmHYNi6aW/urxdpU=@lists.xenproject.org
X-Gm-Message-State: AFuF++kV+FdP5PD0JqvKudy879ma/BqT/9atwY0TGoNTSkKmE+Out5XA
	pMRVBupdIDxJU3jv9lUQl5kmJR8KpEo8ej3WCEN1VJgviJhOpLule2YB9nuJ4B08dg==
X-Gm-Gg: AR+sD13gkJnCWH8A3Ee4MdMHCwngfxd7guJ81eCQfbwDu8HcSwPNbGbYjPFEPTtaHKw
	Nl7Sth8eARZwYljP9XDCww5mFNJIU6FEI8dtL0yJEv93+H5THs4Z8f2qYfNGUZak6TbXoNZoHb3
	eb24JTE5YaPI21YacPxDlr82nKkGLbjNHOaLvGvYVBXfLOYZVNIOxtPkq6mBbK3Vj7oei3aNQuT
	BR0X7hAskA8l84UUEQ0JjC8aohVTXaDgi5lS6KrBGMdN1YUI+ci2JQ6gXuVYb/v5Z/G4wFnNbAB
	5vmvGV973PXIE6QBTvan4WIrBHKe7Ifyoij7l+0sztABBiUkcw4pDYO+ciwRIZRsCd5jlS6sLQY
	Lj5H4aNR1JO3AGVHCgIUWa4y/q/uF9O7dcWeoL2iPGaOpCSBXbi9WaO4H+FE7DI+dkWX/v24wxH
	vXMEGXHNwuRZZngD32JT9MNrlKPedsKuHoWB3nmNXoO6HUq4FscA+XNRla6tyKBxaLSmfleqXGj
	y9SR8fLmENOm8j79NCTLwQw0k4/PeHMZU2n8W/EuqRR3FgmzrFk0nDYKI6mshw=
X-Received: by 2002:a17:907:3c83:b0:c21:7584:fc58 with SMTP id a640c23a62f3a-c246a60cd41mr503998966b.12.1787301929532;
        Fri, 21 Aug 2026 01:45:29 -0700 (PDT)
Message-ID: <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
Date: Fri, 21 Aug 2026 10:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
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
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787301930-DFAD487B-D099EA2C/0/0
X-purgate-type: clean
X-purgate-size: 856

On 20.08.2026 19:43, George Dunlap wrote:
> One point reviewers may want to look at specifically: patch 1 changes
> where the per-domain page-tables are allocated from, and its commit
> message discusses the (minor) NUMA-placement consequence.

While I don't recall which recent patch (series) it was, I can't very well
say "no new xenheap allocations please" there without also saying so here.
I've read over patch 1's description, and while it tries to justify this
accordingly, I still remain concerned. I think we simply have to accept
the mapping overhead, to avoid allocating from a pool which - over time -
is representing a decreasing portion of total memory systems have (on
average, and not even considering systems with extremely sparse memory
layouts, and with perhaps PDX compression not doing good enough to
compensate).

Jan

