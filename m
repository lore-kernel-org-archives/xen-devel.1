Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7220606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 01:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=TuZ6Nihl
Received: from list by lists.xenproject.org with outflank-mailman.1491664.1692374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cf-00030c-Et; Tue, 17 Nov 2026 01:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491664.1692374; Tue, 17 Nov 2026 01:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cf-00030T-Bh; Tue, 17 Nov 2026 01:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1491664;
 Tue, 17 Nov 2026 01:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT7ce-0002zh-ER
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 01:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT7cd-008M93-Qx
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:04:31 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba7fb-2eae-0a2a0a5409dd-0a2a4509a722-22
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:31 +0100
Received: from [52.101.66.116]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba81a-be1a-0a2a45090019-34654274314e-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:26 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB3PR0302MB9234.eurprd03.prod.outlook.com
 (2603:10a6:10:42b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:04:23 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:04:23 +0000
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
 b=Zh5/jVDtsf9/j99+adYpezSu+pBLcpV6LZ85c3tcaYsTfZxWH9PK3TS5/dCmBCU48t5qOSQHoBAt2Ady4q8DtnsGN6AB5wyORpvGM8cB7wYVN3F5Sgz0m79aQCZ4ZVDmIVfasKrc4vKXT8Qx08jWr/41rCzpOBWyMSxzX5ueSGCnX9Joj+h+Ilz0lPrYHKdPlt7n5TXlLQk8UwUjJpLaF1DVW2u6Fzuae5R+vmGOS/zEXNc0XykKWxICBYyHnnDGFlzvVHxr7Of46RnvafvtZawpgjiGkWCKIRe1GRQKYlfGpLjc0REqtZ3X09hJTpm5UtgsGl8/7qK0Qich2SFr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eAkB33LYudxm4kECdvb2pY851zn6PBIUhn3rxXi/yk=;
 b=mIJ1CZZ3I+TDdXu17axMWmEZUAr/tloPh2S2zoMib8WBVO0KofDm34tW76xfgG7fLNHCzetWOtorDv61VhRTmqiIJrS0vQ58iWghbd0E1iV3sn/U4LCH/UjcI7wyMBcg4VEMlkfIfRQNBKQDT4s+9NyyFzL/oqxiLH8aXt6HNbetf+Kbr8PPWpttniK1UW4TAgEngQ+yq1GwGc5J/GggQR5ekUeTMWHPZrgCLLlvV2GPOnZ4gQkELvNPlBv7Sgpgi/2DSmgygYxiMsw0sBkeHrF/85ugZnNPWXYiZZoZlB8VhhyOXZMf5odmwN+ssRLY6E2hBY7AX1rtvsOZ79NAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eAkB33LYudxm4kECdvb2pY851zn6PBIUhn3rxXi/yk=;
 b=TuZ6Nihl+Cz0PE9UVwCSjWgyVl4J/Gp5KY8UK5qRuSW7CtkSS0gsHRW7aeTcFebamaWJJVQIOBivEBCk7b92BM2mHnJlBKOYtC5qyJOglcGK2AU5aVOzYzBU/tYy/jY2OFehlX/zZZfonvu9F8lyHtJQR9tSBC0IhuofqLtbEuOsgZxQrJ77X3SHkYMJ1LxzcDDfVJR3BisLJmp6m6cXbL4CdGXBPO+01ffGNlLOMTpRQJmVuNsNzU1F1xGfeh/v54/DBsI+Yz9CYpix19vKuV5c60YZvoxebzLZbvm9a2i+lYVzhBKGyRYCeMCbrRgfm7FIuO6ynPtYgvWDDJIpvA==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>, Luca
 Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v14 01/15] xen/arm: Add suspend and resume timer helpers
