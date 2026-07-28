Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8690DC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:48:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374915.1622275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok2p-0002cl-Hc; Tue, 28 Jul 2026 15:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374915.1622275; Tue, 28 Jul 2026 15:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok2p-0002cZ-CL; Tue, 28 Jul 2026 15:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1374915;
 Tue, 28 Jul 2026 15:48:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wok2n-0002ZF-Hp
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:48:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok2m-00FCsc-Us
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:48:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68cf45-5cb7-0a2a0a5109dd-0a2a4504c9e6-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:48:36 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68cf54-b57f-0a2a45040019-d1558031e4a7-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:48:36 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso4855e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:48:36 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44b6b93sm88807765e9.4.2026.07.28.08.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 08:48:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785253715; x=1785858515; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=te7fPojePD/ct/6l3gGMOIxNs8LzWVNztC4ZdtL5AmQ=;
        b=uNjREsJJgmpEith7rCy3jv18RE+10G3v4GvF7CCWhFmDrNlsMUq9ZDYRZjtql0G0R9
         HNTeXzQT4hNT8rN/1HdBU370GeUcekqA8ZOhQ0XKZIrR7+uzr/6PLrzxWj6tsXwTCERQ
         KDrg7D3OTL0R8AgHsUiohDe5VSutbUfEwECHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253715; x=1785858515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=te7fPojePD/ct/6l3gGMOIxNs8LzWVNztC4ZdtL5AmQ=;
        b=VqxoHjsWMGSCAzMaLtkc01S08J0zjUmydXWEFSnrQwfBX8zt4gCIqqpm7CpkAjXacL
         27S1SZSygD576Kf+YbFpbcWBgLLqOF+7jCLgMsVlONAVrIiPis4Dh1ZqnhikELC3HT70
         R+hKIp2lEaebTVtMCGHibJ8xN1g5SXu3PJZHe36ISuHbvkrZx6hZ8chSlYCW4VGS6m6q
         v54wlipgAv1MT9Bo2WjY3M9OlFNOiQe4rA4UnwmfD6QS+9+5Osls9z/ZGjiEtPsnhVHL
         wJL9GeOZbkj4cR/IMZBsQkDUeVCjijQctB8+h6w5tEgj1G5RfawV4utLAmRJTuAyF3Dx
         FCCA==
X-Gm-Message-State: AOJu0Yy0GcEDoVRikdDZUVM7zsl0/y2k8wB47FtIRH3VwgIccbjTj6XY
	HP6xU/jHUDEdKjCGLcb+/WXzkmAySEgw7QS4luDvS4n3Pt5c46Mx9/BeelAPb1lB7inI12LvvqY
	RST7x
X-Gm-Gg: AR+sD11tVqDIkwOVRS4rHtZH8yWaXmQ4e2bNpIVpg0piUpZjMQyZvOSAN0i/SOB3W3v
	LWXkKL0fQ+5a3FxdmCdZ4yvzTQkEgR+o3j80few4Y65j52tnXtqCzUZjvvJ/4SGM2oC70NrmDQo
	Pv6JYYZ3lX1TCSU66O7nVq/+yxq72hOk7pShA1yd3N+xK0/kdqard6J+VLss9/41fXPqh+UqiAb
	ntllEpLeMmzYAnSwGg12xcsTnHYMUzDVsb12XyTCUYiQ1JyChZYHv0KddvwpWYqs+n9A7akyPet
	HExtlUKAvu0PbxEj/rkQk1K+HPBrDIMDXaK3vxMnJvvBeq+yq/SLVXvRykAqz0SmJlK28YgEpAL
	jm+5Q3iZj8zh1b8Ahd8YOQRaiH10qhsSIQdhTLVBWgAeaYlME2SiRba2rcjew2R/DgUeupOnUmm
	LKZudXz6/UeBuG4UdQfeGWxoP4jAQAXrVfqkqMAvMhU+L+LwDv/z22
X-Received: by 2002:a05:600c:e549:10b0:496:c1f3:e8f9 with SMTP id 5b1f17b1804b1-496c658efe9mr22233615e9.20.1785253714322;
        Tue, 28 Jul 2026 08:48:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julian Vetter <julian.vetter@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in domain_getinfo{,list}()
Date: Tue, 28 Jul 2026 16:48:30 +0100
Message-Id: <20260728154830.67734-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260728154830.67734-1-andrew.cooper3@citrix.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785253716-C3AC0B50-EC86FC9C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1684

From: Julian Vetter <julian.vetter@vates.tech>

Add the missing ARM logic, populating xen_arm_arch_domainconfig
from the raw xc_domaininfo_t the same way the x86 branch does for
xen_x86_arch_domainconfig.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 441e1d83cfec..fb983709066f 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -444,9 +444,21 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 
 	Store_field(result, 15, tmp);
 
-#if defined(__i386__) || defined(__x86_64__)
+#if defined(__arm__) || defined(__aarch64__)
 
-	tag = 1; /* tag x86 */
+	tag = 0; /* tag ARM */
+
+        /* xen_arm_arch_domainconfig */
+        arch_config = caml_alloc_tuple(3);
+        Field(arch_config, 0) = Val_int(info->arch_config.gic_version);
+        Field(arch_config, 1) = Val_int(info->arch_config.nr_spis);
+
+	tmp = caml_copy_int32(info->arch_config.clock_frequency);
+        Field(arch_config, 2) = tmp;
+
+#elif defined(__i386__) || defined(__x86_64__)
+
+        tag = 1; /* tag x86 */
 
 	/*
 	 * emulation_flags: x86_arch_emulation_flags list;
-- 
2.39.5


