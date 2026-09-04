Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD4AC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 10:02:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408096.1640804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2QkI-0005NP-N9; Fri, 04 Sep 2026 10:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408096.1640804; Fri, 04 Sep 2026 10:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2QkI-0005NI-Jd; Fri, 04 Sep 2026 10:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1408096;
 Fri, 04 Sep 2026 10:02:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1x2QkH-0005N4-Bg
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:02:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2QkG-003qXy-KM
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:02:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a9a9712-e002-0a2a0a5209dd-0a2a4504c95c-42
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:02:04 +0200
Received: from [40.107.130.92]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a9a9719-b57f-0a2a45040019-286b825cfccb-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:02:01 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB9PR03MB7626.eurprd03.prod.outlook.com (2603:10a6:10:2bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 10:01:58 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:01:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDFFr5AYkEVn5UZY4BCRZ/oUEdAPWByXtDmlIA0y1jo3hzr0SjDS+D2ZIIVYdtAHTZkNklTBIL6+x6O307VXslOVhFFKAXfRVtYUbU8Ob0Sw0baQ5b3k09etmv07p5kGzOkBQTiLMFQBqWwj4rkS9UiR7sgB4JKvv9OBi+BYOs/8CjKN0uOoIbRyxwBpwnUDPqZ489QSRc5LfachVomfss9sqMkX/GtF9dGzH5TS/gDDEwOfi4bE/AO/TGuhGfiu4fZeFLFgMPSErpxNwdu/pVpghwY/g/Zp9Bk0bHx1+np8e587Sref1JoFSGnuwslTUikSPp5PubZ3HhnLOUyr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWH369CGsQvS0nR81kZ/CVOnsZJb88aK0T8wC501PWA=;
 b=kxuXJ6Y/sad5a5hkBA0k24qCHaEtjDdwvyb6whZ4r8Dnw/NtKsuv9ugy0RZAO2fJlG3fIZ7pm8qL9OAJDPQgdYT/L4X7/PCFqnwYa9HjWKOs/7NrbWRYqC8LIXRQBv888aJxWrm3u03h/+ZpspinjcAEvRK/ZCPrY+TkPGCtM7lH+B0Gj4kWs9eE51HO+L5zPAhX2SNnKwjD56/RAH9TUgo0mGLToB8fIm/W6jhCMiIvB5F3k9y4Yb6UwItQ7cDrZCz+jFyTgWDihXHzD4aiUuITHLCFmwfLXtrKuHl2ytrenZ0dwqyYdbKEXqBPuRc6fC2fKTIXBM945rTcLMBo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWH369CGsQvS0nR81kZ/CVOnsZJb88aK0T8wC501PWA=;
 b=R2jiT5i6sEC+D1IVWLWghYjtw6oSPRkIwSmZVMLkJeO8B6tW/xQ9k3rXAWdCj3OOEe92Qz6G80E/qZGCdYqJAys4lqj+WzhQg2Bik7o4dz/2p2GmZxMsqL21ox7U46qZ/7jE7vV2+AV0iu0RqHOJELAdOs4bIT1AcHqtjGz0Xf5B1K/hIZLiAS/zNpJtMpGYxrvytZ+NtcNY3QcHQu54HSD2ZsF5OIihR9+323a4q31LdoF+FaI0tqeQ/eMmp0UjZM53VqkBnlegNMewiupeyztDd13u9XYxwr2SsClld5H8zVEQ34Zu+Qz5OiHGMaaR4v3S7oO3uslrI5OsqocsGw==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 2/2] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v1 2/2] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdNgfAHPmcI5IBhUGZU0o2oDVW1La3+D2AgAZEiwA=
Date: Fri, 4 Sep 2026 10:01:58 +0000
Message-ID: <4839ad1a-f75d-4fc2-90fc-6feea58e7ef6@epam.com>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <e97ab666be0d667dc823c3d881ac9ed76267a7a5.1787821757.git.Sergiy_Kibrik@epam.com>
 <d98bff6b-c32c-4c52-bbc9-cf88e4be6c3f@citrix.com>
