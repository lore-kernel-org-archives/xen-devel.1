Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5370C79FBB
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:30:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415370.1644849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lPA-0001rH-DI; Thu, 10 Sep 2026 20:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415370.1644849; Thu, 10 Sep 2026 20:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lPA-0001r5-8e; Thu, 10 Sep 2026 20:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1415370;
 Thu, 10 Sep 2026 20:29:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lP8-0001ng-VA
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lP8-001ixY-Bo
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31318-e002-0a2a0a5209dd-0a2a45048eee-46
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:54 +0200
Received: from [52.101.201.42]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31340-b57f-0a2a45040019-3465c92a4222-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:54 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:51 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:51 +0000
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
 b=tSbCM71foQNn+INJrfRstGgCUbLAQJW5sutXH33wppMhs4K1bbBCOXmoJmZEluQpxrOO6BBa3eDtVuo+NGxssssUUldOH7PNg3gyuZpUyPQnPSXZM57Rut5h4i0UXBka5/w7TpF1U3o1CiLOgWttsjPla6S/Sot4qLY+84d+Kn5J/tqsQ0Oq4Dc/jWBshRQC3WyndPp7xXLB5JQBXWsMq8xZ+RoMWz5OSdmjczyTb2Ji/rUfk5ZiYLujZBXwLIUFj31L8mffKXtgNtRMCKNeINXpsoIhU+PQ9G78BpY078Mr0hCbLUNbC5gt1RPw9z8N0J4ethL8EDiQLS2FqXcRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGru9pf2RpibDMFcJrBFNb+rJC6hAox/YLh0z7EKIL4=;
 b=ms5hbDcYba274pAx31g867NhUFcsGgdFOOTCH8Ts3IOS948/y385iKjZ2vc4NM+zUwk8RbPMXBRpzm/tF0Qd2TKgOUf1r41FMDL5MHosplmBtlauEnV2fJ/6+Hs9EUH6dNdNq63m25BdPRmoEL1TOtBrakfA2e5l7bm1DGxqEPXFLU6BsDWwhoOVQy83NmiCkHF/HtB/yJEyq2/lmtmD9AgJ87fDL5nFXjT7pWux+YtPCCRBFfe5y3ISC4YPSlFOLtqGvxpSrcE0pZWQU53f5THaBCqK7cg0siayzBE+ofDlzsm8SyUbFrlW5NxZf+8ba7UbYw3gC6aJeY24yvPRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGru9pf2RpibDMFcJrBFNb+rJC6hAox/YLh0z7EKIL4=;
 b=KZofkVw1oSEt3eFdx77QRyYWSdKJvg/LS/Q+qOCuOgL9NOjXOSxBniGaSlQ1HfWSUYDD9lycIY58Ws6aoU8/oesKHnuhJFGdTuAmRTE423pTwna6O1Zr4lx/LmigzgK+HXXATbi+tqWRzMk+KUUztCvERICHKVxZReyqtUqiPoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 6/7] x86: New feature flag XENFEAT_mmu_pt_update_swap.
