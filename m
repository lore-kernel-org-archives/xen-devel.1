Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149D5C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:42:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383033.1626288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXCp-0001uk-5Z; Wed, 05 Aug 2026 08:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383033.1626288; Wed, 05 Aug 2026 08:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXCp-0001ud-2r; Wed, 05 Aug 2026 08:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1383033;
 Wed, 05 Aug 2026 08:42:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXCo-0001uX-0I
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:42:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXCn-00BIZw-DI
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:42:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f76b-2eae-0a2a0a5409dd-0a2a450ae862-48
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:42:29 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f775-f2d2-0a2a450a0019-d155dd31b8f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:42:29 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47362928f65so584672f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:42:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfe5bb9sm7083286f8f.10.2026.08.05.01.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:42:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1785919349; x=1786524149; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHvHXoMiEfHV0d3+ZZnPlHNwbEsyLi1F3w1mF+3Pqnk=;
        b=WsGS3itvdN8PGg1HAxbcRaENlDP2zDhNXFZCh67pqro9Zpq4S+o166H+VdlAT5JVmc
         e269PZ36ide8Fgcg0tUcsZdSv+TlTFzLCFn/So6RAI3Ijn8/lfLp/FPscXZtmFs6tYW1
         2u3DtTYIwpm1p0AkOt2BQBfr44GP+KtOEp89ybFBzNlfw3VtJZN67hOSwgL6A62K9uqK
         +/HGSkrl4J9UiaASAflsQQeE+EqvueOMwpS1dLeL/ha8j/gWbcHwYPMkCyVXiFAVq7wy
         5Jb6vjSYEcEfjivgtZE5L2Ycev9Ce5h7qlO/JbeiWi0I+dXAfAdn+p+Uhq5D0DCxdrcG
         2xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919349; x=1786524149;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHvHXoMiEfHV0d3+ZZnPlHNwbEsyLi1F3w1mF+3Pqnk=;
        b=WeMK4XG56yVYdseDhm6pM35xPd/B4yqP8ugCSSdHzB8ZVXlwpA6dX3Rdwj/Lzk9+5P
         Qno+MfpDcmost450ChJufiUOy5HhdFxcWl9slRlG9UlTAXJvGuQSonwJ/dRxt3MTnov2
         OLt4njj/a44zK9H5tPdKB1s5Q785el1n/xfNquV/qYTv8og29e/+fj8QzdIO3uR6BfAW
         yh0n3XIjfpy7RhsdTQ7O37aE/k6+P/qEA2SeP2IOXUXo+cU7pH6u5aZqlDRHRcNru+1H
         YU6AKbu6iTLSZSalN8pQ4DVsl7Ue1kauQLtXHQHVgWvVZFJdTLDjmTTY4ThP1+d3nr8e
         5dKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd31sxX4hh59ztyDjvS+sZS2QQBfxsOE0V8yWkCY1S01u8oBSBU12uGDn03MaWfplKKhU6YwIp8FU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3cn8ZQ6RMgpczBfDb7muKYUnjJ1k1f2WS6iTHtob1xYiuRah6
	6YVkc6NEsOGHlnLKmkfWhJT3i6kqamyQxAeS610V27CCK3CcAjUqE96YRdGsVdUEyQ==
X-Gm-Gg: AR+sD102sXZ+0OnTLMEn38MTQTbdxyu98gYhTIRPOHlyxJ61cqjMikCLbV75pk2sreH
	xXCLtnw3Cxq204zFg0WudkqBVcuUj557fJNhVffXBeJBJblCUOc/A3ZQ11IGbg5k19vIyvoPni4
	0Dswn2Y3fsM5IWO2id3kVLEPbUN+0icj5wgjVF6FBN7043vWwU1stdQ3w3MHhMUOow5J7hRKhXd
	ZeYyHYjrcCSs+DjMZ78Swl/93LaFa1ygqOLpo7iGQO+SU67BeiHB62j0hI7VSlRkds23hwA98Tr
	QaRgq/33qNX/o3qfQHSW1q+KcKjFwJP4M5jp1BDpQ4CTV+pGKX+qQgXY+RKDX3ogrCqnKvTc9mX
	uao7N7Lj/C6CGRIeaftVGVzlKtzQDZOwE2FpEJWYH0i18vs5OslaO0DZEjWLEgeV0ztCx6bxUnU
	vjqIQXEPnr/+ebgiNRZby7VsDAolXINtxD0xetL1v2821u2x85TuO7rXpBIvLjsllNqavJwxtuH
	ASCkOsIFdwiC7q97qLwHJZ6PAKl/9mPGL8IdsIxjla+zDxIESwU
X-Received: by 2002:a05:6000:2c0d:b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-47fec4f11cbmr8645151f8f.9.1785919348735;
        Wed, 05 Aug 2026 01:42:28 -0700 (PDT)
Message-ID: <4ca560cd-c43b-4893-bec6-800a33cd1bb7@suse.com>
Date: Wed, 5 Aug 2026 10:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: Drop CONFIG_XEN_AUTO_XLATE
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-4-jgross@suse.com>
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
In-Reply-To: <20260805082137.1214967-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785919349-50ECACFC-25EEF3BC/0/0
X-purgate-type: clean
X-purgate-size: 366

On 05.08.2026 10:21, Juergen Gross wrote:
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -309,12 +309,6 @@ config XEN_EFI
>  	def_bool y
>  	depends on (ARM || ARM64 || X86_64) && EFI
>  
> -config XEN_AUTO_XLATE
> -	def_bool y
> -	depends on ARM || ARM64 || X86

Yet is/was X86 correct here? Shouldn't that exclude PV-only configs?

Jan