In-Reply-To: <d98bff6b-c32c-4c52-bbc9-cf88e4be6c3f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|DB9PR03MB7626:EE_
x-ms-office365-filtering-correlation-id: 82614880-3af5-43b9-aa50-08df0a6b8f07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|6133799003|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 P99fDfVDaMe4gMFul3mDr81M0iSMuq0+7r8XQsZvi2a/pXc9RuE2v+qDE171NfB+WK5q3mSivOMA2CAugRNPbw6/cuySDvrPIiIbiPNY9t9AqtgVfyU2rA3SZJLfvxHgsmxkuNxMlOQWT8Dpk9TEGGlD9wZJ45tAT1VdEmaFbn/Ejlu2t0tJvWnurRMe5YTx0eIAW5zKn0jPvft5kSIYD8j6mafEZ2avBf0Yv+dyqfkrF/zeEHtp1F00jKLzMZf9uFugS9BMv2p7EFBQfLNayP1NFc1h7KHPsqe1+RnrugSmKywi99Y0LHBYtm98b8GP41YN8oojQuC28kA6XjPfvURdDa+QMS6zLQkoleimeH2/YA2Vw7J3p82ZNidmXXL0OkPdOl4s3ivI+PEq4Amk4Y+Ia4FBTnVRW/G21qznb69KQE+L2Gw/eWOkcaeor60OWYmiBqrJtDlVgU7zvN49/9ox1H5uNy3a6ZlBqmSYjGgg1IvBBB1Cvjdo0huBR22jfULB/PHl4VbHq/pmXa1IX579m1lzWrJN5rZL0bXpthr0ZXyVEVEPR4tHqGUoKYFS7AqjEVYQW3Ika8Sb8CBXff2pPfpYMtqhhR2vPa7KA0T88UQiWcjjChRHkvPwP2wO7FmSdcJuNs0Ss5ooL/FlMSpKeV+DdVumslMTQuNYIjruII/5qLDhYtn6bAtEGm7mFQCMOyud3kPnjigtzYBAm4HzgKeTmzu+KSjsX4ScpTE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RS90cGppdDlCa3Q3bXI4NkhpL3FtbFB1NCtzcXVlY1hXTmQ1cWpxS1FFcTNw?=
 =?utf-8?B?ek5HVlU0emtmYjhqS3lKUkJWdFRyQ3o3WGtGcVhzZnU3V1Y2YUxPem5DMTMz?=
 =?utf-8?B?ZVE4NUdIRXg4OEhkcXdTUEg5cThzMC9LMC95QnBuQ3FOTy9UVE9uOTM1R0lr?=
 =?utf-8?B?MCtIbkZDSThncWRmR0lvOEZlcEd4Y2NYNTdhR0NjOGg0WlJVVlNLanBrZmsr?=
 =?utf-8?B?Rll1NXVXaDJVWWRjaUl3WCtoU2NsVGh6M3NvdUY5QnFvblFXTGt4UmxyYVBo?=
 =?utf-8?B?bTZUK3djN2IvNXQrM1lXc1RSdEVQd3hHSm9NaWlZL0R5NjFHNmJoNUhFRysw?=
 =?utf-8?B?c2JyZEwveTU5WFhVVy91b2FYaVBMRnViNHkyQ3NFeitWbVg2dWpKQWRmUVJp?=
 =?utf-8?B?dDF1d1FPL1hQNXdzM1VqUWQrSG1pdDRkWVJERzJOMUNpUUVHOWdXNmpKcDBT?=
 =?utf-8?B?S0kwVjBPdlN4Yi9LeFEyRFVwS3FNaE4zR1VtekdxUUZoUHY0ZlhtNjdKQm1Z?=
 =?utf-8?B?K09NTk5lRUlCdDZZQVd1RHVVNTZTbXM0NFNHMGg5Zk9MTWxOQit1Nzd5OU5q?=
 =?utf-8?B?VGs3ZEY4MGJqQWk4UmtOdEtIWFo5dlptS29ydmt6VUZoajZvZ0FsbUlUVmZh?=
 =?utf-8?B?dFRLRHVJSWVkVW93cWFBbVI1Vnc5Wnp3Z2I2OHhhdW44V1dZK2VmZE9FU1NL?=
 =?utf-8?B?WlZGckJXTzdZM05Dc0wyRmJGTzQ3cnYyR0o3OTh1WDk1S0U5UjE3VDVoc0xK?=
 =?utf-8?B?M2ZaOUpRcWljWDNGS0treFRmTG1QV3FybEQ3ZE00WDNsMTIrbnpGc0l0d01l?=
 =?utf-8?B?MHRUaTF0VWNMKzJ0UGRzRG43NmN6N3l5SjZvVkdmaHQ3bUJraCtUOUZOR3Ax?=
 =?utf-8?B?T2I3NEVFNmVWanV1eEFCQ0kyOTR3NjJ6NVdzMTVubWRraW93STlrZnRYeUVR?=
 =?utf-8?B?Y1l6NXUybGxYWXlRV0VvRFc3a0NPZEhCUnFsRDRidXM3UytFeG5iM3dHYmFN?=
 =?utf-8?B?dXRqY0R3cXQ2TmxRZk9iK2VPdHZaN3YybVdTcmxMbGlxRHN5a3J0M2dKSUp2?=
 =?utf-8?B?dUVidVNGT0lWT2p4bFF3eGJWaU9CUDIxQ0p6d1RORFpTUk5lMUVFWFl2bFda?=
 =?utf-8?B?Y2x6cFV5bm9RQU50cDY4QUQ0ZE5IRjZZc0dQZGt4eUZ2NVRWUGcxeDVDcGEx?=
 =?utf-8?B?bEowWGlTaTg1L1Z0cEczK3VkdzM1K1ZXT3ZmYUNvdHFMSGpZUzVlNkFoMVpm?=
 =?utf-8?B?SHgyamx1S1MreDNXWTR6TndyakN1T2hvL0w4UHVVZ0l1NVZwbUF3aEJKTWNu?=
 =?utf-8?B?N29FdWw5NmM1V3dRWEdBWlMzQ2REVkFPZVZwMVpldkF0azhTM2RxdE5kLzBs?=
 =?utf-8?B?Nk1pQ0dqZ2E2VWRxUG5ja3dLYnBWYWpmVVM1eThsZWNDc1hmSko0dlczdkZ1?=
 =?utf-8?B?cjZkZDVzeU8zeTFKcUJEa0J4YVl4WDRVdXBkOGU0L2svNkJISmJyTElXaUFJ?=
 =?utf-8?B?ZG1oeTdoVUF3anByWnp2S3BRS3BxRXNwQXYvbU96R2hjODRjT3gvK2wrZDlm?=
 =?utf-8?B?eWtDZmhVaUtySENvK1NBMGMxeGNqa2FTOU9vN0cwbzNSMGlSTjZkZVJCSFhx?=
 =?utf-8?B?QWxJVGVuRUJiRkZ0U0x4K1dZVUlwbitPM0NaWm9XcmlQU2dlUkpWUUlnT2lG?=
 =?utf-8?B?ZWx2aHoxSHBKYysyc3NaOGw0NFJRTTJ6b2JYTGhFbTh3RUlEd0VPS1RnS2xR?=
 =?utf-8?B?MTlReThtd1ROU01WWDYxZnlKcnNNVVdRNUJKdHNDOGhtQXRmNzVrVSt5Zm9U?=
 =?utf-8?B?Uk16aTlaQXBjcUkyeitEM2UxL0U0UzNSQnZrRlZtbjBwZ2ZXanNodGdtUVJk?=
 =?utf-8?B?Nmp1UXh6VzlXQVJHcG1JRmR6TlhhWjlSSExDWFpRbkFhNlRDM0Z2UVZwVE9X?=
 =?utf-8?B?ZEpoUGlsb2k3KzBEUm9IV3dENnBjMDkzUWZHTmVsVzhxanJZeGFLZmRKd2ZY?=
 =?utf-8?B?dXQvYVROY1ZDa3RNTGY1RzRCb3pNMU5kVjc5U2NwdlFheWdxem5Od0pyaWcy?=
 =?utf-8?B?SUxFN2JaK3E0NTF6d3VqS1JxZVY0aWxUR0VyUUpldEtaSTI1ZHkwTkVNdU9B?=
 =?utf-8?B?UkZtbS80dFBDZzhlcGcxcFNkWndYYVMxOWE5V21YVFpEaWFXYU5xL1NuVGIr?=
 =?utf-8?B?QVVmZnNKM1VDdnhwQmdiU2ZMUCtTUHpjWVdjMmxEaHI2Nk1kZko3Q1k2b1FO?=
 =?utf-8?B?NWZwT0E3OFNCaDFZWXdZTEM5RGJ1dDBiQVBxTVZvTUR3MGtaRXlBUWJ2VFhr?=
 =?utf-8?B?L3BRQWlRS0VkOVZCZWtBM090aDdGSDNUVE5keWFIczR6MkJrdWxQWmUzeGdh?=
 =?utf-8?Q?Dc1XCLKKFFD/5RcI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B51CFA91BC2DF49BCC147FED3F01B92@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82614880-3af5-43b9-aa50-08df0a6b8f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 10:01:58.7254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eH8MoPvKJAlD8YKHuR7mfZ+hfYZ1bEaqDjIl7lZeRnqJete1BCt3hZUHvv8nnz+1uQlqfH5IN1iygcM/esFjzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7626
