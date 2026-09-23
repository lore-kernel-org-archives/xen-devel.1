Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B4FC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 17:56:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431172.1653458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9RCE-0006dt-NJ; Wed, 23 Sep 2026 17:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431172.1653458; Wed, 23 Sep 2026 17:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9RCE-0006dm-Kf; Wed, 23 Sep 2026 17:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1431172;
 Wed, 23 Sep 2026 17:55:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Leonid_Komarianskyi@epam.com>) id 1x9RCC-0006dg-V8
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:55:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9RCC-002r9J-7k
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 19:55:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Leonid_Komarianskyi@epam.com>)
 id 6ab41282-bab6-0a2a0a5309dd-0a2a4504eaac-18
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 19:55:52 +0200
Received: from [52.101.65.98]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Leonid_Komarianskyi@epam.com>)
 id 6ab412a2-b57f-0a2a45040019-346541626d1a-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 19:55:47 +0200
Received: from DB5PR03MB10049.eurprd03.prod.outlook.com (2603:10a6:10:4a0::9)
 by VI0PR03MB10736.eurprd03.prod.outlook.com (2603:10a6:800:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 17:55:41 +0000
Received: from DB5PR03MB10049.eurprd03.prod.outlook.com
 ([fe80::9240:92cd:d9da:bf9e]) by DB5PR03MB10049.eurprd03.prod.outlook.com
 ([fe80::9240:92cd:d9da:bf9e%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 17:55:41 +0000
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
 b=r4gzn8tmFUJpEmbiBTggocQNjGwngnxnUFg9iKHkuI5vADL5JWwPxQLKOZQ9BiqTHf1tiDnwN8qqS43Oq22xaekVS06fSjGtiMqPLw9/rS6o/PAc8g8LSkvQfWEdpvEME8DkuePDkhA1TeEwq5dzk98bLGZybMtEmGnBNEhUfdA7Qas1aaVoKWxNjBN8bTxTgJrRx1S9fkiO8F4Uh+qGyxA4P6c9aKdHkeYAQe+ZF19pNCNf/UDzpTSJeOTtOVo54fX5YvxATCo9JXVxn0bLzAvjVfHPatJi7lhKIk4BwKoNxQLdfuH/PG1DulcbyfXP/a3MTaS9NfVJ1YXoV1W9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4eO5jtFys8ChYYe95arSsDNkuvTyJBoxL0bZ27ksLQ=;
 b=NTLhesK+UnxMUpx/N+iOhOw2G0DzCMAWJ3W5xXdrQFBXogoUk+0sru5IhfjCGW/AywnqJvOdavrXwhl6CSxOKQHEu1rr33FgHJeMtHIkMwb7JvvV20QhS8Nnq8I+3apNWmFg/CuF7CJ28ANUqBqFO3sVWA1p+tQ1DNu0mYaEsvaPLKaEaqlEHKYlZCj7ka+KXWSv/UHbWqcn1CIAjuNXH3Z5z6eweCiHNCakMia1ryXmuEOUa5ITKpg+hu+NLK44jshsBcybcKnRBcW9b+E7t2xS9kNUzQtFuxQXCVJhIEdJQMJgznASIK7DzFPDeVdZtDVGT4OkURjdVtSch7FZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4eO5jtFys8ChYYe95arSsDNkuvTyJBoxL0bZ27ksLQ=;
 b=sa3sdOjMCdozgMlDICH/T7vP9+eJQTBGAM/Pr6EuobjwMeUvTz67791XIZo3YcJijxTFmAk8hr/F6a3vmXD1artTu12jmX5GCwcoRcvA6m70SkrP7cUmkyJWMLJGyAnyYHz06RAxG91HyvpYnCbb4pbs2EEkILi/wODziJc8jorWZV1+JEIWHdA29j6xSXe2z6eI/uC/kRP7+QsRn/i6CBEiQYCHV3Z4/CK8fxd5ZE77XovJfS3kRxF8HIMGROTKt4LLkkUyhWpIoHmu4Zv9eZMLrRTlXQGLqJl157Kwgmrn8CUja7bXlEPIkccFyCfSzTh0Qr7QBW/FcgJGPjlW3w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
Thread-Topic: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
Thread-Index: AQHdSsRkuuRG4YXur0mlXN3LfWLvYrbbzq2AgAClRwA=
Date: Wed, 23 Sep 2026 17:55:41 +0000
Message-ID: <d7f902ed-af19-4d06-8bea-b73b4b385533@epam.com>
References:
 <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
 <CAGeoDV8sN2P9nqHwxcYz72u+L-DEQDbOcHENvX=jpzJ2=Z-gNQ@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8sN2P9nqHwxcYz72u+L-DEQDbOcHENvX=jpzJ2=Z-gNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR03MB10049:EE_|VI0PR03MB10736:EE_
x-ms-office365-filtering-correlation-id: 023634e7-3df9-42c9-197d-08df199be239
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|5023799004|4133799003|11063799006|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 DQ2jZU/2PPy8K8EkYcInVRN/y6iKtTlipMuyF/kds8n2U75ZsdcrwBQfHLgHaMARK/aD4I/NU7T5hcSlpFhVHp+4q1yX1ONsuvmkAL6lmT12SGkVamtAIwtnMYUNPoBpi+Y2GPa3j4CeOzfNRpSXd3SXRnBtZnp+Ma+Czdw1LOSHTGQq/5pT+NaMYBPEWjaXVRXL1mjlWcAxLXG1mYOQC66wruCAkA+ek1H/YRW2kKKGeix0ptH7G45F43KOhmoM9PGzSrdYisbpgjhOe+IhIFUUvOi7PjECzHkzmRj7fg2UGkNrhSg2AcsqAsLR3qeUj+XZN7st2njDU6f7bWelEPUekQ35F1zeuV48hRwvKckYgvmwNUAdqyzuicKZTKuZi1VlD8iDFF3bPSP3kGHjf2Tz0/DsyOoFeMFK2u67NZoaBAKF/kehFqnM1a5+YoXZ2eG256lXoUf4Tq5N+gyRiF9M8dNatS6zkiB9eRF2Ic/BsjvrHkdsd7JXrpy/AzJbHr0WP6mKiU0TS0arqDRC5158lJibW+1PId5vvmrwBHGhY6DwZdkQOqFW/YN3m4OM3F0hjipYXxOw61E6AKO2ni1mPMI2eJlpB9qCBihiQYFFOqLSc+rj50nQZxaLg76wEy7qXKRVshF3WK6HKBlomYn9eT7+5f3ZtY6C7PoaVvJmYx8Kw3pdj/GVSEDEcBSa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR03MB10049.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(5023799004)(4133799003)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVRaa3RyWDZycTJIM3gvdVlrM3FaQkNZUG12QW1sbzJwSlFHM3JrRVBtanJT?=
 =?utf-8?B?azhBcVlkcmliTzNvS243eG92dkhuUkViT2cxUjBYY1pvN0hOVUlrczdPSjBu?=
 =?utf-8?B?bG03Z2w2V0JaU0VKYnROcHFybUVNd1VySkU3MEdsOWtMRHlDS1BNMldWbjl5?=
 =?utf-8?B?N0h5OHpwOURLT1hiNWYzQnQvYUptS3VSQnRGeVFYRTlYOWZSbjIrakNkYWtU?=
 =?utf-8?B?ZGZWYWs4azltRTZ0K3o2dWx2RVFFTC9xY0dOMjV6QXNwYXFlOFFDdVlwOEU1?=
 =?utf-8?B?ZW1sT2I5YVlwNjJJVGVJM1pFOCtpY3BLaXJHSjl4bFlha1l4V3J4c2FGUDRI?=
 =?utf-8?B?S29UNE5VMUcwRVdDZzIvQWs3Q2FIUktvbnVNT2p3djhRdGJxbG92czJyeWE3?=
 =?utf-8?B?TjJtKy9xMDF3T045OFUwcUxVM3p2bnYrRTNLSGUrUXM2dHhNMis4RDc0UFVW?=
 =?utf-8?B?ekFLb09pREJXaUxKNEtCSlVFMlErblFYQmg2TDh4YklPcnVnM2Z1MlpHUTBu?=
 =?utf-8?B?dVR0SG5ZVG1Nb3EwYmdnZ1hMNHpaamczbEVLWEtOdFN3ZzNlMGR3OVVzdzlG?=
 =?utf-8?B?TE5pdnlxMTltTG5NSkc0MWxlZlZiNUdDSlFrSlkrS242UHJRNnVzNWVFRmlF?=
 =?utf-8?B?YlFUZ2F5SUZXalh6Tytwc2wwTG1HQ1ovejVBeWhkcUJiZ3p1bUp1TkZrSnFP?=
 =?utf-8?B?aVZtZ3hPUTV4NldWZ2d0STdBQS9uMFhyNVBCamgybjdVRHJGcnBVR3M2L29a?=
 =?utf-8?B?WGE3N1lneWpVVi9NSGV1S2F1SER6QXhCcVFVdG1SVDYyNzdxMDMzd05EZHZB?=
 =?utf-8?B?cm9WVzV4MDdTOVpxYXVYa2dPTXUzMm9pS0I0MEFBdjZXOTVxSi85Wi9QWWYy?=
 =?utf-8?B?cThhamt1T2dJenFPYkJkWmxXV3o0dEs3YlRnd3FhajhnYUNEUmQrV1hXdHVS?=
 =?utf-8?B?VTJtQTBRT1M4b1d2Q29STUJaSERXeDNSUjZXcEpKOHFVcVZMc085QmMxSEI0?=
 =?utf-8?B?VDhEcVNkNFpJUzkwS2VJWHNZTnhOaVdCQWpaajhzbEdwMEY3V3RIaU4rYXFr?=
 =?utf-8?B?UEFOUExNV0s5ai9xRUhJbVg4WW4xRzFKOGxFNXdlNElBSmZYM3RJcFlMc1BX?=
 =?utf-8?B?NUNTYi9DZnZUSGR1cGxXSEhkTEJhdmd3SkNDUlYxblNXNytsSHNwYWoybDAx?=
 =?utf-8?B?ZndtT3dHcGtzcC93ZzJnOVE4dGhIOC9BOVpZb0xFTTBCanl0ei91cVQwOW8y?=
 =?utf-8?B?MktCUFc3MmJUaHJrY0FEUGFTM3U5bnpHM2J0TWtTUVJDQmUvN284dytuZkRS?=
 =?utf-8?B?TTVyL3RRd0IzaWdWSFdRTjhFdVF4d2t3bDdvUjg5ZDE5aUlvdlg1ZWVGNDls?=
 =?utf-8?B?U0RrOVUvQTMzZDhBWEE1azF6NXdOZW5qSlRBdkliTldWdXZxK09BR0tmc0pO?=
 =?utf-8?B?MldNYzk1SkxYQXQrZ0FmVy9ZeFpKQ295dUxzeE5HM1VBWjFyeURsakpHdGI0?=
 =?utf-8?B?aXF6alhuTmNXZXFWajlqZTNpVEF0T2tocXpTUzRUSE1IMDkxUzhwVzQ2TStz?=
 =?utf-8?B?THNVWSsrR1U1UkFIaDJzcHBxYUZwMWdHRzFPWG92eHlqdHhFV2psSG9YdHR6?=
 =?utf-8?B?UTd5cGhlUUFQVE1IdGNFTThLZEV3by9FTGs4SGJEcGZucFM0NFloTmh6NkJ6?=
 =?utf-8?B?N1ZBdndLSEwyVXRHQlpZNHlGRDJlNmRkQXZ5ZFgxd0MwZlBra1dacG5FUjA4?=
 =?utf-8?B?WTFnaVRqSERrRlllYU1MeTYzQXJkSWFuaFo4WmZEK0NNbCtabGJnY1dSNWlP?=
 =?utf-8?B?SlZhaGtCQUVXZ20rVUhqb01tN25uSitNR2tkUzZSY3pXU1FyZVRZQW5kTVJU?=
 =?utf-8?B?YmxkNStxZjRiWldDa1BVbkVLYlMwNFFXMkwrWmI1NWJUZDYrcUZmNzdEUzFk?=
 =?utf-8?B?dVJVdElGRkVudTFUdExrT2RLWDZ4Z2VZNDdwSytuK2hSS2dHeXExWDRYWUdx?=
 =?utf-8?B?cFJrWDloK0ZheUZ6UHJBRXJSbHNDRFRpSVpZa2FsMmlrZTBHbCs3bmNDU3Bu?=
 =?utf-8?B?ZGhSMmhJQ05kSnpnbE1QUTl0cjhidEpzbjE2Z056blREZkQwU1lhQjJMWTJ2?=
 =?utf-8?B?djZFTndPcHJSRk94UUpyMWhKckhEdmIyTCtHYTBTL0lJRittQ050L3dNRTA2?=
 =?utf-8?B?allkeHpkb3lON0dlYnNrUDRWbS9DMnBBZ2Q0Q01tY3J2cWRpcUZidk42OTNN?=
 =?utf-8?B?Q250MEdQQ2I3YlNVRmQrWXpzVkg5eERJNUpsbHZhMzQ4Ym1mZE1JWXdreFNa?=
 =?utf-8?B?NVJNZUNqZEJvUUlMQStHNTNzYWdVMjljb1p2Y0JBRXU3VzdyWUNHNHJtZE93?=
 =?utf-8?Q?w+pyz7Oqz9JfP3tg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8915C3B5D1BE604A90DC0A9AC79C6834@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR03MB10049.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023634e7-3df9-42c9-197d-08df199be239
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 17:55:41.4864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5h+5B58/80ut2PVWMrjAddrZvPu6K2wRwGIFk3ihEXJc6YVStPss894iCZZXhyoyw1GT06tLPQX141MQLiSiwEyu3k8gjRDgcEeywiw/tsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10736
X-purgate-ID: tlsNG-ebf023/1790186152-C10DDB50-B3A15848/0/0
X-purgate-type: clean
X-purgate-size: 7554

SGVsbG8gTXlrb2xhLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiA5LzIzLzI2
IDExOjA0LCBNeWtvbGEgS3ZhY2ggd3JvdGU6DQo+IEhpIExlb25pZCwNCj4NCj4gVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2guDQo+DQo+IE9uIFR1ZSwgU2VwIDIyLCAyMDI2IGF0IDk6NTnigK9QTSBM
ZW9uaWQgS29tYXJpYW5za3lpDQo+IDxMZW9uaWRfS29tYXJpYW5za3lpQGVwYW0uY29tPiB3cm90
ZToNCj4+DQo+PiBTaW5jZSB0aGUgZmlybXdhcmUgbWF5IGluaXRpYWxpemUgZVNQSXMgYmVmb3Jl
IFhlbiwgYW5kIHdpdGhvdXQNCj4+IENPTkZJR19HSUNWM19FU1BJIGVuYWJsZWQsIFhlbiB3b3Vs
ZCBub3QgcmVpbml0aWFsaXplIHRoZW0gcHJvcGVybHkNCj4+IGR1cmluZyBib290LiBJbiBzdWNo
IGNhc2VzLCBvbmNlIHRoZSBHSUMgaXMgcmUtZW5hYmxlZCBpbiBYZW4sDQo+PiBpbnRlcnJ1cHRz
IG1heSBiZSByZWNlaXZlZCB0aGF0IGNhbm5vdCBiZSBoYW5kbGVkLg0KPj4NCj4+IFRvIGVuc3Vy
ZSBwcm9wZXIgb3BlcmF0aW9uIG9uIGhhcmR3YXJlIHdpdGggZVNQSSBmZWF0dXJlLCBldmVuIHdo
ZW4gdGhlIGVTUEkNCj4+IGNvbmZpZyBpcyBkaXNhYmxlZCwgZ2ljdjNfZGlzdF9lc3BpX2NvbW1v
bl9pbml0KCkgc2hvdWxkIGJlIGludm9rZWQNCj4+IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBDT05G
SUdfR0lDVjNfRVNQSSBpcyBlbmFibGVkIG9yIG5vdC4gVGhpcyB3aWxsIG5vdA0KPj4gYWZmZWN0
IGhhcmR3YXJlIHdpdGhvdXQgZVNQSSBzdXBwb3J0LCBhcyB0aGUgZnVuY3Rpb24gY2hlY2tzIGlm
IHRoZQ0KPj4gaGFyZHdhcmUgc3VwcG9ydHMgZVNQSXMgYnkgcmVhZGluZyB0aGUgR0lDRF9UWVBF
Ui5FU1BJIGZpZWxkICh1c2luZw0KPj4gR0lDRF9UWVBFUl9FU1BJU19OVU0gbWFjcm8pLCB3aGlj
aCBpbmRpY2F0ZXMgd2hldGhlciB0aGUgZXh0ZW5kZWQgU1BJDQo+PiByYW5nZSBpcyBzdXBwb3J0
ZWQuIElmIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0IGVTUEksIHRoZSBmdW5jdGlvbg0K
Pj4gd2lsbCBub3QgcGVyZm9ybSBhbnkgYWN0aW9ucy4NCj4+DQo+PiBUaGVyZSBhcmUgbm8gZnVu
Y3Rpb25hbCBjaGFuZ2VzIGZvciBzZXR1cHMgd2hlcmUgQ09ORklHX0dJQ1YzX0VTUEk9eS4NCj4+
DQo+PiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBMZW9uaWQgS29tYXJpYW5za3lpIDxsZW9uaWRfa29tYXJpYW5za3lpQGVw
YW0uY29tPg0KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+
PiAtLS0NCj4+IENoYW5nZXMgaW4gdjI6DQo+PiAtIHJlYmFzZWQgb24gdGhlIGN1cnJlbnQgc3Rh
Z2luZw0KPj4gLSBwbGFjZWQgU3VnZ2VzdGVkLWJ5IHRhZyBmaXJzdCB0byBrZWVwIHRhZ3MgaW4g
Y2hyb25vbG9naWNhbCBvcmRlcg0KPj4gLSBhZGRlZCBBY2tlZC1ieSBmcm9tIEp1bGllbiBHcmFs
bA0KPj4NCj4+IFRoaXMgaXMgYSBmb2xsb3ctdXAgcGF0Y2ggcmVsYXRlZCB0byB0aGUgZGlzY3Vz
c2lvbjoNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC84MjA3MDRkMC00MDQ3
LTRmMDItYTA1OC0wMWRhYmEyNzY1ZjFAeGVuLm9yZy8NCj4+DQo+PiBTZW5kaW5nIHYyIHdpdGgg
dGhlIHJlcXVlc3RlZCBjaGFuZ2VzLCBhcyBJIG9ubHkgbm93IG5vdGljZWQNCj4+IHRoYXQgdGhp
cyBwYXRjaCBoYXMgbm90IGJlZW4gbWVyZ2VkIHlldC4NCj4+IC0tLQ0KPj4gICB4ZW4vYXJjaC9h
cm0vZ2ljLXYzLmMgICAgICAgICAgICAgICAgICB8IDMyICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tDQo+PiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfZGVmcy5oIHwgIDIgLS0N
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My5jIGIveGVuL2FyY2gvYXJt
L2dpYy12My5jDQo+PiBpbmRleCBhY2RhYzIyOTUzLi40NjM3NjlkNzdiIDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2dpYy12My5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMN
Cj4+IEBAIC03MDMsMTcgKzcwMywzMiBAQCB1bnNpZ25lZCBpbnQgZ2ljX251bWJlcl9lc3Bpcyh2
b2lkKQ0KPj4gICAgICAgcmV0dXJuIGdpY19od19vcHMtPmluZm8tPm5yX2VzcGk7DQo+PiAgIH0N
Cj4+DQo+PiArc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfZXNwaV9pbml0X2FmZih1aW50
NjRfdCBhZmZpbml0eSkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4gKw0KPj4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IGdpY3YzX2luZm8ubnJfZXNwaTsgaSsrICkNCj4+ICsgICAg
ICAgIHdyaXRlcV9yZWxheGVkX25vbl9hdG9taWMoYWZmaW5pdHksIEdJQ0QgKyBHSUNEX0lST1VU
RVJuRSArIGkgKiA4KTsNCj4+ICt9DQo+PiArI2Vsc2UNCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBf
X2luaXQgZ2ljdjNfZGlzdF9lc3BpX2luaXRfYWZmKHVpbnQ2NF90IGFmZmluaXR5KSB7IH0NCj4+
ICsjZW5kaWYNCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfZXNwaV9j
b21tb25faW5pdCh1aW50MzJfdCB0eXBlKQ0KPg0KPiBJIHRoaW5rIHRoZSBvcmRlcmluZyBpbiBn
aWN2M19kaXN0X2VzcGlfY29tbW9uX2luaXQoKSBuZWVkcyB0byBiZQ0KPiByZXZpc2l0ZWQgbm93
IHRoYXQgdGhpcyBmdW5jdGlvbiBpcyBhbHNvIGNhbGxlZCB3aXRoDQo+IENPTkZJR19HSUNWM19F
U1BJPW4uDQo+DQo+IFRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIHBhdGNoIGlzIHRoYXQgZmlybXdh
cmUgbWF5IGhhdmUgbGVmdCBhbiBlU1BJDQo+IGVuYWJsZWQuIEhvd2V2ZXIsIHdlIGN1cnJlbnRs
eSBwcm9ncmFtIEdJQ0RfSUNGR1JuRSBiZWZvcmUgY2xlYXJpbmcNCj4gdGhlIGNvcnJlc3BvbmRp
bmcgZW5hYmxlIGJpdCBpbiBHSUNEX0lDRU5BQkxFUm5FLg0KPg0KPiBUaGUgR0lDIGFyY2hpdGVj
dHVyZSByZXF1aXJlcyBhbiBpbnRlcnJ1cHQgdG8gYmUgaW5kaXZpZHVhbGx5IGRpc2FibGVkDQo+
IGJlZm9yZSBjaGFuZ2luZyBJbnRfY29uZmlnOyBvdGhlcndpc2UgdGhlIGJlaGF2aW9yIGlzIFVO
UFJFRElDVEFCTEUuDQo+IFNlZSBBcm0gSUhJIDAwNjlILmIsIHNlY3Rpb24gMTIuOS45IChHSUNE
X0lDRkdSPG4+KS4NCj4NCg0KU2VjdGlvbiAxMi45LjkgZGVzY3JpYmVzIEdJQ0RfSUNGR1I8bj4s
IGkuZS4gdGhlIHJlZ3VsYXIgU1BJIHJhbmdlLCBhbmQNCml0IGluZGVlZCBjb250YWlucyB0aGlz
IHJlcXVpcmVtZW50LiBIb3dldmVyLCB0aGUgY29kZSBpbg0KZ2ljdjNfZGlzdF9lc3BpX2NvbW1v
bl9pbml0KCkgcHJvZ3JhbXMgR0lDRF9JQ0ZHUjxuPkUsIHdoaWNoIGlzDQpkZXNjcmliZWQgaW4g
MTIuOS4xMCwgYW5kIEkgY291bGQgbm90IGZpbmQgYW4gZXF1aXZhbGVudCByZXF1aXJlbWVudCB0
aGVyZS4NCg0KVGhlIG9ubHkgcmVsYXRlZCBydWxlIEkgZm91bmQgdGhhdCBhbHNvIGNvdmVycyB0
aGUgZXh0ZW5kZWQgU1BJIHJhbmdlIGlzDQppbiBBcm0gSUhJIDAwNjlILmIgc2VjdGlvbiA0LjU6
DQoNCiJDaGFuZ2luZyB0aGUgY29uZmlndXJhdGlvbiBvZiBhbiBpbnRlcnJ1cHQgZnJvbSBsZXZl
bC1zZW5zaXRpdmUgdG8NCmVkZ2UtdHJpZ2dlcmVkLCBvciBmcm9tIGVkZ2UtdHJpZ2dlcmVkIHRv
IGxldmVsLXNlbnNpdGl2ZSwgd2hlbiB0aGVyZSBpcw0KYSBwZW5kaW5nIGludGVycnVwdCwgbGVh
dmVzIHRoZSBpbnRlcnJ1cHQgaW4gYW4gVU5LTk9XTiBzdGF0ZS4iDQoNClRoYXQgcnVsZSBpcyBh
Ym91dCB0aGUgcGVuZGluZyBzdGF0ZSByYXRoZXIgdGhhbiB0aGUgZW5hYmxlIHN0YXRlLCB0aG91
Z2guDQoNCkFsc28sIHRoZSBjdXJyZW50IGVTUEkgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UgbWly
cm9ycyB0aGUgb25lIHVzZWQgZm9yDQpyZWd1bGFyIFNQSXMgaW4gZ2ljdjNfZGlzdF9pbml0KCks
IHdoZXJlIHRoZSByZXF1aXJlbWVudCBmcm9tIDEyLjkuOQ0KZG9lcyBhcHBseS4gU28gaWYgd2Ug
ZGVjaWRlIHRvIHJlb3JkZXIgdGhlIGluaXRpYWxpemF0aW9uLCBJIHRoaW5rIGl0DQpzaG91bGQg
YmUgZG9uZSBmb3IgcmVndWxhciBTUElzIGFzIHdlbGwsIGlkZWFsbHkgaW4gYSBzZXBhcmF0ZQ0K
cHJlcGFyYXRvcnkgcGF0Y2guDQoNCj4gV2UgYWxzbyByZWx5IG9uIHRoZSBzYW1lIHJlcXVpcmVt
ZW50IGluIGdpY19zZXRfaXJxX3R5cGUoKS4NCj4NCj4gU28gc2hvdWxkbid0IHdlIGRpc2FibGUv
ZGVhY3RpdmF0ZSBhbGwgZVNQSXMgYmVmb3JlIHByb2dyYW1taW5nDQo+IEdJQ0RfSUNGR1JuRT8g
TGludXggYWxzbyBpbml0aWFsaXplcyB0aGUgZXh0ZW5kZWQgU1BJIHJhbmdlIGluIHRoaXMNCj4g
b3JkZXI6IElDRU5BQkxFUm5FL0lDQUNUSVZFUm5FIGZpcnN0LCBmb2xsb3dlZCBieSBJR1JPVVBS
bkUsDQo+IElDRkdSbkUgYW5kIElQUklPUklUWVJuRS4NCj4NCj4gVGhpcyBpc3N1ZSBhbHJlYWR5
IHNlZW1zIHRvIGV4aXN0IGZvciB0aGUgQ09ORklHX0dJQ1YzX0VTUEk9eSBwYXRoLA0KPiBidXQg
dGhpcyBwYXRjaCBtYWtlcyBpdCByZWxldmFudCB0byB0aGUgbmV3bHkgYWRkZWQgQ09ORklHPW4g
cGF0aCwNCj4gd2hlcmUgYW4gZVNQSSBsZWZ0IGVuYWJsZWQgYnkgZmlybXdhcmUgaXMgcHJlY2lz
ZWx5IHRoZSBjYXNlIHdlIGFyZQ0KPiB0cnlpbmcgdG8gaGFuZGxlLg0KPg0KPiBBbHNvLCB3ZSBj
b3VsZCBkaXNhYmxlL2RlYWN0aXZhdGUgZVNQSXMgZm9yIGFsbCBidWlsZHMsIHdoaWxlIGtlZXBp
bmcNCj4gdGhlIHJlc3Qgb2YgdGhlIGVTUEkgY29uZmlndXJhdGlvbiB1bmRlciBDT05GSUdfR0lD
VjNfRVNQSS4gVGhpcyB3b3VsZA0KPiBhdm9pZCBhY2Nlc3NpbmcgdGhlIG90aGVyIGVTUEkgcmVn
aXN0ZXJzIGluIGJ1aWxkcyB3aXRob3V0IGVTUEkNCj4gc3VwcG9ydCwgdW5sZXNzIHRoZXJlIGlz
IGEgcGFydGljdWxhciByZWFzb24gdG8gaW5pdGlhbGl6ZSB0aGVtIHRoZXJlLg0KPg0KDQpUaGlz
IGlzIGEgZmFpciBwb2ludCwgYnV0IEkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIGNsYXJpZnkgd2l0
aCB0aGUgQXJtDQptYWludGFpbmVycyBmaXJzdCB3aGV0aGVyIHRoZSBTUEkvZVNQSSBpbml0aWFs
aXphdGlvbiBvcmRlciBzaG91bGQgYmUNCmNoYW5nZWQgaW4gYSBzZXBhcmF0ZSBwcmVwYXJhdG9y
eSBwYXRjaCwgYXMgdGhlIGNvZGUgZm9yIHRoaXMgcGF0Y2gNCmRlcGVuZHMgb24gdGhlIGFuc3dl
ci4gQXMgbWVudGlvbmVkIGFib3ZlLCBJIGNvdWxkIG5vdCBmaW5kIHN1Y2ggYQ0KcmVzdHJpY3Rp
b24gZm9yIGVTUElzOyBpdCBhcHBsaWVzIG9ubHkgdG8gcmVndWxhciBTUElzLiBJZiB0aGUNCm1h
aW50YWluZXJzIGFncmVlIHRvIGNoYW5nZSB0aGUgc2VxdWVuY2UgZm9yIGJvdGggU1BJcyBhbmQg
ZVNQSXMsIEkgY2FuDQpwcmVwYXJlIGEgc2VwYXJhdGUgcGF0Y2ggYW5kIHVwZGF0ZSB0aGlzIHBh
dGNoIGFjY29yZGluZ2x5Lg0KDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZC4NCg==

