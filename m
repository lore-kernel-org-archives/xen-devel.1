Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B654606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 01:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Mha/qa23
Received: from list by lists.xenproject.org with outflank-mailman.1491737.1692465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7dS-0007US-BJ; Tue, 17 Nov 2026 01:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491737.1692465; Tue, 17 Nov 2026 01:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7dS-0007UE-5A; Tue, 17 Nov 2026 01:05:22 +0000
Received: by outflank-mailman (input) for mailman id 1491737;
 Tue, 17 Nov 2026 01:05:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT7dQ-0007Dj-SE
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 01:05:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT7dQ-009f9E-8b
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:05:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba828-bab6-0a2a0a5309dd-0a2a4505e26a-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:05:20 +0100
Received: from [52.101.65.124]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba84f-4cb1-0a2a45050019-3465417c743a-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:05:20 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB3PR0302MB9234.eurprd03.prod.outlook.com
 (2603:10a6:10:42b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:05:18 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:05:18 +0000
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
 b=YK31/vmQK4vo9DQcC1LIJwqRxKcumy6urv5ePd8D7F5k8g7kTxYDUe5jLDjKOyQT3yZ18jzZtCYKiP1kgeWCeM/ah368+6bREThM8L5VJi29kvmyIyk9/tIJzK7kjxalkY+yA+ot1Bn9N6YxOxdtONq6aoe3Vi+hU7Tu5uzmJpeoW8YMw7qwPfBOj54e2KOhYkev3zULppumjQUAVk+y3goLKbgcj+v7o5C1VbhznVIHcH92EcMfSItW4U1M9//HhD+oShmUOJpQ+OeIWPdrOb907x7K0HUTX6NkQtzICpl6md//cLV3VZsY7jNhT94ADsMBWgn8ci28Jc/Hzgmpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6issg6c2Z+0ej4JLJ8/LJm4uPcUDbSe10ylZfAniywE=;
 b=HaSmG/Gyu6BVADJdR+D3W3PQO9AYt4qT5abxrfvWAc2dkOFk0jO7fQyibgzkgOznH8tBGglU3voSvzczRY2+LY3IncK7MnkJmM+JMcZOQkQB/hubI4jL3DSxPEt1gWiGz50sMnrCtbW0nF2YKuRegnx7YGILUATyrbsfZLd2An4LmoXPC+QPr70OjBbJqLFDXa28V0rUnKaVrF2/n9QVIL+QLvWPmVtdo88ZQrcGaanBvl7V239eTu5rsaXzsnpCRQ6ErcdalkhoBsVaAi9ZNp+yhsqxYZUa094+h+lBgMhwLRIHDobrKxEqDOanXNq7dBdK/BPBcqEeNTEXgat9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6issg6c2Z+0ej4JLJ8/LJm4uPcUDbSe10ylZfAniywE=;
 b=Mha/qa23rqXJsjGjrdngkZ4JuP7brgso5q7I+Yc1Xuc3kAOFNBVwIIFXjcf6sOdH0bK6Tkfb1KfvovdbiDK9d3ctFWftbfo8aJPoCcFBrpCyn2g0Hf7KXWaqd6xiINiSmr+tOhD/vbJI6UPU5S3UApXmtMM9D0q4TOe1NAKYdYHbgFTNwK/hKTGuOIWXQfgUhwS/aL9sY9O3WHjVshZeGthtRbEMKSI8G99Vxl0m4edWAnTRfOs904pNV3QZNp9Wx266DMCzIYplRuAXAd9Yd3jzlsxukJNutl7E/xf7tSOW5wP56B8sVlqPWPLj8va3w+Wvux+yCFYCJIHjn8RiLg==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v14 11/15] xen/arm64: Keep the early UART message in the
 identity mapping
Thread-Topic: [PATCH v14 11/15] xen/arm64: Keep the early UART message in the
 identity mapping
Thread-Index: AQHddi+1iA9+sB2+tkuE2J5rtZwhLA==
Date: Tue, 17 Nov 2026 01:05:17 +0000
Message-ID:
 <b4f1d64bf62ecbfa0899092ccfdc43db4240559b.1794873792.git.mykola_kvach@epam.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|DB3PR0302MB9234:EE_
