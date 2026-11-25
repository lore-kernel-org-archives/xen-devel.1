Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BD606A32E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=uaFCjWa+
Received: from list by lists.xenproject.org with outflank-mailman.1502127.1698148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB6N-0001Sj-0h; Wed, 25 Nov 2026 11:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502127.1698148; Wed, 25 Nov 2026 11:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB6M-0001SR-RM; Wed, 25 Nov 2026 11:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1502127;
 Wed, 25 Nov 2026 11:23:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xWB6L-0001Nu-Mi
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:23:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB6L-004zX7-2z
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:23:49 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b06c53e-bab6-0a2a0a5309dd-0a2a450abdcc-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:23:49 +0100
Received: from [52.101.66.75]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b06c544-f2d2-0a2a450a0019-3465424b5cb0-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:23:49 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB3PR03MB10190.eurprd03.prod.outlook.com (2603:10a6:10:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 11:23:46 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:23:45 +0000
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
 b=EpO5Tm9Ob6jXz42JQe2inuvIcxTxqxNOw7XvH3JoZE8grdp4AAoQXrNEqZR3Jl6GtLHGLDqV4kfaLvHdPgtYubWrvF9gkBWid3u7EOUmo/Czxg+Jon47qfFU0qLMc5Ees8F5NP7ttPe3jt/bTc5hapHR+bvsquUV1hZWg34CRMzrZD6dDaOqnxS21yoL7EsDY0wUpxCa+jXlbP3JxNpOD4B0louBZuwlexQM/IFxeWQdwZodEa181076n1ezZPr6r4SrkwzF/tZChmYifUXodnVU2XXI5JIYuFNrboGxZW9W2IZ76pHvOH5NDkdKxoVbFKuIlTqW2C5RlvAocmua2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xatcjdIyzxQigEEMKdIoyQodBJEooQRFhnMgp0DrAJc=;
 b=QCl29JANKqYwY1SKNVKFJhXqXH6JyhhmEoZ+Gg+8n689XKRqMFciocSBUiNulSm/IB2PKJaKJLqrbB0tgpTA9azPUTkgNXoW4e6cSLPFG0owlnBsv8bxqn1T1XDw4Br3F7cPDj35nUEKIutt8hO+7x3yeHsrYZGRnH46mv6xGG0qrhzG7rWZjhERCGU4P1O4/A7e9IpXGVhAuemB34cEnNREBIhcYuiHjZjFc/QLHXV7dXZRZRwuhdjodpyhZBo+wod0X+MlwTONumign5W+8yoRf4KI2zOJOSxc3XCAgzXyrpEhqsTGByUP5BeD7MzyAn2IUm/Pg2cllMkH54GtLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xatcjdIyzxQigEEMKdIoyQodBJEooQRFhnMgp0DrAJc=;
 b=uaFCjWa+1SAhgGKG5g3ZViBH9VXN+9OzEZIvzHMgy0a8FULNLdA1tM0rd6hAqyvb0xGCzZJJxYYAmhQ2GTbmMM3maYQbIZWdBwRNhIA0G3EfHhIrzcaQxvxOEZ0EoDza+QtzQtkmTQ9ogjuioxwB2lhcDJXikyhMmy9oMpuGn70U3UZF03mqHGcMFh12tkiPn08ttwLg1frkID0/yCtxrPHsqQ1dahUWMDUr8fl+EXMsvsr4IvSMYxT+RsFOp7iuz7IkmMUh5KRWvPJcLy4agwZdSI83OHqfbiik3GirhbBLV+Mf8g1JAe4FdUCC5K5YjqwDnzN4W5UiaSthxWGAmA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v5 5/5] vpci: add SR-IOV support for DomUs
Thread-Topic: [PATCH v5 5/5] vpci: add SR-IOV support for DomUs
Thread-Index: AQHdfM9uo+ii6kqk3E6eWQYClSiYmA==
Date: Wed, 25 Nov 2026 11:23:44 +0000
Message-ID:
 <2c9f87cd1e85817aa9576115d4a542ed4012d482.1795603723.git.mykyta_poturai@epam.com>
