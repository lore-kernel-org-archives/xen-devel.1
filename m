Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D6BCA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 20:40:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442781.1660316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEYQf-0008Av-Ly; Wed, 07 Oct 2026 20:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442781.1660316; Wed, 07 Oct 2026 20:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEYQf-0008Ao-JI; Wed, 07 Oct 2026 20:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1442781;
 Wed, 07 Oct 2026 20:39:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xEYQe-00089d-HX
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:39:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEYQd-00AKwi-Di
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 22:39:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac6ae1a-8faa-0a2a0a5109dd-0a2a450982e8-2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 22:39:55 +0200
Received: from [40.107.162.93]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac6ae1a-be1a-0a2a45090019-286ba25d4c39-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 22:39:55 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS8PR03MB7335.eurprd03.prod.outlook.com
 (2603:10a6:20b:2eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 20:39:52 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 20:39:52 +0000
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
 b=E/nOhF+Jotbs1HZ/g5UZQxD1ccfqvr/LP/gVs4CFn1PqWwIF00QYu//ilR2Tqcy9LwBCjZcf4UDcSc2RACMVXNM2uSFXWEsBltUN8sz3UnG33eCy9NEPqU5QigCDsdjdMcK6VJUufftyElsMw23ClPgjDdfKJGGrTxnI2t3LH8C+wkArpSf7LQHXF2o4Rrmf/zhudmvoNjMxsJuod6mB+f+TpasuJmBMYqQu+bIMYVkIL33/9+VynY0RP6tl9+TpdkMhBScHmLgvPg5ITY9iOO2usuvoEwapOHXQOqxYADpAYBgICJQSXfcyNQ2KOs9Gn+SZE1oB2UGQh82aLTjO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG2iyk45wfTTtGBClH2QYspdg4KSKGMoA6n0lnGh65E=;
 b=LH8pqquNoUoJp8X11KvUzBH96d5Tn6xCHelMd+lxggYXnzPX46RiQpuDJgtZNH0IA6YlmSnfzI2vWB6WO5RzCmFp+DO1MNqDDrBe/Q2Ovh+al5MWMs0VZNPqPhWwq3XphgAuz7YDVsQpZIPcOJukirq0exoT0mJID4unUBEKxytJbzrGD7jCqv43jqtyUNrTDwkKhCE7qKHqw7fzrwIV2xTlh+DQi/Tt/IGvxhKCNr5JvMxKvcBNIZW0JYIeWmDqrY3I0chkHOqTcSM+SeOGQaEsFbnc0+9LlYi7+gy41FWE/4AnzkEeMmT4dxNAhZ1HTVOMzA5v5cqbHPlwV1vlgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG2iyk45wfTTtGBClH2QYspdg4KSKGMoA6n0lnGh65E=;
 b=jvnM1x9kBpxid4/RomOi2ymK8hY/q6T1RC6ZwKXpfkeQpGFkqU3+4vA1R8lMMPC2mTZsDYjUrdAbwitrgfNnRh7K5XYxk1o9Q96a2jLPIvw+reUmpvIaa9Mw039W8gI0cjyOK07uDAuQtPJaQtKqKTXTTH/Z3vD//TkPKW2kosPJcfIp3/XQR2KenZSp6tXcZXQjLCAkajG0+X7SWmag+dWmPh0zHwtAMjuBOIvjXLlyRHXrUCVXL99k5kLkeUK29WBKeQl8TS/NrW8mkwXlIj+y6zOEyoH9ijf0vKl42k6hj1345deutsm51rT7EQt/HnQ+5mTkMLioP9FS57vmUA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
Thread-Topic: [PATCH v2] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
Thread-Index: AQHdVpwBNG1sftA3/ky6kFfXebDmZA==
Date: Wed, 7 Oct 2026 20:39:52 +0000
Message-ID:
 <7549daf9e0de3420198913f6f91c16c929a31834.1791404375.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|AS8PR03MB7335:EE_
x-ms-office365-filtering-correlation-id: 12160b7b-febc-4f23-eb87-08df24b3238e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|23010399003|376014|18002099003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|38070700021;
x-microsoft-antispam-message-info:
 VkjTdVk1UW8G6za2x5qVK9Uxu2fCqHISFtwXeyovaXXUgTkOQ/lWmb1/9lw+tzoe2KfwaLSAbBgcTVJ7rlEHgGX/v3LNCP9s2K9mpG3p/vIGfVB22umayKd7+uVf2JXC4ds5H9HfdhJufgKF/FfHfK3R/hDvSEh+IcBApIRHmsMY15ZlKKEgH/Z6W4DB5mY+NSGCumv1MOgNDRdtJ5S6IByVXKNCLOEtwoYS/1UBgUxR/wVbfEOeihUBocEuxW3BKWP7Fog4guDCIusSSSqANqxwdszw40624bgVm4/VRAf3O3pLjlVeueUo97e/1k7LVNgKaVfcVbxdbfoM+eQ12xzgfuxMK69gGzQv65qLnoko+LfulGlJB13RdOi9QB85A3I0YdkwizPHMZo0tjRFKkEv3oxj5mkGO6r/jx95fQG1VOiUe2M8vfehNcDd5M/LNM3/9qG13Ie+u2fbJ1Rqr87m1/Pnwb20J/gsgx0umBjDpF2JkzkDOhFIhsNS11rXU6rTLYIRXl+7GZEgMlRRmoFkiD+X5tSLOHX+PDCC9fIl8X9nm8WdbNGYTUnzHSqlPjS5aDG0Y7sSIVb279Ociq93V0muvUVoOSK1pvBPLd1LCesv+C9/e19Zy8fd5VwRgh0uilqKOHbL/Xkc5UxHfGk0TuiKTpuaUSYRfk3l6Qs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkU0cU1zd20zUlBrdzRIampBdzR0dmY4ekIxOWhyYzFGR0JVRGxQd0lUS3Zq?=
 =?utf-8?B?ak9IalJOd0YzT1l2Slo3RVZQVkhVSWV3VkJ0MkZXMDJGK2tteHA1Uk01K0ZG?=
 =?utf-8?B?UmtWMmxPeGI4UlVHcm9sZ01vV3VwUEZ2Rk5PRFRsd0RMSnpvSmtJekUra3dm?=
 =?utf-8?B?YUoyUVIzbkhIZmI1N251ejBFVmt5MlZmUnp2MW1xb1oxT1l1VFR1UnNrQ2l6?=
 =?utf-8?B?N08vZmRNSFEyWTFFcEJuN0ZnVlg4Q09aTU9zQnNOMnEyRVlyYk81NE1NMjB5?=
 =?utf-8?B?NTZmMkYyanNqM3J4dlVxcnlPSzFrK3FGT1o4WWtSa2JrU0ZVUmhiVUJtekc3?=
 =?utf-8?B?a1lDUDNVVWU0VXRUczZBUkRoN2dGd0VzVG8rbkdNNWhxSjBZdkx5OERndDgv?=
 =?utf-8?B?M0NvcDJZN0lqNjBBNjZWY1F2Mm9PYjdrOUNFVHViUUZUUm5PZzE5UHRzUnd5?=
 =?utf-8?B?N2t5MVNWWUZzMCtlaTJaWHJXb3ZodW9zOTdMRHBGaU1GRU5uVVdUSTgxME1y?=
 =?utf-8?B?YVpJWktNOWhoZFlNYWlibDM4UFlmSEtjVDlQVTVYdlV0NzJJVyt2OU1aeFdL?=
 =?utf-8?B?MmF6dythcVduNmduQjY0NitHTzN2Y3ptazM0V2FhNUdLR2NoZzlkQW9WS3di?=
 =?utf-8?B?OEdpNmVVb1Y4N0xobFljMUZpRjRTTmQ2czhqdWRqbnlKbmlIT3IxVC9HUnRF?=
 =?utf-8?B?UjhCcUd3eGhkN3pZMkVQdnVHN2NpUU10ZFQ3MHg2TlptS3VqWjJ3S1pXZFpR?=
 =?utf-8?B?NEhicmRDMGUySjIvRWxFQllMR0RMWng4dE1vZFJicnl2WmdkcDlweitvOUgw?=
 =?utf-8?B?bmtKSGtScElWVUVscGJJazZVR1p2cnQySmhUWGdBdzZERHJIdm4yNFB1R3Fp?=
 =?utf-8?B?N2lvWmVKbWFpeDRGVFljYU8xSFpiKytSK1YwenEzYnFwOE5RR1pyQ3Y3bUNs?=
 =?utf-8?B?Mm9lUWUrOEtwTFlTeW5ZaXFYOFlPY3pyZzhZZTZzSi9yZUVaM0R0QS9xWlI5?=
 =?utf-8?B?SjZvcGZqbkIzaERWYm5oby9wYTY5aEhqdTZYVEZuS3p0UUx6Q3dwRzM0djZu?=
 =?utf-8?B?SDlzTWxaRVpKSHk5SHVoN3dySjkzSHBjVDd6RVBQeEpqUTE1U1ArQWlyNDFm?=
 =?utf-8?B?Y2VWZGlPQ242a1piVmhMOUVwTitxWHg5SGtMSjZCTjFRaXhYZDZBQ0ozZTVE?=
 =?utf-8?B?V09naEZCTHhvSjNrQmJwbzhkMlczSnFnSGhJa3V0ZVROckk0dWxNZlBHVm1X?=
 =?utf-8?B?b2hmTU9KQ2J1a2IwQTZ5cE9IKzdvM3RLdVdpRlZtK1Rnc1lNakZTTWxzZVBT?=
 =?utf-8?B?bkJaa0YydXNwUTlMVDdzb1ZaVXQyMm5Yb1VZSm41R3FvNTdWN0Flcmt3TEdu?=
 =?utf-8?B?OExGYzNjWlRKWElKQmtYYisrUlNpVmpoWmRZL25DTmoxSnhreHA0TVlpQXB3?=
 =?utf-8?B?ZlFLbGtZVm9jcG5RYnR3NHQvMEp0NzEvZHBBcnVvemhBMTN1YlpsYjVKNjVH?=
 =?utf-8?B?TExEd2hHbDl5bjBXNDE3Rk16bTg1NjNUU0xlWWUzSC9qQUpFcVJHYkxRaFhw?=
 =?utf-8?B?S2czeC93MlRqV1dmT3lMUWM0VlFjdDBncUt0OUs1a0dvVGtyTDQ5cDJvZjN6?=
 =?utf-8?B?OGRzUkhSOVlRZW9pNFBCMzFnUDcwcmtlUm1OOTBMZkZSVU5meFE3OCtiN0VF?=
 =?utf-8?B?OU5KMW1kTGVZOS9XTW53TlNKY1Rwd2dKd2h2ODg4SU1Td2RBOUs2Wm4xdnAw?=
 =?utf-8?B?VFBkY25ERjFFV3lSbEVOdUIrR0FQbmRYVkhES09ZOUV2VGJlaU1odE1PUGNX?=
 =?utf-8?B?Qk1jaFpKWnpZcEhySDdqaS9VdXR1b0pUaUk5NnlnSzZscWE2dkg5QXgyQ0ha?=
 =?utf-8?B?T09KVzUwNW9UM1FNQ1VPVXBOYWxLQ1M0aFNhK2p5ZXlrMUtMNWNNbDB4SzQz?=
 =?utf-8?B?WkVXY213SUJBOG1KU3orOHJPcUl0Rkh0Vlp2ZjhkTkZ2c2p1RkFSZW8xMThw?=
 =?utf-8?B?QS9NaDhzek9TZUIweFpraHByTVZ5aW1venNmL1Z5elduSklVZ0xqOHdEZlBH?=
 =?utf-8?B?cmFsdk03M3cvNlRMNkVmUVB4akFKNnAxTzRWdk5uWFdGRC9YM3grb0FQMzd6?=
 =?utf-8?B?YjJrL2NKWUMvcWNFK0Q2OFkwMnhYdFlBRFU0VjB1S2ZzVVpGMEM1K05CUGda?=
 =?utf-8?B?N1FsYjhMQ2lFdUt2NnZaZU1NM3ZSNjVvYXBWZDA0ekkwRDlLbjlMMDZmUXFP?=
 =?utf-8?B?S3NvQmU5dWdLOEg5RzhEMGh5QklRRkk5bjhuNlhzSDJmWHFaTTNvZitSc3V3?=
 =?utf-8?B?Sk5qei9wNE01RlJ6ekR4eTdiandTcGFmeVFYNmVBdDVPQkZ4ek05alpjb3Vo?=
 =?utf-8?Q?rCY1oqXpRmvnJ/b8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74BC962BD394E848BD48D032B337B0D7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12160b7b-febc-4f23-eb87-08df24b3238e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 20:39:52.3658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVFpj1CQlD1rJKrnIZ8Kj1nPpKnIj787bDIN0L7ZOkUIhJhEjzOQMQnvAaBE+RsbY3B4Iq/Sz54e9yLawDE5vOr9LjnQFIh0ZIRKilzXDMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7335
X-purgate-ID: tlsNG-bad1c0/1791405595-BC2F4034-E538EEAB/0/0
X-purgate-type: clean
X-purgate-size: 3294

TUlTUkEgQyBSdWxlIDEwLjEgc3RhdGVzOiAiT3BlcmFuZHMgc2hhbGwgbm90IGJlIG9mIGFuIGlu
YXBwcm9wcmlhdGUNCmVzc2VudGlhbCB0eXBlIi4NCg0KYmFyX3dyaXRlKCkgYW5kIGd1ZXN0X21l
bV9iYXJfd3JpdGUoKSBhZGRlZCB0aGUgYm9vbGVhbiAnaGknIHRvIGENCnBvaW50ZXIgZGlmZmVy
ZW5jZSB3aGVuIHByaW50aW5nIHRoZSBpZ25vcmVkIEJBUiBpbmRleC4gVGhlc2UgaGFuZGxlcnMN
CmFyZSByZWdpc3RlcmVkIG9ubHkgZm9yIHRoZSBtZW1vcnkgQkFSIHJlZ2lzdGVycywgc28gcHJp
bnQNCihyZWcgLSBQQ0lfQkFTRV9BRERSRVNTXzApIC8gNCBpbnN0ZWFkLiBUaGUgZXhwcmVzc2lv
biBoYXMgdHlwZQ0KdW5zaWduZWQgaW50LCBzbyB1c2UgJXUuDQoNCk5vIGZ1bmN0aW9uYWwgY2hh
bmdlcy4NCg0KU3VnZ2VzdGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4NClNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1
azFAZXBhbS5jb20+DQotLS0NCkluIHRoZSBWMSAoaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vZTIz
MjY2MTkxYTM2NmFiZTY2ZDgxMDQ3ODNkOTc1NzhhYTg3MzRhNC4xNzc5NDI4ODI2LmdpdC5kbXl0
cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vKQ0KdGhlcmUgd2FzIGEgbG9uZyBkaXNjdXNzaW9u
LCBhbmQgSSBkb24ndCBzZWUgYSBtdWNoIHNlbmNlIHRvIGFuc3dlciB0aG9zZSBxdWVzdGlvbnMN
CihhY3R1YWxseSBJIGRvbid0IGhhdmUgYWRkaXRpb25hbCBwcm9wb3NhbHMpLg0KDQpMb29rcyBs
aWtlIG1vc3QgYWdyZWVkIHdpdGggUm9nZXIncyBhbHRlcm5hdGl2ZSBmb3IgdGhpcyBjYXNlLg0K
U28sIGxldCdzIHByb2NlZWQgd2l0aCB0aGF0Lg0KDQpWMiB0ZXN0IHBpcGVsaW5lOiBodHRwczov
L2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVz
LzI5MjM5MTk1OTINCi0tLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCA4ICsrKystLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jDQppbmRleCBkMWM5MmNmNzdmLi43ZTVmNGI4YTAwIDEwMDY0NA0KLS0tIGEveGVuL2Ry
aXZlcnMvdnBjaS9oZWFkZXIuYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KQEAg
LTU4NSw4ICs1ODUsOCBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBiYXJfd3JpdGUoDQogICAgICAg
ICAvKiBJZiB0aGUgdmFsdWUgd3JpdHRlbiBpcyB0aGUgY3VycmVudCBvbmUgYXZvaWQgcHJpbnRp
bmcgYSB3YXJuaW5nLiAqLw0KICAgICAgICAgaWYgKCB2YWwgIT0gKHVpbnQzMl90KShiYXItPmFk
ZHIgPj4gKGhpID8gMzIgOiAwKSkgKQ0KICAgICAgICAgICAgIGdwcmludGsoWEVOTE9HX1dBUk5J
TkcsDQotICAgICAgICAgICAgICAgICAgICAiJXBwOiBpZ25vcmVkIEJBUiAlenUgd3JpdGUgd2hp
bGUgbWFwcGVkXG4iLA0KLSAgICAgICAgICAgICAgICAgICAgJnBkZXYtPnNiZGYsIGJhciAtIHBk
ZXYtPnZwY2ktPmhlYWRlci5iYXJzICsgaGkpOw0KKyAgICAgICAgICAgICAgICAgICAgIiVwcDog
aWdub3JlZCBCQVIgJXUgd3JpdGUgd2hpbGUgbWFwcGVkXG4iLA0KKyAgICAgICAgICAgICAgICAg
ICAgJnBkZXYtPnNiZGYsIChyZWcgLSBQQ0lfQkFTRV9BRERSRVNTXzApIC8gNCk7DQogICAgICAg
ICByZXR1cm47DQogICAgIH0NCiANCkBAIC02NDYsOCArNjQ2LDggQEAgc3RhdGljIHZvaWQgY2Zf
Y2hlY2sgZ3Vlc3RfbWVtX2Jhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCiAg
ICAgICAgIC8qIElmIHRoZSB2YWx1ZSB3cml0dGVuIGlzIHRoZSBjdXJyZW50IG9uZSBhdm9pZCBw
cmludGluZyBhIHdhcm5pbmcuICovDQogICAgICAgICBpZiAoIGd1ZXN0X2FkZHIgIT0gYmFyLT5n
dWVzdF9hZGRyICkNCiAgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KLSAgICAg
ICAgICAgICAgICAgICAgIiVwcDogaWdub3JlZCBndWVzdCBCQVIgJXp1IHdyaXRlIHdoaWxlIG1h
cHBlZFxuIiwNCi0gICAgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBiYXIgLSBwZGV2LT52
cGNpLT5oZWFkZXIuYmFycyArIGhpKTsNCisgICAgICAgICAgICAgICAgICAgICIlcHA6IGlnbm9y
ZWQgZ3Vlc3QgQkFSICV1IHdyaXRlIHdoaWxlIG1hcHBlZFxuIiwNCisgICAgICAgICAgICAgICAg
ICAgICZwZGV2LT5zYmRmLCAocmVnIC0gUENJX0JBU0VfQUREUkVTU18wKSAvIDQpOw0KICAgICAg
ICAgcmV0dXJuOw0KICAgICB9DQogICAgIGJhci0+Z3Vlc3RfYWRkciA9IGd1ZXN0X2FkZHI7DQot
LSANCjIuNDMuMA0K

