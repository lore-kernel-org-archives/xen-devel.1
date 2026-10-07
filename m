Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6365BCA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:31:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442423.1659975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESgF-0006W0-K8; Wed, 07 Oct 2026 14:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442423.1659975; Wed, 07 Oct 2026 14:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESgF-0006Vt-Gs; Wed, 07 Oct 2026 14:31:39 +0000
Received: by outflank-mailman (input) for mailman id 1442423;
 Wed, 07 Oct 2026 14:31:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xESgD-0006Vn-Lb
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:31:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESgD-002dDM-1y
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:31:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657c8-8faa-0a2a0a5109dd-0a2a450aaaa4-4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:36 +0200
Received: from [40.93.194.70]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657c7-f2d2-0a2a450a0019-285dc246d53a-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:36 +0200
Received: from PH7P220CA0055.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::8)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:31:32 +0000
Received: from CY8PEPF00000053.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::79) by PH7P220CA0055.outlook.office365.com
 (2603:10b6:510:32b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 14:31:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000053.mail.protection.outlook.com (10.167.247.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:31:31 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:31:27 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1t0+88qYZe3VZa7FOl4bVUelbQbxBiY0EFsfSTuMJ5v+LWENWIQz/QteDr4nJgv+HjkMJYWC3LVnYvgcXLa6rQq4FmAYiabvAveKguS8hWlk0x2lnjxDrFQGo79T0TMBNvV9du/1411LTE0OWnikl/bv5i0VhA/lB/enC9LtKme6X6CQhOCn/Scq7agNsh0kO2yub4nv/3w7Xg27g9iIDh8BxrK3XvGQNtTM4ehQBV/Dt92y+fM/Aq1L6QGPCtZdsO5wp3ZpPk1qW5xJCraWK9GT9H4TNS2rfl1DyKg+BOiRdAKpulZwI7h3St2HnKxnH0/uwikYB57V1oHOjFXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N2EF5DcR5aHz1GMCf3jJBv/RTxXRgszVGoIOnJbEpA=;
 b=VDC1A5RJvbDO4dcacxow020YPxpsbGQeZI/5CTrUTI+JPD4pAq1n5LyCE8F3fgRFRsIXU4s6sVKGstkTuSt9AGuwa2797oqCVDoHCxJ5GlOZYezV33RPEADlEG7Y6ZdpcyZISH4r5ESZsFSHjEdMqggh0I+p0DqFl8AoGsflCZQIPV45XL8DnKBp18hzhYLGSxFhFz6yXxC4GjRtrq48Hp7wPVYtOpatYh//odClUaLLHVYuqwVMH8i6qE5rhbnmiWb0O3t46hyVemfkCwKGLZxWTj3dth720nIUmVeoW3qqRrt7ypEzovtbH5apD4/uPaBwjUFbNm6oMFZD4+TDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N2EF5DcR5aHz1GMCf3jJBv/RTxXRgszVGoIOnJbEpA=;
 b=PNGWcDaJqO15IEz6g+VVubbkSWwJ+QpPDs+pzv7h2X+aUifnB3ab1K0nz56Fk1lUqS3CcbDy/GIvk24xAm5fJZHrW/rkkUxnNCAPUUKxjEF0eRKEMel2w4Qt9lEYwMhyVL1R5KWAiAeH58+TSr5db01+1ibkXi6anq1UNke5Cb8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>
Subject: [PATCH v2 0/3] xen/nospec: Make nospec helpers always_inline
Date: Wed, 7 Oct 2026 16:31:05 +0200
Message-ID: <20261007143117.757375-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000053:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4b7ef9-c702-46d7-7b6a-08df247fae61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|82310400026|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e9OCCqJtb80fCB8BkOw7aZma/tl2H8/HNgVO4xFghYPVQpPIpA0lM2PjqwAaCIXGdKoYBdai/n10GWlIb/BdQgbsa0oUnJh9tvWdgH1frpEhBxOEzxXkZ4RVTlJOZUcqlRj7TdtVpOaX8r9PBSaOU9hLYp4kqVDYD5PVgVgbHv2+0cEyVFObCZ0+ueDHXVcpNTPK70fa24p9KfBKDWzyj8C+xysFk1xuYZRR9IPI5A5pTPKJwLc8YQI8PsVMZ1jdWq1KImAnWosqpdpP70M3HizGdQMB0Ijc3JNHAwyDhHJl6PC8L+CFUvaziGK+5yfwFZOISJpYDJ3ei5YxLgEm+cxu1jpw9rqkhMI1V6oY+kidhbisGYn2KWAeTpVZa5RBeeF64pY9KdpAergIwcqgEdfIgNh4EaFNE+sYLYTXws3AC8JkoRJ8EuASXFT80gO4Zjv+2mvtVoWk1u8XXrJcAQHwQxaBjBZw/whZLRpABwvLpShhAjcL8M5L2Gs6X4ZJmBFB+mf1pT80EdOu9Fy5nMBbHzf4a51GeSR6leQ1H8/1ZLdSUFQ7Ai/cacAZyks3TsOEFlLAZsNbhAcsCpkgcJcZIS2DLOVPkCNuBgGN7UoSrrierZ0Jd7hAZl7KxGPnWUl4iuytUoCPrBsDI0BnhO1RqlfKfdE0N7GhBfIX+g8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8cciF6RNOTrcZI8kmP3gDJbGvrm+l9ZzdPnUWdX0Kgzt8UTjZcZ+jLsTLYjzsrpV+yZdUwgD6eM6qmJg/z2w/ybK0d15G9k2U0iJWTsy5lbUDcz45GeXK0dsnY67NGKAfUfJfjRXm8ubegj9x0Y9ZrwW9t0ja5jcenTtQpdg4iqvd6tYSWzi0mibgJDBYk7nyvLv5cVvBC2QDeOY+5w7TS0ixBnA2Cfwuro2f2KihLfb9f1zc9t5nqj2dzOq9D/m/HPq6tWzmfMs9jbjmUHQJKKEdnI28Xd399MNZJ0FczkBJpwcMmkDqoecgN0YNI1cQA4IH58RFQ4NzmaJzZm0sIZ0qYOIDiiUVIioHveWfy8+H6JgW3dBIc2/29dFsjyxbs6xmjUvrb5iqbL2OibJtJyLImgyF8A7OdDhr0ziCthPRePsu/xVz3Y3AlPZqP2/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:31:31.4072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4b7ef9-c702-46d7-7b6a-08df247fae61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000053.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762
X-purgate-ID: tlsNG-4011c0/1791383496-538D5CFC-EC202137/0/0
X-purgate-type: clean
X-purgate-size: 610

Hi,

v1: https://lore.kernel.org/xen-devel/asT8lQktOeLhcva3@Mac.lan/T/#t

What the subject line says. Split in one patch per affected arch.

Cheers,
Alejandro

Alejandro Vallejo (3):
  arm/nospec: Make nospec helpers always_inline
  riscv/nospec: Make nospec helpers always_inline
  ppc/nospec: Make nospec helpers always_inline

 xen/arch/arm/include/asm/nospec.h   | 4 ++--
 xen/arch/ppc/include/asm/nospec.h   | 4 ++--
 xen/arch/riscv/include/asm/nospec.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 63d0e8cc842975e786455f8a2e6502e85685f258
-- 
2.43.0


