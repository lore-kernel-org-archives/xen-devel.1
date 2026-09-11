Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D259CC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:13:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416067.1645232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xJt-0007vU-MQ; Fri, 11 Sep 2026 09:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416067.1645232; Fri, 11 Sep 2026 09:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xJt-0007vK-J7; Fri, 11 Sep 2026 09:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1416067;
 Fri, 11 Sep 2026 09:13:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4xJs-0007ur-RW
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:13:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xJs-003Czl-7x
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:13:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c625-e002-0a2a0a5209dd-0a2a4504d4e8-26
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:16 +0200
Received: from [40.93.195.5]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c62a-b57f-0a2a45040019-285dc305190c-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:16 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA0PR03MB5548.namprd03.prod.outlook.com (2603:10b6:806:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 09:13:10 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:13:10 +0000
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
 b=txQCcSt2vcU3K4xCxS9Zzk+MGmCClGtsurhiICpTtSKXZRcSb0rkAXqzBQtlsI6VNwT1uBKT3igFGd54pj63la65UH34KeRufe2jeOWY6Xb4fP6jr1CMLuO2qdwdfzGsQQcCakryiBXiJlC9hi6lQNsAQhNz4q+ePheSpT7Qag3j6MFuTsO59qGUJnwAK1DosKtkmr6VkGrLxr+BB/dxtHVSG/dqRzITLLPisMp8E+n5YmOCOC8DBU3pOiI9cAXFij3qvxATqClZiTdYpygYALO4W2YKJYS3Cfp2nWFjNkGDk37o6LE4v5cWPo40USsx5IOHyZhwagqC8JkMCWRVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Rjk4k8h1rfgiImUL7T5cXwA3eXNjbzwo7Aqi8JVKb0=;
 b=AL7UoW23+wOmBuBmMSnP3tIowxdRjpBCTAD034uX0Cd9qBr6WurogVEj+PkmmwK92AVsjcmEH7WnvogsO9na1DALL5AZs3uHi9uATDrj83yvtJpRc+DvNwO+nY2dpWWTLG2eNWnwzZrnIejRzP4/sueqZv/1UYOF7eYsa0E/Wcxe9K5BB2uUpv2xnbDZ0WWN8F55UXlcrVhts2KjAU2njZvMJMMgG4R0VvDvuEwyJkwJ47pURJ8TrCN92uBfrgJ8pUCwl4NaDbU+LJHWEb6CqsaBFf8kluGQfsWrTBW3l2/CeeQO806zJcuPc+iLlzlCPtB4W9l1JGtTSpDEALwKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rjk4k8h1rfgiImUL7T5cXwA3eXNjbzwo7Aqi8JVKb0=;
 b=RBa+Q/+IM6nW/l6ZN4NT65ojAFtgcGT/U2ozy2j+0kbqYSEVYPz1x9Wh9fvQYBJ3umYsNlu0kpAIKOhI+ibSBbJG0einx+Bm8W2AEioaWfWekmyzfudStfmUk9eWxPTfvuDJ8UYwsXR1wZ44lDkpk1H/gKkvtDRAK9+FdaQq+AA=
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
Subject: [PATCH v3 1/3] x86/viridian: Workaround Hyper-V GP fault writing to MSR
Date: Fri, 11 Sep 2026 10:12:42 +0100
Message-ID: <20260911091244.1165516-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0286.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA0PR03MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b45d66c-8366-4fbf-fb2f-08df0fe4e68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pAw2KakVZTGTv091XGb9SEdAbInv6CY6mD1UoNXU+FUQ/7C5ywURDwORZmoj5b0ljzrI607AcIipm3FC19F+Q7V3891BZFKZEL4IHFOAecHZFecSgDYituQFYLdEnFYOHOXsD2U1p+jb35aOs+8PMnDFPOZbnddg88wUP90CgfztyigB09mmdkmlY4azcpbFkvezDk64ux0cF4+6wPejA658LOFgdlCYKyD/8EDt9MzAxeALY3oan6BpIrU1ReyU6c/syIg1gg10WGJ/UKKwcreQRgC+OEbnIyjg/drDVgxDVkz+APTyfC/ZEt4wXujfIK/PJyXOEH8q/riVMU5WbBZ8/IU+99ig+4zijfVcIT6ZfvXuCr7mRWY2bZlBCYbjWowO9kwS0+68+npwFJucbyh0/gyv4BTxKl/cf6TWSEGqjzi+jTxGi4vqErxIBD+60kaue2RNiI8dxP209DcQznK/YM0vpN7DgMT1QoWSodyN8WzhqPWFaHq/V7jhR6kD1tL6L1D5EZj1vG7EkgdNoxAyb43mwKuQ9CegI1HBzuXeSIOILD2kdwHFgy+g36URtiy5gCs+x9IyBu2FLxjbL/NmZw9E5sCks6cGssLcPK1eztw6iwDATx+ZSRKYJu5eejcPmVV9DoDs8BlQY0ip5xdOu3T8oGg/HfvLepPfs2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vZIyZM1RCIOtP7DV33e78OuNH9NV07RbLTrwyxj1gdFz2vugrejTz7yQfHwl?=
 =?us-ascii?Q?5KqPruR1VNG3s15b1OPT68m6sEkZ5aO3Lwh0VmF5qx5shb/bQue+i/2wWyMQ?=
 =?us-ascii?Q?jrSvSlDfrCPonnSWWxTv75BnnPpSlpyvOfErAquRTJSXQQ4LVdZwRuw8MsMR?=
 =?us-ascii?Q?NVPhdJJGxTDYGFNsgy9O0H5JoUuMrPK3aKDjLrsEDHn5y7cMuNgfqJxPq2Zm?=
 =?us-ascii?Q?igljRKSEay4zj4PClo27a+Apd/iks1e5MaIbdMt6XD/rkKo/o3ubaW5m1mar?=
 =?us-ascii?Q?VHk8nyXIfoMlqzLZxo7y0TSeWQ147ifMWDRwVkQfZ41j3eG64PIIQJSHIELM?=
 =?us-ascii?Q?3ziOOnKVL7muGjbABivTie/t5bcmqXiFzLPuoZW+0Y53fTaSWWv85J8el1X/?=
 =?us-ascii?Q?WDILAzfMRJ7BRHJ4u4x+oYSt9K3ejgAyk32BhFQ+5VS2lCZs6F0LqMFy8vx5?=
 =?us-ascii?Q?653a+VjuxUn7uRyeOkBUA3/cPzAsKaHsGjADHoz3te4rrgi1g/1jJ5ui+dvp?=
 =?us-ascii?Q?LaD1Su26WSBi2/v1XwuhYyZE1IirxgEcicT07ZrMihxaBgYdaHHcHgq58/7D?=
 =?us-ascii?Q?Icx30VN8tXEAGuNYFXBa7wLKn2uwKKFfm4D+gBu1LZ29HdoyU1cXDhWplZil?=
 =?us-ascii?Q?CHkRMcOrW8M1cgckdCUNH0tAGE3vIldIF5YAzBRlkMTb4m+ffHuN93Dd6Kzy?=
 =?us-ascii?Q?AIBZHtEeRRo+l/c6PmnYh37qEQ8Qa+WW42sMGEawwJ9Y4gcjuXA2bch7oRoh?=
 =?us-ascii?Q?HZVPLZ/ZG6mECGxg+QnNQHEcgmeqrBh0jbU1EX7La9ErKwO+QrZ49s5584W8?=
 =?us-ascii?Q?DHpKPssOqv06KEc1l4PErwZy9+mo9X3DpKeXxzQKppQ739t6+0bEX8O0MoLv?=
 =?us-ascii?Q?wY7bNWyjPfZ6e7J0eeXA1SF40v1+p+cflTIgEUMfndrcrRSlr/sugLlUt7Pb?=
 =?us-ascii?Q?D9R/gD6kF5sUQ/ASmU4CmmhQcYWxv/jctVRa68d1aER+mhYwiHbAYRWwJ/kb?=
 =?us-ascii?Q?v7qdcB9ljJzLvdSdMPmzZmbjHThoDcl+mQLY9iGn+oPn8zMwa6uOmkDZpqpS?=
 =?us-ascii?Q?yUAxYPQlv3eFShM3uJP1hevAKmlCqLkovz9sJ0bLx+sGHyl9ODy924OHlWqg?=
 =?us-ascii?Q?hF0qJw79DO7qbzv8XmDCXSssJGeQ64uiYRbi2PFInTRmv+bYclCyDOklEYea?=
 =?us-ascii?Q?+fT+dMaLxeQEQ1ft6L/OUEyKDUi7wC85RoYDekGuV3GVzj/B7iwFQ6v3YEEy?=
 =?us-ascii?Q?sF6o7iMI/nnChWPvAx7rtpCZuHrLG5Y/WDAzA4ktu12DaSo4GJwxHo9mzxD5?=
 =?us-ascii?Q?CvGDjOgMQvu4++jvoPY9hd9f/GtcKbI+z4GZuQILLnNz+Lt2ctcsp9ld9AL8?=
 =?us-ascii?Q?BH4MClxs8Ic4rVNYCn0NZ0Eb7y7mDnZsOi3iPy36yqdDVLkM7Kb2RPXM/H6/?=
 =?us-ascii?Q?zqmT/KXX6juh3xNuBdJwOviOulZ34h8dWN2IHpfnoQcdOFpn4SVgF1XnsaDh?=
 =?us-ascii?Q?9zc0/1kWvll5qYGObOhmWbR1FCFYC4O/i1ApCgKBgkZq8OxfjxRch1N/ZF+J?=
 =?us-ascii?Q?yfo2SAwpuhqceCyHWvYyQQb7tO3ZvsZRKHog8pj85tT7kpU1I7xDyPJDi890?=
 =?us-ascii?Q?2LCeP1c4v6QB4mS8eybhX88v7P1+i8HbrY16b4t85LFhv+8dvY8x8int4NgV?=
 =?us-ascii?Q?ZDqtDrTpO/XZkeK1LeDTGFqBwwbeTCUMzCuMrdDdZO9xctdTkHTipdXbuTB8?=
 =?us-ascii?Q?AZlF8uR0/ycI6CrV16XGkLwGln4T4vc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b45d66c-8366-4fbf-fb2f-08df0fe4e68a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:13:10.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4d/J10pSzopCLeKP/GvBHxeHjTmSLd9wHVJo3huPO+shJX2LopUsDD6GEg5wHOVoMSe7P75bJITft0buvlxAXJ8r5WDgW7mlXmIeAMDVINg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5548
X-purgate-ID: tlsNG-ebf023/1789117996-526CAB50-D50BB38F/0/0
X-purgate-type: clean
X-purgate-size: 1584

The Viridian spec requires the vector to be >= 0x10 when writing to the
SINTx MSR, otherwise it should #GP fault.
The spec-defined initial value is 0x10000, i.e. the vector is 0. On
startup, for some reason Windows 11 Hyper-V tries to set the MSR to
the spec-defined initial value and since the vector is 0, it GP faults.
Fix this by doing as Hyper-V does and only fault if the SINT is
unmasked.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

Copy Hyper-V behaviour - only check the vector if not masked.

 xen/arch/x86/hvm/viridian/synic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index e6cba7548f1b..3125ccca0dcd 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -157,9 +157,14 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         if ( !(viridian_feature_mask(d) & HVMPV_synic) )
             return X86EMUL_EXCEPTION;
 
-        /* Vectors must be in the range 0x10-0xff inclusive */
+        /*
+         * Vectors must be in the range 0x10-0xff inclusive unless the vector
+         * is masked since Windows 11 Hyper-V (26H1) has been seen to write
+         * this MSR to its default value, despite not being a spec compliant
+         * value.
+         */
         new.as_uint64 = val;
-        if ( new.vector < 0x10 )
+        if ( new.vector < 0x10 && !new.masked )
             return X86EMUL_EXCEPTION;
 
         /*
-- 
2.53.0


