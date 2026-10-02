Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A2CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 10:25:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439019.1657536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCaSH-0003hS-Qg; Fri, 02 Oct 2026 10:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439019.1657536; Fri, 02 Oct 2026 10:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCaSH-0003hL-Nx; Fri, 02 Oct 2026 10:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1439019;
 Fri, 02 Oct 2026 10:25:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCaSG-0003hF-3y
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:25:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCaSF-00HG7f-H1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 12:25:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6abf8697-e002-0a2a0a5209dd-0a2a4506ad9c-2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:25:27 +0200
Received: from [52.101.65.138]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6abf8696-195a-0a2a45060019-3465418afdff-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:25:27 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9670.eurprd03.prod.outlook.com (2603:10a6:20b:5e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 10:25:22 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:25:22 +0000
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
 b=q/obR++SAI1xc5NlNsLB2VfzH2CEVbQIao07mNT2X+byhF7TTOnNrBiqTajJHgrOYt1MpZaF6r6PX/axUmPEmFZZLq/6bzjRG4a0VQOa5UVxfUTLO5pDytc3wRYQ9QKumY3r39xNnlFsWjR0gHQcAa00NUTr6S3d9diY+4NHJZ5beOXbtQMu6yRqT+6SiE8v++ikFpOzOMP8QaQAx0lsp2jdWlISzr4rz3OS+hEPZtJWLqOOjXoEDKA8gKYrV8On10EGFTN/1MkqaX/LnXcbW5yxEb1qmBCtT0r8MhutAdZ9o5BQMh7hVj4a186FujlVVRbAUFePe+wFdY4pAUclUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91sCiVVbEEgxdXzk1w+Mjs8LUZDR9Ye82bW536CrQmU=;
 b=xgURX4r7QbQolIlv9sM8jS/KvGwvGa7jtHQ85uFfLeLAvKPOHaZgIAa426ORO9znQ+oDrMycja8KoEljpORDQDoBVsKLPLcoMUYJ9z3CebO4nFxpm2TjybwKyHy0sX3pGS2emdbstCXVhACLqol4DefepeMrge7EXe+R8k1pz8jnSzgkhvFaFxmvtm+Z19VGV0DYs8aCGJv044pCwV1Kyr47K3wb/sAn20XVZckIgGuz7KUuOPdmhG5E96/em9tQiwSc3bryMsZwbZSjJItFgmR8UfGtnmvzJFwqSBYBSJG9rvrldHpkJm6cqwNf4jxYgdrQD2bJzNmn4vTNArlMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91sCiVVbEEgxdXzk1w+Mjs8LUZDR9Ye82bW536CrQmU=;
 b=Kf4z/KnrGfNk9YId1cgxJdSkSBkeQF/UbjVb9qHeBWTLiPs2qOMq6pHTJ0kl8ZbVGG04Z0WsXfi9s4A3ZiZhAZ63He6WlL6T7JJoketa6n/4EaEeRJTG/2aM7N7FALRVASOT9XkHS/sirCdJpwqlZl59X7VepGImBN3FzknHuyjecbytePzcXdT24R5GeDil2z1fgT2fQVgMYVoFoDOEDz2fFJDqAb+vs76kg77Ua6JYu5erVFsiJfqXFp2JY0JPc9lSvxLyRzMgBcXrQBfRVtbnUJATlUYAOGNSZb1KI8JOLP9uB0xVX9BLRayF/4v2VbyFzZIJ5aPwTI9E3Phteg==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v3] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdUlhUefJfBgwqL0GtZVNifM+Gfg==
