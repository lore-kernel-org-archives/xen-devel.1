Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C8606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Gt81tDCC
Received: from list by lists.xenproject.org with outflank-mailman.1494944.1694182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjKG-00047T-7I; Wed, 18 Nov 2026 17:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494944.1694182; Wed, 18 Nov 2026 17:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjKG-00046s-2C; Wed, 18 Nov 2026 17:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1494944;
 Wed, 18 Nov 2026 17:20:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTjKE-0003hg-BH
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:20:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjKD-00FOXj-Nz
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:20:01 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdde10-e002-0a2a0a5209dd-0a2a4502dad4-42
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:20:01 +0100
Received: from [40.93.196.46]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdde3e-4900-0a2a45020019-285dc42e76fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:20:01 +0100
Received: from SJ0PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:33f::26)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:18:11 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::28) by SJ0PR05CA0051.outlook.office365.com
 (2603:10b6:a03:33f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Wed, 18
 Nov 2026 17:18:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 17:18:11 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 11:18:08 -0600
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
 b=uK0ouI8DAotcTeV3KgitU8nINlZ2H+FEdroW854hOUiuX4rY/cUbDZS9GZgkwhnDh26P85sB1xWGTTmEYsGSfJDBolAo+B0wqI/EAdYicIpJl5lwS8WnTVoag6XX/qE7nCW1aVFzHodt5Zco8q8YDLw1zhAoJ+1QzhkEqmCgy+pFQyNKQzvreMr0AwryemtoxBOTwFXdKL7ndVb8NOS0E+jnqkhSfWKN2c4zIebaz+zXEjnne4uJuAuWYOws3zWiqrOP+wb8ksQBov6tsRGZ8OH2JMBy1I866QV1UYm7IMAISDRxntBjxvpcu+G0QfjaMgvDp3ssCN8f9aEYBtgvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHYyEvK/4hmjKji09uiriCo5p7j7RsCBETyKs1bAt0M=;
 b=aI/pGgqJMYxwdXaCrnyW7vOQP27MjO935SlAj/spNVBSsgz8wPjkQewks9vJw7yP5O6F/FTdI7nayNVhc74PWDFeKAlqK62g4qRTKPu3qMGVpDyCM4eK4u4DgN8DgHLCdBbRGYROyEFq8U044RHpTNighlqIDcatUHP6b8p1/QrWVqDjybXhwXscFHALe1XVLSVqL+ExS6MXb5tuZ85vcIAnp4RtF2b6Nmeaye9f2UBsz5OrUqqQe5Q0M0+adKjLaR/5fkCj9/qsVnp9NzY4XprIOkAHvJXx5s9suSk3SLXR/Rc//+3BaWa5rFSY4wzg1FuvXnPbIs0008fWozV97w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHYyEvK/4hmjKji09uiriCo5p7j7RsCBETyKs1bAt0M=;
 b=Gt81tDCCMu4nCPrebDq6KvsiU63wxRdb124KAHjzNvRlBwMyJEzxfcczoE0xeg38M+vjuklFrhEoubwtpO20ZXH5nDE6bhO6Ld52XMWa0sokJThWBDsxnOd5nwi8PvMbNXofRnmIUViNwjPHdfa4VTNOswLAUeuiPzuDlA2ire0=
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
	<teddy.astie@vates.tech>, Nicola Vetrini <nicola.vetrini@bugseng.com>, "Doug
 Goldstein" <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [PATCH 0/5] x86: Add in-scope files under cpu/ to MISRA scans
Date: Wed, 18 Nov 2026 18:17:51 +0100
Message-ID: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c02c2f-e9ed-44d2-06ad-08df4597ec09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|18002099003|261009223027099003|56012099006|11063799006|260925022911599003|260925021311599003|260925021911599003|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fw8J+YmShEwkDWsgwT9BL0Zw0iIVuQib/geryS8FN1juWuKB9VeMR3MBDtQbxr22iFzEX/2gBGanE41lkCyvye2SMW4T6u0ZtQjj+NgSUW7elWIDK+1xqs7QRc2khWJ/jLeOfYrhHd8KgTrQseFidjyjvo/fYk7XhG51rgrW28Mt2M5waTBAEUzzjN+j64HevOCHsR/rxpCC1sZkKzQ+0l9UXUzt+leVPIDt3ryeK3v1FjUHtg61OcsMnjsvQwgjdDarhHfqftz0J/VwV+BUq7jpDdHMt+64wPkTvjQKmLTh8TKBMNKIzfsX5NYYBhn/dAS8XWQdoxTAI2OIS0ZAYjEBMN+qys5CAKy5zda3iYUjadbeFHHC926+AL265LZ5GURuxGBRtTza4YDs9Cn4929w2AeS5Af/IWqEA3Xs7GnY4L10L8AiztNlbA6uX+mA0HeX3Lyga6DguItuxs/fpwNhRRN/U79ZjZxzEUMjjdhEgr1TXC8vJtKuNR5wD4TYcof0cwV1iUS8w1ahQaz+G3Grl6CmXxBSnrz6rWBHsIwFOScG/5RVEQSpblGV7ZxQbnvcd1PdaM6tPofAFr8GBhpggSgMXUuNN9tvzywttYlMm1wyigyyYIomsTrcUY+cZbIvKIjs5mHugaiCSWRH5VE0eW2LlwLZEo1Vuzvzc6vPEc4jKvrwY7C4HfWk5X78DGspgqucl2Heh1uTo51sjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(18002099003)(261009223027099003)(56012099006)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bioxEU1aLEZpJtPRH9HKubOB9Dtg2LDd4nw9UVy5sbjwAKV7VU6tP1/Q8OSD9/Ot5Rwc6clibmX5FoyxFbQThx3IeyslRqtrLCAsL0QiEWFtP+tnk/8pO6tuuPeMApkaEREpCxqd6wfU+nnYsnPTcSIRg0Fl9WHMyyHCZwbnrN63Zbj4YR5I3pCdfBikMrdr+KDwKqU+wucu0pycq8fDuV+u2mW95YEhrbqXXO2LXjmh0myUdMl7BI4se+ZXUhc6YCYSNOny4FROXzd75/jE3PjgXcax0OY3DCJW+kfKG3E8CjZNxy5bC9GVH6AYUUIxAatgepAx6Ltim8RdFsUYIoRC5qnNhedVXSjOZA5XiDPcUiS/N39X+z7Wh96mqP6H3cyfMdpbKLE3On7lPIgC1fkUOFhSNLTZEA4Qs9tJeW+1OMdjiPJlhrGHdK1VqdC6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:18:11.0957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c02c2f-e9ed-44d2-06ad-08df4597ec09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455
X-purgate-ID: tlsNG-720697/1795022401-333936C6-F31A4000/0/0
X-purgate-type: clean
X-purgate-size: 1644
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The files under cpu/ are excluded from MISRA scans due to their Linux
provenance but they aren't kept in close sync. At best they get
semiregular updates (mwait_idle.c), but most often the files grow with
Xen specifics bops that get a free pass on MISRA scans merely due to
colocation with ancient Linux code. Some files just were never part of
Linux (hygon.c) to begin with, which makes the blanket exclusion even
less credible.

This series brings everything under the MISRA scan umbrella, with the
surprisingly few fixes involved.

eclair pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/jobs/18149225087
regular pipeline (still running): https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/3085381461

Alejandro Vallejo (5):
  x86/cpu: Add break to early_cpu_init() switch
  x86/mtrr: Address MISRA C Rules 5.3, 8.3 and 8.4
  x86/cpu: Use U suffixes on integer constants
  x86/amd: Make cpu_has_amd_erratum() non-variadic
  eclair/x86: Scan in-scope files inside cpu/

 .../eclair_analysis/ECLAIR/deviations.ecl     |  3 -
 docs/misra/exclude-list.json                  | 36 -----------
 xen/arch/x86/cpu/amd.c                        | 62 +++++++++----------
 xen/arch/x86/cpu/centaur.c                    |  4 +-
 xen/arch/x86/cpu/common.c                     | 49 ++++++++-------
 xen/arch/x86/cpu/hygon.c                      |  8 +--
 xen/arch/x86/cpu/mtrr/generic.c               |  6 +-
 xen/arch/x86/cpu/mtrr/main.c                  |  4 +-
 xen/arch/x86/include/asm/amd.h                | 11 ++--
 9 files changed, 73 insertions(+), 110 deletions(-)

-- 
2.43.0


