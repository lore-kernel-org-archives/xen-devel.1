Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812C606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ax/NbTyN
Received: from list by lists.xenproject.org with outflank-mailman.1468205.1677294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNrzI-0005Ai-F0; Mon, 02 Nov 2026 13:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468205.1677294; Mon, 02 Nov 2026 13:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNrzI-0005Aa-BM; Mon, 02 Nov 2026 13:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1468205;
 Mon, 02 Nov 2026 13:22:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xNrzH-0005AU-CB
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:22:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNrzG-003NkI-P8
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:22:10 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae88e7d-8faa-0a2a0a5109dd-0a2a4505e6e6-14
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:22:10 +0100
Received: from [52.101.72.87]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae88e82-4cb1-0a2a45050019-34654857dd5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:22:10 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by VI0PR03MB10903.eurprd03.prod.outlook.com (2603:10a6:800:26c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:22:07 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:22:07 +0000
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
 b=YDx5XiTWvk8GBj61afPoRSDBcOLZowiWPqB0KCpoUmNcvyPHZjs56+JcVsE/wLh3zjNv3evDpQnMAD2I3wXrTxK9WA3WqgP5J6H9M/MnB39aok4y3CT9/WeZCALqVT1qHYoYwX/Lo9ZpHH80Pe0mAYxFYEjBKqs01J/FgoZzP05J4qWnZnhFztho5hrkgW/5IjvF1BQGa1sq6v6OHwm1DHW/I53aH1/blSJ2PX0HGcbQC/3cEBe1wHwJuLcmcX8UH3T7ebKVZsnOxu7TG+fN3aoZ2K+BWQVU7H1u8Ew6OYEIICy4p73oZ1DwK9pRmTnNNLy8egnutmWLkzsFrkLFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKrwl1i7LFBa41Q95vHv8rcEwCJBpo3IIyQJ5QBbOkU=;
 b=S+EeCgiWOzjJmLyUNZ5J1pBMYdBDzN1t7uh3mXzAzMMyjfwvWB5dZNq1qM2/4owwitM8X2W4ewzHsgrg2FkaUHRqnn7br62zqzuP2Jw7hhv7bRRLWKQ0aGLzbaba2yFzSv1qaXyPhE1UaHjvW2rrz6xSUxvQwN3b0u4ukFAgknfT9uIGUgMwRFSkeYdPl6SBlem/6FVe2yxCrmQQIAJkpWkbFHoZU9HHus91tvdCwwsZ0xI+Q9gmfKeSdLxkMZf+d1T1mIaE3bKDrcRRtIT9sQOTOO9EPhJOzJH6dZmaqe7mrqpal08rQUnq9jXVXuCGZaewfJ/lQU1RM904jIToVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKrwl1i7LFBa41Q95vHv8rcEwCJBpo3IIyQJ5QBbOkU=;
 b=ax/NbTyN/pv/GcXiVUFf3cXXdEBH2I3zIuUth2uANhtoVUjHfrNiiOgSxyOwcWWvZYV/0Fd4bWb2IWXrLB7mxQ9NaFSj/qAnvONVTKgAE7ahHEHOApi6OlqGZEI2Y5j34YiYD9ExRgZZ/5Ff+eBw4zy07sTTaZFVGaASLH1ngtcypW9UeDKfDLMjWSqZTquWOglbmv8rFHK0YcqF0NN+NP+0M/lmibp+A/P8HBwRrugS4dTtTEatl6IT7nwyOWTB792j5lu8eqlcDEu6uFMmafhAPx7/SyYgNprMInz/C7098rD5ZOMaavz6b6JQiMgYbeaOsGU4CGvCWrQRUdxjrQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHdXK6sWnTwG0FjdEmPa5OC537fErcTDN4AgAfUFAA=
Date: Mon, 2 Nov 2026 13:22:07 +0000
Message-ID: <8d339d8d-ea7f-452b-8720-164dc9244079@epam.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
 <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
In-Reply-To: <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|VI0PR03MB10903:EE_
x-ms-office365-filtering-correlation-id: 3ce06337-611b-44db-4a3f-08df38e44b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|4133799003|10067099003|261009223027099003|261022115727099003|261022113327099003|261022105027099003|261021133027099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261022075727099003|5023799004|4143699003|11063799006|261026130827099003|38070700021|261028144727099003|261026135527099003|261026140227099003|261026121527099003;
x-microsoft-antispam-message-info:
 Zvw7xRSw1k9GM29CvkqFcUqzIVoLrAITOaQL3b0oq1L+nTbxZavf9zmafqCH6kW3NodA7t6ZsxO3i0nlU4YcddWEOxyLOKJiBCacqHETJh3SRnU5BqLh9ZoRvruRnJfR2hK6uugDgzw/x8OEM42oGJbEnYT97fCnyvTazwGr0NqRrkm0ey7x01QJv+sinRkn+tJBqaBTIspR6gtb7nn8KHZ9WYWC/A0PruF/t1N0t1arU4S59eGo2JeijMEy7E6Ja3+qg5CMM8W1p2ZM1r6A20hqzD+o1TudsKhNCEVDUlMd9gkKmE7nyBNkrNSu6Nvvy7I1FkASqEnaq2/cv6g5KC2m7ny9jv1PPqbiYdHBmeOud9N06c4NfN0te2NsiZ6e2NLVtZWiKmaQk1ncMQuLqf71nGAAtJnZMLP6oLcyTxEyO4ScM4KHDxk4RozzZrWI8H1ySzfdz75AfgV7u3kwYkxNPQi/8MjO2P8pgh6nuKQgIbQYOo3gqI8lmpMfgVeBzVDhU9XduONv7Ybjacc+bUXhmx4eDUHdpioNi/eqzmZnsjb6wPVEvb6HcRUyU21Zk24y1jT1nNc7raX8QNbzx1t228CBH9rp0KcFhF2CJK57OPJNGvREhzNvCZ/L5bVRBYK3MBjoDT5PCUgZqs78GK0gd0Xf3Fe6AQPFC+mSGKQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4133799003)(10067099003)(261009223027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261021133027099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022075727099003)(5023799004)(4143699003)(11063799006)(261026130827099003)(38070700021)(261028144727099003)(261026135527099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmcwMklNV2tCODJkcmZKTUNDeng4N2JJQks4ckVaYzdsVGJZUW92UXN5Q1or?=
 =?utf-8?B?bHg1WHBEdVVoeGlJVXVzanZaS1ZzUDh4Z3M1NTBMWUhZaVFOWFJXWFRZd0c2?=
 =?utf-8?B?OE5IdjJ4SE4wTTBSUWNSV1FDZ2tVWjN6WGd1VlZteWFvTG1tbFZ0UHEzQm4x?=
 =?utf-8?B?cnhGSWdDeExiSUlSaE5FWnVxcVUzcjNNblU2QTdqelV0QVphYVdEeWg3VUU2?=
 =?utf-8?B?dkJiSTJWKzlySUpJTHUwZ21oaDRmcnBRUTFZQXZDUzQxaHJWTEJXYTdPZkFL?=
 =?utf-8?B?QWYwL2F1cnpSL09sN1VlNTN4S3Z5RjJoOURyU3lHa25WQVovQ1FVQzkxVVE3?=
 =?utf-8?B?ZXVST2Fpd0Mrbm5hbDZvVk5Yb3dTTk5vdldqRXV3cndTeSszYUxlY3hucS9Y?=
 =?utf-8?B?QmJNNkE5aWwyZzBBOXRUZmR5aU9sTGFjS0FSbjVYendoRXYvS3pjL0lHaEQz?=
 =?utf-8?B?eTZOZkZwdnhycmxpbmlXemZpTGNYa0RIaVNUcVVMeXR0aXdtVGsyQytWbStW?=
 =?utf-8?B?cVpzQklOZ1FMenU0OWRpUUZNQXFUejdCVU9SYk9PWFZxQW9sWnFpWmwvZy92?=
 =?utf-8?B?TGtjWGlxaXNBU0lqTXVuU1BRaWppWklvdXc4WlRHSVYrM1JOOTgwa0M1Nnli?=
 =?utf-8?B?Nm5QWGEzK1dGdVN4TEdDQW9uRUVMclAxTy9VRVM1NDBpR21UK1NwM2Uyc01l?=
 =?utf-8?B?ZWdlcWw5bWtzcjN6eFF2eWh6dlFQUTBDbzJLSW5ZRmw5RnBodlhlTHh1T0hq?=
 =?utf-8?B?dHFhM0FocFRWNm42VGp4SzZ6KzF6OWZqL3FtQlBDdFV6SWcyV0hWTUU1WmRk?=
 =?utf-8?B?WEFVa1FrcmxDYjhNK3AxSnk3RVc5Z3kzZUt2dEo3TzE2YnNkRllJY0ZkNk0z?=
 =?utf-8?B?azRibGxlMkRTTGFKZG00UjV5MG5uVXUzVzZwWFh3V1NVR1NZNTNVMFdxS2F3?=
 =?utf-8?B?QlpjdTh3ZlptNFZsSC9qeS9xbit4M3prb1pqVktlekFIY3lNSUg3L3hQVjBl?=
 =?utf-8?B?Yzh3amt3K1RRRlArS24yUDZmNGdlVWtKcndPV09xS20wOUZZaWsyV0x4VzVa?=
 =?utf-8?B?Uzgzc1BNWnBvUWR3MnR1dlUrYjljeklKcnI2NmpDQTh5Z1dqOGsyc3lTZUlv?=
 =?utf-8?B?RkRTNldwVFdWbkFyWmt2UWxNM2NaY2VzS1gzTCtmWXlkeVlTNHVHZytWd0RC?=
 =?utf-8?B?OW9lSkNWNnhsYjN1RVRVSEQvYUhFcG53RVFLL1IvSm9pQW5FWWZBM2lyMEtz?=
 =?utf-8?B?UUFaOE1uUFZlTENZUTFUMW5JdURYVFYvUk1CM3MyYmdSb0VvNVZRcU1DSEMz?=
 =?utf-8?B?SHNZUHZ4Tkh6TEtoUk9XdHVRYzdSbGZ1KzJIdXNBZVJLUnpzUnUwTnVMSjlT?=
 =?utf-8?B?RU5wcHp4aDZZNjNrYzV3b1Z3bjFyZHkvUFpHY1hlb0hMZTNXRFhDeDQ2NzRi?=
 =?utf-8?B?b3VBUUtjd1RRZWlvQVlzTW83K0VOSnV6bkhhQUs5K1BoV3N6dHJkYU5qY2dP?=
 =?utf-8?B?andBVXdRaS9aVHBlWWtkWmdwcUsvWlpGVjRGWldxc0c4c1JURElhSUhkQVpE?=
 =?utf-8?B?ME5Yb25FQVRVa2g3MlZ3ZkhRbWkva0tiL0ZxMVJEc1pUZDlpbzljdDZJUU1M?=
 =?utf-8?B?WXhGb0wrdFZXWFZmcXBReWJMbmFkbWxhKzRWakZSVEFlVVZWVUpobEJFeUFr?=
 =?utf-8?B?TjVOS0MyM3BsT2U3MktUKzk3M3lpbzVLOHBkV3ZzVDQvSHdTeGNaall3ODU5?=
 =?utf-8?B?dGFVd3gybCs4YlUvY3JJMnU1OWo2Ymt1dExQTDdNem9ENGtoSjBSMFpKYlkx?=
 =?utf-8?B?QWJXNDhsdkRHVVRzMS90UGkxN3JoL1FuWjRNSXQ4akxBSVRTdWJhak9aUFpC?=
 =?utf-8?B?T3pydnU5YnlzdHdhdXZGMis0Vmo3VFBQaW10S3dPK0VnRW94eldDU05JalRP?=
 =?utf-8?B?aGpYS1JLNWQ0TklCYk15QUVwUDdRUTFtZjdIclE2OEw2TjRtcDJWbVlESk1C?=
 =?utf-8?B?cHh1dnpPcWNXZm8rWnlub1lUdnhhenV4V2RXdmRadG5iK3F6cWlSU1pWREky?=
 =?utf-8?B?LzVFYVY1dTVMQmg2MWVuMjFXVHd2SUdnbkJxNS9hdW5NYnl3NnVFbnpDU29y?=
 =?utf-8?B?YzdlTXYzTXVUb0o2WXJGeXVsaGlkME5sSloxN0U4Ky9mTUJXVlJqZlU0R0sr?=
 =?utf-8?B?N0FBcmdnZlhONEVBZkJqV2xJQUJvMUh2Y2lQd0JmYjJXa3NxOXF3dytxa2Vo?=
 =?utf-8?B?LzNFSXpaQnlqR2U2blEyZjdpdUo5bWFTSUlYTzA5dC96eUM5OEFRWGRVV3p4?=
 =?utf-8?B?Z3V2SjlEU0FUOVpXRFdqa0t0ekhQNzNITnhvbVRzVWErM053SDJQUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D976037CB5CBF41885BE118A63E79EA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce06337-611b-44db-4a3f-08df38e44b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 13:22:07.5805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccgHucTIGb7SBrGJqiLiSyUjBmSXqNIR75PgCuVTeGRxkiWrvCbmNub/4nDxX3RSIdLclJnKTIeXRM+I3VoTSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10903
X-purgate-ID: tlsNG-c201ff/1793625730-F7ABF2A1-224C53F6/0/0
X-purgate-type: clean
X-purgate-size: 3072
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCk9uIDEwLzI4LzI2IDM6NDkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4xMC4y
MDI2IDE2OjA4LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL0NIQU5HRUxPRy5tZA0K
Pj4gKysrIGIvQ0hBTkdFTE9HLm1kDQo+PiBAQCAtMTYsNiArMTYsNyBAQCBUaGUgZm9ybWF0IGlz
IGJhc2VkIG9uIFtLZWVwIGEgQ2hhbmdlbG9nXShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9l
bi8xLjAuMC8pDQo+PiAgICAgICAgYWZ0ZXJ3YXJkcy4NCj4+DQo+PiAgICMjIyBBZGRlZA0KPj4g
KyAtIFBDSSBTUi1JT1YgaXMgc3VwcG9ydGVkIGZvciBQVkggZG9tMC4NCj4NCj4gSXNuJ3QgdGhp
cyB4ODYtb25seSByaWdodCBub3c/DQo+DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+IEBAIC0z
Miw2ICszMiw3IEBADQo+PiAgICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPg0KPj4gICAjaW5jbHVk
ZSA8eGVuL3Rhc2tsZXQuaD4NCj4+ICAgI2luY2x1ZGUgPHhlbi92cGNpLmg+DQo+PiArI2luY2x1
ZGUgPHhlbi94dm1hbGxvYy5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL21zaS5oPg0KPj4gICAjaW5j
bHVkZSA8eHNtL3hzbS5oPg0KPj4gICAjaW5jbHVkZSAiYXRzLmgiDQo+PiBAQCAtNDAsNiArNDEs
OCBAQCBzdHJ1Y3QgcGNpX3NlZyB7DQo+PiAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGFsbGRldnNf
bGlzdDsNCj4+ICAgICAgIHUxNiBucjsNCj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgKnJvX21hcDsN
Cj4+ICsgICAgLyogQkRGcyBvZiBWRnMgd2hpY2ggaGF2ZSBiZWVuIGVuYWJsZWQgYnV0IHdoaWNo
IFhlbiBoYXMgbm90IGFkZGVkIHlldC4gKi8NCj4+ICsgICAgdW5zaWduZWQgbG9uZyAqdmZfc2V0
dXBfbWFwOw0KPj4gICAgICAgLyogYnVzMmJyaWRnZV9sb2NrIHByb3RlY3RzIGJ1czJicmlkZ2Ug
YXJyYXkgKi8NCj4+ICAgICAgIHNwaW5sb2NrX3QgYnVzMmJyaWRnZV9sb2NrOw0KPj4gICAjZGVm
aW5lIE1BWF9CVVNFUyAyNTYNCj4+IEBAIC0xMzksNiArMTQyLDQ3IEBAIGNvbnN0IHVuc2lnbmVk
IGxvbmcgKnBjaV9nZXRfcm9fbWFwKHUxNiBzZWcpDQo+PiAgICAgICByZXR1cm4gcHNlZyA/IHBz
ZWctPnJvX21hcCA6IE5VTEw7DQo+PiAgIH0NCj4+DQo+PiArLyoNCj4+ICsgKiBNYXJraW5nIGlz
IHNlcmlhbGlzZWQgYnkgdGhlIGhhcmR3YXJlIGRvbWFpbidzIHBjaV9sb2NrLCB3aGljaCB0aGUg
U1ItSU9WDQo+PiArICogY29udHJvbCByZWdpc3RlciB3cml0ZSBoYW5kbGVyIGhvbGRzOyB1bm1h
cmtpbmcgb25seSBjbGVhcnMgYSBiaXQuDQo+PiArICovDQo+DQo+IFdoYXQgYWJvdXQgcGNpX3Zm
X3NldHVwX3BlbmRpbmcoKT8gSG93J3MgdGhhdCAodG8gYmUpIHNlcmlhbGl6ZWQgYWdhaW4gbWFy
a2luZw0KPiBhbmQgdW5tYXJraW5nPw0KPg0KSXQgaXNuJ3QuIFRoZSB0ZXN0IHJ1bnMgYWhlYWQg
b2YgYW55IGxvY2sgYmVjYXVzZSBhZGRpbmcgdGhlIFZGIHRha2VzIHRoZW0uDQoNCldlIGNvdWxk
IHB1dCBpdCB1bmRlciB0aGUgaGFyZHdhcmUgZG9tYWluJ3MgcGNpX2xvY2ssIHdoaWNoIGlzIHdo
YXQNCmNvbnRyb2xfd3JpdGUoKSBob2xkcyBmb3IgbWFya2luZyBhbmQgdW5tYXJraW5nLCBidXQg
aXQgd291bGQgaGF2ZSB0byBiZQ0KZHJvcHBlZCBiZWZvcmUgdnBjaV9zcmlvdl9hZGRfdmYoKSBh
bnl3YXk6IHBjaV9hZGRfZGV2aWNlKCkgdGFrZXMgcGNpZGV2c19sb2NrLA0KYW5kIHRoZSBvcmRl
ciBpcyBwY2lkZXZzX2xvY2sgdGhlbiBwY2lfbG9jay4gU28gdGhlIHRlc3QgYW5kIHRoZSBhZGQg
Y2FuJ3QgYmUNCm1hZGUgYXRvbWljIHdpdGggdGhlIGxvY2tzIHdlIGhhdmUuIElzIHRoZSBsb2Nr
IHdvcnRoIHRha2luZyBqdXN0IGZvciB0aGUgYml0DQp0ZXN0Pw0KDQpUaGUgb25seSB0aGluZyBJ
IGNhbiBzZWUgYWN0dWFsbHkgbWlzZmlyaW5nIGlzIHZmX3NldHVwX21hcDogeHZ6YWxsb2NfYXJy
YXkoKQ0KemVyb2VzIGl0IGFuZCB0aGUgcG9pbnRlciBzdG9yZSBwdWJsaXNoZXMgaXQgd2l0aCBu
b3RoaW5nIGluIGJldHdlZW4sIHNvIGENCnJlYWRlciBjYW4gdGhlb3JldGljYWxseSBzZWUgdGhl
IHBvaW50ZXIgYWhlYWQgb2YgdGhlIHplcm9pbmcgYW5kIHRlc3QgYW4NCnVuaW5pdGlhbGlzZWQg
Yml0LiBTaG91bGQgd2UgcmVhbGxvY2F0ZSBpdCBpbiBhbGxvY19wc2VnKCksIG9yIGp1c3QgYWRk
IGEgbWVtb3J5IGJhcnJpZXI/DQo=

