Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF9606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=lIrauv8z
Received: from list by lists.xenproject.org with outflank-mailman.1461214.1672184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJo4-0001VT-AM; Mon, 26 Oct 2026 12:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461214.1672184; Mon, 26 Oct 2026 12:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJo4-0001VM-7j; Mon, 26 Oct 2026 12:28:04 +0000
Received: by outflank-mailman (input) for mailman id 1461214;
 Mon, 26 Oct 2026 12:28:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xLJo2-0001TM-He
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJo1-000Htn-UJ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:28:01 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6adf4735-2eae-0a2a0a5409dd-0a2a450bcd94-18
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:01 +0100
Received: from [40.107.162.83]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6adf4751-b7e8-0a2a450b0019-286ba2532f5d-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:01 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB9PR03MB7793.eurprd03.prod.outlook.com (2603:10a6:10:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:27:59 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0546.019; Mon, 26 Oct 2026
 12:27:59 +0000
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
 b=sxzBcfHuQy2OqW7l2P/Ip8MHjBZn8LU77da7ILNJGg3u4VNFrgmX5yV+0adq5jlPrT1nca3vbzEUQ16r0d5+t4Q16IQRlHRFfH96ix6++Th2+cmdrmLGyCzVIck9B+ncZw1a+lUefsa5fUQejrgq26X3H2BSStvSnwLhvkjnXNMxGvt6JWPCjNmvKCe9Jd853uYiowb4R6M18J4ImmKBWgNLwYCz7uquipl3odUwzpZLOQYXIt7y8Q/n5ix5bHhU90awiiyJrnFC1U9SitYlH9FauJr9KLsIGAHEnfFgGakBpedDke8FX8EbWRW4fNoJOa1tYATP/lKPzLjg1Arxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahk2kZMQlYAsjLgIv69OmotXK+AZTCfAtfzin+W5rgU=;
 b=yuiwV+jiRLB+8Y+mJxpVGRpUvqA9s6+XEqJ1VXMEL8dXWhaslpOylHGSi5HJwTfI6Exi0Yu9mGpeXSEgubXxwHPVog7TM+o+p0oeBmUESh7nwZ3wNrAmMmTi7CS0dNIhoeTMLesYXmRriZoyqN0whNY3kuLXJ9+xG7PZ3kqgmid5Ls04NvSiCycQGPxJCdLCRAvR25h7GSD6sxx/b2zQXfFcT3hJ+PLhfZFW+7bstmvLjm1FN9c5dGCZQVOoc3SgMaLg8DNB0UvYZwtOe22Br1l9XNm0Dc2ovdje/Fn6lctexf9Crrnbfhw3ry5zDMTNsfYQsfuBlCHyttJZ081UAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ahk2kZMQlYAsjLgIv69OmotXK+AZTCfAtfzin+W5rgU=;
 b=lIrauv8zVgF7cv2IwSgBPL54o9aedZTMx6421+Ia3NXr1Tzu8Na4gD/F1RMUeoDBlqtT1xuw0rl2XOxTtH4woT64/sNO+uBaQcJXB/t05OUZIpi/YVnjjoXCoR6Ae9GhIWy3iv9I0bQpGgs5+NUOBJRQz4BPW3VaqmIgg+MkKyPVcisq+SwgSLFdYtVWAQBa8LbMc6JnTQKfc7sa3Lb4NCbYcEsl4GzVjF6D4D31YoYr21twzX8cPRavDvURcauWXiheWwNWdZ4Eu8YfRN3M5o+7J5xEmSJ6CU2IvKkzSFVW4XhH6i8lApBA63Z4ZUpSNxuG+VQTPmJjsMTrDyXNqg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
Thread-Topic: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
Thread-Index: AQHdZUVvbuj2+I/wmEeMfHolzOWTxg==
Date: Mon, 26 Oct 2026 12:27:59 +0000
Message-ID: <cover.1793012250.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB9PR03MB7793:EE_
x-ms-office365-filtering-correlation-id: 328c8121-a95b-421d-2fff-08df335c926c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|18002099003|56012099006|11063799006|261021121427099003|10067099003|261009223027099003|261021123027099003|38070700021|260925022911599003|260925021911599003|260925021311599003;
x-microsoft-antispam-message-info:
 J/V9seyFNlXf0AtYa2ZzT/HKH7ogo0LpjEvmEykc+zzbOe3HnB9WmMlCUrnjuARmPMubUz6n9+nFA7lOrLE5YE4f7Pccwm4J1zDQU3UOFfj2y6KICXmpmaiwPmSrITpMIwM8veQcgrxN8EdGJYRs3BIVc0uBjF839EC0cH6bC9tlIvrejunNBQKmee3ddMQ2rvzR3fxaYZy6eIrtJIPPjUahWwpPIOHdnkEln6wSvWkoH1qgo6VKqlpZegVT+up4vvZ7+zJ/k1fjOHMe1LmFedv3rOhWfs6VObwuAqvd7l1O8ndLaYr2xyCIacxohn5iD2YPJlPYcU2yNlRS1F2a5skFtf3vZu/24VrK3IPpXS7r4fodK5xB1D4C91zy9hUIHb/uvm5ULD4OQ+A1jdBfqlAK0o/S6d1awucaO75/OePCsqK9V1aBYO8Q7pUbVX+dV4wb1OHaZgQHyLLSpJtIsIo6QR5RdiIpGfESygo3VRsOkxIeusNVgdZU56BQh94Jpcw/8j8CdcQMkaISmwXxIdpgLoIS4fsD8kFUmVsfJjPWK16S825BRaze3+0Svps+MEvweA0G+9tMqAjpvDlJEoFC8ziqQzSHSPoYDxUZufrsV3tlkWX9OmiCAqAcG/WBSsucH42NDVDks1e6z0EVlT68oMoGHNvxZCWbQ2QNcdk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEJ0MStIK2FVTEthYVF2d2tPVFVtbm5tUHVCQUM5SVVoNHN2OGEyZ0JlSDln?=
 =?utf-8?B?eHVudmYrWEU1eUwwcXN5TSsxK0ZGSjJPTmdGU09HWEpXY29JdW1PUmZHWm9s?=
 =?utf-8?B?c3d3QWVFdTZscmNtOS9teXVUYzcxYnArVUdabkNnWTFlN1NWMEsvM1llRERk?=
 =?utf-8?B?eDkzeGNyd1I4c1VzaGlmM1BvSjJMczI2bFZ0RW5wakhxdkFRU0JOQ2Rxd2R3?=
 =?utf-8?B?dlRLUUxESitUcDkrMFB3cnNQb0E5d3BoTStKemplcWdVdlg3SWNDUloxelVS?=
 =?utf-8?B?SlczSXgrNW1WV3FLaFcxbTllVUVWb1RKM1J4YmR4UWhiTjduelRmWkFXQWQz?=
 =?utf-8?B?OStqOFFJMWg0K0FXZ1ZMUFZrYkxwcTFaRHZYdW8zUjhNZndSdkg5dTNYbWhw?=
 =?utf-8?B?b2JtWnJ5UU00djhWeStRVDRmWGdwc3lnNzJFUHpnRG1QbDl1alh1Njczckw4?=
 =?utf-8?B?Q0wwd0dKb2ZDY0JhNlI0MDlyMDhvbmV3VDdmYWdiZWczTjBPMXhwSFhKWFQv?=
 =?utf-8?B?US96WUY5V1QzWTQvY1NXeUh3R25vVEpzNWZzdkEyVzZsTFg3UEhBTUdBWFlJ?=
 =?utf-8?B?czd1S0JFQU9lZHpjRVVEalV3MC9jVXEwS2hLckU2NWFIM0NPUzFJNENlSFJ1?=
 =?utf-8?B?RHdEYWF4ejlPanc0TTdiQUFWcmtDNGhnV2J4NWZnU2dPTStwNXRFK1kvSU5M?=
 =?utf-8?B?TktIYmUraVBXZ3NoQkdpWHBJb0E1SXhkcHMwVGRJNzFENlNkTVI1TlFWeUJm?=
 =?utf-8?B?dkxqdG9Idm85RUpyTzdXZ2hrYU9RTXp3KzVsbGNtakhrUFdvTWhtWHJnM0ZG?=
 =?utf-8?B?RkVhblN2eFZxOG0zTWlJcjBoSmZFcWErSW1oS0FlMU5XUVRxcXVNbllIWGFs?=
 =?utf-8?B?M3U0ZENEYjF2WWZIaHVUb1ZGTE50bStnVURmK28xQy8vSXZTUU5GenAwWnBF?=
 =?utf-8?B?Q0xMVzRFL3FwQnZzWmFzWVZvRTZiQm03a0xrWFdHelVwa0JYR1FhT3ltQWhQ?=
 =?utf-8?B?blVlUGd0QXRMaHV0QW5ERVhQZXUzYkd6Zkphd3lHREJZeXFnbVJRd29KRS9u?=
 =?utf-8?B?V0h2Q0RmVkF1MFNaUFJ4Rnc5OGF0TUJKSEFQUFZCMFd0WWR0UEJUM0taaE52?=
 =?utf-8?B?K2hxeDBtby9ZS0ZITVRTZ1RYSDdQbmtJNTY4QXVEWUk1RWMvbmtTdWZ0VS9p?=
 =?utf-8?B?eUJWVkd1alVGekx2RGc0SG1nSC9tUENzWjIrWFJiZkxmZ1B5T04wZmZIUWNm?=
 =?utf-8?B?UTR3MENjckJzd2tLL1JDQWJSdDZjcjgxSjJ4Q1JEanMzdUZGV2xTaXZmN0J4?=
 =?utf-8?B?MFQxVS9IZ0RvZXZjTWF1K01CQ3k4TXpMbC9venk3eVZ5WmFuRm5HcFVOZHRh?=
 =?utf-8?B?NDVXSzRRK2NmVXdTaUxVdzQ4UDNwQUJUWWRxZTFFVXh0UVlxMExVTlF2amp5?=
 =?utf-8?B?Q2ptNHo1dEdQU0NFRnB5VDhGUGlmRlp2L3E3Q09LY1ZOaTlORG5odjkxdUdi?=
 =?utf-8?B?N0tVMUJsc0Y4dGRRN3dXUXNjY01LeVRmQm4rMnFWemdJSkZKMmxYaWY0UEds?=
 =?utf-8?B?UWtLVTRVYVJZMXRmaDNyRG5MVXF0MncrdStzZkR4dk9oYkZ3a1J0dXRiTnhX?=
 =?utf-8?B?aVNDQk9MYkt3cnVQdCtkSFg0QjJpTDM0aTdmT2t5MGFHT1EwYlB3Umh6cWo3?=
 =?utf-8?B?NEVZN2Qxbm5xOUMwOXNpRlVoRXZIQUMzRzJDQTJ4NEdrQU9Vd2IxQ0RsUzNl?=
 =?utf-8?B?Q2pSQXhKODJIZmVCRUVqcS9UUkV4cjRtbjlhZUNDOFhFa0ZvbW1UaE4zdFNy?=
 =?utf-8?B?b0h0MjEzMVBYWnBvcnI2aHMrMDNtRFRqRkUzOUlITlUvbzFraG9CZEh1OHpp?=
 =?utf-8?B?dnNNcC9jNWdlNGw1aWE0RzMzbUhNWmtQb05UVm5jU010cE85bjRJKzl0SkRT?=
 =?utf-8?B?NmtaMzRTUVl2NVNqMXMrM0dlclBCTWlLR0Z5UFROWERxVllsYVpWNnRaRFkz?=
 =?utf-8?B?bTdJZDJ0bkV3cXVtRVkxemhFMVlSamtPNUFKaS9NYllFcFlRK1Iza21qUmZq?=
 =?utf-8?B?RjU1UHJLUUo3cGRsWXBXbWdqRmxoZ2N1ZEZLT0dPSEtmbkJxUXAwSWVlcTNP?=
 =?utf-8?B?QWNxbXNBempBMFNSalR1MExML2UxZ1BsUDdQWXFlemVEMG42WUNINEEyakZO?=
 =?utf-8?B?UHkweHdJT1dxWTdlTjdHYU5WaFBmRjdxVk9vK1ZMV0EvbXBMYWE5RGN0OGdy?=
 =?utf-8?B?dW5ybFkrRzllbnhZVXJIRmlXVFlMQWxNMHpMRlVsNkh2ZFEvandTOWZoMHdR?=
 =?utf-8?B?QXEzOTJEV2hNaHJxMis3clhpeGRjUnBIS0dOU3BhL3F0cWQ5WTMyMGViOEVx?=
 =?utf-8?Q?0ikRFSXsyfEpoI+M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328c8121-a95b-421d-2fff-08df335c926c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 12:27:59.6329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7jiRrPAOdXMBZy4N0bXJrj4wYSAM2mvEroAsKyer9mp9sGCNayvjNyGi+S2u6VnyuLjVul3Njb16Kv5v6Sxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7793
X-purgate-ID: tlsNG-42698a/1793017681-1B6D29EA-3B404F3E/0/0
X-purgate-type: clean
X-purgate-size: 2090
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBpcyBwcmVwYXJhdG9yeSB3b3JrIHRvIG1ha2UgdlBDSSBNU0ktWCBmdW5jdGlvbmFsIG9u
IEFybS4gU3BsaXQgdGhlDQp2UENJIE1TSS1YIGNvZGUgc28gdGhhdCBpbnRlcmNlcHRpbmcgdGhl
IE1TSS1YIHRhYmxlIGFuZCBQQkEgc3RheXMgeDg2DQpvbmx5LCB3aGlsZSB0aGUgTVNJLVggY2Fw
YWJpbGl0eSBoYW5kbGluZyBiZWNvbWVzIGNvbW1vbi4gTm8gZnVuY3Rpb25hbA0KY2hhbmdlIGlu
dGVuZGVkLg0KDQpUaGlzIGlzIGEgY29udGludWF0aW9uIG9mIHdvcmsgZG9uZSBieSBSYWh1bCBm
cm9tIEZlYnJ1YXJ5IDIwMjJbMV0uDQoNClRoZSBhcHByb2FjaCBpcyBpbnZlcnRlZCwgaW5zdGVh
ZCBvZiBtb3Zpbmcgb3V0IHRoZSB4ODYgcGFydHMsIG1vdmUgb3V0DQp0aGUgY29tbW9uIG9uZXMg
dGhhdCB3aWxsIGJlIG5lZWRlZCBvbiBBcm0uIFN1YnNlcXVlbnQgYXJtIHBhdGNoZXMgZm9yDQpy
ZWZlcmVuY2UgY2FuIGJlIGZvdW5kIGhlcmVbMl0uDQoNClsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy94ZW4tZGV2ZWwvY292ZXIuMTY0NDkzNzQwNS5naXQucmFodWwuc2luZ2hAYXJtLmNvbS9U
LyN0DQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZXdkay94ZW4vdHJlZS9wY2llLXBhc3N0aHJv
dWdoLWFybS12cGNpLXYyNg0KDQpSYWh1bCBTaW5naCAoMSk6DQogIHZwY2kvbXNpeDogbW92ZSBo
ZWxwZXJzIHRvIGNvbW1vbg0KDQpTdGV3YXJ0IEhpbGRlYnJhbmQgKDIpOg0KICB2cGNpL21zaXg6
IG1vdmUgbXNpeCByZWdpb24gcmVtb3ZhbCB0byBtc2l4LmMNCiAgdnBjaS9tc2l4OiBtb3ZlIGNv
bW1vbiBtc2l4IGNvZGUgdG8gY29tbW9uIGZpbGUNCg0KIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9tc2kuaCAgICAgIHwgIDIxIC0tLQ0KIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAgICAgICAg
ICAgIHwgICAyICstDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmggfCAgIDIg
Ky0NCiB4ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlICAgICAgICAgICB8ICAgNiArLQ0KIHhlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMgICAgICAgICAgIHwgIDMwICstLS0tDQogeGVuL2RyaXZlcnMv
dnBjaS9tc2kuYyAgICAgICAgICAgICAgfCAgIDMgKy0NCiB4ZW4vZHJpdmVycy92cGNpL21zaXgu
YyAgICAgICAgICAgICB8IDE5NyArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiB4ZW4vZHJp
dmVycy92cGNpL21zaXhfY29tbW9uLmMgICAgICB8IDIwMiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQogeGVuL2RyaXZlcnMvdnBjaS9wcml2YXRlLmggICAgICAgICAgfCAgIDIgKw0KIHhl
bi9pbmNsdWRlL3hlbi9tc2kuaCAgICAgICAgICAgICAgIHwgIDIxICsrKw0KIHhlbi9pbmNsdWRl
L3hlbi92cGNpLmggICAgICAgICAgICAgIHwgICA1ICsNCiAxMSBmaWxlcyBjaGFuZ2VkLCAyODIg
aW5zZXJ0aW9ucygrKSwgMjA5IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
ZHJpdmVycy92cGNpL21zaXhfY29tbW9uLmMNCg0KLS0gDQoyLjU1LjANCg==

