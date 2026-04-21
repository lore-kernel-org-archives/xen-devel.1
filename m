Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81062F327C4
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 08:36:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288610.1568861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6ak-0004uI-RM; Tue, 21 Apr 2026 08:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288610.1568861; Tue, 21 Apr 2026 08:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6ak-0004uB-OS; Tue, 21 Apr 2026 08:36:22 +0000
Received: by outflank-mailman (input) for mailman id 1288610;
 Tue, 21 Apr 2026 08:36:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6aj-0004u5-TI
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:36:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6aj-00BJVz-9u
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:36:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73705-2eae-0a2a0a5409dd-0a2a450cbd3c-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:36:21 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73705-62f1-0a2a450c0019-d155802eb9fc-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:36:21 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48374014a77so50749835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:36:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cc7b2efsm76257125e9.0.2026.04.21.01.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:36:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776760581; x=1777365381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JcsTqVPD6BC9mNfcL3urUViUPyyUHkw/w1xj1kJSNqQ=;
        b=BHQ/lt5bHLmxaDBJnXcARJvQDr2JTd2HY25nxfJU+It1y9Ksz0/lqHwMLv7n6iDLTX
         hekns+4icwOHV1U4UWIW9WQC2Z/5iVYa20EHJupe9Roe24GaCBz2T2YPw2UkW5EfNIdQ
         VUlC4v0Z3DE99gc63cMqS5+hhiEh27aTM8LNKJLUKWuRMwELA/hqOETH8UuRbxxb9neV
         ktYvy7DAeutPnbX+0pmfIgDJYTDs2oizvda9NIvRx73UyuWUyuQHLzkto7Py7n6KRWNT
         HroxigPr/jlOWJWbO+toRnFnZsEebuXXYckmAgCOnDzVSLaQOFOrebBHJoYQgsJObRqU
         ISQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760581; x=1777365381;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcsTqVPD6BC9mNfcL3urUViUPyyUHkw/w1xj1kJSNqQ=;
        b=iCHLlIZFpJs9wflr6VaTaLsKwJ+U21hq+KDqQB5b4hWA7P7gRLjxq7pRpAhFVWycNf
         gd8DXxynKfzN9nUHhQ7HWFG7/GPR0cF/hOL5Wws9DcnfTsZccuF9II+selALbHfHi7QT
         mi3u2KpC66tngo3wb0yMNl+zI+KKy3g04saAu3tAsUroSCigcBB+s1Twcl7pLIaXKFwE
         3MkS152r5+ho+88PC+4tS00HD+a5Ny8A3ibG15Mqwl919fGMiNMWJPbOUmun2mMGfAZT
         JuuZMirp4pxv66gt3dmzUBd1zDSN1kIVETwqisJFTYj/KPffx5mym3girq6Xv6mSB5sG
         Zo+A==
X-Gm-Message-State: AOJu0YxMXYlrdvndYfL9IsZiERuhB/ftlxNU2CxYCwUaiDJdl4FB2eIe
	6wk6OZsjzSWxxAPcXKBK8OJSQQDrzJCXSGoQgFriVPQzwH40vGAjW/2Aq2388X9L8AAle55nL3j
	tS0Qu+Q==
X-Gm-Gg: AeBDiesfoO7yJp/94RZ1JUs6/HXlnNBngEcGEsPuPtwAd7vOdF+Soo8kQGGwdS6tuhJ
	b8mpSFP/i0wef4Ld6oHsgmeud/20kNmnOQ7jj2u5SYVcPSSNTW1HX0dpNrjFQ+V5ANF0JyFFJcT
	OdSLP2JJZybJtkrNOpM2SzkYl8RFGGJiGp+n+OlpYzWbmzq0JL9dmZW0ADZobVHNMkjnUfW0Nhn
	Q/TrUwlC8xaIsREBgQCseTMUIv7QZmI6LnhDwHv21g3Qlcc+XyvQ5iXu+vp3I+BrnkCuqVl8zGS
	n/7XM8Q4p5zMRrW2qboLJwnnPnd5iosgkE3nwgNJm6r08eEW2kneYw9hWhzgM5XhApVto1dtArK
	Av+6EoOPueKFfe7WGwXOFM9XaCEbXrIP+LbMGKkEGL5mrAocdevWn9Y57Jt+xplylNdrWKIUpE9
	c5gTkZutwJda8UK7Po1DMGIiJmYwjkavOOfzwN9NOL8+6aCLkxMXsZnJLTwc8C4EjGD/qgzHUTL
	2GaO2tu9XyX2c0zGxoy00lTLA==
X-Received: by 2002:a05:600c:c0c8:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-488fb73d9ffmr192728195e9.5.1776760580599;
        Tue, 21 Apr 2026 01:36:20 -0700 (PDT)
Message-ID: <a0a5ac06-620b-4ad1-a664-546db82627ce@suse.com>
Date: Tue, 21 Apr 2026 10:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] include: move KB() etc to macros.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
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
In-Reply-To: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776760581-6E169CF5-EE00B4F2/0/0
X-purgate-type: clean
X-purgate-size: 1125

Allow them to be used by build tools which don't include config.h. (They
also don't really fit into config.h, as there's nothing "configuration"
related about them.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/efi/relocs-dummy.S
+++ b/xen/arch/x86/efi/relocs-dummy.S
@@ -1,3 +1,4 @@
+#include <xen/macros.h>
 
 	.section .reloc, "a", @progbits
 	.balign 4
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -82,10 +82,6 @@
 #define __force
 #define __bitwise
 
-#define KB(_kb)     (_AC(_kb, ULL) << 10)
-#define MB(_mb)     (_AC(_mb, ULL) << 20)
-#define GB(_gb)     (_AC(_gb, ULL) << 30)
-
 /* allow existing code to work with Kconfig variable */
 #define NR_CPUS CONFIG_NR_CPUS
 
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -38,6 +38,10 @@
 #define __STR(...) #__VA_ARGS__
 #define STR(...) __STR(__VA_ARGS__)
 
+#define KB(_kb)     (_AC(_kb, ULL) << 10)
+#define MB(_mb)     (_AC(_mb, ULL) << 20)
+#define GB(_gb)     (_AC(_gb, ULL) << 30)
+
 #ifndef __ASSEMBLER__
 
 /* Force a compilation error if condition is true */


