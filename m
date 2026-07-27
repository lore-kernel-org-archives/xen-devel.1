Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CF4C53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:20:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371525.1619019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIRu-0008Dv-Se; Mon, 27 Jul 2026 10:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371525.1619019; Mon, 27 Jul 2026 10:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIRu-0008Do-Ps; Mon, 27 Jul 2026 10:20:42 +0000
Received: by outflank-mailman (input) for mailman id 1371525;
 Mon, 27 Jul 2026 10:20:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIRt-0008DY-Hu
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:20:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIRs-003M40-UB
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:20:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6730eb-e002-0a2a0a5209dd-0a2a4504e8f6-34
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:20:40 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6730f8-b57f-0a2a45040019-d155802ddc3e-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:20:40 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso29923265e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:20:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bfe07e1sm224907225e9.3.2026.07.27.03.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:20:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1785147640; x=1785752440; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R+gGXDm7e3E7luUT03vkRevAy5s7Sddb9vqNWLAUZMQ=;
        b=Hb1aVC10FSzRxeUfP6Jfrf+6LBwOlPqHBwgCOkWtLCe5kaHRAZIXN7elQe/tHWzwm/
         yGr5S4GdM2/GQi+1QjfXCIQcDkH0PJm3XCBpwGes1RunXk+aE9Q+GPoqI8JbGiA9uYOU
         5+QjPPdZ4ySYDsj0wxARgcfyiOSxr3r119fs5qIAn4Mqng2ET2Dos1bVolSib/2jdheQ
         UApHT+B70pT7hO+OfUPCT/0r14G/QCpDUEt5Ox/yGKjYM3GXo8muQxi3Iohw4K62NuFe
         SLZg1tdovtmeJOiIc3fwgwZit7wgh6WHDz6719HHiuqUCKb4TdV3PhDyXmSnSQX8Syot
         3Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147640; x=1785752440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+gGXDm7e3E7luUT03vkRevAy5s7Sddb9vqNWLAUZMQ=;
        b=BgNT9G70vSA248MEBTwinfa7Vk3oCJ1ByxCAFndfn/HijymQaVswQGok2Zrrn5hE9x
         +bVf6BgYW6zzpDdwwnS2Rs3SdgXiyln3ofi9TZiXEYPLnRsPXyiIO3a5AmKlvf/Z7Jm8
         o1xvrem3EjYcWNv7zq/TQ2RWVGJ6JCG4805QWzHT8nMeSJ8bTphBIDydWEqC3t6ch0Xy
         KK+6LoUxSC3JI/DQOcF4BqgEI4Hs33JC0iFK+Ch8Cft4ONd99X1eipS37phHFKxDOGcM
         lI3lqjKQtBGL+i5JsKxK8r2FPVRC5cNRScxGvNg3ZEt0f9fS9VNzTF0e6Nbii3Mc7tsU
         WPNw==
X-Gm-Message-State: AOJu0YzcXWRXo0IR3YIXKHTTgnxpkXsuvtGMDT+pqHDiJ8ZJlJ7g4Rnb
	J8rDsZ+2uLEje+mE/FjTRgoemO625Bz5UFmacMt38027YuO11jLwilelOGSUEr7tp8Ch/gbMrEm
	+qttGcA==
X-Gm-Gg: AR+sD12LNt0qL7PCghOoVuCnKpl41u624aTHZ8NZRp+oYvC20A8Rk6XaWx+6rRNdV0k
	KSt+fAyqEyD/dTPxDSui5kKdzqONue5vnuV2Ys2WXJAM8Pk6ZdwjABVkaiyMl/d3KBwixwGZadX
	UkVn/R1zNqrRSkQdjm5WM0qfGJ0Uaizl5Cpdq/g40U4mZUl99sf/JVCOIjJ4lFXE2pAKmApoBU6
	pNKaZJ7b38mBMcKr59k8k/whyfcLGkRoeWkumPTjhQPk06QCLq8J/O/DCcnUG7TPVp8ZrFr9xOQ
	14uZ7PKRpoVci0RfqSNdabcSqJILOY2q3XMvlEbURFESWKvzZD/qENR9eoEf3dizPLSHVZJjL3I
	XowqR+4NrxefMD2iwLb6RV7Bb32s98WPkKYoQ93valoyg6/mVw4SRUsG4fsorzcxnhtR2NN4w3l
	qwFs+EqRdO3Aq8GJ/yM7ck3BhxYJKsiSRZYB0X9fdA6jpSTmNYSNIeD+kJKEZU5d6Ydf1It2eru
	jtv
X-Received: by 2002:a05:600c:12d4:b0:495:4dd3:ca97 with SMTP id 5b1f17b1804b1-496b56fa62bmr62636045e9.29.1785147640288;
        Mon, 27 Jul 2026 03:20:40 -0700 (PDT)
Message-ID: <a8ecb969-d0a0-40af-a49c-a94e6fbda0f7@suse.com>
Date: Mon, 27 Jul 2026 12:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] xhci-dbc: use brk_alloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
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
In-Reply-To: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785147640-C26CAB50-33559181/0/0
X-purgate-type: clean
X-purgate-size: 2748

This way the relatively large chunk of DMA buffers can be freed when the
driver isn't in use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -27,6 +27,8 @@
 #include <xen/serial.h>
 #include <xen/timer.h>
 #include <xen/types.h>
+
+#include <asm/brk.h>
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <asm/string.h>
@@ -1321,7 +1323,7 @@ static struct uart_driver dbc_uart_drive
 };
 
 /* Those are accessed via DMA. */
-struct dbc_dma_bufs {
+struct __aligned(PAGE_SIZE) dbc_dma_bufs {
     struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
     struct xhci_trb out_trb[DBC_TRB_RING_CAP];
     struct xhci_trb in_trb[DBC_TRB_RING_CAP];
@@ -1335,8 +1337,7 @@ struct dbc_dma_bufs {
      * DMA-reachable by the USB controller.
      */
 };
-static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    dbc_dma_bufs;
+DEFINE_BRK(xhci, sizeof(struct dbc_dma_bufs));
 
 static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
 {
@@ -1413,24 +1414,33 @@ void __init xhci_dbc_uart_init(void)
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


