Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52F606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=mJBxlsKG
Received: from list by lists.xenproject.org with outflank-mailman.1462574.1673560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNE-0005PH-TN; Tue, 27 Oct 2026 21:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462574.1673560; Tue, 27 Oct 2026 21:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNE-0005P6-PU; Tue, 27 Oct 2026 21:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1462574;
 Tue, 27 Oct 2026 21:06:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNC-0005NW-Rp
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNC-0005yu-8a
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:22 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11225-e002-0a2a0a5209dd-0a2a4505a020-18
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:22 +0100
Received: from [52.101.83.138]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1124d-4cb1-0a2a45050019-3465538a2d37-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:22 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by VI1PR03MB9914.eurprd03.prod.outlook.com
 (2603:10a6:800:1c1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:06:19 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjjNYB+yuN3+JQ5snlvFW4zBkNSLm3IpJ1WJaDk6EEiZEFloguR2PdXGEOaOWwUarHDceJk+aV2K74QWv0wSwath9vA9iKTDGXMulxgdAB3wnR+eKqueyhW17j7SaN/MpZcmsZ0qFeUqX/W1Wcn2mJKjKZ8ZHTjPjBn09T8GSXg14KhzlvnVsZHSfWh40ugO6J8uaPtvidDvKYzLNzbNlcim9s0fZzYGBO521YQqYYmC4AhKgtx7leQTeGphJgqMqIlChbHLVeR7XNApeJ4+H/O7CvY7DZcUkpzwpPrcdW/tXYUWIgEmPJlgUjUXx6AtTRIKsEEq/U9a5FmXgn01GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLtMWURpXJd1G4agtjp/HEofRi9wCVlpWZUFho8rMKQ=;
 b=b+vFG6dqfKTavpJRiqBPkkl1S8varfwSYrWaeV51G0ccxohMz9F9M4Nsuit3j7YMjw1JePziu4lojkEbdzr/MAzvZXtDIJ3+rV9/aFIRlK/ez+nfXq0nEPSTeiFdwYOIVCo4v+a18a+IHLnrNLGvs0lSZh0DfvSG5b9XYuQwpXVbuuNjjFWW/e05XAMp88hJMCQWaKb5W0Bk6fMRFCCDMLAKBe4ENvnBEWVQ04zQ6fbcvShaM0vLyEqIFp244WBWruFC1RZzGhT3ty+dRE3XncuBkjCHT6LWa9nfKclkHISGsJU92xP77wwz0BAr7PD1kv7XEVajY4wSYuh9LUKlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLtMWURpXJd1G4agtjp/HEofRi9wCVlpWZUFho8rMKQ=;
 b=mJBxlsKGuPLHIjl/DDVW9vG+yDIUUxN8tOtz+VtEkBqJ0e7FP0VFSfmBEaC6IJ7tIpOxx/sMKntwMEDWt8QgxAWS+t1HXFOCYfj2wpRnDunN005qi9dvGiowW/l6HjzKnP8BR4cSl1aX57RGtVx8qhNxvKJhvg5ZtL6rVKh5QbbZ0aRk+niyV1T17aaJFw4xD1Yn+7mdSO33ccNz1qn560t+ZZnGiOzTwVPs1SNvthmBl5pNRJQIPDn2GGFRdZY61aaQsq18iTY/rqA9e/IolYBqhXDatwKSOPCGw53p9/1tu9Kgc6/ra3KaayNEhRfUqJd1GWBUap68qgqC5ytCZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 03/14] xen/arm: gic-v3: tolerate retained redistributor LPI state across CPU_OFF
