Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D29606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=j0AG1Bms
Received: from list by lists.xenproject.org with outflank-mailman.1504838.1699919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOZ-0005CE-Uw; Fri, 27 Nov 2026 11:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504838.1699919; Fri, 27 Nov 2026 11:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOZ-0005Bw-QS; Fri, 27 Nov 2026 11:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1504838;
 Fri, 27 Nov 2026 11:45:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xWuOY-00059j-BQ
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:45:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWuOX-002O2i-Na
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:45:37 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d5e-e002-0a2a0a5209dd-0a2a450cd832-8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:37 +0100
Received: from [52.101.69.98]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d61-f479-0a2a450c0019-34654562461f-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:37 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB4PR03MB9457.eurprd03.prod.outlook.com (2603:10a6:10:3fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:45:31 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:45:31 +0000
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
 b=jLLH2wXvlo4U0mcYbO52NczQ1uw8FDWSvHV+VHGwkyHH8i7uvzCrLdR+T6UK5oMD5E6U2pbDpeYI31D8rEvsT0gznk4o+Ed7VQiQl2MgfCQ8RPStI6cxenNlzNblnZtfvMIfDZoReRYUfMZBIm+Qsz6/fZldfDc8Q7foV4vnbDHyWkUSnKM0NCu8qyKCkfo0JHwGb4rY2w3TLA5mpRZ3SE22Rm6C1S78s+If5ZFSFSu+Zy0MhvM1rhFYvcirttP17CJnvi8HkHJgclPbG3HK/+0pw+wHS1/xmg2S0jBow5WMv2u+NGD0fkueWi1kJtlC7xpVsgVkM8Uf210juSV8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PI5VLwdsqJNiyVET/pEp9PGkJ91Cibl/oEcMT1MxPA=;
 b=D0vXNUd2xENpUZUozRGkTF3Im7Jry+K6fYeEUNjt1AYG/SE7GQL/75nfNkahalmk9GypnFUfKaw1o0T1jEkfasGw5HtHTlOJxJRmobc3/eBTBk5/K0ceps1vAdxGTghTxe8CjrMCeB4iSkWsae0A1XXREig6LOJjUNei0grNyTFBAIpdqDsBPntwJeXKVtvHLB0B+zOjpC4Ep61W/UPeUPiFo4pqxn9oW4fTpG94+D+IAnMR3jcQqVtqae4M27pBfKje72slwP0itgeY2k0sC2d81n4bvgm78hmFMsB9oiEHA2KoEMt48nSW30JlYMuMMd4vsvqKxf1i8FgMlz3OKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PI5VLwdsqJNiyVET/pEp9PGkJ91Cibl/oEcMT1MxPA=;
 b=j0AG1BmsMM/Zd4s+BzQzvsp0pdnZT9rrOoL3Vh3CzE6Gy8JCxIOyESqjbFJytZp0ifhgrkE5H3ZuPfCbQMaMiGYdd7KtLvjcg/F0t6JO0DP+H1ErVDlyw+e2hU60NTRznNj53fitF0CUGJOfrqagZ8GnNyh6g/L/aEECR1PvsyE30sdZBpueiX5DI+uHLHEAsOyBoahmVvo5m5fQNfUTv9F9YAnyhHKmGPqAiFIEMD1s0USOPeD7LKjjIazHMh3vveUrHMn4LU4obPALBfMaLjo1oUTjZ+Hods0Msz1R6JTx2r3pkt/yZBbgLjQ903qheejAOSRKy28qkmcYjU4fKQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v12 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v12 6/6] docs: Document CPU hotplug
Thread-Index: AQHdfmTO6qmJZuoqBEuu0Slwq0koBg==
Date: Fri, 27 Nov 2026 11:45:31 +0000
Message-ID:
 <85a23f25dc93b925c7b63a6d65e375907ba0c251.1795775931.git.mykyta_poturai@epam.com>
