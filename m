Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208CECA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:11:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442651.1660182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW6r-0006X1-J1; Wed, 07 Oct 2026 18:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442651.1660182; Wed, 07 Oct 2026 18:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEW6r-0006Wu-GP; Wed, 07 Oct 2026 18:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1442651;
 Wed, 07 Oct 2026 18:11:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xEW6p-0006Wg-K8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:11:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEW6o-0012q7-PM
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:11:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ac68b33-2eae-0a2a0a5409dd-0a2a4505d320-24
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:11:18 +0200
Received: from [40.107.162.125]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ac68b46-4cb1-0a2a45050019-286ba27deb6d-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:11:18 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAWPR03MB9788.eurprd03.prod.outlook.com
 (2603:10a6:102:2ef::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 18:11:16 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 18:11:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTikAHlXg4PIJbquW7aPk29t4tAuqKfY/wj7cIRT41ZUZ1bbVaBQZ4CCgSTEiqiJ8UiCIHgM/wNElGQ+ycODX4Gc2OXSks3YT+Es1on+79GSsby2+R9AwhhgAEcs2cC1Icn2gosz4Dv2CiwHr8dn5VVbRspG79XpEZ21RU3zwST9JLVbPLEV0ZkO9vPHmqnV5IwiX3k699HsrmBWWPyHxhIe/xkCzusDEqfaovReaFM3Hwe+MlFMXMJJfRs4ySN8WweodENdDRuvo2G33fOGEierNE+uiak5pTKgrhmZAZkKqZ3R/X+1daC1MAaAF7GkXv6irOmIn0fmSSkMg78xaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHdT48kq+wT7uC4uuIfGYnDjzFbwLpZbUDog5uvLSF4=;
 b=rOFocPLFNhk6V/zuL8gkqkpXJQCLC7+dmOpcYSLPH7ScVZAfYuP+pWXeRADDgmGS5ynVBqHUAutvqV28NYSZUpcMMnxqNX7H3jzqldD+tbzOmQcfrW3kmEeIep8tc2d6BnNCgz4IbmmyBMLeE3MVncvL/gT8NVKXLCtKbp+nJmniAUHPWhLVUFHyVmdDdVOWFM7TyoBq9mKsSI0G/coiuSayuKqO0+WlQG9FKuFzbVy7tAPRZHx7qphod58HBBMOkxp1v3ejpJbIjeaeHLr7+5F2Oz2zAXgfdxaqr2LcE/UHuiMCR5EkyUBl3GGtlA5pbzw0V22Fg4MVaO+XGWQIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHdT48kq+wT7uC4uuIfGYnDjzFbwLpZbUDog5uvLSF4=;
 b=mu43uyBjhQ+k6nUBAUnUpUCbcuebkX8O0nIxngDkvI63GRiOuEShX/3sGgudoIZ5wYDoZBgE1gsuPRlj0HSTF3/wse4ZaGdDDrFCCMSb8DB9362C4z/F2J2rcC2tnCMsql4CyJI5G9pmOVSNdAus9nkeFJfP0VjmFaRkevgU494sgfCtdNEp6hWPSWCtm/9PUdmbDhk8Hrad7kh4LvLIQc1XMdACThVuA6lTCHGOultRmFXJ1UO92Pwp/S5AFOr1F/CnceIE/sBsNSf88VYTlqFK64wzDCw29Jn8/nIfgvGNfhCK8Y9bYokKt3acyigL0Mif3xnVEaAS6tN7odktoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] tools/symbols: fix oversized names and token expansion
