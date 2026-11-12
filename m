Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19C7606A33F
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=HMT77LDX
Received: from list by lists.xenproject.org with outflank-mailman.1486506.1689125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRbb4-0000QT-Da; Thu, 12 Nov 2026 20:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486506.1689125; Thu, 12 Nov 2026 20:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRbb4-0000QI-AY; Thu, 12 Nov 2026 20:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1486506;
 Thu, 12 Nov 2026 20:40:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRbb2-0000QB-UM
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 20:40:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRbb2-0053Uy-BL
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 21:40:36 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af62413-8faa-0a2a0a5109dd-0a2a450cedde-44
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 21:40:36 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af62444-f479-0a2a450c0019-d155802ac9fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 21:40:36 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so1907005e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:40:36 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2842e6sm95154875e9.4.2026.11.12.12.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 12:40:34 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794516036; x=1795120836; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYhVvj4AjGNFTxGLO1Xnh7UQvkIhfLx7tjVRrh9djcc=;
        b=HMT77LDXhtrThLw6krBxSVgODikvPGFjyfBJESUMcfHW2TSfiHDfox/rp5wrzDMqQ7
         2Z54G1v5K+2XgBt+XI5/zsIkGJLxzsNVJfabyH9u7wbfieuG/muXByW7syiFgP1BwQtK
         WgA0Ghoakl2MdALXgwbF5yNsKjbc+ZYpiJfGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516036; x=1795120836;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYhVvj4AjGNFTxGLO1Xnh7UQvkIhfLx7tjVRrh9djcc=;
        b=D4cEqUKq0tcDcWESnbKVZ4fssJRFGBNBkEyDpZGKPGwDFXy3uEyaGp0e+iEgdaZkG6
         CSv5MuNdhYs+Pzswe1g5k2iMDl6W6qUl0MAIPMwJLFZwo62Px5/Bm5P6+1HkU+74jj72
         DlwXwq1vd4DQZa2YE9v+74CXWY9eOtoIR1CTZyyLgo0cMN5n2EvqGrUA4BwJ/M42JPCS
         Vx8YpeCDOC0RSxk5CrSPyFe5yyIHJeL+3cKXbvOfQo0k8hgFGSUNzTWhqMty0zq/H1iI
         c+jQYLaZE48Udg2kmFjElCNcmuEGM7fq0yjvamc38wgrjXfUVp7WLxWAsqkmagmaLZCI
         Fc7A==
X-Gm-Message-State: APuU4Z+OsM6m8Y3pNnXTb1yYCRukqmQzsJ/A5O69mpygFSR/KDiBP/Ne
	sRck8suGkoo+zvtqH5yQ1mxrUtl3AyiGhFf4FBfpIUzz3o25NxE5XwK5EOnE7LN8COmiJa8adZB
	gtdHU
X-Gm-Gg: AYBFou0xc7sutHsCSL9g9dpaZlJr+2bANjgs+cCgrz7IgKHzGtxt6pua4n3UrI0ByzW
	ZRiIINEsP1jszyUttKURU7D9PruGARz+pUOlfn2TaGe/Lw8124ouJOchgEucY81o1FeY+yr8DXj
	xu/tnOP57hcfb3qIUhmiYjRvWXnQ+72PSB9MtlsuTF6Fko2tE9pPQcVMrXKb+kL+KIv22Eb1CuC
	VjO+nYcAv0eETsx4c0JFv37aby782zgAHUdppql54XpBjjw0VX3EwYTp8feCGD0t5dJp5eK+pPH
	/IsTVOJwj2bVblkosGfTPxmujPXtJh7mFrgU/kgWZXjKBSaf1Ota0yznWBHbv61rTEMVIpqgmdM
	WanI+0LiSwVbluM1LEAIU5zc+0qOXZqFT7lLPB4g1qkt+Zsx6hzoef4SoYRiDZVK+g8U9VvvjtO
	a72pLI1YyO5hMkkUiR1fnaWb4pubcqLnhZfKi9biKp3E1l5VVfNPVzrhxRyh39ADFG47iQUl9Sc
	OFjPL8geSapHp9TESxdn2zmsgROYigq7of+x8ByLSAb0Ki31a6ulXWs5iy/r/3pXAt8EBRwIHcv
	TI2a82mxrgtlROs4bqZRT8KmoquuJBbN1WPTys6+FFAUQh4abeKfXxBGRg/FbjuDqynFdFU/YPN
	r7ebAsW57faoDyxMFr54hPi/q
X-Received: by 2002:a05:600c:515:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb55a6a658mr4843915e9.27.1794516035185;
        Thu, 12 Nov 2026 12:40:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/link: Remove CONSTRUCTORS from linker script
Date: Thu, 12 Nov 2026 20:40:32 +0000
Message-Id: <20261112204032.3325011-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794516036-52132A5B-4132F097/10/78276251493
X-purgate-type: spam
X-purgate-size: 2276
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The other architectures inherited CONSTRUCTORS from x86, so just as with
commit b7a7e346c710 ("x86: drop use of CONSTRUCTORS from linker script"), they
should be dropped.

The .ctors section is handled explicitly in all architectures.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
CC: Timothy Pearson <tpearson@raptorengineering.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/arm/xen.lds.S   | 1 -
 xen/arch/ppc/xen.lds.S   | 1 -
 xen/arch/riscv/xen.lds.S | 1 -
 3 files changed, 3 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 8d0954c90afd..b5ccc732bd8d 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -95,7 +95,6 @@ SECTIONS
        *(.data.page_aligned)
 
        *(.data .data.*)
-       CONSTRUCTORS
   } :text
 
   . = ALIGN(8);
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index b2159279169c..fee810791840 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -86,7 +86,6 @@ SECTIONS
         *(.data.page_aligned)
 
         *(.data .data.*)
-        CONSTRUCTORS
     } :text
 
     DT_DEV_INFO                       /* Devicetree based device info */
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index d1c5ce59c90d..4dc55f5ad26f 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -93,7 +93,6 @@ SECTIONS
         *(.data.page_aligned)
         *(.sdata .sdata.*)
         *(.data .data.*)
-        CONSTRUCTORS
     } :text
 
     DT_DEV_INFO                       /* Devicetree based device info */

base-commit: 4263fe42b736596cfa5bfec661f2f55f02759aa7
prerequisite-patch-id: 680071148129321ffaf7bd7435d031904014f556
prerequisite-patch-id: 4ebfc2a1d8cd14cc1cf477b6db8cc9ef72310674
-- 
2.39.5


