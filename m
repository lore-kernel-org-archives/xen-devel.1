Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4002ACD6E57
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 10:46:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1327650.1592478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5ai-0000rv-KT; Thu, 04 Jun 2026 10:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327650.1592478; Thu, 04 Jun 2026 10:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5ai-0000rj-FR; Thu, 04 Jun 2026 10:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1327650;
 Thu, 04 Jun 2026 10:46:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV5ag-0000eZ-FW
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:46:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5af-001AiV-SA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:46:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a21577c-5cb7-0a2a0a5109dd-0a2a4509a5b4-6
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:46:21 +0200
Received: from [52.101.62.25]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a21577b-2497-0a2a45090019-34653e19e821-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:46:21 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7339.namprd03.prod.outlook.com (2603:10b6:510:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:46:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 10:46:19 +0000
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
 b=GPY2mxspc/kmNYGitFkuimCP5DhEm1AmrNdCxt3H2YRCo7vxB5qEXBAN0xacdY57jeJceHY3Xg86tkM5z+qMEUScaOpJKhNmKe3QRUdllP7p8JPGFkDKmflguDred8UUx7Ih42p7bj6tAWa7fyLCFSY/3bzBpiI4PmoVRbX94jwJOXu0JA4+U1m7TYk3DKnIWnlBixtthGeTeZaE+vgrnWedkpW/V0gjScBmsiP/jyp6Ck/evKIIXPAFPSbsIY5+ELOk6DrBN3xwK1KIfg4OxZq653nPIY9alPrKhDH3Uo37Lv6jg0SQTkol9c39nXze6JvCTbXdLwg6VqczC46Hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAVeWHi2hK4nsn3NUTrNBgVlZCJB1Kkd6GoF1JGVuVw=;
 b=fONuqrgE/qI77YH9UVXppC1+BVvDGAxvfAkBLMdhlHA7Df+IS+ybqUiheSduTmqdC56z6srGJTkVyPPYzTZO3ehq33aIXUwf7y639+5xLBtZ7hdwYD3JM6jNFMFbThy5JtEa6hKbjG9bLEMZMfW8Ii90nq9JhWDoQ3zZrD9Ia5uQWW22tYy0D38ff1EcxtzsHfjSdRADD0u949ILFOHLmKWf9DRCSY5qY1PVJMjfoV8+Qh564LqoAwvqTN8PwgxHhyKGclYWSCIbcRE3jmfMTOadhHAjgHTtvonMw680JK+T00/U/XvpGIqe2sYGRgKHw3tK5QJaio2N0T8TzwvVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAVeWHi2hK4nsn3NUTrNBgVlZCJB1Kkd6GoF1JGVuVw=;
 b=vKXByeB02/w5Q8mz2LFQi1LehtRB39cZ27VN/lPmpKeRe6t5+xtIY+JsvBrMlaGwW05Wms9+AuCgwapPNyEX9yqfp5aUWOpe+cxh8e+Zfaa34Xun67R6/BP1Wvb7Oj3kJJ+LBWNzXG02mAxg4MHJU3GVqPXYVmWATtCBeXtXtcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 2/2] x86/mcfg: relax memory map checks on newer firmware