Date: Tue, 27 Oct 2026 23:05:52 +0200
Message-ID: <5fbe90be9e32464bf0f03f50614e65fd899d608c.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|VI1PR03MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: 0775597e-174e-436a-b233-08df346e257c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261021123027099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|10067099003|56012099006|261026121527099003|6133799003|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	1NbvMK9bFpbS5PD+B0Q38DNVtARU7tjzHEsUzDOzA35p+N56lkcyQwMucZBUMrXi5UFxxHx+npbwMf2P/ahlwHAZs1fVtUbln+KZxIOvr/lmt0/+H8zI85oYW3roNlQSFpkFcfAVlVAdkGIv9+TC7Vreyskx1rD7+5HnhTjXj9g/Yrk1sqrHalZFFGwDdnHFE+U//MD09UjJcbDlt/Lp2Gl1jwdBRd2f+jsVrYm7FhVIDkfSwhOgo76aD/tfsFkr0yg2FvzwtX76s4ZhP0sIfOZVNgPmcXbkmeg36LC9yqBh5Pf69axwwXn/POIaL2JtIKv1gnT93EZJj7lMY+r2+JltrjI1AD8eDZ86zozLLqOdUcvcE3HOLDEwIgOaHmijYzXsNHc3P7o6TKdfEkuMmoGDmB1t5TgUbcV/I1RfJK2UyAyxmHrXud1Qw/MbxmQXhcAlwiGmZAjahINmYw/Kb1Ew0JUwEt8W4Va5/lGpDmReLwB4nuObKTu1kPwGnz67RUjcccboYuOh8vbfF3uAzFh+I9Vq+Cjb7qoxTn/QngYQur04PRZNanogi7hDzrTjnMVvX7rJ+E6g3zRNDWCZgolaiTul5XUgryEsO2DSvP4ZmKsQ33SZX6735dFihsMpjePyBSHzwrBnrASVdijakcVcmjdwteZYlSe3xLNqLRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261021123027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(10067099003)(56012099006)(261026121527099003)(6133799003)(22082099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WtLNB3mhBFA7PCuS5C7fdvOX+DXrei6fJNXDrOWTDi+EIbFiBN8xrrhE/ya8?=
 =?us-ascii?Q?P+qc2YYxeODPwkK5jIeXU5PLMb3iAsygeyf44B8RSXu29ChyTPEuqEfQCK8N?=
 =?us-ascii?Q?1fCIxmrANJ3nOovZSIRKNke6DYwMeitgqj+A32dafkU/wqf4oI9yo6bdksHa?=
 =?us-ascii?Q?bN9is73639CYe2iTjO9Hb85oUk3L9zO7XWYOVrJRtpIUt4wUKYlJSQpa54C8?=
 =?us-ascii?Q?wPHc09oVDOL0+GVetw+AWq3oQMDEhc9K27XBL9R2UhA7DZJ6/XWcnQ1mft57?=
 =?us-ascii?Q?fd7mzIOTRf1uWhbHvqds3QK2OcGC80aYtyxMpZEcdB23wMC6vKQVsK1YVDxB?=
 =?us-ascii?Q?qcB4TYkLh7zVz8Q5VLNxnXPW1tzhI0Mt12AseqQynbv0iq3SFMoHmpV/wxn6?=
 =?us-ascii?Q?c2lNqlBlJAjg5eGaBa1yEnnbgf70OjXQ6BgG7+eZc2gVhjMVAh7hmgSk6idw?=
 =?us-ascii?Q?S/YO8du1pNXtIWc4mPUfTOo1qC0Lq+vTLJFIspv+001hQ0D+UhTs7goxVm2k?=
 =?us-ascii?Q?1m4qv2LEwINMtxaEs3WbGucVWS+nh4fQXCe7RSirlQONDIHNhEYUrYys7HVr?=
 =?us-ascii?Q?gR5V5utgRhHrtPqBYWLxGi+tpNAJ4ChgYczGWmkRyRx4yOChwo32N4+ThZzb?=
 =?us-ascii?Q?5aqfw9cLHlxoGE1dQROgsnG8156lugDstVg94HsvDTIhQze1mQgHai3z16De?=
 =?us-ascii?Q?fhdUSGilmDT+p/NuVuacZ7vSIpd6E4PD/FnGal2inc4J/ox45XQSJC8kDd1J?=
 =?us-ascii?Q?fgj/V8x4EpULqZwsGaCe1tJNRnaWUBIn2L9eO7X0Z6B4NYStLPRb4rUFIey9?=
 =?us-ascii?Q?D2o9nPz/70d+wv7umllVZ2Qsg1jfFnKTSLarEwgiLLdND8I2Tr3iJ1Ia1N0A?=
 =?us-ascii?Q?6WQw6vGwMFEkwMnFozLLSq7l20xl+fUtTmcwTL1rBPydq92THEJLWXZNZKPX?=
 =?us-ascii?Q?yeUToMSeF3RE/qqOyFSiMCmYSPWGNo30n4M0Dtgo1/Zc80Xw1jWmPrml9zBd?=
 =?us-ascii?Q?X1mf5uRt877+JbhiER2JyXF2PV+UD1TF/4qETAnLA/IvoCHjdPjStyzhixYQ?=
 =?us-ascii?Q?zis6lDFtLqyEIqKHdvlq1PXuio8JgUpFwAzb/XHXAJkqtqS3W1b+ZW53VPVR?=
 =?us-ascii?Q?tfnHFJJZHrRj4jAYR+hkX+nCZG4jqy4TKS0to3T+jn7M1V/I9K3z2QmgBf5s?=
 =?us-ascii?Q?9Fme9Syz9t8owsALDwjhfpcIQikYb7lE1DF5CQqRfTp5B6n4pSPC2z+664rF?=
 =?us-ascii?Q?kjMzwaTX6JKxitGolLKv+AW+jp+OkvZ6kCVpWDAMK/eiF5spCyG6+0h+HQxv?=
 =?us-ascii?Q?/zszZSGClrJjf9Beg45t5tb5Ha4UqPQm8GPskJpzkPM0QQKr3XVAU4R3t1dq?=
 =?us-ascii?Q?1UMVVq7KS9rJmjePUPUkrnK8emx3dNBYPt0oPifMhcpEjaoAjgO9PDaOw7uK?=
 =?us-ascii?Q?MqdJAHQrocGmu0UUtkJAfgrwhFrG4Vi42Onby3i8vVrckA2hEXqgulZgmYTk?=
 =?us-ascii?Q?Yx/B11czB7fFnxsGHJ0WxjCD3WZoH9ORnha4UZnhpIioGgFmWW8HSrAuS4jj?=
 =?us-ascii?Q?irx0IlHBb2tVavPlMplekI0cmGLEK5pwYyfAhgupepO+x/+CIpji48IpTlrF?=
 =?us-ascii?Q?C4AA859y5nKZZ0lrygvbNscUndh8LzEU0Oi9q9NLDrRPd8AB+KRfHpL9aArl?=
 =?us-ascii?Q?rCA8CK9MYNVWHljUWLJ46Xu3X0s+csl6lOL9b899khYjOeNG89eoQCsoJ3WN?=
 =?us-ascii?Q?Lt+PlPCsfg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0775597e-174e-436a-b233-08df346e257c
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:19.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoYD72LaEYdbVlPfCaoexYFbEa7uCf69oVHjcUbzsQmpCKfSww4aCcMdPrBizE5flI48jz7TcyuQOkOwatQB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9914
X-purgate-ID: tlsNG-c201ff/1793135182-72EB12A1-EB541994/0/0
X-purgate-type: clean
X-purgate-size: 10189
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSCI does not guarantee that a GICv3 redistributor is powered down across
CPU_OFF -> CPU_ON.

DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
brings the core back with a defined initial CPU state (5.6, 6.4).
However, PSCI leaves interrupt migration and GIC re-initialization to the
supervisory software/firmware stack: the caller must migrate interrupts
away before CPU_OFF (5.5.2), and the execution context that is lost in a
powerdown state must be saved and restored by software (6.8). PSCI also
calls out GIC management explicitly in 6.8, including retargeting SPIs,
preventing PPIs/SGIs from targeting a powered down CPU, and reinitializing
the CPU interface after CPU_ON.

This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the PE
and CPU interface to share a power domain, but explicitly allows the
associated redistributor, distributor, and ITS to remain powered while the
PE and CPU interface are off. All other GIC power-management behavior is
IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
Controller (GIC)", says the GICv3 redistributor may live either in the AP
core power domain or in a relatively always-on parent domain. So after
CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
redistributor with GICR_CTLR.EnableLPIs still set.

Handle that case in the LPI setup path instead of assuming a fully reset
redistributor.

The LPI path needs special care because the GIC spec makes redistributor
LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
GICR_CTLR.EnableLPIs == 1 is UNPREDICTABLE. After clearing EnableLPIs,
software must wait for GICR_CTLR.RWP == 0 before touching the pending
table. The architecture also permits implementations where, once
EnableLPIs has been set, clearing it again is not guaranteed to work.
Where an ITS is present, the spec strongly recommends moving LPIs to
another redistributor before clearing EnableLPIs.

