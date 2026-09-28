Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8417CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 16:18:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436134.1654897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE3m-0000t2-8d; Mon, 28 Sep 2026 16:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436134.1654897; Mon, 28 Sep 2026 16:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE3m-0000sv-53; Mon, 28 Sep 2026 16:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1436134;
 Mon, 28 Sep 2026 16:18:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xBE3k-0000sp-FM
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:18:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBE3j-006HDi-BM
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 18:18:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba932d-2eae-0a2a0a5409dd-0a2a450a95d6-44
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:18:29 +0200
Received: from [52.101.69.68]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba9355-f2d2-0a2a450a0019-34654544755f-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:18:29 +0200
Received: from PAYP264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::12)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 16:18:23 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:102:11f:cafe::4e) by PAYP264CA0025.outlook.office365.com
 (2603:10a6:102:11f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 16:18:23 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:18:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11820.eurprd08.prod.outlook.com (2603:10a6:150:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 28 Sep
 2026 16:17:46 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:17:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuAsHvFWTr49yh0KHSOU7nhzlczn03XsMIszoXXgxPaeeN9EOavX8zk5y3AGY4DF6WWdwZ4J7YUkb9z+/8f4yk3GwF1cXH2aSNKetje4a0zcUXIW8pUO8RvwxBx7zza/XWT9ldhk8ubFL/BOgz9xcce/Fvj2or+AfPs+Q7b6t0BOhV0d6ImNR1QEPz8HdDsp7MoHPzCMe9ZZYFIu/rNDv8HDgEKgxrYZ252ZUcWOgNtif0KGO5i+RTcU0OiBMO+bvxIpGPKVEXSTYGQrVFs703aaEk1LaE5JvRTGWyagBRFx938dI30kBWAbNk63F4Zx9nleLVY0neUW1hIeACwueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLLq4R2qscP8fs8G6XvYb9sXiIne08kkFcsG9NunCxg=;
 b=PldhnoIpa0nWThqpC99TRJ7HyQoMRsaurOXRxD7FXt9Dgk+o7iRecicPS5HcKNc8nahFGUIvH1efCQSvooHHQAoRhFrfUZFP6WC2i/u8T4xvHDssp8w9tBu8nfq75C8f5nydaMTb6M+Lm7CHJMFxMeqcny6tJO/5+yUih0YpiInK4x84LkBvZEdT+Ij/F5snUZFkjzx5pBtZvyIQdbWa0rKqc6HPxe0t7fswRltwveTF+oDa1VQ0rpW07qZH+0oxO3kbvyqLCeeqg/FSjeUnwsQSBEiaKWzgThTKdV/71nushXS4ZcIvAUe7lf+Nl+Tc2Rthkgny+5QhwQiYNFknIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLLq4R2qscP8fs8G6XvYb9sXiIne08kkFcsG9NunCxg=;
 b=FMYBL29GNqikb7MRW6SJbVG/Xivn4d7sciu9pY8dZ3hlvic5zJAoGm98HQxAAdb0WJAlYZx8M1eKosTMlgNgrX/j784D9PAV8LSiHK3rl9SRB6ME8hBJnMTHrMGdgCtpBLyMhQCqNDVv4Mh+OZo/aUePIQ8lVeOwsqP+1b/ptIM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLLq4R2qscP8fs8G6XvYb9sXiIne08kkFcsG9NunCxg=;
 b=FMYBL29GNqikb7MRW6SJbVG/Xivn4d7sciu9pY8dZ3hlvic5zJAoGm98HQxAAdb0WJAlYZx8M1eKosTMlgNgrX/j784D9PAV8LSiHK3rl9SRB6ME8hBJnMTHrMGdgCtpBLyMhQCqNDVv4Mh+OZo/aUePIQ8lVeOwsqP+1b/ptIM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Pranjal Shrivastava <praan@google.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v12 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Index: AQHdNjDrjFXCXeSMDUWyr9xW8wFZIbbkXVyA
Date: Mon, 28 Sep 2026 16:17:45 +0000
Message-ID: <0094745D-F00F-4376-9CD7-4EE07ACC6816@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <388056532b9d11c1db1631c1b8385b317ec46e02.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <388056532b9d11c1db1631c1b8385b317ec46e02.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11820:EE_|MI3PEPF00008557:EE_|DB9PR08MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f54fc6e-42d7-4975-bfec-08df1d7c1e38
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|10067099003|3023799007|18002099003|6133799003|56012099006|5023799004|11063799006|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 +sT4gy8AK/Gm5n3IVf+55IRbaAIQk2deQxznZ/RhStw4BO5JUCM6UygVV+b6a0BSeRVK1CLhVOVk5KUpL6Ri8qKp29b94UmCV3zn8d3e4Fk9F3Zx7xBcGA7kfdYvJkYix1mtePHFqVwrpYrS4jB1/2uWs7VXJ5FZ8tT5W0W7iPOR8jUyK9ZHt93K4ia6i3C6U1RnWStToawpocehl7FFOYc1awQqPFjTijfrKU5X8sRf/UaooWfA+4IA3un2OeEHma3T3ENWLy/wJVksF/Amo7Lu7ty3VdcEx6NURHHFJvGQTx9NHqsisQcoBkdaknu8jKG2af/C1DK+EpthizaYWE29Tg6dyOOprrWS+rzQYVbRTLrY35+o3QCJsMd86GdsOkalwLMBnIV01VwWu6aJjBp4nUcovCpz93b2zpp6CV41wFIMYAFFoiMnCuZYkv/JD7QRyZNCiiiunVL2u9rgy34Erbbtakl80eRVm2SReokbtvoFa2itfCPb9aTCLi49H1Cth5n2KjAQlJYrnVytz46d3aBGWi6lvrZxFdl5xlQBCPhtBdfm5w6SQnDCY4jZFjW+4E3R9qetBqXVnqg8dBRIDrMDZmT4aIuiFP/jufOTc1wPS+Zjhq4mS1wvln/Mp7O7MKmU2cQGzGTejkKKcxZkwk2pqTmC6yNoBQxqIL4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(10067099003)(3023799007)(18002099003)(6133799003)(56012099006)(5023799004)(11063799006)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03AD54081875744B8144DBD54BD4A67D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 S3Ahawn3670wdSjNjnCSdLnhMGx809WxXyDx2pyGABCfRRfAhaTHlLzl2ejZVKEpmz4Sx0AOdS5CWM6XBLazhldNZR+hcBoSQvTL8EeApsSlQo6rnhJIhQUImz5KD+OPVJ1KN5wMAQP/MkdFTbX78kbc7lUUkPbXbxz0Qth1iEHWlh9IMowopiwPdsET9USkYWW32h1r5y/duG80hDb3FdpyaUDx3J+H91ttSh23hbzWhR07pquraEcfHk7KtfRwEe2WogN+5E1khYrO2JzQl/rs4dQ+tTzEeAk1Aamheb+659EjUrQ0Of6/OSp3qZ1nNjqQN1lrffGtXRqLHl1uMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11820
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a690532-5bd3-4cab-50c4-08df1d7c0827
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|23010399003|35042699022|1800799024|376014|82310400026|4143699003|56012099006|11063799006|10067099003|5023799004|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	8Ll4X4KbxkOr1EaC65LTOTU4ia9W720jXiouEDtC4MR8T9QK122FZ0PcGOXJGUGx48bcICnWpcXRpU80hKfZIrU3agxHLxAhVZR3VK0xfZDKPSItR/PEqIRzg0S8PJ5sLv59B+kObP3xigtcoipG8YulzbnM7g04vmuqHd3oGng6pmkFNC7VoPY2NGXpwAvo/jSGkyJyd4yMhvmmaBxh2ZIJPqyXPywnJMAm7NH95N4oEa0BB3/bMwSKS0BULouWb9x8uz64hdEPTvK+Xk+DTUskIMXwqOeUIyTk5iJn2f8wWJl+/jCGK/xtSzcS5KTc9+4pNJet/YH6N4SeLylu9RFNqhbJfKcGh+aR47Tch9GIRJzqnMuLiG1/A/8o+Dcyybxidadzdk0X59USWMbEbpBN9zGCB6FJTt4ZMW0iPOcI4XMaa7UBL6o59eRG3XOfxnEiVshS4Eim5fvS92Tc2RuUmfE/4YmkhGKyT5qEZK6EtAulwtq2X1d+5NOH/Ykrx4zztsl7qP1r3pacowCcCZpr+b65vYHJ/0/mrKkjF1CiDq48+BUwi1nun2jqiQm7xypvR3JqWogubq2/IOXyChl6JZ8NErCgHGqbcBU3vEkheEo9LtkJUu5X2BMlGd7s6gbFt2Pkyg1dij04sB2hyvhGD9zdPHwoSVRgcEZeXQc=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(23010399003)(35042699022)(1800799024)(376014)(82310400026)(4143699003)(56012099006)(11063799006)(10067099003)(5023799004)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C2C03/8iEgU9idX9FzFAYjVKZ8QIAILTyX2YDU9T96z3pcd/LkfWSH44yDPz7gMbjkbetVoVWx9VUrOkcb92htsGwLfGeSueYtrtHORYDV3O0nurOC51T1ZyAk1iRgLLOiL0OtkKYS/vSMFEErf3agfDrYi2w/KRkzAxCY1IB7m3eyVmNmvrfi9limTH5vDJopnZ0VQP76r2yiJpno90m++vnpQm7q1hhxBcY53MyFuYQfibRgSqsOPaF1czz39zuS+ekH5zXUranUnB4GzJT92v9YJynjibywbrtgH8CunvOUmdFZANfzMDjjoO+XCQiQPgIKGt/FZwPW2s0HAW3Fz9zP/xOYTL8hGaVoY9SjeEwxLIEE/+k6IbRZT1x2DMnwi1FyC5mclaSmF9R/7jnfsYV1N+0EUMR29WzU672Q17FudN2HIw5lmQip7GLTEU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:18:22.8083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f54fc6e-42d7-4975-bfec-08df1d7c1e38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
X-purgate-ID: tlsNG-4011c0/1790612309-4ACDBCFC-DBEA040B/0/0
X-purgate-type: clean
X-purgate-size: 12077

Hi Mykola,

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> Add system suspend/resume callbacks for the Arm SMMUv3 driver.
>=20
> During suspend, configure GBPA to abort incoming transactions, disable th=
e
> translation interface while keeping CMDQ enabled, issue CMD_SYNC to ensur=
e
> all previously issued commands have completed, then disable the SMMU IRQs
> and SMMU.
>=20
> Resume uses arm_smmu_device_reset() to reprogram the SMMU and re-enable
> translation and interrupt generation.
>=20
> The IRQ setup split follows the approach from Pranjal Shrivastava's Linux
> arm-smmu-v3 runtime/system sleep series: IRQ handlers are requested once
> during probe, while reset/resume only restores SMMU hardware state and
> re-enables IRQ_CTRL.
>=20
> Only the pieces relevant to Xen's currently supported SMMUv3 path are
> ported here. Xen documents SMMUv3 MSI and PCI ATS as unsupported and not
> compiled/tested, so this patch does not restore SMMU MSI IRQ_CFGn registe=
rs
> nor reinitialize ATS/PRI endpoints. If those paths become usable,
> suspend/resume will need corresponding MSI restore and ATS/PRI
> quiesce/reinit steps.
>=20
> Link: https://lore.kernel.org/r/20260414194702.1229094-1-praan@google.com=
/
> Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in V11:
> - Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text wh=
en
>  CONFIG_SYSTEM_SUSPEND is disabled.
>=20
> Changes in V10:
> - Disable SMMU interrupt generation during suspend before disabling the
>  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL=
.
>=20
> Changes in V9:
> - Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
>  path waits for command completion rather than only command consumption.
> - Document that arm_smmu_setup_irqs() is probe-only and that future Xen
>  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
>  resume.
> - Restore the reference to Pranjal's Linux runtime/system sleep series an=
d
>  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
>  path.
> - Prefix the subject with xen/arm for consistency with the rest of the
>  Arm suspend/resume series.
>=20
> Changes in V8:
> - Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
>  the existing runtime CMD_SYNC path.
> - Fold the suspend rollback reset path into a helper and rename the error
>  reporting to describe suspend rollback rather than resume.
> - Treat SMMU reset failure during resume as fatal instead of logging and
>  continuing with a potentially unusable IOMMU.
> - cosmetic changes
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 194 +++++++++++++++++++++-----
> 1 file changed, 158 insertions(+), 36 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bf153227db..7f1d00fb81 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -94,6 +94,12 @@
>=20
> #include "smmu-v3.h"
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +#define __init_or_smmu_suspend
> +#else
> +#define __init_or_smmu_suspend __init
> +#endif
> +
> #define ARM_SMMU_VTCR_SH_IS 3
> #define ARM_SMMU_VTCR_RGN_WBWA 1
> #define ARM_SMMU_VTCR_TG0_4K 0
> @@ -1814,8 +1820,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_=
device *smmu, u32 val,
> }
>=20
> /* GBPA is "special" */
> -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> -                                       u32 set, u32 clr)
> +static int __init_or_smmu_suspend
> +arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
> {
> int ret;
> u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> @@ -1995,10 +2001,35 @@ err_free_evtq_irq:
> return ret;
> }
>=20
> +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> +{
> + int ret;
> + u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> +
> + if ( smmu->features & ARM_SMMU_FEAT_PRI )
> + irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> +
> + /* Enable interrupt generation on the SMMU */
> + ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> +      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> + if ( ret )
> + {
> + dev_warn(smmu->dev, "failed to enable irqs\n");
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +/*
> + * Probe-time only: request host IRQs and, when available, program the S=
MMU's
> + * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI regist=
ers,
> + * so any host suspend support must treat the active MSI IRQ path as
> + * unsupported until that restore path exists.
> + */
> static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> {
> int ret, irq;
> - u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
>=20
> /* Disable IRQs first */
> ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> @@ -2028,22 +2059,7 @@ static int __init arm_smmu_setup_irqs(struct arm_s=
mmu_device *smmu)
> }
> }
>=20
> - if (smmu->features & ARM_SMMU_FEAT_PRI)
> - irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> -
> - /* Enable interrupt generation on the SMMU */
> - ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> -      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> - if (ret) {
> - dev_warn(smmu->dev, "failed to enable irqs\n");
> - goto err_free_irqs;
> - }
> -
> return 0;
> -
> -err_free_irqs:
> - arm_smmu_free_irqs(smmu);
> - return ret;
> }
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> @@ -2057,7 +2073,8 @@ static int arm_smmu_device_disable(struct arm_smmu_=
device *smmu)
> return ret;
> }
>=20
> -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +static int __init_or_smmu_suspend
> +arm_smmu_device_reset(struct arm_smmu_device *smmu)
> {
> int ret;
> u32 reg, enables;
> @@ -2163,17 +2180,9 @@ static int __init arm_smmu_device_reset(struct arm=
_smmu_device *smmu)
> }
> }
>=20
> - ret =3D arm_smmu_setup_irqs(smmu);
> - if (ret) {
> - dev_err(smmu->dev, "failed to setup irqs\n");
> + ret =3D arm_smmu_enable_irqs(smmu);
> + if ( ret )
> return ret;
> - }
> -
> - /* Initialize tasklets for threaded IRQs*/
> - tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> - tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> - tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> - smmu);
>=20
> /* Enable the SMMU interface, or ensure bypass */
> if (disable_bypass) {
> @@ -2181,20 +2190,16 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> } else {
> ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> if (ret)
> - goto err_free_irqs;
> + return ret;
> }
> ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
>      ARM_SMMU_CR0ACK);
> if (ret) {
> dev_err(smmu->dev, "failed to enable SMMU interface\n");
> - goto err_free_irqs;
> + return ret;
> }
>=20
> return 0;
> -
> -err_free_irqs:
> - arm_smmu_free_irqs(smmu);
> - return ret;
> }
>=20
> static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> @@ -2558,10 +2563,23 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> if (ret)
> goto out_free;
>=20
> + ret =3D arm_smmu_setup_irqs(smmu);
> + if ( ret )
> + {
> + dev_err(smmu->dev, "failed to setup irqs\n");
> + goto out_free;
> + }
> +
> + /* Initialize tasklets for threaded IRQs*/
> + tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> + tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> + tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> + smmu);
> +
> /* Reset the device */
> ret =3D arm_smmu_device_reset(smmu);
> if (ret)
> - goto out_free;
> + goto out_free_irqs;
>=20
> /*
> * Keep a list of all probed devices. This will be used to query
> @@ -2575,6 +2593,8 @@ static int __init arm_smmu_device_probe(struct plat=
form_device *pdev)
>=20
> return 0;
>=20
> +out_free_irqs:
> + arm_smmu_free_irqs(smmu);
>=20
> out_free:
> arm_smmu_free_structures(smmu);
> @@ -2855,6 +2875,104 @@ static void arm_smmu_iommu_xen_domain_teardown(st=
ruct domain *d)
> xfree(xen_domain);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *=
smmu)
> +{
> + int ret =3D arm_smmu_device_reset(smmu);
> +
> + if ( ret )
> + dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
> + ret);

If reset fails here, we only print an error.

Could the SMMU be left disabled with GBPA.ABORT cleared, allowing guest
DMA to bypass translation when the domains resume?


> +}
> +
> +static int arm_smmu_suspend(void)
> +{
> + struct arm_smmu_device *smmu;
> + int ret =3D 0;
> +
> + list_for_each_entry(smmu, &arm_smmu_devices, devices)
> + {
> + /* Abort all transactions before disable to avoid spurious bypass */
> + ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> + if ( ret )
> + goto fail;
> +
> + ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> + ARM_SMMU_IRQ_CTRLACK);
> + if ( ret )
> + {
> + dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
> + goto fail;
> + }
> +
> + /* Disable the SMMU via CR0.EN and all queues except CMDQ */
> + ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
> + ARM_SMMU_CR0ACK);
> + if ( ret )
> + {
> + dev_err(smmu->dev, "Timed-out while disabling smmu\n");
> + goto fail;
> + }
> +
> + /*
> + * At this point the translation interface is disabled and the
> + * SMMU won't access translation/config structures, even
> + * speculatively, as per the IHI0070 spec (section 6.3.9.6).
> + * CMDQ is still enabled so that a CMD_SYNC can complete any
> + * previously issued commands.
> + */
> +
> + /* Ensure all previously issued commands have completed. */
> + ret =3D arm_smmu_cmdq_issue_sync(smmu);
> + if ( ret )
> + {
> + dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
> + goto fail;
> + }

