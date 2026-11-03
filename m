Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F5606B11A
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=mkN6IQcF
Received: from list by lists.xenproject.org with outflank-mailman.1469434.1678266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlf-0001Ar-FO; Tue, 03 Nov 2026 10:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469434.1678266; Tue, 03 Nov 2026 10:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlf-0001Ae-Bl; Tue, 03 Nov 2026 10:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1469434;
 Tue, 03 Nov 2026 10:29:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xOBld-00018U-Ku
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:29:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBld-00Ac9H-1Y
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:29:25 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b776-2eae-0a2a0a5409dd-0a2a450c984c-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:24 +0100
Received: from [52.101.69.78]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b782-f479-0a2a450c0019-3465454e4cbb-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:22 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVUPR03MB11404.eurprd03.prod.outlook.com (2603:10a6:150:35b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:29:20 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:29:20 +0000
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
 b=k6IYCdphpUMZM9J097xtKJJhn2LDt3ABSiHT08k7HadCS7v5W9EONY2hN6oFsKecWk2XAoSikUZNLxb6ELSiejG4f0vPjwVzfrRsK5P/mioEDsmzWf1aLO+oUqi8jp9LS1wk/KiieXSDe3+Xgy/Z15/o9rmEV1MccPWKtI5PN81HDdf5+v3wU5C7YLk9fUOZcVwY2O+Axk+9PcIuJlI2CylQKrMS4ZCAU41glBofrpfsf34hf6mtLwxI35DuMGx2vnQTbFrsKXUK0replbMQZchxYk4rV0BLda1MwThMlZygy5af3frVoacT1sF+b5riprxSyJLOGOmg0GYnlnZB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEqVgxel8paWkLlVA9PgdAVvX8/0qfWrrq2+a6qiGTU=;
 b=bdvqZ+mBj5ffbORMVvs18oCkuuKxb5NZ07RSVU0Ka1ljS3iIN1ZXBfZyP+uAc6cebsf3AS31nXwb77PtOQqjRs6LYUzSHkxGHgmv6mi6pBwXeZ2bK62An0lmGRBlFA0okvFG7z7EoRM/jM1uH/XGgvPR/WqflE1Y+si9Bi9rpTfBLdfY9smeWDsaIQEae9Yq84N9deFdOAbuvdD7wntXrfMVOMj9/uZqUM/xC4+lOJciZhArPPL3Bj4F/jVi6FjfdmeQhhYYtr4sXMEcceZvX3HyQSEv4DsTLDOQcuZDl2LmEwowhfYUZ8xFmVgtKznQXy2PZwVwRfXsDInIRRnmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEqVgxel8paWkLlVA9PgdAVvX8/0qfWrrq2+a6qiGTU=;
 b=mkN6IQcFmBdoXPR8G5iuRD7N5GtgrIp4uN18Tgzk2abehI9cloH2tgNeiCe/WwdrFpw9HCMfCYi7ZrH4fFf6cLdk2am0eEjQBcx0hk2xouljPeYhPN4a0ZNy0d7Ytq5EtLBJwxoK1pNDRr0+zOoKTxD0Ku5lGIDH0h2wzvf7fdBjOuiVZM9OS6gJQS/A8qpN7DNhMUugTLKSkC8z6umjFwNKmCOuQuZoAoASDPl28cCJjk+S/jwnC9d2Nnw9+ZfVA2yi2xwqizNRMLcNf49TM4tdSBus3GSj8oSal3CI/mNKWyG2OROrO8D5vMVa/TyWZVzrHQVb+hmKMHzccWTanw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/4] xen: resolve MISRA C Rule 11.8 in xen_build_id_check()
Thread-Topic: [PATCH 3/4] xen: resolve MISRA C Rule 11.8 in
 xen_build_id_check()
Thread-Index: AQHda34v1vVQdT6hdUGbIMGkiVK2hw==
Date: Tue, 3 Nov 2026 10:29:20 +0000
Message-ID:
 <bd4ca85c30c0a9551171506d81301cd616d4a23c.1793699713.git.dmytro_prokopchuk1@epam.com>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVUPR03MB11404:EE_
