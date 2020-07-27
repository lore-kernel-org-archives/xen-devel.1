Return-Path: <SRS0=5MCE=BG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1370AC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 16:04:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CD12074F
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 16:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="GQk2w304"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CD12074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k05bx-0001Qb-OD; Mon, 27 Jul 2020 16:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GrHA=BG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k05bw-0001QW-S6
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 16:04:21 +0000
X-Inumbo-ID: d459d658-d022-11ea-8ad3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d459d658-d022-11ea-8ad3-bc764e2007e4;
 Mon, 27 Jul 2020 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGzMCkkCdnk4jadoJ/DjFhZHwkxgms05YWDAwzdOhss=; b=GQk2w304VYKGoSzyElL1/si2Fw
 3TP6rtw/ZHq5EYCMcCCGqkat7XAMnWNU4eFUHTRgW10dnwwHapxAA1kmc6F3q+D1GSvcHrmYJHBTZ
 RMEt+VRRfOuoqond1eU3sTJnoXcidhuf6N40rmV1NIKFspxiOn8IOHxHc8nZ4iOMMc4g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k05bv-000462-Ha; Mon, 27 Jul 2020 16:04:19 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k05bv-0000hr-6W; Mon, 27 Jul 2020 16:04:19 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [[XSATOOL]] repo: Add missing spaces in the configure cmdline for
 "xentools"
Date: Mon, 27 Jul 2020 17:04:15 +0100
Message-Id: <20200727160415.717-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Julien Grall <jgrall@amazon.com>, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The operator + will just concatenate two strings. As the result, the
configure cmdline for "xentools" will look like:

./configure --disable-stubdom --disable-qemu-traditional--with-system-qemu=/bin/false --with-system-seabios=/bin/false--disable-ovmf

This can be avoided by explicitely adding the spaces.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 repo.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/repo.go b/repo.go
index 1e7802f8142c..f00b7469101f 100644
--- a/repo.go
+++ b/repo.go
@@ -139,8 +139,8 @@ func MainRepoInit(unused *XSAMeta, args []string) (ret int) {
 	G.config.Tool.BuildSequences = map[string]BuildSequence{
 		"simple": {"./configure", "make -j 8"},
 		"xen":    {"make -j 8 xen"},
-		"xentools": {"./configure --disable-stubdom --disable-qemu-traditional" +
-			"--with-system-qemu=/bin/false --with-system-seabios=/bin/false" +
+		"xentools": {"./configure --disable-stubdom --disable-qemu-traditional " +
+			"--with-system-qemu=/bin/false --with-system-seabios=/bin/false " +
 			"--disable-ovmf",
 			"make -j 8"},
 	}
-- 
2.17.1


