Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39CDCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:14:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444963.1661444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU5e-0000k5-9j; Sat, 10 Oct 2026 10:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444963.1661444; Sat, 10 Oct 2026 10:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU5e-0000ju-5g; Sat, 10 Oct 2026 10:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1444963;
 Sat, 10 Oct 2026 10:14:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU5d-0000jK-6L
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:14:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU5c-009FpX-4X
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:14:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0fec-8faa-0a2a0a5109dd-0a2a450ab500-0
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:04 +0200
Received: from [52.101.56.60]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0fea-f2d2-0a2a450a0019-3465383c1759-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:03 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:14:01 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:14:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae+fUicMJoFK+jbaez19ylFeT6C/9bHWfrTbLtcdZs3PQaOEWu6F9hG9CPfU3D56yRGn7l0UK+zHz5eWdQH1fI9j2yme5SrNmzoMaele5SMSiM6HLbdMVunTgNA0vfKZtp0WRyvE/a2QqAy7Aq6TlN/L/2bAjIdP1P0y5L5vOGp1QdswGh6/CYISmmgM0BSWvc/QVKeux6OgmrRJoqiGlWn094N9q2OV5iwPzU7H4pJgm8hztd29uk8A4gcmU5iysXJNvza2NcpNmu/x4Nr4RmCVELiISkmzJn0pTnvOyL4sVYAV2aKUYKdPeLw+LAUdfqYENcz3wVvKtKAlcQE59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p45N7ux0N530bLgT9Agjd5ubAblfxj5lZPu2zbDLpDQ=;
 b=JCkepnfeEoRVZz+uaIUMgI3IC+L/iBoDAsz9GuctmqnV1KCKLt9zVWpEoID15dHQ5bdEH561s3o441Ovj/8k4QnmB3/Q4HGy+/3Nh821uR3bhTn1mDJl9Dc/3Vsrz18Iof6/zDaMk0gYwtG8c09VHoRbiOLkMxAfjYiK9BLfyE2a24Jp/CGt60GOKPk7weJSek4IoccTmolYExldTTfCvK5n7H3jtB2UiHEz6hbgx4NmZnzL9BoFk/FJMS4sTGOtZ+UNSZBVbMUT1P8q6iZfQbSHZhKiS59wP/LMwaRRHahFlxddWYwkKT6RKgaXXrTFTfMVCaw7hNcbHgZrozbc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p45N7ux0N530bLgT9Agjd5ubAblfxj5lZPu2zbDLpDQ=;
 b=CM+rbOyceVHA6KcNyvVdptwJswSSn2ItDH/+2wkudq4ZPQ6Knxqbbh3wSDglgD7hiJgvD+NiFVUyv6YHQgMKVFPZcTfBirE6jK75DrL6TruX3+wSv5S08XdBWJAodMOq3kj+IaYmTiuZNHAOXvzVf4VUmcZeXB8+pncWDQ5vjA4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	stephen.cheng@citrix.com,
	lin.liu01@citrix.com
