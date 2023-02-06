Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8BAC61DA4
	for <xen-devel@archiver.kernel.org>; Mon,  6 Feb 2023 12:43:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.490355.759020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0pw-0005Xj-As; Mon, 06 Feb 2023 12:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490355.759020; Mon, 06 Feb 2023 12:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0pw-0005Xc-5k; Mon, 06 Feb 2023 12:43:08 +0000
Received: by outflank-mailman (input) for mailman id 490355;
 Mon, 06 Feb 2023 12:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP0pu-00050Q-KG
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:43:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd764ac0-a61b-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:43:06 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id a2so9959259wrd.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 04:43:06 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.139.tellas.gr.
 [109.242.139.89]) by smtp.googlemail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm8881450wro.57.2023.02.06.04.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:43:05 -0800 (PST)
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
X-Inumbo-ID: cd764ac0-a61b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrIrR+cRozFMoRbiOf5/5kA1QxMReA6Uc+urY7xUoHo=;
        b=nbCRk/S3OblML1f9qnfnbPK8PxslL3umgvEwqZ4c+EkvZwrhX2I8n0EjzppaK3OznD
         2R4ZhflfUMoniYT5yY/OGQ4KtBDxlYoLCak7og1MDZZKSUw3FfcfU/ZIhGpHePivhBHU
         ohhfnIZ7aRCXUi7i0HuFxV55n7jcq6VyM+Iulw+BiKwov5NcjEW/b+OBNqjOwaV60v2k
         dkUKxXQfF1kC7iWty0o/gUVXM6hKHTDVAUptCT8y6rQbEfWvWFVRTWcTyfx8HQ8/eq18
         pFsYKOTSXz/tHts6x8vpFX1HXfAo//lkz+sLACeePYZ89BNgCnAa6Ide85FwJ8C7M1Jd
         LtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrIrR+cRozFMoRbiOf5/5kA1QxMReA6Uc+urY7xUoHo=;
        b=Yz1Cfjo2wICxGelGvP1BmoYHS7PHOXH6d2eEvIufFZOSsB7d2qGbUEH6oFCkKgNQvK
         O93rziz2jjGJTyzuSsNzobpPgIRBr1i/UKNb8ivZpje0d1r2A3XAdFxtfpp1aWk02ppX
         /t987aDdCuvLNTZyfe+ZqnsqkIy/I6gWmQI8kQXgwJiMdQEPa0vbkr5ZnGK2CZAI27Lu
         6J7h3QTlzuNpj4PqLDrU3ib9wKgjRukf7+qQXIOHu8qbNiu5zcENdBidi+8SNcpackgn
         AV8UZYUZrEs5AxUA9NfVijFV0rayhUo27lu8XAFU/E+QCpC7TUt/oiaUXkpDWdIdV4qt
         0Qdg==
X-Gm-Message-State: AO0yUKV85lwF93oypGrrVC8Kwge+65xnwGF4YYVg3xfC1X3Pp6PKCIcB
	xoflmScvxJHAyJMEEZIGsjEqlq2ASXc=
X-Google-Smtp-Source: AK7set/31WKlETDcKV82pJ34osnTaPKCcY8NweAKZgLrDkMU8Nfln78DRg7Y/+V+YGwxAqctTYsZnQ==
X-Received: by 2002:a05:6000:2ab:b0:2bf:e4b2:64a8 with SMTP id l11-20020a05600002ab00b002bfe4b264a8mr22402627wry.42.1675687385530;
        Mon, 06 Feb 2023 04:43:05 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/hygon: do not include asm/hvm/support.h when not used
Date: Mon,  6 Feb 2023 14:42:51 +0200
Message-Id: <20230206124251.911744-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230206124251.911744-1-burzalodowa@gmail.com>
References: <20230206124251.911744-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since none of the declarations and macro definitions in asm/hvm/support.h is
referred in x86/cpu/hygon.c, remove the unnecessary include.

To resolve the subsequent build error for implicit declaration of wrmsrl()
and rdmsrl() triggered in asm/spec_ctrl.h, replace asm/msr-index.h with
asm/msr.h in asm/spec_ctrl.h's included headers.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/cpu/hygon.c             | 1 -
 xen/arch/x86/include/asm/spec_ctrl.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 361eb6fd41..42029f2145 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -1,6 +1,5 @@
 #include <xen/init.h>
 #include <asm/processor.h>
-#include <asm/hvm/support.h>
 #include <asm/spec_ctrl.h>
 
 #include "cpu.h"
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 6a77c39378..e928596450 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -60,7 +60,7 @@
 
 #include <asm/alternative.h>
 #include <asm/current.h>
-#include <asm/msr-index.h>
+#include <asm/msr.h>
 
 void init_speculation_mitigations(void);
 void spec_ctrl_init_domain(struct domain *d);
-- 
2.37.2


