Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8482C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413013.1643302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HvI-0007si-22; Wed, 09 Sep 2026 13:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413013.1643302; Wed, 09 Sep 2026 13:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HvH-0007sZ-Vf; Wed, 09 Sep 2026 13:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1413013;
 Wed, 09 Sep 2026 13:01:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4HvG-0007rs-6S
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:01:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HvF-005AXD-JE
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:01:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15887-2eae-0a2a0a5409dd-0a2a4505b5de-44
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:01:05 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15891-4cb1-0a2a45050019-d155dd36d5a1-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:01:05 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so4308877f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 06:01:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4859162f354sm36448884f8f.20.2026.09.09.06.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:01:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1788958865; x=1789563665; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RIlpRmcgmO+OHiE8JCj69D3pFRhEmMDX/T6up7aFl3o=;
        b=MJXRQgADLxW7XGDeadnxnsR+6jrttTbdcOkAPL/BfERs684KpfF1GDp4LaH6FptC+Z
         9eyKo8rQv02Rev8qhsoAHyJKW+gJHKtWVoEBsB/oTfj6rGtSFd9ei2pf+wH5znz2RSIX
         DPqakSKhC9+MRFyQOtyg5HjmzpPfG7OIzUj5Q8bZLjLc04g4nBHl9ZCPMzbgkNi3soCh
         BIP1wrU6DkeUQ9+r7IB9wUbaAWCOr2UQVqkRt2qmVSX235zzqSlfDpnRvoOcX9q6CJZe
         MZ86O4lcpP8uVKQZWDqoeq2fm7VFoQBt8qfxcPxn3eJ5FekVp6lG7wIlDFWu12lRjuUE
         uVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958865; x=1789563665;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RIlpRmcgmO+OHiE8JCj69D3pFRhEmMDX/T6up7aFl3o=;
        b=XzCLUgistFGxUWFA0ovMWbZDjw5FbTIaNutQtCLy5BCX6CTmdH4bLh8IBfNI/1AGBw
         oLDwwrAj5VR398VdbOtuxu/NieWNQmPlk5W6jOU8vhPHrfPcCZfxTxbQCm2rasCMdi3e
         1zn004++PwjgC/m3It+plVvTGHfd7MXANizyjc7f3FT1ocm+OBf3bjdcTeS/kqR+jwuG
         U29LS1aIrF3eQQqEocRJFD4IbNqT6P9MQTZPUR2hoFC4JPZMeOXBVpMq0HQX/REbJrV5
         DvEzB+TPsRUTQ+1uSNxZw6M1KxBc818XBbITVrK1/TSuV1K4RQo7r3OuPY+bJ1/g/63r
         AHww==
X-Gm-Message-State: AFuF++mB13+RPpGEL1pSERPbnT42B0zAk+Uey4EjltVNCbVi/+kOAOY7
	xYX0pcmWWKQoQHh5lwh1+J1cmoLDE13PedQIGHBioYytXpSb7Si3/HnYoCqz9nT2CNWplbZIoGU
	YWK/nHg==
X-Gm-Gg: AYBFou2s0NlvcYpcNINXm/wNstmxm9tHuDwO/OMgKQmG+uUGbFWfkI+SPKzHFce8sBs
	/2prFGURtBcvJr8szR4B/zbB0MFWVcct2V24UryvFyEJyUXl+9z2wKcwTG+pmiliTFncLdEE2DE
	Gr5nOBh3sr/1RwUrOsRu8VT3v86ucgmqGZSsq+DWwl4aTvrK8mLpc9dk1+J9948vOefg4gXMogT
	7PxwUe2RdWPwIuF60p0DYVipFrFOIPnxkXtTdG18oSFeYDBcHvobqAMhYi+oRB1UbJ/jTRF2Q66
	MGtDEldddofudLIPT1g/zQo1mF+owz9LQLrxUxypoLvx9Y3bAHLS6HrI962CcCHz+kUiiK6oHrS
	x+HbPeRXWBPXtO0cPuH0pzg/9cUsNOaO95fFwGPoUlIDSUaL+vriaeDG5fDVz+zq9wElpy37pGy
	zhdrsZ2p1h86ctXbDVvYU8RJnwjLjhaPa0i/op+J/qOY5lZWH+X2RBAmdAiTPppFVgjrvy72cGo
	VLmGoy/PTTyiTchBtR5KlEeDu2MxGvd6J9M+S4RUKuHjLwkz1G7XljfcCn5zWA=
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr39548042f8f.21.1788958864913;
        Wed, 09 Sep 2026 06:01:04 -0700 (PDT)
Message-ID: <08038aa9-6902-4070-b49c-0a9ff113c786@suse.com>
Date: Wed, 9 Sep 2026 15:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] x86/Viridian: annotate Eclair false-positives for rule
 18.2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
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
In-Reply-To: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788958865-F4EA12A1-AA17D865/0/0
X-purgate-type: clean
X-purgate-size: 1863

"Subtraction between pointers shall only be applied to pointers that
address elements of the same array" is not violated here: start_stimer()
is only ever passed a sane argument, and stimer_expire() is either called
from start_stimer() (using its parameter as argument) or as a callback,
where a sane callback argument is also guaranteed to be set up.

Suggested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As per Nicola Eclair 16.0.0 has this fixed.

--- a/docs/misra/false-positive-eclair.json
+++ b/docs/misra/false-positive-eclair.json
@@ -10,6 +10,13 @@
         },
         {
             "id": "SAF-1-false-positive-eclair",
+            "violation-id": "MC3A2.R18.2",
+            "tool-version": "3.14.0",
+            "name": "Rule 18.2: pointer subtraction",
+            "text": "Viridian stimer index calculations use sane pointers"
+        },
+        {
+            "id": "SAF-2-false-positive-eclair",
             "violation-id": "",
             "tool-version": "",
             "name": "Sentinel",
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -136,6 +136,7 @@ static void cf_check stimer_expire(void
     struct viridian_stimer *vs = data;
     struct vcpu *v = vs->v;
     struct viridian_vcpu *vv = v->arch.hvm.viridian;
+    /* SAF-1-false-positive-eclair vs is always sane */
     unsigned int stimerx = vs - &vv->stimer[0];
 
     set_bit(stimerx, &vv->stimer_pending);
@@ -146,6 +147,7 @@ static void start_stimer(struct viridian
 {
     const struct vcpu *v = vs->v;
     struct viridian_vcpu *vv = v->arch.hvm.viridian;
+    /* SAF-1-false-positive-eclair vs is always sane */
     unsigned int stimerx = vs - &vv->stimer[0];
     int64_t now = time_ref_count(v->domain);
     int64_t expiration;


