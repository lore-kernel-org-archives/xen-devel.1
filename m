Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90BCD6E6B
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 10:46:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1327649.1592468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5ah-0000eo-Cw; Thu, 04 Jun 2026 10:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327649.1592468; Thu, 04 Jun 2026 10:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5ah-0000eh-9C; Thu, 04 Jun 2026 10:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1327649;
 Thu, 04 Jun 2026 10:46:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV5af-0000Xo-Kt
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5ae-001AiV-Vs
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:46:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a21577c-5cb7-0a2a0a5109dd-0a2a4509a5b4-2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:46:20 +0200
Received: from [52.101.62.25]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a21577b-2497-0a2a45090019-34653e19e821-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:46:20 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7339.namprd03.prod.outlook.com (2603:10b6:510:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:46:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 10:46:15 +0000
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
 b=k3zZU9VneEhPasyGN+gR1zqipiipWPGIoYrfinquWkMW91qDFY9nbTLUP8XR4Uj3VsjeLjLGSSvApp0XOs6ELbeZCzjF7HWdZ/bFwviRsP1L3FYbBrQdr9aS6W+4OBgGbZ4WPVjs2Qpd2GP6tmveHEnnuYdO4raF4c4s4V72Xt6WbbL1C+HX891CIn+t5rJCcNN5/wWg2vnjhxEk1NBSXf8N1G2+ryOOXjCxhsIlQEg4XK0tC4ilgww7b5Hc/c8DUq04mXo0uya1qF4VqK/mm6oKDJ4TkAqCA+nGIe6fxrLezfaJInVEOoa0arJyjLFSjQtgzoWRMGc97O+oXRGM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFVRlRzwPBZ0nZA+WC8XU2hUhfBHoeFb1LxSH2A9+As=;
 b=cSlMhgNfxeHzdwL1SIJRObff+dIYYnuR6+W8g2b+xjm6XWXLDmhn/S+BWR3k76MXSIWclqWN/cqpQVle2KA7sUqV1i6Hn4tbeKca7Rk9Gi0u9uLJ2jZIGH3avCK9uVACdPEUYMATlpAlGMbemu55Aw/GhQTZbA//9CDabZo22myFMXpl/CqUOQk1otvdMTze7X3OHgA0YYOLpJErme/hgS0RA5QA/6Ii012Hez9yD+E4AR026qjZTMBoIaD0P49gNxHvD2pl3RcDrAgDaZCdBjZwGykR9N8Pi+J9A06yp23xauDrHFSTz54s9x+25kzu6O4lIuwIc2350vQ99q8e0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFVRlRzwPBZ0nZA+WC8XU2hUhfBHoeFb1LxSH2A9+As=;
 b=ZZFW/2SndncTJjxvo/vwp27koMFypAyQP+Beudr/BgbJ0FHMC1PMxlVJAuN+no40Wyjxg5Fn1ndMoaeRMrvWWCwCw7/6dinslSsI2qjzGQq6LzwQP6ZQ7a8uY4K+29MDggPOW+9cMrKsG1QdYBF6tHflP8QXxzLaABBda04zQ5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 1/2] x86/mcfg: sort header includes
