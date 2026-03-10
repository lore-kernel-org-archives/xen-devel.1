Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC4FFD4F09
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 17:09:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250390.1547905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a9-0002s0-Ia; Tue, 10 Mar 2026 17:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250390.1547905; Tue, 10 Mar 2026 17:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a9-0002rC-Ci; Tue, 10 Mar 2026 17:09:21 +0000
Received: by outflank-mailman (input) for mailman id 1250390;
 Tue, 10 Mar 2026 17:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a7-0001QA-Ml
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df90eba6-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso20324425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:18 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:17 -0700 (PDT)
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
X-Inumbo-ID: df90eba6-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162557; x=1773767357; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI2GmymuZn5ZjF6sh0Pndyef5xHCptAQOPGu6/MNHsM=;
        b=bZDa2dD6Q+j7MrXH/ZZyIvTY0Nnz7lWJ9KKfC4nl98XtkpGVoRyqi5c1knYFbNhUdk
         wMIDA0aruN5LBiTmanT8k24o7lLTdRdjLb362aVbt/IaJt3yFYvqLjBhaHw5o6qLKsoD
         sdckNLKjOCV+vQLf9UIqsC0KYRGzY2Sy8UY/6L6XKyDRyj6d/yzVb9dC/aV97OLX8enT
         go6lRkUqokO7gkWQmLYlXSTEGAljMDCzYXGCrogaPokidV5SOHNBWGWgwT5yU8Pg97/t
         9fFjvU5IePrf6hDvFVcbtk+xrYy4/jl13QzrNxmO/6IwqOSfN8LkcD8pH/vtAu/7R7Xd
         R75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162557; x=1773767357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WI2GmymuZn5ZjF6sh0Pndyef5xHCptAQOPGu6/MNHsM=;
        b=XqqG+LAPwWLReFRUWv0hZ91Vy3TnYzCtYMAmLDEIUqlEiEEp1xAOYXPDpQGdlqtCDb
         epJOYwEQ5Kg7+rPk+t0oCaV6mlhDtY6IaOjftEQmcn0RXhtevr32Fqx/77vo2D7P8ruB
         ebbdfp5koFDBV9TZkVKTWXrC7tUkp/0gQ1XYzcL4mzjr2Mhy23z4kOlJexUvEvWFNYRM
         nSYZNS/Fwn+ft0vkx9D/QwEprTUKjyoKwi19RsC0dv0Uh+lVEQhxNXxLXfIs5/PL+uiv
         DPYwVag7lOZjLu9eE68XnBxRhAboqRdo1KZBglbwHzMXCOw/Q2CHUcwlvKqrcT82NbYR
         CN7w==
X-Gm-Message-State: AOJu0YwkZwVuisl22YCF+slQdADHQ3RUx3UfBqsC0+Cgy+dZJWLaNs3N
	L+p2TraKga5q5JR54xefxtrboSE+mZrtahNeAKcTEzKdC9HbJ9jKNnv03nlxLpxk
X-Gm-Gg: ATEYQzwkJnMYF+6qhbSzJODuEM6p/TxoBlrso8hmuNNGRy7upSYqvURl6Pc2DwrL1Ru
	IiaBqAGHr0KdSOEJ9Gk4ij2H6UJQyE1ygt55FM4GWiiTMMFgYhSzuH/FtYfLf0H5Xq2Af7Nvdtz
	+nMSP/c4Ac/kWD0D2TT3ElNvcp8PbKQ6asBYzks/M7JVxZu9VJHpV3Eh13L2LOanxuhXDcfnpxU
	l4PJHWPZhAtHVj+fSYcDWvbFYJfw0ctdqFvXHR58EQJ2oSTjdyWObdEOUH1+q6VrUwaRs0YyJVp
	4Bcsb84SDGlpg8jwh8TI+71c2MUMcwMbNaukO711KYHRWGY4hbRusHjsqdQkZGrCaBtnkCUuBWb
	hTZjA+wrTZlR4MjUGH1uBPnBkaffC+CLGxcHgTuTkRzOZoscrc1JRRzCoKvg+4SdDmsKex2pSMQ
	2zTsDsmC8hCmG/CJjxxIfH/8YeWR5W8r/d/prLfvpwrmFF4LE2AX+G/ckvhJxEA7UP1g==
X-Received: by 2002:a05:600d:f:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-485345bce86mr165965485e9.27.1773162557447;
        Tue, 10 Mar 2026 10:09:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 07/27] xen/riscv: implement make_timer_node()
Date: Tue, 10 Mar 2026 18:08:40 +0100
Message-ID: <f1b759f4fa43f3a01ede0f99f21c3ac59b61f438.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The make_timer_node() function is implemented to return 0,
as RISC-V does not require the creation of a timer node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 633f02e42c5e..ae26faed09ed 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
@@ -152,3 +153,10 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
 
     return res;
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.53.0


