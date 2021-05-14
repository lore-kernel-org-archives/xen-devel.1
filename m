Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74B2C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 18:54:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B4B611BD
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 18:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B4B611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127488.239628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcx2-0002Rk-UG; Fri, 14 May 2021 18:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127488.239628; Fri, 14 May 2021 18:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcx2-0002Rd-QS; Fri, 14 May 2021 18:54:20 +0000
Received: by outflank-mailman (input) for mailman id 127488;
 Fri, 14 May 2021 18:54:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhcx1-0001R5-IN
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 18:54:19 +0000
Received: from mail-il1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee43060e-79e4-409b-8d3d-c3c59584781e;
 Fri, 14 May 2021 18:54:07 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h11so584625ili.9
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 11:54:07 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d81sm2815190iof.26.2021.05.14.11.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:54:07 -0700 (PDT)
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
X-Inumbo-ID: ee43060e-79e4-409b-8d3d-c3c59584781e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aZUcLbAyYZr/mu1DuUlZ6kf0uoeQ0LVDzaRiHOP28GY=;
        b=P0jc2FBfxZxHsaAQlVSO1k1XLOGOTzpFWKon1uh24SlEm7rgvPi0dGmXN8P1vTKrYo
         JCoU/XWcVqogkukVPvDqyIQyBfwwPiPfIbS7n9Oc2QLx9OEbpbcLPuIEmwkW5/J9UCPj
         VMlgHhs/4fcQyURanvKpXtXLUY66Ll2KfjSJVUoO1iOOBC/qLHLsKOV6mcBtgdWeSIMY
         BywEHROGml2C1EKy8JNaStusibZw+VJt8b6Y0xRWSuqy0AM+6ORcRw9J/w3zTy/KdzDb
         61tuLiYKe4NjmqA+DnvL0q/v6cLTZ7w3NvHL8LtJ3dSJAubQFIkMXXAMP/3buFA0xNkB
         YqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZUcLbAyYZr/mu1DuUlZ6kf0uoeQ0LVDzaRiHOP28GY=;
        b=s9JSW9r8U6u01ulnO69RlmDt1hCgQFE7WKMU1X3RNkxzLw/Z7hrkobb6W5r83zJ4A+
         PhJEXz74fhgfvUBtxVJ6hbB53e6fKWAm6b3ppqSHUA3jawbBphzDmlgtSEtJJ947xTsw
         DQfBT7Y8rBxStIGLdKTOjtT2EZY/8zbyrHgdSPrefnTc8eecdU0GjYpP4cI6I8oiL6ER
         Em8HF+gYPkYcvIKvYou2J8UOSpvJ/+8bB9MAEjNwIrXoVWZnAW8HMM1WRzl8adDoA9+R
         ioxJC+4fL6GIhDsv1RZFJUaV+pc0CZcnmeCOO0HO0GYygbO4vEO4qJzXGrI2lyxbi+2Z
         4pjg==
X-Gm-Message-State: AOAM533fGlDmhCXotb1trhpGAIvX2rAV7DKmN4Z831vMZtwsu6t+yJQa
	wnw5ozPYBGl8G1revIwW2+tFk7EUDm/nkw==
X-Google-Smtp-Source: ABdhPJxbZQD1P9VmTwcBwo83IVE6LpSFxrPkfj+tOB1A88tB10+Ieq3hahvnTcEANQtwwQz06xYqvQ==
X-Received: by 2002:a05:6e02:1be8:: with SMTP id y8mr2239039ilv.52.1621018447314;
        Fri, 14 May 2021 11:54:07 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/5] xen: Fix build when !CONFIG_GRANT_TABLE
Date: Fri, 14 May 2021 12:53:23 -0600
Message-Id: <834f7995ae80a3b37b6d508d1c989b4ee391f61b.1621017334.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621017334.git.connojdavis@gmail.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move struct grant_table; in grant_table.h above
ifdef CONFIG_GRANT_TABLE. This fixes the following:

/build/xen/include/xen/grant_table.h:84:50: error: 'struct grant_table'
declared inside parameter list will not be visible outside of this
definition or declaration [-Werror]
   84 | static inline int mem_sharing_gref_to_gfn(struct grant_table *gt,
      |

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/include/xen/grant_table.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 63b6dc78f4..9f8b7e66c1 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -28,9 +28,10 @@
 #include <public/grant_table.h>
 #include <asm/grant_table.h>
 
-#ifdef CONFIG_GRANT_TABLE
 struct grant_table;
 
+#ifdef CONFIG_GRANT_TABLE
+
 extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
-- 
2.31.1


