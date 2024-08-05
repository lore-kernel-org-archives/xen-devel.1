Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F975C52D70
	for <xen-devel@archiver.kernel.org>; Mon,  5 Aug 2024 09:34:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.771900.1182335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau71-0006my-W4; Mon, 05 Aug 2024 09:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771900.1182335; Mon, 05 Aug 2024 09:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau71-0006lD-PI; Mon, 05 Aug 2024 09:34:43 +0000
Received: by outflank-mailman (input) for mailman id 771900;
 Mon, 05 Aug 2024 09:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4fqT=PE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sau70-0006k4-QV
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:34:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f074c511-530d-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 11:34:40 +0200 (CEST)
Received: from truciolo.bugseng.com.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 6F4E54EE0737;
 Mon,  5 Aug 2024 11:34:39 +0200 (CEST)
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
X-Inumbo-ID: f074c511-530d-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/2] automation/eclair: tag more rules as clean
Date: Mon,  5 Aug 2024 11:34:31 +0200
Message-Id: <cover.1722842330.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort -v monitored guidelines and tag more guidelines as clean.

Federico Serafini (2):
  automation/eclair: sort monitored guidelines with -V
  automation/eclair: tag more guidelines as clean

 .../eclair_analysis/ECLAIR/monitored.ecl      | 92 +++++++++----------
 automation/eclair_analysis/ECLAIR/tagging.ecl |  4 +
 2 files changed, 50 insertions(+), 46 deletions(-)

-- 
2.34.1