Date: Thu, 10 Sep 2026 21:31:12 +0100
Message-ID: <20260910203113.462943-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0669.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a015b00-fa12-45bc-3853-08df0f7a442f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SbCapKSucEV6AMu/a7bXjOmBH8VPO9ymfoRfJqQ9wfqawSDHiX5qBDLD/qIfsxDUlqdpAlJ3VT8oiRzUXYTd9eEvmmSdnr//TWzUovDNvqg0Akipugwo136YNb0drwg2xlWfG1kCEZ3z2SI20rbnWoHc+Djfuwe21F7ih5Fr0rPiibHo1ZlY6mhnTFx7m2eHSJJluK6m3UetAiXx9rW03Gv0hGfJCbQ4EAyyxjymNf4T3UanFfd0EDsmj9cWE3AL4h5i0WA1gm/nwD/Q65V7uFC0N/AB4CmV8x0yDP7fqCTAv/NmFon8UWjeDcaQVy7j8bF2lDhYVr7a70pxdANSnwLQazAM2WEBvdHpJblr6jAp2Z0Y0NHGHzrjn7A4Gffcyfrnlzyk65OhNGQ5PzxyZJ3ytnKS3RKDiHCzrT8exe8G8/9gdKUbGkmIXfg8K7cV8z5HWC6ZjKl7AkwTA4FgfsZsqdIULFqowa3NtCsqpt3gJAPnxKjW5nqp/tE19khKqxxgSDypf7mN7dNGgtW7Vxz02JeyycBZYVKxfKRCm6lPpuV/R0sPk4r4b9IWA20ckI9jfrKAm3pPhJ/C41eLWysu/S2fVPFtuj7s6ZNueCRLw6UWbdqWdlkJ13sIc6I8XOU95q1xNICYM+l+2/xMZ1tyE4PElHeJy855wXhcZl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JnqaALAbwO2+BR8Vprylf89EfaM2Q6SY05CKDBBui9fhJaWW13IdZ5iVWLkD?=
 =?us-ascii?Q?TjYTyrtf9wYeFBg3FZIcHEDjh2P0oq6lxflF6TN7pDSSRp7sRNh+j1Qpa6hr?=
 =?us-ascii?Q?6CdI2fISdvycugkz4dxPQIVj1YuyDBc45bsnflBOj159hVyNAFGb2Ltnj7Ds?=
 =?us-ascii?Q?RXxpBXrs8mopLsRdHOKbXUhYCrC3i9vte832eeej/z3aSI9iRe1gFqKMdgng?=
 =?us-ascii?Q?v7TzgxUdMtbkUwGOkn3XUmGZOkMQFi4fTRPVA5CrEJfKuLOUQyWB0e1Xo8wk?=
 =?us-ascii?Q?AqMt6U4wvVyePGWeIf++6DJwi+ChdvzTqIEfqnr3ei7zUcYv86gcAOD9p8rX?=
 =?us-ascii?Q?QdBp+IedMLNyUrp4uznF+eUQXnc/y6olMjHvASFG7+rcZJUaYqoC61ze2qNS?=
 =?us-ascii?Q?t0qy9AW5kT1vkm38G9bGhb7G/9OoXjy8Xmcc6s1Hoyh0+rBXyK1hTynTr+t0?=
 =?us-ascii?Q?mqTq+P4HVyJOJu/zor1drwo5Iyb8MDknR0/KAXJWjO4ZgPatwCf/i7+Gq+/b?=
 =?us-ascii?Q?RRZOufipNQVNhwHM0NGvoRPDI4I28qKBD6fEjxzmfmt9gjoEb4K4oH8LEWpE?=
 =?us-ascii?Q?qW3UZNBkjYjBfcpeyuIoTa7/YjlbmVEjSxdEpgP2gmN3MDzr/iPsEtxD+UvM?=
 =?us-ascii?Q?1Ndr8SWnoejVMQ6vLwe4bXtOEIpdK60Y7LoRyyyQIdRAayFRj9OFMH0zqIun?=
 =?us-ascii?Q?8uRnnTrw58KJWBpxRggnwioMvjAHcvw1WemiVaWrSh7IAgt3bQZoIoJTnRrF?=
 =?us-ascii?Q?UlUF4dObcsjGSzd6CleRnVjR0abWJWxx1gtv3MV9E7nKvRDlkJpV82tRKc8F?=
 =?us-ascii?Q?DPSsnTwPH0VyOJ+Giqz4bHGNjtHoqR8RlSCVSi5hfzT7pYXFfCiyQEBYGfkH?=
 =?us-ascii?Q?kyhNAUxxfizxfmWOSvWt+XCLdO2y78PKrXZlMOCsHEF1CGiEIJYnx1UXt/MJ?=
 =?us-ascii?Q?2f7/kgxweWh8w64YNJ8w5vrEnSFSfP1Xko0n94n6EqvasZiy77Z6bCOAAgcy?=
 =?us-ascii?Q?PWdIv8IWOcRA6DnnN0W6jNI9MYjnhvo74RF3hOq3KjmSawVFRlD3ir04WUSc?=
 =?us-ascii?Q?Y4fe5I+wePD3RcCvyIr2zbvxixlr4zOq5mVY0JDioV/JNOgB7zjesM7mRAo+?=
 =?us-ascii?Q?l3+7dPJFAakw4qLVg5Kji2l0CNFUKjb+KTvsqHi/6vEwExvWybxowWg7wkkm?=
 =?us-ascii?Q?76nuhZQNd1W9mVyTlAM24e3/od9vou4ljM3PrehM8kGybb0Q62LJj7bDRorD?=
 =?us-ascii?Q?qGqaFJMSWP4oz/hUvGZSoSxPUNfXEL4MfL0CqKek2vU56uZK5U2IPgCCZHv/?=
 =?us-ascii?Q?6BzotawqTJAUW+QUzZyUY3k6MLxOhjI2c3VPEFFoTKyPDqV2GU7gatiRuWvS?=
 =?us-ascii?Q?yml0PvC6Xy6vICu7Ipv0RbmFh8en4LMRyBsBsVqvJJZrHJ7wYl7evEvumXEg?=
 =?us-ascii?Q?7zZTKMyIXip3b2lqkQfyuBlrT+xEy2vqDbo0kxGoMfsbM3H/8SlkOzZmc8Fr?=
 =?us-ascii?Q?qQK5Es1/NedRg2kyeN0Uui7DGljBkfOKR5Sp4nIHqTQhBSA+bLHft520QJW5?=
 =?us-ascii?Q?CO80mp13Baq4JnMzAd35ksBA/tFEaYF3svQ/HOSbFKqzFRy6TocOJ/DN3Cjc?=
 =?us-ascii?Q?wqyTTi8BJeVJS2nDG/ceePe6Hiq7yRII6tAHdoHSfI4QiQ/tYFw4wzjcyohS?=
 =?us-ascii?Q?SCY9LSlQJ+KUh146xDhNPLqRHWr3IczBsfoZwz3EOkfLHDbKEOAjCKNJ5dh5?=
 =?us-ascii?Q?MFoZT00Rxg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a015b00-fa12-45bc-3853-08df0f7a442f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:51.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PppaHaoPwR5q/qfDVl3XbQBQudQY+DGX+qVGn9hsBMm6kkseuiZFMeTd28haYZIaJgCDUvDeMBZG6nSF8QKcOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-ebf023/1789072194-C28C9B50-265DBC0C/0/0
X-purgate-type: clean
X-purgate-size: 1380

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch
---
 xen/common/kernel.c           | 3 ++-
 xen/include/public/features.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f4bbd8818fa8..fa335803478e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -690,7 +690,8 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #endif
 #ifdef CONFIG_X86
             if ( is_pv_domain(d) )
-                fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                fi.submap |= (1U << XENFEAT_mmu_pt_update_swap) |
+                             (1U << XENFEAT_mmu_pt_update_preserve_ad) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
             else
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 880193094713..227f1e408e41 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,9 @@
  */
 #define XENFEAT_dm_msix_all_writes        20
 
+/* x86: Does this Xen host support the MMU_PT_UPDATE_SWAP hypercall? */
+#define XENFEAT_mmu_pt_update_swap        21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.52.0


