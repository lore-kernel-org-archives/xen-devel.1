Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A375606A33C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r/4WU/c6
Received: from list by lists.xenproject.org with outflank-mailman.1477478.1682904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9t-0004Bu-Kh; Fri, 06 Nov 2026 23:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477478.1682904; Fri, 06 Nov 2026 23:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9t-0004Bm-Gm; Fri, 06 Nov 2026 23:15:45 +0000
Received: by outflank-mailman (input) for mailman id 1477478;
 Fri, 06 Nov 2026 23:15:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPT9s-0004Bg-1d
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:15:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPT9r-00EGOA-El
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:15:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f90-e002-0a2a0a5209dd-0a2a4504b922-4
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:43 +0100
Received: from [52.101.53.26]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f9d-b57f-0a2a45040019-3465351aa0bc-4
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:42 +0100
Received: from BN1PR14CA0024.namprd14.prod.outlook.com (2603:10b6:408:e3::29)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:15:36 +0000
Received: from BN6PEPF00000074.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::78) by BN1PR14CA0024.outlook.office365.com
 (2603:10b6:408:e3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:15:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000074.mail.protection.outlook.com (10.167.248.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:15:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:35 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:15:34 -0600
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
 b=a/sSyjLAGfumVsdpUUC/Is7dfKjvAsaPHafqrgv1kY/Euodm8VzWctWcAJUsbDcamrgybBmnutcqpYtSJj6YOxqy7SDoymrb5a8g66Jyjbf1SCpNh7uMFjwnpl0HYpGWI/sxI9jeeDb1vajjGzC7Kvi66rRB4IMS4B6y0L6jSLhqkpZfxbt7deVxIuhsYCyuBCrEwBKRVQjBbtvUFuhrRMOG78uWdeXIfzsj35fH/hmjppu6WdBRi6ULbi4E7SjUCrp6WU5PhLtbA+YzvWgMAziHHZHknVMM+z8PcuWS7lTPOXEll5mKkFpFvkkS46MNtYPbSshijkkc1efdYHb2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxqQhZqwHsXHOKm0rECYycmd2JxoNJc4/VPLdaKqBJs=;
 b=KhuCzuzW3JFufXEBjRjY1UEAITx5NsW2U9cQgHtl+lMv+1ToWA1L1VFhDh0TqhaHBpZ72JWIjawARI8YDH/TNBPiJ/dOE06oEtedjyZIOmh3F/R4FOLDzS72Q7xV+nkyyJDvCm9fYJaIGUjkUoF3teaUq1Hu4+Fue8278mKBquw+Pqwv2qTHF+Q9c9SnBv77gpUH0hvWWjYqn0CYKxZGt3c1B8Mn9ZZLXxwR6waMjs5guwkPzbs9tD3dddseZbRH0xUtAj36XyecjYf3SmPwIQ+f4vLpPcSLwuBoq8zHZUzdu1ClJTVXr2QmzIDLWyVp6/a33qBfupswgwTrP0K5sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxqQhZqwHsXHOKm0rECYycmd2JxoNJc4/VPLdaKqBJs=;
 b=r/4WU/c6whuh/AwFrqVLQAG2CTecazVgW0XOEsjhoUE4/bmvtuCklulQlsQW1/YguaNhx1kSHUgo7zrksNJS2WCJAFyiiVQylZWuPozcbOLIZl1FQK3lJLlOID3+mivBOdHLMjrJWO8bDEbCuyJc9mw/s8zYEymFRkx4K9m0wtQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/4] libxl TPM emulator support
Date: Fri, 6 Nov 2026 18:15:22 -0500
Message-ID: <20261106231526.482418-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000074:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b12b765-0648-4dba-0d19-08df3c5bdd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261102123227099003|261026121527099003|261028144727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HSmgVBXpgSMk8ZUBRvnnMoyN9Qis4kGz0AffAB4QlKORNG9tEqHGi605m12e5blt9ak3k9dC+ugLMltA10ybIhuInTn2kCda4pFoBZdk5b71AvDD+r81G5UrHi9i/iAuPbYGKS0SeLd6NsQiMYcTsNo+GISgB1UJwqergXdK3fZahp4sntG5D1qSbiQfhoYFZCzPp2hKqpJZLy5+AMMU0IPIXiWGih21DlrTRG/KGVGExL14A8FAbwZ73Q7GmP0hLGVneZ0VS/HDreM5qZTxyPa4XVT3G/9URVhCt96csgbCzattK/jtpEZ3hRcOeKuyUnwnh42owWEHc7PBWWlH81FOsEEWvJK+f+n2MRsCSHCbO23GP/NMwnHMLH8d9UJh64cGdBI/eBjCQv1zp5txyd5vGsOzk+ac1SLRazFH7cuufUsyqXGRQTHxPbLNwwcuK++4ChIPvt2eHEyRJrNXgPIk+V1iUZZTBfWNryM5YM2V39ZCALqNyr3dj1dRSVYhu1wQnBkQ62+UoKLGKcO3lk2A+H0ZF+oBmSRbqMtH4IgxCam0SDVFgx/Ep1wqDmgqjuQ7TX8UZFNB1zoswdrt0VGh/tkSJa1rHG/O/nnEEchPMh7SD8oqmwzw4p/FUUDuYZd/6fyG0ztU9jH27uWBDhXG9cYP3KK6RQR2l3QekGaSszxLqrMMoRAYr0W/76u8JHOEg7QZniCf8FTDs9a9aw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GiRSYlQO77o0hyu2PuiFUlcN7JY8uNHwcMHONQlWTdWzSfKjaAcS0xDF1dyaClWmre7H5X8nApU4azJGszq+fltGzFnIItkXR+6szQUYFixpnHtmSLQCOQF2mZbx2Kl54Pt6iuhgL7dp/7anix7xxynMfjqqccxEHcpVR5QI1mkfDzVbcVbQbAexQXlEL6tjvFfqe9/LXfAkh4CVXc2nrqjZR1aAuOI8xvTQ7B4whGD5MY+9uZd/bkqj9tvs/H05J0podhXVveTMRSNU6p1lklK6ucwGLwRQPfpl0DPRcz+EXd46waN75xQI5pvtYarRGo5IUEYzM3NnBtw/VIPgfDN9KJaWoDVJkcNKhQ4ObvUXH7eyuBEcBb1V8f0K8o0YM8ppOiqpYbAVFc40XdYNV7N7Dja2PGdG+7TG+ChXU7Ri8mvdqhnmyGcPsD1WmwTq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:15:35.8556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b12b765-0648-4dba-0d19-08df3c5bdd19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000074.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
X-purgate-ID: tlsNG-ebf023/1794006943-C22D4B50-5D0ACE23/0/0
X-purgate-type: clean
X-purgate-size: 1951
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support to libxl for QEMU to emulate a TPM with
swtpm as a backend.

It reworks some ARM TPM support from Stefano to use the auto-started
swtpm.

Since ARM uses the TIS interface, I expanded x86 to use either TIS or
CRB for TPM 2.0.

On Ubuntu 22.04 (and probably others), swtpm has an AppArmor policy that
restricts access to specific paths.  Those don't include /var/run/xen.
I disabled AppArmor with `sudo aa-complain swtpm`.

Jason Andryuk (3):
  libacpi: Build TPM2 tables for the TIS interface
  hvmloader: Support the TIS interface for TPM 2.0
  tools/libxl: add emulated TPM support backed by swtpm

Stefano Stabellini (1):
  libxl: Add emulated TPM support on ARM

 docs/man/xl.cfg.5.pod.in             |  42 +++++++
 docs/misc/xenstore-paths.pandoc      |  12 +-
 tools/firmware/hvmloader/util.c      |  12 +-
 tools/golang/xenlight/gengotypes.py  |   2 +-
 tools/golang/xenlight/helpers.gen.go |  48 ++++++++
 tools/golang/xenlight/types.gen.go   |  17 +++
 tools/include/libxl.h                |  11 ++
 tools/libacpi/Makefile               |   2 +-
 tools/libacpi/acpi2_0.h              |   1 +
 tools/libacpi/build.c                |  47 +++++--
 tools/libacpi/libacpi.h              |   4 +
 tools/libacpi/ssdt_tpm2_tis.asl      |  25 ++++
 tools/libs/light/libxl_arch.h        |   6 +
 tools/libs/light/libxl_arm.c         |  47 +++++++
 tools/libs/light/libxl_create.c      |  46 ++++++-
 tools/libs/light/libxl_dm.c          | 175 ++++++++++++++++++++++++++-
 tools/libs/light/libxl_domain.c      |   3 +
 tools/libs/light/libxl_internal.h    |   4 +
 tools/libs/light/libxl_types.idl     |  17 +++
 tools/libs/light/libxl_x86.c         |  24 ++++
 tools/xl/xl_parse.c                  |  20 +++
 xen/include/public/arch-arm.h        |   4 +
 22 files changed, 551 insertions(+), 18 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2_tis.asl

-- 
2.34.1


