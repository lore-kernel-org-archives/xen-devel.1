Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13895CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:52:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449077.1665023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzOo-0002Wb-PV; Wed, 14 Oct 2026 13:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449077.1665023; Wed, 14 Oct 2026 13:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzOo-0002WU-L7; Wed, 14 Oct 2026 13:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1449077;
 Wed, 14 Oct 2026 13:52:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xGzOn-0002VZ-BC
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:52:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzOm-0045fr-H5
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:52:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6acf88fe-e002-0a2a0a5209dd-0a2a450baac6-20
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:52:04 +0200
Received: from [40.107.208.24]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6acf8902-b7e8-0a2a450b0019-286bd01850eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:52:03 +0200
Received: from BY3PR04CA0005.namprd04.prod.outlook.com (2603:10b6:a03:217::10)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:51:57 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::e) by BY3PR04CA0005.outlook.office365.com
 (2603:10b6:a03:217::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 13:51:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 13:51:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 08:51:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 08:51:48 -0500
Received: from fedora (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport; Wed, 14
 Oct 2026 08:51:47 -0500
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
 b=RHOxZMo9JUTRvWHViujAdRJ7yPyr5hklYrNcWvMys6bCeesRJB5/KM0UROh7zmMvMGoy1htsZ7F55YSXFNtZjwdWqRTVRMwLNlBjl4OIk3L9zbxiZ0Ab3Nm04yCwltL06Fxb/Cd9yhutMF2QYe+98d3nv5pwQalAJ0EMQSVtiv79McRTC28KzTMZhbEBTBGxjfMUOqe2qcdE3vGH3D1KOz4DMMyULgfsLEeyTyQNPuDI8muUqP0dzIHCjlI2VpRCBhKFkjgDodggmo26Xxw4b+OgkkDUV3GewlLdYW1uAxdu7M1x7NeRSJnNPVl+Imwr7lnl8ymNc0iQANm8r94Qgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6c9/r8gSInDbB9zijROaTD3jrIXku1p1zRc+kW5mgE=;
 b=oNrjIwlSYGEEDEzpJxvEjUhjpG61tnMNEo/swDpzFvo9QdsDIwDuRvd1nbLQVhy4nlfgphIzpxUIKppfQLRd+lErocf5n2wyhtwYatSRozJSj66NPbgpUtW2nuTaSmII+2zIbv11I2hpBGud17/FsH6YkdhFqt597kvudHyHZ0hozKpCjC8VerHo5V2Xw26T55CBEow7sA18yhQO3U6Oco9dSmjGysirqs8zUJozLZ7cRYxkXVGWf/p/NK+XS1dcIfUionx9wUdyXm5StBr9CUUSZ2bYt3ZaNnXmZ6+aOa04kR5O6UBkbx+vI0lYrzxcKpJY/mPyQrDeO2tnVaG7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6c9/r8gSInDbB9zijROaTD3jrIXku1p1zRc+kW5mgE=;
 b=rzuQZUGhpJOqs3jMphFv8N6uILqN5+/m2YPSkXtNR/1gWthydKfrYkir3MN9kyuFwCZmPh2jrsXshvHKlJXo8ThpCNgRnXGEheWM2/NU1tXaN5Ws/5oqQY5h883XDUfw2t1HJB840RLlFESVwrnBWZRZQSE3w9ktyhT38qKmJC4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] SUPPORT.md: State that ATS is unsupported
Date: Wed, 14 Oct 2026 09:51:43 -0400
Message-ID: <20261014135143.34220-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014135143.34220-1-jason.andryuk@amd.com>
References: <20261014135143.34220-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 1542dc10-e4d9-4a0b-f090-08df29fa4fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bhio8yWOBe940fC0P2cnCVA/LXzZcIHcX3secaEbsBicllQHwvykknsb3dGna7PPJSIv4KP0xbzf3JHj2qgjeyc2q5zZ7PTJ3znzjuOPtucopTtNwkz9/O+ZSgO5VRV5dKzg24oXl/hqfN9/TxUHZN+uRRFiC2wbjyF71Izu5L7rpQptfum3xTecC1iqVD8vLVHIExhJmJ7cmB2iH1rQMvq3IGg3gzRuy61WvWdGAXUNlkgnqgtUrcqKHDcqfpsto3/oUozUgYh8aQVesANri5oOWBOrkszr3zmyAXYiBFtQHJMhmn9khMRT7sm6juanRXTDj1Bgqa/0DZTE4A/ARzli/g8kvOeXqZYMnYpOir3BtSys7ssymXEkQ3e2oB0vMYQjQ0/G9vj/f2eoTIVmj6+CDGvc3vUo4JDXD+2kA4wokgvcecrCD9LPLj96sM8rTzZaYqTmd1Xf12XIJOnqUhkeBZo8IyqnA+uHB0q4XnglXAQF6IBQetyACFDIeq6NUsYIa4PEnwwAcLWaZUU+NgZj+dSsq03o9VaJDq7gkLAcIXwnXS1q5dshPuAPhWV1nwNBDNZ1psPDIXmKYbuSV1ganaJFJoRVC+XzGfUjsDIht3bu2OxXPP2L4VBpBiqybxKwlDwEWqohtHkqRMGiOptObvLSPPbdE/ruNsuQNhXN/MhHwmfCAMH2Nw1mE9MtVABUGB3FhOY2jr1xbFCjtA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FJa5c1ol6mCbsLIcqgKU5mUbc1itrgCcAlzNGRRzUtxgAPDXWc6nT4J7tGvgCLGW/76EkFRqgLs37HmxC8d90JpBcyHapTt939uN66crY2C8Y7Bw8QS0H4DxW54jvYZM4jXwBO+dIoCEb5kuAhv39K5uz4JGbx4c3+DK7LgaSExkAbaiqEerFEgbHwVJyh1wi28ytjgXBnnK6fPW/1e9dM41VzvbIkbVJV39X8M7jEipkag7+VpieZdVHypoSn7C1dJHZUuLk3zmduU2a6k82iht2KD63wBX0mPwd6khmg0oKOjYywfZmhK02B2fBbPiNclzesqzAe3wUYBn+YdcB7yjo7YiA5SIco2qmJBLrlwfRGONlDgpG5rV6oKHLEB60db+FveB+CsP/VcWGwoKFGLxWhl7hGswQ3ZjrGIpgwkuETUUANCNAfPEN2ITpItR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:51:56.7339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1542dc10-e4d9-4a0b-f090-08df29fa4fe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439
X-purgate-ID: tlsNG-42698a/1791985924-AB8D19EA-607337BE/0/0
X-purgate-type: clean
X-purgate-size: 743

The command line documentation specifies that ATS is unsafe.  Make it
explicitly unsupported in SUPPORT.md as well.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 SUPPORT.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index eb07332462..8efab35004 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -96,6 +96,9 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
     Status, ARM SMMUv3: Tech Preview
     Status, Renesas IPMMU-VMSA: Supported, not security supported
 
+PCI Address Translation Services (ATS), enabled by the ats= command line
+option, is not security supported.
+
 ### ARM/GICv3
 
 GICv3 is an interrupt controller specification designed by Arm.
-- 
2.56.0


