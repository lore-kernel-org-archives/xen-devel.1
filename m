Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C6C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:11:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366344.1616229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlk2D-0004bg-99; Mon, 20 Jul 2026 09:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366344.1616229; Mon, 20 Jul 2026 09:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlk2D-0004bZ-6H; Mon, 20 Jul 2026 09:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1366344;
 Mon, 20 Jul 2026 09:11:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlk2B-0004bT-ST
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:11:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlk2A-00B4t8-RO
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:11:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5de646-5cb7-0a2a0a5109dd-0a2a4501e284-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:11:34 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5de646-5984-0a2a45010019-d1558036e074-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:11:34 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4956242332dso2918705e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563971572sm4637935e9.3.2026.07.20.02.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:11:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1784538694; x=1785143494; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M35yxX8Kg2U3yysr4y9rIXW9/Q5xZsxlMZab8c/b4dw=;
        b=AcZuDd/XiHZVDroGfBD6/Os9LhF1cpxMEdQS0U1HWSWTzFSthhgVjNT5vhiYz+xPz3
         nX8ajGoAOE9nJda10XSRVnEzAxKSvbAF73gFe+9mZRct5Ql3/tUl34oLqbX/7z7uMb/3
         MjjmPKirOIxwe69r5zjxpkmhjcEMxUKzEujXONkBiqG+/c6kSFpsmGjegw/GhxPhBln9
         Og8pfY6wtvtS7vUrqSo3+7DXsfCvuYFdTa/82arSw8OeBS0nTBW7jWOOlZhN32J6/4Ni
         yjbdUV9+x12c8UBtIYMGo1plcBfMbFfBsMpDPQX4RKE0fIcdSI3AvkD+fEdC0HaDxtAK
         9Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784538694; x=1785143494;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M35yxX8Kg2U3yysr4y9rIXW9/Q5xZsxlMZab8c/b4dw=;
        b=mkoADtNEhOrMh8kODjvPd024LtbK/xJTf6gO0F3ieOojFh7KNFFcQsBu3HmZKeFAFr
         Z9VjTVkrAwWQAIHLDF+nb2glqe3wr2xkPrVL0jYAKV6qsPqlhB6g410cUPl2sseHlzjf
         ME3Q8EVRDnUBOZ6sSkdrigX69uGn6S/zIXutdzkThieQb1pwQ6Y23jlIvM3bAfsul908
         nXZF8MsZGlK88aqAL+07x8YpPNr1J0lB/rK83K4rW64Obwqod0zJTvLTTQ5OXye+LbjT
         NXRdAZRrcY59Qy5MAv8HkA15Up+uUW10eVuzmfAJlrxhoFAOIxRTAM9iSZgcsTNFkSPp
         MoBw==
X-Forwarded-Encrypted: i=1; AHgh+RrScjHJX2JOZNftTEB5z/DYuvz+3gdQzjoyyS+gOjfraA/butgT2HDwVRneqcAdQEN3r8Frb7UFUwo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhBTuez137bEgF7NjGu8Gsj+bxwgWKhq0jxISqpKpAT0zqXJAM
	ELJZVqJMw3v6MmecwhSDOPlmpISSz3QZ4N5I6mh71oV8mMXZOZSPWwqHOf8ujkbJQw==
X-Gm-Gg: AfdE7clXAmU+19I0snnZJjnXg6FUzSnQRH57lXsFSRWgMS8VomycBgSetQiygmi7XmZ
	diOHa7IF+skN7SVEZV1erYILfZwgSDJiM9AMjeEHi4BEeSV8UIEDKYsBdhBHRYJ5kxvGu+CBgUf
	faIx2tY0bJ/kH4XFfuvrbmytzPHc6Sz/tvdPoflNWYI9qufooQQaH9nPg0Vbxaezi4X7yqGRdTl
	zWJcIMkx1fkBioyVdg0Fzp654DIMdmQELuR+WwPWR4umw6LcWULzreY5KNSj5AqkXAEMFXIgHq4
	Fk+vUMgsw9cfzZC90Hy1VJi+pAyX9bGEwCHGPX9XM0k1ohueJ4If4jDOt6/X7fbClFrnrzszeDj
	FQiGlIVP1L3rqy91ATdAA0LgJppl401plMD9Q+eWB6Th1b3RN8qMh8J84sntp4uzq4N65nCH/Ty
	RuDmPdkvxO0CeSiiPxNuqZ92Wt6+XzNO/Eu754w+c2ZGLHbtdNC7olXYcirISGecCZWA==
X-Received: by 2002:a05:600c:4f81:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4955b4a5c0amr48857155e9.19.1784538693895;
        Mon, 20 Jul 2026 02:11:33 -0700 (PDT)
Message-ID: <876a3cff-7c8b-4dd7-a158-a3f531074250@suse.com>
Date: Mon, 20 Jul 2026 11:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
 <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
 <9d04dfe8-97ae-4153-aa54-1bdbd31a7637@gmail.com>
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
In-Reply-To: <9d04dfe8-97ae-4153-aa54-1bdbd31a7637@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1784538694-BFA6E757-8CF5BCA5/10/73395122804
X-purgate-type: spam
X-purgate-size: 289

On 20.07.2026 10:48, Oleksii Kurochko wrote:
> Considering that it leads to crash of Linux I agree that we want to have 
> this in 4.22:
>   Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Btw, I'm transcribing this to Release-acked-by: while preparing to commit.

Jan

