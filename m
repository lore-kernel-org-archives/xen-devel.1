Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D6606A322
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=AgPXHEBW
Received: from list by lists.xenproject.org with outflank-mailman.1461216.1672196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJo5-0001e6-0g; Mon, 26 Oct 2026 12:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461216.1672196; Mon, 26 Oct 2026 12:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJo4-0001dh-Nv; Mon, 26 Oct 2026 12:28:04 +0000
Received: by outflank-mailman (input) for mailman id 1461216;
 Mon, 26 Oct 2026 12:28:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xLJo3-0001Tf-1A
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:28:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJo2-000Htn-Dc
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:28:02 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6adf4735-2eae-0a2a0a5409dd-0a2a450bcd94-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:02 +0100
Received: from [40.107.162.83]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6adf4751-b7e8-0a2a450b0019-286ba2532f5d-5
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
 b=IG4FolDwOTv/L8Eu2sO8Vfl4DfmVWVUiAQSZA9d1Wp07Y9k9u+8TgSzrK1M9rs3Vb+LbjOoWN2D6yWUZXK2j7xTAltqReiC/5ajvGI/m5zD0CoCbGza+I6IkkuzkASTzm+mWXM32XIOI+S5ZajXkLNeQ4+ozFmlo9DwqfWUIXG7jgJ/F3kOQgz6XvpbLzMi5/Vgazz1fhR39ks310nGfwkQ4l5Sh3IV2RFH0bVyBJ4T1X4I5h8FeaC+EqHjrvImBU+8JxrEN8Q4vsf+jHLmCi5JquL8zL3od6nVLzCugoW/WwKDW+8BxvUqWKjNlcwF0AZfe2pbGEvRDO/4z2QdWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxPz9fAW4k+o2b3KErd9e8gSA7RABkWRKMRB3aHqN6g=;
 b=oaXXAKv+NKxKHph0S9h9tkQG0GxqDGrXVKHcBXeI8aG+VtKh7dPFS/qoII2SfL7PNMuplcoW35ptsSNIRA1wSvFTQcPU2T2pmZTOK3nMY4yMkPEs2PNlAEotSVLBh4tHNSBOIk1cpG+UvuPoZsDfja5E9HwQEIYxQg9QlXWvkuqZJT/UmqDfNqwqlw317xw/Bdk/l6JoVug7/uEHZGRMjr/h8CKfHJ7HdVfoWljwBPWKtdSyvFhIWdKxlWQeWjL81/lmwckUkKay+ssqVnoMUqIiFMOiNnhetQVuZpLx3Q/jCdHKwkwyea+7zWrZi7iUiJTuKQxJNev9I0OHa59Ziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxPz9fAW4k+o2b3KErd9e8gSA7RABkWRKMRB3aHqN6g=;
 b=AgPXHEBWjOhzrnmlF3Fd8U7K5A1RUQZzE0kpz7xdaoZTLndag4D5fgv+UZy5R9dtYw0rovbGELaYXmOMBisTJp10TIbjNuulWzZyvdcTJpUDSWi+HZL9k565P6S30tzJ9HMwSFj/rUfJ+s3/qq8svdB20Lhop0lubRcLQj+972lVjbvgiLH7zYj6TBN9DNmd05u5VBdAl/uLIEO8O3uPf/LTXXlvhC5hqUY4KoytWuzwB2GyZcbFtu3L6xCygFExsCjsaxhFHI37VpsZ9RqY75SL2fINrtJOVjWN6RByBiTwwy+Ay8IS1wWKKncEPGN1GNaVOg4bQbBO529g4HQw7Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason
 Andryuk <jason.andryuk@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 1/3] vpci/msix: move helpers to common
