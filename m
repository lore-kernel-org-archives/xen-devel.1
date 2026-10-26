Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C3606A326
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=rNSzvtSw
Received: from list by lists.xenproject.org with outflank-mailman.1461215.1672190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJo4-0001Y5-Ij; Mon, 26 Oct 2026 12:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461215.1672190; Mon, 26 Oct 2026 12:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJo4-0001Xu-Dn; Mon, 26 Oct 2026 12:28:04 +0000
Received: by outflank-mailman (input) for mailman id 1461215;
 Mon, 26 Oct 2026 12:28:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xLJo2-0001TS-PO
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJo2-000Htn-5y
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:28:02 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6adf4735-2eae-0a2a0a5409dd-0a2a450bcd94-20
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:02 +0100
Received: from [40.107.162.83]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6adf4751-b7e8-0a2a450b0019-286ba2532f5d-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:02 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB9PR03MB7793.eurprd03.prod.outlook.com (2603:10a6:10:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:28:00 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0546.019; Mon, 26 Oct 2026
 12:28:00 +0000
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
 b=bDsIIDkLwJLoa8xss8NuToPoT/5Us5WQIbBITC8A+9wreqHMndOAY4PjormcT6F45ppQJ4Eehl7f6fZJHNQLD/iXPpPLiNV8k8OlMin7KiX6NWsHQquhengNIGaAbbJXSVtJXT4oN0W51F0NppqVo9+Ywh7s0RJkFIY3BWya3wF/6zfr5o+Bd9gKq7MYqi4x+M8stR02cynz5rr/83ilaouX38obDx1KooZ2e56evLYUgIflnWBP5CxcVKrEJPv23uW6kMcdx7R9iAQBfT3FdbV/31LFoZoXBZuANG7Yb50lZPxSUWk9SyXud3bYeLW8m/5E1GCDEsywayST1ORiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJs+WFpev3akBFRF+sJ2ujKnrr/5HAnuZXXVTr+5cjU=;
 b=jHtpRv/DzailNhhC4ldpTIgDhroQM7pApdHTTx+cvDCQ7AX5Imm05kpxr/nbMPCfahOOBaKKbHSX29umRJvF8fjwmBpc2q0Hq03BVtf4PyGLO3iwVx1D3ytaqUxQTAzyKNzWf5o1x7ezFeEmWK0uj1p69F5WleZ9IMlnC9B/Yu6Pq81ddQewxdPg+TX3uzfIh//LUr7/O/16IQUpxuoPI2iKqcVwp7FJzwyDmCH/TkdU61q3+dozDEUauMsEnYVFmOxS1CcvzuWe4hLuqQVHu0TJCfbVOksfm4aS0ZgpWgXb31iF+ING9+Sl5MJutiAQv2gneie/CQ0HB/yTJXrnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJs+WFpev3akBFRF+sJ2ujKnrr/5HAnuZXXVTr+5cjU=;
 b=rNSzvtSwL7f7C7rZmjceX3W2QhcqIVfuw3QH4P0uT1Yx1n93kv9K5w+38nSVoutQogSTStCVAS+v4oZCo8vAntGqedzD1NnA2q3en/t1Z+2ze4CZtDkxLa9p3mGEEd9Fyc82/m1umnsWjSxcAuY8qfJxxh4VVgscOVUx9tQ6AWFth+y+JsJoSyAt0E73aeVkT292z0QT8vwc9+SyTwdFn27xA+u6dmtisDlmEJIVXBZvcpqCgnTyghZbyVF6MhLDwgmHdpbJwmwSraoAYLMSb3WYGkzikZbpTkHg9qiB9eFX+C7yYDdhmRI8G3zQFHOUM3WB3nUJxPiTt4H7VsctjA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 2/3] vpci/msix: move msix region removal to msix.c
Thread-Topic: [PATCH v1 2/3] vpci/msix: move msix region removal to msix.c
Thread-Index: AQHdZUVw/fA35GNZ9kyzCDEBJXJ5MA==
Date: Mon, 26 Oct 2026 12:28:00 +0000
Message-ID:
 <2531af333e3f44e2f47a8871fcd55fe3644774e2.1793012250.git.mykyta_poturai@epam.com>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1793012250.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB9PR03MB7793:EE_