References: <cover.1795775931.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1795775931.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB4PR03MB9457:EE_
x-ms-office365-filtering-correlation-id: 73b5486f-08db-4f47-8906-08df4c7bf0b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|261009223027099003|18002099003|22082099003|260925021311599003|260925021911599003|260925022911599003|10067099003|56012099006|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 DdS33158okHVD2bfyLrLR9eJsKWisoYqmFHegly7eyzfQHfcMgFGMXSojwtbI40Dz29ZNN8j02mXheRwzjElFrNeUG94HEnLfLcEiN6tQrSXtcXtS/oTLlJG+OdnKVL9p0tEQsqyEG7z/+tGmiU+vUGHTV9943nSP2suRG5HJ7CSjQSWChXqmn+Yyi/T+B7oku9OJHxfEdBlM1Mx/7oh7IIYooZrfF2F1SwY/JyPfd1vSAUshEymMC8i9c/QWbGAsFN3ZKY1X1YBuBYBbQtPHnhybXdANCuVklDFvINVSO6U7Kc089qJynnCLlkGIjvY9iBNUvp3/HLoyXetBCypts6NNfvKH+RiU943DzgUvpoaBSulMfglYasA5YqKAIdqiNbFtptPG5C2dhrH4PgUlvW9K8aeGeWiDJ/u7UZS0JG9PiCfGbzhd4tQvpsMx5qUhVowgcJqna/biDeBvtjcguN3cngNgEaeHvN1GOHEkZ1swAlOpHQplW2KpssluHi/em8iRqGSVtZnV4A5UO8ww+WBaOK5i5DQSQxcRNTrjKznKuRh9GPKA8iu6IC9M4Qt0D9YjNvvMQDlkcYBtH4j+ZgIDzq/o2Uo21uiSE+puvkkbHVm/Pby5vvRHEqdUESJiqYMgDEG2xbz1cvc+WjvJI57ek8TchF9HALYh6w2VNcyU7KrqOpCsfBd2Y/bikMukcmMS6KISb0fI1g3Z/eNRjI/tGwFSUjQACDd+mlby38=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(261009223027099003)(18002099003)(22082099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHpIcHgvakp3Skk5QWVxNHJTTzNGU3Y2b2xpc211c1A2dm1SSnFWNVJjQXln?=
 =?utf-8?B?dFZ3NXBoV1FUMWxzSEYyL0pVWGsvRG1BYktZT0Vub1dMMWR0MWlqZTQyWWUr?=
 =?utf-8?B?QkRqekJqRkNNWEV4VDljZ0M1Vk40a1Y5VFpoOGZDS3lQejcxQ1VPaGlsNlJL?=
 =?utf-8?B?MUF0aSt3NVg4dnNGaEY2RlhlMTBWQUd2eU1DdEdEZWQwOXNpaGlYWWFOMThW?=
 =?utf-8?B?eEtSWEVCQ1JRQmpNbm9TRmwwM3YrNXA0NU9EV2dQbzdES3Y0cG9ZUnBZaUtU?=
 =?utf-8?B?YUp3QjlIS2trdWNhNlB3dWxSN2p4L3o5VGhhalpIVjI1dGdUQmFzck1HY25V?=
 =?utf-8?B?Y05vbjduc29hdEZ5Q1NyYjVHeGNIbWxqU2d1RWtnNWZaL2pvQzdZbG0zcFZF?=
 =?utf-8?B?QXE4TFJSV0xFNDBNRDArNU94MTJJN1JvRjh4UEs3UzlJVlh1WVo5c3hhVFEz?=
 =?utf-8?B?SDF6ZTk2ZnBzZ2VrZit6czVZMldrWlYySGptR1ZES0w2NkREYklRTW9wLzBS?=
 =?utf-8?B?aW5NR0xNNE80K05mUEdGWUgxc0NrYk9QekJkRXYyUDJyeCtPUTFocXVwOE5F?=
 =?utf-8?B?TWt5ZE5iV1hONGVpMHdWMGgxOGo0akdxNXF0blNsamNwOHhWZEFyQ1RKRnhP?=
 =?utf-8?B?R2dvUzVlUnhDYmRpQzBPWElQUUZsZDN2YjBvb0VVQmZPYUNrU0d2c0hsbUxo?=
 =?utf-8?B?RzRaaUZUMDRrWW1qWC9jNWw1dUptd05yTklzUGxKbE9LSUpmdjZRRGJZRlJn?=
 =?utf-8?B?RjdLM0VRNVNvV0dtUTVDeDREeldlUjAwMFJTaWZNdngvVTJETEtNK3pMMVNS?=
 =?utf-8?B?b01KS0diTzQ0czlNSUNDQXhCMi9iN0VqZ0s2Um9DTFRSeVhyYnBXaG5PUytv?=
 =?utf-8?B?UVRvUmR4dWdjaHg4MmxVeWNNSUNwUytCUFhhQW9CTFExbFp2V2JOTlpSNEdB?=
 =?utf-8?B?MXhVQ2w5M1dJTUQxYTlWWSt2Mmg5cEM0UHMxRDRMUmRsVTBBS1Q5UkxmQWk1?=
 =?utf-8?B?d0RrcjlONnR4WkkyeU11NjFsd3MrK3JQbTVwRGZJVlBieCt4UWRGRmNucnpl?=
 =?utf-8?B?QnovbEsyTmVST0tFdDVVMWxNZzYxUVZieTd4MkRZb3Q4N2hnZHphKzFUWHVC?=
 =?utf-8?B?ejRQbTgrV1dwejZIeFZ3VnpSUUY2UkpmRk9MTUROdFRqSnhGc0JDdzhlcXVT?=
 =?utf-8?B?elMxbkZCYllabVl6QVpNUDNyM0htQTN1TUI0UzhVb2VVQjVpUm8zc0VCUzhR?=
 =?utf-8?B?VHV0U2hseWdEdnEzQTdTUXdTampnQm0xclZETE13V04za1ZUNjRMMXprSjdp?=
 =?utf-8?B?TEQrRUdrUEhCYzczOXhkZHRrbTlBZ1k3WFQ4TVBKZEk5Q0JPL2NOejdDbDhp?=
 =?utf-8?B?TWF5bGpOR0luL2JUUVFSb29pem1HcFlFVjgwR2RrR0NNS2MxcUNUQXhlbnpT?=
 =?utf-8?B?M3lleW9FM1JuT0J5a0dkVGdvemFsZ2Ixbm40OThxTWpnU0pxQzlLU3NlS3hK?=
 =?utf-8?B?Rk9HTUh2VzNXbzRCaEFuMEw0QXdjcytQSE9EMFdDQ0lmOGZpS1ppWEtacnMx?=
 =?utf-8?B?K1pJSG9GVXdobGk3dUJBNWtzUDhOLy9SdDI3RkFLeUh6R2N6bHdjdlpJVVl1?=
 =?utf-8?B?MTg5ODdKaGc1bWxTcEdHVDRvT3pPUVZXVThxT3RBcHM2ZFFnMklzYjBaZzlY?=
 =?utf-8?B?R29KbmptR3pvUVpOYjZ0ZWdCMjB3cXVLdzVLZHNwejZ4ZitqdzRrdkNOa0FQ?=
 =?utf-8?B?ZDBlcm81Y1BQUWFSdE1QWXloaUsxbnJibXZUSTBac01Pa2ltYk4zWUF4dkUv?=
 =?utf-8?B?cmpTeldKSHQvWktVUmUyZlRkd3FJNW9OMGxlM1lDUlI0TG1UYWlQd2FaK1l5?=
 =?utf-8?B?dFNyaFNEdlZaRm94aXhFbVZZVlJ0ZnEwOUw2QkxBV0Zxak1lUzJvakxFN3pm?=
 =?utf-8?B?ZDVQaFdNc3Y3Z1Z5RHgwc3FjZ2V3NWRHWVVBQVNYTzloWXJNTzV0UC9xVlE1?=
 =?utf-8?B?QUl2cjRzbzFkOGtab0xDM0F2dkx5b2RpbmdPZmJLOWZsdnFHcEFXdys4K3Y3?=
 =?utf-8?B?RWtId2trVngrM3JEeFlkZFZaRlh6cUFvekQ0eENZSkF3SzNmQTQwODEyM3lu?=
 =?utf-8?B?NEgvRDg5RHZpNXNPamZYNVhKMlNXQ1NMeVJoeFlMV1NSUkw0ZGJ6Qnp5L2s4?=
 =?utf-8?B?OFgvK29rd2ZCSTJqUVE1ZkF3WDZ0L25WcnJiK1JJK2dmSjhuYWY2VkVqaWYx?=
 =?utf-8?B?S2FxWEtlUzA4YWcrVnA0dDdxb0RYKytMaVdDMTRsT00rSERqd1IvMENFb1BL?=
 =?utf-8?B?L2F1azhRckVJTGdPcVBiUFVhOEpPdmRUQjJmTW9TUjdxMkFSZmhFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b5486f-08db-4f47-8906-08df4c7bf0b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 11:45:31.3034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ab/mI+ySpeIZf0okL5Jpg1hEK4fH+uUeUGyDMZz/TBiziszVfb8KJr5e0MfvUG0BmtLwUET2GVcrp02zaAI0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9457
X-purgate-ID: tlsNG-d25034/1795779937-76CDBA5B-640343E0/0/0
X-purgate-type: clean
X-purgate-size: 6196
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0K
UmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNv
bT4NCi0tLQ0KdjExLT52MTI6DQoqIGNvbGxlY3QgdGFncw0KDQp2MTAtPnYxMToNCiogc3luYyB3
aXRoIGxhdGVzdCBjaGFuZ2VzDQoNCnY5LT52MTA6DQoqIGV4cGxhaW4gdGhlIGFjdHVhbCBJVFMg
aW5jb21wYXRpYmlsaXR5DQoqIHNheSBGRkEgYW5kIFRFRSBhcmUgaW5jb21wYXRpYmxlLCBtYXRj
aGluZyB0aGUgS2NvbmZpZyBkZXBlbmRlbmN5DQoNCnY4LT52OToNCiogbm8gY2hhbmdlcw0KDQp2
Ny0+djg6DQoqIHJlbW92ZSBzdXBwb3J0IHN0YXR1cyB1cGRhdGUNCiogdXBkYXRlIGNvbmZpZyBv
cHRpb24gbmFtZQ0KDQp2Ni0+djc6DQoqIGFkZCB0ZXN0aW5nIGFuZCBsaW1pdGF0aW9ucw0KDQp2
NS0+djY6DQoqIG5vIGNoYW5nZXMNCg0KdjQtPnY1Og0KKiBzL3N1cHBvcnRlZC9pbXBsZW1lbnRl
ZC8NCiogdXBkYXRlIFNVUFBPUlQubWQNCg0KdjMtPnY0Og0KKiB1cGRhdGUgY29uZmlndXJhdGlv
biBzZWN0aW9uDQoNCnYyLT52MzoNCiogcGF0Y2ggaW50cm9kdWNlZA0KLS0tDQogZG9jcy9taXNj
L2NwdS1ob3RwbHVnLnR4dCB8IDEwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkb2NzL21pc2MvY3B1LWhvdHBsdWcudHh0DQoNCmRpZmYgLS1naXQgYS9kb2NzL21pc2Mv
Y3B1LWhvdHBsdWcudHh0IGIvZG9jcy9taXNjL2NwdS1ob3RwbHVnLnR4dA0KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLmUxYjQ3NGNhNjkNCi0tLSAvZGV2L251bGwNCisr
KyBiL2RvY3MvbWlzYy9jcHUtaG90cGx1Zy50eHQNCkBAIC0wLDAgKzEsMTAyIEBADQorQ1BVIEhv
dHBsdWcNCis9PT09PT09PT09PQ0KKw0KK0NQVSBob3RwbHVnIGlzIGEgZmVhdHVyZSB0aGF0IGFs
bG93cyBwQ1BVIGNvcmVzIHRvIGJlIGFkZGVkIHRvIG9yIHJlbW92ZWQgZnJvbSBhDQorcnVubmlu
ZyBzeXN0ZW0gd2l0aG91dCByZXF1aXJpbmcgYSByZWJvb3QuIEl0IGlzIGltcGxlbWVudGVkIG9u
IHg4NiBhbmQgQXJtNjQNCithcmNoaXRlY3R1cmVzLg0KKw0KK0ltcGxlbWVudGF0aW9uIERldGFp
bHMNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorDQorQ1BVIGhvdHBsdWcgaXMgaW1wbGVtZW50
ZWQgdGhyb3VnaCB0aGUgYFhFTl9TWVNDVExfQ1BVX0hPVFBMVUdfKmAgc3lzY3RsIGNhbGxzLg0K
K1RoZSBzcGVjaWZpYyBjYWxscyBhcmU6DQorDQorLSBgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19P
TkxJTkVgOiBCcmluZ3MgYSBwQ1BVIG9ubGluZQ0KKy0gYFhFTl9TWVNDVExfQ1BVX0hPVFBMVUdf
T0ZGTElORWA6IFRha2VzIGEgcENQVSBvZmZsaW5lDQorLSBgWEVOX1NZU0NUTF9DUFVfSE9UUExV
R19TTVRfRU5BQkxFYDogRW5hYmxlcyBTTVQgdGhyZWFkcyAoeDg2IG9ubHkpDQorLSBgWEVOX1NZ
U0NUTF9DUFVfSE9UUExVR19TTVRfRElTQUJMRWA6IERpc2FibGVzIFNNVCB0aHJlYWRzICh4ODYg
b25seSkNCisNCitBbGwgY29yZXMgY2FuIGJlIGRpc2FibGVkLCBhc3N1bWluZyBoYXJkd2FyZSBz
dXBwb3J0LCBleGNlcHQgZm9yIHRoZSBib290IGNvcmUuDQorU3lzY3RsIGNhbGxzIGFyZSByb3V0
ZWQgdG8gdGhlIGJvb3QgY29yZSBiZWZvcmUgZG9pbmcgYW55IGFjdHVhbCB1cC9kb3duDQorb3Bl
cmF0aW9ucyBvbiBvdGhlciBjb3Jlcy4NCisNCitJZiB0aGVyZSBhcmUgWGVuLWJvdW5kIGludGVy
cnVwdHMgcGlubmVkIHRvIHRoZSBwQ1BVIGJlaW5nIG9mZmxpbmVkLCB0aGV5IHdpbGwNCitiZSBh
dXRvbWF0aWNhbGx5IG1pZ3JhdGVkIHRvIG90aGVyIG9ubGluZSBwQ1BVcy4gSW50ZXJydXB0cyB1
c2VkIGJ5IGd1ZXN0DQorZG9tYWlucyBhcmUgaGFuZGxlZCBieSB0aGUgc2NoZWR1bGVyIHdoZW4g
aXQgcmVzY2hlZHVsZXMgdGhlIHZDUFVzIHRvIGEgbmV3LA0KK29ubGluZSwgcENQVS4gV2hlbiBh
IHBDUFUgaXMgYmVpbmcgb25saW5lZCwgc29tZSBYZW4tYm91bmQgaW50ZXJydXB0cyB3aWxsIGdl
dA0KK3JlZGlzdHJpYnV0ZWQgdG8gdGhlIG5ld2x5IG9ubGluZWQgcENQVSB0byBwcmV2ZW50IGlt
YmFsYW5jZS4NCisNCitJZiBwQ1BVIGJlaW5nIG9mZmxpbmVkIGhhcyBzb21lIHZDUFVzIHBpbm5l
ZCB0byBpdCwgdGhleSB3aWxsIGJlIGF1dG9tYXRpY2FsbHkNCit1bnBpbm5lZCBhbmQgbWlncmF0
ZWQgdG8gb3RoZXIgb25saW5lIHBDUFVzLg0KKw0KK0xpbWl0YXRpb25zDQorLS0tLS0tLS0tLS0N
CisNCitPbiBBcm02NCBjcHUgaG90cGx1ZyBpcyBjdXJyZW50bHkgbm90IGNvbXBhdGlibGUgd2l0
aCB0aGUgSVRTOiB0aGUgcGVyLUNQVSBMUEkNCitwZW5kaW5nIHRhYmxlIGFuZCBHSUNSX0NUTFIu
RW5hYmxlTFBJcyBhcmUgc2V0IHVwIG9uY2UgYXQgYm9vdCBhbmQgYXJlIG5vdA0KK3JlLXVzYWJs
ZSwgc28gb25saW5pbmcgYSBwQ1BVIGEgc2Vjb25kIHRpbWUgZmFpbHMuDQorDQorT24gQXJtNjQg
aXQgaXMgYWxzbyBub3QgY29tcGF0aWJsZSB3aXRoIHRoZSBGRkEgYW5kIFRFRSBtZWRpYXRvcnMs
IGFzIGJvdGggdXNlDQorbm9uLXN0YXRpYyBJUlEgYWN0aW9ucy4NCisNCitDb25maWd1cmF0aW9u
DQorLS0tLS0tLS0tLS0tLQ0KKw0KK0NQVSBob3RwbHVnIHN1cHBvcnQgaW4gWGVuIGlzIGNvbnRy
b2xsZWQgYnkgdGhlIENPTkZJR19DUFVfT05MSU5FX09GRkxJTkUNCitLY29uZmlnIG9wdGlvbiwg
d2hpY2ggcmVxdWlyZXMgRVhQRVJUIGFuZCBkZXBlbmRzIG9uIEhBU19DUFVfT05MSU5FX09GRkxJ
TkUuDQorSEFTX0NQVV9PTkxJTkVfT0ZGTElORSBpcyBzZWxlY3RlZCBieSB4ODYsIGFuZCBieSBB
cm02NCB3aGVuIG5laXRoZXIgSVRTIG5vcg0KK1RFRSBzdXBwb3J0IGlzIGVuYWJsZWQuIFRoZSBv
cHRpb24gaXMgZW5hYmxlZCBieSBkZWZhdWx0IG9uIHg4NiBhbmQgZGlzYWJsZWQNCitieSBkZWZh
dWx0IG9uIEFybTY0Lg0KKw0KK1RoZSB4ZW4taHB0b29sIHVzZXJzcGFjZSB0b29sIGlzIGJ1aWx0
IHVuY29uZGl0aW9uYWxseS4NCisNCitVc2FnZQ0KKy0tLS0tDQorDQorRGlzYWJsZSBjb3JlOg0K
Kw0KKyQgeGVuLWhwdG9vbCBjcHUtb2ZmbGluZSAyDQorUHJlcGFyZSB0byBvZmZsaW5lIENQVSAy
DQorKFhFTikgUmVtb3ZpbmcgY3B1IDIgZnJvbSBydW5xdWV1ZSAwDQorQ1BVIDIgb2ZmbGluZWQg
c3VjY2Vzc2Z1bGx5DQorDQorRW5hYmxlIGNvcmU6DQorDQorJCB4ZW4taHB0b29sIGNwdS1vbmxp
bmUgMg0KK1ByZXBhcmUgdG8gb25saW5lIENQVSAyDQorKFhFTikgQnJpbmdpbmcgdXAgQ1BVMg0K
KyhYRU4pIEdJQ3YzOiBDUFUyOiBGb3VuZCByZWRpc3RyaWJ1dG9yIGluIHJlZ2lvbiAwIEAwMDAw
MGEwMDQwMDVjMDAwDQorKFhFTikgQ1BVMjogR3Vlc3QgYXRvbWljcyB3aWxsIHRyeSAxIHRpbWVz
IGJlZm9yZSBwYXVzaW5nIHRoZSBkb21haW4NCisoWEVOKSBDUFUgMiBib290ZWQuDQorKFhFTikg
QWRkaW5nIGNwdSAyIHRvIHJ1bnF1ZXVlIDANCitDUFUgMiBvbmxpbmVkIHN1Y2Nlc3NmdWxseQ0K
Kw0KK0Rpc2FibGluZyBhIGNvcmUgd2l0aCBwaW5uZWQgdkNQVXM6DQorDQorJCB4bCB2Y3B1LXBp
biAwIDMgMyAzDQorJCB4bCB2Y3B1LXBpbiAwIDIgMyAzDQorJCB4bCB2Y3B1LXBpbiAwIDEgMyAz
DQorJCB4bCB2Y3B1LXBpbiAwIDAgMyAzDQorJCB4ZW4taHB0b29sIGNwdS1vZmZsaW5lIDMNCitQ
cmVwYXJlIHRvIG9mZmxpbmUgQ1BVIDMNCisoWEVOKSBCcmVha2luZyBhZmZpbml0eSBmb3IgZDB2
MA0KKyhYRU4pIEJyZWFraW5nIGFmZmluaXR5IGZvciBkMHYxDQorKFhFTikgQnJlYWtpbmcgYWZm
aW5pdHkgZm9yIGQwdjINCisoWEVOKSBCcmVha2luZyBhZmZpbml0eSBmb3IgZDB2Mw0KKyhYRU4p
IFJlbW92aW5nIGNwdSAzIGZyb20gcnVucXVldWUgMA0KK0NQVSAzIG9mZmxpbmVkIHN1Y2Nlc3Nm
dWxseQ0KKw0KK1Rlc3RpbmcNCistLS0tLS0tDQorDQorVGhlIENQVSBob3RwbHVnIGZlYXR1cmUg
aGFzIGJlZW4gdGVzdGVkIG9uIGJvdGggeDg2IGFuZCBBcm02NCBRRU1VIHNldHVwcyBhbmQgb24N
CitSLUNhciBHZW41IChBcm02NCkgaGFyZHdhcmUuDQorDQorVGhlIHRlc3RzIGluY2x1ZGVkOg0K
Ky0gT2ZmbGluaW5nIGFuZCBvbmxpbmluZyBjb3JlcyB3aXRoIG5vIHBpbm5lZCB2Q1BVcw0KKy0g
T2ZmbGluaW5nIGNvcmVzIHdpdGggcGlubmVkIHZDUFVzDQorLSBPZmZsaW5pbmcgY29yZXMgd2l0
aCBYZW4tYm91bmQgaW50ZXJydXB0cw0KKy0gT2ZmbGluaW5nIGFsbCBjb3JlcyBleGNlcHQgdGhl
IGJvb3QgY29yZQ0KKy0gT2ZmbGluaW5nIHRoZSBib290IGNvcmUgKGV4cGVjdGVkIHRvIGZhaWwp
DQorLSBFbmFibGluZyBhbmQgZGlzYWJsaW5nIFNNVCB0aHJlYWRzICh4ODYgb25seSkNCistIE9m
ZmxpbmluZyBjb3JlcyB0byB3aGljaCBndWVzdHMgd2l0aCBwYXNzdGhyb3VnaCBkZXZpY2VzIGFy
ZSBwaW5uZWQNCi0tIA0KMi41Ni4xDQo=

