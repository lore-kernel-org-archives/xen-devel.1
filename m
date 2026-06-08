Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D771CD8C9D
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 08:25:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331440.1593995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWVI4-0001xi-1B; Mon, 08 Jun 2026 08:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331440.1593995; Mon, 08 Jun 2026 08:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWVI3-0001xb-T8; Mon, 08 Jun 2026 08:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1331440;
 Mon, 08 Jun 2026 08:24:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWVI2-0001xC-4W
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 08:24:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWVI1-0037KM-AF
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:24:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a267c59-5cb7-0a2a0a5109dd-0a2a4505cc3a-0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 10:24:57 +0200
Received: from [52.101.53.26]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a267c57-aaa8-0a2a45050019-3465351a4cda-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 10:24:56 +0200
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SA3PR03MB8352.namprd03.prod.outlook.com (2603:10b6:806:466::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 08:24:54 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:24:54 +0000
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
 b=CAp2OwKXo3iGUqCDKhLclnYdqeAR7xFhbGpIVRBEpkaZKbYkJvgTFkcwYrAzy+kXk6l02j/WUXXPL0q/X9y4mkJcqhGlHcsh//mbEw0H/zeH1AfTK3QQ4BjiamycZB6by4UaJQ/e3r9rlhMVCUcBx7GMEaIPiP/byWXntCG3jQ//Mr8cRR+Cd2BFVunxbwGV4S2gtO0BtGx2PBdRu0dLdl+sWfY7vbgOmBDX012qoYi73oo0ebszHxssy9A/8j32YCe0ojk8RUGiwVAntpKC0kKy+Vb8vQmvttEgbPMLRmmQ68zD22a20TxaIMmuJiuVq5AyeN6AHuUp7xdCt87s5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq3w8rflGScmxqel0yU37w/AwtiHB/aonOMjWLqmc/4=;
 b=Ig5Kmw0M0XmMcVxjllriEIJE2Pas8axlZQZ5fG806XqHWvJYRMRE+hUQJRL4lJaDI3cDgXVFqvZdl1Q+OtnpQoeAWMM0eKHP25XPQVLslq3JO/Fi6XIL4uLGgfUdbO8Pu/XHLLOyel9Kgg8rQ2zMseYUPyRVV5lJcaETTtBPEQ+2bZTEdFtIorwdz8q+E0YgdS9lr7LHH3FsPzjlxd6okxe9eCP+iI7CD3fpAwb2fvaRKn+hWGy+1Bww/gobbrEwhsX5PmOwWjYjHR7xp1pHx5r/r84PWWwtJxN+oUoSQgDI7o3yR/+cmft6efXSgM2YoeAjyFI0H5xskFz1sx0uow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq3w8rflGScmxqel0yU37w/AwtiHB/aonOMjWLqmc/4=;
 b=G67LWOVRmLS68ZJp/pivpuJmlT78BeE7gwEVzwlsurSYcaF5AJfqSpJunEDRsyzw8RH7QpLtAGXxiAcXCo3rCPhCBGeNGxExSG/KdylcDWqxI8HeYs60QHyzyMBcE8Sq6EKdRrykevQsFAFpvvU1oHQYNYu4lFrL67SocfB7bKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22] docs: remove non-breaking space from xen-command-line
