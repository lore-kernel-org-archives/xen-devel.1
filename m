Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B7606A335
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=qxVYeWB6
Received: from list by lists.xenproject.org with outflank-mailman.1491498.1692275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT2Ji-0003d0-GQ; Mon, 16 Nov 2026 19:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491498.1692275; Mon, 16 Nov 2026 19:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT2Ji-0003co-Da; Mon, 16 Nov 2026 19:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1491498;
 Mon, 16 Nov 2026 19:24:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT2Jh-0003cZ-Sp
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 19:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT2Jh-007hbT-9J
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 20:24:37 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afb5838-e002-0a2a0a5209dd-0a2a450aaac8-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 20:24:37 +0100
Received: from [52.101.66.103]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afb5874-f2d2-0a2a450a0019-34654267a1af-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 20:24:37 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AS8PR03MB7637.eurprd03.prod.outlook.com
 (2603:10a6:20b:345::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 19:24:35 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 19:24:35 +0000
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
 b=jDDF7GG9UMQap+26Zm160s8JxHpEz0os1g2o9ZKOL8RQ3T1LsuKDiaqraSB8v6BOjWB4wUR7kQdJM9XKfBqcJCLaElhlizR8dBnFifakQ0uny9quL/vBLvf1md8nq9IprrXliYt+61yTDLijVhnm5ypJfvIt7SC2y9n8QWo6det6WHH+tKGkSaQCEK8vefxfPBJy3BWLX4d2vEJsdqMH9LkUn/lskQZjxgEoQmDJGX7YgqYEalVIEH3DTxM6b041hv7gViOMXHXd539iXLND11Y6i7J3HJkK4dU6yGpxKp4tXEhR82S/yH6JgHPWveI+jf2kGNXAVIzgi5JpBQfQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juM5dmLD01EZkbD8MHLMChMKBIDS5WC0KtpuX+vfFb8=;
 b=yN8flXQj5h1Jdk68vWWQ4rbgJehBBBiysv1nLbPILkY6Ff5mLZen1ViRry9GJ31uvoJQjBQw2ZLbALVkUq94V+t/g6Nu033pEZKSryUEBwp62Q/WXIVB4cap1/opRgb73wkCuQCxtx1CxFznuykhDeZOIOSnlwB6AdLO5ZPsUEkNwaO7pE91bvq7myNsDAoC5jU7g4jENsO/mHol0T2h82aUwNF8CqNIhCH9zp7Td7BmlKNOnPX4fnrb7VRpMviUHMwyVY2LLc7w+TCS0obMEJOW9DriThl7rVoeb1OAL9fqg2feFAiSbI5ObBaDZr9FFctxd2FkH45xxn0lxAKRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juM5dmLD01EZkbD8MHLMChMKBIDS5WC0KtpuX+vfFb8=;
 b=qxVYeWB6ZhlS/7xyzu5jQo0GVp6zlHuoZVk1RBNQpxuYwhhdc8JSZofafT9SHdjR2W8jS+KkUlOQDet29G99ajt+MJUYj2g8N1+SHjfcpDr2+BuDPNXa4eYiCXSIvnQb85FwDHtMQplhbETQcV0fKpLwmVRrA4Zcmc5mWgTQK6kdSNCUmvgqEvfCV+ge1BW1IVMPqdjD2RstDxfuWVgkisc/jx+TfH58xqKbC6rMB6qy62ITU1p/zg6Hk/wLRl4wNzu/xrV5WZ7AEVXdcPPLIQWO4KsFn+ICL1lny8V4bQ2Ys7UrzQR07WuhLnBpStE7pBeDYG+aCAyTVOVmZNQ1Eg==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] symbols: make KSYM_NAME_LEN include the trailing NUL
Thread-Topic: [PATCH v2 1/2] symbols: make KSYM_NAME_LEN include the trailing
 NUL
