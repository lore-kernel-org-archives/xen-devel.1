Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCCB606A321
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cdyH0+T0
Received: from list by lists.xenproject.org with outflank-mailman.1500906.1696951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVq6q-0004Hx-SQ; Tue, 24 Nov 2026 12:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500906.1696951; Tue, 24 Nov 2026 12:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVq6q-0004Hq-Pm; Tue, 24 Nov 2026 12:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1500906;
 Tue, 24 Nov 2026 12:58:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVq6p-0004Hk-Qz
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:58:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVq6o-008hwO-NF
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:58:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0589fb-8faa-0a2a0a5109dd-0a2a4508bb32-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:58:54 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b058a0d-f659-0a2a45080019-d155dd29e1ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:58:54 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so4248873f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 04:58:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c50sm27544187f8f.37.2026.11.24.04.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 04:58:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795525133; x=1796129933; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MQWJy03iOx7l7eckJdmx/HDYuBYT2YkyFzFC1hnIchs=;
        b=cdyH0+T0a7/jm1yxkBtFM5iIsc+U/ATctwQ1rhDHSXZI8TwJ1pMFXfeJPBb80okLjO
         oc1MHEj34uJL5l7lD6irViuGnPhc4yUb3H/EHkDjaCeI96EQxUM/kS1PWNJrbLuWKB+y
         mPVk0KSsDhtxv2G8NpqjJ21uVBYV7wlZ/0Ltfd1BUCmmrAPlcZgV0xCvqv48k/sYUopI
         nmPckNJ5ZIvRxUSZEieVIfgeJ6K/otQJjNQ99HOmyKGuglBXzRvwKIUFuVNlnWHpGnRE
         iQWxOmhYWMhBBWzQGfzOiOSQyi12Y29zT+WmNoQbff9rHkLOEqUV/BliSO6Vuz0cAHZO
         MoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525133; x=1796129933;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQWJy03iOx7l7eckJdmx/HDYuBYT2YkyFzFC1hnIchs=;
        b=2pkRpxU4x0DsjDrh5fXLxmTblC4j1X3pOyyd2Oy04rN34pr5b0jSOIvzEc1rbuCQsf
         Jn83gTQ2dFBVB8Jnp9tdpp+l/fx6T26G/UnpKlNIVF4OxkrzLgd+gkYFoCkv2piJJTxG
         DUYLqde4sUBgl970n/CfTS89UW7CS0uwb7aC+s514bKhQVe+miKQVKaNnI9y/7rRWku7
         Yaj9SaTsMc60Zz2DHWLsjCO0WTK+k1VExk0zWYfbVzKFDJHXUNHbrii9aJyvAmAZXC/u
         jDVU+O09nER36Hz+TMYcxoRv0dFMWUnXb3bHmk75XEcKTk8ZKtNhwrrQPDiismIe6U7c
         IqEQ==
X-Gm-Message-State: APuU4Z+Vb0ELBsTQLYY7OChsUGfkl4iyTfsV12mJA9Ak7dRlYRnAd2cJ
	DzDfo/vWZ5FPMr56/gGX7kpoo5tLUSvZ/tEUDeMmW9NqcZU6X47HeGM2NKoIdK+pC8GEydLlr38
	pi+ew+g==
