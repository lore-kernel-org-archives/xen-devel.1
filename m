Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A3C61DD3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 05:58:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407853.1640670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2MwT-00048b-Vj; Fri, 04 Sep 2026 05:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407853.1640670; Fri, 04 Sep 2026 05:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2MwT-00048U-RA; Fri, 04 Sep 2026 05:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1407853;
 Fri, 04 Sep 2026 05:58:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2MwS-00048O-B7
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 05:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2MwR-00GkUB-2x
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 07:58:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a5df3-e002-0a2a0a5209dd-0a2a4506ca76-18
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:58:22 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a5dfe-195a-0a2a45060019-d1558031b1ba-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:58:22 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-499ae1c6471so4931735e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:58:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cfbdacc45sm16518645e9.11.2026.09.03.22.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 22:58:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1788501502; x=1789106302; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MN8uVxAs2vhm8m1hxerJDE9AVNv1ciMaFiYvOkc+Eqw=;
        b=UqC5D7bP8w+qtIElIv2oV60Ozyq6fbZxf137NdV0oWRiHIllGTxFyw2au1wB5JLJd8
         c2CK8CWnpGI91WSp4j5w/EcNTD4UWiMiGMi3GfoRfR6r3PKGbVkNbkh266Rkk0RTzxTe
         Jm999RupZw5Vax7xrkwS6H+O3w8b+Th7LMLgIf3w53VItkatWQnicHBctrHFx9WRrHhH
         B+GF/CrxUK6MAbzotSl9pRwz0u7P89nCSa4awBtBQHvi9089OVfCrLeEKmn+LDLw+z0l
         akufHafskca9IHuy10Cwbu+7NiumC/s6EOx7+nFIe77ONob4gaK68vBG9hWUAzgLfUhZ
         9WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501502; x=1789106302;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MN8uVxAs2vhm8m1hxerJDE9AVNv1ciMaFiYvOkc+Eqw=;
        b=kfmVEGP2WtRLVMNkedaKAUMpmdd+nc1cdzcBw2ux0h37DQQiK/hlHE2cLJaH1It1Oj
         RgtRcBzp7O0ODnWYhzbOfRRlFHsGsN3q+zA4J5sLq/1UMZJPuuVLW4Qtx+H/oQDq8yLD
         cLZQ/HEMbpwZq+2E53+V2/429gYUR1LLQJEae7KMZG9s54UBs1eboYmfzLn/DiqcphLT
         TLdANx9xxzHDZUiL1r2BaxB0tChv2DPyI7qqZq/ApshcnJSqQh80GNF1qYMs2bWABuEC
         17zXookNZSq8Iq1umJ9SaMNCq00398J23PBjQGibUczNjp+SmFfqbUf4P4dzbfUkEZtl
         7GsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQUhTYZbsXM//lKZlDWKAhPPaesQ1Xb8Krj+yT8PMxw7A3oe9z7TBO2caMUu9qMBeW2q/MKzvOsPo=@lists.xenproject.org
X-Gm-Message-State: AFuF++nYgpSJQzIezfIpIj3faL38Fj+vDGJR4Euk5wRq3AI+c1R7OTig
	4r2G8IHrq0GEMFejAAGsNNokRg5USGpslDaPtStUz5H5rriu+J9O0ovLDuNEMozY4Q==
X-Gm-Gg: AYBFou0DGi6t0ifaHqi6XYONyQ1+LHvBaY70EMT8Eb+gY/yNumunJHpN/O0DBveisGY
	lbhyAmj2PYDSgFSsyfd2d4oixoTkquz8B2SsM4NL5B66eZ1NxMEiXqMC/qYhpqJ/EvwAtc7PwLN
	POI0U+LsGXK7vr40HY+id6eoCGnO/mULEJUOHA059w6crJChPkqna/btqLWETS6Usm6wX6AIcTb
	jr/uQ0SgUDoM182k6OxMwyaZAQZEMil9WsYOlT7hq29ahgeGfINUkCguqWAYG02YAsDr1EB4+Yg
	qxuS16wt+q4OfmwR9k2fXxouotvXZwmns7O00EPrFyXAxljnMvWb6ywRtRqpYuMHRR7wdEUpeMM
	ZObFmaj6SHnatqs05APLh5yHWgTjxo20kyMCGrIOo9H+gjF3HUd9+aQWLm8E2tMnz7LfKcJQrQG
	FtKGAHWVbAE3cgz8dpchgDXNLWVS0SOLQYLb7VONLXOQfQgVNfA5SbnWbRafdE1yV8xuHp1m2qZ
	PiAzjkOU/qfF3p16zbBiIS+WyPx+RElj0cdj18lf0DWLFZbyYV4
X-Received: by 2002:a05:600c:4515:b0:49a:252d:52f5 with SMTP id 5b1f17b1804b1-49cf8241ab8mr45185865e9.11.1788501502396;
        Thu, 03 Sep 2026 22:58:22 -0700 (PDT)
Message-ID: <bc9c9214-26c4-4523-9dfa-49fba3592665@suse.com>
Date: Fri, 4 Sep 2026 07:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] x86/mm: introduce populate_perdomain_mapping()
To: George Dunlap <dunlapg@umich.edu>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-2-ecc269f268b7@xenproject.org>
 <5071d4da-d9b1-45cd-8e9b-778df417ee7b@suse.com>
 <CAFLBxZZDh1TqwJNxChpk6pBWppQ5yOaDPz6V7orrHRe2uS-OEA@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZDh1TqwJNxChpk6pBWppQ5yOaDPz6V7orrHRe2uS-OEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788501502-FE27077B-8524740A/0/0
X-purgate-type: clean
X-purgate-size: 344

On 03.09.2026 23:27, George Dunlap wrote:
> So I'd propose:  In both fast and slow paths, replace the free with a
> printk (keeping the ASSERT_UNREACHABLE), with a comment explaining why
> leaking is preferable to BUG.

Fine with me. With this and the l3tab[] unmapping moved earlier:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

