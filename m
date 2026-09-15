Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A7CC88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 08:29:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421523.1647320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6OXi-0007h1-E1; Tue, 15 Sep 2026 08:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421523.1647320; Tue, 15 Sep 2026 08:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6OXi-0007gt-9m; Tue, 15 Sep 2026 08:29:30 +0000
Received: by outflank-mailman (input) for mailman id 1421523;
 Tue, 15 Sep 2026 08:29:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <b-padhi@ti.com>) id 1x6OXg-0007gn-VL
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 08:29:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6OXf-001itT-LY; Tue, 15 Sep 2026 10:29:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <b-padhi@ti.com>)
 id 6aa901e4-2eae-0a2a0a5409dd-0a2a450ac702-4
 for <multiple-recipients>; Tue, 15 Sep 2026 10:29:26 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <b-padhi@ti.com>)
 id 6aa901e4-f2d2-0a2a450a0019-94a39a1cc3c4-3
 for <multiple-recipients>; Tue, 15 Sep 2026 10:29:25 +0200
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68F6adpM3727917; Tue, 15 Sep 2026 03:29:15 -0500
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpvpja46k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2026 03:29:15 -0500 (CDT)
Received: from BL1PR13CA0332.namprd13.prod.outlook.com (2603:10b6:208:2c6::7)
 by MN6PR10MB8071.namprd10.prod.outlook.com (2603:10b6:208:4ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Tue, 15 Sep
 2026 08:29:11 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::32) by BL1PR13CA0332.outlook.office365.com
 (2603:10b6:208:2c6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Tue, 15
 Sep 2026 08:29:11 +0000
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 08:29:10 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 03:28:28 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 03:28:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 03:28:27 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id
 68F8SO9d3833282; Tue, 15 Sep 2026 03:28:25 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint-05-2026 header.d=ti.com header.i="@ti.com" header.h="CC:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector1 header.d=ti.com header.i="@ti.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=nP2oa/Upr36nO
	3JVb2wzWNMKED0TaUB8y8sRyK+QJcU=; b=ogq5PB50fGgqHN4UhfPTdv4I0Ag+9
	CU8sRo0X5b+2wxoK2XNpyILQPsJSvngaR2Q1wPKN34WxF3zrvzx2YGFetSyD8TRv
	wbebfJHF9ab6JVem+OvogaxBmMg14Fk1vaCWyGYnLZDvY85iGSrtCEq1j3UyPk1Y
	wBNBPpfCQM42TbGbomEV6P6gtLKYXK9H1ncKUc+gr8PTUYR6No5u+TwlMdCNorO2
	MvGMXAmiFn20nrVrXwZYB+F962peGZEnTd9xzkdpDC344u3gAzYa96ahRavPoXGM
	V8nDMX8Wonto/B6tAkqpzjltCGbGbtHHlS4xEZ3dvxyVcwo51bdhrVPUw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxnRDGjQnPaOD0zDNezjctQSoESmei0R2TQRdkkDLgcDRKZWlUl/vrzdPER5l05aCPjFUfsgcWUxP15LXHKfnzup/+CQFh5qspynzZ6Oeds3JniZtF0SYMQPK/4fG9hFh+yKjUiWZ28qIgfvYXMwjFpjGrNFctJkkVLi/8ba96CejLVhm4UwHtKY3EUpcs2mPkEstUzAfZ0X0lP6lQUy0UiLVbkKcvu5nW+h6R8ZlOSP7sfVdXAf8tHO/35dgdMcz6f0YlH1PIEZdtdN3E4FjKt52w43cpyvkIYEKwYf7Qz3WuMeW4Y2zJcs7AiBg5WxkrOu30wpS5q07hv9EEdidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP2oa/Upr36nO3JVb2wzWNMKED0TaUB8y8sRyK+QJcU=;
 b=bfR0EZsVksRYaADy2uJFabYnBSL5DuTvVNNFSYQXchyiIPKtO3iPHVDX86h0Ld9w+ZPJPAxyU/fdDuzxrw8AYAEuefIZ5+Ecbm6en4JZTLLT7mqvpZeFyhPIhjB8LWFrqgwLE/AsFA+ZfhdM3D5j6+BdfiQ1PxIHoXbQHFIv+cAhCk8qgrEcYkZvqJvONCb8j01FqjMA+n6C6RCRqk/QrVLzQJG5gpQEgNhyWijikjzAcyPCwx2+RgID+65cG+ue0B5tbGdV4BdZ+cyC2LKIx9/lt9Cb7SIAfFm5DXQYCQo/edkjGUDJESm0W0NeGvV9XWZyEiCjcA5RjtgI/1QBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nP2oa/Upr36nO3JVb2wzWNMKED0TaUB8y8sRyK+QJcU=;
 b=Ce9VhEVAT1JPymUQcdFPQvhi4wBmBty0Ar4vIRTA6Hy+qZiUJU6M6VScczRg6qwGLRL8DQlDa+47eJfXfwhi6sKTLhHEcJ91EnoMOsSdXeNMejaptFLTsIJ+Nfk8KiAJs/dSIsHsRLLlISuU8iHvcqT1P7OIpaYcY4AtW0RstEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
From: Beleswar Padhi <b-padhi@ti.com>
To: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
        <michal.orzel@amd.com>
CC: <u-kumar1@ti.com>, <detheridge@ti.com>, <jbergsagel@ti.com>,
        <b-padhi@ti.com>, <xen-devel@lists.xenproject.org>
Subject: [PATCH] xen: Add support to passthrough reserved memory carveouts to DomU
Date: Tue, 15 Sep 2026 13:58:24 +0530
Message-ID: <20260915082824.2180692-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|MN6PR10MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a927bf-2bdd-4a97-40a8-08df13036b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|56012099006|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	8tSUQ6pSMm81+WY3WA1NyGNIqwMMljMq5qH8KJ1PJo54ug+a3KD1IEn+0ziBChyP9TDr4zMEDZjrImSDYIjwj9d/wGXnTje8U0BsvqLPiegR7CIjImQ6IDUO41cpLG62pD+FbbmvhOOiK1bPl1oq3vok+a7zSVeLqulsEXSkZv8O+o3IJqzaAYMNY7N9WtdWstXjh1Q2RL+hmnNQzAf9dNkA+EZbbKKGE7Z6wR0T112goBraBqf7mcQHB2E9nd7bM+Gza/4ZTm0QPbHS/UeQkuy/zAOeWy4B8i4yb+TS7MwCVaAhSPCtOuIFe2ZjdG1hgi6rqfb7xDEn97r2Ejyo8R8kxEsFhmO3IGHrplSmgi1DdoVoBJUkMZQRC9KF4RliCq4s9jRO+/AOJve/35r6w3IFnqZTmJVHEs8otgF2AilvZgrXALXq+FDBFduYKdwXRcd2sm7q5h3vY8IycqpYcg8f1rIz5Cye9c5gUHYx4o+0ls6Dx/Nkg0hQcL2ZYGmBtYtNNdGe3Hx/9UhD+rCIvmn+iewje0BQ4+N2qP05lZP/SZkXtCYCoPU8dw/uMUqAn0nsFjgMCTeplnLRP9lHhAVoH2QOMZZwTuu0u7be2bdCI/oCbDg3fkWpSFvlCA7Dce3hIUjhkN2me5uZ8wckRPlHMgCt/TAJKJVc5SjGo/tpcLprgEL6iZXy6+xVZBXSONMV2HTqeW1OCad8Afjk4g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(56012099006)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b4+xwjn4aKLMlXNReDPRYzyU8hKSn1ZARrn0buUS8x4CF9C2DIZJ/nd6fZO6Pj1xQ2Cw+bQn8iNSeVzjWBZX3u9Lqz/0l9GzEjnYXDo0/DOXY1/Hnr6aPuTa1Zcxs/ewJprrOBcV7EEUK5Zh8LWRUdL0n9OlJm0AQABzfGtEzPScWOtflROWCjwKfSy4ytWzjR3gweHawXaOeYfsg9ljjnefnnNWktJWUR31iPo43yPUF85zM45TrBppeaH2HuKd+KPe5N7Og9EeFbhMW1F952W26rr9Um1W9C6mWHPfL7PRsQGaMyLZtEenKaUpft8v2atzQC0K+x/BjDAWMGL9+e+LDA1T/Omy+YgfQpg6Ce6Qbp9K+OpHWhStpRxEEUYncNDJQ1Mf8D2310P8dnQD9aX9VKNJ2+8/QhDyjY1s8Gs6nNl1zHktfKtcAW3CigCy
X-Exchange-RoutingPolicyChecked:
	A2mYEUgxikh5m95fi8LKAJ06PcqSQV2Pd/EuQsIxsj7xZc1ydJLhLRzXIHYpXk4qm07vU2lUnNWJKmNDT5Z8tN9xoL0UB1Bhf2ftP85F9sizK3rSbygB9xRvVjQxa/zKBKD1F+JPErC24ehaDkG5XXkp/yZsFxI+1T0nrrouAWOHaW3NgFJGw4Ru3X3Kr9BTa6E4bp8B6jhckHSfHNKbfhnvzCnIFphk23ZD2HjLi4Rqkx4WNLus+a4FK0IoH0cTl9uWUPWmWMlD8QSsEIc3TAIMweVtSgEF0WMgRLbwyMuHYPR10gPuQP22QoZA1HxVOVWz9OlWI69X2PViwYa6kQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 08:29:10.9706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a927bf-2bdd-4a97-40a8-08df13036b04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8071
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEyMCBTYWx0ZWRfX7te6AOBd4xAn
 JCfyEFrBEev11PJJDECECcQQ41c/GMAFeuhoq+DQqNXktZpbdeFbYTV9IpqvfniCWnEQtv38Jqf
 h6gUCjmfmuCq/coslPYP7Ak0epVzD6I=
X-Authority-Analysis: v=2.4 cv=KvnYSmWN c=1 sm=1 tr=0 ts=6aa901db cx=c_pps
 a=n8CZQ1v8Y1OZ9xNCwzzv5Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=Z-IV5SkFREQAX4yTDDYA:9
X-Proofpoint-ORIG-GUID: WPGqndh5NNxe2JjTyaNwCjtWyc_vGG9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEyMCBTYWx0ZWRfX6bwrl8+oQx95
 6uDagvdgxl9sjA+YEP3At+v9TkWGkJiDGJEZ+Iot77uaZMqRaWGMxsm1kod4agaB5POuKv+uvea
 cammmfk7V6awkEXN76ZNa5KgDvF1szp7jyDkZOfLWdcucGJShs9i+4Zfy7kOSJNlPlNiCyB5ZcL
 iZNZ7xX0Qo18imMH/LRYGF5Thrj+g2Sw4Td+ypyVKWU70C1G21FtBJkzs7GqwIdLGQF0grPgT8y
 AeyrEPL2O0QxtPaaz2zUIFxxv7BP7NYfpLdYjYZ8ojjf/abqu8qVI0WARJZXZuAmNDN5lqAMTc2
 MmDxzc8jBzjyQAWCX63bXIJSUkqfby2ch2T1LF7Mrj5lTC+afCKLf6h1RI8PoqqoH9dImffrzgY
 dAnKQdcaGyFl+6miquB8txGLd48ajYf06gGOn30RPuZllgVMi9fCYvwm/J9oK0f/upDIb+iCVT0
 cycZPJqHa8vEQn0+LDw==
X-Proofpoint-GUID: WPGqndh5NNxe2JjTyaNwCjtWyc_vGG9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150120
X-purgate-ID: tlsNG-4011c0/1789460966-58BC8CFC-E724A13C/0/0
X-purgate-type: clean
X-purgate-size: 5681

Currently Xen only looks for /passthrough and /aliases nodes. Add
support to parse the /reserved-memory node and pass it through as
requested to DomUs. This is useful to enable many usecases in DomUs
like Remoteproc firmware carveouts, CMA carveouts etc.

If Xen's static shared memory carveout is found, it is placed as child
nodes under the top level /reserved-memory node as also done in commit
51a2b3f10918 ("xen/arm: fix duplicate /reserved-memory node in Dom0").

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Hello all,

Sending this patch as discussed in:
https://lore.kernel.org/all/0e556bb5-269d-47d7-9ae8-68f06eee9fc0@ti.com/

Test Configurations & Logs:
https://gist.github.com/3V3RYONE/bef3bb51459f8b823605261b35494a7e

Thanks,
Beleswar

 xen/common/device-tree/dom0less-build.c | 45 +++++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index fcbeb8adbd..e9581327ee 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -334,7 +334,7 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
 static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cells,
-                                 bool scan_passthrough_prop)
+                                 bool scan_passthrough_prop, bool resv_mem_node)
 {
     int rc = 0;
     void *fdt = kinfo->fdt;
@@ -358,13 +358,20 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
     while ( node_next > 0 )
     {
         rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
-                            scan_passthrough_prop);
+                            scan_passthrough_prop, false);
         if ( rc )
             return rc;
 
         node_next = fdt_next_subnode(pfdt, node_next);
     }
 