x-ms-office365-filtering-correlation-id: 07685698-b8b5-4354-a831-08df335c92d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|11063799006|261021121427099003|10067099003|261009223027099003|261021123027099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 ESSZN6wVayzMiI31PkQmo6E8Qh+yGBIOUhH2t/6Es+hOT7e/iokEYHOhaAgKO3qGTGSUti+ALcW2+O1Azvg2pH4r/K8yOSsUaLRO2kBPdTtCNxVjIRJM750xmEaK4hOBZSlRt+u0pkQ7IipEb2jwfEi7WrDFilggbIm/A5+GDSba1xW402ItNYQWBt+IemeIuvBW+lbwb6i34Vp5hJ+A93f5cjaoFFMCyTXfKqocTVivn1fDD+LPHdXk+lenFn6W7+MELkJdx3m32WUeY4a8eLRnrzFE6TYRomOQ97RkzTI3r5AqT76KtntBDi5Ac/oKrrbuoxlxqs/ZVb/PfpAIoq30IohT0t2sPSdO3UkHbWvRDgnwTlTJYyDXZEXEjeE6QNG4tUSngBelou8rqcORRsrhUtIrkwavfRDpAqIrjC0phBm4uRZ2IDbTuvSIMvS9CEPH2LQDhCynDK3Hr2mfmAfTglsIqZxpQJCQwMzBWz1KxudFs94aQIdClQ6gPM++IA8fBfRZ2gOvwXA4GRJB8Hr9TiK7Pe5zEcJgbxKrzyETZD1GF+0Ya/aHIrLfHChfqMMmduw6w6iismCXGOcdoPMOpw2eTUT+l1vHinOkOzZwDLtZpg7kRrOGeRe5NtLMbq6T3mj98MC98ZinSZ351k0sPpc2hJKslVoiZCllD9X5ios6q7P2brG51rTjEvVCJJq2JN6aVrFa6URYUu0j8CnwHJ2TUjvpAqV8Y8Yd9ng=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXlaOFVGSFV0eUg3ZG1sZ1ZaTWdxM1QvSUxPRjVoMXVvdHp3VlhQNDFxMjZ0?=
 =?utf-8?B?QytmV2U3SllESHdNUyt2bGdzSGxlWDFYTHE4SjRzLzh3U2FrU2xZbnM1dHJr?=
 =?utf-8?B?WU0zam55QjRNWWcvNHUzM0tLRGJTMzM0c1dtVGNkeHZiaDlZQ3Vjb1lZcVdS?=
 =?utf-8?B?UUU1Vk9VeE1CaHc3c0xMMU00YVFBMGhKSUR3Um1vbFVidkE5UGVvZTVFVG5Z?=
 =?utf-8?B?a0prYTVROGM3OUIrUG9URVYrVGdNQzlNcUl6bkMwNU53ZXhOQkEyNW9heXc5?=
 =?utf-8?B?bFhDNXI4ekJibHlYUjVMTTdlZmE5UWgrWU9yV0kvWlZsQWhqUFFITFB0WHRi?=
 =?utf-8?B?RnYzR3BtOVdva1RwZGRNSHBzeTQyeGJCMjFGcmhqcEJJaVlxRUMrb0JUdldi?=
 =?utf-8?B?WXQyb2ljTnNYSUg3cnBGeVhRVmlCWmluOFRhK0pjMXR5dHpKdGhSUWZkQTNY?=
 =?utf-8?B?ZGREQUM0THpxUXB4UFpXN2hUWU43K2xvSlcydUpnMGFXNVlia3BJVnJrT25L?=
 =?utf-8?B?VVFhNytJbUlteTlzZTBtQVZ6L0R2ckJzNEZpdVNVaUFSclRuRExVZEZuMytq?=
 =?utf-8?B?VUZkYnVaZXRkajNvZCtEUFNldEt1RzUyK0FEbHZEWmJOUWxtZDR2TzVmUnFr?=
 =?utf-8?B?R2MvbjJGZGU2VXBjTm9zeEtOUFViTDBUVXRGKzRkeWZYUXM0TzBROHp3ZmJE?=
 =?utf-8?B?TjVZTTJRcHlrRWlMb2U1VXM2UXcxWWE3cHpYKyt1dmVRTHRJWm5qL1FpcHV4?=
 =?utf-8?B?TElmZGQxSnQyYi9VVThnS21KSzYxVDJGZ3UzaVluclBnVHh1MHIwdm5RVUcx?=
 =?utf-8?B?aVdWbDdUU2xWWjJIbkZZOFJwU2FzZ1pZZ3JXUHdVR3AzZThHNzljNERobHRa?=
 =?utf-8?B?cFZQUmJhRlB4dTIzS1FxUFFGS3dyUktiOHVQeHhrbnRhaXUxc2ZVQUVxdXJF?=
 =?utf-8?B?ME1Ha21MOUpTNFNkN2NIaitod0djakM0L0hWblU0VGQxSVNGcVZNL2xxUUR4?=
 =?utf-8?B?RXM2ZnlaSVdTVGtKd2xuQitrajdzbGNJdWhzUmVyMGk5RlRIcDNVZDZSdXFr?=
 =?utf-8?B?eDN6VkxtQ1owVzY2WTFyczZPa0Z6bnFTQ25RNDJUaFJFYko2QnQ3SmsxYUpG?=
 =?utf-8?B?cUJNcVlSTWVrVTdkTlBsQmdUck1hQlBzcDJWeG5aYWN6bHlDUDJWV21vcWYv?=
 =?utf-8?B?V2YvRkxWZ25raDVqNnVtb2MzSm9VdFBFTUpKZE5PdmlCcm5sYlpJa09meThn?=
 =?utf-8?B?amJIbjN3R1RhbUE2N1J1eW9lbnpQa2pZd044RjA3ZUJ6UTFaa0RzQ3FpWklt?=
 =?utf-8?B?eEt4NmplZXJPY1pIMDdrZWw1N3RHaUVZd1ZPVm1EaUhuVDNFSzg5dlVVb0dm?=
 =?utf-8?B?eDdwVTlHbW1CWkplakdJSHlidXliTTAyK3ZpMTY4aUE2M25uV0FRZHMrMDhL?=
 =?utf-8?B?REd6ZG1yWTVjVzFQWXZPdjM0bmJOUHRTVDBjK3FIVlVrTTNkQnltMWZVMlBG?=
 =?utf-8?B?S1Z3S3ZkZkJuVWk1VFN6MVdiNmVyR09samZwU2I1NW04Rlh0eTNlTWc2RGVV?=
 =?utf-8?B?ZCtpVjAvdmR5TVFQQTl2eEVON3ZxV0FieDY4MjExZmdsYnZ1TWpLQXZRbEc0?=
 =?utf-8?B?OU9RUG84ZncvSm84S28wMEZBakZZeFZVWlRTMHR1Tm1PeTNVRlpWOENmTGF2?=
 =?utf-8?B?dHpZTVNpcDVGQ3ZJeUtQR1I0NW1UNzVVOS9RRk92a2hrQk9yQTZ3MC9FNW9R?=
 =?utf-8?B?ZTh3elcrbndjbEtOT2VBZ09VVEZFejJ4azVaTDZBRG5IaVBwSlBWWW1oUTJq?=
 =?utf-8?B?N3lZcWpKbnJZN0NZbnVXbGZyOE9YRHVJb2puZkpZTG1HVWkrYnhERmFyN0dx?=
 =?utf-8?B?dkNyN2ZtbDlYeDJvTzJDMFY0cTJrQXNMb0ZwcEdYYmdGeC9kS3lBeEV2dmEv?=
 =?utf-8?B?U25xdjlWL2lPTGw5ZHNaTlhBRXhjYllsMWdncDJhZndpWVJRL0NNckZpRCtM?=
 =?utf-8?B?azkxa0J3RkxTbWxLN204ZUJvcXVPamoycTFtY08xbERyTlNUUCtKRmZ3Tmho?=
 =?utf-8?B?VUkwdlRIMnR5T3RPcmY5aXRzUGFHMEx2VXFadU9pK1FXVEc3b0hFU1R4ZWZN?=
 =?utf-8?B?Q3oyQkV5UlA0aCt6a3F5R210aUFHS0E4bTBaZFZBR2ZnbEJkb29kc1p1L2o1?=
 =?utf-8?B?VHoxQmlLeGtpUXlWZ1d1U3NtUEtobk5rQjN3eVlYVVk5b2Y2UlozWWRVWUQy?=
 =?utf-8?B?NTdaczVxN1Rrck5nQ2UwQXZIcy9uZElmSG51SndGSE9rc0g4d01sem5KeUpZ?=
 =?utf-8?B?dzNOYlgyNFRnNzJhSlVvQVdGeWFVNEdNOENqOXhnSXlkVEhpM3pHS1NCSFBx?=
 =?utf-8?Q?lSodu2E8tRrriVZc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07685698-b8b5-4354-a831-08df335c92d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 12:28:00.3036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Goznz1QESGDhaLErpJkWVpVXdxPf24zEdisDmxWyfslqb7nwJsK0LcXVBLtTlgk0L7/RmrLK58iTPLhRZcdSZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7793