Date: Wed,  7 Oct 2026 21:11:01 +0300
Message-ID: <cover.1791384310.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B8B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63c) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c036c3-9dca-45e3-49cf-08df249e6112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|5023799004|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bB+kHm0zBOhKFoSFiHH0VYY7Nf3shINLR5Byh50N/jMnuvrHgpzveVwEs61F7swCG7LGeTsVv/zdL0kgNgi5akJA3B4J77mbe7iJYEqqnR5bPvxduj51J6HYOQD9Gejy3tGdw+oySHVX/3Kwjkm9LF5DTYnddrv1lBkEUtlwJQiETjH/ln8fT+r0PTCrAcRrv+383OL2VIU7qe/pONWwqBTRAmb+h5MeAFw5SRjXQM/tzOUZpLyDMMp2R7M4oszQQslcqkQFPHJURhyPeKzOS1/ZR/p4cSyB3syJubkekaqmqgAj70hrsOiWsxZuDo5oirQ6kmw2Hx2062l3Jo069yElninJiKTAtSGKp3zuqthY+mQ/zoIPG4/VSv7ukKHJG3CWSFEOK7zvAsCi2XKxlA4ntYmBU8C+oBtrfTCTFvSU3efbvB/PD9GoUgzhb6HqnEDhTuX7DHvtBgi/xQwDKZjg4GeTJquN3g1fP7qBTJ8ZPzPj6l9fHNBiPyo05anQt9hhbQj0lQSeV5lwJGPCZ/8ePVSps046N7Nbndxnb01j7ySnihKfFeGOTFd88ekldXrL0cQbFHz5FJnqe9ltW/F7zTC05nIxT5R0kQjj3tCnc/OU69BsfoaQGD+PKMrDG1IeJb1pTV0dcqvhpc3R1rrGrdOoQky7pLAsPYP5GNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5pSUPOBmC/8MRQmonkFoZP2dFIC0Tep/ObioHoLFFQ1nIPCTrtCOiAwCl5m?=
 =?us-ascii?Q?Q+owXmz9QW6hZdKInZLFP3bAvIfEsnkqVJEOLpKg7PeY+/ukZgLKqz3YW0s9?=
 =?us-ascii?Q?y46SJAhMDdiR/HgwdCLaulPaPuX44740XzZhyq5CI5+/oColLMHRIh0gKmQq?=
 =?us-ascii?Q?idMxspsJ8m8+yx3FXViWiJZ06N56uwPxlUh860rQA8++rsauH3xAaf/FBY79?=
 =?us-ascii?Q?lkNbnnFByJHRzxi1uOYZr3l/drL93VgjW0EOe1YQAJzfEWFqS98B0qLNMsA1?=
 =?us-ascii?Q?kWkT4ngGzzURCC8HYfC5Aqnk7KngOHjF1fqT444Qyg4DOCv3LTx+pn4AT4hH?=
 =?us-ascii?Q?8frolIlQr6UGt0do4Z3djBibuNHJOupm7MX9DElKUM02Q2J5TrIjcakGdKyk?=
 =?us-ascii?Q?9O9eyszOjv8AEaOlBF76kjoErcmnFtLJCbkFBLa5pFcsRfffGXE00cwSRIK6?=
 =?us-ascii?Q?NBg+V7XyLTTnRPYZT50OhPPlW8xUkYvtTRcfs/YPVeaPwChgO3plNAG+mFhW?=
 =?us-ascii?Q?zFol5FBI/l97JkaNmduqsX12JVtHm6d9KgppGUuJLf3G9YA4qYq9nN2El990?=
 =?us-ascii?Q?63G2uCAWpMAlLZKMmlx4Y2xr/rJc3hce8R46s4JJQ3AH4p5QyLw7VbIaXAFK?=
 =?us-ascii?Q?W+dYLFLKxRDRbPax56062LaWSdrhW0DIz0oFpX28Z3zj62G2v2YnUxfDp4cy?=
 =?us-ascii?Q?3Csr4wqMoRwdrSSuw0BCSKXvhuYslJe+koPLR+52PA28xbWjOviUmjRQDpKQ?=
 =?us-ascii?Q?u2K3Og1kntyVIrlGeqcN8U/8SUloeLQ+CcV0lT82Bcez0+rXg3GuPw9++jZV?=
 =?us-ascii?Q?1cGwWTo2LZkWV0MZjWoA4kIBPxQoxn6NeA6nUK5/XMGHQisJN1D+9XlN8kF2?=
 =?us-ascii?Q?Ws4OZ5qZWR7UabbkCsFInbcxPejCxYVKk9mo1uYf1xsV34qFgKdnxERzfXlI?=
 =?us-ascii?Q?4TJelHtstOIex8Wnkd57cdeQWyWmBHoJxH4UqQSr0zzzGDwnf+/q7r6H+6W6?=
 =?us-ascii?Q?qNsanvdW3nH8eBwzzvB3jD5UnSlrj3Cd/M5hHhkY9G1DQz8S5fKNUXjh17tR?=
 =?us-ascii?Q?t5dySwia7cVb+FOZUtUYVVdSQSNLj+M9A/ezNUm/nLKJKMjotF4luOC5G06v?=
 =?us-ascii?Q?SrObEEJVa523yO+3cv3zC4C8dW2DqrIk8l0H+jaJyJ7vx46mu43W3gFn9fIR?=
 =?us-ascii?Q?ymUiIqSUSZBQas7MGyfqv1beceIo/xpZnmyD1bMED19LxzMtbXNSBDAyb93c?=
 =?us-ascii?Q?EvFrdpR4t4AYhCpKR9BL0pDxvZeBpo0LRDHocqwAvpmqtGRGIIrq86UrjhWM?=
 =?us-ascii?Q?3R8hX18Pq05TQd52QtNGRTq7KG+QIv8b0Fv0FHrAr7OJUWPDOwXwC5aIhgeY?=
 =?us-ascii?Q?VpQHmJrdEvDOl8jb0jEk8e/Te6+iksjP4flffCN1WwYWjWUgdlaUQ3TNpfDa?=
 =?us-ascii?Q?T4mPCttoZC3WSXpV8cCS6TZ2hnSVHpCKGC/jXz1AcQ71WH6dEgkSQtjjiXpc?=
 =?us-ascii?Q?Yu2cmh73AJ5w9LkZV0wC3QI613ZeDsTbWuK/g1hDV43uxoqFJ363QYLcX2/o?=
 =?us-ascii?Q?HsOr0NTvutqwCAZTcdPmMDRJhJzyomm5QJ632mczIx/wLErMaGpo3z0oolD2?=
 =?us-ascii?Q?TKhVD4ng86XyuKf/tYqW3uMcLmB+Vp75LHCW0GtNjiDaMopUVzgNLR3a+naY?=
 =?us-ascii?Q?6sHZb/Z4CkEKWa9rPtjoPOUTpeUUlWZW8aS/iXJJdSfguV17TGaVUugfZp7F?=
 =?us-ascii?Q?bfL2OGGJAw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c036c3-9dca-45e3-49cf-08df249e6112
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:11:16.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLvGaU++TGO3bSfOomDip3YQS6lbSiTrMJFEAeo2OiosUBMlRTFUnEITZLx2bEXE0QOvC4EzZGe/fJUg2xNzdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
X-purgate-ID: tlsNG-c201ff/1791396678-F66B52A1-44B3F722/0/0
X-purgate-type: clean
X-purgate-size: 2103

