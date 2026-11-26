Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E28606A32D
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RaXJNTq+
Received: from list by lists.xenproject.org with outflank-mailman.1503611.1699256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbnt-0003gE-Hp; Thu, 26 Nov 2026 15:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503611.1699256; Thu, 26 Nov 2026 15:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbnt-0003fe-EU; Thu, 26 Nov 2026 15:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1503611;
 Thu, 26 Nov 2026 15:54:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xWbnr-0003en-Vz
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 15:54:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWbnr-00G0k4-5D
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:54:31 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b08562a-e002-0a2a0a5209dd-0a2a450886f2-22
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:30 +0100
Received: from [40.93.196.27]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b085635-f659-0a2a45080019-285dc41b3222-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:30 +0100
Received: from DM6PR03CA0164.namprd03.prod.outlook.com (2603:10b6:5:40::43) by
 CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:54:25 +0000
Received: from CY7PEPF000000F6.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::8b) by DM6PR03CA0164.outlook.office365.com
 (2603:10b6:5:40::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:54:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F6.mail.protection.outlook.com (10.167.247.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 15:54:24 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 09:54:21 -0600
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
 b=Hovx5AuK3s9xpTf1Yt4HE8jlsPCHTLUSA0KrOg/z/E0DJIBSl0KocNzTY5Qg+Nf8kkmip65l9OHTVLFh7dFmzPtdfpq6G02QZq1yrYG48bEyahXiiFHDVKvzOUvuP8XlFdMn+TG8+Bxbd1pixn3eATwmqo/u20aamfv6SK8xUNUA6uPoD3j0tJ7pejzHyn1y8ttGDM53egoHm9ZU5q7Z6szgZed/dW0Ew2/c2Af9o39vC3GjREtEvpmNjhtawjtuhFr9OKIWAgJrkc9dvFFZqMXmtZg09EovExvSQ0D4xhgQLp/DAYxspHA9iiYzR0xzTklTXbEYKKcmomhUHzar6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYJLPjdOIwxUYhOMlT67601q1Td3VYEJotc+XBZ1ZjQ=;
 b=D26B2AWAdEonXsKX+w+ejLjwyWbr266UwQp4hGJcj4JdyNoNpUh9XZFSrFFEyxg4ew4odzE+qp+1aN/yPtSyimtwuk62kI7/p2WK+36nGc31BmBlFl1cZ37F7E4yU7BzRGZRQGeXyonERHdBkU1EZ4zD3Oud0uzvuCIBSZkWfoRHNHs03vvfsDIRjIprANkHvUXUfDNMjJSNIpAFYzDrqrBAP4/PAATND49QNAiWEoNEA2qXnCukZfFsGEBZ7NxOdwgkyRYwKtG1fXAFzyrsiB++NB2y2VGkyjFFEYdiYvm++1UQXTXWomIfVfQ7E8+IVBZjy3/BpiWMvch8cJ8f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYJLPjdOIwxUYhOMlT67601q1Td3VYEJotc+XBZ1ZjQ=;
 b=RaXJNTq+zN5eYoXEcs8R73EPelVwm2tmBqTffIQ/GWgwdNerBltukcXMLTVch1deBBgsBsV6FOZDy9KIdHpYP/3bCwt9GNeH0J1b3sNx0JMj7LTZQ3my2p0c8HAr1eJpVWDktkcC2VEOUV3GnDft3u0J1zDc2OJ3wgqpfjdVXZo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [PATCH v3 0/3] x86: Add in-scope files under cpu/ to MISRA scans
Date: Thu, 26 Nov 2026 16:53:58 +0100
Message-ID: <20261126155404.3996205-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F6:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 429e143b-f762-43db-1f82-08df4bd58b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|23010399003|261026121527099003|10067099003|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261021123027099003|261026140227099003|261022075727099003|261028144727099003|261022105027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	gVmFxKNLNbkc/8B+VcugjywJUxFwR8yzx91WFYtn3edCoCjuZcZzqiJAcPjdeSAB/dIfDuWR3jnDTUJPuvjf88FLzRPDFeYyMbAbqrRyBU3VxBrKrstXnh96fgYyEO2wDI/hRhm2iH4/t9JrKbabToYYCstxJ3J63E3SUwy0SwgWNhOznSb4x2KXrACiBDPZpuPF/n4mjgXP/pY2Ot6Vf2deIwepqf5krLm07M7jt9ZiNwZ6Son1yLJIV938HMz7SmEcOZ6FmHlR03bNrq5sJgls5VzDnBJVtYHOeL9J4GX3WU9+tbN74SRXBBkt2wyVa+YqneLCC4mh4ETrgUpeCGLSMyvzi12tQLYQW2t1CMycEQFy0DNJlEnwqHGRJ/NckRBwiHifSgHy8PlHB5MQVLkDrWPI63/jWMmQl4MwdXcy2GaWNzWElvx8rFGPi1z3qzeqoHj9q7HZzqwZQZTvtmJ6PQ/sc91E1N0YCRn6kbK9kqXh5gO7HWsYSuWRL+0mSCcwNlQkwyYZKYJP/ckcXxPyWz4YrWGGIQsHmeYZcpeuojTjCF9tZdRLncnIc0OMmM0JsQlMa3jNhs6NQCMM4UiuHRB2kYR/gseiRgrhe17g/t1neuXpvsvjzcG5OXHNS07/e2c8eXEUrB/SDscGmWJwNxhZU1fbAx/sCwYlaWE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261022105027099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/exeGB+FBhyDycvFoMymdR7aYClLr1DM5zBVtLi4Mb3fRuymGiQXdM91a4YlFLXoCloQ2Do51vfc/X/2wAPqHsmAEs9m1sF0iF+FNEpI0LBNm1P9qXNXO1UhIQLYU+fFstRREB8kDI5p0hntlV9yWGQUlz1Nr19Bh1DGWC73CfcAF9MOUdlzSxlHzgTRnYDn2+wXa5m+c38QQbk5O4Y6+AI9bgeOzMAAjGxSVewFRvFys/odEBRMhO+Z2CkK+UmZxLjsQQEyFgMrESBOino5bQsu5BDZzD++kwG4vfya6NaOOvA5rXxBmS2bEYYyON4UiWJO1w+IkeJjxNViV4qRgWmWVqf8cTtu6kQfwYTAfsRD6jTtRWDx6HYuWKqDMvRZAl29LzkVGlHLCusuqJ1uXMAReVzJjU1+h4omkqyFwjwICLqxaw4aeTqucnSSx+nb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:54:24.2615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429e143b-f762-43db-1f82-08df4bd58b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
X-purgate-ID: tlsNG-c1860d/1795708470-D6F5F87B-199403FE/0/0
X-purgate-type: clean
X-purgate-size: 1733
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

v3:

  * Bring back Fam12h
  * Fix off by one error in Fam12h handling inside errata 383

v2: https://lore.kernel.org/xen-devel/20261119144453.529009-1-alejandro.garciavallejo@amd.com/
v1: https://lore.kernel.org/xen-devel/20261118171758.1125066-1-alejandro.garciavallejo@amd.com/

Original cover letter:

The files under cpu/ are excluded from MISRA scans due to their Linux
provenance but they aren't kept in close sync. At best they get
semiregular updates (mwait_idle.c), but most often the files grow with
Xen specifics bops that get a free pass on MISRA scans merely due to
colocation with ancient Linux code. Some files just were never part of
Linux (hygon.c) to begin with, which makes the blanket exclusion even
less credible.

This series brings everything under the MISRA scan umbrella, with the
surprisingly few fixes involved

Cheers,
Alejandro

Alejandro Vallejo (3):
  x86/amd: Fix off by one error in Fam12h range of erratum 383
  x86/amd: Drop cpu_has_amd_erratum()
  eclair/x86: Scan in-scope files inside cpu/

 .../eclair_analysis/ECLAIR/deviations.ecl     |  3 -
 docs/misra/exclude-list.json                  | 36 ----------
 xen/arch/x86/cpu/amd.c                        | 47 +------------
 xen/arch/x86/domain.c                         |  2 +-
 xen/arch/x86/hvm/svm/asid.c                   |  2 +-
 xen/arch/x86/hvm/svm/svm.c                    |  2 +-
 xen/arch/x86/include/asm/amd.h                | 66 +++++++------------
 xen/arch/x86/x86_emulate/fpu.c                |  7 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        |  5 --
 9 files changed, 32 insertions(+), 138 deletions(-)


base-commit: 13d4a6776b931481984e0c1caf5a228ace3ec701
-- 
2.43.0


