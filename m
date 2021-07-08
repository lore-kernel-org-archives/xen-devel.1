Return-Path: <SRS0=QmZQ=MA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6EFC07E96
	for <xen-devel@archiver.kernel.org>; Thu,  8 Jul 2021 06:54:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F8761A13
	for <xen-devel@archiver.kernel.org>; Thu,  8 Jul 2021 06:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F8761A13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.152900.282472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Nvm-0002jJ-2P; Thu, 08 Jul 2021 06:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152900.282472; Thu, 08 Jul 2021 06:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Nvl-0002jC-Uf; Thu, 08 Jul 2021 06:54:41 +0000
Received: by outflank-mailman (input) for mailman id 152900;
 Thu, 08 Jul 2021 06:54:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1Nvk-0002iy-U4
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 06:54:40 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.163])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d336f9c-dfb9-11eb-855c-12813bfff9fa;
 Thu, 08 Jul 2021 06:54:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx686sbYW8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 08:54:37 +0200 (CEST)
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
X-Inumbo-ID: 5d336f9c-dfb9-11eb-855c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625727277;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+wON1GhjyCEn0KMzHsZrMJEuzljBNMj0Axm+cej/8jA=;
    b=ANc7PUq8f1eL1kIe715R0tApagnN6wsWNX84Ak1qNStV2PEWpFBTWsSMs0tQOmJwyT
    5FtvblIngDuJ5Qs8djCA7WvEfSa6KZESfShJWFzksqFmoCW7sspxh2hSBGYM/VR9Pmb/
    DpMFWIAvII0HKX0pnMS0++A9TBV8DUzoOTkMyd8xu5KvHLIIggvUOl/p9fSiYcLSt5uF
    xU/MRU3pfVhvyv7Xn9kHvnI1fwZsFaXX560D9pkI+kHuLMLMxuKY9NUeyY3CiihVENc+
    t7C2G7isa4gU1fkwXpssAegK9rebVDiQrnbN1NKKHLa6Rpno+sdbVZT3zoDOHyEsXcK7
    ioDQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: collect log files in subdirectories
Date: Thu,  8 Jul 2021 08:54:35 +0200
Message-Id: <20210708065435.24515-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current single *.log pattern collects just config.log, which
usually contains little useful information.
Collect also log files in subdirectories, tools/config.log usually
contains information about configure failures.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/gitlab-ci/build.yaml | 1 +
 1 file changed, 1 insertion(+)

No idea if the syntax is correct, and how I would test such changes myself.

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 20d1d0cb34..d177da1710 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -8,6 +8,7 @@
       - binaries/
       - xen-config
       - '*.log'
+      - '*/*.log'
     when: always
   except:
     - master

