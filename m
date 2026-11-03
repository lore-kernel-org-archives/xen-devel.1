Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C0606D810
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=a0lqzEAb
Received: from list by lists.xenproject.org with outflank-mailman.1470286.1679022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHvS-0000PG-VB; Tue, 03 Nov 2026 17:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470286.1679022; Tue, 03 Nov 2026 17:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHvS-0000P9-Rq; Tue, 03 Nov 2026 17:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1470286;
 Tue, 03 Nov 2026 17:03:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOHvS-0000P2-H5
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHvR-007Zis-Mc
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:03:57 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea13f3-2eae-0a2a0a5409dd-0a2a450beb68-40
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:03:57 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea13fd-b7e8-0a2a450b0019-d1558032d02f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:03:57 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so37877965e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 09:03:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2ab010a66sm101569375e9.13.2026.11.03.09.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 09:03:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793725437; x=1794330237; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxJxooDbarITeaL6sRcdX18vTLW/TOY6yuwurs8VvUM=;
        b=a0lqzEAbXs9ib0n+iudxb5iC4wmMppR9Ll/TJvz+MmyU7Z0b3cAxL/vbVoY66+6nrn
         /mDw3eBdBsvuii1ifgoflps2yuIBJxd79p+b6cUmCjnmonE+GHnpKcexS2bVJElHenbi
         /CFGTVJmWJwzkPP9eGTCWoRMWExPWROegHWsr4f1k29gCHaeafbyaUmGWH9AxgFMQoJ2
         V1QfSS80dkY07L5/LCYiYUmjnNdK5CaTlcXlmZfVUi4ID4EUoRFk7nMCSlAy03u7V84+
         T5sQ+KO4bHZ/2xVOiaktqcNcH281NVgzIQkcQvli13ZFluI1cVk3n0gjmQFbgctwipjr
         mxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725437; x=1794330237;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxJxooDbarITeaL6sRcdX18vTLW/TOY6yuwurs8VvUM=;
        b=c9k14tPnZRLg95JygzLlGdW1vK14NnhZ1TnEMU9Ejc7vO0IPKmIqDmJCJj1uifQrvH
         pDenREeY1mRyIAJxTi5KlpZ5tAZusJkdmBrYqYnTynGAFdznhOtGFPcfrtmLpJFuIxRM
         8tKwhD0aOOCgIhwa08S3H+UJW00SBk4PttJJFg96cZqLR+6jb2IvreaN1ZKj4h6H9F3d
         Rk1XVuEjWFPtqZyUyt6uwXH3mCFytfFEXbTal0fOzw4E3+M1Kax8ccX/UFIRm+A8Tefe
         f6z6ZZ9yhBaR4JsSYpBr5knX9MbUsAzeJE3yOpeMRR8bTgD7YBnGjnQyZfCyGMUVYHEL
         QHUg==
X-Forwarded-Encrypted: i=1; AKwUvByzv4HY66IM9qNhU18oMXWajUDBD3EFUmbFyreG+O44lXGePh+gvoqG9d7oNs4CeINod+384v5GVe8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+oDIZ75ntPegiIKLbBz4aReQFgvMIJfUV5ayiulH9fiOhPX+OM
	GSo2Ygt/X2AHLFaacjtf9rfFXDKiAFR/LG8G+an/9oOuv8kMx/r/HPWno68SD4LJxQ==
X-Gm-Gg: AYBFou3klpPxQblDxQ7GF2H5ByD6fpJFfEjNB1eiEjV/OI0ze5aRj64uyxrLrnIWNJN
	bTYjHnp1MwiV4Klg7WYWeoWVjOJBK6T0Bh3ct8oUpXwZm2L4pkOb0/JlMQUBdBpTObkBwbjtupL
	ENiISYvW+blmVkKJy+VnlxVQRqyB0Uq2wBwnwa/o9spaWhR8gJy9as9QMhrMyvXUJVlogYBFl3z
	8v/KrBDp5zEh7vnTjoSFNS28680rwl1beAxi5mi4j1Jgjvdb+U5MZHsyliS+x5CY+7ISX42w2QH
	6ExNUHT7Y+OpVjb8EykXzSdc6hh1fMHd7E7d0zncVQqsQwm8j/kZiyq3Ldy7UXtoiSOLiooOSIG
	lYiqPS8W0kPUZ11rOYh0SEDJeQQj+LwVDJLMqDHKMOv0sbs4p/Fo7DIS0GGT+c4jVWj3Sr196Nx
	KziEM29BNoMSV3WCHxl1/mMmWAs/otCu2IHCT7tN7pITfAWIsiaoJ75YvoR8U0jjn5fiJyCK59C
	cNwkMNTHPLrz3JP+x/a2LL8eMhrXR5gdriV9ZXfOwsDy/x4bM77qtRgTzqLHSt+WqQI4EGffEgV
	t2OAb2r+zfE13mdHr0lxgHVlIbs576LnpftstIoYFR82nY/B0ZPfzNg+WayJxPYLkNmuqKzoWFv
	DuSq9Mp/AE3rQrbD5
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr135860605e9.29.1793725436766;
        Tue, 03 Nov 2026 09:03:56 -0800 (PST)
Message-ID: <990e8f72-eb5c-4136-8ee4-ef8a00838024@suse.com>
Date: Tue, 3 Nov 2026 18:03:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] treewide: Make {invalidate/clean}_dcahce_va_range()
 void
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
 <20261103152928.2142176-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261103152928.2142176-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793725437-A98C19EA-F0C825FA/10/78276251493
X-purgate-type: spam
X-purgate-size: 458
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 16:29, Andrew Cooper wrote:
> Precisely two functions - RISC-V's flush_page_to_ram() and ARM's
> _cache_flush() - check the return value of these functions, yet all
> implementations return success, and ARM documents this as a requirement.
> 
> Make them void and simply the callers which care.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