Thread-Topic: [PATCH v1 1/3] vpci/msix: move helpers to common
Thread-Index: AQHdZUVw86OFDAh+gU+B9obs/ZE7IA==
Date: Mon, 26 Oct 2026 12:27:59 +0000
Message-ID:
 <688f3bb393590fc5bfb54328112fde1359bf44c4.1793012250.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: f13edb1a-6a4c-416e-964f-08df335c92b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|5023799004|11063799006|261022075727099003|261021121427099003|10067099003|261009223027099003|261021123027099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 dmo/Xz3CoaPFf8MD2TJ6zHI7+PugampzV23zJuCm4L9g+EBvORoUpX6PctWMynQ28F1giZnVpIELYN81xn4o3cFNr/8O+wHfvMdiEPgOywNDxsHEnYzVahnq32+dlI1saXust+cH2T5y3Np2oMRf8TF/yVWDopt2+ceGvPqU01vGpKnvSHOZBeTqVglU6piioKlLQQpKWlEbgAiKk8nTEc09dR87X2K96zA7jxvPcIaoGlJhgZ0J9bx/qJ5YKnPEjIA7IUs/gMf5jRQUGmvc0dhw1ZxgD/V155AoPXjAb1zQmzfH+lGBA6NUl5YNAIeNRVK5dxB2krUeufG3ehtheezNeeLPePNMg/Epv1+BoYb6qRmDzP+Z2P7NZMP+DCetKwUIZHLW450HPEhmYYvRBXbDwADoXe5ZW/tzAfAOaBd87rE/Nbw+D6V8MpdgkDyjJ78rUuQ6X0ASW3IlHojWAKEv3knn9ZMFBSyAB1jo4zeMsc1t+uP4+NaOzpBwyVcJ/o3OG1ynPfhHVovokMnLk9McN3J3wvsUIzcEzglvAINYbQghS5DNK7FIzbrpTS5t6B8E7AmZyOjuOcvVjCUopfjD8VtpzUSMw75RzJGOTkT5g1PKLeOdHMsRmAPVlMNfOqaR0dv2D6jM6x2B6GT3WKoJiL3py6ZQZZwFj0EjL25CQrq/BmDMQ4nCU0JRjT2fVnZDlNwFObQFuf5kIiNyBwbtYMB0rzjZCL48kTcYVrU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(261022075727099003)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1JWcThHRzdmK0F3aTFKeDJvbEN0V2NScXBJVUE3QWZkRmFBVkxyelRLQnls?=
 =?utf-8?B?cndJeXFYTXRaTm9pRUNXVzMxTGxURldTbzlMTnBIRFBOM3N0YzNNa2E4cGI1?=
 =?utf-8?B?K0szR2RocHlGUy9Jb1ljQUdBUWxMU01ScVZvMzZ5R0pPeDJiNExqYWo5Mmha?=
 =?utf-8?B?Z1h3RzA0b1hsdmtRWEdYaUw5WHpscmx5VzUwQ0xqM1BmNmhScUZ0SDMzb2NV?=
 =?utf-8?B?WW9KaHNwZ1pXTk5FbWFOUDhuSjJ0THowSTB0a0RDdTlQUmdrRkYybFZtUERw?=
 =?utf-8?B?V0I0Znc5amRQVUhjTHZCK2tGaENWM2toM0pNclZ4b0ZlK25IZkIramgzeEpY?=
 =?utf-8?B?YlBQek8wdHU1VkJ3ZEJMcFNHVDloay8rRS9kMmQ4cSs0QlAyYS8reXFYQ1pt?=
 =?utf-8?B?VmNhYUVDZHhIT0k1eXU3QlN6ajBiWVAzNUFLVld2dlg0ZHFSNFdodno5SnVR?=
 =?utf-8?B?THZWWUdqYU5lK2s2cUU0YUhrZ2dSVm9kU0M4Mk4ySndJOGNrYTJ3T0JaWTdW?=
 =?utf-8?B?N0VVYXBZWDhUNVdCcXhucmg4bkhEVlhQaWhzZmhESXVSS2pPMm1Nbm5FUjlJ?=
 =?utf-8?B?WHhvVGYxcVcxL0ErYjhkTDY1MzNNTDdxY0RrM2o0WlU0UnJzT1hhRWpVM09F?=
 =?utf-8?B?OXN1NzYyTVFRMTVDWDNTc0M0dE91bHA0cFF1UzAzRDR5TlBqOFJQcVRYSnRV?=
 =?utf-8?B?dHlLdk5RdHJoN0NuM1pQMU9XZjJrUkh2aTNSR0MwOUUwUEQ2MzlhcUdPOGl0?=
 =?utf-8?B?dmtsNW5XSmFob0tLUnBRaFB5VmptU09LaTFJb1dobEZyRzFwMEtXbGMwL0Zs?=
 =?utf-8?B?b0dYWnVJTjBtZ2RSU1lPWmhQTmZhTWxhaEtpLy9jNDh1YjBMSnpaYnRmV0JH?=
 =?utf-8?B?aWgrdnU1U0dHMXR6ZFhJN0pmbVA3THlwWG85WXFpMkpBRXVtWElVMjY5WkZo?=
 =?utf-8?B?TTRPeGN0S08yMTladmpLR3dhamU3WjRZMUsrZkoyVHpqUEJOaDRNTERwZ1Q4?=
 =?utf-8?B?MERaQ0MxeHFacGZBTGlXSGtZWXpSR3M0N1h6M0hnc0l4bmdZOGt6TFd4T09m?=
 =?utf-8?B?aFNFUkxOZlM5cDB6V0RzTSt0eTZ2Unk0eXFseUVkOWJmNTZDQVo1djk3dXpK?=
 =?utf-8?B?MlYrU2d2OTAvbDh1eFd0a0I1OVVOL0VZM1J2YXBBaE5IZVNIOFdMdmVNMlhM?=
 =?utf-8?B?bXRzVUhyZCtYWERxdStQRmJRMHF1UjBKRXYzVzJicENNRDVPNWxpMEVqR3dD?=
 =?utf-8?B?cmRUa3BFcTNhdjl0K3NYODhZQlA3cmpsYmFKNXMvbkZrbE5jaHJaa0RhaHkw?=
 =?utf-8?B?VjZ0T1lYOTdOeC9FV1JESXgxV3huUEhlN09pSUtVV21lV3JmaUZuUkcvNVZM?=
 =?utf-8?B?Zm1ibHJ5TXRBWm9DNTh1a1BoOWRaTjEwWG5iNlFCK1BaTXZRcEwrWDRoVEF4?=
 =?utf-8?B?OTErdGhZeStjUUVEZFdLQTI5RHpUcTByS2xTcStDajhUdlU4TUxqejkvQ1FK?=
 =?utf-8?B?WU9VNVZZaVFBYmpDZGZNNGtBTWd1bzZ0aitxQmZ3d0ZuSmN0WDhtOGw5MFgz?=
 =?utf-8?B?enpRSDdtK0toSm4zbmtuL25PeitSengwYTI0c0NUVmtLb2Z1cWMzb29yWERU?=
 =?utf-8?B?QnZTVndjWDhFNHNVU3N0d254a1BqZ1RaQW5CdUFPTUFhcHQ4bWNlSnNQR3FN?=
 =?utf-8?B?VVFmTjA3dVZIQXlDQnlVeVhhTlh5UGpPQ0lmRDA1YXNLUFcrczBQeE8xU0R2?=
 =?utf-8?B?eUcxSWVhYlZwbzFLVGpCdm1JYzJKZmVZNklEZ3lQSnd3YWxJdHZNNVQ2d1NE?=
 =?utf-8?B?OUNXOGpUVTFmN3VxLzVsUlRHekZaVENXeXk2QXU3eUN5RWg4WTBVQ2Ixc1kw?=
 =?utf-8?B?SG1la3FYdi90eEo1OEFialdodG9RTk9ndDhveTdnTVAzQTR6UTRHTTNVRG9q?=
 =?utf-8?B?RW1xSHRvVkhxbWVIZ2hQdTRxeU9TNEJwUUpFajZrTWl4Q3ZJL3FLeXA0c0Jw?=
 =?utf-8?B?eDhtMHVJN1lhYWZqVXhETzRXekRVU1hHQjN6bzR3MzJFbDhsUkpxWENyWkdM?=
 =?utf-8?B?VFhZMTkvOWlRU0VKY3hSV2pDWmhNdlZXSnA1RmtkTWdDaWFtU3YzVEdFK2ls?=
 =?utf-8?B?b0hrRTlOVkZIN2tCQzlwMFhpSmZ2eUdtM3Y0UEx2TFFtRUZzeUlITVc5bExv?=
 =?utf-8?B?SFBEbzM1dTM4Q2xybW52VFg1TlkvdDdsR0Nka3hWUXA3ZVlLTjNndWdqNncr?=
 =?utf-8?B?Q2cwT0Zneit0VThhcXBRR2s5WWtlUUZzYk85Q1JYdDlVaHlXOEpqYkRoT1hQ?=
 =?utf-8?B?dHBsTlNWTC9oQ3dzV3Y1UHcrZFZQK3NBYmNzZURvOW96a3VvLy9lV1A3Ymk2?=
 =?utf-8?Q?tQzra82Kxp5XrwFg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13edb1a-6a4c-416e-964f-08df335c92b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 12:27:59.9861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RoQ9lc3cTkBaXl5U0zEYLKtjk6BMzt2NBJi5wgM390maHgi1qO80Ny9Fh/ID1AFFfZtYv+wzuhbSuWHZpaimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7793
