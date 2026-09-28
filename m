Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A59CA5FA1
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 16:19:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436138.1654915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE4B-0001Xb-Ql; Mon, 28 Sep 2026 16:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436138.1654915; Mon, 28 Sep 2026 16:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBE4B-0001XT-NZ; Mon, 28 Sep 2026 16:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1436138;
 Mon, 28 Sep 2026 16:18:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1xBE4A-0001Uj-45
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:18:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBE49-003X29-H2
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 18:18:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba936a-bab6-0a2a0a5309dd-0a2a4509b1f8-6
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:18:57 +0200
Received: from [52.101.66.6]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6aba9371-be1a-0a2a45090019-34654206546b-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 18:18:57 +0200
Received: from PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::11)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 16:18:53 +0000
Received: from MI3PEPF00008553.eurprd05.prod.outlook.com
 (2603:10a6:102:2cb:cafe::99) by PR1P264CA0037.outlook.office365.com
 (2603:10a6:102:2cb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 16:18:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008553.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:18:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11820.eurprd08.prod.outlook.com (2603:10a6:150:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 28 Sep
 2026 16:18:20 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:18:20 +0000
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
 b=TugQr2JJudHSU+SglEXpURuZjwkYbJuAjKjelor45s3y5OUpRKFMv5RGUO5VKTTA1s6B7MZZ+eSWvOzigFXAT2xcZJUac/xi8dXbirl+HodvbLOs/LXGGbFSDlcBJmucpGn7Bn6lOUYYiRytbMK6dtBGE3vR88IsDQCNSRM7V6PML5v/uOjp63owUCluE5E2Zoe/hqGuQwH5IeCVVenkSjpCYUZLLNO9QYY/350pzx/PEE5F706G+rVEKLuCFEDQ8tpOoGZSoP0zyJsv5RafqJA0siY9zwXgUngGXz0Z9sRanjKrAlUUFhEwpx1RJ+RTyp9PQ3IatmQHzye1uii0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5b4nAZXMWzMeqkCStZTOYjlBQHdpgPzT/Qx5Sx2T14=;
 b=bNy6ClwGIFSIemvchUdlOkIPrAsP2HRUkfz0cVKyYdktqC7MrKrfqWY3TeFprUi+GY+QO8pEx2aZL4MC6Af21usnbaQszqs5E911q2gR4jXzBV6cxIfX4/Xe8gUVbf+I6DaE293JBtCuqYR/gyjlwsUO5bOm8QI9IyVPaODJ8Jrie9kQpAMF/lu6eU+hVxJOo2H9mYnK3EPg3ZuyfQLIo1hQVT7vxQOMdw8lVLD/aP6u4VkdCyMN5okaVqx5uGIKHTSA40+EzZbFRY3YAPmXY5ToIoSDo7KBSrCLQQ8MVyGdfOARpPWumivYbsGXuyM3sMDoku6/soUHFVX+pxWM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5b4nAZXMWzMeqkCStZTOYjlBQHdpgPzT/Qx5Sx2T14=;
 b=ieb6jCu4jZU0M5r1x7pzWOeMtISE3Dxm3h8AL2TproSBd9zQM8es5JxuFU/jCKstRcPVBbwsfe/SEOfvq8t9hJpmqkwRuitE75e9O0XH+IXmFXFsZW0f4xM2vvJh378+6WDdmWyo9aQIqj6cqfCXGYsAGhb9dmLCjd0+Ijz0WR8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5b4nAZXMWzMeqkCStZTOYjlBQHdpgPzT/Qx5Sx2T14=;
 b=ieb6jCu4jZU0M5r1x7pzWOeMtISE3Dxm3h8AL2TproSBd9zQM8es5JxuFU/jCKstRcPVBbwsfe/SEOfvq8t9hJpmqkwRuitE75e9O0XH+IXmFXFsZW0f4xM2vvJh378+6WDdmWyo9aQIqj6cqfCXGYsAGhb9dmLCjd0+Ijz0WR8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <mykola_kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v12 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Topic: [PATCH v12 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Index: AQHdNjDtTnbe1qGMXkGl7DUXC/LZ2rbkXYYA
Date: Mon, 28 Sep 2026 16:18:20 +0000
Message-ID: <94B9CFD3-7B08-4CDD-A05B-86F9A6AF7744@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <39722280b669cf6b914d7cc70fbda667c123e21d.1787838455.git.mykola_kvach@epam.com>
In-Reply-To:
 <39722280b669cf6b914d7cc70fbda667c123e21d.1787838455.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11820:EE_|MI3PEPF00008553:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 27aae633-29c0-46bb-3849-08df1d7c3051
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|10067099003|18002099003|6133799003|56012099006|5023799004|11063799006|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 4USqaTPkJrDfJ7UBoZ164zkpNa97sv1cl0Q59bzi4TVPSjQwACYcbvm4tMX7HxJ+j0QAUm3Z+5UDovlrwLNQBg2kc35/0e0i2ATKec60L2yGeYEtnTlu7XmjB99dCuTpCU5jzapqiw5g8TKAdyzuzM2PfVLtudOTb0MjpYOCOOcq9KDvk9ueh+8c8m79Ao3nRf33bcZqiavBK5jbEb6aPv92yO73uPJN3KtpgpyKKMl7/oRPaxZ/t/O2gj6VazvKh1yxQs05qTCgm09RgWnMnlQRr52hEKjfpeMu8h87GGpo+DOtFDSfllRVpkwRGlYHOLaR4YgEaFMelQ2XyY6qdw2qr05TVFIyv0eEEQ4aUIqBnmFbgNdvZDWFQNC/PYO+H1Mx55KZ7+PpLr9UpzLu7/aTZALJpbv3ZfVHJVPbAd3ktayXRYG5iv0tZC4i+gZqMgOj+xCJP+EIflqwmX76xVSQdTbxqeyq0pky5eCowfztaTczOSoRjopKrP2eKdsz/PYJ5z7jZOgQ6Yi3iAq8UFramSSTnPmVx7gB1BjvNeTWkjDIV5J+1UII4kX3sNbN27NiF5ppCUzf7NNqbuGueLB6ntZ/pgWRZcOHd94IIW6P1Wr3gxrIoQMs2Q8Lmny7FNdZAtm/A+OsBWgM8CC4xXec6NMIb0WcjQZ53X8zD9F+NIrN9e5XaBhVInKTgudR+S4Uk7wqXhISWUk6eoP/k8sJ9r15gv6ONOm9ZRSfFps=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(10067099003)(18002099003)(6133799003)(56012099006)(5023799004)(11063799006)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8D0C175E49EF7459B78610EDCC65973@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 NlAT6ZUokLxFO10UiVPvEAGR9ilHbgtLxTMBmed2i84vvRjmOruFOiAvAE471qwp0GdyhVlkxJzCI00vakV+BMU8s4YwouICTEokJtV4GQII8OsWYx2bwoxQmzo1WcAvNBGuZP9ygznwz88/C1SXXl7QwqYVqCOzmvKczC4w+0E6ymFRvI04Ld1KPZPWw0b8bk+pQeZecHSrK3s84bW9IKq+8xukIHyk5ziSrUudCXuIaQQhA/Pqvh/1xo3huYAPXNaLlpgdq8DtyxmDv/xmwxn/7t/bXQMM80DWqhGEOZixTgrJuGmMdx/7xVN6dYTq+ywilZldhEqt+BIz18n6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11820
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008553.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4f065a5-5537-44e7-99e2-08df1d7c1cbe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|35042699022|14060799003|36860700016|6133799003|11063799006|10067099003|56012099006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dh3dFsX4JtyRgxq/GKn+9KPKOkSURgmKYdXAmvKsW6HU7m8G9+VmTktXVgyeWQ1eiB0KrLob2jmSLllAPh7A23myuOqOck/ClgHVLUm2dhtprDA801RtHvDMDLCV/lbskbs2aFCaPnH30rYh2HNOavYc5vwpwuTEfHzVxv3tCRanu5Le8mtSXtVanXBlkCIKg0k2Y+Cb5gLsYng8fx+RiTSIePN6B59EtLqSTAgnYFNMgXXGhKwg/wUQgQjgkON2693QWc6obnCvdJFEPB7RA/rIL5+sEg0iZkuHH/AO1JsDpW0jU7CMo5Xt5GemY78PLzXmbWeq6lxQW+57IA9CdJGMqsCawG7B8j7HvWlLg6pTWbHBxQAHENfXdLVnKR9eWjsu5161Am4KQMxPtCe0lqIA9sdG3HahCyJRP3G/IGdXDC9mEzzOVOmjTcFbnzY9mUsGj5JmUG22jpBtoo4NV3hZ4cujbk4aYI71H8y7uiTZ8sZCVE5DDTSjrug5KCa6OntdDB8bAofI/swadm6oJw8z7rlFdVo+dDhSowCj5dczk1elE3q2p9OgLD53CEbP03nmvadLJcdJTdQwxrTRozLtB1HtPTZi6BUjWejUfBdUz9LBS2wuLVxs4UUfDX37R9EffFGoduQrZuwqjk7sBS8dXsH795WCrjocABEo+9JE6RDkTApReX3y1wL1UPKTtUKXKcwyvALFQrXn6zoPWg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(35042699022)(14060799003)(36860700016)(6133799003)(11063799006)(10067099003)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z60//wkDoX/OLzO+q8MONG/xextGhr2rnt1xUiAHskXez89TTDZWx5B72j/vv00lt5TVKmz15UJ0cf0mQm3ZAsyB1xk8BI3Hmo6au839wx2DlOkX6DI4YauN+k1hGGLskkZx7GZfQXoye0H/D+VntMOnUOs00jVnoa4OkktSxjhA3jIGNIvMBfPtxV5cH9KggbTr4kytU8trVbiv6v7WlhjpN8Ea0eTXmc1W01DS3m8n2ULijsyQiq4g5gIsKNd3wY6qo9OzhQdbeqh8htmGWum5pH07JZsUy9nq59sFU+1fUjaE4ZaLUOuYnn6kr5wuLjmK1But+qpkDbIsIYjQx800tsfba/QH2qG5nTdizakcXWUyGGSZ3RiR8h2A/Uxpe9OwKAFkjJyvM73bOOgmWRrBZhcRKeC+CdmFN6CdP4gC8v5hVeIH2P2oLV1xAHhD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:18:53.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27aae633-29c0-46bb-3849-08df1d7c3051
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008553.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
X-purgate-ID: tlsNG-bad1c0/1790612337-BCECE034-0219EE85/0/0
X-purgate-type: clean
X-purgate-size: 4628

Hi Mykola,

> On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
> platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
> with a zero context ID, matching Linux.
>=20
> This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
> The resume trampoline and context restore are provided by earlier patches
> in the series.
>=20
> Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
> advertises SYSTEM_SUSPEND via PSCI_FEATURES.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v9:
> - cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host call
>  on the cached capability
> - keep the cached SYSTEM_SUSPEND capability read-only after init
> - log whether firmware reports SYSTEM_SUSPEND support
> - pass an explicit zero context ID in the SYSTEM_SUSPEND call
> - drop the stale note claiming hyp_resume is still a stub
> ---
> xen/arch/arm/include/asm/psci.h |  1 +
> xen/arch/arm/psci.c             | 31 ++++++++++++++++++++++++++++++-
> 2 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 48a93e6b79..bb3c73496e 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
> void call_psci_cpu_off(void);
> void call_psci_system_off(void);
> void call_psci_system_reset(void);
> +int call_psci_system_suspend(void);
>=20
> /* Range of allocated PSCI function numbers */
> #define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a7760..e05dae1133 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -17,23 +17,27 @@
> #include <asm/cpufeature.h>
> #include <asm/psci.h>
> #include <asm/acpi.h>
> +#include <asm/suspend.h>
>=20
> /*
>  * While a 64-bit OS can make calls with SMC32 calling conventions, for
>  * some calls it is necessary to use SMC64 to pass or return 64-bit value=
s.
> - * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
> + * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
>  * (native-width) function ID.
>  */
> #ifdef CONFIG_ARM_64
> #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
> +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
> #else
> #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
> +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
> #endif
>=20
> uint32_t psci_ver;
> uint32_t smccc_ver;
>=20
> static uint32_t psci_cpu_on_nr;
> +static bool __ro_after_init has_psci_system_suspend;
>=20
> #define PSCI_RET(res)   ((int32_t)(res).a0)
>=20
> @@ -60,6 +64,25 @@ void call_psci_cpu_off(void)
>     }
> }
>=20
> +int call_psci_system_suspend(void)
> +{
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct arm_smccc_res res;
> +
> +    if ( !has_psci_system_suspend )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Context ID is unused for the Xen resume path. */
> +    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), =
0,
> +                  &res);

Since this series was sent, arm_smccc_smc() has been changed to return
the result directly instead of writing it through a result pointer.

You need to update this call.

Cheers
Bertrand


> +    return PSCI_RET(res);
> +#else
> +    dprintk(XENLOG_WARNING,
> +            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disable=
d)\n");
> +    return PSCI_NOT_SUPPORTED;
> +#endif
> +}
> +
> void call_psci_system_off(void)
> {
>     if ( psci_ver > PSCI_VERSION(0, 1) )
> @@ -223,9 +246,15 @@ int __init psci_init(void)
>=20
>     psci_init_smccc();
>=20
> +    has_psci_system_suspend =3D
> +        psci_features(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND)) =3D=3D 0;
> +
>     printk(XENLOG_INFO "Using PSCI v%u.%u\n",
>            PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
>=20
> +    printk(XENLOG_DEBUG "PSCI SYSTEM_SUSPEND is %ssupported by firmware\=
n",
> +           has_psci_system_suspend ? "" : "not ");
> +
>     return 0;
> }
>=20
> --=20
> 2.43.0
>=20