X-purgate-ID: tlsNG-ebf023/1788516123-C36C2B50-6DD0866B/0/0
X-purgate-type: clean
X-purgate-size: 768

T24gOC8zMS8yNiAxMzoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVG8gdGhpcyBzcGVjaWZp
Y2FsbHksIEknbSBub3Qgc3VyZSBzZWN1cml0eV9jb250ZXh0X3RvX3NpZCgpIGhhbmRpbmcgb3V0
DQo+IFNFQ0lOSVRTSURfWEVOIGlmIHlvdSBoYXBwZW4gdG8gY2FsbCBpdCB0b28gZWFybHkgaXMg
dGhlIHdpc2VzdA0KPiBiZWhhdmlvdXIuwqAgSXQncyBjdXJyZW50IGNhbGwtY2hhaW4gaGFzIGFu
IGVhcmxpZXIgY2hlY2sgd2hpY2ggSSB0aGluaw0KPiBleGNsdWRlcyB0aGlzIGZyb20gb2NjdXJy
aW5nLg0KDQpJdCdzIG9ubHkgY2FsbC1jaGFpbiBpcyBpbiBGTEFTS19DT05URVhUX1RPX1NJRCB4
c21fb3AgaGFuZGxpbmcsIGFuZCBpdCANCmRvZXMgcmV0dXJuIFNFQ0lOSVRTSURfWEVOIHRvIHRv
b2xzdGFjayBpZiBjYWxsZWQgYmVmb3JlIHBvbGljeSBpcyANCmxvYWRlZCAoSSd2ZSB0cmllZCBi
b290aW5nIHdpdGggZmxhc2s9bGF0ZSkuDQoNCkJ1dCB3aGF0J3MgdGhlIHBvaW50IG9mIGZhbGxp
bmcgYmFjayB0byBTRUNJTklUU0lEX1hFTiBhbnl3YXk/DQoNCiAgLVNlcmdpeQ==

