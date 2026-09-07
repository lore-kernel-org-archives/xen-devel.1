Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E54C79FA0
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 15:14:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410932.1641736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3b3A-0005z3-8n; Mon, 07 Sep 2026 15:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410932.1641736; Mon, 07 Sep 2026 15:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3b3A-0005yw-5o; Mon, 07 Sep 2026 15:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1410932;
 Mon, 07 Sep 2026 15:14:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3b38-0005yn-6a
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:14:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3b37-00EG8y-9J
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 17:14:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ed4af-e002-0a2a0a5209dd-0a2a450bdb74-38
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:14:21 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ed4cd-b7e8-0a2a450b0019-d155802ddcca-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:14:21 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b965570d7so43383295e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:14:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf755c22esm317860845e9.0.2026.09.07.08.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 08:14:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788794061; x=1789398861; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PMVyM4gT0ULYuoEwe8vmc7r/tdxbG+MESD/ICXqmTCc=;
        b=Wtoj8qUfynTmW/gaPyW9KbUEysi1RuLxubsq71TSqFtS8hA/rmbWhMv9SRG4XX0ubZ
         OtlJR/aQ5NgEwrpKLEM/dnBfYXpRW8usKOo+kMoQ1tKjcJsOG6Gek4ISIi81+PbhcjUD
         EZiVfwOi//05scr1wumZ08jKHz2thZmjS5Qp2DukpMtks9HujxF3zDs4RBoixTq6LgcM
         pWqtveY9hMVWzKK3kHbMNsJ9Vm54vgw0nOCxqmj/KVJcDuePO4Rm0L0W0x822qsCIv5f
         olP9A+geHvf6vnhAk2rlskSex5dtzUYg+bBj+gmQJNhkXomXEaqUQbfHjSoPsmQhUyew
         cmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794061; x=1789398861;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMVyM4gT0ULYuoEwe8vmc7r/tdxbG+MESD/ICXqmTCc=;
        b=pRT7p4O3MKtaKiquQMue7vTb1BrXYFcw0oVutp3JdJ5QSl94KRVLr2rQhRYeRi0dp1
         1+IK7YbxB4THWgTjcE+Y/0Byy5ElkL91BQ8xQwDN6gDKzei7NwJ0r9RB9YU1sAAV/nDT
         uMPRpnyB923cibRZGZgTFF1lyzh0ElvtzSOL/44JPukfrE7uBBItsJwWByJ9UcqBUZBK
         CDn36SlDhFWy8oAyefSkatte7pY+2lc9XNOM9/en21BulhTIWaG8TroNPvUCDqAmr7tl
         50vLHucwdpETGecDiW6RGv8nE09lHI3HuDuECiUYTy0beLAWV6k7S18pSgzmr4waUK3H
         mHpQ==
X-Gm-Message-State: AFuF++nK/Eq8AVl+oYbL6wJueC61OAiD5/VdzwDuTWDgZhxAdFBENqJn
	0k+OSrlYP3ylpgA61MnV5Nxj2SNh5G+jH+F9eCsofBNHzdlA3iNbC5CsWfo3yT0wHIMCSOgNZ1i
	lf0L7iA==
X-Gm-Gg: AYBFou0dAVOFHwKGuApJMsfhwRmUzDP5JRjk17iDwTAxqgZKAKR4MBhbA812qyt+3kg
	4wuT40lmwV5RENhXrcch3Q67KhwowryBBPOSGZcSj42mWssNh5krBGMTXNVg9/usxfHwRCaj2hk
	h56SbILWsN2UJHib8sc+XglfsNWVugrJWyr2jZ58RQrW5PICkXFJPAJ/wwaMNR1L5dptLYC5In6
	WffVhFC1QkFGCprvjjyzYbCC4CmVkYjs/OL+5NUfA+SqFfOYHXRqinxGH29VyV37cxf0r/Ol2mW
	WJlkmCBhDQzaBITy61rd57SOF8mB7ke4/Tj+EGWnNzJ7eQv0WqadnP3YNWIDZgfUF4DB5/T4eOz
	v2SWZAG4gVP9bq851srqcW9Olun1B9vYFmvM/RjBR3LAokTBvPQTLH47RvOU4Gf4H9PuHLRrQoc
	Q9Jd7wt3Vezme5Bk8q41fZ9COUN21j1PJ9kWVVqhuaXBjFKlDFl0v1OrOdGuSVUfK1a9GGrwhsn
	TjOBQ6eGVIf+jrJ4iv0EAT5Z1ca/dND4AQgh6XE2VyvOlyFKzKk
X-Received: by 2002:a05:600c:4fc9:b0:49c:fc6e:8cb9 with SMTP id 5b1f17b1804b1-49cfc6e8e1emr203795765e9.29.1788794060612;
        Mon, 07 Sep 2026 08:14:20 -0700 (PDT)
Message-ID: <4326ea69-572c-4a1a-ba89-147fab55b2d5@suse.com>
Date: Mon, 7 Sep 2026 17:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: don't use alias attribute for compat hypercall stubs
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
X-purgate-ID: tlsNG-42698a/1788794061-19AC09EA-4F87FE96/0/0
X-purgate-type: clean
X-purgate-size: 817

Recent Clang objects to types differing between alias and aliasee. Accept
the unnecessary overhead and make the two compat stubs real functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -27,10 +27,14 @@ int efi_runtime_call(struct xenpf_efi_ru
 
 #ifdef CONFIG_COMPAT
 
-int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
-    __attribute__((__alias__("efi_get_info")));
+int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *info)
+{
+    return -ENOSYS;
+}
 
-int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
-    __attribute__((__alias__("efi_runtime_call")));
+int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *op)
+{
+    return -ENOSYS;
+}
 
 #endif