Date: Mon,  8 Jun 2026 10:24:40 +0200
Message-ID: <20260608082440.73415-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0070.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::7) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SA3PR03MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f590127-865f-410a-5c5a-08dec5376ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vvkVZdTM+hoYVOoHcRuodHtga9ZsHBl9w3sGh7NMhEoTAB/s9fpf9IMv3KB68I4PKtL3eW3D38mWPWkvyVGiDapbjzAUbO2ExXerNlwMCQRvQBatOzcdAjQRsGatYrAG16NOY8yN1BawUp1/OVNwPocz17ki7/5X61um28DSODhODarRbCjQxNI60d0Umrya2bCcCFvfzWMr1oetkBXSwwe+ZMlGguBz+mPqhFCXVQrvgvspkjbAZy5WT81tvVrn9cKTs0yiV1L1zwbOcY4GqyENZQQQKNX1hBb9A3cz2v3c6EL6rAVijtKunz66GlY3PYzzOqykVxgmfhZjf0kuM7q63R4rc7TFckncnogBu5uS1i30rmchcyKqCMUA3KeSBvlyCwVRFSKSxw6ngchbhUWdyrcDAx0wrz20zCFzF/TQ+noJV8jTXm70cBilZCUGfVAdQkayw72dOqVCYY2JnkjZf9vLG9TszymzrvjBtIdLZAg98Uoec/ldGxIWVzHMU7rMr3HkmqdrOQxSKw90AQJ4Kp3pr+JHGF8MoOtNRXWbCnwXdwFSuZM3YxpN7deRoxaWnT814SyOHIvkhMF8HKSv9s26aKZB4EM2gyr7EqmEimkHQmVceRRuHO1+K7zRWYvYDaRHbhmuIcc6bRVUFXojCstRJO7Mrll2qoic+WiSdH9VL4JTP7aEg2+e13lJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emZsVDBETkFQd2Q5OHFXN3NKM3FEbUxrdDg5akFTMk82d0x6M2JvNmVXZ2JP?=
 =?utf-8?B?L1Z5dzh6WlA5YjQ2VEhMSGkraWpPZmxDUkhVOVVjOFhRY1lnNko5ZTJBVytL?=
 =?utf-8?B?T2xoZThVWmI5bHRZVGZwV1RvZFhMSjJEem1nWVIyOWJkZ0Y0MGk4aytLL0V2?=
 =?utf-8?B?ZzlqUldJMTRaMHgwSGsyalJPRjh6NkIrREF4ZnlQU09KUGRiLytuT0xHS3dL?=
 =?utf-8?B?T29vRFJuR256QnFWdklVclpKQzRGUlp2Qm1aV3I4ZHdqOHZDVnF3WFJ5NEF6?=
 =?utf-8?B?SXRXNk1pM0VhckNJSENGVUFubWlwQ0pYaHp4OG4zRVdRM1dBaFQvQTVIK0ZW?=
 =?utf-8?B?L0x0T0ZwMlNrbXdnREFpSkV5YXFwaHo0NmdieFkycG4wMkF0d0YzRUs4R2h2?=
 =?utf-8?B?NkxoNTFwSWUxRE40eWlHRXA2a2RSeDhha2oyaEFSL3V0M1dmZDdVN2tSYk42?=
 =?utf-8?B?cWswcFJPV3dka0hLb1pRQW51R0JrSzlMNkE3MGtqWmpMMjBCUEVWaFczS3hK?=
 =?utf-8?B?VElDWVI5ZHBZaG94VVJPUHN3R1FXTWpHUUtvNWptcUtheU9LaDBNV1R2Skk0?=
 =?utf-8?B?Z3RKdjFPUW1uRmNvT1FQYnVVMENLZTUvS3F0VGpqV3ZFYUpDMy9vUmtWVFZK?=
 =?utf-8?B?ZFB2T0plSFo4M3VxVFArZ0E1V2VkTnNzYnFIOUNYamt3VFdYUzhTdGZhWmw3?=
 =?utf-8?B?WkZ3QzR6R1ZWQ2RNVThLcElhek1pN2gwekk2cWdmUWJSQ2dqWTA1QmorNVo0?=
 =?utf-8?B?MElyVXVvak1sSjZvM1hSZ0xBbENnb09sZkhpdTdmWThpcWZEZndmTjFiV2du?=
 =?utf-8?B?eGZmdHdoRDRCUVJYSTAwU01ZbmRmTkZDS2dHNG9jRE9zUlQzMU5QTXdNd1pZ?=
 =?utf-8?B?VzgzQVBnRVZQVVZuek9GaWpPaDlwbGJUQUg1VWJ0MDBUcDduS2JkK2NTQ0pH?=
 =?utf-8?B?Q1NpaFZ6ZG9oeXU4M1RsNzhtczh1UjkyVTVlOEtBYk5Uck1WUnN4U3VFQ2M3?=
 =?utf-8?B?bEZkZ1U1RERoRVVzRjRFM05Rb1krODZ2dEFpeUFmbHhTeUQrME5RVUI3aTZU?=
 =?utf-8?B?QUZUVURDMVJzcUVLS0Y5UWo2Y2NnQTFzKzByb3p6Y2ZOQ01rRThrVmpXWkxO?=
 =?utf-8?B?am40MlNqWll2QWRBOVlRWEJEendZbnY4NC9hd3FXamFpSktYb2lDckVLVWF2?=
 =?utf-8?B?eW8rM3JaNWZEcnRZczB6bzRzNGNLWTRVMjgvRUZIV2VqUGNITi9kNmVJdEJw?=
 =?utf-8?B?UDZaUnN6bnJGUWdPSDFlZk1KNkMrMjU5RTA5TFQvSjUzcUZQcExRdTNJbEtI?=
 =?utf-8?B?RVFsTGxuOWxiVEoyanFEYk1ONkE4eHplQWVubzZPdlhjKzRhUHlQdTZlREs5?=
 =?utf-8?B?V2Q4cHZkQlpjeFllTW5kbXNWODBnbVJDQUR0MFRYNHdNMzMzNjJVZHE4TjVN?=
 =?utf-8?B?cDEwdHNCWTZxZUJmbnJhKzF3a0kyRXBEVjROQjYvQjVpL1Z4aVo1NGlnZ1Fa?=
 =?utf-8?B?V0ZQbEplWjFRaUIybGdBZWNjOTRFSHNzRUU5R1RwZ2VINk5oR0lVa01QdnpL?=
 =?utf-8?B?bkZlcDVub2FkUVE2R0pzNWRaUm1Mam4xZDh1OTdFUVhyc1FpdFhGU0t2UHBM?=
 =?utf-8?B?VHIvWUJobHN5MytBTUpFSmNwWGUrVVllTE9aVXN4dWFCQTRyZSs5T1FrelY4?=
 =?utf-8?B?eFM2T2lFQ3JGc3N4NjB5YWNIYjI0andPM1VnMUJZcTdzQlBHNGpsNnZCZmli?=
 =?utf-8?B?cVVVbXRSV3NHRStIOTQ1aW1ETWl5VlpiYVB4b0NXcUR4NlNzK0FQTjZab3hj?=
 =?utf-8?B?TWFsYWh1Qm01ZUgvcHRHbm56ODRqWnV0N05UMlU3d2J3WFhxQnUyMFc0WU1S?=
 =?utf-8?B?eG42blVRYlR4Um1BbUxUM1dJbWpZcGZyYWJ2US8vbTVTWU1CT09hMXFXNHIv?=
 =?utf-8?B?R1paWTh2NDh6TWJEOVY2WTJCeTdwdXdObE5ydHNDdUZkeHRiamxKSHV6UEJM?=
 =?utf-8?B?Skl0cjVGZ2llSzRiS1NFZmVzMUFpSDB6RkRYYzNMWHdxUUZDWEY5QTM1T0NK?=
 =?utf-8?B?eDlnTGJjcEp4Tnk2Y0NwcGdlMDYydGJiQXdXMEJ3YzZtNUFFSnU4RkF5VVBh?=
 =?utf-8?B?QmF3dGo4VnVyR1dTM1VocmVBVjBrd2VBMENXRXRJcjBTQmFmQ05KdmhWc2FB?=
 =?utf-8?B?bTZneXQvY3ladHJMODdyczRtYzllOG9wN0VzbTE0WVhHajFLOEl2OUwydS9s?=
 =?utf-8?B?OXZHRC9OZ0NzNmFIYkNGV09ydU9SZGt5ZEY1S0RFUWorSzhlaTkyRkhob083?=
 =?utf-8?B?VVJFSmR3QlhrYjdJNzFDaWNtVHE5SEtzWlNpQ0VBV2FobE5QbzMwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f590127-865f-410a-5c5a-08dec5376ad3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:24:54.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc7VUK/DN+zwFrIa4eYQTjtdG5F7Uns0jryQvRxBmtWeTsAxeoX0IuBDuYYm/XkHxG5K79jtRHU6u/6C6Sg4AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8352
X-purgate-ID: tlsNG-c201ff/1780907097-E139A443-92D2E418/0/0
X-purgate-type: clean
X-purgate-size: 831

Fixes rendering of the generated html.

Fixes: 31d9c88a3857 ("pdx: introduce command line compression toggle")
Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 93c2a73f4ade..1c711fa98086 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2082,7 +2082,7 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
 those not subject to XPTI (`no-xpti`). The feature is used only in case
 INVPCID is supported and not disabled via `invpcid=false`.
 
-### pdx-compress
+### pdx-compress
 > `= <boolean>`
 
 > Default: `true` if CONFIG_PDX_NONE is unset
-- 
2.53.0