Date: Fri, 2 Oct 2026 10:25:21 +0000
Message-ID: <20261002102521.565675-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS2PR03MB9670:EE_
x-ms-office365-filtering-correlation-id: 7a2bf557-9668-4bce-be5a-08df206f7705
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|6133799003|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 V62oylpxvflCdYhXuDg/gJVhWoFekR4bFNuLGXgJWb/AupmHC1qYXzSqpVi5/Tc3eCTcagTN979AFh0muCxUknAAdL7KfklyUC9IS5teCmdScShn4J21Tk4ZLvAwoZ3A0lpUIbkFiAZaE6sZuIAm/9pNjmE910riyE4okQeztB6TmUXSD28mas1tSUYHCl2TR8MtZgQcF7u3MMCFon+4FKnhQ42jQEta0R3HeSEPtn5QxTzfPZSAHRBYB4JknNUpsCxV1WMhTV5rWBJuCgV1ns9ybbs4K8nAygYxpvgPDDEPTGorvzuhencKwPP7vVV292q0TmE6PJrEAUsof7aza6LHlw0zxsrcJsBEWhHfYjLPgjUYtv3lxzDeMxKsUiR74zBYBXltcvvq9C6hNRpSTr/4hY2mTyDA/h8Es71349TTfbFaeKBa5vudoCxeSoy5MI3R4+MQMhAuWw5CDOgiwBe/e7nn/VLbrWKJeg/JJImGBABbkzTSqxbvXdAvjb/FkfgvGEv/KitDQ0ALY8Kfb7TA42+HEdD8mE0h+1C38BmuyzhYB4MXHGWQ0F4Pk0amKch2KjOWjc0Nw8dPP7QeR8Av1PaUn7t5A0v8zLvNIs4LpknDqOhl3X0fnUKgogxu06RABjYVxuTb3nA+ZHy5RmZetlwYCgXfIpeU8KfW67HkdgCRiwpyxlLEVF/eENyYremoKVgSY6nau7VNibisUCQmh43vzzZsVb2y1GXuz60=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SndzWFdtbDdCU3REL3NoTzdtbDZxaWczeEZLYjJVZTBvTit5dm1YTEVic0Mv?=
 =?utf-8?B?QU9ncE82TG9SLzV4eXYvc0hHNmZlZ0FtUnpnZWtBeGNsL1VYd0dVdDZjY2Nq?=
 =?utf-8?B?Q0NDZ1FVV0tWWk5BV2dDY3dOaFZKZ3ZqLzFCRGEyWU42dFRvclRsQ0FJdjlj?=
 =?utf-8?B?di9uWlJkbmE0d0pqaDVPZkxPNTlDY2E4Q2ZhUXlIUy84K1NHZWNFNmRnbjZF?=
 =?utf-8?B?RGFNR29VRmVxV2lGMm1Ldjk2a3Q0Y0NuSTBjL0NTQ3pOZld4RFkxUHRYSGRV?=
 =?utf-8?B?ckQ4RENFY3BjbzhTeUlNT2N5SkM3WnFldHVDdTJ6bGVGTGtZZ0Q2dTUrYXY2?=
 =?utf-8?B?SEVmdkpua2IyNEF6QnFjWEpjdy93REZ4bFFOanFkZ2lFVjAyRTdjVnJ4ak56?=
 =?utf-8?B?amc4ZDJuajNMNXhaTnBGSXJvOHpzRVdjQ016bDUwUXgwdWVqeXg0R3RTWmNB?=
 =?utf-8?B?QlAwbm1xNWMxZHVEZkZ1bU1ydXR1VTdFNmI4ZWs5d0gzRTdHQjl5clFIWDNB?=
 =?utf-8?B?UEpRU0I4bnVlRWlmWXpjR1g2U1Vua01SWEl6cnlGcGVUUjVNeVF0SjI0M0ts?=
 =?utf-8?B?dnRJbjBuRWp5RGJ4OHM0R0Q0c1hVNHlzTnBwdE5OcDF5OStqVElrdzRCRGta?=
 =?utf-8?B?NEs0UFRkRmsrMysyeUFkRnE1eUtHd1NuS3cxQVFNbS8zRzNMK2c1RE9pbE13?=
 =?utf-8?B?ZEZ2dHp2VG9MaTh5cFRuZ0dqNVpXeVpqMCtwa045YzlFeGhuVTU0bzVlWEkz?=
 =?utf-8?B?TWtmN2VST2lmUHVtUjFBVlB2MTkwR1BQL3FtVFJiQWVYRG04UVpXaXp2NW5G?=
 =?utf-8?B?QTduRVJ5QXJ4YUdzd0U3RytQZFRZR2F0RFNPQWxtMGowaFhjOXE3ZWJqZUJq?=
 =?utf-8?B?Y0xCQnJyVXRtV09EcmpFRlBYTW14Z1Y5T05aNW9XeGVZOWZSSEU1VktlTW1u?=
 =?utf-8?B?SU40M1NqUGFqYk5xcTVoQTVzNmo0NERZZEgyaEY3S3VIZFNPd000ZUJjMXpT?=
 =?utf-8?B?eGVWSXR3UUxHOEFuc0Z4MnpERHNSakEvL1NpVUFRc1ZOVjRjenA4T0ZnSTJa?=
 =?utf-8?B?QTJjZ1lkTjA1VlZZbzhXNlIrdkpwcHF6MTFiUVk0SGpGY0NyZkQrMTJVS0ZJ?=
 =?utf-8?B?NGdUNi9jU1ZIRmdlYnNhK2gxUXJWRm9sSEc3SnBpVFd2OVRhNWtmQStOYkQz?=
 =?utf-8?B?dVpnUDhURUFyU2hDKytYTnZKcmxub29IelJJMTBiMVMySGdURGZIRDd3Y2ZR?=
 =?utf-8?B?LzVoWGt3eDRTYTI1ZmFZVTdablpraDgyZGY4eTd3UVlrRVE0U2xFM2Ird1VO?=
 =?utf-8?B?clVkSjdQV0RTNlF3MDBueFBVNDhhYmM3Y255ZzlEaUQvcEY4QjVTbzlwNFll?=
 =?utf-8?B?M3JETG9DcUl4b1FjbHJGeGVKWWJmUjlmdC9EKzRxMHVLMWlMN214SFlmVW1a?=
 =?utf-8?B?Z0pxZEY0QmtmUTdsK0cvaDF2UUNlUzlKYWxBcE9aU0Q0WW5UMGVnbUE0NW9H?=
 =?utf-8?B?TDdUcWl2bzhNNTRkeUx5VHhraENFNUNkYkVDdjJEdXl6cDdxdm1nUFUySEUw?=
 =?utf-8?B?UzlVaDRVT2t0YUN5WkJNMUZuMmgwZ0lVSnRXYVZZYlFkRHhEK2U0aXJmSHVP?=
 =?utf-8?B?OWdxTnk4WldiR29lM1JDeW80cVNkcEVVYkwwVEhITGIwbTVqOWRqd0l3QjNB?=
 =?utf-8?B?UUE2bHN0ZThVK1lLR0x2QllsUVhGRjVWVWRSVVRxSUhZTmpjMDRZM0liZjJq?=
 =?utf-8?B?eWpTWXZtckNXTFdwVGI0TmFNS2pFRVdnWE04SU5hbi9rTnFmTjZoYnhIeGhH?=
 =?utf-8?B?eWl0c0JJaVVqZmlOTjJrTVB1QktYYm1nNE8rdDVQNGg0d0pac0F5SStTc1BT?=
 =?utf-8?B?b3BsWFpUdFpYMmtIMzdzMDJkVTBsMkNOVHRVTk5BR0RZcnFFOXY3UzB1VTNz?=
 =?utf-8?B?eG1sWW4zSkdrYkhGSmtBMm91bFBCOHhJNjVSQzRXSUJ3Yjd1WFl1bWpVaTk1?=
 =?utf-8?B?VnQ4UWdLRlRmdENJV2VnMk56a254WlZ5Nm9ZdjJWdDYvdGI1aGxmeXFRZytq?=
 =?utf-8?B?ZkFrcU16VEl5QVhpUUlHbEVWU3dnbi9Id2orVFZ4SU1yakxWQXNRalNzeHho?=
 =?utf-8?B?blZ5Qm9yT1VBRnphVEVFMzN2bzFNQ2U5cFBaMWp5VzQ5aE9oczJkVGVjbFdF?=
 =?utf-8?B?SDlLQlgyUXBrb1NtZmFwREgwWDBBZ2E5WGthcEhFMWdHYWxHNzNlL0lpc3lD?=
 =?utf-8?B?ZldFdjhKNFFrRGdPb2h5UFNCbHBKdXlMZGQrYkRxbmhnckpFQWxDVld3RmI5?=
 =?utf-8?B?U0RHWi9zd0QvdFFsUnpxZ1AxY1dmM0ZDcUttdHZqdEt6UzZuaWc4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F09FEA0E81100544970898ADE1CAA46B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2bf557-9668-4bce-be5a-08df206f7705
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 10:25:21.9714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMShoVkosyFLR1gJ9hVe0+pbZ7z3G4RUF7TnvYBSY8owN2a+57fHkHsoYxMGjXC0SsRRJsHFsLShVitXgSTR9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9670
X-purgate-ID: tlsNG-16d1c6/1790936727-1F8CB77B-264D8219/10/78276251493
X-purgate-type: spam
X-purgate-size: 6438

