Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A3606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WgdYSm73
Received: from list by lists.xenproject.org with outflank-mailman.1497868.1695912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKRz-0004HI-Fo; Fri, 20 Nov 2026 08:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497868.1695912; Fri, 20 Nov 2026 08:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKRz-0004HB-D6; Fri, 20 Nov 2026 08:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1497868;
 Fri, 20 Nov 2026 08:58:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUKRy-0004Gm-4r
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 08:58:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKRx-00C4zi-HM
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:58:29 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b000baf-8faa-0a2a0a5109dd-0a2a4508ca7a-22
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:58:29 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b000bb5-f659-0a2a45080019-d1558031e45c-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:58:29 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso4601935e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 00:58:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb85399d52sm95148635e9.6.2026.11.20.00.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 00:58:28 -0800 (PST)
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
        d=suse.com; s=google; t=1795165109; x=1795769909; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9wVUTdW+MNLVrBmQrlwXPg7AvYDJhsn5P3ISNgJyFs=;
        b=WgdYSm73nlkK8dVrn3Auj+CAYrsUYACfji5HAPN4s9ZaXzaF5RPQAIV1C8PcnIrdhX
         bEKWXSPOkoWC5t8EIhgf1SYsk0rWuI4X4qzDR/+357JWYX5UfIOFjNlq7AKVDkuW7RWS
         1gi6RRX0k8YcZIT+lSeFGDMkNb8aUyjtP1RUcUiQM73+lEcUz2S0l0VE73vPS2X9Z2yf
         dPBwjnG1x25jUwCwS9yE1L0HPXExX5qa1ePvvXjMj/ILpzrBUiIRT+4f0NIR34THhi2n
         1zM1yMQ8AfjFOqg2zLNBRHdCjhGKYk0apWm6HGUN4fRApcPI+bJ186wK+v0Y6+qss9Rr
         +KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165109; x=1795769909;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9wVUTdW+MNLVrBmQrlwXPg7AvYDJhsn5P3ISNgJyFs=;
        b=ehKpGxz/SclZEExVt25C5E3nk573vHcFjn8h+wZ/D8FmSLofrh9ID1KivawAXoXltG
         FY5/iIHQgBReQxSeK32IkmTtM1SEwbR2zDpFcRGJ5LaLFgKZ4z6qBclIH80v/KO+bXl8
         JKYJViucYmUa8+7Yn12x+eN6Mnq8aDeE5mR7RyutDzzVVl8dA4vs060oXP/KZh6gbs8h
         QhkU6oeGLio0Gi0ZQpzhL3Q1tiAgV0xP/0k2vEt14XOQyGC8xEvBpE255DmKEdlfPVvw
         sKwo6JWs5hR2sBMk9/acZ0SXuNNb8l/UcuwaxQh6IXYvTWzzvNAoW3kakWe9JiYcSkfv
         cOYw==
X-Forwarded-Encrypted: i=1; AL+hErEepYX3zq2+RGWvbCMI+Tld/9cYvl2mRpcKdQvtfAQZggYz7sutrxlr6KiJdbAzFNQ8vhKcbdbq6Nc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z925kCl1PVAd+q7xzxtfLwfl0E10dz/CAAmWUGFexOsBehL7rYZ
	3DtNfayh1ZccECxmT4Nce1iU37v3Xo0UH25hSbkYiukCb+iUDMb343iGsdQU+yrX8A==
X-Gm-Gg: AYBFou02cKpp6PIH6O4unxy/ahg0jewv/w6t2/7jQZEVBJ6zPFosiD+jlirETU8Vfw7
	RosMlD9NYr1MVm0SZ8XebRm1H63/Tno+hX3vkQZjQL85zMrXLRSYIrN4HtNS/P3DLvG1ZnB696U
	tx44SPrmM/oefS5DK2ZqEEa1FmU3RFLsH1r9srNCfRR2dzF+0fYmsPk+IOwiVM8qW8tvA66mfCS
	TfzdNDF0FZ41v1oscNDDTUmSFxhqpyAIvQr9Up5rNXJ3B7PrCrIsdds/QeaqTBe0m1RQh14bt6x
	5sCHaHcSS4WjgSOqC78g3nFxgg4VYOJGI7FmtzzHTgMOTJLy2kmkZOos77vJPxMTUr0a9s9ZlCW
	V+zWPTIO7YoW7Hx/84AEvN0kPO8bUqQAbLO7DUix0H14l8dUG01l8lKxepu03F792aSCUwbV3YW
	AIaA7PKnyqQdFuYL+0xaXJeG+V25dpSHTgX8HmMdi93iG2FPxeuJQhSK9ltA11cq6VNUxh6OPVD
	dD6fbLDVCcdv9VTgzm2Q5Z8DcqM2mto1MvWpOqpC3P5nmQMe+LkgUKB3RMgt14URsJLDSwUPfLz
	QH9oQnOE57y8tdcq12FDXgzGbwjJ8V7c6A9c3cU5MXW5C8sKJ2qBTaQDYHZF5irvfRMLSIK6YTQ
	jvb5JrPHInx5teyc7
X-Received: by 2002:a05:600c:6748:b0:4bb:6a2d:b42d with SMTP id 5b1f17b1804b1-4bb88824e64mr50076055e9.31.1795165108858;
        Fri, 20 Nov 2026 00:58:28 -0800 (PST)
Message-ID: <6c0f9314-05ea-413d-89d2-5e63d0182065@suse.com>
Date: Fri, 20 Nov 2026 09:58:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: size the all-ones broadcast by the
 sender's mode
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261119220003.38517-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261119220003.38517-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1795165109-D7B5987B-69BAA3C0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1004
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 23:00, Stefano Stabellini wrote:
> vlapic_match_dest() detects a broadcast by comparing the destination
> with all ones in the target's mode, but an IPI's destination has the
> width of the sender's mode.
> 
> Use the sender's mode when there is one, as is_multicast_dest() does:
> whether a destination is a broadcast is decided by the sender. vIO-APIC
> and MSI destinations have no sender and are still compared in the
> target's mode.

But that isn't right: Those simply cannot express wide target IDs. Aiui
0xff is uniformly "broadcast" there. (Or alternatively 0xff cannot
validly be used in x2APIC mode, or even at all. I fear different sources
say different things as to the validity of this.)

The situation is perhaps yet more fuzzy there with the 15-bit ID extension,
for which patches are floating around. All we've got in the tree so far is
XEN_HVM_CPUID_EXT_DEST_ID afaics.

Overall with no sender it may be best to simply skip the broadcast check.

Jan

