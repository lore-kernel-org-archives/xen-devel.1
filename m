Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C68CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448999.1664959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGyd8-0007mR-Nx; Wed, 14 Oct 2026 13:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448999.1664959; Wed, 14 Oct 2026 13:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGyd8-0007mK-Kl; Wed, 14 Oct 2026 13:02:50 +0000
Received: by outflank-mailman (input) for mailman id 1448999;
 Wed, 14 Oct 2026 13:02:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGyd7-0007m2-W1
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:02:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGyd7-00CFKO-8V
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:02:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7d77-2eae-0a2a0a5409dd-0a2a45048820-16
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:02:49 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf7d78-b57f-0a2a45040019-d155dd2ae46e-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:02:48 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b0ef9c76eso371429f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 06:02:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac5265sm12597064f8f.41.2026.10.14.06.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 06:02:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1791982968; x=1792587768; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gMm2a7QNwXZYXz1DEn6YS019avxsFmIWcQ9BJGK0Ao=;
        b=JgpgByf4XX2iTWgRn28KC6AtVRz2fVCJetba/xoBfLDkBc3BePfT+8VUi/Q4dzUKVp
         PymubaPbK95QftOBY62emHoneBK2TMYhpkRERiq7OZYKLndp8aPqElk8IVHMZIMzSTtn
         gO58VqCkFXDOagu7nyyK8aSaCBdaEQb5SYCQ4v+DWaghj3eS4qlPeM+ZIQJzBM5f9paz
         4FqDCePBT4+iTynKD6UXvtY1802Ed0EMvocg326ZZlSnwcXluiEWrou7GTZes45ssfFS
         7DjZmmMLFfPpZlt59xduuLRgLdijxKreK7tC6XRAYUioyOwitlzRPM07e8WbGcg6LAOd
         n5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982968; x=1792587768;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gMm2a7QNwXZYXz1DEn6YS019avxsFmIWcQ9BJGK0Ao=;
        b=xJfAZb90RzcsOx0iTRC3p2Shra11c9knFIb2LjnQypkF/8kA6PDnW7K+Y9e2SGOYtO
         csCavz5lmNIQ/2omMyhM0+FfuzxDNyUsJGuDzrqhSv4qLcesCkHUIYhNb/f95B8bc+hT
         HQRBettOsIajAu49ezd939wWK22eIfExlCWYQ7Hr+o2Zt4R+3b4g0aby2t5XJ+r7nlFo
         ildfOjbrZtTIEPaEIwbq6BThdYxqq/vEKKhwSqHpsm3jpIkZJ2tFYs3f7N+hXycz3HzD
         HroDQFXPwF7ZTGWqg1vH2DRXtgL0qXFkt7ClET1vWYoRYVorFX0N1f6XRt+thxXO+OGQ
         IXsA==
X-Gm-Message-State: AFq9FYJllsIHHTvFJ+krZYYIO+n9XK4VIQUaEsv+6QgMXOvLvGBSElAK
	G4hmuONdgmANgKvqa/QvJSSZX3+WYkOvCzYNl1SZyeBFGQU2U3KMLQ8Zkwmw4///aBXXp9RpJ4o
	RbY/eUQ==
X-Gm-Gg: AYBFou3tPXBMVGFEAfvwg7Kv1FGkhO54T2lWE3SJzbAkQeyt5P9Ko7Uqr2bU62Kba1P
	OC0m7TUvgdI8gWfvPP+YjckJuE7YjYmQr4lK+z7N26pyWJhqG7KPbCcxYcIitcGc5pdMHZ9Vyv8
	mYEQW9OUaVIFPG9/RThjw3aF3ylAg1iIzkqe/ydIdZaKKakxtjkEG1+RLhpGsXBSf1g3xvqfUnD
	h0DqyqWVpwqSkUnOOjSpvkDQ72XdBXhS5dkAFtzeBkwGmMLg2zihA13vLAxoGSt9ZsIF7hmiJ80
	BBWEfwszNxcXcDPy4+0+Edsvm5Kn98lChPKpAZTlc2e1WjkMHPHsUVw8vphNXtFepaKHLtXTstj
	en/otj5ixVXERerban18SiL8VQcpO/1lzhGIdZ5H9um/aNDOLjmCvd0qsWemzleDx226cprEMiq
	kV/8rX1+IWknAwtorjKgOolV86awYo0rqAy2g/wwo4eVE71fH0+9bUwTK0hxEbXkV0nutrb58yC
	1yztrFaepQD3VvwTUNakSAcSbX51tEtxchWFHfAcbf6Pipgnr8tg7rrIVtMcGozQy89jsxG8A==
