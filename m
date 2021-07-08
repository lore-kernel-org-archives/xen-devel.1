Return-Path: <SRS0=QmZQ=MA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1A7C07E96
	for <xen-devel@archiver.kernel.org>; Thu,  8 Jul 2021 06:29:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74AB961C91
	for <xen-devel@archiver.kernel.org>; Thu,  8 Jul 2021 06:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74AB961C91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.152874.282410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1NXP-0005a6-Qr; Thu, 08 Jul 2021 06:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152874.282410; Thu, 08 Jul 2021 06:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1NXP-0005Zz-Nw; Thu, 08 Jul 2021 06:29:31 +0000
Received: by outflank-mailman (input) for mailman id 152874;
 Thu, 08 Jul 2021 06:29:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1NXO-0005Zt-Rq
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 06:29:31 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec565afa-8c9c-4d8c-abb9-328d26a49c9e;
 Thu, 08 Jul 2021 06:29:29 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx686TRYPP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 08:29:27 +0200 (CEST)
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
X-Inumbo-ID: ec565afa-8c9c-4d8c-abb9-328d26a49c9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625725767;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1eyEJColcB3QC1zip0cJhgsY6K/VL+/9YSaJUkfU8Lo=;
    b=p5Tj3JZToohdXCHQvZpPOFrWGOVlXd8uIxu0Uksja9T4dPGX7Hd4163io8WxmbUQbK
    yLs/D1b7WA5xDhDHLbYEo35OkfW7Hjo7FlAVEmVmVwoI0FZ1BO+pgyndgDeSbAwCvCcQ
    TKTg6WvqseNMdHPtG1mw8cOBEIyLilj7OORZIQ9Q9eVLlbyzGjufbAiao+grcO+0h6oy
    vh+RHjxclxNjGq9mdGe1zLibAMXsUonCuVI82xz7KNQZjdZstt17v/46dMfQ57b1TMBE
    IJZZtN4BNYKGQdfvDu/cR8T2440hFuiIbTWwfbomFzg3PFwVkVctwHiU95GPNCntaAoR
    ObgQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: dump contents of /etc/os-release
Date: Thu,  8 Jul 2021 08:29:22 +0200
Message-Id: <20210708062922.23393-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To aid debugging build failures, dump /etc/os-release during build.
This helps with rolling releases such as Tumbleweed to understand the
state of the build container.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/scripts/build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/build b/automation/scripts/build
index 46b6903d29..55da912fc5 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -1,5 +1,7 @@
 #!/bin/bash -ex
 
+test -f /etc/os-release && cat "$_"
+
 $CC --version
 
 # Express the compiler version as an integer.  e.g. GCC 4.9.2 => 0x040902

