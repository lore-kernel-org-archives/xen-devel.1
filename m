Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8824FC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 13:12:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402026.1637447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwNK-0000tC-NJ; Fri, 28 Aug 2026 13:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402026.1637447; Fri, 28 Aug 2026 13:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwNK-0000t0-KS; Fri, 28 Aug 2026 13:12:06 +0000
Received: by outflank-mailman (input) for mailman id 1402026;
 Fri, 28 Aug 2026 13:12:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wzwNJ-0000sU-GX
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 13:12:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzwNI-007SEb-TQ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:12:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a918920-e002-0a2a0a5209dd-0a2a450b9d9e-2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:12:04 +0200
Received: from [40.107.209.53]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a91891c-b7e8-0a2a450b0019-286bd1353d50-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:11:58 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7586.namprd03.prod.outlook.com (2603:10b6:408:286::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:11:54 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:11:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQnD3oB06ogLrb+GpEDJD4cQ1eb3Mzy5JsqTnlqVe0i5J6rUUtAP5sjR/Hl43ZLaLi8CYNQdUG7tp5smLl/AZETUJ5IZRnW/y8jtSKAAheRWSvE46pn5Dc7Y9U6IdJ0dAfSkKYzxU4/Qc/UBZNyC79HEpvzzGXW25EbuLaBPTNnvdlOs9tzOSuLIJopYhYWRItXphRzkk++/UGfsAuwhIy2Nd0M5rzYbnF9XV1eoLWaMTbCvWOUKVTR14sLJk6IWFOgIW++qpmj1vZs4IQBjCct4m2NugSEFJi18ij5FXUOHqSTn1vWnalRl124dpWMw0M8ovbct+y2+vkYzZfFV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxvuCWrZRUBjgBVuR44jM6nAu6HqPQeFkqd4ySn6LHQ=;
 b=sY/w7tip3XAoeWZ1Ugyi5yEcT9qK2sgA/qC5yodvsmEDG5zJfK/4Usu5lpaUjh8Q1D26Y5ecVyNRi5OXGN/q7QVvdE3WwclvUaqsAD0OwbxkraoanN1bbArT5mYlLOKga89v558NeuMtHzHM1yfL/Hi1TQik944r2SmxtPl9vGrobAh9g9/FjvuAJi0gebbmDhU2NHTL/F5A3ASnvB9HUwnAuiiWNx9VqJAv9043HYyL+li0ZQovr4rvMSQ0t/DtLsPQySQvzW6nzkjbXlVffmmySaEKFnE+DUg577jB4T9CNc26W1EWld+wNAvyZCNJ/r9lNAVB8KzjOCV2wSZIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxvuCWrZRUBjgBVuR44jM6nAu6HqPQeFkqd4ySn6LHQ=;
 b=A2LXLUpRSINgoNyhKE4015E3xbONxVgEEWkIvtx2b8pGE/47craWB8AOq2BfzN4P1kg7/WkexJCuUXdiRqvkW+QMimjkT37IhYocDghpeyKrMkfxAEitMl1PMXWapx5lOxSJELvxTjZKGkZpW4OX/5r0onzOG8b8uj76Fjzu8/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 1/2] x86/viridian: Workaround Hyper-V GP fault writing to MSR