X-Received: by 2002:a05:6000:4550:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48dba9beee6mr22008962f8f.12.1791982968124;
        Wed, 14 Oct 2026 06:02:48 -0700 (PDT)
Message-ID: <6e448cc8-d733-4767-b8a2-563fd6a81350@suse.com>
Date: Wed, 14 Oct 2026 15:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/3] xhci-dbc: use brk_alloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com>
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
In-Reply-To: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791982968-50CDFB50-B42EBD28/10/78276251493
X-purgate-type: spam
X-purgate-size: 2953

This way the relatively large chunk of DMA buffers can be freed when the
driver isn't in use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v3: Re-base over moving of brk.c to common/.

--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -19,6 +19,7 @@
  * Copyright (c) 2019 Assured Information Security.
  */
 
+#include <xen/brk.h>
 #include <xen/delay.h>
 #include <xen/iommu.h>
 #include <xen/mm.h>
@@ -27,6 +28,7 @@
 #include <xen/serial.h>
 #include <xen/timer.h>
 #include <xen/types.h>
+
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <asm/string.h>
@@ -1332,7 +1334,7 @@ static struct uart_driver dbc_uart_drive
 };
 
 /* Those are accessed via DMA. */
-struct dbc_dma_bufs {
+struct __aligned(PAGE_SIZE) dbc_dma_bufs {
     struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
     struct xhci_trb out_trb[DBC_TRB_RING_CAP];
     struct xhci_trb in_trb[DBC_TRB_RING_CAP];
@@ -1346,8 +1348,7 @@ struct dbc_dma_bufs {
      * DMA-reachable by the USB controller.
      */
 };
-static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    dbc_dma_bufs;
+DEFINE_BRK(xhci, sizeof(struct dbc_dma_bufs));
 
 static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
 {
@@ -1424,24 +1425,33 @@ void __init xhci_dbc_uart_init(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
+    struct dbc_dma_bufs *dma_bufs;
 
     if ( !dbc->enable )
         return;
 
-    dbc->dbc_ctx = &dbc_dma_bufs.ctx;
-    dbc->dbc_erst = &dbc_dma_bufs.erst;
-    dbc->dbc_ering.trb = dbc_dma_bufs.evt_trb;
-    dbc->dbc_oring.trb = dbc_dma_bufs.out_trb;
-    dbc->dbc_iring.trb = dbc_dma_bufs.in_trb;
-    dbc->dbc_owork.buf = dbc_dma_bufs.out_wrk_buf;
-    dbc->dbc_iwork.buf = dbc_dma_bufs.in_wrk_buf;
-    dbc->dbc_str = dbc_dma_bufs.str_buf;
+    dma_bufs = brk_alloc(sizeof(*dma_bufs));
+    if ( !dma_bufs )
+    {
+        dbc->enable = false;
+        printk(XENLOG_ERR "XHCI: not enough BRK space available\n");
+        return;
+    }
+
+    dbc->dbc_ctx = &dma_bufs->ctx;
+    dbc->dbc_erst = &dma_bufs->erst;
+    dbc->dbc_ering.trb = dma_bufs->evt_trb;
+    dbc->dbc_oring.trb = dma_bufs->out_trb;
+    dbc->dbc_iring.trb = dma_bufs->in_trb;
+    dbc->dbc_owork.buf = dma_bufs->out_wrk_buf;
+    dbc->dbc_iwork.buf = dma_bufs->in_wrk_buf;
+    dbc->dbc_str = dma_bufs->str_buf;
 
     if ( dbc_open(dbc) )
     {
         iommu_add_extra_reserved_device_memory(
-                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
-                PFN_UP(sizeof(dbc_dma_bufs)),
+                PFN_DOWN(virt_to_maddr(dma_bufs)),
+                PFN_DOWN(sizeof(*dma_bufs)),
                 uart->dbc.sbdf,
                 "XHCI console");
         serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);