Could we lose EVTQ events here because we do not check the queue after
stopping it?

Cheers
Bertrand

> +
> + /* Disable everything */
> + ret =3D arm_smmu_device_disable(smmu);
> + if ( ret )
> + goto fail;
> +
> + dev_dbg(smmu->dev, "Suspended smmu\n");
> + }
> +
> + return 0;
> +
> + fail:
> + /* Reset the device that failed as well as any already-suspended ones. =
*/
> + arm_smmu_reset_for_suspend_rollback(smmu);
> +
> + list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
> + arm_smmu_reset_for_suspend_rollback(smmu);
> +
> + return ret;
> +}
> +
> +static void arm_smmu_resume(void)
> +{
> + int ret;
> + struct arm_smmu_device *smmu;
> +
> + list_for_each_entry(smmu, &arm_smmu_devices, devices)
> + {
> + dev_dbg(smmu->dev, "Resuming device\n");
> +
> + /*
> + * The reset will re-initialize all the base addresses, queues,
> + * prod and cons maintained within struct arm_smmu_device as well as
> + * re-enable the interrupts.
> + */
> + ret =3D arm_smmu_device_reset(smmu);
> + if ( ret )
> + panic("SMMUv3: %s: Failed to reset during resume: %d\n",
> +      dev_name(smmu->dev), ret);
> + }
> +}
> +#endif
> +
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> .page_sizes =3D PAGE_SIZE_4K,
> .init =3D arm_smmu_iommu_xen_domain_init,
> @@ -2867,6 +2985,10 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> .unmap_page =3D arm_iommu_unmap_page,
> .dt_xlate =3D arm_smmu_dt_xlate,
> .add_device =3D arm_smmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> + .suspend =3D arm_smmu_suspend,
> + .resume =3D arm_smmu_resume,
> +#endif
> };
>=20
> static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> --=20
> 2.43.0
>=20