Date: Thu,  4 Jun 2026 12:46:04 +0200
Message-ID: <20260604104605.92516-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604104605.92516-1-roger.pau@citrix.com>
References: <20260604104605.92516-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0053.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aea80a5-c548-44bc-bb42-08dec226829f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|6133799003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D4W8lnIKnggOYNe2beEB0+qAwopKSJCPIpD9dNZgamn3n1+ugMPqs4ewZzT0GMihjG/hETcUacHfrocZdob9Ft8UNy+9Uhcca7797Ul7W73KZyzaqtiHF1PDytntjV3QP97gPJmrCPpNO+ZHIuCF1qxpaXDTytMgpX9/oJwboqUW8yFxfbgN+y6ABcUe4XI8EyEpsZa3x45YTPvnvegh7mE3FSilDEcTABIwqZi8M/lMbS4o16wDhiP1Fd2gAlH1spQvF4G4k82o0g5MDonhY4DCbGkRE5PtUyf9pIS4mJREKC7lNsfPNqJ/ZUy3JHwyBMuIap/Gul3jm8MTqtMFxHyZmbXtGhVERl249nr6kUQO8691fqsbsIeZty6CNRBqJPdCe6noZvdZwKp9BHvO4DaCUUC/6u0NXiAV/r/i117rjZyZhunJmeityg4OZCtwteRnTpzglbQkJZvVHMxoljPFSwVvgdYgOqS6JDswa9rMiMddG8r8iOlDyuCeLmY8VVeDYuUR9fYHyNq4TopenDMqNOgnCh5vNjdZiIceM6qTaZV7ZVXJlZdWuIsJT7b25aXGALult+Ib/6FGY93jCtyC3PIColqZqb1eC+Fj3w1v8/gzQdYXwjc9zj8XXzRATafBiBrsCuLUoLUbkjgXnozIF3pFVInKX7kqNUM2FA2tZNxxlfWbckCz60o1fhJu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(6133799003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDVqUDlackZBNEJMY1JVMGc4djZWN0IrRkhNczBMQ2xJWmhKaTNSeDkrK0F1?=
 =?utf-8?B?bENuYTMzVjJHRmZ0OGZlYnA4ZnNrN1VXN1JqVFR2VXdjd2FYRmpTNkR3SU5F?=
 =?utf-8?B?VnFtVDZTYlpvOTMyN01pNmFtYXBDK3FDMEpjWkVjTkpoNlk0eG1URm5OaXZ3?=
 =?utf-8?B?d2lVMklTdVIzWDNWcHgwSjZiMk5oakhEV2xVaUxoTENWTW1xWUlKaXFpNFdE?=
 =?utf-8?B?bFJ3enhrYmtJcHI5U1R0eG9xSk5CdmxXZi9YTVVYSndHSXA1RDRtM3ozRVJw?=
 =?utf-8?B?cjdoYUVkZHJVNGE5YXFZQzltbkprTkU1ZTFydFFoNzFDRU1aa3J0TlUvSUxh?=
 =?utf-8?B?U2xXbVk0Y3FXZVl1MnZOZ3VzWDVoci83d2oydDFtbDlOZ1h5elJYcytIZGti?=
 =?utf-8?B?STFsNjRkNG1nd21ocTZ1U0xITllsV3NKVWxEZ044TWQvUkxyY1lmQ2tDeWd5?=
 =?utf-8?B?eFJ3WjJoWEsvK0lkRnZyTWRNM3Yva1pGUE9ibWY0bWJ5ZDYycjlFT0Vsdlg1?=
 =?utf-8?B?emJ5eGsyVllkVXplK3Bjc1REUUNsVk9VeGsrZWxVdHdCaUI1a21jOG8zbXdm?=
 =?utf-8?B?R0ZjSWhRRHkyQStKQ0E4RlFqYy9yWnhEWG83Sm9uU2EwMis0dEJiUU84SFdM?=
 =?utf-8?B?cUFRZEFQWTJDV3dpMjgwamdyOVl0UUgrM1RkZ2pueFBiUTY1WWg2alpkdVhL?=
 =?utf-8?B?T21ZK2xtWTkySG9FYUttN1RIS3hLZ1Z3bTNDWXZFaHU2V2lrRFZhVUUzdW9j?=
 =?utf-8?B?M1V1MGJCWWZBTEhhQXhDUTZpeVlnRDVxVU52ZEdQOUpDRzU2TWdNcHlNRDlJ?=
 =?utf-8?B?Q1FQTU5FamlvN1ovZzhXNU5Qc0hvYmJuN0pwTForRDdZTHpiWWxoWVZFaWZh?=
 =?utf-8?B?dVd5dEdObFJvZmdNcnpYNmQyVXJlSkZUYnAvNkhUUmN2ZmFwUnpZdnVkVnUw?=
 =?utf-8?B?Mk1nbGZldXRPWm9ZTHFCU25PSFlJUzBTNDRXRXRLNXdNRTRpTjU4UG1PZTU1?=
 =?utf-8?B?U0lnVU50ZEVVVG9DcG95T0JKZS9MVkpSa1o3NzEwR3JVekVQUUZvcGNUb2Vk?=
 =?utf-8?B?eDlFRUVIMUNoQ0tOeFp0Yi9KWVVEZFhPZTZGZ3ZUWitkWTF3RnlDekgzNGJJ?=
 =?utf-8?B?b2hqdTUyanY0anI0ZDlZSU9kSmJ0N2tOYU51Y0ZkeVI5S3Q1akE2aDQ5Rlg0?=
 =?utf-8?B?Wkt3VjR5cEVsT3JjRGJGQkl3T2FqR0dtWUl4a0dGbFl2dGg2RG90bU5IOHF1?=
 =?utf-8?B?UGNwdmlqYVNXVDc1ZEc2ZnkzV2FnQS9tSFJTYTQ2VWh3cU1tMnR5bnphbUhh?=
 =?utf-8?B?eVhVY2dibnA2VnJubVdvaHIyYWtrbXFjcEFkN1BCQ2l3Rm5EakFka3JIQkpQ?=
 =?utf-8?B?aUJCdHpMdytiek8xNXNvZVhUVEFsNldmVXd1ZjFZbWVRWFR0ajMzSjVGazc2?=
 =?utf-8?B?Y3UwYy9SUEJKcVhzOFZCUHRsODFBY1dGQTJ5K2VEV3ZjR1JQNUlHNitPdkQz?=
 =?utf-8?B?TmN0dGVWWXdhclJrQjFNMHFLWEVJRldKbFl3QitjWjJMZk14UFEzVlhNOWp3?=
 =?utf-8?B?UmhiaEhPWnhkV1JVVnlJZi9XNnJtTDhLMVlBbnpXdlM3YWtxNnhFMjNySXhR?=
 =?utf-8?B?d3pwZ2c4TWhtdjhYaDhqVlhjVk94Y1V4SGtuYXZXU0RPVjVVM1pONEs1YXMx?=
 =?utf-8?B?RWQzMFl4YnQyMVVyRUR5MmZkQW5MRmtXRWRtUHlvQUcxd1MvWGxqUEowQlcv?=
 =?utf-8?B?UEZoTlVxREtFTy9lYlE1RFhrY21xUnNRQm92WityRSswRDNkRGlkMW1aeWRx?=
 =?utf-8?B?aEFpYWdqK1ZNUGdsRnhVbWVDdyt0L3hiejg2b3M5Um1EamNPeFRjN2hpUms3?=
 =?utf-8?B?akVHMUpmZjQ1dFJnYk5rd1plazI4cXU5a21aaHZiZVJvRFBrNDdXd1hzSjdO?=
 =?utf-8?B?c1JncGN3MW9lSWhjWWZqMzFxcjcyYlJNMStUc1dmRC9yc2dXZ21NbjdiSVFh?=
 =?utf-8?B?TlUwQmNYZHp1OUVJZHV4S3RzUitwTjRPMXBVUldsUjdhVG1GL2tPWWlqYkhl?=
 =?utf-8?B?UzVoVCtENjdwdWNUWkcycElQcVdrOE5USHpZMm52dVVXakh4RkV5cGpERHlq?=
 =?utf-8?B?blhRYkhQVUs1NEoxRURYMmpGZFNCdG1Xem5EV3dodW0zb21FSkVYamFYbE9U?=
 =?utf-8?B?YVF0UXpGTUF3bmJHc0I5YXRGT3hQWm5XYnJYYk4rU1FZOGc2d0FHdGV0aTY4?=
 =?utf-8?B?K1FkbWlMNnpGZ3BjTktvR1dFbXhDWVFYVW1yUkhoS2FyM2RiNTVYcGplWmdy?=
 =?utf-8?B?M1VieWZDdy95NlpDMnQvNVd2TXIxTWZEVkV6ZEJjZkJxM0gzUDRTUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aea80a5-c548-44bc-bb42-08dec226829f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:46:19.1407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IT90B7M3eR+I5e74sPEbT9kYEwwHwmiUPZNnIszfN4q2aYrM+0BXNJ2gkCnXAZz1jDw2MRy0SHVqk0F/Ymt2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7339
X-purgate-ID: tlsNG-bad1c0/1780569981-41969A53-23516D9A/0/0
X-purgate-type: clean
X-purgate-size: 3313

Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
reserved by declaring a motherboard resource, but there's no requirement to
mention it in E820, so we shouldn't look at E820 to validate the ECAM space
described by MCFG.  The specification additionally states that: the
resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
reserved memory.

The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
This was picked up by Xen when MCFG support was added in 3b35911d709e
("Enable pci mmcfg and ATS for x86_64").  Apply the same approach that
Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for ECAM
region") and relax the strict reserved region checking so it's only done
for firmware manufactured prior to 2016.

When dom0 is booted it can always prevent access to misconfigured MCFG
regions by using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings
Xen's early usage of MCFG (prior to ACPI AML parsing) in line with the
implementation in Linux.

This fixes an issue with detection of extended capabilities when running
Xen on a Lenovo system that doesn't list the MCFG area as an
EfiMemoryMappedIO region in the EFI memory map.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm not sure what's the best way to attribute the logic here with the
Linux commit that introduced this, more than referencing it in the commit
message text.  The code is too different for me to attempt to label this
change as a backport of the original Linux commit.
---
 xen/arch/x86/x86_64/mmconfig-shared.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index d0cbc151705d..e24a78c8d1d3 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -13,6 +13,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/dmi.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/param.h>
@@ -369,12 +370,15 @@ static bool __init pci_mmcfg_reject_broken(void)
     typeof(pci_mmcfg_config[0]) *cfg;
     int i;
     bool valid = true;
+    int year;
 
     if ((pci_mmcfg_config_num == 0) ||
         (pci_mmcfg_config == NULL) ||
         (pci_mmcfg_config[0].address == 0))
         return 0;
 
+    dmi_get_date(DMI_BIOS_DATE, &year, NULL, NULL);
+
     for (i = 0; i < pci_mmcfg_config_num; i++) {
         u64 addr, size;
 
@@ -390,7 +394,13 @@ static bool __init pci_mmcfg_reject_broken(void)
                (unsigned int)cfg->start_bus_number,
                (unsigned int)cfg->end_bus_number);
 
-        if ( !is_mmconf_reserved(addr, size, i, cfg) ||
+        /*
+         * For firmware from 2016 or later relax the checking and also consider
+         * MCFG regions in holes on the memory map as valid.
+         */
+        if ( ((year < 2016 || !is_memory_hole(maddr_to_mfn(addr),
+                                              maddr_to_mfn(addr + size - 1))) &&
+              !is_mmconf_reserved(addr, size, i, cfg)) ||
              pci_mmcfg_arch_enable(i) < 0 )
         {
             pci_mmcfg_arch_disable(i);
-- 
2.53.0