Date: Fri, 28 Aug 2026 14:11:41 +0100
Message-ID: <20260828131142.3986110-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: f1643572-247b-40d7-69cb-08df0505ee73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	kVzqBETv0H2daggXAn+Er8MZEO2GDO0k73/Hoed2S03th09dpoFJmD1HR6x7Cx7RDUnaqFqsFSeNlG1By7gs+xnC/OkC1yAxsLQHZu0azbPWvDePzgneQ5FV9+a33VgfMx+XKpyaPdJBQvTEpEm+wafJi1SU6xkzZqRNAUowbuK+Ls34RL8VGhJ1digZ36EfAgyYiLqBKgyckqdZ4UJTr5P5jq7IXJ8qXTGtkKQUHk4EmiGvBcYS+TGtk11dZca77uGJn2+WEZO0oC0R6Ify65fYvQOFAVmHD2QKHSi36Abn0b2QSHP3ewNzfWgsBpAjLn6PHYkA0udFhn9aSzvdzV3ypnaLnvhrt0cCXDsEgL7eA4yLl08qkxN+EjLm0r9m5ybQoY5T6qMN28IFzxzNVdsHBmRypi8ydVdCOFpi3RzByBEYbG1RAX/Xkz+jlXfN/hXZgmTbsuXdx/xcJivGIzNfKCkb/meIxUF2VVws876tlj1fbbdDjFNgXNmGSnvYXV8v4N5N/lrZs4sILicsRMkYLBmGcrjtF2cFl39wRtFDO8oYYlmiGSeriWrVX3Ra3AmPdGIkTyvgiyF9+/35o3/Cd++iSun8gk0kd4OrXE4YgmXyr7KLeUMtIUW1fPAG5rfBBOgwvfFaSJmRGwyt+VVAtPzXGj/3xufu8xTaW7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WLdUOdljQheyJ7mucw1d7rnoOztpfBAbxIcT/qI9tWRVWmOUXYZfkbgKis5P?=
 =?us-ascii?Q?cIm1LJBX9pIv49CsADSjyX7ggZx6np5nk0oZHbyLXyZXwWirFKVRIJNUeDB9?=
 =?us-ascii?Q?ZEA/NNkntvVhMBfzPmG2LRFFtcCA0PPgZrnKtjSBM2r9kAqOnTlaIyxzCXMJ?=
 =?us-ascii?Q?eV8xqt4H2SEp297MalGDQ84fIVRJdeT7C7pu/Hlnp+AQEX4PSG3GQS9ID6AY?=
 =?us-ascii?Q?rvmoBNCihDZ4uTDhAAl3zuu6O7mR93MiBmiVI2A7Q2MpUoakOg1pofrHpzOc?=
 =?us-ascii?Q?GJ1FranRTNn40cF935Q8KDb/Pov6PsHs6MoGK1qWuwdig0A7Hg1pcJ7lhlu+?=
 =?us-ascii?Q?FfO3q2fBXsMoG5AT2yUOKUyNXGZGIAqcF6I545N61UteCAtBBAgkhe19RFBs?=
 =?us-ascii?Q?oX4eFgkrzLpB77i7b+mpPfzcS/pPBDwVe6mEiKr7nZvoyjcygW4QLRcHaiIQ?=
 =?us-ascii?Q?OvXGKjK1V8eUvTJFsjZgh329k8pr4YPPTh5lPICvMAPXBkW3NPi15OTIpB0K?=
 =?us-ascii?Q?LHKfk84m9QeDNFvOuSnVvF8JxKHKTJqlGtL/gPkTrWlhtw/PjVlEnBgNrRZ4?=
 =?us-ascii?Q?aP8aeAviJMc87+288tA7IsSUXL0eUcA84d5S8M8QTGJUzrfavGi3dRr/e3RC?=
 =?us-ascii?Q?SWtUiwOBafSTcMPqddYcAXxWS0Th7NTBgliXIykMETEqYWCdAZhGDrJdTckX?=
 =?us-ascii?Q?WSLu3ienusEJmj0+7JltKBpug7ws9VQucP0woKxzrnlF2SmJuns5fypnKuZT?=
 =?us-ascii?Q?eD0FQd09wZMDGRUZNzzv22J6HvKPsohJYicenaNgM3QydktVujbc1GH0j3n6?=
 =?us-ascii?Q?aD3OFcRDG39ImNki44cdOTu8BRy5kEAMkS/1SdmlbUhXBRm3G4lMxH4SX/0j?=
 =?us-ascii?Q?jdxsNHrCCWJ53o2Q7jSiszsrWC7vfQOO99Qrf/fMx6Jih10dXmdyiIPzdN4H?=
 =?us-ascii?Q?bzlq4J0BLWzScLrXJVzurmujIFSiTofptMexJl77JOLuWeytqyKTUHMb6Zao?=
 =?us-ascii?Q?F7bQHs8Bu/lAY8ddRZahgMFWdT5/LsbjLIvVUlIzZpuJ6lXeI8vtp3cF3kro?=
 =?us-ascii?Q?KznusSRw337ch3TgYLDGV8+wurSiQ/SMzX0t0d8MeI1oklduBiZbFl2r156O?=
 =?us-ascii?Q?RTiOA6ZiThClAa1J4AU0/zAHQ1ZAlqgA2Dvl3T4wFPW6cNvR2roCa6Qx7c8i?=
 =?us-ascii?Q?i6aTy9rCwfoUj4j3057H7A8LHY3JKDDJuEo8a2ZtvVqhjOg4e+hod6gnTGJZ?=
 =?us-ascii?Q?Y8bSmzYqkU9agXLrHMK7mRE+imisImlraarnU0htFfvU7Z2Jq5kwjrnp2YvU?=
 =?us-ascii?Q?QwN5iurhwcLmT67N824NVeNYpkBp9S/q0CrkuvTeUJCK7XZh1oEGut2ptNcs?=
 =?us-ascii?Q?IAub71yoxnknmf3w6AVh3icjTJT+4wRTEWiOYFgQe7NCRwK6gIFQvQdZRPeJ?=
 =?us-ascii?Q?yfZPGPysb+obRX5MWRhKm25uKNKPxdkD40fslWi7qHLRwNKrsejdJCwibPrn?=
 =?us-ascii?Q?yY0YXZLY/ux2n/4KA6HJNrf0UgceITqeRKefzyhYCyvKrTWopGlWTLFxWBFI?=
 =?us-ascii?Q?WQbmm97LyqmZgL2Lory8QfPXzRX8nZiOgfATlCFZs/UgS5/BeD5qM/1H6M7J?=
 =?us-ascii?Q?jXx1GR4hTF3L0hivKFkRc++J6kKrPDGtUh8ok7TrUkq+i6c+Y4Hfs6xjt4cQ?=
 =?us-ascii?Q?haH3C+TNx2b5kIoq+sjIfXdGLsT6lFOwUlPETuHW30jMvaSlGZEK5Pub+h7Z?=
 =?us-ascii?Q?D4kdCA259sd1zgMRIe1XyOa+vNHaagc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1643572-247b-40d7-69cb-08df0505ee73
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:11:54.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6x4EmKxGdQ2gL9gqxjvSoxMW3X0kLwZ0Ktp2zvgwIqtV4q+zMPyoazg6KSol1nspMrdMo/uFd01MsayJvkfbfF4j28DdDgJt/g9+boH5o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7586
X-purgate-ID: tlsNG-42698a/1787922720-AAEDE9EA-8BAF39D0/0/0
X-purgate-type: clean
X-purgate-size: 1167

The Viridian spec requires the vector to be >= 0x10 when writing to the
SINTx MSR, otherwise it should #GP fault.
The spec-defined initial value is 0x0000000000010000, i.e. the vector is
0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
the spec-defined initial value and since the vector is 0, it GP faults.
To workaround this, treat the write as a no-op if the value is
unchanged.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/viridian/synic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index e6cba7548f1b..37ddff201a6b 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -157,6 +157,9 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         if ( !(viridian_feature_mask(d) & HVMPV_synic) )
             return X86EMUL_EXCEPTION;
 
+        if ( val == vs->as_uint64 )
+            break;
+
         /* Vectors must be in the range 0x10-0xff inclusive */
         new.as_uint64 = val;
         if ( new.vector < 0x10 )
-- 
2.53.0


