Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E25C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:51:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392639.1631602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt3e-000193-PU; Mon, 17 Aug 2026 08:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392639.1631602; Mon, 17 Aug 2026 08:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt3e-00018w-Mx; Mon, 17 Aug 2026 08:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1392639;
 Mon, 17 Aug 2026 08:51:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt3d-00018o-Ny
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt3c-009PrU-Nk
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:51:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cb69-8faa-0a2a0a5109dd-0a2a4501dc7a-42
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:51:00 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cb74-5984-0a2a45010019-d155dd2fdde4-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:51:00 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-482938466a7so1803982f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:51:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a315bfsm2197432f8f.1.2026.08.17.01.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:50:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956660; x=1787561460; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eZ6SZ4ba4nhrBe95M28NmTJI8Qq1jIqB20FYpZGCsQQ=;
        b=e2nFJh2dXohPstzE60uVMhHMmtscwe76LwHEuByRI2K7JsoBnm+m38He3fnBPwUL4n
         tNOLKchVbISjav9s4qrO4YJi23n+k2DjelKInWBhbF3mz4lPGYIl5ZbhP6C+eqiYF6+2
         HOIb599NllZktUytTV1RCr87w4Kku5SGlpHA9JIo98a/3sjqC77t0Pc/VePGSdYoLw8h
         kVh5Qr9nInWuhjj/vloC+JZOajj9lJcIHZHi5MxG5P9AiLdl5LNqRaIEdztXB9/2nKX1
         qv1cah6M9/BMypMKQMPMUS0vFAVmtwIdz7CZuksDQdOfc1kHMdmVO1Pj7kZBHG6VXCVK
         GnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956660; x=1787561460;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eZ6SZ4ba4nhrBe95M28NmTJI8Qq1jIqB20FYpZGCsQQ=;
        b=r0DbxGitXgUBLSQIhzkJBH/nC+DR08x9D8lx5lueRwvKl+obgryb3xFaamy8z/4/W8
         AyqPyKfbmgHFeh8kkUM7X4FDdEdWQ+ZhLwro0xe27H0shTJZRzIIfx4b2U0p/Qybcbjm
         9E0EU4EkvIxMq2yqZt+EPXpQ8T5EoaoG/kYwpCovCkPhWvc/+CwhIowDD1CQe/54RRyL
         AF6yqN2m4ZkBmkDeJd2efYFM4eMw3PmAM8edGXlm9Q/ljcFkhJjUIuv8m+TPQ6egOBGx
         9smnbNSdXEUKprzwFuUsZg26bvIBD6L0Z8J1jH2KPEnjSap3tvkDRozlNpkEUOHys7ko
         nbDg==
X-Gm-Message-State: AOJu0YwVYEbSIg5bPkMMYuzcq6O3gn7zwS5H0/WTbPHtEMC/cL9Lb8Bk
	ZYCDvKtbM9897Vq1K/yelEVPRLMFkdK/QKvl7abwAa7HZQiSrlxnlj2KYP0Suk0bNQJSxfa7VQr
	Nfr3UQw==
X-Gm-Gg: AR+sD12h7wY3sH3JDlXbOnCcKhRKeDHTqgfzl/rvtcrCBYKsydRCy/+t1yL1+RpFTnQ
	NvGm6CV7YDFmi31CO8obVCMmAe7HN3+jhypPP1n7UjcA0dRpUIK3mQDCPgN28scm3Rc5m/bPQbg
	HyGQ2Osc7qYFFGn23DiaccN1qbZenG6MTJOcqj0GkHD8h+zB4otgH4nkBSgTGMBBLNBTK9eqP/v
	nLZuPFAfivjSIekbikiEirXzJrs4jtXdog+ITra16mhfB8yUYlScq24seakrYFGy72vJIArqKdu
	fsbEo22z+m/+NtAhzuoLc70Duxxhm6APE4YXHhmtg3zYvcoRMabB/9GoQ2NIg9w0k86AcEB5wy8
	Fi9ZEnTgNXPnfQGq0D8gMANGe4mQYmSkXq0aXxUhIuPbXIyYgtGm0L3XYMYEUDRNY5MUof8SQeV
	enSqvYayzgfIrhawscxqnspi83RTAg5LEtLrveJmV3NkLPEP1KLj8enw8Usm+T0zuYhdDKjoauU
	SZMi9CGHsH7LOEfwIcVCY7d77xwNGODFGzgW3wlZrr1y2nwTEDgJrSyjXhGnvQ=
X-Received: by 2002:a05:6000:29da:b0:47f:c648:e274 with SMTP id ffacd0b85a97d-4816070be36mr27859706f8f.5.1786956660114;
        Mon, 17 Aug 2026 01:51:00 -0700 (PDT)
Message-ID: <8df4fd76-2f19-436c-937f-e1cce371bbc5@suse.com>
Date: Mon, 17 Aug 2026 10:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 01/14] XSM: make xsm_default_action() const-correct
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
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
In-Reply-To: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786956660-BFA6E757-E0AC9521/0/0
X-purgate-type: clean
X-purgate-size: 651

To be able to properly use const on dummy hook function parameters, add
const to both domain pointers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2: Split off from Argo patch.

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -76,7 +76,7 @@ void __xsm_action_mismatch_detected(void
 #endif /* CONFIG_XSM */
 
 static always_inline int xsm_default_action(
-    xsm_default_t action, struct domain *src, struct domain *target)
+    xsm_default_t action, const struct domain *src, const struct domain *target)
 {
     switch ( action ) {
     case XSM_HOOK:


