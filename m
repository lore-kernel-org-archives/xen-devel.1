Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F5CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:02:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449993.1665489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGPg-0004HF-Hu; Thu, 15 Oct 2026 08:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449993.1665489; Thu, 15 Oct 2026 08:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGPg-0004H8-F6; Thu, 15 Oct 2026 08:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1449993;
 Thu, 15 Oct 2026 08:02:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHGPf-0004H2-9L
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:02:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHGPe-00415F-Is
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:02:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad08874-2eae-0a2a0a5409dd-0a2a4502acc0-42
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:02:06 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0887e-6ca4-0a2a45020019-d155802ab435-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:02:06 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so47154115e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:02:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd640be0sm40560475e9.1.2026.10.15.01.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 01:02:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1792051326; x=1792656126; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR5/ecCJdWvPDP212V1F+Ibu6b1V5udx/DW9D1oSIwg=;
        b=epVetF46aFqXaJyglNysgKO1K315qHXkZ01KUPskqKA8iEpjCNqYyoICKgJjTjoLVQ
         uEqrY2J2BlRgLsKK6UFuR/NWAIcVoJOwW4GXG008kxjTQY9hQje/LDb5JFIhGfORdJEi
         N0BNIyX1sejd7gnzso/jfTsbz/3OtsZ/FPFziiz/J17XmCUHOzvCB7igqHjkU73jP2P2
         BeVQ4UwhAu6R+LBpaTLzGRj0evkzctJWQ2aUjWIs64Bzy13C9cQirbq7yM56CKqbXjeg
         iBWddwst5jr03URsZZ6qfaWWs3nyr6VCxOb7XLuLBBRjlV7vsDsBhHXvPmPhIDcnasO1
         pPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051326; x=1792656126;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR5/ecCJdWvPDP212V1F+Ibu6b1V5udx/DW9D1oSIwg=;
        b=alXRw82/hz7o5aMUfSnBKWSS808pu/or9PWIqSVsal0zSZGjD3PNT35E05/gYtBpgl
         zEebh25hvb5ahvUSwoj2rjfaKuR2eL05y73pGTLFo16HcRHvixqh5vHAeglSxWbvpJsK
         kGV0lkEPYdTxl3msKJR0KnEVpj9G9QtlcLteztolSMR8bEt3BqAL3LjFnaae2hGnoIr4
         +Q9OEX3IK26U4IdP4xHHNEEry7ks5k6auACfq3hi++juUDH+T5iEqFaGpo/uLvZXhNtQ
         G2GvfjPqImvwKjUIOo/30KW/ey+C+Iu8WKCT8dWsp8KOxoWQndmEqoyAFOsU4UR86pM1
         E1rg==
X-Forwarded-Encrypted: i=1; AKwUvByTcKwJRUb93ONHteOedJltDNXs7+gR62org6oTqXackZCjrgVztLn1033zDVEzW7inMPbQaAdKwSE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLR1Gd9vgPgF8oGuPmHtRatNTdiVsfDSYMblVGFcpxZrXEs7ISW
	xdIPe+jQGiv6fjUuS84wUrTfUtp9XHCOUBbg9+eT3rcJpOyhOI6H8vf745qSFTjSlA==
X-Gm-Gg: AYBFou3/LBTZfRmRMqSXG5LWhuXaY6QYUZgx2GqyBdtD9mr4qHyJs6TdOLfK4Ylic/a
	NfnaOVYB8lQYoa1cpe8Vn8rhOAAAeUyxyZiSjMN+AwmUsLloxwX0m2wVQkbIAlXz/HtnSDuY7uX
	3lgMcAtGXWDcjBcOEzWzKEWQ4PT4CwqvLtrmPV2ClOHkptRkh+JldQaPWUP6oPiPVjXVMG/VZaX
	T7+I+cnoFZm+06aHFTq515JLoB2EKhZgy+06MfTovAls05wE29LSsE6OxUdmAU6QqydOS2zfedA
	B8Pkg14w6BqO8fIU5WRd007z5O/8W+wpApI92XRa71O4hug/W+CtpYBil7OcDU/VxwE5liiUEeK
	o9AWyAICFl2Rhu3WHpQ7/xPFBwTvve7ZpYWumPD37buvN6FwlDTmRQ5LN5JP+kPvtfNwaTxDesh
	7K60NoprK5bYPwGQ7Xd1bVBrl9I+5VRYeCwEpe01fqXDFBEOMS53H5t1E9G3gv27TwkjsdZ7jYa
	JUOZeKbo0yZYF9KNWsjHzxA4ph18/mAX8Kq0cabMaOUY1RZXYyEJbM6xW77pJs=
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr395039405e9.16.1792051325302;
        Thu, 15 Oct 2026 01:02:05 -0700 (PDT)
Message-ID: <7973ea62-3add-44fb-86e9-28c6169ce9a3@suse.com>
Date: Thu, 15 Oct 2026 10:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Add myself as RISC-V reviewer
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1791991262.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@vates.tech>
 <1791991353.8631fc262581453bbf619ec5b2062170.1a13b020f670008425@vates.tech>
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
In-Reply-To: <1791991353.8631fc262581453bbf619ec5b2062170.1a13b020f670008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1792051326-F02992AC-55556319/10/78276251493
X-purgate-type: spam
X-purgate-size: 155

On 14.10.2026 17:22, Baptiste Le Duc wrote:
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


