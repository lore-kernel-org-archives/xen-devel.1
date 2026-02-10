Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD130EA3F3C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Feb 2026 10:51:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1226224.1532755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplL9-0004Fi-VW; Tue, 10 Feb 2026 10:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226224.1532755; Tue, 10 Feb 2026 10:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplL9-0004Fb-Sv; Tue, 10 Feb 2026 10:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1226224;
 Tue, 10 Feb 2026 10:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vplL8-0004FT-Ui
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:51:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 747e9ffd-066e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:51:29 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4834826e555so16109755e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 02:51:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e50casm48658195e9.8.2026.02.10.02.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 02:51:28 -0800 (PST)
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
X-Inumbo-ID: 747e9ffd-066e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770720689; x=1771325489; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xpS7LLOGHKjrE+PB+/Sww3kE6fNrQyCx1OCS/07LOpA=;
        b=QOZ8ZG2Qg7lti5Z+pTCQQqdLRdzXM7/UsKhpZMI6JLYvo1zTCbAtBh9Zlfa0xJPB2j
         ZXMlN+/DRj/vB18NW+kQ2hEVKi7kHNe1yvNvIjOdVrVI5CaITs4E45/Nku2F7Sq8VHYo
         ibSpEu81QucOss1K4IJBeOfm3NI/Vl5jXfZ8xa5t1/40DK0+66xpbxePEeco9t9PgFxL
         fqeLTKXCIuFimjhs6XlTmdyEF6KSC12lo1FFQvtI7cTjVE5MjFWIEsBN7PHRVjO3kOT6
         K6E9nUIYjl4S+HY2QuDHuMtMWiIsiYTZHFEoslx74hfNjh104zeqSLdIB4RYzQCeQ2nI
         cP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720689; x=1771325489;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpS7LLOGHKjrE+PB+/Sww3kE6fNrQyCx1OCS/07LOpA=;
        b=Xv2ahtXvc2sZR4S8lRgTvPZpihQaoLeo9/GZyFycdX3pfJzBlM3fs42JKEdD6mFwsT
         JOCrHrpQuvJNvNLElF+gBMNQrXNgXzLjeX6+lmRcUmlgCpFnMFq8RdoOVSiOt/SVjii5
         IZo+qW3clJ1dhuZN7xpocCx9SdJXWvxfyjUvEtMLllGNAzZc2iPrSGrGCgOTZ47q38/Y
         lIZdlH3Jxxvx2JM9v/3pj+iQQlq3keoUVL1/QBy4TNcUYjnSXm6P/UPOi53FVC1mYRq7
         +ypwYPI9XY1YjsW9S1RhazHXhzOoqj5aQccC3pbWKNV+z86DzAliCSMZnyTDnHx/jBPP
         WgTA==
X-Gm-Message-State: AOJu0Yyzd9+673XhTgpa30cELP+cHz2438YsP3NZJhvLluc0hOzGZQcv
	aHGmnDH3IsCRxWmEYuLB2OZjnD7nsyb76O71KVQOd0+BSQvnxexPZAFu90hFBPs4ST2OUnFrCVM
	+1cQ=
X-Gm-Gg: AZuq6aJ9tWSVHGFdtOkAsN1StFoAg9yFoakx9HTwRJsUzZXDrDe1qZr0qTAeZvjL+8V
	jvsA+Vzj/JlB9VC8P+IZ6X4tcZ/KdAIKlTz/2R4/wKgCFdxIqfGlWyCLYZA6xMXDgV6aJ52eGX+
	jnHPvG3M9bYV/OEJtePKQPl0vkt6UNkZat9ABEVGrJagMhFfBudU3PkDIErf4g8z9IifOLQTVs0
	7SLJRvavrtV92YvLZHmfRrpn0w/Pl3t2VwFhVroB4Pyk12cQY8Jdy81WVsG17j/mr6SgyhaHRdN
	fdB2WnUx11V5WKZktKObofLEN6G0ELagMdcsubjZXNoQl3UAsWc2cDNXaKmAlTjC3sW8vhJoPgu
	6jUKHOe5gmg/HBIddC7K6rOSCnqU0fIvijGjHrkuOEUYoAXM0HIzoP80ABSASFtf4cTEAjfIlpZ
	xk0zfFLag87SpDheyiToUVorQn7qVSc6KTt2yfYXvzwczcHPBFTHmOrKcusPlGwa3m39D12TPvj
	PXJqhvfK1EuKRdiIRg6iBSJJg==
X-Received: by 2002:a05:600c:4fc8:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-483201db08cmr215602275e9.2.1770720688896;
        Tue, 10 Feb 2026 02:51:28 -0800 (PST)
Message-ID: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
Date: Tue, 10 Feb 2026 11:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/5] (v)PCI: extended capability handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a follow-on to 'vPCI: avoid bogus "overlap in extended cap list"
warnings', addressing further issues noted there.

v4: Three new patches and some other re-work. See individual patches.

1: x86/PCI: avoid re-evaluation of extended config space accessibility
2: vPCI: introduce private header
3: vPCI: move vpci_init_capabilities() to a separate file
4: vPCI: move capability-list init
5: vPCI: re-init extended-capabilities when MMCFG availability changed

Jan