QWRkICJzZWNsYWJlbCIgcHJvcGVydHkgdG8gYmUgYWJsZSB0byBzcGVjaWZ5IHNlY3VyaXR5IGxh
YmVsIGZvciBhIGRvbWFpbg0Kd2hlbiBYU00gRmxhc2sgaXMgZW5hYmxlZCwgc2ltaWxhciB0byB4
bCBjb25maWd1cmF0aW9uIGZpbGVzLg0KDQpDdXJyZW50bHkgZ3Vlc3QgZG9tYWluIGNhbid0IGJl
IGNyZWF0ZWQgYnkgWGVuIGluIGRvbTBsZXNzIGNvbmZpZ3VyYXRpb24gd2hlbg0KRmxhc2sgaXMg
ZW5hYmxlZCwgYXMgZG9tYWluIGlzIGFzc2lnbmVkICJzeXN0ZW1fdTpzeXN0ZW1fcjp1bmxhYmVs
ZWRfdCIgbGFiZWwNCmJ5IGRlZmF1bHQsIHdoaWNoIEZsYXNrIGRlbmllcyB0byBjcmVhdGUgYWNj
b3JkaW5nIHRvIGN1cnJlbnQgcG9saWN5Lg0KDQpCZWNhdXNlIGNvZGUgZnJvbSBvdXRzaWRlIG9m
IGZsYXNrIGNhbid0IGRpcmVjdGx5IGV4ZWN1dGUgaXRzIGludGVybmFsIEFQSQ0KYSBuZXcgcm91
dGluZSBmbGFza19jb250ZXh0X3RvX3NpZCgpIGludHJvZHVjZWQgYXMgcGFydCBvZiBYU00gQVBJ
IGV4cG9zZWQNCnRvIHJlc3Qgb2YgWGVuLCB3aGljaCBpcyBhIGRpcmVjdCB3cmFwcGVyIGZvciBz
ZWN1cml0eV9jb250ZXh0X3RvX3NpZCgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBTZXJnaXkgS2licmlr
IDxTZXJnaXlfS2licmlrQGVwYW0uY29tPg0KQ0M6IERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBh
cGVydHVzc29sdXRpb25zLmNvbT4NCkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KQ0M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQpDQzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQpjaGFuZ2VzIGluIHYzOg0KIC0g
cGFuaWMgaWYgYHNlY2xhYmVsYCBwcm9wZXJ0eSBmb3VuZCBidXQgRkxBU0sgaXMgZGlzYWJsZWQN
CmNoYW5nZXMgaW4gdjI6DQogLSBhZGQgJiB1c2UgZmxhc2tfY29udGV4dF90b19zaWQoKSB3cmFw
cGVyDQotLS0NCiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0ICAgICAgfCAg
NyArKysrKysrDQogeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1iaW5kaW5ncy5jIHwg
MTMgKysrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hzbS94c20uaCAgICAgICAgICAgICAgICAg
ICAgICB8ICAzICsrKw0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICA1ICsrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IGIvZG9jcy9taXNj
L2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KaW5kZXggYmNiMDZiYzc5Ni4uZDA0NDU1Yjc0
NCAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCisr
KyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCkBAIC0zNDUsNiArMzQ1
LDExIEBAIHdpdGggdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzOg0KICAgICBub3QgcGFzc2VkLiBU
aGlzIGNvbmZpZ3VyYXRpb24gcmVxdWlyZXMgc3RhdGljIGFsbG9jYXRpb24gKHhlbixzdGF0aWMt
bWVtKQ0KICAgICBhbmQgZGlyZWN0IG1hcHBpbmcgKGRpcmVjdC1tYXApLg0KIA0KKy0gc2VjbGFi
ZWwNCisNCisgICAgQSBzdHJpbmcgcHJvcGVydHkgc3BlY2lmeWluZyBhbiBYU00gc2VjdXJpdHkg
bGFiZWwgdG8gdGhpcyBkb21haW4uIERvbWFpbnMNCisgICAgd2lsbCBiZSBjbGFzc2lmaWVkIOKA
nHVubGFiZWxlZOKAnSBpZiB0aGlzIHByb3BlcnR5IG5vdCBzcGVjaWZpZWQuDQorDQogVW5kZXIg
dGhlICJ4ZW4sZG9tYWluIiBjb21wYXRpYmxlIG5vZGUsIG9uZSBvciBtb3JlIHN1Yi1ub2RlcyBh
cmUgcHJlc2VudA0KIGZvciB0aGUgRG9tVSBrZXJuZWwgYW5kIHJhbWRpc2suDQogDQpAQCAtNDIy
LDYgKzQyNyw3IEBAIGNob3NlbiB7DQogICAgICAgICBtZW1vcnkgPSA8MCAxMzEwNzI+Ow0KICAg
ICAgICAgY3B1cyA9IDwyPjsNCiAgICAgICAgIHZwbDAxMTsNCisgICAgICAgIHNlY2xhYmVsID0g
InN5c3RlbV91OnN5c3RlbV9yOmRvbVVfdCI7DQogDQogICAgICAgICB2Y3B1MCB7DQogICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sdmNwdSI7DQpAQCAtNDUzLDYgKzQ1OSw3IEBAIGNob3Nl
biB7DQogICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDE+Ow0KICAgICAgICAgbWVtb3J5ID0gPDAg
NjU1MzY+Ow0KICAgICAgICAgY3B1cyA9IDwxPjsNCisgICAgICAgIHNlY2xhYmVsID0gInN5c3Rl
bV91OnN5c3RlbV9yOmRvbVVfdCI7DQogDQogICAgICAgICBtb2R1bGVAMHg0YzAwMDAwMCB7DQog
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxt
b2R1bGUiOw0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmlu
ZGluZ3MuYyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmluZGluZ3MuYw0KaW5k
ZXggNDFkNzJkMGQ1OC4uMDFkNWNjMWJjOSAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vZGV2aWNl
LXRyZWUvZG9tMGxlc3MtYmluZGluZ3MuYw0KKysrIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9k
b20wbGVzcy1iaW5kaW5ncy5jDQpAQCAtMTEsNiArMTEsOCBAQA0KICNpbmNsdWRlIDxwdWJsaWMv
Ym9vdGZkdC5oPg0KICNpbmNsdWRlIDxwdWJsaWMvZG9tY3RsLmg+DQogDQorI2luY2x1ZGUgPHhz
bS94c20uaD4NCisNCiBpbnQgX19pbml0IHBhcnNlX2RvbTBsZXNzX25vZGUoc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpub2RlLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
Ym9vdF9kb21haW4gKmJkKQ0KIHsNCkBAIC0yMSw2ICsyMyw3IEBAIGludCBfX2luaXQgcGFyc2Vf
ZG9tMGxlc3Nfbm9kZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQogICAgIGJvb2wgaGFz
X2R0YiA9IGZhbHNlOw0KICAgICBib29sIGlvbW11ID0gZmFsc2U7DQogICAgIGNvbnN0IGNoYXIg
KmRvbTBsZXNzX2lvbW11ID0gTlVMTDsNCisgICAgY29uc3QgY2hhciAqeHNtX3NlY2xhYmVsID0g
TlVMTDsNCiANCiAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9kZSwgInhlbixk
b21haW4iKSApDQogICAgICAgICByZXR1cm4gLUVOT0VOVDsNCkBAIC0xNDEsNSArMTQ0LDE1IEBA
IGludCBfX2luaXQgcGFyc2VfZG9tMGxlc3Nfbm9kZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5v
ZGUsDQogICAgICAgICBwYW5pYygiJ2xsYy1jb2xvcnMnIGZvdW5kLCBidXQgTExDIGNvbG9yaW5n
IGlzIGRpc2FibGVkXG4iKTsNCiAjZW5kaWYNCiANCisgICAgaWYgKCAhZHRfcHJvcGVydHlfcmVh
ZF9zdHJpbmcobm9kZSwgInNlY2xhYmVsIiwgJnhzbV9zZWNsYWJlbCkgKQ0KKyAgICB7DQorICAg
ICAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19YU01fRkxBU0spICkNCisgICAgICAgICAgICBw
YW5pYygiJ3NlY2xhYmVsJyBmb3VuZCwgYnV0IEZMQVNLIGlzIGRpc2FibGVkXG4iKTsNCisgICAg
ICAgIGVsc2UgaWYgKCBmbGFza19jb250ZXh0X3RvX3NpZCh4c21fc2VjbGFiZWwsIHN0cmxlbih4
c21fc2VjbGFiZWwpLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZF9j
ZmctPnNzaWRyZWYpICkNCisgICAgICAgICAgICAgICAgcGFuaWMoIkludmFsaWQgc2VjdXJpdHkg
Y29udGV4dCBmb3IgZG9tYWluOiAlc1xuIiwNCisgICAgICAgICAgICAgICAgICAgICAgeHNtX3Nl
Y2xhYmVsKTsNCisgICAgfQ0KKw0KICAgICByZXR1cm4gYXJjaF9wYXJzZV9kb20wbGVzc19ub2Rl
KG5vZGUsIGJkKTsNCiB9DQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL3hzbS5oIGIveGVu
L2luY2x1ZGUveHNtL3hzbS5oDQppbmRleCA5ODA5ZTAwNWUwLi43M2QwNThhOGIyIDEwMDY0NA0K
LS0tIGEveGVuL2luY2x1ZGUveHNtL3hzbS5oDQorKysgYi94ZW4vaW5jbHVkZS94c20veHNtLmgN
CkBAIC0yNjEsNCArMjYxLDcgQEAgc3RhdGljIGlubGluZSBib29sIGhhc194c21fbWFnaWMocGFk
ZHJfdCBzdGFydCkNCiANCiAjZW5kaWYgLyogQ09ORklHX1hTTSAqLw0KIA0KK2ludCBmbGFza19j
b250ZXh0X3RvX3NpZChjb25zdCBjaGFyICpzY29udGV4dCwNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDMyX3Qgc2NvbnRleHRfbGVuLCB1aW50MzJfdCAqc2lkKTsNCisNCiAjZW5kaWYg
LyogX19YU01fSCAqLw0KZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svaG9va3MuYyBiL3hlbi94
c20vZmxhc2svaG9va3MuYw0KaW5kZXggZDY1YmEwYWVhZS4uMGI0NGEyYTNkOSAxMDA2NDQNCi0t
LSBhL3hlbi94c20vZmxhc2svaG9va3MuYw0KKysrIGIveGVuL3hzbS9mbGFzay9ob29rcy5jDQpA
QCAtMjAxNiw2ICsyMDE2LDExIEBAIGNvbnN0IHN0cnVjdCB4c21fb3BzICpfX2luaXQgZmxhc2tf
aW5pdCgNCiAgICAgcmV0dXJuICZmbGFza19vcHM7DQogfQ0KIA0KK2ludCBmbGFza19jb250ZXh0
X3RvX3NpZChjb25zdCBjaGFyICpzY29udGV4dCwgdWludDMyX3Qgc2NvbnRleHRfbGVuLCB1aW50
MzJfdCAqc2lkKQ0KK3sNCisgICAgcmV0dXJuIHNlY3VyaXR5X2NvbnRleHRfdG9fc2lkKHNjb250
ZXh0LCBzY29udGV4dF9sZW4sIHNpZCk7DQorfQ0KKw0KIC8qDQogICogTG9jYWwgdmFyaWFibGVz
Og0KICAqIG1vZGU6IEMNCi0tIA0KMi40My4wDQo=

