Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE924606A332
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=OAfwLCjG
Received: from list by lists.xenproject.org with outflank-mailman.1491740.1692479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7dU-0007nc-4W; Tue, 17 Nov 2026 01:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491740.1692479; Tue, 17 Nov 2026 01:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7dT-0007lx-MV; Tue, 17 Nov 2026 01:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1491740;
 Tue, 17 Nov 2026 01:05:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT7dS-0007U6-59
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 01:05:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT7dR-00Cf60-Hd
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:05:21 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba82e-8faa-0a2a0a5109dd-0a2a4501b3c8-26
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:05:21 +0100
Received: from [52.101.65.88]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba850-5984-0a2a45010019-34654158b17a-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:05:21 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB3PR0302MB9234.eurprd03.prod.outlook.com
 (2603:10a6:10:42b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:05:19 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:05:19 +0000
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
 b=ff/p6oVbDiBNrJWktYEuy4uAAk3a1dhkTKfQknCL7B0NDhT0Qp/no7T/U4BZDuMRppsqlBpOBZBxUdWVUJFEmdyb6mQUlgR/UedAhlqdBGXqjeeXFjvdgXxXMFum0fe6/+DBKlDFilMbAGE5clo4jEAC23GXqV5RMIcu5RI/j2avbpStoZsBwk/v5yeE+gZa9bGXLKdtoKbOKbvyNM5MC0jYskl0eB1bBfNoXif3Kq2ifGfKHs+cqzAiL36KCh+uNpc2FFPZ8GVqnahKPayaAfgHq2PlsFYybNf5cNu6fLtBOw117UV/SAboNLr9b+DeZQ4m07GpL8WXIU2HryfSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2qCsmWLws3+/FT1fr89G/lInSXL937GncbaC7ezx28=;
 b=iazWrrQrPlrTu8v38WRhB6BBTtDmNqbDmHw61f2PoqOC+SKYFUBnMFLVwWu+RLKLQNKHqOJS7UYzqNhC+8PDL6diyTIMcYCgwwxQC+fMstOB2R4IuoIJZSPUSd8u+zFYn/6eMQjBCq0qxpBLKxaKbR2a85skG9Iiw5Zh7zHSCoRiD/Lk+S4DLIrWBHW+ZW2He3rsEPC+dXoytqs5aA8HtNdJT6nB6tsxRZTPhNNHiotEfrJDumi0t/t656XcF5ZpzX412AWBHdkmod1AHdH2fkL9gDsnguE1Yn7zTmIlhMz4WUEO87kL5mFQG7YZGanrHJOVfQetR7tOknRX+ehgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2qCsmWLws3+/FT1fr89G/lInSXL937GncbaC7ezx28=;
 b=OAfwLCjGfjVdwWqxUGTlslavN43DZgptwfD6lZNTjQPiExWWp1khmlgtNe5n9rwAaAOJcQQF8WP1CEeCvnd4Hbp/iYNTil6HSMUkh8o6zI94i6n9PApuXQzE08doDwzszHpmFQImuBXEsI+xxZzUqj+2ImT/aEXDnt7kvBWmKTFlxsmMZymtTuBldtQOIGyOfpw4dxtYEjEEnGEIY4C1MWKSctVmMrYSmgRxiW4BSVQGWqNNpHf6sbtJBk4hRUHyqpwmIlwGWLL17B/iBEDyO2aSPwQ8dKzUaF9cMe8NSJSzmLpSo48mSHxEfkND0vQNU7HKSyXv7dCCRR8Km5z0wA==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v14 13/15] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host
 interface)
