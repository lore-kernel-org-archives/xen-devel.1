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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3F8C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 04:18:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8ED61442
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 04:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8ED61442
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127185.238992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPH0-0002MI-OX; Fri, 14 May 2021 04:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127185.238992; Fri, 14 May 2021 04:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPH0-0002MB-KC; Fri, 14 May 2021 04:18:02 +0000
Received: by outflank-mailman (input) for mailman id 127185;
 Fri, 14 May 2021 04:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhPGz-0001OI-PR
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:18:01 +0000
Received: from mail-il1-x129.google.com (unknown [2607:f8b0:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7257c6c0-4170-4379-b10f-cec379add951;
 Fri, 14 May 2021 04:17:54 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id j20so24780813ilo.10
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 21:17:54 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g11sm2401505ilq.38.2021.05.13.21.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:17:54 -0700 (PDT)
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
X-Inumbo-ID: 7257c6c0-4170-4379-b10f-cec379add951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aZUcLbAyYZr/mu1DuUlZ6kf0uoeQ0LVDzaRiHOP28GY=;
        b=ivTifj4x38uZkQDMLhQcm1GuvzLQ3TzyBul3hVo/nHjNJWoOdpeEMYIvLK71DkZSUU
         /LS3ZSt/yGGEBZcGE0lM/eHQpTaD2vwr7jhJjPyEX9jVzn35wfszV55Zd6ifdC5Wmzrv
         rJPX+SYpAbS2dc0GbPQNK9m0aOQJtWxhOqrJMiLmsZF0x8ILCIE1kMB2o+IL9QkKWdVN
         aafh2dQgScTIjVWr/yyxU3TaxXxZmSSKBMQSxHqWaDK132vi2+VDCLO1yAcDKz1B9bqw
         9YHRdR2cZ+7OBh/kNskMHo/BscvqmrTpCHlnYZ/zsYf6VgMvk2LSecmbJoQMM5hKkzkd
         9biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZUcLbAyYZr/mu1DuUlZ6kf0uoeQ0LVDzaRiHOP28GY=;
        b=WT5TJgscEDmVLModMM326FwYTFIAjNmYejdX4r614thgc6uHKFl7Ir2ShKrEy1YDs/
         fLkLSzA3pXt70ayHrBVeT9h+ZdVoTP5VQykUvKbyx39OpB/aUc+uOAqBhzCB4KaBF0ta
         ebwqkJVAnxxfAL89SeueO5aLs6pdIAVgV1y0X0uo+eu1oOA5CHHJvYtmkuW0deoN7V7/
         dx2eY/ImtWJJX/I7Jo0NLwMgaKnDHOolt2wCIP4NUiNELpgQv7/yEiRMC2ywjenBJs9S
         4/J0VmeheSnlUI00x6Cmv223HLW4Rv2pdX1zGMy8VT7GHJd80fw1Xv3zFDdziXLCOBjG
         nSlA==
X-Gm-Message-State: AOAM5333BTmXcCl5UhcxdcHmQoylVYR1vZJPegeRLZqzObfHraiV1wFb
	qrFQFXh9Vy9Spne9KYlPFJFjYaSxJYfQGQ==
X-Google-Smtp-Source: ABdhPJxYgVIKTsFkK5X5NNbwPOKWiV1blY4u9yJdwXEOsFjDzN/gIMSGEZ5yTJsADZ7uPelTf3QhFw==
X-Received: by 2002:a92:c645:: with SMTP id 5mr4223943ill.142.1620965874438;
        Thu, 13 May 2021 21:17:54 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/5] xen: Fix build when !CONFIG_GRANT_TABLE
Date: Thu, 13 May 2021 22:17:10 -0600
Message-Id: <834f7995ae80a3b37b6d508d1c989b4ee391f61b.1620965208.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620965208.git.connojdavis@gmail.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
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


