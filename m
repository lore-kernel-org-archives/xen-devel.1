Return-Path: <SRS0=qvPz=J6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA1AC43460
	for <xen-devel@archiver.kernel.org>; Mon,  3 May 2021 19:35:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E56E160FE3
	for <xen-devel@archiver.kernel.org>; Mon,  3 May 2021 19:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E56E160FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.121851.229874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLk-0007ls-IK; Mon, 03 May 2021 19:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121851.229874; Mon, 03 May 2021 19:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLk-0007lj-Dx; Mon, 03 May 2021 19:35:24 +0000
Received: by outflank-mailman (input) for mailman id 121851;
 Mon, 03 May 2021 19:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeG9-0005i5-Kh
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:37 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c8daf29-0926-4ea5-aa7a-809e84392228;
 Mon, 03 May 2021 19:29:02 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id a2so6255843qkh.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:29:02 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:29:01 -0700 (PDT)
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
X-Inumbo-ID: 4c8daf29-0926-4ea5-aa7a-809e84392228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=erQS8MRQTBPyaLr9w4i+Rj4rOpKDbVN/1THD8knRDvQ=;
        b=dQKe7cyABPeD48VAX3db6u/qUzVypeOxvLgjMiBKfIpOVibjTxeqgre/U83sc9GrFc
         AR7pYs/BDNWM50OPm82rfAKqYpRBektJDSp7cey9NoIPTLDg3AS3sFvrhnJpuI7rNUhU
         TKQNAF8+A4cvjClJ608AzTjs9pu5WbLbYOEQTbXw2J52ePciHcTLLVjdVKjCqgC74vf1
         gpxF8JGBCUy1zAHcsz9eLjL0fX40KyAjbtbbNEF2qH/W4X/q2CXhrqWLE0odGNBo4e5n
         pb1aEtdDQfHr4o49IkPhCdLf79/JTUy5PspEGfEK9D/qpzc2Oj63iDzYnQSfHvRSElyi
         EX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=erQS8MRQTBPyaLr9w4i+Rj4rOpKDbVN/1THD8knRDvQ=;
        b=BVGwDR1WEWGsuHzSOHVIxu+ovVQa1+LIlSSzSrWMYfV+vP7nQyhSdnNIPtSgPyogk/
         wTtO3M65pjrwXV/mZ3vlOv5AE8eah3VFAByzGD7LCHVfjgonnnR/EM9D/UOEzLKE4IS3
         heqiccjbhC5Z62W+dLcsAMiW3Ls0h1B6hcAKwpLRNH1vZng+q4cUx97RPaJY7kGOtbnY
         Zy40hSvQ45NQJaUqBhrKwhQyFaBOL17t45Lr+cm3SYpBHZY0KxHqZ54aaIWuXL9hKgBI
         w3C/OURAFAMvFjL77x+0Yrd4KwJylNrqYY+9vEr3zq6T/hEFg5+XbS6KY1rijQzTKBUx
         SqCg==
X-Gm-Message-State: AOAM532YLWHQZmcdouqPmXkV8svYdiOEZLaFqZstaLq99W1ZdrdLBFTD
	xpkmsFt5twzs5wD39eF1wsLxTAXBxNE=
X-Google-Smtp-Source: ABdhPJyvhYdeVdpTZBj+YymLg3IRFM/mMFSZg3WdY7wyW3IoyBL6i7mCWd0IT67+lDvZ9fiTkPtjZw==
X-Received: by 2002:a37:8443:: with SMTP id g64mr21293992qkd.185.1620070141508;
        Mon, 03 May 2021 12:29:01 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 13/13] CHANGELOG: Add Intel HWP entry
Date: Mon,  3 May 2021 15:28:10 -0400
Message-Id: <20210503192810.36084-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 0106fccec1..bbca67bc0b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -5,6 +5,8 @@ Notable changes to Xen will be documented in this file.
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+### Added / support upgraded
+ - Intel Hardware P-States (HWP) cpufreq driver
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
-- 
2.30.2