+    if ( resv_mem_node )
+    {
+        rc = make_shm_resv_memory_node(kinfo, address_cells, size_cells);
+        if ( rc )
+            return rc;
+    }
+
     return fdt_end_node(fdt);
 }
 
@@ -389,7 +396,8 @@ static int __init check_partial_fdt(void *pfdt, size_t size)
 }
 
 static int __init domain_handle_dtb_boot_module(struct domain *d,
-                                                struct kernel_info *kinfo)
+                                                struct kernel_info *kinfo,
+                                                bool *found_reserved_mem_node)
 {
     void *pfdt;
     int res, node_next;
@@ -430,8 +438,8 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
             continue;
 
         /*
-         * Only scan /$(interrupt_controller) /aliases /passthrough,
-         * ignore the rest.
+         * Only scan /$(interrupt_controller) /aliases /passthrough
+         * /reserved-memory, ignore the rest.
          * They don't have to be parsed in order.
          *
          * Take the interrupt controller phandle value from the special
@@ -445,7 +453,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
             res = scan_pfdt_node(kinfo, pfdt, node_next,
                                  DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 false);
+                                 false, false);
             if ( res )
                 goto out;
             continue;
@@ -455,11 +463,22 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
             res = scan_pfdt_node(kinfo, pfdt, node_next,
                                  DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 true);
+                                 true, false);
             if ( res )
                 goto out;
             continue;
         }
+        if ( dt_node_cmp(name, "reserved-memory") == 0 )
+        {
+            res = scan_pfdt_node(kinfo, pfdt, node_next,
+                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
+                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
+                                 false, true);
+            if ( res )
+                goto out;
+            *found_reserved_mem_node = true;
+            continue;
+        }
     }
 
  out:
@@ -486,6 +505,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
 {
     int addrcells, sizecells;
     int ret, fdt_size = DOMU_DTB_SIZE;
+    bool found_reserved_mem_node = false;
 
     BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
 
@@ -538,7 +558,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
      */
     if ( kinfo->dtb )
     {
-        ret = domain_handle_dtb_boot_module(d, kinfo);
+        ret = domain_handle_dtb_boot_module(d, kinfo, &found_reserved_mem_node);
         if ( ret )
             goto err;
     }
@@ -556,9 +576,12 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
-    if ( ret )
-        goto err;
+    if ( !found_reserved_mem_node )
+    {
+        ret = make_resv_memory_node(kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
 
     ret = make_intc_domU_node(kinfo);
     if ( ret )
-- 
2.34.1