References: <cover.1795603723.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1795603723.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB3PR03MB10190:EE_
x-ms-office365-filtering-correlation-id: 6a1f80c4-7d83-4c55-0828-08df4ae691d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|6133799003|18002099003|261022105027099003|261028144727099003|261021121427099003|261026121527099003|11063799006|261102123227099003|261009223027099003|261022075727099003|261021123027099003|56012099006|38070700021|10067099003|261026140227099003;
x-microsoft-antispam-message-info:
 SRtvTVSi26aMyScnWN+gSsqnGIY47nbRPmtCxvTfqHOPBugLXlLkRBgToZ5uvtv+vQC5+dvK9u6qLl9cD+Fgfa5lIWBbd7t6Kaq2dUMyvyUPCT9yavl+ADhYtfbTczilYQKvOv6lhk1+iWxawLEVg+4c8vJOFj1CV9Mr+5wmfPeh0BIGlR/8jVZZ2Z58E5GmsTUOMb35Ox6BnPZT6CbhhuBZk15AA2pnVqGLeeRhbNjHs41hfuln1H5K7LszyrZWyJK1KUndOJem25lM0M4b/JVSCLLCYDSXUB9CJP5vopLhXWZpm5AOEKhujjpa4y2JFRq09jrjsE47+hDog07e2qy6Ue3M+EP51Hpfp3MndHhnZCLC4iTbqvm6lCpZE3D9dAS09c8HQocJ1QlEUK+LFUT/oRlQeL8o6BkAztPRro2+ZMGE3IooNffV6bkXZVjd7CT6diS4/OeJM7V8cGWZgrwf6G+1lRRAR5gRDPHJolGJK2hLg14/NsbBPLr09zwXyHtcWhC3L87j2ZGzQyxHhVCFtUwUqFuDLpQjGWb2NiAEYI1q7FrIaVTqH7Ss9Ep0dZo5IwClnUmhj3X+zjVUwdbXY4rTQHRHMu/NNOYPBKH65bXAnFt5Qe4PMvGJv18cFyaag9AEAfRGMFe59r/E1IhkxfVNclES3K1tKUjWUY9a5IiGjrB+BaPhqLBctTdHdRlA7DWu4KS46XUDQlZySNP0oz/pGh4ACVnhGcTC4mY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(6133799003)(18002099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026121527099003)(11063799006)(261102123227099003)(261009223027099003)(261022075727099003)(261021123027099003)(56012099006)(38070700021)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3NOYnR4Y3NDUWZiWUIyNEJQVCtYd210aTBvWWxGZVcydDVSWlhBeWpUcmRO?=
 =?utf-8?B?U1p4aG1yT3BnQnVySWpnbkgxOGUvUmozVzMyZVlQUFhzTFVrcXUvSlFVakFD?=
 =?utf-8?B?d1NBMGRRaFQwaGpDK2Frdkpta3dDVjNJZWc2V2dqYm90NU40ckFoQ1hxaThJ?=
 =?utf-8?B?SlJTTzZUNVNpbXNHRXJTTkJzYUZTdXBnZmVyZEJsSktNanNsQzl5VFR5czlK?=
 =?utf-8?B?a0xwV3JPTXNTQWpJOXFSRy9VV2JtbmlDamtuNjF1R2RSbTUrZlc5alJQOWRG?=
 =?utf-8?B?em9DbFhMbm1iMncxc2IwUWliRkplZGxNVjZEdVkveTduTWh3REI4eit5by9O?=
 =?utf-8?B?VzNrb0JaaXQxODlsYkFTU0E3cWpNRnpES0R4NkZVTG9YRnJCTm9CUWRTeVAv?=
 =?utf-8?B?SXJOSWZvcEd0NU9pOUVnSjlwc1dpY05EWXFjZWplQzZpZjd5VTVuMUx2Uzl6?=
 =?utf-8?B?VUVNTTJmMUoyQ2NGdmlQWFFGKzRkQzRQaFU3dWxseUVHSS8wWElYSXFpWUhH?=
 =?utf-8?B?dUNFemdpR2poZ2Noc0FyRlYycUhwclVSSzVNTlNzakZkcEt4UzB0aUV0VU1D?=
 =?utf-8?B?cnRnTjc5MUo0REJuSmRSa21YZVdJVzdXS1doZjlnR3J0NUJDMjdzVGE0M0FE?=
 =?utf-8?B?eERpK0EycmNHTTRRdlFZZGRjQVRJeDI4enRCL2l1d0g1bE93Z0hMdGhZcklD?=
 =?utf-8?B?VWRQeEJzSHI2dlNIeUdvbzdEVVpOdDd1N3krWCtlaDBURnAydzhCUU0yRkNP?=
 =?utf-8?B?dHI1STNYTUhYU3A2STVVSmRudHZyeHZBRC9HMGViWDBJNHgyWkJxZVpIZyti?=
 =?utf-8?B?UkNhQ2dld2pJclhnOGNFTXRyREhKM1F2bnFxbnJwa1ltUXBNQUVnQzNUMU5N?=
 =?utf-8?B?RzRXTThNTVZpV3dnSWFxaVFuVzdadnpDTGFNSHYxb0tMQTlNYWRaWHQwRjNa?=
 =?utf-8?B?dkMwZE9uUmlTQnJlZmtNMHVmbUlSaVBodUlXbXN1R0hZcDNvS2RJWXl0WWM2?=
 =?utf-8?B?dGxaWDZuaEszRUd2aVJpWjFjcnVZZVVGQWN6TWlPWjJwZmxwMG5vSGlEdnA1?=
 =?utf-8?B?K1QrdmJ1a01nTHIydE5vTkU5bG45dU9LK1lTcUM5WDFUaml0aTZ1blhLdGJG?=
 =?utf-8?B?WHQ1TXFwc1duVi9Ja1NUc080UTl5OFFGaGtwWjRRdnkyNi9vaWlIc0pwdW0x?=
 =?utf-8?B?OWtqK0owa0JoRUNmZkhmRE1JUjVVQ3JTanVsOXdvODAvbVhqdStLMDFHMnRR?=
 =?utf-8?B?TGRQVG0zMEVESDFIUGRhRnZEeXlVTm1zMlQ0ek01U25WZjZDWmloZGFkTFNm?=
 =?utf-8?B?RDhNOUpkNExpT05IZ2ZlcTVtWTBOTzZISGRaLzlVM3VhbzhzOGFwZ3lhc09K?=
 =?utf-8?B?R3Q0V2NZZkp5SHE3YU8wQWRsSklUc2UvU3RrU2hObjB1ODBXeW9zRWJ0UjhB?=
 =?utf-8?B?NkdyY21TVUF1TC9TOC92VE1pWHREckZkczRjZ00rRnZ1enFSSGpGakZsZDU5?=
 =?utf-8?B?Rk1jTHp3R015aW9WSlZNYW9Ta3FNaHBUVWZGZmtDOXJKOHlRUXNaVHRncDRm?=
 =?utf-8?B?MnFDbXBodmFpdnY3U2IxN2YxQkNoQnRnUTNOc1NMSVoxQm9PVVJLR0hFRml1?=
 =?utf-8?B?V1BpYVdUdHp6U3lkL2ovc2RBWkI3Rmp3NnpCZVZVVm9uUENKQ2xnSk1NbUF0?=
 =?utf-8?B?NzNqRkdReDQ1NkRLREIrU3krNTV6WTBGbWRBM0ZRajdWMCs2ZGRvc0FjZkQv?=
 =?utf-8?B?SmJzdzNBRUZoQkhCbUw5MWpWWWNmWHlSbXZVMlZqSCtNcmp5dHMxMUZzVlRq?=
 =?utf-8?B?K0VRZVF6dnc0OU9ldXk2K05hNlFmNVNtYkRjeGlxT0x5Sk9ycm9JWnlzK3lq?=
 =?utf-8?B?Yll4Ukh6YnpmL3ZvWjl6NjJXOTkzR29aeHJsTkJsaUNqanQrNmQvVFhoMFFH?=
 =?utf-8?B?bXVyQlg1VWh3aWp0N0tXYmJFYkx0d21ra1pSWVk2NTlHdU1XRVdsWWMrRS9L?=
 =?utf-8?B?elFQK29nNm5CNmpPZ04wS1JKajArWmJGQU1tNDlzVHp2djhYdXBvSDdhT3pS?=
 =?utf-8?B?amdwcVUwVW5HM0ZEQzZNM1JVdU5ZbVNGSDBSV2k2YzZ2eXZPS0Nvdjl0Umh6?=
 =?utf-8?B?OXVoODMxY2xWSURkZ1hvMjE5YWE5aTNFMlcxd0tIckQ3NmJwN2tlS0NFMGdt?=
 =?utf-8?B?VmZxbGRpMzh1MVorU1VTQXhQYjEwV0J5VTBsR2xhTkpHbDlRRmxkT1dPSm5r?=
 =?utf-8?B?SkJIUCtIS1BWLzh5NkszeFBTNGdoMmh1bDNoVUtEU05VNWU1WlVMSU5aY0tW?=
 =?utf-8?B?dDhtU2FFdVFPTWVMTTRsUVhlQnlCUkwzcUM2ODIreUt4NGtISU0wdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1f80c4-7d83-4c55-0828-08df4ae691d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 11:23:44.9084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZLrwePpQUD9DYjYlgRMFtGUpj+pdH5uRjMDdSaaAJP5MNx6JpM3c2l4ZtTuu/L6Ho7lIKmhGL6IHcDyKbChTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR03MB10190