x-ms-office365-filtering-correlation-id: 5f75dc0c-585f-4d5c-9b65-08df39955234
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|42112799006|22082099003|10067099003|56012099006|18002099003|261022075727099003|261102123227099003|261021123027099003|261021121427099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 WgTPRT6xhAaJpHVTajtlo40kAbDxWLT+7JPlTEXxNFZBx6CoDU1m2Ow/eFkxKPEOxM9GuwOp8u2m7Hpy8xpbNyyyms7Bnzd+aSIwCPkrgpQeIihCF5Li44L85KFby0mcoiODIhrGhOxJWxWQ/a5DeTO8Ra/zXed+nxAPcuGtn1zZ5tZxUaOqdQF09RuYo1Y6sYE69g0gUKQVfgTHQ2ZFufJnETkmL1HrTgw5awPN+f0Ztp6WHLy+OPT+5LhWXxD9VjQdCULTPQlsXb6NvUPTAsN43+BikNZcziWxiwKq0tf9V00XzIXl91r8ybPNd3WfE/QOxmoycaVGHQSZ1e8koDiDIUPs3AvD5doKEzC42V6YfCW7WVgHQs+Nj/XEkaEboj14qCoacaeQ0NPryw9hcETpfmowpKbN9vEPNyjWr+vRZ5bF4KMd128OkO6ePU/bVBydUuM44YHFNdMxanuFZ7z3Uqil9bis1d4z8Q6nwMaGEiXCS9vNZcl2QRmqjF9ibgZyx6MamLONVz0nzjgHj0pOBQ/rmU6mV8YTwtgeortG+IR63xRupY244JiwByM/o0NRC3EVvjCZpmES4pXjfQx/JyzXrfbIBYiMSxdJ+n+oBMbeF6VFaG+qbUL/VRmJVuOBIyGrtLmq0BTrpVNm8GxPTAvm2ju8k17diQtXH9n8RbJw3xCGtIaixQDNBdWd2p2+026G8VDRQ3nML3oH2PeAkqxprbwj+FdsScvtvqE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(42112799006)(22082099003)(10067099003)(56012099006)(18002099003)(261022075727099003)(261102123227099003)(261021123027099003)(261021121427099003)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkhPTmVzT2twY0JtakgxczZRMUFCVDBkbUVhVXVNdXJUMG41N25ySXRnUk1K?=
 =?utf-8?B?NFI2elBaQVRENWlrMjU0WTV4bE1LTDJ3eTVYV3J5R1d1eWFvcFZNNjZrV3lF?=
 =?utf-8?B?VXBvUFJsUlJTSitkUXcxRkV6Z1ZnU3EvZ1NabWdsZisrc0xqQlhrc0t1a3hG?=
 =?utf-8?B?VUxLbWhBcmx2NWVDaVJnSEpraVlkeWFzUHlZNC9qd3hkWEUwdzQ1OGtIZDgv?=
 =?utf-8?B?QThOWjVwazBRZUdZK0xZY3lTU0NNcUZ4dnZrRHFWV25mME84N1p4eE5TM25l?=
 =?utf-8?B?cVVUQ09VVEV5eFdTMnhXM1BoanUwUXk0ay84UmFtVDJCeG5BQ2VlRzNNT3p1?=
 =?utf-8?B?dVRZZGdwaTdoNnRQODIvZHV0Z3cyMXdGU0F6SnQrenVlbXJwRE1VZUJNS25M?=
 =?utf-8?B?b2ZhcTY4bzlxTWtBWlVGK2RXQmo4UDdoVmZTNUFJMXEzNjc3Y2hvYjBBVU9J?=
 =?utf-8?B?eHdnU1NWdi9jdG9DZkhLQVlrUzFHQTQyNk1ZZ2VGLy9MTDBnT2xLZzh5VlBV?=
 =?utf-8?B?WHhUbE1sTFJPb1F5Y1VJNmhIb1FDckxROG10bmVib1NXTlBUSmNselBIUzlr?=
 =?utf-8?B?dXA5YmRBb3QwMmc1ZWdoTnMzWmx3WWRTbGtFblFnMU13ZVlSZXJYNG5sRWdX?=
 =?utf-8?B?ZEs3ZTF5NS94K3lGMlpkdEM4VVQ0TjhhcXlFcFZyN3ZITnB0UVVzdzdXOFow?=
 =?utf-8?B?dUw4cnJudm5BMnc3eERCNTJNNTZqK0JLN3VwdlRxd0JZSkdPelNydFBqemgz?=
 =?utf-8?B?TVR5T0U5N3hQQXhiM1M4NHBNZm1GLzlhRW1XcWs2V09ZTUp5Z2NpYktGdUhi?=
 =?utf-8?B?TkdrNzZ6MjZVcE14ekdNdkljM3VuQ3ZNaGIrdVNhSWlvMDN2R0NzaHNNeU4z?=
 =?utf-8?B?U1VFK3J2TlIyRTRXM1hPWlFIQ2hiNVNFbGgzRC9xdTN2NW5CR0hkazl2MjU2?=
 =?utf-8?B?czB5cUloUTNaVGFZY0IxL0VqOU1waWNzeGtrbUJRbkUvOWhJbVJVWXg2cXA4?=
 =?utf-8?B?UW13eDNzeVhBNWJnL0tXNzcreEFjNldXdCt3RTAxY1pCQzBvbU1UUjNqSXVC?=
 =?utf-8?B?L211N21FUVg4a2RZMTAzQXhLb1c1ejRSNUd4L0R2VGJNRHljbitpcVd5UjhH?=
 =?utf-8?B?a3pkUSt5VndoUDV6SU5DM1N1Y0dzd1ZwbUFvSlRteHo2Y1E5YXFpMWVmZkZC?=
 =?utf-8?B?b2dIVHZBc0Y2V1lhVWdsQTdFcVU1bUg5Y1NzOGVvL1BXK3ZlNlVPZlBleVFF?=
 =?utf-8?B?M0JPbXJCbnNpbDdWcHNOUER1djA0QVc3dTlZTGpQUzRxZ21ETlg2TU5jVDBh?=
 =?utf-8?B?ZVNVcEs3QTZQenhiY2x5elEySWNyR21mTnJLU1ZidjUvbjFrd3hEelFEK1N3?=
 =?utf-8?B?Nm1HOTltWmZGVG0wUGFVRmYzMGNxWnJBOUh4UndlZ0NubjJNdUk3dlZEdTFS?=
 =?utf-8?B?Q3NIRm4xcjhFb09YVnNVdk9IK0NuNXc4WUUyNUJVUWVUT1BncWtHYy94NWh2?=
 =?utf-8?B?dnhTdVQweFZkRzBKaHh0Z3NWc05vaXdUSTRlVS8wcFhlRHpLTVo2QmxaK1Uy?=
 =?utf-8?B?cDhrYTljcU5DZVdmQ2hEclpER1hMZThNRFNsMXpaWjdtd2ZyQ3lUMnhPOWdC?=
 =?utf-8?B?Q1VUL1VuR3hnaURqdjJ3cW1STEx3M3lGMWI3TzFXaS9mT2RGU3BuLzhPL3V1?=
 =?utf-8?B?R0FOTnFTU1JLTzhyZUZjS3locllxSmd5Vjd6Q1o5bk1XOCtaQWl1UnhUR29n?=
 =?utf-8?B?R0YycFhhb1pCOUJuVkRxenRjcllWSUFvdklqSmQ5NE0wMXEwTmI1MEFyMm5o?=
 =?utf-8?B?WElsRzRUNjg5Q3Z0eXc3bFdKM1pCL0RBa0E2TDE0ZkFudVZaTDAveWxrck9J?=
 =?utf-8?B?clYvM0NwYThPWVhZYTdvaENFbzRpU0RRNGtieDV6anlMWUliWVlBUjIzNG43?=
 =?utf-8?B?VTJLSmdwdkJaWnk1STBkVVE3Y3Q5aklUMVl1RXQyTGRuSlZDNXJ1MHhQMU5m?=
 =?utf-8?B?M3FjcjJHS3Jxa3dQc3dlM3YyQ0piZlp0TWMxVDdTTkwzekQvMXdDVW0zeEpR?=
 =?utf-8?B?c0Jua2RtZWd6WXd3VlQ4Uzg2M243bkRvMjJWT3lnSStKZVRvOUZpRkx6QmZ3?=
 =?utf-8?B?bTU1d09pT3AycFM4elQ2SzQ3RC9HblJTMzNhMk15RVhsTE1CNTBlQnYxQ2VX?=
 =?utf-8?B?b2w5OFBsV25uV2dZMkxpdWYwYmxYOHlubTdQZHJidDN6MTJzQ1dBNldqemFF?=
 =?utf-8?B?QUFLUC9mYkNSbWRaby9GK1NLNFQySkhMaHpaajVmRVQ2emVJN2dMeE9yMFNZ?=
 =?utf-8?B?empLTWszcGFOZGpxQVp1V2FpbGYzVkRRSGJKMG1sZHpoNmc2T0pYbXdmalYw?=
 =?utf-8?Q?pOz7APLoIqasOcD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f75dc0c-585f-4d5c-9b65-08df39955234
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 10:29:20.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duND8Vc6fMV3OJfJI83f0mN4lRy8ckGxJrNZqX9VSPbq6/q1xPa0kL0R+1E85Uv0xbBth60yN+1aeb5Au5tL88UabrbRG7d49PXYd7r5zcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11404
X-purgate-ID: tlsNG-d25034/1793701762-51D34A5B-EB359347/0/0
X-purgate-type: clean
X-purgate-size: 2488
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RUxGTk9URV9OQU1FKCkgdW5jb25kaXRpb25hbGx5IGNhc3RzIGl0cyBhcmd1bWVudCB0byAnY2hh
ciAqJywgYW5kDQpFTEZOT1RFX0RFU0MoKSBpcyBidWlsdCBvbiB0b3Agb2YgaXQuIHhlbl9idWls
ZF9pZF9jaGVjaygpIHBhc3NlcyBhDQonY29uc3QgRWxmX05vdGUgKicgdG8gYm90aCBvZiB0aGVt
LCBzbyB0aGUgY29uc3QgcXVhbGlmaWVyIGlzIGNhc3QgYXdheSwNCndoaWNoIGlzIGEgdmlvbGF0
aW9uIG9mIE1JU1JBIEMgUnVsZSAxMS44Lg0KDQpJbnRyb2R1Y2UgRUxGTk9URV9OQU1FX0NPTlNU
KCkgYW5kIEVMRk5PVEVfREVTQ19DT05TVCgpIGZvciByZWFkLW9ubHkNCmFjY2VzcyB0byB0aGUg
bm90ZSwgYW5kIHVzZSB0aGVtIGluIHhlbl9idWlsZF9pZF9jaGVjaygpLg0KDQpObyBmdW5jdGlv
bmFsIGNoYW5nZXMuDQoNClNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9f
cHJva29wY2h1azFAZXBhbS5jb20+DQotLS0NCiB4ZW4vY29tbW9uL3ZlcnNpb24uYyAgfCA0ICsr
LS0NCiB4ZW4vaW5jbHVkZS94ZW4vZWxmLmggfCA0ICsrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
dmVyc2lvbi5jIGIveGVuL2NvbW1vbi92ZXJzaW9uLmMNCmluZGV4IDgwZTdhOWI5ODEuLjU4N2Mw
N2FiNTIgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL3ZlcnNpb24uYw0KKysrIGIveGVuL2NvbW1v
bi92ZXJzaW9uLmMNCkBAIC0xMzMsMTMgKzEzMywxMyBAQCBpbnQgeGVuX2J1aWxkX2lkX2NoZWNr
KGNvbnN0IEVsZl9Ob3RlICpuLCB1bnNpZ25lZCBpbnQgbl9zeiwNCiAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KIA0KICAgICAvKiBTYW5pdHkgY2hlY2ssIG5hbWUgc2hvdWxkIGJlICJHTlUiIGZv
ciBsZC1nZW5lcmF0ZWQgYnVpbGQtaWQuICovDQotICAgIGlmICggc3RybmNtcChFTEZOT1RFX05B
TUUobiksICJHTlUiLCBuLT5uYW1lc3opICE9IDAgKQ0KKyAgICBpZiAoIHN0cm5jbXAoRUxGTk9U
RV9OQU1FX0NPTlNUKG4pLCAiR05VIiwgbi0+bmFtZXN6KSAhPSAwICkNCiAgICAgICAgIHJldHVy
biAtRU5PREFUQTsNCiANCiAgICAgaWYgKCBsZW4gKQ0KICAgICAgICAgKmxlbiA9IG4tPmRlc2Nz
ejsNCiAgICAgaWYgKCBwICkNCi0gICAgICAgICpwID0gRUxGTk9URV9ERVNDKG4pOw0KKyAgICAg
ICAgKnAgPSBFTEZOT1RFX0RFU0NfQ09OU1Qobik7DQogDQogICAgIHJldHVybiAwOw0KIH0NCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZWxmLmggYi94ZW4vaW5jbHVkZS94ZW4vZWxmLmgN
CmluZGV4IDQxOTliNGQ2ZTYuLjMzMzdiOGNhYmUgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94
ZW4vZWxmLmgNCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9lbGYuaA0KQEAgLTM0LDQgKzM0LDggQEAN
CiAjZGVmaW5lIEVMRk5PVEVfREVTQyhfbl8pIChFTEZOT1RFX05BTUUoX25fKSArIEVMRk5PVEVf
QUxJR04oKF9uXyktPm5hbWVzeikpDQogI2RlZmluZSBFTEZOT1RFX05FWFQoX25fKSAoKEVsZl9O
b3RlICopKEVMRk5PVEVfREVTQyhfbl8pICsgRUxGTk9URV9BTElHTigoX25fKS0+ZGVzY3N6KSkp
DQogDQorI2RlZmluZSBFTEZOT1RFX05BTUVfQ09OU1QoX25fKSAoKGNvbnN0IGNoYXIgKikoX25f
KSArIHNpemVvZigqKF9uXykpKQ0KKyNkZWZpbmUgRUxGTk9URV9ERVNDX0NPTlNUKF9uXykgXA0K
KyAgICAoRUxGTk9URV9OQU1FX0NPTlNUKF9uXykgKyBFTEZOT1RFX0FMSUdOKChfbl8pLT5uYW1l
c3opKQ0KKw0KICNlbmRpZiAvKiBfX1hFTl9FTEZfSF9fICovDQotLSANCjIuNDMuMA0K