Subject: [PATCH v2 01/13] nestedsvm: Fix CR3 MBZ check
Date: Sat, 10 Oct 2026 18:13:14 +0800
Message-Id: <56d1229d7efc8da215272a7f03dade9e293652b7.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0063.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::11) To MN2PR03MB5328.namprd03.prod.outlook.com
 (2603:10b6:208:1e2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 720fd19b-aa29-4cc7-9991-08df26b73453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rkfniI30vTV5KqjHdogXoCLQvWVWDZAcY41mk4lz3OQ9KjPDys3P6Oh9wnYDGGcFm0UBMbiM4QD/0qDxaIb5giZyZJkxh0TzYaasF/JNMynprou7nqbNwA+0UWm8SqHzPSaRXHjuzUSJnF/b3YGDZCifjZfEQ08s1H5yk6Gd6ZIZM63+u8WS1EPhD70HdtEXJGzBSyvlXarZa3vNMtrIpRVuB+GQJnQ4gPahqVbUK6FEkdmbmj4iqroN2J1m3Tt6ITpZUI2of7deNfPj+UP1vJMN5x40aoTACuSBIJcYayUI1TrcqdULsJd0cm/PHwaXbPr+Bm1o28nQJUhvnBG+39xkySNprZDcpJSOGP1unySiZhPwi6PCbxJUesa42v5zwDMbN3yGFYd1uD3RN21CpnnqUpeKi4RexW9hCNdE+zJFMaKL6Xv59NvkCgFlxHQImKl2odam69tWtzG/uOaxlODDw+uFJ38UkuUJ77f0S3UUFL1XeFvttKA/f0pw/2mbM5D97q2pdw7wVy8QgWQbxxp7mC33GDA64MfkXyPyIbCKR33vk7I3ND8dIJoTcsJ+t6U9iO8BNXCYbkepDs7Q5hvyj3LGMmOB8/Fuhgnv/CvMMKLD94cxG8EGGyNw6UcaRTxa+4bzNATfDmzJ3c+cvzasmBQ9RHpeaaaaQw1zTDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L6BNKkgonILu8blSeujFgub2XA7yifTAnxaQZDyQyI4g7Efc5L+25GeLUg3E?=
 =?us-ascii?Q?l+viwXsevLHKgwCLx3/S3O9NofhBz/K+nhlII8hkCspTjHpmwwNh3MVcS6tt?=
 =?us-ascii?Q?HOHOpqxzNSnVtfr3naLssb+y9gEA5mVYrf7gK5qK3q7we8M809/dnhFAdpnN?=
 =?us-ascii?Q?/HU3EhxMddSG2bJO/B5tSVC03KgUzdphcepFMi36dy5BMwkU9OSwVJvHaSjm?=
 =?us-ascii?Q?iM5mhcLfFGiOgu07k5NVPgcGcXo7QXG46pvSuGefsi83fCXXb6r/amBCtCfO?=
 =?us-ascii?Q?61xxzdX2rYK9kSC+JyZuHtVM7LVM1wVcTbXwc1k01Jz46EdgqlE3oYbRb9sg?=
 =?us-ascii?Q?sh+cxfiBKkLn2bDYHHcSFtz5LgZ2yI7nJWDPxVZOPURMnZFtIGxVD3SfKYFV?=
 =?us-ascii?Q?ntgXclSpFLGTmDnyyQii8UHtSW35TfCpSRB8nOH69cKxfAzGyK/6uqz6Zby/?=
 =?us-ascii?Q?iYbaloqqqXBZ4d6neCgYdcF4HtaC3Gfm1mVK7GEBuxwRoAzVex16P05lGM63?=
 =?us-ascii?Q?bZtzX8qptCRcoqligxU4r0nkzIrCbjQd8VZ4/M7w37XysRrwlbo2UNTmcOuY?=
 =?us-ascii?Q?shjeirfJrAQRMXiSRl3gdEf4VoYheScoiudvfO/I1rcFMEswUzNQdSDb70ac?=
 =?us-ascii?Q?lsuC4Lb4nMczQKZob4cnSMTWTf99PjHUnDYl64QuKEAAGog4NyrqoPyVep7g?=
 =?us-ascii?Q?bX2X3dmvT0Tx8AlPywTOISJ72C0AGCMK8GokBx/CjDEkK7Np5TbgoLqe91PJ?=
 =?us-ascii?Q?ouwWW4Jrt0vf+hkeESnGjsTLTScw0TJ4ioseKNjG5Fo/CCp9FWl24yJXPuH1?=
 =?us-ascii?Q?A+xBSK2tKOAO3dJfv8QdEjumepoqSGdiolElhFCydjco2aMMvsFhC8F9vLjR?=
 =?us-ascii?Q?lT18lN8/Gc7jDrkG0cg3Qz034Q3xiPRfBJpiuF7qhhzChXoQInpr0rktFXbz?=
 =?us-ascii?Q?QMUcaNc2lUrSY2ElrzK8SHMfINf1kkhMJXwuK+eGa2JWVWgb1/RNAWclo8/u?=
 =?us-ascii?Q?P5zFgev9gxsMInrhJYo3kVefDV0EoJJ7EdySZDP2OPuzIaH3A+iT2oKFDLyY?=
 =?us-ascii?Q?Kwrntiw1+BFJSJ6VhoD+nAbHx4KeNci6XUXmxP9DbOtE+hZDm8bLTWp9xcfq?=
 =?us-ascii?Q?tLkQK9t3ocbYpseM3etzt2FeACeN22h6KIYNwQsB6tIZcJElJCDpYAA7IBNS?=
 =?us-ascii?Q?XlsYvzGrob210MBvgRxl50siF+iHaufMWeAsyqDCYqGEo/DMLs2Vu5GzV/xY?=
 =?us-ascii?Q?Xi091qCa1sno44u4WxECobquDISEz+Wn6Vv0+QSDnsifONFTgkEhCx/MEguV?=
 =?us-ascii?Q?VjrfqsuTBwq/wRcf4MYCWbI2eyg/q8UpfmhYV/RyuY7Ge9ad+X8nVBc6SgBD?=
 =?us-ascii?Q?6nwa2qiuWm/HwHlAWMaQeUp44XTG7G51DbVFEV3toO/vByn06nhCg2ZCWWMU?=
 =?us-ascii?Q?Z67Ls4Yv3wMiu4sl2mM4599dmqcZcfTnV5VN7WDjDyDF1toO47LFr+Ek9CxU?=
 =?us-ascii?Q?Ai8P9CEfnoe+1V5aiYuJKrGxZ0zRNvOBlyGm8GeU/q0USR9QmsngrlqUX1kR?=
 =?us-ascii?Q?JJDXuj8cbyO7Zzz8lFX09H5O3IcWMHHkifZ/8kErApEGMZoAtD100UaAh2Af?=
 =?us-ascii?Q?GGkIRlad2ijF7L9j8gbNp608neckhffYV1RftKw84q/n1suhbUmhgVJIlKIZ?=
 =?us-ascii?Q?OgxEPWPA9QzlsahenTsF1RKelXIpSEjzb9u0/17u3SpXL4BOei2AMIaCKgNo?=
 =?us-ascii?Q?Jk86PjjYpg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720fd19b-aa29-4cc7-9991-08df26b73453
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5328.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:14:01.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yz8nxC92dQjo9kjqkK/CWLVyJOVfWiSHc61yamT5t4/3ClH/M5UtRAiRZehpeBuM360DxZbsizsZnmwYmeOrKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-4011c0/1791627243-51EC2CFC-096229A5/0/0
X-purgate-type: clean
X-purgate-size: 1315

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The existing code checks for any reserved bit set while the APM only
considers it invalid if an MBZ bit is set. Relax the check to match the
APM and hardware.

Some of the reserved bits were observed to be set running Rocky Linux
10.1 on Xen on Xen.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/vmcb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index a6f09672a7c5..39b9e6bf2068 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -354,10 +354,8 @@ bool svm_vmcb_isvalid(
         PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
 
     if ( (cr0 & X86_CR0_PG) &&
-         ((cr3 & 7) ||
-          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
-          ((efer & EFER_LMA) &&
-           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
+         ((efer & EFER_LMA) &&
+           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
         PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
 
     valid = hvm_cr4_guest_valid_bits(v->domain);
-- 
2.34.1


