Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B78C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:34:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405086.1638639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eY1-0005sI-0Q; Wed, 02 Sep 2026 06:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405086.1638639; Wed, 02 Sep 2026 06:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eY0-0005sB-U9; Wed, 02 Sep 2026 06:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1405086;
 Wed, 02 Sep 2026 06:34:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eXz-0005s1-Lp
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:34:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eXy-005yX5-Uv
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:34:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c35d-2eae-0a2a0a5409dd-0a2a45038600-26
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:34:10 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c362-fae8-0a2a45030019-d1558031d141-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:34:10 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so6587415e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:34:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e72df2sm4547374f8f.1.2026.09.01.23.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:34:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788330850; x=1788935650; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=24jTXd7IeCDXlRGfWEqjcNP/1rsnFx4k/2yK1e1bOdo=;
        b=XiNITGlNNMzwI9V4myjEXTeVytpYgVBGDf8wNIEA3MP9Q6G9oqV/xN0czzAQzw1279
         5zKhXPOkygQpEEnLbiH9s6iPRsNW6g5e8doaMZwdkeTnAlXNhW4dgPcYQuIAI86/APEP
         BwFQ5lMgg4dCdTyk5r9MPTeCPFmTbz5N9c5zDdB+UsyFolJBf1OOoCMHZgLI/0lNN8XA
         ULyj7FuFmf90OSWCimahWPuqNlQ0u0hCwoSWta5EHv065+2//SWv3jU905fIkfKOQk+S
         +tmbBeA7LCYeQN6sUi/tMrvr0gd4MkW7CHeSR7ht3AdQh8ibtJy9ku2pFefvoaRImXTY
         /v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330850; x=1788935650;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=24jTXd7IeCDXlRGfWEqjcNP/1rsnFx4k/2yK1e1bOdo=;
        b=jdbVrp3kotS7d0z+pGnkxxeFOsVdXI6SSEHJEtAZZ9kblRb9uYPf+BSlnBg6LXhd1f
         +3dMu5LnJcPIS+gKssvymT0sJ5/W1R2V47rZzgid+cvahYurL3L6+OSSIaR6+YFFIzlh
         2z+ICqb3lEVVNN72v2xWIehfCuLL4Qi0AhA5emgoJ5cxxeiA4qcCix4AHXZMdO0zD0XN
         8vgrTSdkftTLao9DWYr6kwez0ZTq1BicyM//tC0oXZj3e9xwnZ9Sz6znG8knceuYad1A
         3svvFjFGMLcY2jva7jCX77qRkm+OSekLzUFxsJRBdcgOLzrqpbLyKFj06unarhDyFF7D
         0dCQ==
X-Gm-Message-State: AFuF++lU/U/dj417AUSAZsBcE3yzpwkAsPnlBlkPTTOSCaTLhWmaA+fD
	TXsXisCyf7N2bejLEFkLK8m1/vDQjgPA54wFBfrdpC/N9vY3J98bIyyonMcHAUEr8xiHmF1xEoY
	2sA+RNw==
X-Gm-Gg: AR+sD11RjT578q7FKMNbEt3FgJN4zY/S3QMZ6yWwHBub8IrD4AdGY67rO3rXMZM2f3m
	97Opq7J41gG8gxbb1/gODbbGD96q4xnSOt11TjEOuNPrDQa77T4r3eFivjufCz7vKEWoca/LfAp
	x+NqXUE/9vVjAdDzLDkvcxgAlXcnJJmn8W30+G4te9Q8nj4w+EuQ1WkxLnsIPizeQR20FrzlhDw
	uIuyGNFyON9aqHmDEGBntCKElQA+aDPjj+8pGMR3C6mcKvrLrLtDFR4ph4LaZdvOu2Pl/Cira0A
	9/ZMX6501VSxoQQhtAsTkQXHQgvGQCudPypXje2i//r3f5sSSlUnzqG0xBzC7giMdnbVSHeLca5
	KbQT78n7BAoS//LzSoXHLKTULjiMYcTJgHOZhwuQZ5e4uS6CJ3z5vzRINDHfHtFa2tX6fXopXLv
	XJpWClYpehd+HfBN0DmnCcpfoPwNQAElSnCcxoQsDs32O8y/nMkP67bjSuY6BPVV+x5aHxpuyPI
	0PscEqAu+an7Xjfe7N8/EPZqDCjNEwZIV9dou/MsioIjmBqVQBQlerQUUiEpcU=
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr48448965e9.9.1788330850372;
        Tue, 01 Sep 2026 23:34:10 -0700 (PDT)
Message-ID: <f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com>
Date: Wed, 2 Sep 2026 08:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788330850-756834E9-659EB4D3/0/0
X-purgate-type: clean
X-purgate-size: 1741

Outside of drivers/acpi/tables/ (which is excluded from Eclair reporting
for dubious reasons), arch/arm/acpi/domain_build.c is the only user of
ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
introducing a "const" variant of ACPI_CAST_PTR(), and at the expense of
altering an imported file.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/acpi/acmacros.h
+++ b/xen/include/acpi/acmacros.h
@@ -103,6 +103,7 @@
  * Pointer manipulation
  */
 #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
+#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uintptr_t) (p))
 #define ACPI_CAST_INDIRECT_PTR(t, p)    ((t **) (acpi_uintptr_t) (p))
 #define ACPI_ADD_PTR(t,a,b)             ACPI_CAST_PTR (t, (ACPI_CAST_PTR (u8,(a)) + (acpi_native_uint)(b)))
 #define ACPI_PTR_DIFF(a,b)              (acpi_native_uint) (ACPI_CAST_PTR (u8,(a)) - ACPI_CAST_PTR (u8,(b)))
@@ -116,9 +117,12 @@
 #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
 
 #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
-#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (u32,(a)) == *ACPI_CAST_PTR (u32,(b)))
+#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_CPTR (u32, a) == \
+                                         *ACPI_CAST_CPTR (u32, b))
 #else
-#define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (char,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
+#define ACPI_COMPARE_NAME(a, b)         (!ACPI_STRNCMP (ACPI_CAST_CPTR (char, a), \
+                                                        ACPI_CAST_CPTR (char, b), \
+                                                        ACPI_NAME_SIZE))
 #endif
 
 /*


