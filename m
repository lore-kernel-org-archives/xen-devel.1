Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF4606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 01:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Vl+m/P71
Received: from list by lists.xenproject.org with outflank-mailman.1491668.1692397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cn-0003Yl-DX; Tue, 17 Nov 2026 01:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491668.1692397; Tue, 17 Nov 2026 01:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cn-0003Xb-5O; Tue, 17 Nov 2026 01:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1491668;
 Tue, 17 Nov 2026 01:04:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT7cl-0003V6-OU
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 01:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT7cl-00CemR-52
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:04:39 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba7f0-e002-0a2a0a5209dd-0a2a4502b540-40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:39 +0100
Received: from [52.101.72.140]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba826-6ca4-0a2a45020019-3465488c9dbb-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:39 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB3PR0302MB9234.eurprd03.prod.outlook.com
 (2603:10a6:10:42b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:04:36 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:04:36 +0000
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
 b=xuMEAEQpD1mVBXgstzkFtUN8GdbVg4f4SWWfjiykfyqFmHkloJydU/4S0lWo2ct9dND75vn8rrPrWugNurxISp3G6q36pSlgaYfc3j2SWsr46dZbfOuaNfZYQS/WrJH+G4HxqakIbT1kWLiT10yEnQeRbq9vQprF8u727gnIrVRoN3ZHzwOeB0noc0yj+VFpN56ZvOAfp4V74KwjRnl7YZr+Q83QClzKIVz/jhtcJ741l6yxr3cov8l2AcdTGVxPar8DVq3UoyvMnDPO732Md9S1OtJyjgwJjDJ+O4xwrxK5F1ZXspfv9XII+2bs4vVWbxsLwQzw88QCzT8o3mtltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO5X92yC8Ivno7ygApMFKN0/d3ZxqY23jb0TxLrwvu8=;
 b=TIInkZIUA9M4wAD2S9syvzoE26LFNpYJYhouAGFWXCmLqMxpJA+jZx23E82C4SqOHwd3r0MQAKOzoXi7lWkRkAopZdig6kUyb3ncrcZaDSYH7YZM8VHpU+eUAZZTT0ExcYmCK1CJhto9iGiUUwKtM/JHI9KamzI7MG9Yc6NpfS46yoWGCK6UXK/4beUk4kCA2u0eVfSXC6f8JB6fObeccaznvC0KCiS9j2bc20UB6lhocPJCm1A5PcZxu88oDmW50SnVqkfrcCKWwV5hYCfqEKuhuTPOdkUd6H5c6tcaNo50lYOoXBphvgNZVjiqxVhi+Z9UuqWDKnT8kAu8q/miag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO5X92yC8Ivno7ygApMFKN0/d3ZxqY23jb0TxLrwvu8=;
 b=Vl+m/P716k3BDgRkETvhJBtv0SqMgUt0XV7zLFldHaDQwD0ppAOwnwswThWVo3WTD2ad6rbGhcnD6KNpWYzgVBnga8bHXLf33ZI9xc8TLMLpdrHP4KFo9rWmjGXW94ANuXsyH8SK2E/TSfrniL/9Ah+i2bHphqofgCf2rzXhxFAIl5jxKq8Ur/25otoLFZFJB9z5qVZt7eglCX3i53/F8B73j2p+yHklKWH8pTlVWfGC0HNuIYrxoRFdvLdne+953fweakWm+BCzBx+AzkKNznFBtnfGtl5Ib24c0YHXhZ9D778hMCkXG0gnmH7UNse2JyYsaOHeh/bXmBZizjjtxQ==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
Thread-Topic: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
Thread-Index: AQHddi+cZOjwQapHtE2XhAKyWGxBnQ==
Date: Tue, 17 Nov 2026 01:04:35 +0000
Message-ID:
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
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
x-ms-office365-filtering-correlation-id: 9dd29ae6-78eb-459b-5a66-08df4446bfad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|261021121427099003|11063799006|261028144727099003|261026121527099003|261022105027099003|261022075727099003|261102123227099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 SvzLezmB7aO6P2WWugBhJtGOyw2Wrzb8gWlDM0tj2L0IGAJgGPB/o4w5LrNbz8zAo2L+y1NxujWR9FYaBmGp2CiCI1rDswwMtWwFGpvv71fJfB7tI+5ka9xlmyvwf4UpqhxYX0moxYK4w1iMAyoc1UbDGYe43SbfXULqxF69bWsXPxYpwh1uENistcRLr+hOBkCTBam816gSaqpVvYd6VWcOHXmbVcsQUi3x83x34sC1YT5Ocae0v5VjDKmA6Cw2uYYwewOLC8ULh4pUVFjBjtidYANlUxyU3hYcCAU5F4Jf6JVfLQDqXPQaHUQZQhfEhutVr0S/O0Ab9000J7Jp0Lwcuhy+/8Kpxrok4ZYHDHpnH9x4nsr2SvQOs6oaDyWgcMIFNpjd282oEDPR5zYmPtc6vG8Vk6l7nxROgBoSq6/w1gNd7DBxHfqA6WPFZrdOMo8RLipZLN5RMKlVS7fUO4w8GXfUecEUZYpKfv14ONcrOfDv9nGW8xt1CfAFxwDNK2Rv9wbvk5H/i6C9hr8xv6SHpRbiGDCr+Qjww/6AFxvt7ZYBTVk28rpkzvY/xORXWk4XU8cGeH54dB4MdsZ8nhoD18V4Lsyt0LCMUjeMHt9dtYyvtd8k8D2kLywm0KVHPcqhqZtPk18lMd71Zwq+LdBNTBOLQ8aPiX1FRxPqPzVAjl/1ivGIep7ueLgzQdMlIOTq397V8OXQLi2E5QWgzuWL1YuUWMEmAyr68QM+EJ4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(261021121427099003)(11063799006)(261028144727099003)(261026121527099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHNTaWVDN1N0SVRTRU5kTmh2SVB5NEJ4WnpKNUd4NmRtV0k5NGZMOCtjZGhF?=
 =?utf-8?B?Q0hYU0g1am5aWFM5NEFGSm5rMlhLNDNZVlQzRXo0T0JCdHRWTzZSbGFnS0t3?=
 =?utf-8?B?QkhMbDVaak5lMElEVmhGMC9PclR6VVZkY3FCWncybldIMmlpWWxJbkREc2Jy?=
 =?utf-8?B?bnNhY25hVzZWUDN5TVl4clQ0MHRHdCtKbUt3T0Y5a1FrU3U5RmhONXdBYStk?=
 =?utf-8?B?SlVKNnpLS2haM0FKT3B6Wkhra0p5ZzlZc2dXRkdQemMwYTkwNnM0anFjSVkw?=
 =?utf-8?B?TTVHb1JtdlVmcDA1RWwzV1NBMTUrbTl1WkNweGF1TVNOUHdtTzYxc2doV1hw?=
 =?utf-8?B?UXpJU3RPZkpITGVyWGUrVUNCTEtvVDl5M0JHVDVudmZiNno3dFlkdmd0Qjg3?=
 =?utf-8?B?OWRabzRsVEZncGlTZHAyY3pkcEVtbjBjNUxkckw1MlQrOXFmN0lvREE2NThq?=
 =?utf-8?B?YmxkdExYQXh5eW1MV2F1cFdhQ0o0eGhQK3RIbTJEcEpGNzR1blpWQnRjRHpn?=
 =?utf-8?B?aHZKVEh5ckRNS28wYlBCOHRSbUxhQmV0R3hhYkViUjdMMTBtMHVnaUYyREoz?=
 =?utf-8?B?K29XaDVLa0R6WEM4NzRmOHRFOUQvY3NHWHdQMWY2VmZqTEFTd0IzNW1iUTFP?=
 =?utf-8?B?d0dvTnN3T1ZIOVkvMUtoRlRRZmNuMGZoZHlyVWJ3NXcwbTgwd24vSUUyaE9Z?=
 =?utf-8?B?bXczNCsyYWVzVTZ5WGZQc1VvWUtuY1BIQjVDZGloR1FqRnB6aHJ1QjRKOU8r?=
 =?utf-8?B?UjA0em1aeGtqdEtLcm1PNDM2VkhKaWRKZEdPSjhrZ2laUUNwWlFTWlQxWFVU?=
 =?utf-8?B?aVlPQ3I3c3pMUEdyK3h1T0ZLMUZiYml1T3dlTmVxQ1JiMFloQ09rL0prcitt?=
 =?utf-8?B?bTFyNDlZQ1hNOGNuZUovVENaS3JGcnpWUTdOMkRPSDI2YnNvUG5XSUlwVjNt?=
 =?utf-8?B?UG5vcC8xaG85dFc5SnAyVkdQOTRRVzFuVVY4NmpPNjZNTWgyY2Q2WDd5TTlL?=
 =?utf-8?B?ZFF4eHVGbW10RDdKMHhKbWZjeE5kbkZLVXBXUTUxQ1RocjRuVzdEQ2hDdHh3?=
 =?utf-8?B?ZFdGWXBGT0crc1VNWEh0bGpwbW5HTVIvdDBNSW1SOUZabk9rdURUL3FUUmZP?=
 =?utf-8?B?U1lFVExpSHk5UFJvQ0lJdEJxb2NzZjJjWnh4VmVnY2lhTldoT1Rnb1BxVkNR?=
 =?utf-8?B?eFV3a3hkdEhzL1lyY2JQNWlzTXBRYjV0RXFzN2lQemJGbW1xcnMrSW9ZZWN4?=
 =?utf-8?B?QVIwUzc0ZUdJRWtuRjh2cys1NzR5Ym1QMW14b2swOXFmUkxLWXlxSFlzRE80?=
 =?utf-8?B?eHVTQTIrRzZtL2lpTDhlMGtDaFViTFFydXZ5cWlmbnBnTlJNZnVPY3dFV0Zn?=
 =?utf-8?B?ZC9vRXA0NmtnbVdwTHl0WkVkQ3ZyeURjdFFyblV1ZEo4L2JrUXExVGk5aUtE?=
 =?utf-8?B?R0UyT29MS2tMVnFoRjBZenI1bU9vSzZXRDh1dVFFenFTb2lBK3VadHAvNk9h?=
 =?utf-8?B?V0lXM2FvbkhKb2IzcUlCdzg0aHRFSXh3c1BDYTcrdjJrdkRIM1FOSmxyeFlZ?=
 =?utf-8?B?VEUwMGtsRFI1UFcrNWJvZHhOOW9vQ3BUY2dFWXpRUGFPbjE3SXNhSlVEMDJ2?=
 =?utf-8?B?OHR5bVExWGFIdlhZbjM5eUMxZVVVUmMrVFpieFZBaUtqaFRuODRDSlJKc3k5?=
 =?utf-8?B?M2ZrL2VuUlNpZldPOWdWbS96SmxYUUVsMm01MW5KSkZjaUx1SGlqQUlNT0Zx?=
 =?utf-8?B?MjU2RmVwK3dwVU9Jc0xoTG10RGluaUVwT3ZWNzluTEdBTDJXTk53TXhqeWFZ?=
 =?utf-8?B?NFZDTGd5OTRGYXo0Q0tycHVxcGxjUXVnQmIrTGliOGpNTTJzZ09pSTFsTVkx?=
 =?utf-8?B?REJWQkpjdVk1S2l3aWR4NHQrVmhjdEM0eE5xQ3NISzBtc2JuVllpMkNsekRa?=
 =?utf-8?B?eVYzZUovcUZDRXU1STJMa2tEWE5hWm9UTVpaNnNoQ2o4OWhQYUVpcmV1MEY1?=
 =?utf-8?B?eUpJMlFNamJncFZXQXcvemhnWGJUejZGQjlxY2VCS1BOSkNnR3lBS3RFbjZX?=
 =?utf-8?B?VXY3aEVGdzRsM3F5UWlUQjhYd3pQTzcwbEQ4UFZhUjRDRThNY0FTUUdycTRM?=
 =?utf-8?B?NzBiVDdMekRjQnBjTUFwN21qZEt6RERtKzQxRHp0KzV6dFFCSkNSZWVPQU45?=
 =?utf-8?B?dHlZSFc4dkRSMG15NU5aR1ZtRlh5d2NEVmFxVm4wRU1CVGpSbkN5b085MUtr?=
 =?utf-8?B?b2pxL3FDaENJUlZDcC95K2Z5YzBZeWkxaGovSGZPMXpDZTVMQWVlWEpxd3Ex?=
 =?utf-8?Q?Ermb5EhKMImgtt5Vhh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd29ae6-78eb-459b-5a66-08df4446bfad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:04:35.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJgDyOpSHJ3b6V/Lcv4Tzxes3/+v2nVPDw2o+29EJ7fa0UDSQCNp3vt8wKsk0Om9PYHzy1lB7C6lIAM8qr3h0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9234
X-purgate-ID: tlsNG-720697/1794877479-F04A62AC-83C22B09/0/0
X-purgate-type: clean
X-purgate-size: 2690
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiBhIENQVSBmYWlscyB0byBjb21lIGJhY2sgZHVyaW5nIHN5c3RlbSByZXN1bWUsIGNwdV91
cCgpIHNlbmRzDQpDUFVfVVBfQ0FOQ0VMRUQuIEFmdGVyIHRyeWluZyB0aGUgb3RoZXIgQ1BVcywg
ZW5hYmxlX25vbmJvb3RfY3B1cygpDQpzZW5kcyBDUFVfUkVTVU1FX0ZBSUxFRCBmb3IgdGhlIHNh
bWUgQ1BVLg0KDQpPbiBhcmNoaXRlY3R1cmVzIHdoaWNoIGRvIG5vdCBwYXJrIG9mZmxpbmUgQ1BV
cywgYm90aCBub3RpZmljYXRpb25zDQpxdWV1ZSBmcmVlX3BlcmNwdV9hcmVhKCkuIFRoZSByZWxl
YXNlIG1ldGFkYXRhLCBpbmNsdWRpbmcgdGhlIHJjdV9oZWFkLA0KaXMgc3RvcmVkIGluIHRoYXQg
Q1BVJ3MgcGVyLUNQVSBhcmVhLiBUaGUgZmlyc3QgY2FsbGJhY2sgbWF5IGFscmVhZHkNCmhhdmUg
ZnJlZWQgdGhlIGFyZWEgd2hlbiB0aGUgc2Vjb25kIG5vdGlmaWNhdGlvbiBhcnJpdmVzLCBvciB0
aGUgc2FtZQ0KcmN1X2hlYWQgbWF5IGJlIHF1ZXVlZCB0d2ljZS4gVGhlIENQVV9SRVNVTUVfRkFJ
TEVEIGNhbGxiYWNrcyBhbHNvIG5lZWQNCnRoZSBhcmVhIHRvIGNsZWFuIHVwIHRpbWVycyBhbmQg
Q1BVLXBvb2wgc3RhdGUuDQoNClNraXAgdGhlIHBlci1DUFUgcmVsZWFzZSBmb3IgQ1BVX1VQX0NB
TkNFTEVEIGR1cmluZyByZXN1bWUuIExldA0KQ1BVX1JFU1VNRV9GQUlMRUQgcmVsZWFzZSB0aGUg
YXJlYSBhZnRlciB0aGUgb3RoZXIgY2xlYW51cCBjYWxsYmFja3MuDQoNClRoaXMgcHJlcGFyZXMg
dGhlIGNvbW1vbiBjb2RlIGZvciBBcm0gc3lzdGVtIHN1c3BlbmQuIHg4NiBwYXJrcyBvZmZsaW5l
DQpDUFVzLCBzbyB0aGUgcGVyLUNQVSBub3RpZmllciBkb2VzIG5vdCBjYWxsIGZyZWVfcGVyY3B1
X2FyZWEoKSBmb3IgZWl0aGVyDQpDUFVfVVBfQ0FOQ0VMRUQgb3IgQ1BVX1JFU1VNRV9GQUlMRUQu
DQoNClNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0K
LS0tDQpDaGFuZ2VzIGluIFYxNDoNCi0gQ2xhcmlmeSB0aGF0IHg4NiBza2lwcyBmcmVlX3BlcmNw
dV9hcmVhKCkgZm9yIENQVV9VUF9DQU5DRUxFRCBhbmQNCiAgQ1BVX1JFU1VNRV9GQUlMRUQuDQot
IFJlbW92ZSB0aGUgYmxhbmsgbGluZSBhZnRlciBmYWxsdGhyb3VnaC4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuDQoNCkNoYW5nZXMgaW4gdjEzOg0KLSBOZXcgcGF0Y2guDQotLS0NCiB4ZW4vY29tbW9u
L3BlcmNwdS5jIHwgOCArKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykN
Cg0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGVyY3B1LmMgYi94ZW4vY29tbW9uL3BlcmNwdS5j
DQppbmRleCBmMTgwZjM3MjUzLi43NTdkZTExMWRiIDEwMDY0NA0KLS0tIGEveGVuL2NvbW1vbi9w
ZXJjcHUuYw0KKysrIGIveGVuL2NvbW1vbi9wZXJjcHUuYw0KQEAgLTgyLDYgKzgyLDE0IEBAIHN0
YXRpYyBpbnQgY2ZfY2hlY2sgY3B1X3BlcmNwdV9jYWxsYmFjaygNCiAgICAgICAgIGJyZWFrOw0K
IA0KICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoNCisgICAgICAgIC8qDQorICAgICAgICAgKiBP
biByZXN1bWUsIENQVV9SRVNVTUVfRkFJTEVEIGlzIHNlbnQgYWZ0ZXIgYWxsIENQVXMgaGF2ZSBi
ZWVuDQorICAgICAgICAgKiB0cmllZC4gS2VlcCB0aGUgYXJlYSBhbGl2ZSBmb3IgaXRzIGNsZWFu
dXAgY2FsbGJhY2tzIGFuZCBsZXQNCisgICAgICAgICAqIHRoYXQgbm90aWZpY2F0aW9uIHJlbGVh
c2UgaXQuDQorICAgICAgICAgKi8NCisgICAgICAgIGlmICggc3lzdGVtX3N0YXRlID09IFNZU19T
VEFURV9yZXN1bWUgKQ0KKyAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgZmFsbHRocm91Z2g7
DQogICAgIGNhc2UgQ1BVX0RFQUQ6DQogICAgIGNhc2UgQ1BVX1JFU1VNRV9GQUlMRUQ6DQogICAg
ICAgICBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRF
X3N1c3BlbmQgKQ0KLS0gDQoyLjUzLjANCg==

