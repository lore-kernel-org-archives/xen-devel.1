Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B523C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:21:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374134.1621100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohjx-000397-Ao; Tue, 28 Jul 2026 13:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374134.1621100; Tue, 28 Jul 2026 13:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohjx-000390-7z; Tue, 28 Jul 2026 13:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1374134;
 Tue, 28 Jul 2026 13:21:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohjw-00038k-1X
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohjv-00BRoD-EQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:20:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68acb1-2eae-0a2a0a5409dd-0a2a45059e5c-20
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:20:59 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68acbb-4cb1-0a2a45050019-d155802dcd95-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:20:59 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so32693445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:20:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45e0424sm80298925e9.13.2026.07.28.06.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:20:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244859; x=1785849659; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0PmC8Zogi7r4VxLB73pUpdZ4yUx5kl2KjhxmqXlA2+U=;
        b=ZkZPq9Io0OPWTavaDQm9w3HHkCAm0B5plhL9a2FsrR+S2s+CCAf1EQ2lMrxjqCvAHz
         PNc2hIPjrR4cuk+mBxVF1PPm5fjFJ03JPZZXP/tmbQpZgZJCSmrLg7SfkgX022bYiGe3
         DqfGAy3TXkSAypWgFdozTqOlX4+2ca8u7UVpxSkKhiaDXoqRWrGgskt0dJA895zX7MdX
         YVFfBKo2EyeODVsAm9G3WW8PUkt1rCW07B4TdPn65vPuVljndFSaKtk0AhVesUjK+TMO
         zU/H3ReYmhLvK0oMp4jc0KgDvNzxS876ttj9nn8YeTyJJCkv99Ji593CvOZwfTiATDHa
         0Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244859; x=1785849659;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0PmC8Zogi7r4VxLB73pUpdZ4yUx5kl2KjhxmqXlA2+U=;
        b=JDwUtdqRVPvd4K6UTGbVbf//rTy0+TF79Ro8UcGWlp3mrWWBmNt8Ac3AFlQ1QKyi/w
         M7JWpPNYo54of0iKhGvwxYfCYqptlG7Vech5RvYv1dsfPjuMV2Y0VZRkV3cenXmAG84j
         z2Tt3mlbtQ69jQ125xsUPTxEFV0jCmq87+0ji7SU5Eq7BMNFwUzYdBZyTcIPstMFzwja
         5OpmU+rbqlC/f5oK3BLDhtMfnCw+HVX7OFpUV35/hvjI/3P4xfsSuyS2zthdFqllEzLp
         vR1HxFDdy6mqXH55Y5iJ6yynXoQKtXpsYocGfRSh2O5cpHZ/L0d/O3Btd9GAAqEGT1U4
         R5uw==
X-Gm-Message-State: AOJu0Yxpjh/LD/LUoNK5vgbnUnO6k9Igkm/VzUTAyUPAxMdIKZMQds7l
	w1yucGt69ShZ9YAGlPjRBEN1NWJ+4qe+5XQspi3u2uzNRhhGQ5VdERDsCSPvUm9kwWXxWwMpd/g
	Wv0PMdg==
X-Gm-Gg: AR+sD11W520jpuf4crI71QTJkKgyeTF6xoZwoc9JWyuOyVd1iX11y0czDtrRJ5+AyA3
	YXmwNcvk2MPSr9sJikKZvulFJxjy1enfqy9OKmPoz/HibpcbJJJoDPv6kWUP6NZj/YaPtKN8asT
	4QNmrv9hZhQXKpjgnRGcoWwUsnJ4RRyzKS4Or21qJs7Jmvx1zl8oL31c8AAtO5YHU15ObdCRd8d
	skkvN2HFG/P4nSSjbFGH+SXb/ulbNJv+7Qxmh3JrG8SVzvnt4prb58RwSO4vJ/pVFXGOhxu3jXb
	LeE80DU7kr9w/7JSGCtIeBiJ1MuivW7he+j2bKkJLnsXt1kI5wyI/xqa2nAoGIr0UVi+egoyUW7
	+Muu619LWqN27GM2v0+y/4rU7Bu0FzhWVHUmpd3WogYrWqx8eoadCNpoTqViDOB/9VoaSp3QPIM
	/JvSjLKb7kllVjDyYTtUypd/AlgU6Zoi2gjJLp+rpQ82AnIgN8ILA8M6TTIkNhJDOaHA==