X-Gm-Gg: AZFdTZfvfrFuARKN9tgUNqbPF2RX6hyFsT5p6bB1/5I8eanKCofaDQwX59HOrMSerYF
	CNwpmB4n8JUDJ8GlnGPUr/+dv0Mm3OZhgFwr0zy1OV3QrvIABBs2xpIXKnlAtNEEw5lqf7cFaal
	W5vDS/9ikAhwy8yn9kfdTH5HPZHiMsn1T9ctKmfbcMyMTRakCiIoipBBE/nqJ49YQMpjtCnG6b3
	+OJS9PJCih47B40ecSHpaeoeK3BAPPU0wefSQJ7yjaFit2d4B4QsN007o7TT9tOEqM6A/xXyFWF
	HK/2DEQc2VlbzsqMVHd9c17Nv1GcB/r5fRKQ1x1jaEowClmKgEk2DVCIQcWMC11g+/xC3Mp0z9j
	zZhojq2FLYnn2QYXUNxUmvtmGNvM1HBwtsxuZ0pc1BIW/qeJyAgos8woRxvMwEtqaKctqdfvBfS
	t6+/g3BoCQ7Q49CR7VNeGfUZRnLZMWmKU+sSiP63BdgkzSUT1eTaO8JBr9JSn6uJaaA+InPB7Bi
	HlujuLXXYwSnbRI6/6f8P3cLqpPFxh2qn+LA70lk1SLgglr9klKqzV7DgZjWPqmiz1a1sBiimYM
	KSG0VmTaAs0I6mMEr+aYolwkpm2knp0QJUS4l0BpAGatg3z2pycyYqgNX6gXdcek6zUNcwg0u8Q
	lN3U/hNbNtSIC+fIWQKM0+HO0rO1lc7vyTKLVoA==
X-Received: by 2002:a5d:59c3:0:b0:4b5:b60:4814 with SMTP id ffacd0b85a97d-4b50b60487bmr9568808f8f.54.1795525133596;
        Tue, 24 Nov 2026 04:58:53 -0800 (PST)
Message-ID: <a65bdb68-a244-4924-8b0e-b30cf1b9cf24@suse.com>
Date: Tue, 24 Nov 2026 13:58:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI: don't free in-use device instances
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1795525134-CE94287B-D8D5B3E1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2629
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a device is already known, alloc_pdev() will not allocate anything.
Consequently the device should then also not be freed upon encountering
an error (specifically: pci_add_device() dealing with an SR-IOV VF without
known PF).

Fixes: 8fe330a4daf6 ("xen/pci: remove logic catering to adding VF without PF")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Yes, find_pdev() could also be passed sbdf_t, but using bus+devfn better
fits alloc_pdev()'s signature and is also easier in pci_add_device().

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -315,16 +315,27 @@ static void apply_quirks(struct pci_dev
             pdev->ignore_bars = true;
 }
 
-static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
+static struct pci_dev *find_pdev(const struct pci_seg *pseg, uint8_t bus,
+                                 uint8_t devfn)
 {
     struct pci_dev *pdev;
-    unsigned int pos;
-    int rc;
 
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
             return pdev;
 
+    return NULL;
+}
+
+static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
+{
+    struct pci_dev *pdev = find_pdev(pseg, bus, devfn);
+    unsigned int pos;
+    int rc;
+
+    if ( pdev )
+        return pdev;
+
     pdev = xzalloc(struct pci_dev);
     if ( !pdev )
         return NULL;
@@ -669,6 +680,7 @@ int pci_add_device(u16 seg, u8 bus, u8 d
     struct pci_dev *pdev;
     unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
     const char *type;
+    bool fresh = false;
     int ret;
 
     if ( !info )
@@ -690,9 +702,14 @@ int pci_add_device(u16 seg, u8 bus, u8 d
     pseg = alloc_pseg(seg);
     if ( !pseg )
         goto out;
-    pdev = alloc_pdev(pseg, bus, devfn);
+    pdev = find_pdev(pseg, bus, devfn);
     if ( !pdev )
-        goto out;
+    {
+        pdev = alloc_pdev(pseg, bus, devfn);
+        if ( !pdev )
+            goto out;
+        fresh = true;
+    }
 
     pdev->node = node;
 
@@ -711,7 +728,8 @@ int pci_add_device(u16 seg, u8 bus, u8 d
                        "Attempted to add SR-IOV VF %pp without PF %pp\n",
                        &pdev->sbdf,
                        &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn));
-                free_pdev(pseg, pdev);
+                if ( fresh )
+                    free_pdev(pseg, pdev);
                 ret = -ENODEV;
                 goto out;
             }