Thread-Index: AQHddgAd1bEPPCGwdE6lH+O+/yfQ/g==
Date: Mon, 16 Nov 2026 19:24:35 +0000
Message-ID:
 <3faab8b0e9c7d66ce8222fce65a3ab4c7c65a242.1794852738.git.mykola_kvach@epam.com>
References: <cover.1794852738.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1794852738.git.mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|AS8PR03MB7637:EE_
x-ms-office365-filtering-correlation-id: 761efba8-edcd-466f-ba0a-08df44173fcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|11063799006|10067099003|261022105027099003|261026140227099003|261022113327099003|261028144727099003|261026121527099003|261022115727099003|261021121427099003|56012099006|261009223027099003|261102123227099003|261021123027099003|261021130227099003|38070700021;
x-microsoft-antispam-message-info:
 h4IH+z7MtHwK6USKsSjeF2JzvCB4qbMhAGCCnpvYFDf2JXzHASEsXs6X6JUYwZMB61/SJviz29dvBfuj4hR3gqdvBSIyqS8sCBZkmg+UQNn2y/kytHmL+ECgJvfMgwJ5hcRSFpBfEtRpsF9nmvhxW9te/Ea7BaDqw15uuwwNKhgUqWSHYZc5+aos3D6zcwruB52EBgjS8rhoyqRwpi+EUG++cH+mnnWeozOdcps69fmGC92fKagS/TksnCq1DCdf13CxMLY2zR68w32mxzwtRS9pwpzDRiJBPcpfPIXoYJaaB3JGn8U+rfJx65kkEIwEUNPbpxZXxfGjVnpTseLF9csDNLG8qLrSAQyu20NV5nDOJJipvY36kC/khoetZnKtTJMZyaZMk1j3jkkiuNXLJsCIws1BZ1XXoX1m9ojNFM6k2+iaJ9aYUWe01e4MCIh4Nx5RGOc/FG95Nx7MRFN4JQf7hIMAD3KfJBEMwzNddcx7LFvtCmccmPt0T3aoguenzYkQzpGsmQeQTmZza7Db34Ho3ZnTGmwkcrUj69Jd+/B+0Q/yWWWISE9RHIhOsCaSVRx/+YYp3Dgl8g8YpabWueO8CeG5gvU5wMWiL3WJS2xoRjEF84IKTzxhEnJ8jJG9fMfpBdKeq+I/5KaiFRO98G/qT5i0oKWFn/nZBq+weFeUyw5gtjjaRjBls4AfUK3Pos12jVs4DU3HFqyWYsSaw/EssGyRE+b967+30QbaM9I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(10067099003)(261022105027099003)(261026140227099003)(261022113327099003)(261028144727099003)(261026121527099003)(261022115727099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261021123027099003)(261021130227099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGlKNWhIYnEzaFdXVGdaKzhFQXgrYWYvVGd6eXlPME05OEh2ZStiRWg3ekpx?=
 =?utf-8?B?eXN1cmtoQ0NZeUs1clo1UWNsUHorQUtZSVJPVE1iL1ZtYTNvYXF5a1d0dXVX?=
 =?utf-8?B?M2E2QW51R2praWZpZFVEdU9BNDFCaWxFUit4OWFqellhVDJxeTRoK1paMndn?=
 =?utf-8?B?dGxzRnNFakJCa3I5UEh4THlCTkZuME1seVpiMGthSzZXMFI2QmI4NnFiNUFx?=
 =?utf-8?B?bHk4NC9ibVgva1pWUlpjWEZxckNnQkpTRXkzd3RoeHdRRHZaTHJtYjE0d04v?=
 =?utf-8?B?UzV4c2JoRU5iMzVHaXYrRGpMNVBzWXMxNzF2YXEzd3FqeU54OWFZdkQzMWpa?=
 =?utf-8?B?VElJUnNEaHhIM1lMd3ZuMHhZc24wYXFsKzBuWDZQUzN2R1hhdkUrdFB1LzNz?=
 =?utf-8?B?dFd0cWNsM1JqK0FWWUlGdm5QeXFGUHgyOTByT1YrRjFjQ1BuazhMMnZPNUta?=
 =?utf-8?B?MGFNVFJhdDV6RWdFNHRLd2Y3d3o0Rkd6d044Q0lmUFlhQW0rZFQxd0NLU296?=
 =?utf-8?B?eERXb1kxKzdyck5mMzlyUUVRamVoTTRheXQrUW52MUNTWE1BQ1dNekZMVzJm?=
 =?utf-8?B?bWtDYTVUOU5paFNYbFB5cDdDVXFDUFJuNThEMHBkYmU0TjRYMmxNRmRtS3E2?=
 =?utf-8?B?RmZnWGpDTFg2cGl4b0g4L3Q2djhpOURVaFd5eVR4UUpWTzc5WmVoTmhLL1VD?=
 =?utf-8?B?UHZsdTFqalo2V28wQ085QkZhdUZRUEROanFaMzBWc3hjOWZTNEVJMms2UERs?=
 =?utf-8?B?OUk3YUNzTG5HRGtoaVBHVm1PZ0RxaExFUDVDdkVaN1p0MXVmc2RjZXNDQ205?=
 =?utf-8?B?NmpCQWdiNkpSb2NCb3lQZlNzRXYzOUQ5OWtPT3JvaVVINlZHN1lBNVFCcW5q?=
 =?utf-8?B?bDJDV0M5aUhTa1NQaHV1eHRSK3NRQndIM1lRZGx4Sk5GeGlZakxQWnlHZk9p?=
 =?utf-8?B?Si83aVR5bTJVb08vamloUWFTdHV4L3BoNU5kQnp6aUE3bXVhWDZzYW9OcFRw?=
 =?utf-8?B?TFBydy9DdDhZQ09TTGFaUGFvNmtLemxMcUxqMDMvVTZ3QzNEYnBWbVdJUUJl?=
 =?utf-8?B?ZTkyVEZKb3NrZlY3L3lXdVZOd3VSM0NET1pYTkx4MFpOVUgwTVIzNXprUDNW?=
 =?utf-8?B?U1oveU9YUWZlSmtpU1Y5c2NZQ1FGTVBsMTVIMnBuNmt3ZERyUUx0YUdONFFh?=
 =?utf-8?B?bDk5Y3ozVHFZd3dUY2l6WkJ2aW9MMEN3d1pFMXZlTEkzQlhjWkdWV2g5Z0Ju?=
 =?utf-8?B?TkVkWkxPUGprWW9PWTdVWFFneWwwaFlWY2ZmTXBQMGdVQ0p3Snhrb2R4OHVG?=
 =?utf-8?B?Tktwc0N5UGJSYzIrL1BQZ0xXR2hKN05rUmFwZUsrWWI0REVEMWhEcDU4WXhx?=
 =?utf-8?B?QVpKb05VSGVIeHdld01DY01nWldmc3FtTWFnNGh5ZnFOcEFvSFk3dVFCWnZu?=
 =?utf-8?B?amFaaXFtaW53VTRZRW16R2lndmtMSmw2eWJzVXBNTDhkdHQreWlFSHNWZnl5?=
 =?utf-8?B?bEo5ZStuMHhCWXhnS2tEVlA0S0pUY2RDcERjTUlzbXFRSXByT0hLZmt6Ylc5?=
 =?utf-8?B?cmQvZ0tMK2lYeXVTZnY3SXNNSjg3ZlNSdHZNRURnQ0QybjRVRlI3a2hYL09M?=
 =?utf-8?B?bXJJUkZpTm4xWlE4akRLQWUxbVJlVWpIaW5Vekg2Q0FvRkRWTWtNNjZxYXZG?=
 =?utf-8?B?ZUgxdnRwUk91cVdRRllBTmZiZjZtTEE2M2N3KytOMktJRHNyYTcvUjNhOWRu?=
 =?utf-8?B?cmJ2Q2UrdTNHbGovM2JPTGNKWEJ1cHdNVWtYck1yVHRVUVFxRmZ4OUZYQjhk?=
 =?utf-8?B?TEF6aEZkaHB2RkhNV1JjTTUrR3pCTlZBdHhCWEU2YVpEWEwzNXlKdUpLSDRC?=
 =?utf-8?B?MjFMNlhsbDlYWmk4Ty9wRlBodkk4L3Z0UHJZUjRNVytUUjlmdjhwOFV4S08x?=
 =?utf-8?B?bDVnekhvK2NDSTB1R0I1L2dybGpVMGNuSWM2NnZKaUx0NTZKQW1kSUszemd3?=
 =?utf-8?B?ekgrYWtBQ1RmSHF0R2gwZkpxY3hja2U3MzZBcDdhb1ArUklobGg1M2VhZkxV?=
 =?utf-8?B?VzNkYmlCbWliS1VYNjJIL2hucUYxOThhVnNWM29qU1dJTUF3Y2tLb0g2c2dh?=
 =?utf-8?B?SUl0R2o1bC9QNnlvZlRGdGhZMDVVUDlPSUc5RG1pWVpJaTFpZ3hIY041M1NF?=
 =?utf-8?B?K3VwWWtKREdWV1FNMmM3aE5UbUVmSmlRbitUV0IzUkxpckpwNlcwbXllRm0v?=
 =?utf-8?B?V3M4TWlHWXp4NGg1MnVQemR0czhDNlBZQVVxa0taRS9RdE1pYTI2REVnbFBp?=
 =?utf-8?Q?CeU61kb0K3MszhNilM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761efba8-edcd-466f-ba0a-08df44173fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 19:24:35.5113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SY44o08NyfCRzzOjFdh30L/cK2MqBvy/zOEWL+t/JB9dovrVG81UlWXCEbhQA32NhhYkUnxIaEAJ5gZ7iMk0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7637
X-purgate-ID: tlsNG-4011c0/1794857077-59FDECFC-245EAFE9/0/0
X-purgate-type: clean
X-purgate-size: 6484
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

d3JpdGVfc3JjKCkgZXhwYW5kcyBjb21wcmVzc2lvbiB0b2tlbnMgaW50byBhIDEyOC1ieXRlIGJ1
ZmZlci4gQSB0b2tlbg0KY2FuIGNvbnRhaW4gdGhlIHR5cGUgYnl0ZSBhbmQgYSB2YWxpZCAxMjct
Ynl0ZSBzeW1ib2wgbmFtZSwgbGVhdmluZyBubw0Kc3BhY2UgZm9yIHRoZSBOVUwgd3JpdHRlbiBi
eSBleHBhbmRfc3ltYm9sKCkuDQoNCk1ha2UgS1NZTV9OQU1FX0xFTiBpbmNsdWRlIHRoZSB0ZXJt
aW5hdGluZyBOVUwsIGZvbGxvd2luZyBMaW51eCBjb21taXQNCjkyODFhY2VhNmEzNiAoImthbGxz
eW1zOiBtYWtlIEtTWU1fTkFNRV9MRU4gaW5jbHVkZSBzcGFjZSBmb3IgdHJhaWxpbmcNCidcMCci
KS4gU2V0IGl0IHRvIDEyOCBhbmQgYWRqdXN0IHRoZSBydW50aW1lIHVzZXJzIHRvIGtlZXAgdGhl
aXIgYnVmZmVycw0KYXQgMTI4IGJ5dGVzLg0KDQp3cml0ZV9zcmMoKSBrZWVwcyBhbiBleHRyYSBi
eXRlIGZvciB0aGUgdHlwZSwgc28gaXRzIGJ1ZmZlciBncm93cyB0bw0KdGhlIHJlcXVpcmVkIDEy
OSBieXRlcyB3aXRob3V0IGNoYW5naW5nIHRoZSBidWZmZXIgZGVjbGFyYXRpb24uDQoNCmxpdmVw
YXRjaC5jIHBhc3NlcyBLU1lNX05BTUVfTEVOIHRvIHN0cmxjcHkoKSwgd2hpY2ggbm93IHByZXNl
cnZlcyB1cCB0bw0KMTI3IGNoYXJhY3RlcnMgaW5zdGVhZCBvZiAxMjYuDQoNCldpdGggLS1hbGwt
c3ltYm9scyBhbmQgNjQgaWRlbnRpY2FsIDEyNy1ieXRlIG5hbWVzIG9mIHR5cGUgVCwgQVNhbiBy
ZXBvcnRzDQphIHN0YWNrLWJ1ZmZlci1vdmVyZmxvdy4gVGhlIGZpeGVkIHRvb2wgcGFzc2VzIHRo
aXMgY2FzZSB1bmRlciBBU2FuL1VCU2FuLg0KDQpBc3Npc3RlZC1ieTogQ29kZXg6R1BULTYuMQ0K
U2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQotLS0N
CkNoYW5nZXMgaW4gdjI6DQotIFByZXZpb3VzbHkgcGF0Y2ggMjsgbW92ZSBpdCBiZWZvcmUgdGhl
IG5hbWUtbGVuZ3RoIGNoZWNrIHNvIHRoYXQgY2hlY2sNCiAgdXNlcyB0aGUgZmluYWwgS1NZTV9O
QU1FX0xFTiBjb252ZW50aW9uIGZyb20gdGhlIHN0YXJ0Lg0KLSBNYWtlIEtTWU1fTkFNRV9MRU4g
aW5jbHVkZSB0aGUgdHJhaWxpbmcgTlVMLCBmb2xsb3dpbmcgTGludXggKEphbikuDQotIFNldCBL
U1lNX05BTUVfTEVOIHRvIDEyOCBhbmQgdXBkYXRlIHRoZSBydW50aW1lIHVzZXJzLCBwcmVzZXJ2
aW5nDQogIHRoZWlyIDEyOC1ieXRlIGJ1ZmZlcnMuDQotIFVzZSBLU1lNX05BTUVfTEVOICsgMSBm
b3IgdGhlIHRva2VuIGJ1ZmZlciwga2VlcGluZyBpdCBhdCAxMjkgYnl0ZXMuDQotIERyb3AgdGhl
IGNsYWltIHRoYXQgdGhlIG92ZXJmbG93IG9ubHkgb2NjdXJzIHdpdGggdmVyeSBzbWFsbCBzeW1i
b2wNCiAgdGFibGVzLg0KDQogeGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jIHwgMiAr
LQ0KIHhlbi9jb21tb24vc3ltYm9scy5jICAgICAgICAgICAgICB8IDYgKysrLS0tDQogeGVuL2Nv
bW1vbi92c3ByaW50Zi5jICAgICAgICAgICAgIHwgMiArLQ0KIHhlbi9pbmNsdWRlL3hlbi9zeW1i
b2xzLmggICAgICAgICB8IDMgKystDQogeGVuL3Rvb2xzL3N5bWJvbHMuYyAgICAgICAgICAgICAg
IHwgMyArKy0NCiA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYyBiL3hl
bi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYw0KaW5kZXggMGYzYzc5MWZjMi4uMTcwOTZi
MTQ4NSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYw0KKysr
IGIveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQpAQCAtODkyLDcgKzg5Miw3IEBA
IHJldF90IGRvX3BsYXRmb3JtX29wKA0KIA0KICAgICBjYXNlIFhFTlBGX2dldF9zeW1ib2w6DQog
ICAgIHsNCi0gICAgICAgIHN0YXRpYyBjaGFyIG5hbWVbS1NZTV9OQU1FX0xFTiArIDFdOyAvKiBw
cm90ZWN0ZWQgYnkgeGVucGZfbG9jayAqLw0KKyAgICAgICAgc3RhdGljIGNoYXIgbmFtZVtLU1lN
X05BTUVfTEVOXTsgLyogcHJvdGVjdGVkIGJ5IHhlbnBmX2xvY2sgKi8NCiAgICAgICAgIFhFTl9H
VUVTVF9IQU5ETEUoY2hhcikgbmFtZWg7DQogICAgICAgICB1aW50MzJfdCBuYW1lbGVuLCBjb3B5
bGVuOw0KICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOw0KZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc3ltYm9scy5jIGIveGVuL2NvbW1vbi9zeW1ib2xzLmMNCmluZGV4IDYxYWY3Nzk3OWQuLmJh
OGUzMWM4YzYgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL3N5bWJvbHMuYw0KKysrIGIveGVuL2Nv
bW1vbi9zeW1ib2xzLmMNCkBAIC0xMTMsNyArMTEzLDcgQEAgY29uc3QgY2hhciAqc3ltYm9sc19s
b29rdXAodW5zaWduZWQgbG9uZyBhZGRyLA0KICAgICB1bnNpZ25lZCBsb25nIHN5bWJvbF9lbmQg
PSAwOw0KICAgICBjb25zdCBzdHJ1Y3QgdmlydHVhbF9yZWdpb24gKnJlZ2lvbjsNCiANCi0gICAg
bmFtZWJ1ZltLU1lNX05BTUVfTEVOXSA9IDA7DQorICAgIG5hbWVidWZbS1NZTV9OQU1FX0xFTiAt
IDFdID0gMDsNCiAgICAgbmFtZWJ1ZlswXSA9IDA7DQogDQogICAgIHJlZ2lvbiA9IGZpbmRfdGV4
dF9yZWdpb24oYWRkcik7DQpAQCAtMjQ3LDcgKzI0Nyw3IEBAIGludCB4ZW5zeW1zX3JlYWQodWlu
dDMyX3QgKnN5bW51bSwgY2hhciAqdHlwZSwNCiANCiB1bnNpZ25lZCBsb25nIHN5bWJvbHNfbG9v
a3VwX2J5X25hbWUoY29uc3QgY2hhciAqc3ltbmFtZSkNCiB7DQotICAgIGNoYXIgbmFtZVtLU1lN
X05BTUVfTEVOICsgMV07DQorICAgIGNoYXIgbmFtZVtLU1lNX05BTUVfTEVOXTsNCiAjaWZkZWYg
Q09ORklHX0ZBU1RfU1lNQk9MX0xPT0tVUA0KICAgICB1bnNpZ25lZCBsb25nIGxvdywgaGlnaDsN
CiAjZWxzZQ0KQEAgLTI5OSw3ICsyOTksNyBAQCB1bnNpZ25lZCBsb25nIHN5bWJvbHNfbG9va3Vw
X2J5X25hbWUoY29uc3QgY2hhciAqc3ltbmFtZSkNCiANCiBzdGF0aWMgdm9pZCBfX2luaXQgdGVz
dF9sb29rdXAodW5zaWduZWQgbG9uZyBhZGRyLCBjb25zdCBjaGFyICpleHBlY3RlZCkNCiB7DQot
ICAgIGNoYXIgYnVmW0tTWU1fTkFNRV9MRU4gKyAxXTsNCisgICAgY2hhciBidWZbS1NZTV9OQU1F
X0xFTl07DQogICAgIGNvbnN0IGNoYXIgKm5hbWUsICpzeW1uYW1lOw0KICAgICB1bnNpZ25lZCBs
b25nIHNpemUsIG9mZnM7DQogDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92c3ByaW50Zi5jIGIv
eGVuL2NvbW1vbi92c3ByaW50Zi5jDQppbmRleCA5MDE5MmZkOWU4Li40OTE5NzVmYWNjIDEwMDY0
NA0KLS0tIGEveGVuL2NvbW1vbi92c3ByaW50Zi5jDQorKysgYi94ZW4vY29tbW9uL3ZzcHJpbnRm
LmMNCkBAIC0zOTcsNyArMzk3LDcgQEAgc3RhdGljIGNoYXIgKnBvaW50ZXIoY2hhciAqc3RyLCBj
b25zdCBjaGFyICplbmQsIGNvbnN0IGNoYXIgKipmbXRfcHRyLA0KICAgICBjYXNlICdTJzogLyog
U3ltYm9sIG5hbWUgdW5jb25kaXRpb25hbGx5IHdpdGggb2Zmc2V0IGFuZCBzaXplICovDQogICAg
IHsNCiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3ltX3NpemUsIHN5bV9vZmZzZXQ7DQotICAgICAg
ICBjaGFyIG5hbWVidWZbS1NZTV9OQU1FX0xFTisxXTsNCisgICAgICAgIGNoYXIgbmFtZWJ1ZltL
U1lNX05BTUVfTEVOXTsNCiANCiAgICAgICAgIC8qIEFkdmFuY2UgcGFyZW50cyBmbXQgc3RyaW5n
LCBhcyB3ZSBoYXZlIGNvbnN1bWVkICdzJyBvciAnUycgKi8NCiAgICAgICAgICsrKmZtdF9wdHI7
DQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3N5bWJvbHMuaCBiL3hlbi9pbmNsdWRlL3hl
bi9zeW1ib2xzLmgNCmluZGV4IDIwYmJiMjhlZjIuLmY1M2U4OTliNmUgMTAwNjQ0DQotLS0gYS94
ZW4vaW5jbHVkZS94ZW4vc3ltYm9scy5oDQorKysgYi94ZW4vaW5jbHVkZS94ZW4vc3ltYm9scy5o
DQpAQCAtMyw3ICszLDggQEANCiANCiAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQogDQotI2RlZmlu
ZSBLU1lNX05BTUVfTEVOIDEyNw0KKy8qIExvbmdlc3Qgc3ltYm9sIG5hbWUsIGluY2x1ZGluZyB0
aGUgdGVybWluYXRpbmcgTlVMLiAqLw0KKyNkZWZpbmUgS1NZTV9OQU1FX0xFTiAxMjgNCiANCiAv
Kg0KICAqIFR5cGVkZWYgZm9yIHRoZSBjYWxsYmFjayBmdW5jdGlvbnMgdGhhdCBzeW1ib2xzX2xv
b2t1cA0KZGlmZiAtLWdpdCBhL3hlbi90b29scy9zeW1ib2xzLmMgYi94ZW4vdG9vbHMvc3ltYm9s
cy5jDQppbmRleCA5ZGIxYzBhMjBjLi4xNGEwNDVmMDk4IDEwMDY0NA0KLS0tIGEveGVuL3Rvb2xz
L3N5bWJvbHMuYw0KKysrIGIveGVuL3Rvb2xzL3N5bWJvbHMuYw0KQEAgLTMzLDcgKzMzLDcgQEAN
CiAjaW5jbHVkZSA8c3RkYm9vbC5oPg0KICNpbmNsdWRlIDxjdHlwZS5oPg0KIA0KLSNkZWZpbmUg
S1NZTV9OQU1FX0xFTgkJMTI3DQorI2RlZmluZSBLU1lNX05BTUVfTEVOCQkxMjgNCiANCiANCiBz
dHJ1Y3Qgc3ltX2VudHJ5IHsNCkBAIC0zMzgsNiArMzM4LDcgQEAgc3RhdGljIHZvaWQgd3JpdGVf
c3JjKHZvaWQpDQogCXVuc2lnbmVkIGludCBpLCBrLCBvZmYsIGVuZHM7DQogCXVuc2lnbmVkIGlu
dCBiZXN0X2lkeFsyNTZdOw0KIAl1bnNpZ25lZCBpbnQgKm1hcmtlcnM7DQorCS8qIFR5cGUgYnl0
ZSwgdGhlbiB0aGUgbG9uZ2VzdCBuYW1lIHdpdGggaXRzIHRlcm1pbmF0aW5nIE5VTC4gKi8NCiAJ
Y2hhciBidWZbS1NZTV9OQU1FX0xFTisxXTsNCiANCiAJaWYgKG1hcF9vbmx5KSB7DQotLSANCjIu
NTMuMA0K