Because of that, treat a retained EnableLPIs state as valid when the
redistributor still points at Xen's expected PROPBASER/PENDBASER tables.
Only try to clear EnableLPIs when the retained configuration does not
match Xen's state, and wait for RWP before reprogramming the tables.

This is also consistent with platform firmware reality: PSCI and the GIC
architecture allow platform-specific redistributor power handling, and not
all platform firmware implementations force a full redistributor power-off
through implementation-defined controls during CPU_OFF. Xen therefore needs
to tolerate retained redistributor state on secondary CPU bring-up.

Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
reuses it on secondary CPU bring-up after init.

Tested using Xen's non-boot CPU disable/enable path on Arm
FVP_Base_RevC-2xAEMvA, both with and without:
-C gic_distributor.allow-LPIEN-clear=1
-C gic_distributor.GICR-clear-enable-supported=1
and on Orange Pi 5.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v13:
- Document the pending-table lifetime requirement for CPU hotplug.

Changes in v10:
- Drop unrelated gicv3_populate_rdist() printk() format cleanups to keep
  the patch focused on retained redistributor LPI state.

Changes in v9:
- move gicv3_do_wait_for_rwp prototype from its related header to gic.h
- drop __init from gicv3_populate_rdist(), which is reused on secondary
  CPU bring-up after boot