Thread-Topic: [PATCH v14 13/15] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Index: AQHddi+2IRga8NI210GrWZ9mwKoYRg==
Date: Tue, 17 Nov 2026 01:05:19 +0000
Message-ID:
 <b2c1e657b466a7c902e2fb46035c66a7c9eb456f.1794873792.git.mykola_kvach@epam.com>
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
x-ms-office365-filtering-correlation-id: 8152bcc0-1fa8-4de3-6448-08df4446d978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|56012099006|261021121427099003|11063799006|5023799004|261028144727099003|261021123027099003|261022105027099003|261102123227099003|261026140227099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 I9j0mG8RSeXgItL/2N5jzbZwBJxoJq2sWYPEylz7DF12IX19YN/U33C+vRF3mjCSuGQi06GkqYTETwyTbMQkIoX6FFFUW3l63phVPrn5aXh6v2PYELVeX2zqAT4PwNYG39d6U/OU/rQHAexywH1ZAKoZhIWB6AEVjue36qHWOmcaHhQ0sHwZhqDLAJR/xSZXdUbmjUpEbIvCJLDTdD29Aqecm3tIHB1N8dL1keFqm7JzBFaMLoo9/reW5S200nXbIXkcVUl4g5LbJEI8kp73ZDy3qZ/DpZWSv/SFOv2/mXkswyyDxjIaBOcIQWOusPDyOxSslhRZWnY0hsX4kGSxufmbYnQJCnSR5S6EvT0LDb96/xc8QHJBSy9Z2IazB98SYTURQuyiw0XEuDoDIQU1Q+rwFogbz63URecvJjBz9akWY/FS4fFWRKJo9mA6TelokmFwZhwejDcdCrW0IQNL9dCF0PNCvsZkmYpqXFJS5sX+GWYEDdavDgMxkkwDtXzCo2nhAhjGHghQsZWgnlPXbr0Eu+ymMySFlcSDY/vnWJb9HNQamisQ+CP+CDvOvmBoZqucr/yuA3fbIifrOs0tMS2wyK4KmYZ6pEXGH4pWAfwRnsPHUhcIk1wnT+LcUl8u8Jl3ytqEluL1yistkyLoITVtvE32Ggkd1mllcLOV5u39g6h8LIkt/EesV+PR1yiPwlaPpx8uZltFDE4LYDrrf9JH2ocrn73R33lRppu+Vnc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(261021121427099003)(11063799006)(5023799004)(261028144727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261026140227099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnZOQlE2S0tPR0J0ZWRZa3Zld25TYzFJWUNtWHgzeGFhY3pvOHc3aHZ1VFdS?=
 =?utf-8?B?RnBQSEV3c1lJbWZ6Zmp4MFdYYld3bnBvTHlqaG03c1JDd1pBbldJejVjamFr?=
 =?utf-8?B?TCtpSHlUd1ljUEF0L3d3djc0MCtRcHVtNjBua1RvZ25mT0d2QlhzYXVjZ1Fp?=
 =?utf-8?B?dzFpZ3pTTUFOcEpoU0VGZXZtZW9BUkV5c1pNd2ltK2M5UW9EbisvZ1RtTjJZ?=
 =?utf-8?B?aFNKc3hnUHRoOWcwUTVmSEdTbE5nRzZkWXFkUmJ6VERZRXVPRVkzS1plaEEw?=
 =?utf-8?B?aGFuV1NMR0V5bnZpZU1HSnFqMzNkTm1rcW5uVC9LOExGSHhqV0RUSGUzV0FR?=
 =?utf-8?B?Mjh6V1JFWmFZemV6ZStrM2RMbTlxaVFtU1dHaFRJYk9xMDEwVmxMcmlrTzk4?=
 =?utf-8?B?S20xT2RSSkppb2hJWDQ3elo4blkwT0krQVNhL003NEI3TGh6d3JCMjdyWmpx?=
 =?utf-8?B?eDIybHBoekhDRUU3L1FQUmRIUys5ZHNkRkMwUVJmZ0JjTUVvQ3I4WXpHQ3VR?=
 =?utf-8?B?YklLd2pzRkZLcSs2dyt1clQxZDk5ZlJTVDVYRW91R3I1VGUzcXVKcGs3Tk8y?=
 =?utf-8?B?Z2hHaTdVelo3V2xpckgxVi9Ec2pZYnlYanFkNG9TZ3pwNU5uM0FUaG11bUlL?=
 =?utf-8?B?MGxXK3J1SkM2OVhiNk1JQWJYSkczVTJKd2JkazZhQlpWNlF1MU40eXJEOHNt?=
 =?utf-8?B?UnZZNXYyRDNMZHo3UFQva1RqY2RabXBwN0c3ZWlRVTVQMUZ5V01mcDd0MWhz?=
 =?utf-8?B?YUdnSzh1eDhBYzEyWGYwQXRBamtBUE1rdE9jSk15UEk3YlNaODNYRGNZaG9I?=
 =?utf-8?B?T3k1UHZMYzhKN2k5QnZLcDY4dDRhVUZjMG1QQmRDeWVhT2xjSmdYK3lmRlFZ?=
 =?utf-8?B?VlZwQkJ2eUtZcnpBQzJmTm1nNzJ4RFlNaTd3VHZwTnA3V2dVZ0ltZEEydWZm?=
 =?utf-8?B?UXdaa0pMRytuSzNVaWo5R1dzTDNqdzNYTnRQTWU1cFhVMFN6cG8vaVYveGNI?=
 =?utf-8?B?blUwdU1aQmF5Q2xhM0RIVzNDR0plZStJa0k4VFI5ejUzSEhTZkNrK1dsa0Jv?=
 =?utf-8?B?T3JiNjZPNDd6SytYU0JiTjVxU21HazFocFZEQUV0bVAyc0FqNVJxc0tWb0NG?=
 =?utf-8?B?L2thWTdaT2diVGpSeWhOKzE2VEpVQ1NsNHBPdTUvbVJNajZJbTg5ZG5vKzlB?=
 =?utf-8?B?R0tMMkFjaG5WUUtkYlAza0lZNmpWQjdhVjF2UkJVM1pxMW5kQWZpM0hydDNk?=
 =?utf-8?B?Z1hxZldqYWJ3VEhPblduUmlrMHlDU25reVlIbXI4OHNWZU1sQlBkSkdJaklz?=
 =?utf-8?B?OG5YMklNSWN0UWdWbVZURjkrVGlOclJ6RXp4eUdVVUtTaSs3NGkzVWNmd1dE?=
 =?utf-8?B?YmkxdFVhNUZheUVoU1Ziakw3OTNYamtnb3RvanpjVXhBV1J4TVVTcC9ZVmhs?=
 =?utf-8?B?N3BML2xMSzVWZElZcDJIM29uekdaVjNQQUlTdFc1bW96eHE5b1Y3c3ZCT0Nq?=
 =?utf-8?B?N1FXUlJMOXRlUEhEM01EWEFPU3ZZMG1laHY1b1d1aUU5Q2RKc0pUanVlZjI3?=
 =?utf-8?B?RU85SWVJUmtXUllVeE1tSTlQVjZMRVhMNUFtSGV2bVdtYWRQOWtMcjBiQTMv?=
 =?utf-8?B?MG5tVEFhcnc5cWV2cHdWci9pQUNTWGZvL3FyOElMbFZzOUtOVVIxL3d1SjVu?=
 =?utf-8?B?K1ZLRWU3TUxtdGx6YkdjYjJzTytUSzU5dE15RDBNbVR0cVE2bStXSHdGTldY?=
 =?utf-8?B?SGg3cFBxZ001NWUzcGw3bzVUcjVTRnppZlZ4WnRWYlY3MHhPYVlmNm02RjNy?=
 =?utf-8?B?cDB0RHkzYVliY0VqTW4vNG5iKytPVXRwT1o4TXNFRDF5aURGOVJPcXBwMFpr?=
 =?utf-8?B?bHA5OHVabUZ3enBSdEpSLzFjSWd3aE5CK25CLzE0dFNvZDEra2tENVJ5RG9Z?=
 =?utf-8?B?R2xEZ2YyaXVvRjYvWm9BNTRKT0Vaa0xNNnJOL1JOSEEzQktyOHI4QVZiT1pQ?=
 =?utf-8?B?aUNnbG1mODZ1ZFJuSTNxMWhkdzZIUGNBZGJvZGtQd21ndEhtdkM0cnI1NHFu?=
 =?utf-8?B?d3VzSHdpdzZERTBVeGo1cWRiM1BPRko0SlZvSGc4emJkNm8vNzNUMHJQaWlv?=
 =?utf-8?B?UWxuMjc2TGdaOGEvSGF1aEdTaVFhZ2ltNk1SSkl4Wm82T0lCYzlGTDhPYXF2?=
 =?utf-8?B?YUNBR0h3NW9NNG01WUNHR3BvUk1uRW9yclB0NTJRQlVZTEQ1bHc2MlZjRFhE?=
 =?utf-8?B?QXhqS2w1aFlLaWJ2TGtsajdpdVcwTHRFbmR5R1lQREhkbGNRMkkyNjNTUWZD?=
 =?utf-8?Q?dNPPyiSjWIqIHCQU+u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8152bcc0-1fa8-4de3-6448-08df4446d978
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:05:19.6392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7swNnitDc+u5ZdlG1fCTCmoJ+6X7mM62dChKe9Q+qAjijr+x26KsfHBhNEueufVLsjJlsN+ZvmN4PjscpAvrOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9234
X-purgate-ID: tlsNG-d62444/1794877521-BE27A757-D075374D/0/0
X-purgate-type: clean
X-purgate-size: 5806
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogTWlyZWxhIFNpbW9ub3ZpYyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPg0KDQpJ
bnZva2UgUFNDSSBTWVNURU1fU1VTUEVORCB0byBmaW5hbGl6ZSBYZW4ncyBzdXNwZW5kIHNlcXVl
bmNlIG9uIEFSTTY0DQpwbGF0Zm9ybXMuIFBhc3MgdGhlIFhlbiByZXN1bWUgZW50cnkgcG9pbnQg
KGh5cF9yZXN1bWUpIHRvIEVMMyB0b2dldGhlcg0Kd2l0aCBhIHplcm8gY29udGV4dCBJRCwgbWF0
Y2hpbmcgTGludXguDQoNClRoaXMgcGF0Y2ggd2lyZXMgdXAgb25seSB0aGUgaG9zdC1zaWRlIFBT
Q0kgU1lTVEVNX1NVU1BFTkQgaW52b2NhdGlvbi4NClRoZSByZXN1bWUgdHJhbXBvbGluZSBhbmQg
Y29udGV4dCByZXN0b3JlIGFyZSBwcm92aWRlZCBieSBlYXJsaWVyIHBhdGNoZXMNCmluIHRoZSBz
ZXJpZXMuDQoNCk9ubHkgZW5hYmxlIHRoaXMgcGF0aCB3aGVuIENPTkZJR19TWVNURU1fU1VTUEVO
RCBpcyBzZXQgYW5kIFBTQ0kNCmFkdmVydGlzZXMgU1lTVEVNX1NVU1BFTkQgdmlhIFBTQ0lfRkVB
VFVSRVMuDQoNClNpZ25lZC1vZmYtYnk6IE1pcmVsYSBTaW1vbm92aWMgPG1pcmVsYS5zaW1vbm92
aWNAYWdnaW9zLmNvbT4NClNpZ25lZC1vZmYtYnk6IFNhZWVkIE5vd3NoYWRpIDxzYWVlZC5ub3dz
aGFkaUB4aWxpbnguY29tPg0KU2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9w
b3R1cmFpQGVwYW0uY29tPg0KU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3Zh
Y2hAZXBhbS5jb20+DQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNA
YXJtLmNvbT4NCi0tLQ0KQ2hhbmdlcyBpbiB2MTM6DQotIFVzZSB0aGUgcmVzdWx0IHJldHVybmVk
IGJ5IGFybV9zbWNjY19zbWMoKSBhbmQgZHJvcCB0aGUgcmVzdWx0IHBvaW50ZXIuDQoNCkNoYW5n
ZXMgaW4gdjk6DQotIGNhY2hlIFNZU1RFTV9TVVNQRU5EIHN1cHBvcnQgdXNpbmcgUFNDSV9GRUFU
VVJFUyBhbmQgZ2F0ZSB0aGUgaG9zdCBjYWxsDQogIG9uIHRoZSBjYWNoZWQgY2FwYWJpbGl0eQ0K
LSBrZWVwIHRoZSBjYWNoZWQgU1lTVEVNX1NVU1BFTkQgY2FwYWJpbGl0eSByZWFkLW9ubHkgYWZ0
ZXIgaW5pdA0KLSBsb2cgd2hldGhlciBmaXJtd2FyZSByZXBvcnRzIFNZU1RFTV9TVVNQRU5EIHN1
cHBvcnQNCi0gcGFzcyBhbiBleHBsaWNpdCB6ZXJvIGNvbnRleHQgSUQgaW4gdGhlIFNZU1RFTV9T
VVNQRU5EIGNhbGwNCi0gZHJvcCB0aGUgc3RhbGUgbm90ZSBjbGFpbWluZyBoeXBfcmVzdW1lIGlz
IHN0aWxsIGEgc3R1Yg0KLS0tDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BzY2kuaCB8ICAx
ICsNCiB4ZW4vYXJjaC9hcm0vcHNjaS5jICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wc2Np
LmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcHNjaS5oDQppbmRleCA0OGE5M2U2Yjc5Li5i
YjNjNzM0OTZlIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BzY2kuaA0K
KysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BzY2kuaA0KQEAgLTIzLDYgKzIzLDcgQEAg
aW50IGNhbGxfcHNjaV9jcHVfb24oaW50IGNwdSk7DQogdm9pZCBjYWxsX3BzY2lfY3B1X29mZih2
b2lkKTsNCiB2b2lkIGNhbGxfcHNjaV9zeXN0ZW1fb2ZmKHZvaWQpOw0KIHZvaWQgY2FsbF9wc2Np
X3N5c3RlbV9yZXNldCh2b2lkKTsNCitpbnQgY2FsbF9wc2NpX3N5c3RlbV9zdXNwZW5kKHZvaWQp
Ow0KIA0KIC8qIFJhbmdlIG9mIGFsbG9jYXRlZCBQU0NJIGZ1bmN0aW9uIG51bWJlcnMgKi8NCiAj
ZGVmaW5lCVBTQ0lfRk5VTV9NSU5fVkFMVUUgICAgICAgICAgICAgICAgIF9BQygwLFUpDQpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BzY2kuYyBiL3hlbi9hcmNoL2FybS9wc2NpLmMNCmluZGV4
IDc5OTQ3YjEyNGIuLjI5NGU1M2EyOWYgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vcHNjaS5j
DQorKysgYi94ZW4vYXJjaC9hcm0vcHNjaS5jDQpAQCAtMTcsMjMgKzE3LDI3IEBADQogI2luY2x1
ZGUgPGFzbS9jcHVmZWF0dXJlLmg+DQogI2luY2x1ZGUgPGFzbS9wc2NpLmg+DQogI2luY2x1ZGUg
PGFzbS9hY3BpLmg+DQorI2luY2x1ZGUgPGFzbS9zdXNwZW5kLmg+DQogDQogLyoNCiAgKiBXaGls
ZSBhIDY0LWJpdCBPUyBjYW4gbWFrZSBjYWxscyB3aXRoIFNNQzMyIGNhbGxpbmcgY29udmVudGlv
bnMsIGZvcg0KICAqIHNvbWUgY2FsbHMgaXQgaXMgbmVjZXNzYXJ5IHRvIHVzZSBTTUM2NCB0byBw
YXNzIG9yIHJldHVybiA2NC1iaXQgdmFsdWVzLg0KLSAqIEZvciBzdWNoIGNhbGxzIFBTQ0lfMF8y
X0ZOX05BVElWRSh4KSB3aWxsIGNob29zZSB0aGUgYXBwcm9wcmlhdGUNCisgKiBGb3Igc3VjaCBj
YWxscyBQU0NJXypfRk5fTkFUSVZFKHgpIHdpbGwgY2hvb3NlIHRoZSBhcHByb3ByaWF0ZQ0KICAq
IChuYXRpdmUtd2lkdGgpIGZ1bmN0aW9uIElELg0KICAqLw0KICNpZmRlZiBDT05GSUdfQVJNXzY0
DQogI2RlZmluZSBQU0NJXzBfMl9GTl9OQVRJVkUobmFtZSkgICAgUFNDSV8wXzJfRk42NF8jI25h
bWUNCisjZGVmaW5lIFBTQ0lfMV8wX0ZOX05BVElWRShuYW1lKSAgICBQU0NJXzFfMF9GTjY0XyMj
bmFtZQ0KICNlbHNlDQogI2RlZmluZSBQU0NJXzBfMl9GTl9OQVRJVkUobmFtZSkgICAgUFNDSV8w
XzJfRk4zMl8jI25hbWUNCisjZGVmaW5lIFBTQ0lfMV8wX0ZOX05BVElWRShuYW1lKSAgICBQU0NJ
XzFfMF9GTjMyXyMjbmFtZQ0KICNlbmRpZg0KIA0KIHVpbnQzMl90IHBzY2lfdmVyOw0KIHVpbnQz
Ml90IHNtY2NjX3ZlcjsNCiANCiBzdGF0aWMgdWludDMyX3QgcHNjaV9jcHVfb25fbnI7DQorc3Rh
dGljIGJvb2wgX19yb19hZnRlcl9pbml0IGhhc19wc2NpX3N5c3RlbV9zdXNwZW5kOw0KIA0KICNk
ZWZpbmUgUFNDSV9SRVQocmVzKSAgICgoaW50MzJfdCkocmVzKS5hMCkNCiANCkBAIC02MCw2ICs2
NCwyNiBAQCB2b2lkIGNhbGxfcHNjaV9jcHVfb2ZmKHZvaWQpDQogICAgIH0NCiB9DQogDQoraW50
IGNhbGxfcHNjaV9zeXN0ZW1fc3VzcGVuZCh2b2lkKQ0KK3sNCisjaWZkZWYgQ09ORklHX1NZU1RF
TV9TVVNQRU5EDQorICAgIHN0cnVjdCBhcm1fc21jY2NfcmVzIHJlczsNCisNCisgICAgaWYgKCAh
aGFzX3BzY2lfc3lzdGVtX3N1c3BlbmQgKQ0KKyAgICAgICAgcmV0dXJuIFBTQ0lfTk9UX1NVUFBP
UlRFRDsNCisNCisgICAgLyogQ29udGV4dCBJRCBpcyB1bnVzZWQgZm9yIHRoZSBYZW4gcmVzdW1l
IHBhdGguICovDQorICAgIHJlcyA9IGFybV9zbWNjY19zbWMoUFNDSV8xXzBfRk5fTkFUSVZFKFNZ
U1RFTV9TVVNQRU5EKSwNCisgICAgICAgICAgICAgICAgICAgICAgICBfX3BhKGh5cF9yZXN1bWUp
LCAwKTsNCisNCisgICAgcmV0dXJuIFBTQ0lfUkVUKHJlcyk7DQorI2Vsc2UNCisgICAgZHByaW50
ayhYRU5MT0dfV0FSTklORywNCisgICAgICAgICAgICAiU1lTVEVNX1NVU1BFTkQgbm90IHN1cHBv
cnRlZCAoQ09ORklHX1NZU1RFTV9TVVNQRU5EIGRpc2FibGVkKVxuIik7DQorICAgIHJldHVybiBQ
U0NJX05PVF9TVVBQT1JURUQ7DQorI2VuZGlmDQorfQ0KKw0KIHZvaWQgY2FsbF9wc2NpX3N5c3Rl
bV9vZmYodm9pZCkNCiB7DQogICAgIGlmICggcHNjaV92ZXIgPiBQU0NJX1ZFUlNJT04oMCwgMSkg
KQ0KQEAgLTIyMyw5ICsyNDcsMTUgQEAgaW50IF9faW5pdCBwc2NpX2luaXQodm9pZCkNCiANCiAg
ICAgcHNjaV9pbml0X3NtY2NjKCk7DQogDQorICAgIGhhc19wc2NpX3N5c3RlbV9zdXNwZW5kID0N
CisgICAgICAgIHBzY2lfZmVhdHVyZXMoUFNDSV8xXzBfRk5fTkFUSVZFKFNZU1RFTV9TVVNQRU5E
KSkgPT0gMDsNCisNCiAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJVc2luZyBQU0NJIHYldS4ldVxu
IiwNCiAgICAgICAgICAgIFBTQ0lfVkVSU0lPTl9NQUpPUihwc2NpX3ZlciksIFBTQ0lfVkVSU0lP
Tl9NSU5PUihwc2NpX3ZlcikpOw0KIA0KKyAgICBwcmludGsoWEVOTE9HX0RFQlVHICJQU0NJIFNZ
U1RFTV9TVVNQRU5EIGlzICVzc3VwcG9ydGVkIGJ5IGZpcm13YXJlXG4iLA0KKyAgICAgICAgICAg
aGFzX3BzY2lfc3lzdGVtX3N1c3BlbmQgPyAiIiA6ICJub3QgIik7DQorDQogICAgIHJldHVybiAw
Ow0KIH0NCiANCi0tIA0KMi41My4wDQo=

