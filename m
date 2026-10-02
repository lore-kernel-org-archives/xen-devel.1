Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3059CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 05:39:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438845.1657383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCVyh-0001RU-I7; Fri, 02 Oct 2026 05:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438845.1657383; Fri, 02 Oct 2026 05:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCVyh-0001RJ-D9; Fri, 02 Oct 2026 05:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1438845;
 Fri, 02 Oct 2026 05:38:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCVyg-0001RD-GX
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 05:38:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCVye-00Big9-5I
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 07:38:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf4353-bab6-0a2a0a5309dd-0a2a4505ecdc-10
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 07:38:35 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf4358-4cb1-0a2a45050019-4a7de162b60d-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 07:38:32 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48b017a3be3so2119687f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 22:38:32 -0700 (PDT)
Received: from ?IPV6:2003:ca:b707:3710:a919:1c08:7b2a:ed1?
 (p200300cab7073710a9191c087b2a0ed1.dip0.t-ipconnect.de.
 [2003:ca:b707:3710:a919:1c08:7b2a:ed1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b82253e6bsm2630409f8f.6.2026.10.01.22.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 22:38:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1790919511; x=1791524311; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+yErKg9Mk45ysFIhZ+syuHKl3mM6aXAzL7ppjwokwY=;
        b=RYP6lUysdiAlvTxeosbLHm+bWbgOv9Q3g2vWQTWMAV/ESsGl3rDiuaM6GlDXh6GLZS
         Zp1MwfgSNxNMbOeu25Vh2oEmy6D58wnDnIsriwDt14KvsKidrL9AV5hOOgu56xtAaDJX
         lXPtREhQI6NiuA7zVEUnLWK7EVEbbpjtBQLC1QTvadEO/jv2mVJn9AtnTQ4HjwQjmABF
         8UonN7NnpxR8AZluyrSkVMClGRvOMMWxLZgoU9pI0cLPqbRjCPr1gChoFSTUkRyNpiVc
         zLhBnc6sjuv4y1WC86nOOv49DjElPdzz7o27xaKl9JZyoe2G9lh3y7qRVr9dBck5Anig
         SNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919511; x=1791524311;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+yErKg9Mk45ysFIhZ+syuHKl3mM6aXAzL7ppjwokwY=;
        b=FOs4flf82zq7xLzY62uekLZ2wtUO9g6+TIM2IHlC3QDZw7/TKH4zkV6Igo2tOJknQp
         NaCALlRrT6ErYbJzgLXMeYgdAbqeGv6DtTfKB6UPGfW1jsZSQSByQM+3A5/87GoUORl1
         ddPvwR6wFXwh14dZupZ8V4GGE096liP3ZcM2mSNZYK8dmN6FOWDh6XEODYfbdWSf1349
         amk5JQ/18IXn+m9Xv62PJNbXiwO60zSk4S62QWWFMI0Ax/BV/2znL17FYclram/drmC5
         iTmbrX+2ZSUC2yCgixKR1DHit+XFsZdnFbVIIfLo2erhA5gOjed2P32qBoC6fhSlxN2w
         Oy0Q==
X-Forwarded-Encrypted: i=1; AKwUvByTH1ZeDLJCKdc17rCDtlXDyzuHZ0YUnpvRtTHAjHRXpS2s1XX1rpdrE5bZJU0+QTkN982CiwsKtuA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLP1I++oUU0o1tlGYpZN02Ao4m41nWtN1C/4+lMZEBAtB1Wjz7P
	mjgEuPooRiDIEuykHciLhQIB+C0LZoFobm/iKkHwPKdebR2shiWcKqO41DNkxLeUng==
X-Gm-Gg: AYBFou2VtJEcWM9mC8aeYiRrk3V3FlbxrCbDDAmidKyMLWLTUsam03Jbi09e4YjPoh+
	/9t1F6/E6055VkjEzDyDYaW94NFtQtIhphHjkb+ScCgdhDdjFcOAUCMP5+9o6pGA+6g8DRk1gx/
	Ywh1homYjr3ktjVejWSqZdl43XuMXl6s7X7rHJY2XcqeVSnUAhSY3LT6nMncz5CoGBHs2tpaif/
	7lNPJShfo9WZ1QGi+MeS1tHjhG9A/pmH1eEBU442w/Su2NzQ/0smjbbpJEq4jbK6kwLZRDL7H8f
	dfScfMMlUfw2VVC26TOzv35NtDekTblJ/zeU7YOh7f07XxEiJCAXJSUl45bAeHZ2abwQG0dxrD5
	eotw24CSMy4qIfL5fxjDbPb/6hSxilP6nnaA6yVKdv4v51L3YRlAYrI82aNHDByQ3FsT1Trsrm8
	nqcfwOLr+7E9EFWnIzEbie0uj4WVseqfnLzNFYUuJVeCV4HBCd24vvW2qvzD0F2KzL+4PozI8EG
	yaH6ASalQfgSXLDx8nx2a1wuNqQLOh2CUR3LCA8TmjJAZig3ZCW2tbkaqzYyVp4RyFMJu1R7sNw
	g3+GEg+rs8Tae54mfmln/QBogJIJ
X-Received: by 2002:a5d:588d:0:b0:487:489:7af0 with SMTP id ffacd0b85a97d-48b1273b085mr2873912f8f.17.1790919511614;
        Thu, 01 Oct 2026 22:38:31 -0700 (PDT)
Message-ID: <a91fef08-3a0a-4a71-9618-9d6d3e74112d@suse.com>
Date: Fri, 2 Oct 2026 07:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-2-kevin.lampis@citrix.com>
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
In-Reply-To: <20261001174749.2275245-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790919512-F44A42A1-CD2FEF13/10/78276251493
X-purgate-type: spam
X-purgate-size: 291

On 01.10.2026 19:47, Kevin Lampis wrote:
> UPDATE_ENTRY/update_intpte always returns true since 1bc30c076a7f
> "x86/mm: {paging, sh}_{cmpxchg, write}_guest_entry() cannot fault"
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

This was already committed, wasn't it?

Jan

