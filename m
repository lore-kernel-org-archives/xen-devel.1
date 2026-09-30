Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC2CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:44:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437106.1655885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsjC-0004xx-0i; Wed, 30 Sep 2026 11:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437106.1655885; Wed, 30 Sep 2026 11:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsjB-0004xm-U3; Wed, 30 Sep 2026 11:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1437106;
 Wed, 30 Sep 2026 11:44:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsjB-0004wP-Hl
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:44:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsjA-00FryG-Ul
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:44:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5ff-e002-0a2a0a5209dd-0a2a450aa9f8-6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:44:00 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf600-f2d2-0a2a450a0019-4a7de18cdace-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:44:00 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a006bb267eso16940505e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:44:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174d5191sm51546025e9.3.2026.09.30.04.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:44:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1790768640; x=1791373440; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CaPadgh2O99L3eeg/IcRZU0pQ+o8BRuKTX7oPZ2SV2Q=;
        b=GNDiCFfCUrqU+ifR5dN6Vl0Zute+FKL/96lQTyI95e/IlpJQsTcydPxUJqi1KB3Gbn
         dnLAn4qEXbYas6MiZE65n56X5E6tx/JQct6CrX0TvWNRWI4OKbaxA6sE3961hKpIKO4S
         A1f+xGr9d5UGGEy9UB0EjFs7vCqQGMwg8mjJuYLS7TOLY/ZCKiBmJaoiOhjH7Rh0T5GR
         84RCRBeAUesc5kxElTaAtGpSA5gRgB2ol06TbFBwsDew0zqm/kMzHfvCk33klOdMLXoh
         RUcjKWkBnVBRc1/gFHv9Y314HyHz+EmbqfcZtQlpVQfM4THuvuQyFOlCYUoLbu51nzra
         EUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768640; x=1791373440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CaPadgh2O99L3eeg/IcRZU0pQ+o8BRuKTX7oPZ2SV2Q=;
        b=I5QS0Aoh9cIeI7HBKCha8qBrLjEllM+AI3QG7F2k+U60NcEnZgJgj4EdLFDULyb7/b
         WgGu0jb0HvwAJN35qje8qjoD46OHgMaZhHecsXRiEVCGCz0KOKGz/kHbUlXDbFL9rsWu
         KmQxuzOKa/kSZQT7LACH8ckS+ptYvNNH/N2FRRulskh3zqhyOU+V4qm/C9NTFMnWbqw3
         OJvqNr4l8eR/RpdjQVc2tk/FSZfHaI7Cb5yLnZz5dz2rJOUJHXiuMKkcwOMQFRKZAMLM
         MOC3LF8Ch37OChGCpth5aqtqIEDXqXX4Jlmw2ZcVmWUp85rS/DEhaKT0VqK9i+I00iIG
         s6gQ==
X-Gm-Message-State: AFuF++m6Zo5fFWBx8nZPuD4ymIKOyRskhSIWYH9riEaBxLox6njgirDm
	4c+m4qA/UgmlrLgh7ei73MpmbYm9LFhHzsbT+MVcFGbw5hmkHNcP+AbBVkiqq9VCW77KVQ49ekN
	uhl8YrA==
X-Gm-Gg: AYBFou0xSidvjgTBA+1Y/PNG4bbVDk/kZ4H2MTxh0ui6higpwQphEnxrJNFtbqqeBDC
	LrG2cE9o6eqi6+DgPMUiiWz00NJ4vmlUTpF/yIviBwF9KR1u/Qssb1AA65ZeWpzoV3qbWLlrGBg
	3i5gFzZ634wB/nCRduNVXD2+ZzBTs2uAuOpigQhzrXM0jobkE+41KsPdvRs0XhfobI1bmjkaWqS
	PyNLTClNNW6dvtdu245A1KLLjDbtyvTvL/kI+16asL6zMI5aKWfS1Do+8FQDD+kK33mCihU8DZZ
	lIIO7XGL2rv98V3gFnlYqRB/ossduOKJAatepQLf1EOYV/yhvJhvWzEKFic1rN4we/2G3wHgE03
	H7mOeTxV19nKp2nM6Fw3+7Osd6FUPK4XQNqkQAlcjpfPoxyJ/v37eBotRyS5MiF8k9Ts8k/Bkap
	RIZr5HeUEUA5b5VtdTidWu71CIvuQZS6Yu7xKzbrbnzvG4n0zS2zq9HprSCdSKbk4V/k6Bh3CKX
	yFfb8qH3Hs/V1g4oB6K8/cwJVZsJ1IMtOmFKPvhhEnQPkUk2/SYZLU3ZAQhZxQ=
X-Received: by 2002:a05:600c:4e41:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-4a01ad901d4mr21407565e9.2.1790768640413;
        Wed, 30 Sep 2026 04:44:00 -0700 (PDT)
Message-ID: <3f19c5e9-d8d2-4752-99a1-b5115c3c862b@suse.com>
Date: Wed, 30 Sep 2026 13:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/5] x86/vMSI: avoid "goto" in msixtbl_pt_unregister()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
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
In-Reply-To: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790768640-510C9CFC-AA2AAE09/10/78276251493
X-purgate-type: spam
X-purgate-size: 1611

"goto" can be helpful in certain situations, yet where easily possible I
think it's better to avoid its use. With the re-arrangement also restrict
the scop of two of the local variables, and add const to one of them.

No functional changed intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -688,8 +688,6 @@ void msixtbl_pt_unregister(struct domain
 {
     struct irq_desc *irqd;
     struct msi_desc *msi_desc;
-    struct pci_dev *pdev;
-    struct msixtbl_entry *entry;
 
     ASSERT(rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
@@ -702,22 +700,19 @@ void msixtbl_pt_unregister(struct domain
         return;
 
     msi_desc = irqd->msi_desc;
-    if ( !msi_desc )
-        goto out;
-
-    pdev = msi_desc->dev;
-
-    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
-        if ( pdev == entry->pdev )
-            goto found;
-
-out:
-    spin_unlock_irq(&irqd->lock);
-    return;
-
-found:
-    if ( atomic_dec_and_test(&entry->refcnt) )
-        del_msixtbl_entry(entry);
+    if ( msi_desc )
+    {
+        const struct pci_dev *pdev = msi_desc->dev;
+        struct msixtbl_entry *entry;
+
+        list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
+            if ( pdev == entry->pdev )
+            {
+                if ( atomic_dec_and_test(&entry->refcnt) )
+                    del_msixtbl_entry(entry);
+                break;
+            }
+    }
 
     spin_unlock_irq(&irqd->lock);
 }