X-Received: by 2002:a05:600c:524e:b0:495:63f5:7a4f with SMTP id 5b1f17b1804b1-496c6591b63mr24709475e9.33.1785244858711;
        Tue, 28 Jul 2026 06:20:58 -0700 (PDT)
Message-ID: <b533ed9f-1ea8-4d27-8420-2159ccd27cc8@suse.com>
Date: Tue, 28 Jul 2026 15:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 16/24] XSM: suppress hypercall when XSM=n
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
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
In-Reply-To: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785244859-F64B42A1-02C874DE/0/0
X-purgate-type: clean
X-purgate-size: 2760

This can be easily done in hypercall-defs.c, thus avoiding the need to
dive into xsm/ when building Xen, just to add code which does what is done
for an absent hypercall handler anyway (returning -ENOSYS).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -458,7 +458,7 @@ CFLAGS += -I$(objtree)/arch/$(SRCARCH)/i
 ALL_OBJS-y                := common/built_in.o
 ALL_OBJS-y                += drivers/built_in.o
 ALL_OBJS-y                += lib/built_in.o
-ALL_OBJS-y                += xsm/built_in.o
+ALL_OBJS-$(CONFIG_XSM)    += xsm/built_in.o
 ALL_OBJS-y                += arch/$(SRCARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
 
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -119,7 +119,9 @@ prefix: do PREFIX_compat
 xen_version(int cmd, void *arg)
 vcpu_op(int cmd, unsigned int vcpuid, void *arg)
 sched_op(int cmd, void *arg)
+#ifdef CONFIG_XSM
 xsm_op(void *op)
+#endif
 callback_op(int cmd, const void *arg)
 #ifdef CONFIG_ARGO
 argo_op(unsigned int cmd, void *arg1, void *arg2, unsigned long arg3, unsigned long arg4)
@@ -264,7 +266,9 @@ set_segment_base                   do:2
 #ifdef CONFIG_PV
 mmuext_op                          compat:2 do:2     compat   do       -
 #endif
+#ifdef CONFIG_XSM
 xsm_op                             compat   do       compat   do       do
+#endif
 nmi_op                             compat   do       -        -        -
 sched_op                           compat   do       compat   do       do
 callback_op                        compat   do       -        -        -
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -437,6 +437,8 @@ static XSM_INLINE int xsm_hypfs_op(XSM_D
 }
 #endif
 
+#ifdef CONFIG_XSM
+
 static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
@@ -449,6 +451,8 @@ static XSM_INLINE int xsm_do_compat_op(X
 }
 #endif
 
+#endif /* CONFIG_XSM */
+
 static XSM_INLINE char *xsm_show_irq_sid(int irq)
 {
     return NULL;
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,6 +1,6 @@
 obj-y += xsm_core.o
-obj-$(CONFIG_XSM) += xsm_policy.o
-obj-$(CONFIG_XSM) += dummy.o
+obj-y += xsm_policy.o
+obj-y += dummy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
 
 obj-$(CONFIG_XSM_FLASK) += flask/
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -18,8 +18,6 @@
 #include <xen/hypercall.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_XSM
-
 #ifdef CONFIG_MULTIBOOT
 #include <asm/bootinfo.h>
 #include <asm/setup.h>
@@ -216,8 +214,6 @@ bool __init has_xsm_magic(paddr_t start)
 }
 #endif
 
-#endif
-
 long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_xsm_op(op);


