Return-Path: <SRS0=byym=CM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DB4C43461
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680F02078E
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPc16AsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 680F02078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDybS-0003Gk-Od; Thu, 03 Sep 2020 23:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWRi=CM=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1kDybR-0003Gf-4H
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 23:25:13 +0000
X-Inumbo-ID: 5c7d1fc4-8073-4bd2-ad2e-c3ff517af381
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c7d1fc4-8073-4bd2-ad2e-c3ff517af381;
 Thu, 03 Sep 2020 23:25:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a15so5820631ljk.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2020 16:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/8mDa3NP1IL9ykR5Gnwz4LmPL8H8BIAxgSnxVfPNlk=;
 b=bPc16AsBYz5Cbp9QLdjpO6mUr5fuNcYJCw+e3k4hAyWjCpvy4voXDsqnhXGG4Wr27l
 25m1H9iA2dCXOcCldB348nmcIxQ/iG+LeV2MHPLzH2FTJfLb4pIUNW2lmp9GxlgDHVBM
 KaanMgwZyO+d7NrESEz03KWijRmgUvTw3iJkyM8cY4Ll6mPL/E1svdb6yqII7z7AUlIQ
 7f8nUYxCNW2BQAw/BtUiE8WJHWZz4wfzN92wyAr9LHXmeHT3RR6GkoJZYYfrDAvcFJ1F
 xF7FP5TXWM7R1tRmZ3yv08FsBSvqL6ShrWsXAY3811EoFvu5Ecsmj4VHvRtNEKJE/NK5
 Gk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/8mDa3NP1IL9ykR5Gnwz4LmPL8H8BIAxgSnxVfPNlk=;
 b=lMJ5uxpvY+NZCNVwF+sNPaxYBSsKULTGYsBxG1LSForxojsvxu9kS1h7wL3VWUezJJ
 S5+EzFnSd8+KoqYmfr8NA6/6I4ltxHJXtLFPe+EIGo3H5HXwhmtRgc3B3peCBLZvOO33
 AWTjvGk9pgrZE7WjLdO9LlfMbQXto/SPnOGIfLG/S4ZOYKhe7N+wCTyHIMc7MKxAcRqm
 NJD9gmgNfxFG+UfToGrWc1y6qgWgR26jnK/Hoiwlhuv+X5TERmmkbuIu2KSjfSwkWnYf
 yloi5xxXKn1BXyUKB5IXh89m8JfSxFt2V6/rZOCm3cRTse290qtCzSol8kGAi8tCzMpX
 y/7g==
X-Gm-Message-State: AOAM532/ol3+BRqqAmWSa1C711lmuMrXq4IYdjeij7NlEgnnwPZyDvn4
 SyVj66FbqwJDZM6Qp7pAiV9MlOufTEQ=
X-Google-Smtp-Source: ABdhPJyZXQVhrIV0r+kCRgOKT+6QjvMoL/aPaAzktaqSXXMNvgitPmlWIKRFB4wTRGy9Cu5fVG+Muw==
X-Received: by 2002:a2e:818b:: with SMTP id e11mr2497426ljg.0.1599175510956;
 Thu, 03 Sep 2020 16:25:10 -0700 (PDT)
Received: from PRECISION-M4800.localdomain ([109.252.108.19])
 by smtp.googlemail.com with ESMTPSA id a16sm905403ljj.108.2020.09.03.16.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:10 -0700 (PDT)
From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Sergey Temerkhanov <s.temerkhanov@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
Date: Fri,  4 Sep 2020 02:24:58 +0300
Message-Id: <20200903232458.16551-1-s.temerkhanov@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This helps overcome problems observed with some UEFI implementations
which don't set the Attributes field in memery descriptors properly

Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
---
 xen/common/efi/boot.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5a520bf21d..4644ce2525 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1521,7 +1521,9 @@ void __init efi_init_memory(void)
         }
 
         if ( !efi_enabled(EFI_RS) ||
-             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
+             ((!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
+                (desc->Type != EfiRuntimeServicesCode &&
+                 desc->Type != EfiRuntimeServicesData)) &&
               (!map_bs ||
                (desc->Type != EfiBootServicesCode &&
                 desc->Type != EfiBootServicesData))) )
-- 
2.26.2


