Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63EC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:45:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383217.1626477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYBC-0005Fi-97; Wed, 05 Aug 2026 09:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383217.1626477; Wed, 05 Aug 2026 09:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYBC-0005Fb-6W; Wed, 05 Aug 2026 09:44:54 +0000
Received: by outflank-mailman (input) for mailman id 1383217;
 Wed, 05 Aug 2026 09:44:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrYBA-0005FQ-De
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:44:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrYB9-00BWKw-Qi
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:44:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730610-5cb7-0a2a0a5109dd-0a2a4502d992-16
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:44:51 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730613-6ca4-0a2a45020019-d1558036b490-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:44:51 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so6730735e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:44:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23ec2fsm7302644f8f.29.2026.08.05.02.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:44:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1785923091; x=1786527891; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/xC07hUjUOekDJMrhIxHqIepT3gweD/QF3bDgW0CRo=;
        b=INfxI3FhVW17vRpVGr4mLaypV40YA7P1zjppeiYtLDpx/YmUjGKSH4L9db0I1Lb83f
         t6oXuo/tHhjbDgFsHVz9aJpFD1mZq7jxxKatEvySISQ7qDhTxg1qI18Li9Y7jRlfB6DG
         dDmvLPDz5vIksJEd/4uyy144EVChwRImezorhj5l1H2QiEtL6oxHA+pDGZlWW+Xs+R4/
         8YO5iMQyGVYDmM5N2dLJ6gNlcWGer4E2+SyBjJpPWNHWtoDbMK8aPJKbH3ytU6ys8yfh
         yamKlm5dju50H2SaorYWhLwqdWOqvBzgcDUz3Ea3j1gCKeaSKuG88/g8X/A7POihRpIF
         mY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923091; x=1786527891;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/xC07hUjUOekDJMrhIxHqIepT3gweD/QF3bDgW0CRo=;
        b=fGJkW82/0Deg2WGmP62oWVgBpKbH0j3c0c/m/s0UKHmlukBjgMCCXZmtVxq+6xI1h3
         26i8ToT37/u7XkSzmSWnk3DhWbo2rHfTseX7FISXoJKqb88lnsz8zyZPXMcpjZna8ORy
         rrE6tUT+/Dzlpimf/FCtkt4vmhnrgG723WHOWX3eA7LTT0XPVbk+BrLCFy/Oypooy2Qo
         Rwbed4etJ57fC8Wk42NnjdzrMmWG+Un7z2YPvtUHvrCUryAn+ttH25S312wrtkyPl0RF
         5a+f45crwuQ5tVF5PohqYn3TDsDYaJtJgTVYaaaNTPSxkXM4l8vMhkMGx56NgBnmGRIa
         oCaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/IP0iIWd4g8Kg0S4xHLiSc7p9seTbEduSVC0cqVwcbdNlUwbyKVNaIlR824gEH4AIdR6gNgRCALg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytg6xOdoZiPJXoeO6b+HN0bE9lydWl5OqJ02872T4OLeBUXeXX
	RZN8dvHKtBQ+aH+ldJHHBCkV6vF7fzfIDbUacoARtvY2c8QwdYzzToewv7UakMVO8w==
X-Gm-Gg: AR+sD13/okSiDjk9Ud/Kl+XeWToTUX2BU9arXggmB+9eAp30cN3yfaz961YU9EOAKNV
	jrr8UnxL72GW7uDqeYfm57/W30vfPJ0eXoi82MTwhpz1M/1yvfozHMIv5UWHwjJu2aGyK6MWaVD
	jrjvl7c2GTKRmyxWubuCoIinGzxWxpcTuQlaGbRhEQ+lMkYmTvgUoHhMIeyIIIH1Wn7OxHfryyU
	/oSKrpiHHQbVS2PxVGGF1yTD5MAgxadfUVI1EEmzQrCrghc6PVgGOECvW3FtEzMS5E9XdXi+C5V
	xRILd6Bjy+OTQPJAlJcKoVYpToClRim069gkvJsnPZosrrLpFxmfk6iprbG2M7zzW5jtexNxTgn
	ZVvTy1BQZ6UwF6k5UQ1jdE3ykjuByC8U4LgAr4ly7QDz901ynZ1Iubc1A1FfQv16ncArA09Vz1D
	+3gZUq27fGZVB2QlH+B3zTQAnrTLke0XgntJxkyfNsN99DbooA2amCJInK5ny4hkviASXgKKTk0
	nxgv3ccatvVX2upLCrKeuD0Si70b7MOgODB1HGZ4tZQab9tXDHj
X-Received: by 2002:a05:600c:620e:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4994e70a6f5mr73830555e9.2.1785923091196;
        Wed, 05 Aug 2026 02:44:51 -0700 (PDT)
Message-ID: <451978a5-7dfd-4b91-a241-eb13caf6d394@suse.com>
Date: Wed, 5 Aug 2026 11:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] vtd: Move intremap table to xenheap
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@vates.tech>
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
In-Reply-To: <1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785923091-303C42AC-842312A3/0/0
X-purgate-type: clean
X-purgate-size: 741

On 29.07.2026 11:59, Teddy Astie wrote:
> Interrupt remapping entries often needs to be accessed, and we're creating
> pointers to it on demand, which brings a lot of complexity (e.g
> GET_IREMAP_ENTRY() macro), move it to xenheap such that it's persistently
> mapped and we won't have to worry about mapping and unmapping individual
> intremap table pages.

Afaic: No movement from domheap to xenheap except for _very_ good reasons.
For the case here that is - maybe establish a permanent mapping using
vmap(), but no change in where the memory is to come from. Whether such a
permanent mapping is really worthwhile may also want supporting by numbers.
You say "often", but you don't qualify / quantify this any further.

Jan