X-purgate-ID: tlsNG-4011c0/1795605829-53ED2CFC-D972F85B/0/0
X-purgate-type: clean
X-purgate-size: 6052
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCg0K
RW11bGF0ZSBndWVzdCBCQVIgcmVnaXN0ZXIgdmFsdWVzIGJhc2VkIG9uIFBGIEJBUiB2YWx1ZXMg
Zm9yIFZGcy4NClRoaXMgYWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3QgdmlldyBvZiB0aGUgbm9ybWFs
IEJBUiByZWdpc3RlcnMgYW5kIGVtdWxhdGVzDQp0aGUgc2l6ZSBhbmQgcHJvcGVydGllcyBhcyBp
dCBpcyBkb25lIGR1cmluZyBQQ0kgZGV2aWNlIGVudW1lcmF0aW9uIGJ5DQp0aGUgZ3Vlc3QuDQoN
CkV4cG9zZSBWSUQvRElEIHRvIHRoZSBndWVzdC4NCg0KTm90ZSwgdGhhdCBWRnMgUk9NIEJBUiBp
cyByZWFkLW9ubHkgYW5kIGlzIGFsbCB6ZXJvcywgYnV0IFZGIG1heSBwcm92aWRlDQphY2Nlc3Mg
dG8gdGhlIFBGcyBST00gdmlhIGVtdWxhdGlvbiBhbmQgaXMgbm90IGltcGxlbWVudGVkLg0KDQpO
b3RlIHRoaXMgb25seSByZW1vdmVzIG9uZSBvZiB0aGUgZ2FwcyBvbiB0aGUgd2F5IHRvIHZQQ0kg
RG9tVSBzdXBwb3J0Ow0KVkZzIGFyZSBub3QgdXNhYmxlIGluIERvbVVzIHVudGlsIHRoZSByZXN0
IG9mIGl0IGlzIHVwc3RyZWFtLiBUaGUgRG9tVQ0KdGVzdGluZyBiZWhpbmQgdGhpcyBwYXRjaCB1
c2VkIG91dC1vZi10cmVlIHZQQ0kgRG9tVSBwYXRjaGVzLg0KDQpTaWduZWQtb2ZmLWJ5OiBTdGV3
YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KU2lnbmVkLW9mZi1i
eTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0KUmV2aWV3ZWQtYnk6
IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCi0tLQ0KdjQtPnY1Og0KKiBj
b2xsZWN0IFJCDQoqIHVzZSBfcCgpIGZvciB0aGUgY29uc3RhbnQgcmVnaXN0ZXIgdmFsdWVzDQoq
IGxvYWQgc3Jpb3ZfcG9zIGFmdGVyIHRoZSB2Zl9pbml0X2JhcnMoKSBlcnJvciBjaGVjaw0KKiBk
cm9wIHRoZSBjbGFzcy9yZXZpc2lvbiBoYW5kbGVyLCBhcyBpdCBpc24ndCBTUi1JT1Ygc3BlY2lm
aWMNCg0KdjMtPnY0Og0KKiBlbXVsYXRlIFZJRC9ESUQgYWdhaW4NCiogYWRkIGEgbm90ZSB0byBj
b21taXQgbWVzc2FnZQ0KDQp2Mi0+djM6DQoqIGRvbid0IGVtdWxhdGUgVklEL0RJRCByZWdpc3Rl
cnMNCiogcmVwbGFjZSBpZmRlZiB3aXRoIElTX0VOQUJMRUQNCg0KdjEtPnYyOg0KKiByZW1vdmUg
VkYgcmVnaXN0ZXIgaGFuZGxlcnMgY292ZXJlZCBieSBpbml0X2hlYWRlcg0KKiBzZXQgZ3Vlc3Qg
YWRkciB1bmNvbmRpdGlvbmFsbHkNCi0tLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvc3Jpb3YuYyB8IDU4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgNTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3ZwY2kvc3Jpb3YuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvc3Jpb3YuYw0KaW5kZXggYmU0
MTVhOThkYS4uZTI2MmY0M2E3MiAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvc3Jpb3Yu
Yw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS9zcmlvdi5jDQpAQCAtNzYsNiArNzYsNyBAQCBpbnQg
dnBjaV92Zl9pbml0X2hlYWRlcihzdHJ1Y3QgcGNpX2RldiAqdmZfcGRldikNCiAgICAgY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBmX3BkZXY7DQogICAgIGludCByYyA9IDA7DQogICAgIHVpbnQxNl90
IGN0cmw7DQorICAgIHVuc2lnbmVkIGludCBzcmlvdl9wb3M7DQogDQogICAgIEFTU0VSVChyd19p
c193cml0ZV9sb2NrZWQoJnZmX3BkZXYtPmRvbWFpbi0+cGNpX2xvY2spKTsNCiAgICAgQVNTRVJU
KHZmX3BkZXYtPmluZm8uaXNfdmlydGZuKTsNCkBAIC04Nyw4ICs4OCw2MSBAQCBpbnQgdnBjaV92
Zl9pbml0X2hlYWRlcihzdHJ1Y3QgcGNpX2RldiAqdmZfcGRldikNCiAgICAgaWYgKCByYyApDQog
ICAgICAgICByZXR1cm4gcmM7DQogDQotICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMTYocGZfcGRl
di0+c2JkZiwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICBwZl9wZGV2LT52cGNpLT5zcmlv
di0+cG9zICsgUENJX1NSSU9WX0NUUkwpOw0KKyAgICBzcmlvdl9wb3MgPSBwZl9wZGV2LT52cGNp
LT5zcmlvdi0+cG9zOw0KKyAgICBjdHJsID0gcGNpX2NvbmZfcmVhZDE2KHBmX3BkZXYtPnNiZGYs
IHNyaW92X3BvcyArIFBDSV9TUklPVl9DVFJMKTsNCisNCisgICAgaWYgKCBJU19FTkFCTEVEKENP
TkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUKSAmJg0KKyAgICAgICAgIHBmX3BkZXYtPmRvbWFp
biAhPSB2Zl9wZGV2LT5kb21haW4gKQ0KKyAgICB7DQorICAgICAgICBzdHJ1Y3QgdnBjaV9iYXIg
KmJhcnMgPSB2Zl9wZGV2LT52cGNpLT5oZWFkZXIuYmFyczsNCisgICAgICAgIC8qDQorICAgICAg
ICAgKiBBIFZGJ3MgVmVuZG9yIGFuZCBEZXZpY2UgSUQgcmVnaXN0ZXJzIHJlYWQgYXMgMHhmZmZm
LiBUaGUgZ3Vlc3QgaGFzDQorICAgICAgICAgKiBubyBQRiB0byBzeW50aGVzaXNlIHRoZW0gZnJv
bSwgc28gdGFrZSB0aGUgdmVuZG9yIGZyb20gdGhlIFBGIGFuZA0KKyAgICAgICAgICogdGhlIGRl
dmljZSBmcm9tIGl0cyBTUi1JT1YgY2FwYWJpbGl0eS4NCisgICAgICAgICAqLw0KKyAgICAgICAg
dWludDE2X3QgdmlkID0gcGNpX2NvbmZfcmVhZDE2KHBmX3BkZXYtPnNiZGYsIFBDSV9WRU5ET1Jf
SUQpOw0KKyAgICAgICAgdWludDE2X3QgZGlkID0gcGNpX2NvbmZfcmVhZDE2KHBmX3BkZXYtPnNi
ZGYsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Jpb3ZfcG9zICsg
UENJX1NSSU9WX1ZGX0RJRCk7DQorDQorICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHZm
X3BkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIE5VTEwsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFBDSV9WRU5ET1JfSUQsIDIsIF9wKHZpZCkpOw0KKyAgICAgICAgaWYgKCByYyAp
DQorICAgICAgICAgICAgcmV0dXJuIHJjOw0KKw0KKyAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdp
c3Rlcih2Zl9wZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBOVUxMLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBQQ0lfREVWSUNFX0lELCAyLCBfcChkaWQpKTsNCisgICAgICAgIGlm
ICggcmMgKQ0KKyAgICAgICAgICAgIHJldHVybiByYzsNCisNCisgICAgICAgIC8qIEhhcmRjb2Rl
IG11bHRpLWZ1bmN0aW9uIGRldmljZSBiaXQgdG8gMCAqLw0KKyAgICAgICAgcmMgPSB2cGNpX2Fk
ZF9yZWdpc3Rlcih2Zl9wZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBOVUxMLA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQQ0lfSEVBREVSX1RZUEUsIDEsIF9wKFBDSV9IRUFERVJf
VFlQRV9OT1JNQUwpKTsNCisgICAgICAgIGlmICggcmMgKQ0KKyAgICAgICAgICAgIHJldHVybiBy
YzsNCisNCisgICAgICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8IFBDSV9TUklPVl9O
VU1fQkFSUzsgaSsrICkNCisgICAgICAgIHsNCisgICAgICAgICAgICBzd2l0Y2ggKCBwZl9wZGV2
LT52cGNpLT5zcmlvdi0+dmZfYmFyc1tpXS50eXBlICkNCisgICAgICAgICAgICB7DQorICAgICAg
ICAgICAgY2FzZSBWUENJX0JBUl9NRU0zMjoNCisgICAgICAgICAgICBjYXNlIFZQQ0lfQkFSX01F
TTY0X0xPOg0KKyAgICAgICAgICAgIGNhc2UgVlBDSV9CQVJfTUVNNjRfSEk6DQorICAgICAgICAg
ICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIodmZfcGRldi0+dnBjaSwgdnBjaV9ndWVzdF9t
ZW1fYmFyX3JlYWQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdnBj
aV9ndWVzdF9tZW1fYmFyX3dyaXRlLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9CQVNFX0FERFJFU1NfMCArIGkgKiA0LCA0LCAmYmFyc1tpXSk7DQorICAgICAg
ICAgICAgICAgIGlmICggcmMgKQ0KKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KKyAg
ICAgICAgICAgICAgICBicmVhazsNCisNCisgICAgICAgICAgICBkZWZhdWx0Og0KKyAgICAgICAg
ICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHZmX3BkZXYtPnZwY2ksIHZwY2lfcmVhZF92
YWwsIE5VTEwsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0JB
U0VfQUREUkVTU18wICsgaSAqIDQsIDQsIF9wKDApKTsNCisgICAgICAgICAgICAgICAgaWYgKCBy
YyApDQorICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQorICAgICAgICAgICAgICAgIGJy
ZWFrOw0KKyAgICAgICAgICAgIH0NCisgICAgICAgIH0NCisgICAgfQ0KIA0KICAgICBpZiAoIChw
Zl9wZGV2LT5kb21haW4gPT0gdmZfcGRldi0+ZG9tYWluKSAmJiAoY3RybCAmIFBDSV9TUklPVl9D
VFJMX01TRSkgKQ0KICAgICB7DQotLSANCjIuNTYuMQ0K