x-ms-office365-filtering-correlation-id: 8ad96da7-8c4b-461e-f632-08df4446d874
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|261021121427099003|11063799006|261021123027099003|261022075727099003|261102123227099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 DgbJG6iuNekwBv5NZ6H28XqwDHZ2N7PBDNhcbiApTWHhqsc6zHU08hl3VuGokvR5LviwDQXQV53ldY/FTc2u/nbdY7dJVtO4NtwIv8u65Cm1ns8Po9s8JimV/YRTa0p9Tb4gEQd1bKNNeAxsiwl7m9NyOjUulqzHoVLa/1grAUpd5vSwrVA4N5x5upbcC12qzsvm6bzz5eSerLKu3p+DulEs5NTg/0mi2FTtGPNcGAZeMvxcPwCTQwVJGr6CLNHr1JRBJWV2L0YW5awkoeQqduAtfcCtiryt3hCr1KBkhOc+r5Fm7by/3cId2UtHmMqtosewgMQRM90gGzZQgKZfD/mlYJ8XJIqXEp+2SZkAyelx1IEAtTV+5+4CaNIMmDpPdggKt6nVa0pH7jFRmob7pWFaSmVOew7rtWKt3pqry3Pez8ISGyI/hX6X0SbdXAqomladSm3wnNFluglfqZA1zguKkMeuWvyZ8TH70uRH32aR+Uv4XSFXDV703lJ/v6nUfst59PltrG9rc7ia5GAN8IBd6B7Mq78EZOubLAndLBLL/o7Pw6vy93eOB60Sf+x1PQP4wa79riYK9tJq7wHfDFjNvJ6ddsDKOKhNbZPZfawSy4UE2dfYz6o36S7bIlgLzOIHQkMfAqrZZFFvAOa4kimz+iWoNJcBUbBkEeDrG7TbfWLhADn4PuOWj3QDSfX3BGN6raaJYaJuoWMBOkR/FHK1gl1ExsQ0Bm3OZGqxakE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(261021121427099003)(11063799006)(261021123027099003)(261022075727099003)(261102123227099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2x6cWtlVGdFTFh2L3daRmVrTlQ5YTFoV3BzTG1qS3VWN2ZpS0wvYnRTT2Jr?=
 =?utf-8?B?QjRwZmphem14c3RQaXpVeDZOckNlTWN2Z0YyU1ZTUXRBaTlXdWNXKzJycTNJ?=
 =?utf-8?B?bGJVc1YvV2dVdlo4eVp2SHpMZHFFaXhpblZ2UWxRZGRRbDdtZC8vUlAzRmtW?=
 =?utf-8?B?M0ovMFBUdWZOOHdwbnFuN2lqUnlqSkVqWVFpQlFnK3NOK3owKzVIWlVTbXBa?=
 =?utf-8?B?M3RUenZpc3Q0SHhNSW1WeDB2WXRBZ24vQ0I5YTNHSkN3N2RPcjZSQVBSSHU1?=
 =?utf-8?B?TXRaSFBqZ2ZxQUlQYjVKRnB4c0YzdDRPazNqUzRuQWZ3cmRwVnhPK2xBWGh1?=
 =?utf-8?B?Vk1pM202WloycFFtcUNCLzFPV3d3b2kvOXhTcHhsejhzcHd1ZTYzd3RtaW55?=
 =?utf-8?B?SXR5WWdMU2E5RS9PbFhYOUIwd2JIb0lETXVCTkI3ZDdQeHFha3lVSUZVcXBL?=
 =?utf-8?B?STRUSlJCTFFGcmtoSlQ2dGNsTHkzVjBST3pRTnFRUjBqOVIvNncxNjN3aVFH?=
 =?utf-8?B?b05qY0pWc3F4ZVl5TE44ejRmWnJsTis3dGFDMHVBcHM3SW5TVnVDSjc5WDJ1?=
 =?utf-8?B?UzhrMlU1TkdvLzRDYlJOaStjTVBqS3phTkdiN1hKcWtXT1JFTmo1THl1dENC?=
 =?utf-8?B?UFR0WnJ4YUhmWXEza0hZZWZoYUFaNS9JMHZJY2lQQkFUQ29hWFd1N0YvUnEy?=
 =?utf-8?B?S0xZN2cvTjIvREswS0s3Uyt3VFNoYlRLUldUK0xYdDVjQ3dNYTNUM3RWcXZP?=
 =?utf-8?B?MmpId2hiajZMdzk3ZG5CcXIzSi9OV1R0cXVGS2p3L2tYN3dBbDZmME9rM2RZ?=
 =?utf-8?B?THZ1S293bUlab3dCVktqTUNjRmZ2dUZDRUJGUVk5L2NBdS9DZU91RUphbjY0?=
 =?utf-8?B?QVVSRy9XVFU3MDhoSFpEMkE1R2dsdklIT0lYaWFEelk5ZG04eWFkajlLZXpz?=
 =?utf-8?B?WjJJMWg2SGFxcEh3U2JtamEyblVGdHNSc3hKMHNpbVpiQ0tLOTgxL2dpYVlr?=
 =?utf-8?B?MGIzQzQ2RDI1U0dSb0lJVnFxeWRjWnR2VTEyWWttQ0F6dTNWbFZUWVZqRFQy?=
 =?utf-8?B?ZS95RDgzQzMxYStKQnM3am1vcVd0NEhQT1RCNHd5cTN1aHIvR2Q5aEk3WmQ3?=
 =?utf-8?B?aVNrc0lkL0l1M2NBblpsSS9UNXB5bWNjZFhBbG5zQS80bEFzY1VIbUszaGZu?=
 =?utf-8?B?Q3hSM0YvWnV1Y01TWWc1K3hodFBjbktTd012RDhYQjFBcDcvM2ZIb1F0Ykk2?=
 =?utf-8?B?ZkZET3h4UWhTemxlYjN3Qkg4ck5FMHhTZkJlSjhoZUgrRTVVL3oyNk8rRVpT?=
 =?utf-8?B?RVhGSDY1RFBBSHI5bzlYVU1iblJpamYyYUlwYm1xY1NsTmZvMExMODJzcGty?=
 =?utf-8?B?b0ZnMWZnQXdOczBQOXFQMnFzNUFxTy8vZldINDVrVEZxSXJLNXlDY28wRzNl?=
 =?utf-8?B?RWUrL1lMcUtDQytlS3hRdGQ2MUUycWJoNU1aUnB6WVJ5UWhIb29uMVF3cUVs?=
 =?utf-8?B?dHB4bGw4YmVGMWlIT3BxR2pyMERtOVI5cURYQTVtYVVlWDdqemJKb3Qxa1NI?=
 =?utf-8?B?bnp5WlhXZ0xWVUx1VnRxUi8rUk94V0pCSGZiWENQR2svRU9XRmtZdklqOWF3?=
 =?utf-8?B?SFE0QlloOGcwamR5amdiVWNnazRCbGFlZ3MyS1pjTUhKeHNVdTd5TFdHbnlh?=
 =?utf-8?B?d1BjZWFTeWFzRnMxVWJ1TTMwamVoelZVcyt6VTdDcEJ3cnAweUFtWUp3NXkx?=
 =?utf-8?B?bjlxQU5kOWtIZDRENTd6V0Z1NDBYcGNlN013b2FlaXFIcGlWS3VRR3BaelVp?=
 =?utf-8?B?YmduUWpaWGFMMWhyK1pwYkFGeXkvQW9rUGxMYlZ1SFRPUmFZOWlWNU9EK3NI?=
 =?utf-8?B?c1RjcTdQd2VwSTBVQ2U2NlhYNFA3dkp1SDZVWjJoa0hKSE54VE5DUUZvazJi?=
 =?utf-8?B?WjFIajd2WXhrd1F2aXV0ajNoOGl0UmlwYTZMUGVTK3d3N2hKOGVjaS9BOUc3?=
 =?utf-8?B?dExtS2dEQzQ1b3NPS0FIL2REd0dzNHU4UmZ2ZHlOcG5HME5PanZwUUliNjU0?=
 =?utf-8?B?akN0Y0hDWmkrNDl3bk1pMzVObkpDcks0QUZZQkN2UHpIaFk1TEh0dWZuYlF3?=
 =?utf-8?B?V2t2YUJ0UUtqMHNKZWk5dm1LdXk3d3FJdWUybGx4UjRLUUFnUE00cy80L3Fw?=
 =?utf-8?B?UHluV0cvMFE5N1JQdUsyRDN2K2NONklNWkE0SkpKMFR4UUdOaTloZU9WcE02?=
 =?utf-8?B?c1VNVXEvUlVFa3JJdmVDbGI3OFRsQWVuZFJJdFM2OHNLM2JpZ3c3QVhGc0Ro?=
 =?utf-8?Q?XfKbEUKbrxzgGv6Hes?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad96da7-8c4b-461e-f632-08df4446d874
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:05:17.9237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4PP1WCLwR4bHxG0I1Jrj/jSOuMaCeFuR5W1c50VhwlLFLEd+Q2CZRfnfaNqVVqErhZchB+9UJENgJ4A2C87Y1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9234
X-purgate-ID: tlsNG-c201ff/1794877520-728B62A1-86715595/0/0
X-purgate-type: clean
X-purgate-size: 1504
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aW5pdF91YXJ0KCkgdXNlcyBQUklOVCgpLCB3aGljaCBwbGFjZXMgdGhlIFVBUlQgbWVzc2FnZSBp
biAucm9kYXRhLnN0ci4NClRoaXMgd29ya3MgZHVyaW5nIGJvb3QsIGJlZm9yZSBjYWNoZSBjb2xv
cmluZyByZWxvY2F0ZXMgWGVuLg0KDQpUaGUgdXBjb21pbmcgU1lTVEVNX1NVU1BFTkQgcmVzdW1l
IHBhdGggd2lsbCBhbHNvIGNhbGwgaW5pdF91YXJ0KCkgd2l0aA0KdGhlIE1NVSBkaXNhYmxlZC4g
V2l0aCBjYWNoZSBjb2xvcmluZywgWGVuIGlzIG5vIGxvbmdlciBwaHlzaWNhbGx5DQpjb250aWd1
b3VzLCBzbyB0aGUgUEMtcmVsYXRpdmUgYWRkcmVzcyB1c2VkIGJ5IFBSSU5UKCkgbWF5IG5vdCBw
b2ludCB0bw0KdGhlIHN0cmluZydzIHBoeXNpY2FsIGxvY2F0aW9uLg0KDQpVc2UgUFJJTlRfSUQo
KSB0byBrZWVwIHRoZSBtZXNzYWdlIGluIC5yb2RhdGEuaWRtYXAsIGFsb25nc2lkZSB0aGUgY29k
ZQ0KdGhhdCBuZWVkcyBpdCBiZWZvcmUgZW5hYmxpbmcgdGhlIE1NVS4NCg0KU2lnbmVkLW9mZi1i
eTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQotLS0NCkNoYW5nZXMgaW4g
djE0Og0KLSBOZXcgcGF0Y2guDQotLS0NCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMiAr
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMNCmluZGV4IDdkMWUyMDUzNTMuLmY1MjM0MjdkNDggMTAwNjQ0DQotLS0gYS94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TDQorKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQpAQCAt
NDQ3LDcgKzQ0Nyw3IEBAIEZVTkNfTE9DQUwoaW5pdF91YXJ0KQ0KICNpZmRlZiBDT05GSUdfRUFS
TFlfVUFSVF9JTklUDQogICAgICAgICBlYXJseV91YXJ0X2luaXQgeDIzLCAwDQogI2VuZGlmDQot
ICAgICAgICBQUklOVCgiLSBVQVJUIGVuYWJsZWQgLVxyXG4iKQ0KKyAgICAgICAgUFJJTlRfSUQo
Ii0gVUFSVCBlbmFibGVkIC1cclxuIikNCiAgICAgICAgIHJldA0KIEVORChpbml0X3VhcnQpDQog
DQotLSANCjIuNTMuMA0K