X-purgate-ID: tlsNG-42698a/1793017682-194C39EA-D696F052/0/0
X-purgate-type: clean
X-purgate-size: 5768
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCg0K
VGhpcyBjb2RlIHdvbid0IGJlIHVzZWQgb24gQXJtLg0KDQpTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0
IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTog
TXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0KLS0tDQogeGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYyAgfCAzMCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiB4
ZW4vZHJpdmVycy92cGNpL21zaXguYyAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQogeGVuL2RyaXZlcnMvdnBjaS9wcml2YXRlLmggfCAgMiArKw0KIDMgZmlsZXMg
Y2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0K
aW5kZXggN2U1ZjRiOGEwMC4uOWUxOWU0MWQwYSAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCkBAIC0zMTAsNyAr
MzEwLDYgQEAgc3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgdWludDE2X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KICAgICBzdHJ1Y3QgdnBjaV9oZWFkZXIg
KmhlYWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQogICAgIHN0cnVjdCBwY2lfZGV2ICp0bXA7
DQogICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQ7DQotICAgIGNvbnN0IHN0cnVjdCB2cGNpX21z
aXggKm1zaXggPSBwZGV2LT52cGNpLT5tc2l4Ow0KICAgICB1bnNpZ25lZCBpbnQgaSwgajsNCiAg
ICAgaW50IHJjOw0KIA0KQEAgLTQwNSwzMCArNDA0LDExIEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2Jh
cnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwgYm9vbCByb21fb25s
eSkNCiAgICAgICAgIH0NCiAgICAgfQ0KIA0KLSAgICAvKiBSZW1vdmUgYW55IE1TSVggcmVnaW9u
cyBpZiBwcmVzZW50LiAqLw0KLSAgICBmb3IgKCBpID0gMDsgbXNpeCAmJiBpIDwgQVJSQVlfU0la
RShtc2l4LT50YWJsZXMpOyBpKysgKQ0KLSAgICB7DQotICAgICAgICB1bnNpZ25lZCBsb25nIHN0
YXJ0ID0gUEZOX0RPV04odm1zaXhfdGFibGVfYWRkcihwZGV2LT52cGNpLCBpKSk7DQotICAgICAg
ICB1bnNpZ25lZCBsb25nIGVuZCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIocGRldi0+dnBj
aSwgaSkgKw0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bXNpeF90YWJs
ZV9zaXplKHBkZXYtPnZwY2ksIGkpIC0gMSk7DQotDQotICAgICAgICBmb3IgKCBqID0gMDsgaiA8
IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaisrICkNCi0gICAgICAgIHsNCi0gICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9ICZoZWFkZXItPmJhcnNbal07DQotDQotICAg
ICAgICAgICAgaWYgKCByYW5nZXNldF9pc19lbXB0eShiYXItPm1lbSkgKQ0KLSAgICAgICAgICAg
ICAgICBjb250aW51ZTsNCi0NCi0gICAgICAgICAgICByYyA9IHJhbmdlc2V0X3JlbW92ZV9yYW5n
ZShiYXItPm1lbSwgc3RhcnQsIGVuZCk7DQotICAgICAgICAgICAgaWYgKCByYyApDQotICAgICAg
ICAgICAgew0KLSAgICAgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KLSAgICAg
ICAgICAgICAgICAgICAgICAgIiVwcDogZmFpbGVkIHRvIHJlbW92ZSBNU0lYIHRhYmxlIFslbHgs
ICVseF06ICVkXG4iLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBzdGFy
dCwgZW5kLCByYyk7DQotICAgICAgICAgICAgICAgIHJldHVybiByYzsNCi0gICAgICAgICAgICB9
DQotICAgICAgICB9DQotICAgIH0NCisjaWZkZWYgQ09ORklHX0hBU19QQ0lfTVNJDQorICAgIHJj
ID0gdnBjaV9yZW1vdmVfbXNpeF9yZWdpb25zKHBkZXYpOw0KKyAgICBpZiAoIHJjICkNCisgICAg
ICAgIHJldHVybiByYzsNCisjZW5kaWYNCiANCiAgICAgLyoNCiAgICAgICogQ2hlY2sgZm9yIG92
ZXJsYXBzIHdpdGggb3RoZXIgQkFScy4gTm90ZSB0aGF0IG9ubHkgQkFScyB0aGF0IGFyZQ0KZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4
LmMNCmluZGV4IDA1MDU2YjVlYTEuLjRhMWU3NTYxZjYgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVy
cy92cGNpL21zaXguYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCkBAIC01OTAsNiAr
NTkwLDQxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHZtX21taW9fb3BzIHZwY2lfbXNpeF90YWJs
ZV9vcHMgPSB7DQogICAgIC53cml0ZSA9IG1zaXhfd3JpdGUsDQogfTsNCiANCitpbnQgdnBjaV9y
ZW1vdmVfbXNpeF9yZWdpb25zKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KK3sNCisgICAg
Y29uc3Qgc3RydWN0IHZwY2lfbXNpeCAqbXNpeCA9IHBkZXYtPnZwY2ktPm1zaXg7DQorICAgIHN0
cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCisgICAgdW5z
aWduZWQgaW50IGksIGo7DQorICAgIGludCByYzsNCisNCisgICAgLyogUmVtb3ZlIGFueSBNU0lY
IHJlZ2lvbnMgaWYgcHJlc2VudC4gKi8NCisgICAgZm9yICggaSA9IDA7IG1zaXggJiYgaSA8IEFS
UkFZX1NJWkUobXNpeC0+dGFibGVzKTsgaSsrICkNCisgICAgew0KKyAgICAgICAgdW5zaWduZWQg
bG9uZyBzdGFydCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIocGRldi0+dnBjaSwgaSkpOw0K
KyAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQgPSBQRk5fRE9XTih2bXNpeF90YWJsZV9hZGRyKHBk
ZXYtPnZwY2ksIGkpICsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1z
aXhfdGFibGVfc2l6ZShwZGV2LT52cGNpLCBpKSAtIDEpOw0KKw0KKyAgICAgICAgZm9yICggaiA9
IDA7IGogPCBBUlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGorKyApDQorICAgICAgICB7DQorICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IHZwY2lfYmFyICpiYXIgPSAmaGVhZGVyLT5iYXJzW2pdOw0K
Kw0KKyAgICAgICAgICAgIGlmICggcmFuZ2VzZXRfaXNfZW1wdHkoYmFyLT5tZW0pICkNCisgICAg
ICAgICAgICAgICAgY29udGludWU7DQorDQorICAgICAgICAgICAgcmMgPSByYW5nZXNldF9yZW1v
dmVfcmFuZ2UoYmFyLT5tZW0sIHN0YXJ0LCBlbmQpOw0KKyAgICAgICAgICAgIGlmICggcmMgKQ0K
KyAgICAgICAgICAgIHsNCisgICAgICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywN
CisgICAgICAgICAgICAgICAgICAgICAgICIlcHA6IGZhaWxlZCB0byByZW1vdmUgTVNJWCB0YWJs
ZSBbJWx4LCAlbHhdOiAlZFxuIiwNCisgICAgICAgICAgICAgICAgICAgICAgICAmcGRldi0+c2Jk
Ziwgc3RhcnQsIGVuZCwgcmMpOw0KKyAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQorICAgICAg
ICAgICAgfQ0KKyAgICAgICAgfQ0KKyAgICB9DQorDQorICAgIHJldHVybiAwOw0KK30NCisNCiBp
bnQgdnBjaV9tYWtlX21zaXhfaG9sZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCiB7DQog
ICAgIHN0cnVjdCBkb21haW4gKmQgPSBwZGV2LT5kb21haW47DQpkaWZmIC0tZ2l0IGEveGVuL2Ry
aXZlcnMvdnBjaS9wcml2YXRlLmggYi94ZW4vZHJpdmVycy92cGNpL3ByaXZhdGUuaA0KaW5kZXgg
MjkwN2Y2YjQwZi4uYTE2M2VmZThmZiAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvcHJp
dmF0ZS5oDQorKysgYi94ZW4vZHJpdmVycy92cGNpL3ByaXZhdGUuaA0KQEAgLTg3LDYgKzg3LDgg
QEAgdm9pZCBjZl9jaGVjayB2cGNpX2h3X3dyaXRlMTYoDQogICAgIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLCB1aW50MzJfdCB2YWwsIHZvaWQgKmRhdGEpOw0K
IA0KICNpZmRlZiBfX1hFTl9fDQoraW50IHZwY2lfcmVtb3ZlX21zaXhfcmVnaW9ucyhjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldik7DQorDQogLyogTWFrZSBzdXJlIHRoZXJlJ3MgYSBob2xlIGlu
IHRoZSBwMm0gZm9yIHRoZSBNU0lYIG1taW8gYXJlYXMuICovDQogaW50IHZwY2lfbWFrZV9tc2l4
X2hvbGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KIA0KLS0gDQoyLjU1LjANCg==

