Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F63606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=nbnMyluu
Received: from list by lists.xenproject.org with outflank-mailman.1499723.1696385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV9fA-0002Ss-Er; Sun, 22 Nov 2026 15:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499723.1696385; Sun, 22 Nov 2026 15:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV9fA-0002Sk-Bi; Sun, 22 Nov 2026 15:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1499723;
 Sun, 22 Nov 2026 15:39:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xV9f9-0002Se-CF
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 15:39:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV9f8-00B3IQ-Hm
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 16:39:30 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b030c71-e002-0a2a0a5209dd-0a2a45088f76-32
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 16:39:30 +0100
Received: from [52.101.65.107]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b030cb2-f659-0a2a45080019-3465416b9d48-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 16:39:30 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV2PR03MB8582.eurprd03.prod.outlook.com (2603:10a6:150:ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 15:39:25 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0639.011; Sun, 22 Nov 2026
 15:39:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNGrTcInfM9FwV4LOLRgoK10pZsfjO+ZUpd+b66LzVpcJLJw2xldIgphApimzHLDOzJupEa37P5USWo+x/AI8RuaXEV6+ZH0S9G57e8rir8MCupymRxOanyU9aNdQKaryYT0u5QfGYkoTZK9/9eE0hy+Osbhbf7gY5Uldmw1oL+Q5LBF0XMRatLOCC0SeMfcXdiv6OOWXVne/E/DtcBY4PNMX4v1XkCMBHaLkjjcf3PP898vFysTWdvRR1RCBGZSzmLPCvkFRkQ610aWcT4uJXKVDNBHa9vmS5jMBnUmWrVU2bKNDPvp6Y73HeYeiFXqt/pxrjV8dhopUF8AmqC/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47T7hwS1veXIp8Jjz/YUVvSuy3nS886/uIGznZespVg=;
 b=mLkg4fVIITs+WnQwnMVnvw2b74kVEq/XyGFcVFq0Or4I5Poqr152mDGt7Oo+NOtnd+f6huCs8BufIbOpqarXeLuCI5Z/zO/+q39C87IWXa6lsKuLiioqF1EY6uyuQIXSNHq+9Pqc5j/oheSGi0gvOVvT/FurqYmeneqqaCM3/iatTpXk/uhAUdzNR0x0BR2WXHaGY29fdf8Logp8/WrpDlbW+xQyORRHIV2RFDpe596sMCSi0QDuBi0tGHHy3LKBDglkTg16/WkpGVomsSJKyKazDmvH4SKhggwmikM7ZdtwPfVN/oS/to96n+IesDVpE6PlmIlWPT3fs9AOqJtE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47T7hwS1veXIp8Jjz/YUVvSuy3nS886/uIGznZespVg=;
 b=nbnMyluusSDtjMjkdX47MZJtWt8AHIMFoPnYGOPp9A3GPTiYHY/Fukj89/hkSK+OzTIGPZIpdjAgJIXHZow+0F0O48LENQxohfoRbxfMyU40kQuggFn4JLpgJn6mFPubZvOBji5fwq/SqAzQ8/OvJQXPcRgxkJys3E5abQ3S9Ru7gvBVMPqeWZkLgz0xKv9/Fq0c1kp2sG05jxXzKV6wMvS8HOhg36uyIvD9iTcYLaXLv6+ZEaUpujp5JwR2Z9owPWwJyGYt+UMdsR+/Qe+FS8PE55UxV54qfz1ccl1vKq9zGJZZjqaM6Zp8BcmjKMVi+xON3JJJLJrIe2x6lhpwVQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs/misra: add Directive 4.3 to rules.rst
Thread-Topic: [PATCH] docs/misra: add Directive 4.3 to rules.rst
Thread-Index: AQHdepemWur5zBCsW0WqLCyS8PSGvw==
Date: Sun, 22 Nov 2026 15:39:24 +0000
Message-ID:
 <9981629dc9ea12a2bae9a06b70a4d2daa0556dc3.1795361846.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV2PR03MB8582:EE_
x-ms-office365-filtering-correlation-id: 1bfbd01f-0c9c-4ec6-f771-08df48aec96c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|42112799006|376014|38070700021|10067099003|56012099006|5023799004|11063799006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 tiCJVTlREVQNRLOGLRLDTBIZXruMZIOph8udANsnLAd+ZQiuJgzE+U5sM2dd8meDfBTBprXMKGr1kDk9Y/zjUFsjbj/OzL86bRReNZfZD7z7y/CVBgDcSyflbeqjSHKrcsyAEd/zxZQokCCUVkbk3OYfnicXBHU9pfazNFsdU5iPy72JZtGmrE0Pt2/EbIDlYMQbY+2DCqfPHaxhSxyQ/UDhNkCESe3tVJjBZXrGO1+A0mztsskrjp81jQcnZCzujnpazdhnQA/33/s4DQYR8mSb9vD+uo7KNi9JOHB6ipT1OWAj/mzx1d55RhoU2PXPY6l4rkc6+c6OqrYl0ispwoDN8acv/U0uiA4fQ/31zgUa7hSkDOp8OjsonQeHFe0hgZoMCq2eVe7UA/fCgR2m3SwrO1YLYuH09YKC29EsHekQGOn+bwnAIqivK4gvOKfJO3N4mZgj1twD/L0eNV7+WoYNk1XH7enU6r85C+Gv54gg4eBXIjZYCiYXP9JFCH73lHwWBY6dqJDhNLcVimD98e5PgeAprfWpVI4KJ6uc17wPAmbkoKgIyfXrJ4r000PYoG0Y8unV38gTybFWQDuyx2aBCZRON0d1dpycio4Osc/xryJRiVWoKzCA/pTxrr9O6L0JrzN6zjugVW2AXLUDv3vhm+E/dX6Te9nzOSkfIGsmqrrdS3KLDTzSZy6p7pPvux/mxjkIfyjWvGxkwgo2cJl/jMyN+xX9fSnkvpiUiaw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(42112799006)(376014)(38070700021)(10067099003)(56012099006)(5023799004)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QzdMRkozbXVGbktMRGJneGpHWU9HSjZ5NTl0amN3V2ZINi9scXd2Vm84aXEz?=
 =?utf-8?B?dm5jNTd2TlFVM2s3Y3RCMEM2MWhtLzRWYllwOHd3U2g3enFPWHRlcnIxcEFu?=
 =?utf-8?B?M1hnSEloQTFHcFdwNElLUWhQVEtyOHJYamZnci96MU9BYldIRDdJcGRNNUV4?=
 =?utf-8?B?VWhYWXJ2RGxiWkQ5UmsxVHBIdGJQcFJoUGs2ZXFFZ0FmNzM0Uk4zSXo4NVRZ?=
 =?utf-8?B?YnowTzFoQkx1M2IvT2h6UHcxbkpIRGVnSlhmM1d3dnpSYkx2cUJZV3pHclY3?=
 =?utf-8?B?TFJqVGRVUHJkcTJXSU9IYjBNZVQxUTRvamJmZ3R4RHdRNnlBWkc4QnZnN2hY?=
 =?utf-8?B?bDdYT0VoTEExWjVvTnd6ZTlVYkxwc3lkWi92Y3BGN1pqVkd5dmJIQUplNGZr?=
 =?utf-8?B?RGN1dVlEZUxBVHNlTGMzdTJxOU9SUDFRaTZuRCtYM0RaTGdTY01ibnBpS1pQ?=
 =?utf-8?B?Tjh0SG5HcXZLTXJqcVBtWm4xbHdEL0RYNHIyZTNiRmp2SkhuaWRRcXU4TnZL?=
 =?utf-8?B?ZWdLNmhWb3NjcWRiejlZSEZtdlZBQVdqMGN2UzBVd0hlSTE3dGFrbmVyTGRh?=
 =?utf-8?B?WTRMazJmeWhJVjZHaVNvR3ZnRml4SHlQbG5xSnp0RmxQb0YyVndRK2dRUGxU?=
 =?utf-8?B?N1BVcHdUZUwzOGFWMCtBU29ydmYvaDhZbThBRGoxS1JydjVwQ2tXQUczcXFz?=
 =?utf-8?B?TGVTRDhaNkgxOTllblh2TlZJTDRWTG9jNStiTnJWRmh0SDRhZXZCZlQxRVNy?=
 =?utf-8?B?MVYyQ3hjcHNSdklKOWZmZTJTVlkwb285bFFQcklyWi8rOU1jaUR1WUxtbFNl?=
 =?utf-8?B?QWdCUHJGZEpIOGl1S1Y2WmN3RVdrdGZMNnc1VDdpbnpOVkJmbzVESUllSFdH?=
 =?utf-8?B?ZHB1YUpMSEtPNFNHdENKTjBzNEVHNnBVaWw2SU0zL1R0dzM2alR6Mno3R1dL?=
 =?utf-8?B?NjFBRytGNUxacjhNc3Z1VUpkUW13S0ErcUNCV0dUZUtvSVFMWVhSMTlqQU9a?=
 =?utf-8?B?L2c0SThtbkg5YzB4RW1TdGw1UzBGVVFJSzQ4ZnJxelh1RHl4dFVYL0ZNNFZz?=
 =?utf-8?B?V0FBbXJJc0cvaFZrZ0VXRHFRZ0t4aWF5WmtyVmlLdm80a1YvSzByZFZERDE0?=
 =?utf-8?B?UlpOQngyNHpPRnBWbVM0VStHWVRDMnFCK3oxSVNXbWZpUzAwb0YydE05M2NS?=
 =?utf-8?B?dUJKdHVJSjZwWmVCb3V2QStRVVR3Q3ZxM21KbkRSVlVDSGkxZ25SdmZ0TzNF?=
 =?utf-8?B?bTJIL2JuYjFVTW9PQkQxWllQZnE0UCtjRnJ6MHJlVkRRYVBYK2ZUWWJqOGVQ?=
 =?utf-8?B?OHEvTDZLUEl5QVhCSGpSNzBiVTQ1bkk4WDBlRzZFZ1dISXhwMkVWVDQ1VnBW?=
 =?utf-8?B?TkNIbW5lOWlZK2lRZnA5R0RWMDBudVh0UGFaY0lqRmMxYUxEUTRkNnpiU25x?=
 =?utf-8?B?L0MyN2Z1bGxwVGtMUitZd1ZIbjhPRTh3a0Z3c3g5WDNIMHBzd1J1VTVnN1ND?=
 =?utf-8?B?blU2Nms2YmtyNEhFSWFpMVFtZ2szZzNrNG9iN0JzbXRPRVdPcTEwRzFzdHRO?=
 =?utf-8?B?M2VQYkpNQ0kvbU8yR2FaMjZHdndwSDRUVi8wa2JPUVc1eUMxQlBpZWIxTGZq?=
 =?utf-8?B?NEswU2dINGVadWY2TGh4bHpJemhsYzlWemw3ZDhPczR5YTVIZDN3ZUxiQW84?=
 =?utf-8?B?SXVMVHhFK3I3TWpsQjVSZlJ2WFNpNWRnaVQvUExleVlTeHllRGlyWEU4TG11?=
 =?utf-8?B?Ymk4U0hhRjZmQkdxaEkrdkp5dFRjS2pTNXFDdjRGRDJydlRlVzYvQmxsVGE2?=
 =?utf-8?B?V1dDU3pDVEM4YURRZXU2SGUvaGprNFRkNTZzUnhPNjJmbWNoTTlwcGE5N20y?=
 =?utf-8?B?TWdBK3ExVHBzNnI1bkk0dEhwMXBHaWdxQVQzWHBqbkJZQ3JIOEp1WEtIVFZt?=
 =?utf-8?B?REFWVTNzbzNIOGxYWFpxeDYrTmF5UVBRNEJjRDlYYjlOTmpkaVBIbVpFS1pK?=
 =?utf-8?B?aThvSzIzdkpZMjhKb3JmZGJEa25uSG9GTUlPTUlvd3JROGxsVWFWTTlLcEpH?=
 =?utf-8?B?dzA1ZXdmdjlsS3R1ZjY2Qk4yeDFhVnVmRFdvTHlRMERtUmNHMGF5WHhhRVpV?=
 =?utf-8?B?V3BjaGMycTJzN2hraXJzK2QyRjVtbnNUbDl2SFJ3UDVOSzFyZ0RDNGMzeUx1?=
 =?utf-8?B?OUtud21ZWUpvNEpKMFFrYnNPOStvNklZNmhHZXNqeTlmRDJhWWdSR1J0Q2Zu?=
 =?utf-8?B?Zktha05FNnBJT21TdlQ2eWUzY1VXdkpzODJ0ZkdNYzFWbG1IQW9VYlo3bDhF?=
 =?utf-8?B?VXBncndRRGd1SU9UVXNaQ0IybkQwSGhBejJ0M2cxQ3VFMDdxMDRrQ2dWU3BD?=
 =?utf-8?Q?SA/u5SrgNKgXbzGY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfbd01f-0c9c-4ec6-f771-08df48aec96c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 15:39:25.0269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rM46qxX6ShK3Qnffx34c16YdPUb37HZwLOMZwsHu1PFTk2Q37cYgldw3yTPC8N0ia/UBtxv87v8ghSUoJxj2kHdHLfcGF62AOn1LrboogYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8582
X-purgate-ID: tlsNG-c1860d/1795361970-CF15E87B-EB7BB651/0/0
X-purgate-type: clean
X-purgate-size: 1332
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGlyZWN0aXZlIDQuMyBpcyBhY2NlcHRlZCBhbmQgRUNMQUlSIHJlcG9ydHMgbm8gdmlvbGF0aW9u
cyBmb3IgaXQsDQpyZWNvcmQgaXQgd2l0aCB0aGUgb3RoZXIgZGlyZWN0aXZlcy4NCg0KU2lnbmVk
LW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4N
Ci0tLQ0KIGRvY3MvbWlzcmEvcnVsZXMucnN0IHwgNSArKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvcnVsZXMucnN0IGIvZG9j
cy9taXNyYS9ydWxlcy5yc3QNCmluZGV4IDdlMTkxYTBkNGEuLmU2OTY0OTBjNjEgMTAwNjQ0DQot
LS0gYS9kb2NzL21pc3JhL3J1bGVzLnJzdA0KKysrIGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCkBA
IC01Niw2ICs1NiwxMSBAQCBtYWludGFpbmVycyBpZiB5b3Ugd2FudCB0byBzdWdnZXN0IGEgY2hh
bmdlLg0KICAgICAgICBmYWlsdXJlcyBpcyBkb2N1bWVudGVkIGJ5DQogICAgICAgIGBDLXJ1bnRp
bWUtZmFpbHVyZXMucnN0IDxkb2NzL21pc3JhL0MtcnVudGltZS1mYWlsdXJlcy5yc3Q+YF8NCiAN
CisgICAqIC0gYERpciA0LjMgPGh0dHBzOi8vZ2l0bGFiLmNvbS9NSVNSQS9NSVNSQS1DL01JU1JB
LUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0ZXIvRF8wNF8wMy5jPmBfDQorICAgICAt
IFJlcXVpcmVkDQorICAgICAtIEFzc2VtYmx5IGxhbmd1YWdlIHNoYWxsIGJlIGVuY2Fwc3VsYXRl
ZCBhbmQgaXNvbGF0ZWQNCisgICAgIC0NCisNCiAgICAqIC0gYERpciA0LjcgPGh0dHBzOi8vZ2l0
bGFiLmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9t
YXN0ZXIvRF8wNF8wNy5jPmBfDQogICAgICAtIFJlcXVpcmVkDQogICAgICAtIElmIGEgZnVuY3Rp
b24gcmV0dXJucyBlcnJvciBpbmZvcm1hdGlvbiB0aGVuIHRoYXQgZXJyb3INCi0tIA0KMi40My4w
DQo=

