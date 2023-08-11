Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F691C001B0
	for <xen-devel@archiver.kernel.org>; Fri, 11 Aug 2023 13:53:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.582441.912215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSa7-0004JS-IB; Fri, 11 Aug 2023 13:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582441.912215; Fri, 11 Aug 2023 13:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSa7-0004JL-FX; Fri, 11 Aug 2023 13:53:35 +0000
Received: by outflank-mailman (input) for mailman id 582441;
 Fri, 11 Aug 2023 13:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ho8F=D4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qUSa5-0004Iw-Mh
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 13:53:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7521f211-384e-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 15:53:32 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 4361C4EE0738;
 Fri, 11 Aug 2023 15:53:31 +0200 (CEST)
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
X-Inumbo-ID: 7521f211-384e-11ee-b284-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	andrew.cooper3@citrix.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/2] automation: avoid unnecessary analyses
Date: Fri, 11 Aug 2023 15:52:53 +0200
Message-Id: <cover.1691760935.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to reduce the analyses performed by the ECLAIR
runner by avoiding some branches already excluded by other jobs
and requiring analyses on people/.* to be manually triggered.

Simone Ballarin (2):
  automation: avoid pipelines on specific branches
  automation/eclair: avoid unintentional ECLAIR analysis

 .gitlab-ci.yml                    |  6 ++++++
 automation/gitlab-ci/analyze.yaml | 14 ++++++++++----
 automation/gitlab-ci/build.yaml   |  6 ------
 automation/gitlab-ci/test.yaml    |  5 -----
 4 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.34.1