Date: Thu,  4 Jun 2026 12:46:03 +0200
Message-ID: <20260604104605.92516-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604104605.92516-1-roger.pau@citrix.com>
References: <20260604104605.92516-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b48c9c-3730-430d-7975-08dec22680a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	St5NBB4dlvObZhwxyI19Hiol3/BvSdufLnse5/R+iSGMLdD4n40PsJR9Ye0ANHyhpy2JfaZPH1qStk38LmUD+IAX5TUIlujqIh9syQcmAw5k+5/291y61q/DAGhX6euM5TFtTgOccx4h+SFZtZt6+7kXFsJHNqQ7619j26K9dDR8MBiwP8S39yXZ/ug1mxTJpszUcIPv3FPV+3GxogcS3pCdV0Jbyi4t/RBGU9SPBUxF+TXq4zOPMbBfZMPfNfLLs2QwZ98ErktmKzRw6T5RDGpbPtjfzc7oXZJzcTgzilO/bqOx70LctGwXZl1n3tuTL1XqLQtovOQIQk4s4zcrYp7TDeSucPCWpBuD7Rtu09bgnzKpWkGeim5kLbhVn7wUrCwebETwrLxlCwYr6ltvlAHL84Bu6E7q9LuF5Utn4pimXgwj3Jx9oVeQAtxHslbrD+6eGi7Q7hSd1SyWd4ckIvFjCoJafOWfKCLuUVqlUJSwt+VonhIgm059fla9yHJvsbTxNR96odVcSN6AzrGjMGgx5gvnD/1yoXM5L+KEsQrbuA6MHcU1jwuaICPbUhxH8aIukCDL/P2BBcVr9AgRkurgYZG1Mbn/vFz5CPinxQyl0r8vf1ItMHShSYpGsz353LXeUesw8SHYy6OQT88RD2R002k9xwrfsaqruoObF3bPcEMf7/z19VdW5TPZWvst
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmUwWXBaV0M2M2tmN3JBQVZPek1nYVRoN2xjQ1V0ZU04VGxCV0xjSkYzb0Ja?=
 =?utf-8?B?blBsbHJBSTFJVFNOMmM4QlVqOVF0aGNLSFY2M0VBM3cyQUljK1ZWdFllY3Rj?=
 =?utf-8?B?SG5jbVlkTXUwY0ttL2wzUWo0d0tjVnVsTWpYdm56NlNjb2REb2hUeUNOUCtY?=
 =?utf-8?B?dEpEamNZSXRhYXJuTVVVUExvT1ZBdnZpN3NucnVaT2hDeVc5S0N1a2kzSi84?=
 =?utf-8?B?K01WVGMyZjltUTlPWGlyeExQRTl0RFkyVnVJQWVyMmlZODljRWF4RHpOK2xk?=
 =?utf-8?B?OEVvU21heXIvcU5NcHhaVTJub2RKNmdNT1hUdnBHRkg5ZzlVVTgyTDAwbU5M?=
 =?utf-8?B?K0w5Q2hVRjBONWcvTzdnWGFJd1ozV00vbk1OM3ZGM3hXNmVDdFA2bU1hWFlN?=
 =?utf-8?B?Wit3a25MY1hGVkJBMXZ1SVhEdHpFZkNIVVlEQWZkRnZ4SW1aUklUelVUUlA1?=
 =?utf-8?B?TXVYajRpVDJnVlcwSjNiRXdnZTlLZlNsdHMram9sY2lyMTJNL2pPeTQ2dC82?=
 =?utf-8?B?TzVWK2Qvc1g3Rlp2SkhWWm1YWVlBdkhTd0gzbWgyYm1nSG9hampIcnFzaW5E?=
 =?utf-8?B?S21Qd3ExTUxHeGplbHdKdDEwc0VMdThnMjhETm9VeWdVRm4yV1FZZGVNYUd2?=
 =?utf-8?B?eFNpWk54TkNnRW55VEV0RERuYW9hS3kxOWF2ZUF0dURlVXZsbUlJcTNNYnJO?=
 =?utf-8?B?emduczFmTzBaRkJ2UHB1OTB5YkZvY2dtUm1zWU1MZnpUTm0rbHkzMWVBOENI?=
 =?utf-8?B?Q2t2dGh5T3dTL040MVhaTE5BSUU1MTdYMVA1OWRKRzdReDNyMlVyN0NWSWZL?=
 =?utf-8?B?dWVzYko2cEFoYXp1UEpxeDU3aFJFUXlSZkJDa2hQV3pVOHE3VkptMjlaV1Bt?=
 =?utf-8?B?WVFKWE5lZzBJY1ZJWTNhY3hlRzZ6M2FnaExTancrN0FzQ2ViNVZRRHl0UWNj?=
 =?utf-8?B?S0pwMTd5YlBaUGhrcTJHdVZtN2duSmpkZU4xaVpvbVY1U3VEeHJOb1RQMnNY?=
 =?utf-8?B?RnJBZkt0WFVkaWQ5aWZvYUt1NzFQa2hKK0lKelg3R3NpSGZVUGdUa3lMSEZM?=
 =?utf-8?B?SXR0OVZGUDFjSi95Y1RHdEtLbEZrdysyWS81cFdDS1NOemVIRzd0d0VONVBW?=
 =?utf-8?B?V2RMcnpTb3czYy9QQXJNOVJyTGNIVE04dEJEVEYwZVhjZ2lhbUhVUjViVTJ1?=
 =?utf-8?B?bWNaM2RmallJN3dmeFNqS3NPZ2ZHdS84SXVkU0FaRHhjcGhKUm5GZG9wRjNY?=
 =?utf-8?B?UFU3dWhaWStNR29rdTNjN0V4VUdCQlRjcHJuRjAvL3R3Z1didVZxTHVOUWJl?=
 =?utf-8?B?aUtJY0JOeFJsSEsxUUtreS9YK0VxLzZZNVBrYVR1dkdDZHZ2ZFh5QlpheWh1?=
 =?utf-8?B?YnNqZkRmN2xBMFJSTjJaREhDQmlHaVZib1Z6dVh6WDZhN3NGWVJ5azZZN3F5?=
 =?utf-8?B?cGhHYXNvMno3UFN6Zkp0TndHWXYxTW51eUtpbkJqQ1VPcmo0NjNSdkVJemk3?=
 =?utf-8?B?a0s0Z0szYS9XQmZKU21pRDdQbG5MUnl0c2l0ZVlUUUgydU1TbG5ZWWNLVFBN?=
 =?utf-8?B?b2g1Rkc4S004V24yUEcvR3k1QUI3cXl1NTR1NVZ6b2NqYlU5MHV0V1FZcVQv?=
 =?utf-8?B?bVZENy9yOGwvVDk2dVNhVE5EN1FVeHlJN3owc2FxRmtwa3dhblcyQ25iSEVy?=
 =?utf-8?B?RnVaZzV2cmN5NWlYZlFNOUVhTWM0Uys0R0k1UEE5TlhiSE01WE1aSmY3SnZB?=
 =?utf-8?B?bEcyVE9PYW9VMnY3UDZYbjRsT0pqM0thdjVjbTB0cHRpSzRzMDJNbGpzaEpH?=
 =?utf-8?B?ZjFSUEVxNnNLNkZlL1FIanIwYVMzb3ZiTmJ1MWxNSmFOdDJ3ZUI4WkhpOE9O?=
 =?utf-8?B?WWNYbUcvQ1VCS3pWRjE3M2tNdmc3YXhkejI4dTk0YnFWMmVkMGdxUW8ramo2?=
 =?utf-8?B?S05VVC9KMlpKS2tPOUZXZHIwYTlCOWU2TlpuWWJhS215UGk3djFhb04zaTc4?=
 =?utf-8?B?SDhDTmFsNVpoV1BBVWxGNzZFL3lkc3E5MmI1R2QxeGFrNTFXTTRKV2JNRWFj?=
 =?utf-8?B?NUNWOVQyZ2Vld0MvM1FiNmE5MDlaZ3ovQWVyYXEvVExrdnBlczU3THBMTDNy?=
 =?utf-8?B?RU0wNXA1TWZCWFlLdlNYQ2thTmR6SlFzMmVwelYwRzRJVjl2SnE3V3NkV3BT?=
 =?utf-8?B?NDYyaU5MTHMwSjVxMk85aUxiOU9hN0kwREExZXVNbVB0RFdzL3FqZU13Tm1u?=
 =?utf-8?B?YlNQYjBHS2ZPd1hjakhINU1Ja1cxeFhzVEdmWVBOcXNuZXUvam5ZQ1YxUHE2?=
 =?utf-8?B?cVBsYytqT04waUJTMVVMeVFoeEp4Z1IxZkJxSVY4MW5neE5aN2ExUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b48c9c-3730-430d-7975-08dec22680a6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:46:15.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRgHSW8Cj4LY78+uONog8q15MjGCJNxx+Q5FlV2BpVbI26C6NlQQhzTGX1VoASC78QEMnWUgIguw/X90jZPezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7339
X-purgate-ID: tlsNG-bad1c0/1780569980-41F6EA53-8F440D14/0/0
X-purgate-type: clean
X-purgate-size: 962

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/mmconfig-shared.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index ab082b5f5b37..d0cbc151705d 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -12,17 +12,19 @@
  * Author: Allen Kay <allen.m.kay@intel.com> -  adapted to xen from Linux
  */
 
+#include <xen/acpi.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/param.h>
-#include <xen/acpi.h>
-#include <xen/xmalloc.h>
 #include <xen/pci.h>
-#include <xen/pci_regs.h>
 #include <xen/pci_ids.h>
+#include <xen/pci_regs.h>
+#include <xen/xmalloc.h>
+
 #include <asm/e820.h>
 #include <asm/msr.h>
 #include <asm/msr-index.h>
+
 #include <public/physdev.h>
 
 #include "mmconfig.h"
-- 
2.53.0


