Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C8EC44539
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 10:44:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368332.1617753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmUQc-00018l-Cz; Wed, 22 Jul 2026 10:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368332.1617753; Wed, 22 Jul 2026 10:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmUQc-00018e-AV; Wed, 22 Jul 2026 10:43:54 +0000
Received: by outflank-mailman (input) for mailman id 1368332;
 Wed, 22 Jul 2026 10:43:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmUQb-00017T-Lr
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 10:43:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmUQa-00CpCq-Oe
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 12:43:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a609ee5-5cb7-0a2a0a5109dd-0a2a4503cf0e-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 12:43:52 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a609ee8-fae8-0a2a45030019-d155dd2eb550-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 12:43:52 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f73b1ee02so703305f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 03:43:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bd850asm4848112f8f.15.2026.07.22.03.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 03:43:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1784717032; x=1785321832; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tixoc2plgCbHaz9e5EYc1AsbKN8vB6LFqSqbzbyNoko=;
        b=Irlg2dnx/tIt8j3hxky9RXcQoB4lnB+aleO0EF1BVlXPcVvR90g557fzCRAkjn+rIQ
         kBhSSblN8+q8pEI7VRI7pzOpbwQio5D67HrwyQEOPHnSYmUj2MPGb/7Z7jTT9TUCR1O8
         Lhlf6MAhK12JEa1EKNfSTs7wkAuuR31UO8SZv7fC4eQAV/PVl23uKAs3iUtv+uCH9w/e
         K9tFGaixwpHdMjWReD4ZFfvI6fWVFPCTsq1DXRNiJQIwuOzYxxkSiD6301fU4s3X6xEN
         yxS8xPWSWxeEpJgZTPSbh5MuwrEdHN890vtYMfw1QzvwwyvEaf7uDTgihRkxreJStkbZ
         r6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717032; x=1785321832;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tixoc2plgCbHaz9e5EYc1AsbKN8vB6LFqSqbzbyNoko=;
        b=US+Kw5H46jRlzWYl5I+HauYJN98x+FR0UZuhfuNeIXCJQ7Mna98RaL3eMtagpAcagC
         90GZfYkkaLE6BQFTrKquop0J7MZfLsdaAkCOZ26q/VgV0JUJm6+po+YxzN8tQeGRSij1
         0dW06lGjADeqL0Uv+zcOxu19DtbzW7r0CZGQKn2igirySYgTHU5PwSB7sZUA6gKV7V9Y
         VaNJDE43bAwLFv54NPTjKZidYaWqQDVzFYJlChdDjYaZHNCzCYvPL/BoPkEKb8xyNdZ7
         Y2QfEkpKDIKXybfnhVPX5McfUnJcd9Yg4brDlUT/kYBwOj/llVReyKhD1IrznZGTvyJg
         YCKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8JhUz11/sG21P5AgmCSycgIpPtwn5W1/YtXcXXOz/yvB2XyVF2HsxCvr1oErlkR3pF8Niwhf7ryY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxwp0Gc/JliWcxxZIT+XDXQ/kui6Rd29C1Wt8PEeKAO0UflI78e
	zCnSQ0+L1PLUxFHAc9rBDRZ3oCD+nPzSY3OkrLITBNUta6VD95S2AtcX2a4elaRuBBlSU0mjDST
	7KtOXVw==
X-Gm-Gg: AR+sD13jR2FmBXhoqmZ3lkaAtxOMWYmU96O2LGk5+h8+AmwQJmM4fa4hqbbhObd2vkp
	hWnpTo7ASf7/YsKCIcxaFkiiLidulR4OfEEakJ8nBnFw6oufX6pT6DAWbhOroNEMKvm+iLbtidR
	T/QfJ5YqSKQNWKoHMUd0m3N/3wT03bmbkfDBfB0az5qsu51mWwpFdntEyexw8HQs+wse1A7/68r
	GFki9Pnh2ENVz4T7z4rrPdX+mmvq2sGfyGSEFKLoYOI0vy6VeCmmQxICvaLuxlJmDlVpsxxjz9T
	E6pUaBzVqBAHzP4jyihhX3MYUvtDwHaXe9SsT1oVsmpBH5QgJMb/TwiYMtbyWDF1p/vKUOP49cH
	ibgNbasqPTCGWiAbhLXekh1p3yu0KlaoIyNN1oz/2WWO3NE7NkPQGjJiiIR+O8GkrCZXaILGd4i
	xtx0uWnpcE7BYCf/FrUT7QJvQgzKsU73KtzC/21rlFujINfEkTGURFGEHkXjoUUr0FyQ==
X-Received: by 2002:a05:6000:41f1:b0:47f:45fa:98e0 with SMTP id ffacd0b85a97d-47f62344277mr28806923f8f.57.1784717032161;
        Wed, 22 Jul 2026 03:43:52 -0700 (PDT)
Message-ID: <ced5e9f4-b250-4ecc-bb13-5086a9079eef@suse.com>
Date: Wed, 22 Jul 2026 12:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add xenstore related docs to the Xenstore
 entry
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260722103302.452529-1-jgross@suse.com>
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
In-Reply-To: <20260722103302.452529-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784717032-754844E9-4EE3059C/0/0
X-purgate-type: clean
X-purgate-size: 225

On 22.07.2026 12:33, Juergen Gross wrote:
> Xenstore related docs should be covered by the Xenstore MAINTAINERS
> entry.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