- changed print format for smp_processor_id in gicv3_populate_rdist func
- cosmetic changes
---
 xen/arch/arm/gic-v3-lpi.c      | 84 +++++++++++++++++++++++++++++++++-
 xen/arch/arm/gic-v3.c          | 15 ++++--
 xen/arch/arm/include/asm/gic.h |  4 ++
 3 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 1cf49430ea..1a893d3ab2 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -76,6 +76,13 @@ static struct {
 struct lpi_redist_data {
     paddr_t             redist_addr;
     unsigned int        redist_id;
+    /*
+     * System suspend keeps the per-CPU area and this table.
+     * TODO: CPU hotplug must handle the table's lifetime when freeing the
+     * per-CPU area. A redistributor may still use it with EnableLPIs set,
+     * so the table must remain allocated and its pointer must be retained
+     * until the redistributor no longer uses it.
+     */
     void                *pending_table;
 };
 
@@ -99,6 +106,13 @@ static uint32_t __ro_after_init host_lpi_flags;
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
 
+#define GICR_PROPBASER_XEN_MASK  GENMASK_ULL(51, 12)
+/*
+ * For retained redistributor state, match the pending table by address only.
+ * Attribute bits such as PTZ may not read back with the programmed value.
+ */
+#define GICR_PENDBASER_XEN_MASK  GENMASK_ULL(51, 16)
+
 void __init gicv3_lpi_update_host_flags(uint32_t flags)
 {
     host_lpi_flags |= flags;
@@ -337,6 +351,60 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
     return 0;
 }
 
+static uint64_t gicv3_lpi_expected_proptable(void)
+{
+    return virt_to_maddr(lpi_data.lpi_property);
+}
+
+static uint64_t gicv3_lpi_expected_pendtable(void)
+{
+    return virt_to_maddr(this_cpu(lpi_redist).pending_table);
+}
+
+static bool gicv3_lpi_tables_match(void __iomem *rdist_base)
+{
+    uint64_t propbase, pendbase;
+
+    if ( !lpi_data.lpi_property || !this_cpu(lpi_redist).pending_table )
+        return false;
+
+    propbase = readq_relaxed(rdist_base + GICR_PROPBASER);
+    pendbase = readq_relaxed(rdist_base + GICR_PENDBASER);
+
+    return ((propbase & GICR_PROPBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_proptable() & GICR_PROPBASER_XEN_MASK)) &&
+           ((pendbase & GICR_PENDBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_pendtable() & GICR_PENDBASER_XEN_MASK));
+}
+
+static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
+{
+    uint32_t reg = readl_relaxed(rdist_base + GICR_CTLR);
+    int ret;
+
+    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
+        return 0;
+
+    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTLR);
+
+    /*
+     * The spec only guarantees programmability when we have observed the bit
+     * cleared. Where clearing is supported, RWP must reach 0 before touching
+     * PROPBASER/PENDBASER again.
+     */
+    wmb();
+
+    ret = gicv3_do_wait_for_rwp(rdist_base, GICR_CTLR_RWP);
+    if ( ret )
+        return ret;
+
+    reg = readl_relaxed(rdist_base + GICR_CTLR);
+    if ( reg & GICR_CTLR_ENABLE_LPIS )
+        return -EBUSY;
+
+    return 0;
+}
+
 /*
  * Tell a redistributor about the (shared) property table, allocating one
  * if not already done.
@@ -419,7 +487,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
     /* Make sure LPIs are disabled before setting up the tables. */
     reg = readl_relaxed(rdist_base + GICR_CTLR);
     if ( reg & GICR_CTLR_ENABLE_LPIS )
-        return -EBUSY;
+    {
+        if ( gicv3_lpi_tables_match(rdist_base) )
+            return -EBUSY;
+
+        ret = gicv3_lpi_disable_lpis(rdist_base);
+        if ( ret == -EBUSY )
+        {
+            printk(XENLOG_ERR
+                   "GICv3: CPU%u: LPIs still enabled with unexpected redistributor tables\n",
+                   smp_processor_id());
+            return -EINVAL;
+        }
+        if ( ret )
+            return ret;
+    }
 
     ret = gicv3_lpi_set_pendtable(rdist_base);
     if ( ret )
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cca49d2a2a..7e4b485f11 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -293,7 +293,7 @@ static void gicv3_enable_sre(void)
 }
 
 /* Wait for completion of a distributor/redistributor change */
-static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
+int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
 {
     uint32_t val;
     bool timeout = false;
@@ -317,17 +317,22 @@ static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
     } while ( 1 );
 
     if ( timeout )
+    {
         dprintk(XENLOG_ERR, "RWP timeout\n");
+        return -ETIMEDOUT;
+    }
+
+    return 0;
 }
 
 static void gicv3_dist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
+    (void)gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
 }
 
 static void gicv3_redist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
+    (void)gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
 }
 
 static void gicv3_wait_for_rwp(int irq)
@@ -883,7 +888,7 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
 
-static int __init gicv3_populate_rdist(void)
+static int gicv3_populate_rdist(void)
 {
     int i;
     uint32_t aff;
@@ -951,7 +956,7 @@ static int __init gicv3_populate_rdist(void)
                     gicv3_set_redist_address(rdist_addr, procnum);
 
                     ret = gicv3_lpi_init_rdist(ptr);
-                    if ( ret && ret != -ENODEV )
+                    if ( ret && ret != -ENODEV && ret != -EBUSY )
                     {
                         printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n",
                                smp_processor_id(), ret);
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index d01249069f..c1727ad12e 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -307,6 +307,10 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_GICV3
+int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit);
+#endif
+
 #ifdef CONFIG_SYSTEM_SUSPEND
 /* Suspend/resume */
 extern int gic_suspend(void);
-- 
2.53.0


