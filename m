Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F3606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dRAY0OR8
Received: from list by lists.xenproject.org with outflank-mailman.1469721.1678479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODz2-0007Jl-Hv; Tue, 03 Nov 2026 12:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469721.1678479; Tue, 03 Nov 2026 12:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODz2-0007Je-Ey; Tue, 03 Nov 2026 12:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1469721;
 Tue, 03 Nov 2026 12:51:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xODz0-0007JI-Kx
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:51:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xODz0-00DBGH-1I
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:51:22 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d8c6-8faa-0a2a0a5109dd-0a2a4505bc92-12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:51:22 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d8c9-4cb1-0a2a45050019-d155802aa466-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:51:21 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so6707755e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:51:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9b54dsm24535110f8f.47.2026.11.03.04.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 04:51:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793710281; x=1794315081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gMm2a7QNwXZYXz1DEn6YS019avxsFmIWcQ9BJGK0Ao=;
        b=dRAY0OR8SI5o9mO44co8aahxMKZ1UPaBgyT2oWh0dt4axI4jLryx7I8LSWAHVv6hgY
         YUAaxb1tGFfYYN2UQAaGVq1tz36xoc5+hZ73Bwg5g96tUpsaE+uSEs6Bok7WHjleh5gI
         GTP75LDL1QFAw6bUZfjvydphNI/u3wwQiZznJGM2TRdPzFLNjzkzfR8T7QvYgi44tqAz
         4GcE4scZXX1aPfKsMDTfMpITgnf22uFPLKNM2fH56vZMaozXwmRJg8ksmYm09azJdYQd
         5lYIBGfrNnlQnYSRM8bbW6i1T57JXKN1710soMNK5zxVxe09Gt5lQ7ho8ektJRuAGtsG
         bHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710281; x=1794315081;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gMm2a7QNwXZYXz1DEn6YS019avxsFmIWcQ9BJGK0Ao=;
        b=GBTzgAGYVw0obYQgMaygZjB/UgkcdZ1BxVNOvHPXdHvVwUHHPfkdXuteVhPK12h+jo
         y5qD8zf2h98uQHa/eepdSoSojzqdJboO5lQC3cUhJJk87+diQaBq0IeB3nMHay0u6xW2
         X6JycmmHE/Y7izEb3ElyIdII9ghtQy1NX8xy8bZ5B3UOaCWN64u+FLIr18o2auuWmLxb
         Gx9+x7CFrYpmVlM/6KzDZNtTD7Za3DjwLvqXvb4TIc/LGKECdB6dobKqwg/I04g7ABxB
         7k255GPiZRwAHQXnWIYq+DRWsEHV6epSiRxKH+S4UOWftmv3+erqKNKBzj5WhrsbjISn
         6a7w==
X-Gm-Message-State: APuU4Z+AOz2uF3BS+fkUPxZM9zyLbfuSlV7kW7n3DhmUU3FES07E4gD0
	UBiyqjFBsIIOc/H99u2IgM8SCWTHAJEjMnzfW2FfRLRNuYIghrbpb0Lw2oddlutwDcYFSnQTypc
	4y8SMtg==
X-Gm-Gg: AYBFou1P5kMBWuPKSP0CuHdP9Gnm4Bb3YWFdWzANOWsnxxbDq/ZuRjzK5LnL2oOwsUp
	01njPq6rSqM5lP8iXkKLDMOt5+T1fyschyt60kNdJovxXcC5KkVoXADsQxu2drhw1m+VnpqjvRU
	vpk46zBUrjlRND+fVcvmIVvA8cAu9xA0b3oCQmJ8ryCeaWx5UWQmOCilJJtWcs+0nhYbczDFTn3
	1odUh50ahhYgm4B7MTIEGtKzBJotFxYEu25hygiHAejpjhzEv0McEXSniHSks2nbFCjDP50Z3z6
	XpdLpV3DrT9BvAxuciLsvh9D9hCaYKZrdXyyFHi8tLXOLwZPBC/ANVCCSRyKAGeCi27CpiOr9OA
	SAFgyPlmTvw1jbXheLqho3f5j327Q7Tzw3Lty6goNHi8EiIoZU+wys1x9k/wGIfoyA8XMTtzt0s
	GuhF1PbyyS+ltXU5rQhFJmbw5a0MCwqJXAIEbVHbH1VMNxSnzmXyNwGyot7W7ChgRgO29adJn58
	iINf0L7ccyb1WBwXtvHBMrwCFzBUashmla2W1pKIdRj9fpqvKdKqDOgw87/P2+HgclFJeF8dytc
	YR9w/CNj5dcgoMv25RepnsmluRmk8sp8DOyJswoqDF9bCb6dWgSO9Ue0P0wZvCcH/Un9hB46AWf
	FoL2w8FSdGo9tTos=
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr285886085e9.11.1793710281510;
        Tue, 03 Nov 2026 04:51:21 -0800 (PST)
Message-ID: <0360de96-99e0-49da-942b-45727ac6b296@suse.com>
Date: Tue, 3 Nov 2026 13:51:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/3] xhci-dbc: use brk_alloc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
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
In-Reply-To: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793710282-F76BD2A1-B78C87DE/10/78276251493
X-purgate-type: spam
X-purgate-size: 2953
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