X-purgate-ID: tlsNG-42698a/1793017682-A96C29EA-C34772D2/0/0
X-purgate-type: clean
X-purgate-size: 7234
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNCnZQQ0kgTVNJLVggaGVs
cGVycyB0byBiZSB1c2VkIG9uIEFybSBhcmUgbW92ZWQgdG8gYSBjb21tb24gaGVhZGVyLg0KDQpT
aWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NClNpZ25lZC1v
ZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20+DQpT
aWduZWQtb2ZmLWJ5OiBNeWt5dGEgUG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQot
LS0NCiB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNpLmggICAgICB8IDIxIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0N
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaCB8ICAyICstDQogeGVuL2RyaXZl
cnMvdnBjaS9tc2kuYyAgICAgICAgICAgICAgfCAgMyArLS0NCiB4ZW4vZHJpdmVycy92cGNpL21z
aXguYyAgICAgICAgICAgICB8ICAyICstDQogeGVuL2luY2x1ZGUveGVuL21zaS5oICAgICAgICAg
ICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCiA2IGZpbGVzIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL21zaS5oIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zaS5oDQppbmRl
eCA2ZmI2NjNiMmU3Li44MThmYTcyOTI4IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L2luY2x1
ZGUvYXNtL21zaS5oDQorKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNpLmgNCkBAIC0x
NDcsMjcgKzE0Nyw2IEBAIGludCBtc2lfZnJlZV9pcnEoc3RydWN0IG1zaV9kZXNjICplbnRyeSk7
DQogICovDQogI2RlZmluZSBOUl9IUF9SRVNFUlZFRF9WRUNUT1JTIAkyMA0KIA0KLSNkZWZpbmUg
bXNpX2NvbnRyb2xfcmVnKGJhc2UpCQkoKGJhc2UpICsgUENJX01TSV9GTEFHUykNCi0jZGVmaW5l
IG1zaV9sb3dlcl9hZGRyZXNzX3JlZyhiYXNlKQkoKGJhc2UpICsgUENJX01TSV9BRERSRVNTX0xP
KQ0KLSNkZWZpbmUgbXNpX3VwcGVyX2FkZHJlc3NfcmVnKGJhc2UpCSgoYmFzZSkgKyBQQ0lfTVNJ
X0FERFJFU1NfSEkpDQotI2RlZmluZSBtc2lfZGF0YV9yZWcoYmFzZSwgaXM2NGJpdCkJXA0KLQko
KGJhc2UpICsgKChpczY0Yml0KSA/IFBDSV9NU0lfREFUQV82NCA6IFBDSV9NU0lfREFUQV8zMikp
DQotI2RlZmluZSBtc2lfbWFza19iaXRzX3JlZyhiYXNlLCBpczY0Yml0KSBcDQotCSgoYmFzZSkg
KyBQQ0lfTVNJX01BU0tfQklUIC0gKChpczY0Yml0KSA/IDAgOiA0KSkNCi0jZGVmaW5lIG1zaV9w
ZW5kaW5nX2JpdHNfcmVnKGJhc2UsIGlzNjRiaXQpIFwNCi0JKChiYXNlKSArIFBDSV9NU0lfTUFT
S19CSVQgKyAoKGlzNjRiaXQpID8gNCA6IDApKQ0KLSNkZWZpbmUgbXVsdGlfbXNpX2NhcGFibGUo
Y29udHJvbCkgXA0KLQkoMVUgPDwgTUFTS19FWFRSKGNvbnRyb2wsIFBDSV9NU0lfRkxBR1NfUU1B
U0spKQ0KLSNkZWZpbmUgbXVsdGlfbXNpX2VuYWJsZShjb250cm9sLCBudW0pIFwNCi0JKChjb250
cm9sKSB8PSBNQVNLX0lOU1IoZmxzKG51bSkgLSAxLCBQQ0lfTVNJX0ZMQUdTX1FTSVpFKSkNCi0j
ZGVmaW5lIGlzXzY0Yml0X2FkZHJlc3MoY29udHJvbCkJKCEhKChjb250cm9sKSAmIFBDSV9NU0lf
RkxBR1NfNjRCSVQpKQ0KLSNkZWZpbmUgaXNfbWFza19iaXRfc3VwcG9ydChjb250cm9sKQkoISEo
KGNvbnRyb2wpICYgUENJX01TSV9GTEFHU19NQVNLQklUKSkNCi0NCi0jZGVmaW5lIG1zaXhfY29u
dHJvbF9yZWcoYmFzZSkJCSgoYmFzZSkgKyBQQ0lfTVNJWF9GTEFHUykNCi0jZGVmaW5lIG1zaXhf
dGFibGVfb2Zmc2V0X3JlZyhiYXNlKQkoKGJhc2UpICsgUENJX01TSVhfVEFCTEUpDQotI2RlZmlu
ZSBtc2l4X3BiYV9vZmZzZXRfcmVnKGJhc2UpCSgoYmFzZSkgKyBQQ0lfTVNJWF9QQkEpDQotI2Rl
ZmluZSBtc2l4X3RhYmxlX3NpemUoY29udHJvbCkgCSgoKGNvbnRyb2wpICYgUENJX01TSVhfRkxB
R1NfUVNJWkUpICsgMSkNCi0NCiAvKg0KICAqIE1TSSBEZWZpbmVkIERhdGEgU3RydWN0dXJlcw0K
ICAqLw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tc2kuYyBiL3hlbi9hcmNoL3g4Ni9tc2ku
Yw0KaW5kZXggODgzMWNlMDY4Yy4uNWU0ZTg5YjNjMCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4
Ni9tc2kuYw0KKysrIGIveGVuL2FyY2gveDg2L21zaS5jDQpAQCAtMjEsNiArMjEsNyBAQA0KICNp
bmNsdWRlIDx4ZW4vaW9jYXAuaD4NCiAjaW5jbHVkZSA8eGVuL2tleWhhbmRsZXIuaD4NCiAjaW5j
bHVkZSA8eGVuL3Bmbi5oPg0KKyNpbmNsdWRlIDx4ZW4vbXNpLmg+DQogDQogI2luY2x1ZGUgPGFz
bS9hcGljLmg+DQogI2luY2x1ZGUgPGFzbS9nZW5hcGljLmg+DQpAQCAtMjksNyArMzAsNiBAQA0K
ICNpbmNsdWRlIDxhc20vaXJxLXZlY3RvcnMuaD4NCiAjaW5jbHVkZSA8YXNtL3NtcC5oPg0KICNp
bmNsdWRlIDxhc20vZGVzYy5oPg0KLSNpbmNsdWRlIDxhc20vbXNpLmg+DQogI2luY2x1ZGUgPGFz
bS9maXhtYXAuaD4NCiAjaW5jbHVkZSA8YXNtL3AybS5oPg0KIA0KZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5oIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11LmgNCmluZGV4IDUyZjc0ODMxMGIuLmJhMjI1MDZmNTggMTAwNjQ0DQotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaA0KKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11LmgNCkBAIC0yNiw4ICsyNiw4IEBADQogI2luY2x1ZGUgPHhlbi90
YXNrbGV0Lmg+DQogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KICNpbmNsdWRlIDx4ZW4vZG9tYWlu
X3BhZ2UuaD4NCisjaW5jbHVkZSA8eGVuL21zaS5oPg0KIA0KLSNpbmNsdWRlIDxhc20vbXNpLmg+
DQogI2luY2x1ZGUgPGFzbS9hcGljZGVmLmg+DQogDQogI2luY2x1ZGUgImlvbW11LWRlZnMuaCIN
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL21zaS5jIGIveGVuL2RyaXZlcnMvdnBjaS9t
c2kuYw0KaW5kZXggZjczNjA1NGIyYi4uMGVkMzlhNmRlOSAxMDA2NDQNCi0tLSBhL3hlbi9kcml2
ZXJzL3ZwY2kvbXNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMNCkBAIC0xOCwxMSAr
MTgsMTAgQEANCiANCiAjaW5jbHVkZSAicHJpdmF0ZS5oIg0KIA0KKyNpbmNsdWRlIDx4ZW4vbXNp
Lmg+DQogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPg0K
IA0KLSNpbmNsdWRlIDxhc20vbXNpLmg+DQotDQogc3RhdGljIHVpbnQzMl90IGNmX2NoZWNrIGNv
bnRyb2xfcmVhZCgNCiAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGlu
dCByZWcsIHZvaWQgKmRhdGEpDQogew0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNp
eC5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCmluZGV4IDViMDE4NTlhY2YuLjA1MDU2YjVl
YTEgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaXguYw0KKysrIGIveGVuL2RyaXZl
cnMvdnBjaS9tc2l4LmMNCkBAIC0yMSw5ICsyMSw5IEBADQogDQogI2luY2x1ZGUgPHhlbi9pby5o
Pg0KICNpbmNsdWRlIDx4ZW4vbGliLmg+DQorI2luY2x1ZGUgPHhlbi9tc2kuaD4NCiAjaW5jbHVk
ZSA8eGVuL3NjaGVkLmg+DQogDQotI2luY2x1ZGUgPGFzbS9tc2kuaD4NCiAjaW5jbHVkZSA8YXNt
L3AybS5oPg0KICNpbmNsdWRlIDxhc20veDg2X2VtdWxhdGUuaD4NCiANCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vbXNpLmggYi94ZW4vaW5jbHVkZS94ZW4vbXNpLmgNCmluZGV4IGM5MDNk
MDA1MGMuLjRlOTIyOTY1ZGUgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbXNpLmgNCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9tc2kuaA0KQEAgLTcsNiArNywyNyBAQA0KIA0KICNpbmNsdWRl
IDxhc20vbXNpLmg+DQogDQorI2RlZmluZSBtc2lfY29udHJvbF9yZWcoYmFzZSkJCSgoYmFzZSkg
KyBQQ0lfTVNJX0ZMQUdTKQ0KKyNkZWZpbmUgbXNpX2xvd2VyX2FkZHJlc3NfcmVnKGJhc2UpCSgo
YmFzZSkgKyBQQ0lfTVNJX0FERFJFU1NfTE8pDQorI2RlZmluZSBtc2lfdXBwZXJfYWRkcmVzc19y
ZWcoYmFzZSkJKChiYXNlKSArIFBDSV9NU0lfQUREUkVTU19ISSkNCisjZGVmaW5lIG1zaV9kYXRh
X3JlZyhiYXNlLCBpczY0Yml0KQlcDQorCSgoYmFzZSkgKyAoKGlzNjRiaXQpID8gUENJX01TSV9E
QVRBXzY0IDogUENJX01TSV9EQVRBXzMyKSkNCisjZGVmaW5lIG1zaV9tYXNrX2JpdHNfcmVnKGJh
c2UsIGlzNjRiaXQpIFwNCisJKChiYXNlKSArIFBDSV9NU0lfTUFTS19CSVQgLSAoKGlzNjRiaXQp
ID8gMCA6IDQpKQ0KKyNkZWZpbmUgbXNpX3BlbmRpbmdfYml0c19yZWcoYmFzZSwgaXM2NGJpdCkg
XA0KKwkoKGJhc2UpICsgUENJX01TSV9NQVNLX0JJVCArICgoaXM2NGJpdCkgPyA0IDogMCkpDQor
I2RlZmluZSBtdWx0aV9tc2lfY2FwYWJsZShjb250cm9sKSBcDQorCSgxVSA8PCBNQVNLX0VYVFIo
Y29udHJvbCwgUENJX01TSV9GTEFHU19RTUFTSykpDQorI2RlZmluZSBtdWx0aV9tc2lfZW5hYmxl
KGNvbnRyb2wsIG51bSkgXA0KKwkoKGNvbnRyb2wpIHw9IE1BU0tfSU5TUihmbHMobnVtKSAtIDEs
IFBDSV9NU0lfRkxBR1NfUVNJWkUpKQ0KKyNkZWZpbmUgaXNfNjRiaXRfYWRkcmVzcyhjb250cm9s
KQkoISEoKGNvbnRyb2wpICYgUENJX01TSV9GTEFHU182NEJJVCkpDQorI2RlZmluZSBpc19tYXNr
X2JpdF9zdXBwb3J0KGNvbnRyb2wpCSghISgoY29udHJvbCkgJiBQQ0lfTVNJX0ZMQUdTX01BU0tC
SVQpKQ0KKw0KKyNkZWZpbmUgbXNpeF9jb250cm9sX3JlZyhiYXNlKQkJKChiYXNlKSArIFBDSV9N
U0lYX0ZMQUdTKQ0KKyNkZWZpbmUgbXNpeF90YWJsZV9vZmZzZXRfcmVnKGJhc2UpCSgoYmFzZSkg
KyBQQ0lfTVNJWF9UQUJMRSkNCisjZGVmaW5lIG1zaXhfcGJhX29mZnNldF9yZWcoYmFzZSkJKChi
YXNlKSArIFBDSV9NU0lYX1BCQSkNCisjZGVmaW5lIG1zaXhfdGFibGVfc2l6ZShjb250cm9sKSAJ
KCgoY29udHJvbCkgJiBQQ0lfTVNJWF9GTEFHU19RU0laRSkgKyAxKQ0KKw0KIGludCBwZGV2X21z
aXhfYXNzaWduKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCiBpbnQg
cGRldl9tc2lfaW5pdChzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQogdm9pZCBwZGV2X21zaV9kZWlu
aXQoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KLS0gDQoyLjU1LjANCg==