Hi all,

This short series fixes two bugs in the build-time symbol table
generator (xen/tools/symbols). Both are host tool bugs; the runtime
code is not changed.

At runtime, symbol names are expanded into buffers of KSYM_NAME_LEN + 1
bytes (128). The generator did not check that the names it puts into the
table fit into these buffers.

Patch 1 fixes the first bug. In SYSV input, local symbols are prefixed
with the source file name ("filename#symbol"). A long absolute build
path can therefore create a name longer than 127 bytes, even when the
symbol itself is short. A debug Xen build on an Orange Pi 5 (RK3588S)
crashed during the boot self-tests: symbols_lookup_by_name() expanded
such a name into its 128-byte buffer and overwrote the saved frame
pointer and return address. The patch rejects retained names longer than
KSYM_NAME_LEN during the build and prints the offending name.
Readable --xensyms maps are not restricted. Nothing changes for names
of at most 127 bytes.

A build from a long absolute source path can now fail at link time.
On x86, in-tree builds use relative paths and are not affected. An
out-of-tree build with the default config fails if the absolute path of
xen/ is longer than 78 bytes; the longest such name is
kexec_reloc.S#compatibility_mode.

Patch 2 fixes the second bug. In the compressed stream, each symbol is
stored as [type][name]. A compression token can therefore expand to
the type byte plus a full 127-byte name (128 bytes), and write_src()
adds a terminating NUL. Its local buffer was 128 bytes, one byte too
small. The patch allocates KSYM_NAME_LEN + 2 bytes (type + name +
NUL). This bug can trigger with fully valid names, but only with a very
small symbol table; real symbol tables do not hit it. The new size
relies on the name limit from patch 1.

Mykola Kvach (2):
  tools/symbols: reject names exceeding the runtime limit
  tools/symbols: leave room for the type byte and NUL when expanding
    tokens

 xen/tools/symbols.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.53.0

