Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF7606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2yJaCX2H
Received: from list by lists.xenproject.org with outflank-mailman.1493343.1693383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTS1T-0002GW-BK; Tue, 17 Nov 2026 22:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493343.1693383; Tue, 17 Nov 2026 22:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTS1T-0002GO-6r; Tue, 17 Nov 2026 22:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1493343;
 Tue, 17 Nov 2026 22:51:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTS1R-0002GI-KG
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTS1R-00CLgn-0o
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 23:51:29 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcda2d-e002-0a2a0a5209dd-0a2a4505e682-42
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:51:28 +0100
Received: from [40.107.200.21]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcda6f-4cb1-0a2a45050019-286bc81568a2-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:51:28 +0100
Received: from BN0PR10CA0021.namprd10.prod.outlook.com (2603:10b6:408:143::24)
 by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 22:50:17 +0000
Received: from BN3PEPF00022BCC.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::50) by BN0PR10CA0021.outlook.office365.com
 (2603:10b6:408:143::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 22:50:17 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BCC.mail.protection.outlook.com (10.167.248.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 22:50:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 16:50:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 16:50:16 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Tue, 17 Nov 2026 16:50:15 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFeL4uHjkumQzBefnLfHJgxSU/rlG/VqfcuaHVTo0smLbvbb8N9UAHyglVw+rnht626zKjeLC3yJVq5nmkW7Ny6/v63ahFd+7wG+N7OMseu4H2LfzP2PIgwOXYtpfvJb7G4/CbQ6HWI/puF328/0eG7FEA8vjipUBlaa8YMDnJQev5njESg3KnoD/eoEzCMvF1fsGgpBNULW0/dw8N+KoxHOIdXFwOHbqbRCry/+c0I+j6B/l+6DjT/aHoWMcYbBzx3UDGKk09GsLoa+r8RyvGkN2ckbGuqL0sWSwC7srSd2ul5uklYWWMfKb1wTdhO/gI2nBkkyu7Tg1XN5VS26yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Pb8Q0CFeGGj5xid/ea+m9eBAyi784Yf4vPGITLGw8s=;
 b=S7vuXn1gyBvtDEVq5g8AgtdYQpP2TNWRAlvppe4cuQUO1se7Nn5YsAm+9ZMenEhBKFp7ldIPKWBMAFZwxdn6aI8PFZ0sq8PmMfGyND9lzIE+kE0hqvCT8tXFqQt1H18L5e8fv9FGGrb4sH6+/sw4+CJXuaEnkJgrLbUAkdk92ev5GAeJmpTxQH1Zcb5hfD4vxZVQPF/XSWdl2eWwXEab2O2qxBW6Lrs673d/kyPrTpMdyRmsR1aWFZQg1t7EQ6evl5agTgvOfYn0chs4D3FJs+SzcwL3S1zRzYilCWsF3kLxt9pM7RfhKjXnLLFighbtyNkDYq2BL/iPqHQyKcSMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pb8Q0CFeGGj5xid/ea+m9eBAyi784Yf4vPGITLGw8s=;
 b=2yJaCX2HzqC913gU6iPT7LboHYnsDGwKiQzY2tQ4HpTJkAMTrYlhjij/T7utm9uvjc/dTTPZIvNute1wfwc1x+m3Vpbo66ER4St+1NkYkKU7dXFbb7zk9FcDmCg+WMNjFlsz20dhdYSWfxDvpiurE68dHPtoilVIuP2sDLu3HIA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] misra: note the plan to remove the R2.1 deviation for unreferenced functions
Date: Tue, 17 Nov 2026 14:50:12 -0800
Message-ID: <20261117225013.2609286-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCC:EE_|CH1PPFDAD84AB72:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb01667-aa95-479e-47e9-08df44fd2646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|11063799006|56012099006|10067099003|261021135927099003|261021121427099003|261022105027099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|261026140227099003|261028144727099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5Fdh8kUGlzBW7uis67jbAguOS/MMoMYqT8wMmFaoCow7YgEaWxfpvkN+jmD2f0aPMhXQyBthXOTo4l6sHnJEkFI5hCs4rkTCay1HNMjIsdiyuhIyzeDLsWa1Qyc7fJsDDmb+MB38l6k1vW9bDb5Hn/Q7OB/H76SkdeG5mCwvieaDYLNv6VKp+DpwO+UB2uT0nvbO5TUIgKEVfufBnGBuV3OaHs77uG02bskrSV1J9iKQt90XpolSyNqO0Ou1qt9u+dpuzGa03JUuJXJLpSBN4KrsU1S0WHPPyngeEzOJ4Ec+csNbXiUpc7ZC9qkYmkv5EiTbY66Vu5c9scKkwpHR8khjpLhDCz1rvnsjFRNIABtISxSXsEwhmSvlosG6aLDngExeH3twA/PTBrzK//e2eM8LSrwVuBuwTZlbJbLXY4YCRWX6qUhgXn28+dIf6JORwSLdP0r2pQyMviuc8wvKXuYnYwtMHfnkynubiJgrJ9xCLOjn6QV/1PCmFQU0ngt7LL/GpI87YIzvJti/QDEtwvSWSWfGL2g0nYKkAOc19H7xYJUtsNKrHV+RPhjaQ2w4qqMy1bmTuNt3Oj8eu76JlHwEDWBW4C4TsJpnydgMYgO9kMVT2/9/k6HA82LmXKbAZarFGoN9GW0tx4k392OZr8upgTsBvgzi0gCoQKUcqaClowkd03sjJv124D7eaIhg0aEZVbCpuJj4jaXA/2RniA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(261021135927099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(261026140227099003)(261028144727099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y3HjaW8S6uvxxJKgwUzfK5qoE518f62nw2wM1Uombg3kIpqVU3mEW2r12aqWngVy5wsPaJolXM2yeCUlfYedCqDGcry5XBAK7fB3phX13fnoxNY1mf01V6S0Wt9waRv7pIYebcdhPfxno14KPMdLiyvLnxPD5DvBjoy90KFC/AKbfHwNogG7/K4QSn0AQ7UUP8mLs9V7hORRNzma6C5TcXeBXC1hiXb33GZoAK/8sCU49cE4NpwO8QuBD5YGB8xmJ2Rj1qjpJWX0tlt9hKDgQT0Gnyhm8olyG2SSD712BT0TayOIIhRhYPE736OxVbZ96RdOFXzM7uKUyNPv+iPBgbazGT1he8XydXLYWy4toBrUyX13QEdIN7nxS/zvKbhKK1Ci9XjDerSov/jyPst4xdWvTTaW4gcH8Z2a5e1cYbge7b0aSpN/a0gP2WvjU3KM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 22:50:16.9063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb01667-aa95-479e-47e9-08df44fd2646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDAD84AB72
X-purgate-ID: tlsNG-c201ff/1794955888-247132A1-D107C29A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2606
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ECLAIR deviation of MC3A2.R2.1 for functions that are never
referenced has a one-line justification and no entry in
docs/misra/deviations.rst. Note that gc-sections support in the Xen
build is to be improved, so that such functions are discarded from the
final binary and the deviation can be removed for them, and add the
matching deviations.rst entry.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>,
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
CC: Anthony PERARD <anthony.perard@vates.tech>,
CC: Michal Orzel <michal.orzel@amd.com>,
CC: Jan Beulich <jbeulich@suse.com>,
CC: Julien Grall <julien@xen.org>,
CC: Roger Pau Monné <roger@xenproject.org>

 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 ++++-
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d49af53055..fbcc1c04cb 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -8,7 +8,10 @@ Constant expressions and unreachable branches of if and switch statements are ex
 -config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with labeled statement$)"}
 -doc_end
 
--doc_begin="Some functions are intended to be not referenced."
+-doc_begin="Some functions are intended to be not referenced.
+Support for gc-sections in the Xen build is intended to be improved, so that
+such functions are discarded from the final binary and this deviation can be
+removed for them."
 -config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
 -doc_end
 
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 7b983db264..3b7ccddfac 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -64,6 +64,13 @@ Deviations related to MISRA C:2012 Rules:
        statements are expected.
      - Tagged as `safe` for ECLAIR.
 
+   * - R2.1
+     - Some functions are intended to be not referenced.
+       Support for gc-sections in the Xen build is intended to be improved,
+       so that such functions are discarded from the final binary and this
+       deviation can be removed for them.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R2.1
      - Unreachability caused by calls to the following functions or macros is
        deliberate and there is no risk of code being unexpectedly left out.
-- 
2.47.3