Thread-Topic: [PATCH v14 01/15] xen/arm: Add suspend and resume timer helpers
Thread-Index: AQHddi+VeLEjZuhb7k6ILCK4ddcusQ==
Date: Tue, 17 Nov 2026 01:04:23 +0000
Message-ID:
 <75a6dcd876053326acf769e803105f2ebf792b6f.1794873792.git.mykola_kvach@epam.com>
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
x-ms-office365-filtering-correlation-id: 53fa1c91-c003-4899-b241-08df4446b81e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|3023799007|56012099006|261021121427099003|11063799006|261028144727099003|261021123027099003|261026121527099003|261022105027099003|261022075727099003|261102123227099003|261026140227099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 soBe+T/nK5+rgLXy8RYMIxC6x2K7chOXBXFrESswHv42fdsdNLxo6blLNGY6DqpEz1MS+sojAvofIkv5sk8S6FJqnQTWJgaglNjk1oL5iXzMkXelR+fhiNO2EGs2q8DbUbkMtp4+Q2kNMslbzObR81796xlnrVyKsUHFczNzN7kIEprwomunV2QhlSi7mLykKHzmMymYFWPjfnlAFTWjDYEAb+uQrDQJHg2kujHZ1Ha7Yu0f/LDfypk3u0IOhZdOOlOgiUQpUJ8N/SOdKesSLnv4uRrO/H9o4aRkZ8kZaq3JtrY8v0nJ7IJDyaKQGMThf0A3skWFRLBbMttZSd6V/eV3NlTAzMvPTaop/7EnJjlbpenERBj+lElgtJciuB1Z6mz6IbrfS/b1ukSx8wI17HYe2z+GWDhTRsQLri7eBSi2dukNKOnHsc4xnhN4Btpr/wNvG6++y2LqNwcb5yA95QD9yrXL/nUmQCWvzfWIUwrRvExit/xwmP6PcP86FxC4O8VTsNGbW3yXvGzB95nogJ9EWzcgXJi2DKd8DKj7KdtXUm+HgfwC3+rVs9nNjNRrFQC/0a+wNy+dN7pW4A4ryLzHsK4jjdeR82AR7iEBrRYIsxJL8i9/oRJtugjdKj6rD2dJxcg+Lw8YAh0kgQWA83Z/QENdwaRBI/WqkMWmGAIF7Zc7Y1HXgUMAFhDZBR/q1akMyD50MuOLQ0pkCg1hpKisdM3owv/64ASSz3kcEew=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(261021121427099003)(11063799006)(261028144727099003)(261021123027099003)(261026121527099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUU5QXFSdnRnWlJzeEVQbFU3eGtEUnMwOGx3cEZ6TVBUNG83cS9BUVFnS212?=
 =?utf-8?B?cEVWRUNIT3dRZWtYM3lFNlU3bENHUmk3MWU0aWZhMTFOQVBtamhLN2tCNTda?=
 =?utf-8?B?TDl6N2VWeFhIMDkwOWI1K1VBNzFIRzREeEhaVkhBYTFmRGgrRnA3ZmVucTZU?=
 =?utf-8?B?b2sxMVFKcVdxc0JRdWV6SG9nanNORXFKL2dHMnN6NXFCV3MvUUNBRTMwY200?=
 =?utf-8?B?ZUVTYndjOXptNTAwQkFlY2VZQW44UXNFNldXK0htR1pBbnBSWU1Bb3VPd1Vj?=
 =?utf-8?B?bFVrb3lPZnViazhpaW5TK3hHaTJSOFliMDlHem9FM2V2MUR3dGd3Y1J0Vmov?=
 =?utf-8?B?RzNlcE8zSlU1OE1MZzhTaHZmVjZNZFo1RVBWUmNQWGEyNXRuSEVtbTB2c0ZE?=
 =?utf-8?B?YmFQUDhteTNMc1ArSkxaWHJna3FUU1NIZWk5aDFuOGFNR3RJUDZDWWZGQjdE?=
 =?utf-8?B?eDFNM0Q1OVVIWk12RjFhSzhodVVTem9wWHVuaHRlc0lmTlJiaG9iV3MwbFRY?=
 =?utf-8?B?ZC9ZZzV4djJEYmh0R3pBNWxPQnVHM0lHT2wvNXFYd0NrK0pGbXMyb2c4bE00?=
 =?utf-8?B?UElLUmpzSmF1YTF1WEIxUHJsNStPYW9VOWtUTW0xTTU5d09mTUNlalpYczIx?=
 =?utf-8?B?dGVCUnY0WWRYTmllZHh1WjZHVXBRQWJWb0Q1UmpjWlU0ek9tVm1NOUdPL1Uy?=
 =?utf-8?B?VkxVYlhXUXppeXBmTy8rOUlhWXJtamFYWlBJZmxaL1lWR1AwczZNaEpLSXZs?=
 =?utf-8?B?MzRDTnRlZkNDZUxLSVpXdWxwdVpBOVZibUhvS0dZcEp6dUhYekRReERjVTE3?=
 =?utf-8?B?NXRaTFhQQit2ajM2TDNYdDRQdzRTaHJkckw5VGd0RG9JQ3oxc1NzbDk5V1o3?=
 =?utf-8?B?VE1vaFZKSUM0MUtqaGRDdC9yZVJGY0RsUkZKQjc1R2x5RG10YzRJUWgreDZj?=
 =?utf-8?B?ZUFrQWgyWGJ3ZGNMZTREYVcwU2RCRDVTeGJ1Ylc4S1FkbUhFdS9lMDhwT05O?=
 =?utf-8?B?clBwT1c1VnI2RlJRck1IM2UxV2U4R3FyY2VPTnNVUk81eVBuNEpEdTZSeE5U?=
 =?utf-8?B?SHNVaTJ4anNDcGhzaExQTnFxeUhGclRHU3lBVFJwMnU2NEd5S0c5bFZZc3la?=
 =?utf-8?B?dGEzWW53Y2RCRXJCVnMwbWZleE5KV2p3bW0vczJ6M2ZWMjY1WkRrcEVYQXEx?=
 =?utf-8?B?bkkvU0g4SEZrRjlUdENaSkFJS211WnFSMHdRZ290VXV0azlRY1F6Vm5HdTg1?=
 =?utf-8?B?czBleU80dk0yNC9nVVpyRWRzMXlVbWRrS2xFVmJOWkdySEZwTmJkc1Nqb1Zp?=
 =?utf-8?B?NXR6UENXTW1WTkxKbUpBSDF3VDBLV2psQlE5YitGRVhyb2pUV3JtODU0S3lj?=
 =?utf-8?B?RGZrQnpUVFdYa3NuQVVJWEZ3YlRUNi81WDVkakFFaTNrYTVkWXdDTkJyWGlG?=
 =?utf-8?B?TDdqUS8xRzdlY2k5Y0JjNW5od21yR0RZWlFERkVmckkyOG9ZY3FReXRGRVd1?=
 =?utf-8?B?N3VIYzdNdDF3dVdjZDIxWCtHNTFpUWhtRURwM0EvUitDUkhrNEhOZmRDR0RO?=
 =?utf-8?B?Tm1DU2ZLRmVWWlp3eHdTcVZ3aHJtMk9MYjhUd3lwUFdoaFVxemwyZE4wbncz?=
 =?utf-8?B?bTVXeDgrRDZaSTBhUjlHK09SakhnMHFUbXVEKzYrUWxOZm5iT0hEUmtxanp5?=
 =?utf-8?B?UjhqcjIwTXJzcjNaVEdaYTJFakFpTktsTUE4L3RMOVNLS2hzZ1F5dWZOWmI0?=
 =?utf-8?B?dkM3Rk5rVHhVNmw1S3lUV1lZam1YLzlZbWp3d3FPb0o0dlM4VmdZWUFsc2t5?=
 =?utf-8?B?YmRMS1Y1UE42TlpFUHN3djc3T0d2bS9UQ2UrYWMvU3JXbVZUeVdPNXBqbXVB?=
 =?utf-8?B?QWljbEFhRVZrajMwOExqSHdrNjBLT3VxbTEwRW0zYmhqQmYveEtnOVl2OFBu?=
 =?utf-8?B?RVorOGMyckp3dUpjQ1VCbWUyYmEzTkxKSXR2ZCt4SkxySWNpdjh1aksxbU9r?=
 =?utf-8?B?c2VJc2xBeFFmQnF5czNxZHJQb2huWm9GUDFLb0tEdGZoMmoxSkFXNG1RUjRo?=
 =?utf-8?B?ZjNQWE5ncDFZa09LdHhGamNSVFFHdWs5ZU1xUjZhK041NGRVSlFoZUpkSUVu?=
 =?utf-8?B?dWRONmE5bHZqcnpnamJNRU5QYUFDN0F0dUQvVHMzcXplTDMrZ04ycEtYRlht?=
 =?utf-8?B?Y2ozcGczSzdVVk9tRWNpeW5vOFpBWmdHbUphZGhvV3hJSDRXTXBSd0RjcXZK?=
 =?utf-8?B?am5rTXNLczNWbEJUQWZQKzg1MGxpZTR1VG9YaXB3T0xzN0YrakxVRDNVeFZq?=
 =?utf-8?Q?6AxFMUgcPEqyP8EMLp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fa1c91-c003-4899-b241-08df4446b81e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:04:23.7275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzpK5y+ePPqF8sE4X7wE5PYIwfX6IxkC4N3p+6p6naLJYN5IpT6QC4GszRmItIr+E8soXaK44fi/nz9HLckV/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9234
X-purgate-ID: tlsNG-bad1c0/1794877471-FC411034-107D6FA9/0/0
X-purgate-type: clean
X-purgate-size: 6930
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogTWlyZWxhIFNpbW9ub3ZpYyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPg0KDQpU
aW1lciBpbnRlcnJ1cHRzIG11c3QgYmUgZGlzYWJsZWQgd2hpbGUgdGhlIHN5c3RlbSBpcyBzdXNw
ZW5kZWQgdG8gcHJldmVudA0Kc3B1cmlvdXMgd2FrZS11cHMuIFN1c3BlbmRpbmcgdGltZXJzIGlu
IFhlbiBjb25zaXN0cyBvZiBkaXNhYmxpbmcgdGhlDQpwaHlzaWNhbCB0aW1lciBhbmQgdGhlIGh5
cGVydmlzb3IgdGltZXIgb24gdGhlIGN1cnJlbnQgQ1BVLiBUaGUgdmlydHVhbA0KdGltZXIgZG9l
cyBub3QgbmVlZCBleHBsaWNpdCBoYW5kbGluZyBoZXJlLCBhcyBpdCBpcyBhbHJlYWR5IGRpc2Fi
bGVkIG9uDQp2Q1BVIGNvbnRleHQgc3dpdGNoIGFuZCBpdHMgc3RhdGUgaXMgcmVzdG9yZWQgcGVy
LXZDUFUgb24gdGhlIG5leHQgY29udGV4dA0KcmVzdG9yZS4NCg0KUmVzdW1pbmcgY29uc2lzdHMg
b2YgcmFpc2luZyBUSU1FUl9TT0ZUSVJRLCB3aGljaCBwcm9tcHRzIHRoZSBnZW5lcmljDQp0aW1l
ciBjb2RlIHRvIHJlcHJvZ3JhbSB0aGUgaHlwZXJ2aXNvciB0aW1lciB3aXRoIHRoZSBjb3JyZWN0
IHRpbWVvdXQuDQoNClhlbiBkb2VzIG5vdCB1c2Ugb3IgZXhwb3NlIHRoZSBwaHlzaWNhbCB0aW1l
ciwgc28gaXQgcmVtYWlucyBkaXNhYmxlZA0KYWNyb3NzIHN1c3BlbmQvcmVzdW1lLg0KDQpJbnRy
b2R1Y2UgYSBuZXcgaGVscGVyLCBkaXNhYmxlX3BoeXNfaHlwX3RpbWVycygpLCB0byBlbmNhcHN1
bGF0ZSBkaXNhYmxpbmcNCm9mIHRoZSBwaHlzaWNhbCBhbmQgaHlwZXJ2aXNvciB0aW1lcnMuDQoN
ClNpZ25lZC1vZmYtYnk6IE1pcmVsYSBTaW1vbm92aWMgPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9z
LmNvbT4NClNpZ25lZC1vZmYtYnk6IFNhZWVkIE5vd3NoYWRpIDxzYWVlZC5ub3dzaGFkaUB4aWxp
bnguY29tPg0KU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5j
b20+DQpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NClJldmlld2Vk
LWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQotLS0NCkNoYW5nZXMg
aW4gVjc6DQogIC0gRHJvcHBlZCBFTDEvRUwyIHdvcmRpbmc7IHVzZSAicGh5c2ljYWwgdGltZXIi
IGFuZCAiaHlwZXJ2aXNvciB0aW1lciINCiAgLSBSZW5hbWVkIGhlbHBlciB0byBkaXNhYmxlX3Bo
eXNfaHlwX3RpbWVycygpIHRvIHJlZmxlY3QgaXRzIGFjdHVhbCBzY29wZQ0KICAtIENsYXJpZmll
ZCB2aXJ0dWFsIHRpbWVyIGhhbmRsaW5nIChkaXNhYmxlZCBvbiB2Q1BVIHN3aXRjaC1vdXQsIHJl
c3RvcmVkDQogICAgb24gY29udGV4dCByZXN0b3JlKSBhbmQgYWRkZWQgY29tbWVudHMgaW4gc3Vz
cGVuZC9yZXN1bWUgcGF0aHMNCiAgLSBBZGRlZCByZXN1bWUgY29tbWVudCBleHBsYWluaW5nIHdo
aWNoIHRpbWVycyBhcmUgcmVzdG9yZWQgYnkNCiAgICBUSU1FUl9TT0ZUSVJRDQotLS0NCiB4ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vdGltZS5oIHwgIDUgKysrKw0KIHhlbi9hcmNoL2FybS90aW1l
LmMgICAgICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCiAy
IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdGltZS5oIGIveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL3RpbWUuaA0KaW5kZXggZmQ3OWRkMzFlYi4uN2ZmYTBiNWFjOSAxMDA2NDQNCi0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS90aW1lLmgNCisrKyBiL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS90aW1lLmgNCkBAIC0xMDYsNiArMTA2LDExIEBAIHZvaWQgcHJlaW5pdF94ZW5f
dGltZSh2b2lkKTsNCiANCiB2b2lkIGZvcmNlX3VwZGF0ZV92Y3B1X3N5c3RlbV90aW1lKHN0cnVj
dCB2Y3B1ICp2KTsNCiANCisjaWZkZWYgQ09ORklHX1NZU1RFTV9TVVNQRU5EDQordm9pZCB0aW1l
X3N1c3BlbmQodm9pZCk7DQordm9pZCB0aW1lX3Jlc3VtZSh2b2lkKTsNCisjZW5kaWYgLyogQ09O
RklHX1NZU1RFTV9TVVNQRU5EICovDQorDQogI2VuZGlmIC8qIF9fQVJNX1RJTUVfSF9fICovDQog
LyoNCiAgKiBMb2NhbCB2YXJpYWJsZXM6DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RpbWUu
YyBiL3hlbi9hcmNoL2FybS90aW1lLmMNCmluZGV4IDI5NWFmYTY4NWEuLmVkZDQxYjZlMzEgMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vdGltZS5jDQorKysgYi94ZW4vYXJjaC9hcm0vdGltZS5j
DQpAQCAtMzExLDYgKzMxMSwxNCBAQCBzdGF0aWMgdm9pZCBjaGVja190aW1lcl9pcnFfY2ZnKHVu
c2lnbmVkIGludCBpcnEsIGNvbnN0IGNoYXIgKndoaWNoKQ0KIHN0YXRpYyBERUZJTkVfUEVSX0NQ
VV9SRUFEX01PU1RMWShzdHJ1Y3QgaXJxYWN0aW9uLCBpcnFfaHlwKTsNCiBzdGF0aWMgREVGSU5F
X1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IGlycWFjdGlvbiwgaXJxX3ZpcnQpOw0KIA0KKy8q
IERpc2FibGUgcGh5c2ljYWwgYW5kIGh5cGVydmlzb3IgdGltZXJzIG9uIHRoZSBjdXJyZW50IENQ
VSAqLw0KK3N0YXRpYyBpbmxpbmUgdm9pZCBkaXNhYmxlX3BoeXNfaHlwX3RpbWVycyh2b2lkKQ0K
K3sNCisgICAgV1JJVEVfU1lTUkVHKDAsIENOVFBfQ1RMX0VMMCk7ICAgIC8qIFBoeXNpY2FsIHRp
bWVyIGRpc2FibGVkICovDQorICAgIFdSSVRFX1NZU1JFRygwLCBDTlRIUF9DVExfRUwyKTsgICAv
KiBIeXBlcnZpc29yJ3MgdGltZXIgZGlzYWJsZWQgKi8NCisgICAgaXNiKCk7DQorfQ0KKw0KIC8q
IFNldCB1cCB0aGUgdGltZXIgaW50ZXJydXB0IG9uIHRoaXMgQ1BVICovDQogdm9pZCBpbml0X3Rp
bWVyX2ludGVycnVwdCh2b2lkKQ0KIHsNCkBAIC0zMjEsOSArMzI5LDcgQEAgdm9pZCBpbml0X3Rp
bWVyX2ludGVycnVwdCh2b2lkKQ0KICAgICBXUklURV9TWVNSRUc2NCgwLCBDTlRWT0ZGX0VMMik7
ICAgICAvKiBObyBWTS1zcGVjaWZpYyBvZmZzZXQgKi8NCiAgICAgLyogRG8gbm90IGxldCB0aGUg
Vk1zIHByb2dyYW0gdGhlIHBoeXNpY2FsIHRpbWVyLCBvbmx5IHJlYWQgdGhlIHBoeXNpY2FsIGNv
dW50ZXIgKi8NCiAgICAgV1JJVEVfU1lTUkVHKENOVEhDVExfRUwyX0VMMVBDVEVOLCBDTlRIQ1RM
X0VMMik7DQotICAgIFdSSVRFX1NZU1JFRygwLCBDTlRQX0NUTF9FTDApOyAgICAvKiBQaHlzaWNh
bCB0aW1lciBkaXNhYmxlZCAqLw0KLSAgICBXUklURV9TWVNSRUcoMCwgQ05USFBfQ1RMX0VMMik7
ICAgLyogSHlwZXJ2aXNvcidzIHRpbWVyIGRpc2FibGVkICovDQotICAgIGlzYigpOw0KKyAgICBk
aXNhYmxlX3BoeXNfaHlwX3RpbWVycygpOw0KIA0KICAgICBoeXBfYWN0aW9uLT5uYW1lID0gImh5
cHRpbWVyIjsNCiAgICAgaHlwX2FjdGlvbi0+aGFuZGxlciA9IGh0aW1lcl9pbnRlcnJ1cHQ7DQpA
QCAtMzQ4LDkgKzM1NCw3IEBAIHZvaWQgaW5pdF90aW1lcl9pbnRlcnJ1cHQodm9pZCkNCiAgKi8N
CiBzdGF0aWMgdm9pZCBkZWluaXRfdGltZXJfaW50ZXJydXB0KHZvaWQpDQogew0KLSAgICBXUklU
RV9TWVNSRUcoMCwgQ05UUF9DVExfRUwwKTsgICAgLyogRGlzYWJsZSBwaHlzaWNhbCB0aW1lciAq
Lw0KLSAgICBXUklURV9TWVNSRUcoMCwgQ05USFBfQ1RMX0VMMik7ICAgLyogRGlzYWJsZSBoeXBl
cnZpc29yJ3MgdGltZXIgKi8NCi0gICAgaXNiKCk7DQorICAgIGRpc2FibGVfcGh5c19oeXBfdGlt
ZXJzKCk7DQogDQogICAgIHJlbGVhc2VfaXJxKHRpbWVyX2lycVtUSU1FUl9IWVBfUFBJXSwgTlVM
TCk7DQogICAgIHJlbGVhc2VfaXJxKHRpbWVyX2lycVtUSU1FUl9WSVJUX1BQSV0sIE5VTEwpOw0K
QEAgLTM5MCw2ICszOTQsMzQgQEAgdm9pZCBkb21haW5fc2V0X3RpbWVfb2Zmc2V0KHN0cnVjdCBk
b21haW4gKmQsIGludDY0X3QgdGltZV9vZmZzZXRfc2Vjb25kcykNCiAgICAgLyogWFhYIHVwZGF0
ZSBndWVzdCB2aXNpYmxlIHdhbGxjbG9jayB0aW1lICovDQogfQ0KIA0KKyNpZmRlZiBDT05GSUdf
U1lTVEVNX1NVU1BFTkQNCisNCit2b2lkIHRpbWVfc3VzcGVuZCh2b2lkKQ0KK3sNCisgICAgLyog
Q05UViBhbHJlYWR5IGRpc2FibGVkIGJ5IHZpcnRfdGltZXJfc2F2ZSgpIGR1cmluZyB2Y3B1IGNv
bnRleHQgc3dpdGNoLiAqLw0KKyAgICBkaXNhYmxlX3BoeXNfaHlwX3RpbWVycygpOw0KK30NCisN
Cit2b2lkIHRpbWVfcmVzdW1lKHZvaWQpDQorew0KKyAgICAvKg0KKyAgICAgKiBSYWlzaW5nIFRJ
TUVSX1NPRlRJUlEgdHJpZ2dlcnMgZ2VuZXJpYyB0aW1lciBjb2RlIHRvIHJlcHJvZ3JhbSB0aGUN
CisgICAgICogaHlwZXJ2aXNvciB0aW1lciB3aXRoIHRoZSBjb3JyZWN0IHRpbWVvdXQgKG5vdCBr
bm93biBoZXJlKS4NCisgICAgICoNCisgICAgICogWGVuIGRvZXNuJ3QgdXNlIG9yIGV4cG9zZSB0
aGUgcGh5c2ljYWwgdGltZXIsIHNvIGl0IHJlbWFpbnMgZGlzYWJsZWQNCisgICAgICogYWNyb3Nz
IHN1c3BlbmQvcmVzdW1lLg0KKyAgICAgKg0KKyAgICAgKiBUaGUgdmlydHVhbCB0aW1lciBzdGF0
ZSBpcyByZXN0b3JlZCBwZXItdkNQVSBvbiB0aGUgbmV4dCBjb250ZXh0IHN3aXRjaC4NCisgICAg
ICoNCisgICAgICogTm8gZnVydGhlciBhY3Rpb24gaXMgbmVlZGVkIHRvIHJlc3RvcmUgdGltZWtl
ZXBpbmcgYWZ0ZXIgcG93ZXIgZG93biwNCisgICAgICogc2luY2UgdGhlIHN5c3RlbSBjb3VudGVy
IGlzIHVuYWZmZWN0ZWQuIFNlZSBBUk0gRERJIDA0ODcgTC5hLCBEMTIuMS4yDQorICAgICAqICJU
aGUgc3lzdGVtIGNvdW50ZXIgbXVzdCBiZSBpbXBsZW1lbnRlZCBpbiBhbiBhbHdheXMtb24gcG93
ZXIgZG9tYWluLiINCisgICAgICovDQorICAgIHJhaXNlX3NvZnRpcnEoVElNRVJfU09GVElSUSk7
DQorfQ0KKw0KKyNlbmRpZiAvKiBDT05GSUdfU1lTVEVNX1NVU1BFTkQgKi8NCisNCiBzdGF0aWMg
aW50IGNwdV90aW1lX2NhbGxiYWNrKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmZiLA0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhY3Rpb24sDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICpoY3B1KQ0KLS0gDQoyLjUzLjANCg==

