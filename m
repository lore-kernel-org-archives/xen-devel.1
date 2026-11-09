Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE38606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZwY7jrx4
Received: from list by lists.xenproject.org with outflank-mailman.1479751.1683663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMAP-0006HR-40; Mon, 09 Nov 2026 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479751.1683663; Mon, 09 Nov 2026 09:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMAP-0006HK-1H; Mon, 09 Nov 2026 09:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1479751;
 Mon, 09 Nov 2026 09:59:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQMAN-0006HE-Qk
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQMAM-003K9g-Ly
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:59:54 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af19993-bab6-0a2a0a5309dd-0a2a45038818-8
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:59:51 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af19997-fae8-0a2a45030019-d1558033c460-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:59:51 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so4512585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 01:59:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90619bc91sm121323215e9.2.2026.11.09.01.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 01:59:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794218391; x=1794823191; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvjvdDbYCdeQ0HZNZgTjFJLmJ5pUEROImuQmQcSe5+A=;
        b=ZwY7jrx4xBie/tA9fkYHU61j1e41FHK8gG/a0MipeToITJ8+HA6cPMWTBU+4+Bzwx2
         BMWEywTIiyO8iT898zhSsCDvgjwZjKhnQhzFJTaRAKn3hXXSeVkVrF01gCd5UzdCnMuC
         mBlcKWkUdIscL/mPLWB/I7oceQm5YRZD5rthSsYYwrNQb4jP5VM3YsGw+gWc6JDcv/VI
         xu1NT4Ts/s3+/4ygF1QI7V9fIY8vV9nFa53uwnY4ieOUpY+Vj2nrQiAws/ybDJvsxwey
         d2AhzdRYmlQSzxxG2KenP1bB7DISqgW81eu9yV+l9W92aMbw/CksWXmaFcZk5P9uqAfO
         XVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218391; x=1794823191;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvjvdDbYCdeQ0HZNZgTjFJLmJ5pUEROImuQmQcSe5+A=;
        b=V/c4/SF4d3pE9HEIYNEnwCl9lNO9/L7F9fuZwA62OJrfG1kuR8mko+Z3Hw0sE0MeWa
         DPmDVgmfia44lqAh+9Ni2XN707i8u7IETGWhhVDw71jffgxR28X4xvgUbS4Yvb4UFHj/
         OYOrk9h2o9NUdQ7Dfp73Dwz5S7VzJtME7Q82ct+1d2Mn0iLqtORqmCN5WANRZ875/Y4x
         84fNXGqCb7cDfjAq9tnoS5+OyV7++AkaFuoYGC3jw10N1PQoIOOxsVCAwgytm294wagp
         AA/ZtG07dJ2oWxXh04f88cwZ9muMs2iaCT65jQ+TNkBqWbGgEbM2eEF7dPgGrDWU2TAl
         pHjA==
X-Forwarded-Encrypted: i=1; AL+hErGS6qCWKJUqlYVfCsgyy1HsKMEC+W8mQmsXWRoWlRW0UuosfS8ImuXW5arxHeUIS0qW6O7ok+HZE2g=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9+aSIvHGHrVXmWxfRXToP5kSPhXBaQYY9fkbPXdGrIbsw9HvLx
	GS1cVur8Ida+Omj6Sw+Tfd2U4lPNgAxrLJJF6DgzdTggIvKQf6t4oI5makmeN/DkGw==
X-Gm-Gg: AYBFou28KVYS1M0x/cPhR9XtqPdAJflJj8BiHaKs0BwktHsSAynYnWuNyQTEt3RykD3
	SaXHoxbXBIkx1MphOLWAw6UY1/LHSfjcCrF2o+tDDjftFfrzBzO6vZL6gf1owR7Fe47nGcTvO/x
	fRHMRlfzLUEr4KoNuppnJxCMyRk3RKEgYSpT6SYblzT/hIesDAcY99wnTTFccnNdiDmDSDZj7pa
	k20b2NP/Ko4Ynj5OpzCXnELsy6n50wWca1lb1P4PqB1xc181FhbWjU6ZwYxBj4cvyaJadUV+JIS
	F7XGb4t9mu6WYWSKGn1cPK9GTWlTzZRseU0tR4/gVgEUp8iLX0w5TiekbYz0bTBYWeuICyR+e5U
	TkHpaI+jhtN002S4dKZiGrOmr/JCHcjmZ03YLmFEMFiYR7wVT1cRO3Uw8K67j8sWEwo8P77pJN8
	xzZG/ffZNpxfyXT8GLzR5mPe2D9K51rfitwqUb6X6z1mAt/11Yylihf6IjXEpONT3MO6MqR/X7w
	Dnj6ap+6XsC5BK8z2p9K/XF1hm8i/RnsbzpxKbQjssoMTg7opEenVlR7Wl7fJVxt9YDh804k0hn
	OPL23J2cGP+qqJSWeZMDEWoro07z4GM8HiRegTMrxl3SWJSmpWC/68ZPM4yDn15yBZJTJw/hdsL
	alREqZ1QqFInLZkpn
X-Received: by 2002:a05:600c:3ba7:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4b963c8571cmr75678155e9.23.1794218390951;
        Mon, 09 Nov 2026 01:59:50 -0800 (PST)
Message-ID: <922326b2-b48b-45be-83b7-c7831e6407aa@suse.com>
Date: Mon, 9 Nov 2026 10:59:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] vpci/header: empty the BAR range sets when
 modify_bars() fails
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
 <20261107021442.253612-4-stefano.stabellini@amd.com>
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
In-Reply-To: <20261107021442.253612-4-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794218391-776F34E9-DE5CB08F/10/78276251493
X-purgate-type: spam
X-purgate-size: 564
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 03:14, Stefano Stabellini wrote:
> On error modify_bars() returned with the ranges already collected still
> in the per-BAR sets. The next request on the device then maps or unmaps
> them along with its own. Purge every set when collecting the ranges
> fails.

IOW the rangeset_is_empty() assertion would then trigger? May be worth
mentioning here.

> Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

