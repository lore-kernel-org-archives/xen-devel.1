Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515E606B15F
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Wttdspyt
Received: from list by lists.xenproject.org with outflank-mailman.1481323.1685176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi6n-0007rh-BE; Tue, 10 Nov 2026 09:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481323.1685176; Tue, 10 Nov 2026 09:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi6n-0007ra-7Y; Tue, 10 Nov 2026 09:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1481323;
 Tue, 10 Nov 2026 09:25:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xQi6l-0007rU-M0
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:25:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi6l-00AP5p-2J
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:25:39 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6af2e30d-2eae-0a2a0a5409dd-0a2a4508a9f4-24
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:25:39 +0100
Received: from [40.107.159.95]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6af2e30e-f659-0a2a45080019-286b9f5ff46d-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:25:38 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM9PR03MB7265.eurprd03.prod.outlook.com (2603:10a6:20b:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 09:25:33 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 09:25:33 +0000
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
 b=ifoNSMyHuV6R+hGNRhk35AReGOk+LxT+InbQLGA8cdO2Zgt9YWejtp6O04HXrilBFSTBI4Iu0p0sGhzQpVPP34W6yh3KrShJNuNYT0OlnohUkCRfeWIsufvY/eTnHJZYa/fG834Ubtg9KzHRIC4idbsR4WLUFWPBv3KfsgM4PtoZsZ2frOEcRORRGEFOITXKttePzSyPRXh8ywL/ydGY3VYkZW4e8CVjc8wONKhOAk6EtvwTGIXFGvoNEZ04n5+eKJ8bjKC7wvgACLFwuruXeF9pw7RtdB04xoWF3BbSOco0Be3PmE0xBVJ9HQ1E3JsnkXA9TQ5IjYoXv7igJi4B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhyomJfgJIgsonxncZ868sPYlVtEL7oXP673nxF7Bis=;
 b=KN1nzU03bh5vc3LivpFiXjYmPxPyoJhHbLLKFWUT2E1lusrck5a1yoKRdeCw0+27rBmYTHtmJkDM5GMi0oG34HevHiGXIUD+mx2bqJPuRSbVjRlZBhr3vVhCDCWDy29WzsRJxCCiaq8MCf+sgOAQGyk2o7Y4YXpvrx+Y4yqa+dAo+7xrzQOgfMreoulw0YOm/my7QSfPbYVpwDnyCcBbW4bXHHprI/SPYoQXoPn2dCm4h6nyLf0hqMfvgeDUAqhdhPR2r5P4dYS6VYoKQYkOptUohzOKYwMlkr2yEU1cWwhnK3/KIV1Rd7R4KQmsoGz6ANefev8IFYicJcnWfmac3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhyomJfgJIgsonxncZ868sPYlVtEL7oXP673nxF7Bis=;
 b=WttdspytLeD/NMwekF0OkF1aYo1SVo5EgguiugKNGM1cHxl9TwY1+mNI7ALljrF1ZeFOClb9Aqyd4RGus4iKI1ySTw2Fs1UNq8g2zed/7O9tllrbUPrBUFO6FlMrHmM4NF97GhlhiaD5N1mieahsgHu7BddDI6J4BNJ/4fTa/tCRrfTRhT6eyG/i2AiAGeDHwLBmZrXO9CyT9bXtk7g9x/VcmUmrNNIAwBYGPRJQp5i5A584dz/C47BXjpsZMPzWInu9lWJb9bsgxULTaqQUGnnTrbElS+KTkUlsudUDbea7XSuSfWbwasWAXJSzLtFbQ11L1OydJ5ct7Zs26pOkEA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: [PATCH v2] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
Thread-Topic: [PATCH v2] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
Thread-Index: AQHdcPVvjdeDkUlAQk2bIG7MPIQshw==
Date: Tue, 10 Nov 2026 09:25:32 +0000
Message-ID:
 <810b14fef78b77572a87a7268aa718274b975f80.1794298911.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AM9PR03MB7265:EE_
x-ms-office365-filtering-correlation-id: 7f3d5aad-ed1d-4fa2-d636-08df3f0c91ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|42112799006|376014|366016|1800799024|18002099003|6133799003|10067099003|3023799007|38070700021|11063799006|261009223027099003|261102123227099003|261102124527099003|261026121527099003|261028144727099003|56012099006|261022105027099003|261022075727099003|261009221227099003|261021121427099003|261021123027099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003;
x-microsoft-antispam-message-info:
 SowNl6tZ67LkBxL4hjF7n3qKKhGA0tN2CCJGdq8NROiMGRJ7HnWjefEgFUNjUfPJRL3L12xxrv42kd8D716rskTODajQFyPtYSBqyIOm7ri9pPK/RhUNDntpyjuSlMX5Pn+h642oY50UqAJ/NIk/ATZSpfmjqeDmLTV66G1ITaMxqu0arTpBD9sWmnuDV36N8uvkhPYzKiypG9j/MxVcGJowXQaLqmPSAmUH7HS5bzGzGwH6mo+cAWDW5T7aucTJQrKrq56crQkY3ZoNRl/VKA+S9aOe7RAzCdTwuX8GTnecmw1GLUkp5dCYZQQx8o2RyPQWUGbzvlTXqtxzOTQKbiR37gKfpoJm5QBXXpx2ktSgrRTz5xqgcR/hczR0Zw2E5hWiih6PHd90vYGiWtz5fkJOX9zlQi/+kBHGYkTT3Ap6uqKjAODVGCtNU8HdWrToD/vUDgRH4zkXMgLIVicrVnv/NrtjlPhy9xxBo7ZzivcOLer+AkvQj8fAd2HqfhyDO5+VxVTyBz6qpU9p3ocV1UBQXOGDOYPG8tQc1xZn/BSbsxQB8t5e/si7PR2k3RWriYyOPXv0moIk8S9qE6mdPAN6BmjT/GohMI/kphW7NFaKoYa2LG7RgobspdW09c+YH4Uo42zcP/XwvNQQRaTLTPskFqCa39QghKlDsG4qMsY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(42112799006)(376014)(366016)(1800799024)(18002099003)(6133799003)(10067099003)(3023799007)(38070700021)(11063799006)(261009223027099003)(261102123227099003)(261102124527099003)(261026121527099003)(261028144727099003)(56012099006)(261022105027099003)(261022075727099003)(261009221227099003)(261021121427099003)(261021123027099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MU9LbDBMd2RnRTFyOEg0RW5UZ1pYdk92c3ZxYm90SEpYZHVwdDFlK25GNGkx?=
 =?utf-8?B?V2U0NzBIajdGS1poVTZ0T1RSY0dzSHlwTTh5TDVOeGtuRDBrZERNZG0zNjc2?=
 =?utf-8?B?cVd0VmFHaDM0UDNuZXZ0ak5CeCtCd1I2QStyU1JOQWZ0dExacDlvcUlCbXBN?=
 =?utf-8?B?K1d2bTMxZjFaamZqNmp2YlVrc1k0NEtvU21jN2dIZkd2d3hJY2twbllrSW5Z?=
 =?utf-8?B?ZGJoRlQ3anBHMWMyMWw2M0RFRDVrNjExZmRURFRPcXgwNWxlVjM5T3IwM2wy?=
 =?utf-8?B?ZUprNHp3NWJGbTk5ZEprdVFiOTFJby9MbFJkb0Z3c3RONkYrbW45NFZsWGZN?=
 =?utf-8?B?MjUwYjlJNWtwaFRjTWdEUVZKZ2s0aHJ6ZTBhWEVsRzVBaGxBQ3kvYVViZmhw?=
 =?utf-8?B?ZlVjblJRdGRxV2l2SjNmOFhiZ1lsNXk2a1VUMlFHWUNhQkZhWjRHaGVxSHFo?=
 =?utf-8?B?c0hDbGxXbHAwdE1xaWV4QlNObG8rNkp3RWs5U2xESG1JZ2hKRmNWKzl6ZDho?=
 =?utf-8?B?bDVsT3FJRTErRWMzZDdaenYyUVpDT2l5YlE1ekptckpPQkFoMnNtS0gyZGUv?=
 =?utf-8?B?c2xMYmEyb29RUGU2NmcrWWNtanFmMnVCUEVjekV3WTI4cDFJVnFZOGVGWlIr?=
 =?utf-8?B?L3Y1YWtQeWp5Y3VLRVg0SG1JOGZQdjVHSTdueXIrQ3JmZkdOQ1JrREF6UWRi?=
 =?utf-8?B?bThiczE4MzQrZ054SFpQTkdseUdvYmlWdTBkV3IvZ0FSaGJQTDlrekdOVllB?=
 =?utf-8?B?V3o4dEZKMnBFdjRHZkNPRG4zWGFCbFpKc0I1Y2VVTjdkYlB4SHJIdWxuSFZr?=
 =?utf-8?B?OG1jNFFCTFUycWp2UzRvN3pwZjJTZXhob1FlS1I4SzIzY3VrMDhkSkdyTmlr?=
 =?utf-8?B?OGNtZTNmc0xEV0VaMmFBK2pWdFZHaGpoOHNuTnM1TDlPNVZQaHZRQVl5SEJL?=
 =?utf-8?B?elUvMGhxN2g4ZkZVSW14SU1UcTdNL1laMlQ1RFRZV0k1UDMwSXJ6ejZMYVd6?=
 =?utf-8?B?ZW1EWjZvMFg0d0txMlZhbjIzVE8wdHhsMnFtM0RFRmhwUFNidDh2YVM2S0ZL?=
 =?utf-8?B?Zzd2bytFa0lrQmNpWnhCMFFFQkdyaHR5S1ZtbzV4QWV6bVhEclZ2a1RXQzh2?=
 =?utf-8?B?Ym1Tblp5OFhTaktsd0dHdkMycGVzSURSRXI3VnBva3NsY0RmRUk5OEdRK2dV?=
 =?utf-8?B?TXM1U1B1VkluWStEYlNQZGxvTG9yZWF5RTluVlNPYlRNaUxVTkYwcnM3b3pJ?=
 =?utf-8?B?WTJSUUlNN2RMUzRSUjlmaUNUMzJWck5ZbGJhbGNWZ3hNdDJnSDdQN2tLbVh3?=
 =?utf-8?B?VWxaaUgwOVRzb0RneUx5VW51WVVPM1F0eW53NnUxL1M0aFlmMVhjelRsclMx?=
 =?utf-8?B?UzE5L01uNEFCUnMzZ2JBQXVGeSs3N2R2SFl2VnRMV0ZPREMzcHJoUHdXWTQx?=
 =?utf-8?B?K2NPQm5MZURlUDJBWk9JRmVQNSthM2E1VHZoTGpWWmdKRmhsMkFRbjVSQkdz?=
 =?utf-8?B?ajJNTm5ZWk41UHB6NWFuU2Y4MHhhdUFYMjlPemtxTUhaRC8rMGQ5cUpUWkRp?=
 =?utf-8?B?VXVGMGIwT0VXYm1sRVJBckh4c1JUNVVHOUNXWmwvcUdOQ3pXSG10aktqMFhY?=
 =?utf-8?B?SGlpcG9vU1RBSzNkWHY3Y3R2Z1BFUzYvV2hiVVRsV2VVSDZ5YUtQdFRnT0Mr?=
 =?utf-8?B?dEJEZHphMG1vN1lWYTIxWGpJcFdtU0hwcStxaWtqSHB1UFNEYXRPWGlveEdx?=
 =?utf-8?B?TG94RHdiQ1gwWFA0OWQ3d3dWS0JHRHJ2YnBJRkFPWE5ZZndoZzYvY0x1c1ho?=
 =?utf-8?B?b0taQjRLSWVUNWU0NDRDVVNXZktONWZ1K08rZ3RpZkxnVlVzM2dDRjVZbzBu?=
 =?utf-8?B?amlrSk1kK08zSEhjbitxZXNxNUs2U0RYMDhMNEVHYWNVa2ZOTlF1VzNCS3NG?=
 =?utf-8?B?UnJwRzM3MTRBT2h2cGN0M2ZkZEZIZ3FPNFFyaE12RlZpS1JrMEJCNW1jWExk?=
 =?utf-8?B?Q3Q3YXpSMUl6U0FGTTlKcXhyOWFlSytzRlBnNnorQXcwcmhMZEwwRk9pRkJp?=
 =?utf-8?B?TEluMHNLbUZJQjFwblBsQ0p0VGgvTnNZT2Ivbm81RVloZXFVS3l5c2EvYkM5?=
 =?utf-8?B?THJLSkIzdzVkdkFJT1NUR2hkdTRNVlJ0dUVweVAwaHdrVGpOODJSUENwRHpL?=
 =?utf-8?B?MlBucjI0UDJJZW1ZNWtsRysvREkzWjVDUVNMa3c5SUxoMnNaOVVmSTF0L1FJ?=
 =?utf-8?B?SjhVZERiUlplb09XUGlnWU12T09uNWhOQzlrekkzNEp2M2EzdGcxbnF6eGND?=
 =?utf-8?B?WW0yeUg3UzZ6aGErN0lldWFiQjI5ckczdUtjUXBzMERSQk1rUVM5UVBneGk0?=
 =?utf-8?Q?Qdg38YOGnNSRNFXA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3d5aad-ed1d-4fa2-d636-08df3f0c91ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 09:25:33.0121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLswC5hCQzZcn3mqsyLmmVORHn7wXzxMdo7dbAm9s783QqhU+liCvH0yecHdGuwhdecUmD8QByRHmR8jFFt0mq019moldi/Bytlo7C8dgi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7265
X-purgate-ID: tlsNG-c1860d/1794302738-CC77387B-9AD5AFAD/0/0
X-purgate-type: clean
X-purgate-size: 7272
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDEwLjEgc3RhdGVzOiAiT3BlcmFuZHMgc2hhbGwgbm90IGJlIG9mIGFuIGlu
YXBwcm9wcmlhdGUNCmVzc2VudGlhbCB0eXBlIi4NCg0KVGhlIHJlc3VsdCBvZiByZWxhdGlvbmFs
LCBlcXVhbGl0eSBhbmQgbG9naWNhbCBuZWdhdGlvbiBvcGVyYXRvcnMgaGFzDQp0eXBlIGludCBh
bmQgdmFsdWUgMCBvciAxIChDOTkgNi41LjhwNiwgNi41LjlwMywgNi41LjMuM3A1KS4gQW4gb2Jq
ZWN0DQpvciBmdW5jdGlvbiByZXN1bHQgb2YgdHlwZSBib29sIGhhcyB2YWx1ZSAwIG9yIDEgdG9v
LCBhbmQgaXQgaXMNCnByb21vdGVkIHRvIGludCAoQzk5IDYuMy4xLjIsIDYuMy4xLjFwMikuIFVz
aW5nIHRoYXQgdmFsdWUgYXMgYW4NCm9wZXJhbmQgb2YgYmluYXJ5ICssIC0sICosIDw8LCA+Piwg
PCwgPiwgPD0sID49IGFuZCBvZiArPSwgLT0sICo9LA0KPDw9LCA+Pj0gaXMgd2VsbC1kZWZpbmVk
LiBEaXZpc2lvbiwgcmVtYWluZGVyLCB1bmFyeSBwbHVzIGFuZCBtaW51cywNCmFuZCB0aGUgaW5j
cmVtZW50IG9wZXJhdG9ycyBzdGF5IGNvdmVyZWQgYnkgdGhlIHJ1bGUuIFVwZGF0ZSB0aGUNCkVD
TEFJUiBjb25maWd1cmF0aW9uIHRvIHRhZyB0aGUgYWNjZXB0ZWQgdXNlcyBhcyBzYWZlLg0KDQpV
cGRhdGUgZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdCBhbmQgcnVsZXMucnN0IGFjY29yZGluZ2x5
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsx
QGVwYW0uY29tPg0KLS0tDQpUZXN0IENJIHBpcGVsaW5lOg0KaHR0cHM6Ly9naXRsYWIuY29tL3hl
bi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hlbi8tL3BpcGVsaW5lcy8zMDQ4NjUxMzIzDQoN
CkNoYW5nZXMgaW4gdjI6DQotIHVzZSB0aGUgc2FtZSBvcGVyYXRvciBsaXN0IGluIHRoZSBFQ0xB
SVIgY29uZmlnLCBkZXZpYXRpb25zLnJzdCBhbmQgcnVsZXMucnN0DQotIGV4dGVuZCBkZXZpYXRp
b24gdG86ICssIC0sICosICs9LCAtPSwgKj0sIDw8LCA+PiwgPDw9LCA+Pj0sIDwsID4sIDw9LCA+
PQ0KLSBsZWF2ZSB0aGUgZnVsbCBleHBsYW5hdGlvbiBpbiBkZXZpYXRpb25zLnJzdCwgRUNMQUlS
IGNvbmZpZyBkb2Mgb25seSBuYW1lcyB0aGUgb3BlcmF0b3JzIGFuZCBwb2ludHMgdGhlcmUNCg0K
TGluayB0byB2MToNCmh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuL2E1MzYyMTJkOWNiMThiNWMyM2Qw
NmMxYzA2YjlhOGFlMDM5NDE0NDAuMTc5MjQyODYyNi5naXQuZG15dHJvLl81RnByb2tvcGNodWsx
QGVwYW0uY29tLw0KLS0tDQogLi4uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5l
Y2wgICAgIHwgIDQgKysrKw0KIGRvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgICAgICAgICAgICAg
ICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysNCiBkb2NzL21pc3JhL3J1bGVzLnJzdCAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysrDQogMyBmaWxlcyBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9F
Q0xBSVIvZGV2aWF0aW9ucy5lY2wgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIv
ZGV2aWF0aW9ucy5lY2wNCmluZGV4IDZjZGIxMGExMjkuLjFkOGY1YWI2NTcgMTAwNjQ0DQotLS0g
YS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCisrKyBi
L2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KQEAgLTMz
NSw2ICszMzUsMTAgQEAgc3RpbGwgbm9uLW5lZ2F0aXZlLiINCiAtY29uZmlnPU1DM0EyLlIxMC4x
LGV0eXBlcys9e3NhZmUsICJzdG10KG9wZXJhdG9yKGxvZ2ljYWwpfHxub2RlKGNvbmRpdGlvbmFs
X29wZXJhdG9yfHxiaW5hcnlfY29uZGl0aW9uYWxfb3BlcmF0b3IpKSIsICJkc3RfdHlwZShlYm9v
bHx8Ym9vbGVhbikifQ0KIC1kb2NfZW5kDQogDQorLWRvY19iZWdpbj0iQSAwLW9yLTEgQm9vbGVh
biBvcGVyYW5kIG9mIGJpbmFyeSArLCAtLCAqLCA8PCwgPj4sIDwsID4sIDw9LCA+PSBhbmQgb2Yg
Kz0sIC09LCAqPSwgPDw9LCA+Pj0gaXMgc2FmZS4gU2VlIGRvY3MvbWlzcmEvZGV2aWF0aW9ucy5y
c3QgZm9yIHRoZSBmdWxsIGV4cGxhbmF0aW9uLiINCistY29uZmlnPU1DM0EyLlIxMC4xLGV0eXBl
cys9e3NhZmUsICJzdG10KG9wZXJhdG9yKGFkZHx8c3VifHxhZGRfYXNzaWdufHxzdWJfYXNzaWdu
fHxtdWx8fG11bF9hc3NpZ258fHNobHx8c2hyfHxzaGxfYXNzaWdufHxzaHJfYXNzaWdufHxsdHx8
Z3R8fGxlfHxnZSkpIiwgInNyY190eXBlKGVib29sfHxib29sZWFuKSJ9DQorLWRvY19lbmQNCisN
CiAtZG9jX2JlZ2luPSJUaGUgbWFjcm8gSVNPTEFURV9MU0IgZW5jYXBzdWxhdGVzIGEgd2VsbC1r
bm93biBwYXR0ZXJuIHRvIG9idGFpbg0KIGEgbWFzayB3aGVyZSBvbmx5IHRoZSBsb3dlc3QgYml0
IHNldCBpbiB0aGUgYXJndW1lbnQgaXMgc2V0LCBpZiBhbnksIGZvciB1bnNpZ25lZA0KIGludGVn
ZXJzIGFyZ3VtZW50cyBvbiB0d28ncyBjb21wbGVtZW50IGFyY2hpdGVjdHVyZXMNCmRpZmYgLS1n
aXQgYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0IGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJz
dA0KaW5kZXggNmJjYzJhZGY5NS4uZWIyZjM5M2VjNSAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzcmEv
ZGV2aWF0aW9ucy5yc3QNCisrKyBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCkBAIC0zNDcs
NiArMzQ3LDI2IEBAIERldmlhdGlvbnMgcmVsYXRlZCB0byBNSVNSQSBDOjIwMTIgUnVsZXM6DQog
ICAgICAgIHdlbGwta25vd24gdG8gYWxsIFhlbiBkZXZlbG9wZXJzIHRvIGJlIGEgY29tcGFyaXNv
biB3aXRoIDAuDQogICAgICAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCiANCisgICAq
IC0gUjEwLjENCisgICAgIC0gVGhlIHJlc3VsdCBvZiByZWxhdGlvbmFsLCBlcXVhbGl0eSBhbmQg
bG9naWNhbCBuZWdhdGlvbiBvcGVyYXRvcnMgaGFzDQorICAgICAgIHR5cGUgaW50IGFuZCB2YWx1
ZSAwIG9yIDEgKEM5OSA2LjUuOHA2LCA2LjUuOXAzLCA2LjUuMy4zcDUpLiBBbiBvYmplY3QNCisg
ICAgICAgb3IgZnVuY3Rpb24gcmVzdWx0IG9mIHR5cGUgYm9vbCBoYXMgdmFsdWUgMCBvciAxIHRv
bywgYW5kIGl0IGlzDQorICAgICAgIHByb21vdGVkIHRvIGludCAoQzk5IDYuMy4xLjIsIDYuMy4x
LjFwMikuIFN1Y2ggYSB2YWx1ZSBpcyBhDQorICAgICAgIHdlbGwtZGVmaW5lZCBvcGVyYW5kIG9m
IHRoZSBmb2xsb3dpbmcgb3BlcmF0b3JzLiBUaGVzZSBhcmUgdGhlIG9wZXJhdG9ycw0KKyAgICAg
ICBmb3Igd2hpY2ggdGhhdCAwLW9yLTEgb3BlcmFuZCBoYXMgYSBjbGVhciBtZWFuaW5nLiBCaW5h
cnkgKyBhbmQgLQ0KKyAgICAgICAoYW5kICs9IGFuZCAtPSkgY291bnQgc29tZXRoaW5nIGlmIHRo
ZSBjb25kaXRpb24gaG9sZHMuIFwqIChhbmQgXCo9KQ0KKyAgICAgICB5aWVsZHMgdGhlIG90aGVy
IG9wZXJhbmQgaWYgdGhlIGNvbmRpdGlvbiBob2xkcyBhbmQgMCBvdGhlcndpc2UuDQorICAgICAg
IDw8IGFuZCA+PiAoYW5kIDw8PSBhbmQgPj49KSBleHRlbmQgdGhhdCBzZWxlY3Rpb24gdG8gYSBz
aGlmdDogYSBCb29sZWFuDQorICAgICAgIGxlZnQgb3BlcmFuZCBjb250cmlidXRlcyAwIG9yIDEs
IGFuZCBhIEJvb2xlYW4gcmlnaHQgb3BlcmFuZCBpcyBhIHNoaWZ0DQorICAgICAgIGNvdW50IG9m
IDAgb3IgMS4gVGhlIG9wZXJhdG9ycyA8LCA+LCA8PSBhbmQgPj0gY29tcGFyZSB0aGUgc2FtZSAw
LW9yLTENCisgICAgICAgdmFsdWUsIHNvIGZhbHNlIGNvbXBhcmVzIGxlc3MgdGhhbiB0cnVlLiAv
IGFuZCAlIChhbmQgLz0gYW5kICU9KSBhcmUNCisgICAgICAgZXhjbHVkZWQuIEEgQm9vbGVhbiBk
aXZpc29yIGlzIDAgd2hlbiB0aGUgY29uZGl0aW9uIGlzIGZhbHNlLCBhbmQNCisgICAgICAgZGl2
aXNpb24gb3IgcmVtYWluZGVyIGJ5IHplcm8gaXMgdW5kZWZpbmVkIGJlaGF2aW9yIChDOTkgNi41
LjVwNSkuDQorICAgICAgIFVuYXJ5IHBsdXMsIHVuYXJ5IG1pbnVzLCBpbmNyZW1lbnQgYW5kIGRl
Y3JlbWVudCBhcmUgZXhjbHVkZWQgdG9vOg0KKyAgICAgICB1bmFyeSBtaW51cyB5aWVsZHMgMCBv
ciAtMSwgYW5kIG5vbmUgb2YgdGhlc2UgaXMgb25lIG9mIHRoZSBtZWFuaW5ncw0KKyAgICAgICBh
Ym92ZSwgc28gdGhlIHJ1bGUgc3RpbGwgYXBwbGllcyB0byB0aGVtLg0KKyAgICAgLSBUYWdnZWQg
YXMgYHNhZmVgIGZvciBFQ0xBSVIuDQorDQogICAgKiAtIFIxMC4xDQogICAgICAtIFhlbiBvbmx5
IHN1cHBvcnRzIGFyY2hpdGVjdHVyZXMgd2hlcmUgc2lnbmVkIGludGVnZXJzIGFyZSByZXByZXNl
bnRlbmQNCiAgICAgICAgdXNpbmcgdHdvJ3MgY29tcGxlbWVudCBhbmQgYWxsIHRoZSBYZW4gZGV2
ZWxvcGVycyBhcmUgYXdhcmUgb2YgdGhpcy4gRm9yDQpkaWZmIC0tZ2l0IGEvZG9jcy9taXNyYS9y
dWxlcy5yc3QgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0KaW5kZXggYTU5Y2YxNzgyZS4uYTcyNDVi
ZThjNiAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzcmEvcnVsZXMucnN0DQorKysgYi9kb2NzL21pc3Jh
L3J1bGVzLnJzdA0KQEAgLTM4Nyw2ICszODcsMTAgQEAgbWFpbnRhaW5lcnMgaWYgeW91IHdhbnQg
dG8gc3VnZ2VzdCBhIGNoYW5nZS4NCiAgICAgICAgICAgIGNvbXBpbGVycycgZXh0ZW5zaW9ucykN
CiAgICAgICAgICAtIEltcGxpY2l0IGNvbnZlcnNpb25zIHRvIGJvb2xlYW4gZm9yIGNvbmRpdGlv
bmFscyAoPzogaWYgd2hpbGUNCiAgICAgICAgICAgIGZvcikgYW5kIGxvZ2ljYWwgb3BlcmF0b3Jz
ICghIHx8ICYmKQ0KKyAgICAgICAgIC0gT3BlcmFuZHMgb2YgZXNzZW50aWFsbHkgQm9vbGVhbiB0
eXBlIChyZXN1bHRzIG9mIHJlbGF0aW9uYWwsDQorICAgICAgICAgICBlcXVhbGl0eSBhbmQgbG9n
aWNhbCBuZWdhdGlvbiBvcGVyYXRvcnMsIG9iamVjdHMgYW5kIGZ1bmN0aW9uDQorICAgICAgICAg
ICByZXN1bHRzIG9mIHR5cGUgYm9vbCkgdXNlZCBvbmx5IHdpdGggYmluYXJ5ICssIC0sIFwqLCA8
PCwgPj4sDQorICAgICAgICAgICA8LCA+LCA8PSwgPj0sICs9LCAtPSwgXCo9LCA8PD0gYW5kID4+
PQ0KICAgICAgICAgIC0gVGhlIGVzc2VudGlhbCB0eXBlIG1vZGVsIGFsbG93cyB0aGUgY29uc3Rh
bnRzIGRlZmluZWQgYnkgYW5vbnltb3VzDQogICAgICAgICAgICBlbnVtcyAoZS5nLiwgZW51bSB7
IEEsIEIsIEMgfSkgdG8gYmUgdXNlZCBhcyBvcGVyYW5kcyB0byBhcml0aG1ldGljDQogICAgICAg
ICAgICBvcGVyYXRvcnMsIGFzIHRoZXkgaGF2ZSBhIHNpZ25lZCBlc3NlbnRpYWwgdHlwZS4NCi0t
IA0KMi40My4wDQo=

