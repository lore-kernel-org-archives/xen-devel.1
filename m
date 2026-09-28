Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B67CCA5FA1
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:22:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435748.1654534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6cX-00030G-SO; Mon, 28 Sep 2026 08:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435748.1654534; Mon, 28 Sep 2026 08:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6cX-000309-PW; Mon, 28 Sep 2026 08:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1435748;
 Mon, 28 Sep 2026 08:21:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xB6cW-000303-Ax
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:21:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6cV-00Gam5-O4
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:21:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba239d-e002-0a2a0a5209dd-0a2a450b978e-16
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:21:55 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba23a3-b7e8-0a2a450b0019-4a7de14cd596-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:21:55 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48434392b02so2318814f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 01:21:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3627a8sm27987512f8f.23.2026.09.28.01.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 01:21:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1790583715; x=1791188515; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LG1+WxGPzsqxbIrP9ngnW+vF4FFyu2CA+mp7BypS3f0=;
        b=KaNX/v5aPzuh+dhfd4U0B82OXBoRsg5nl+rP34OXIWYprOqG0l8Xm+6cRaYbuTYy6A
         i/olhj/ApziJi+SlnIKn2DIJOueJQhcgYPENvpWiwf1VWL3HzlnMC/iARVeRj5qS9mxc
         6ZIZ2hRrWlFo5El4L5o6JZsV7FKNQ3NLzLzOatoFUoLYfi/ySGfCg4tvPeCahRQLt5L/
         ff7l/eRvfFni6q4GQCCy2P6PjuHVQssi/j2uE9nDqLlo0WGumrWwKXXuEkGYwS1laRI2
         Ayju8MTzMkQLD+CaQw8bddIYY8ZgB/IeQ1awW+1+IGmdJeYq4D6tm1n6C8fJEi5q/mM/
         2+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583715; x=1791188515;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LG1+WxGPzsqxbIrP9ngnW+vF4FFyu2CA+mp7BypS3f0=;
        b=Y1bV2/beCFlkwIwwmnGFEMsiQwoE31nev0OqNbPgOjRNPX5snaKdh4KJbM8DzZBa6z
         Xk7TJy7AP79FEq0DfN6kQgQ0zH0l2tQ1iREySJsihnEHUKT47ySrJmCN7YopIAer3hB1
         s5YdzpzwwdVthN6TEFtMZ2ZzRnwhiS4eOTW53wBN5F8UYHV4sq9Ovg+GwoaHNePYG3Nr
         s9+5I7p25a8rtzp2/MQZu0hNxtcybk98MChEzo8djlPk4+9Zt6PVT1ECTKaDzUv2FwAa
         IvPLKG0gShm9kzU+kj549lqWcTI1tj+l2gZncZEdAna/cLn+VLMoHhdvlhH8CbucZadA
         E9lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrXoLRMWXtoujRG0rsnxNTBMYDvq4FtE+37TFrq65HLDxYHVWkSTLK0e63HxAKAWiVyPmSL3nZj/w=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJyYcZ0F3oVVbZqJCPxRIKhuiQBAakKstH11yWDfyA/K1fkrPNi
	yv+aIImOQdsY7Hka2Vc5Z2rPZ8kroQJiCZsB5rmJPZ+niP1JrumNcm3w/Okld0D95w==
X-Gm-Gg: AYBFou2Dc7RceoISZAcAwSFGwRBKu3m1JMTnjSNSDAuLkUto67ga5TBOiPWC5GPftLw
	cghIYzvWI0fVUni+lNgxccKWREEQc1uZAj9fUY/ah3APyekXacN+bJ7GZbTFXqa8UfiwGMfNNyM
	XcUPYZ5PuMLKLpJ6PgYSSg03cPXqMSmM+6+w5SF70riMjnA2yW2iRO0uXw3Oc3GE8mTQyPmgjs7
	GT4Zi4cRT+RH+4SqgCPFzGnK1MvdXM/cGWUxyiQclp6M5zrwm0te6HsiYqUAA9aMDaiE/dXLQmD
	QmLIJNxqSMsvVA2C5yHyXmXcrkW8uNmnJ330zJFl2Djq9zTyEwOGDNr8sfwlzlf+vDDPioQW8Jw
	Ri9cjjnEuhAW8lwfdg4NIYOS0gelG3WKa3pRXP3cq7SILGRNJL9fzFUAVoLXYRmYDY5UhBfNlyj
	mQFYnlt0fJz+/vblSP4UuS8zGd561+9cgxnH7Xe6FG1dtP/5/D7VQMiJZe7slzHoivUAiTXTvY6
	p7M9RNTbyHcvrTuqqwsuPWXRm02d+TGfj6xA3va2nLpHObUN7mb/IpS39Bll3E=
X-Received: by 2002:a05:6000:4a14:b0:488:88f6:562d with SMTP id ffacd0b85a97d-48888f6593dmr9249115f8f.7.1790583714647;
        Mon, 28 Sep 2026 01:21:54 -0700 (PDT)
Message-ID: <73804310-d397-4688-b223-385152dcff43@suse.com>
Date: Mon, 28 Sep 2026 10:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: fix MISRA R7.2 violations in
 crc32/unlzma/bunzip2
To: Andrew Precious <andrewprecious388@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger@xenproject.org,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20260924122403.214738-1-andrewprecious388@gmail.com>
 <8cbdcbf9-4ac4-4bb3-8b1a-c61550a92bb4@suse.com>
 <CAF14T9nAFZMCwN7tHy7_Gtkza3Xh_sYnKMjemXOFEOMH+9vaRA@mail.gmail.com>
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
In-Reply-To: <CAF14T9nAFZMCwN7tHy7_Gtkza3Xh_sYnKMjemXOFEOMH+9vaRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1790583715-A84CB9EA-0ED9F67E/0/0
X-purgate-type: clean
X-purgate-size: 273

On 28.09.2026 10:08, Andrew Precious wrote:
> Won't the lack of full misra rules compliance(even for linux code) hinder
> Xens' security certification process?

Yes, which is why stuff like this needs discussing, to determine what the best
(overall) route is.

Jan

