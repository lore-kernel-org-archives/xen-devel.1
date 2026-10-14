Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A9CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 15:22:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449220.1665121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0oT-0007Rq-8f; Wed, 14 Oct 2026 15:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449220.1665121; Wed, 14 Oct 2026 15:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0oT-0007Rj-5d; Wed, 14 Oct 2026 15:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1449220;
 Wed, 14 Oct 2026 15:22:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xH0oR-0007Rd-Ck
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH0oQ-0054IX-PV
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 17:22:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b020f670008425@swg.vates.tech>)
 id 6acf9e28-bab6-0a2a0a5309dd-0a2a45019c48-30
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:22:38 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b020f670008425@swg.vates.tech>)
 id 6acf9e3e-5984-0a2a45010019-b9ff1c238475-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:22:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13b020f670008425.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 15:22:33 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 76B1481BCB;
 Wed, 14 Oct 2026 17:22:32 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=A8sHI/yxdD7EGEEsGfldTNO4aLbKY4QxpUNwYX/+Am8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=pnA5kpo9/CXUiuJCuA6oDHi8SeCdyWWPEHUaQlr8ZRZxHFBttNb2wxxT3OEcbbvmI/VAT0Atj
 0q10YIaq8d0WA8p18bExMGASnJffRkS3o/oAJbuKj+t2/m4wR4l91j21WkwOfjVTAckmBV4rxql
 xlPafnmCHJcXCHoluBOadN2mqSCUhjHad1hz1c0JVkJ8Tfle76jujyLRl3MdH1vJe2MFVIBaegU
 yvBWqjAuascqUArpokt33UEWF0jx4g/2mWdh5dc0lspn6Q2Wo4C8KnJpKNXZAnBEw/uX2wlu+y8
 zQeJmz/sigMOgxfGbrILP2Ml+kUfcIAp8d5FsN7dWDbA==
X-Zone-Loop: b6afe5d417ef7e7baa6cd5f81c1c16f1f6ac19b5a7e7
x-campaign-type: default
x-transaction-id: 13774384-da68-4d3a-856e-45fff06d7ec0
x-swg-uid: 01-342cfded-2c41-49ca-879a-9089e3454714
X-Mailer: Sweego
Message-ID:
 <1791991353.8631fc262581453bbf619ec5b2062170.1a13b020f670008425@vates.tech>
x-swg-bid: 1791991353.8631fc262581453bbf619ec5b2062170.1a13b020f670008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/1] MAINTAINERS: Add myself as RISC-V reviewer
Date: Wed, 14 Oct 2026 17:22:27 +0200
In-Reply-To: <1791991262.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@vates.tech>
References: <1791991262.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791991352675
X-purgate-ID: tlsNG-d62444/1791991358-BF86F757-2C7CA9F1/10/73395122804
X-purgate-type: spam
X-purgate-size: 515

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c60afc93a5..b804434d52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -517,6 +517,7 @@ F:	tools/hotplug/Linux/block-drbd-probe
 
 RISCV
 R:	Alistair Francis <alistair.francis@wdc.com>
+R:	Baptiste Le Duc <baptiste.le-duc@vates.tech>
 R:	Connor Davis <connojdavis@gmail.com>
 R:	Oleksii Kurochko <oleksii.kurochko@gmail.com>
 S:	Supported

