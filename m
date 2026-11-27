Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431B606A321
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=c0kMGtP1
Received: from list by lists.xenproject.org with outflank-mailman.1504834.1699877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOU-00043o-Cq; Fri, 27 Nov 2026 11:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504834.1699877; Fri, 27 Nov 2026 11:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOU-00042y-8J; Fri, 27 Nov 2026 11:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1504834;
 Fri, 27 Nov 2026 11:45:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xWuOS-0003uG-Ne
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWuOS-00DghQ-3z
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:45:32 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d4b-2eae-0a2a0a5409dd-0a2a450cbb04-34
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:31 +0100
Received: from [52.101.66.94]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d5a-f479-0a2a450c0019-3465425e5687-5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:31 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB8PR03MB6139.eurprd03.prod.outlook.com (2603:10a6:10:141::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 11:45:27 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:45:27 +0000
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
 b=hdzCybjiGmbQ2JZF0Gedn3zxgpV70Yt+bjgzbIVI3zl/yEq7earLOW0pq2Dcg42kCFCzrQJ2OyGytFdNOBFrU17Ecz2ZdVZgF/yjPAYl1qI1Zt9DOo0ewD3SJZh0qcqK0roLf46XgJywUVSfD4kiXrImGmUH1vfkt28PIZlhjl86x3NAxk8Kxf9RLdnEd53rm5CChkP7APR5OQjVC/05c+KEjNXqqsJygebmppW5TOkSolVVGwIMueostg+izt5SI+t+37EBIJi1qpGiwvJWUNVeBok9khgYWCAUevwIbXc/IPWXW5uAOd4jsmUgKCuL4gKc9rocQ0yTXjQiLxPhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXPLYj9b75KDSmbYWzoS048WLaVkghtf/axPHG5t25Q=;
 b=Q56IZEnouLvfYtS9PpmkNMKaZXlcMP2KJ5tkmy9g1k9MH9i3P5DzC2cLtkAl9eKazVPXIhfF/uNwkfcT4orlmJJPWhyWC2/3dAnA4RloaXrIbMVhTYA3+rb4rSlxUn7sfSiPkmEGySF5vPQVSN+Wqqt6BLkwK5cp6CCyj3tEK9BeXOOmIS3tlAW8t/tYzoB2ApCIVK6gA+mdjtpujE77pY72u5h9ZTbMqCDL5G1EefKVixKg3zg4mEfckafZCk9Yw7S3JRcWnXNLENvRNijCmeva/y0agG6tZWvO8fVfb0XXTjSoBUZdwBhxMrP23vIult1twml7yqqdvwkt7ZtcBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXPLYj9b75KDSmbYWzoS048WLaVkghtf/axPHG5t25Q=;
 b=c0kMGtP1O+P56pG3pk/aXqTRejSVkVVQY2vjbKRR8QsrjN75idAbcD8catZodbV6iapQ4kSAH9yuTj8KgV4wwOJq62nG7CPl6Uf5WK9IAyBElW+WQGoZXq1ZrZNwFqeQ5c0aWjSroO8wUE0CAGJN3vDIJt+YxTjexd7lu/M4U72JdfXY8LoI2Y3Ka2QxXfrtFZUQQHgly3wUbMjcP6ZUJWDj5jMTfTsYvcBiPBW75QKFos7mjhKid14Mk6hY+WGdzbckOzwCVONCyGAP/Kjz5vhImlQkN/fH2cWZc/wTwdE/a2xGsw3eizs6SDBkhdtRISDD6eF/8Ets6Hg9yILQlg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v12 2/6] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v12 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdfmTL5aZmm45L5kGb0KDSIgy5dA==
Date: Fri, 27 Nov 2026 11:45:26 +0000
Message-ID:
 <35526b13ce74e6469befec5d78537cd5aa7b3483.1795775931.git.mykyta_poturai@epam.com>
References: <cover.1795775931.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1795775931.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB8PR03MB6139:EE_
x-ms-office365-filtering-correlation-id: d0e27d45-6bcb-4744-e013-08df4c7bee55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261022075727099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 1lh6+V8qga5iYSUeLUk403Ina4NSleQ02p/5skg/qQ3GqNYike7sl0dZPkLjKpqYFsP78nQ7VXdhB5v2Gbf/S943kPBEBEhf9hNJdSIzko9D4EYW9iwfecLJg7dWyDUkhEZDd7Dwaakn6xNRS+//KrCJmwNxSZE2xmIEWiF7M2nbCFKAGEoldQqAnCEj8NBawZdDbWmWFQOmvhRwR7m8j7G9W8ecbVGdAZTrd7+maOVsx9oXVPKTRtiPKtzlnitKFISj0iX8yz+aLnjsZrmjzD+BTj9wrxigoy0g6yCVWULNmC+zEqSphps1/9GXtChXmlIHukcZIM2Z7OQ94XKzxAqKv1aj0ydxWDXP6ZDs02Fq21Wv2im+oPPgDBO9AzuuKCdvoR9WvmjWCtMiJ3Tdb6MjqiN9Ud9WKvG2vCB7jv8rzzT269t56J/GO+uQyP3wTQDhXS4ZyiUX+x+MryVxhIfZBgoCpjF2eifm/jHkm5xRM5pJpqgsPnJsxNquWVsoew4y2ar5mAvFS9ej68nKcfPVdkgt2joZD/LNGa/Xr4V443FGEoVOG7P1UnVE2FZyvamgUfoLhFPz/M8xQ6vgAyEgpqH75310aCE3iprILnf+0ZVAGoMsV8oJWmTH0VmMLCTo1UwKq1MCwgbNRFbyzY3VRNOQ5eUhFCpIHglzKnJqGTcwt8aNjO5cQJH35S4pLhTNbS/qQEfYJhFWaB4mqvZT7pfmboYgg8QRkSQu7Nw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUFyZE15QXRoc051NnA0VlllYUJxOGtYS3pURFErYy9JenlEblRHWFQwYVc0?=
 =?utf-8?B?Rm9MN0plUGdJMzlVS2pGekZMZnNlTnpqRWFyVTI3T0JCZEVFTCt3T1gyYnFW?=
 =?utf-8?B?SDlFSlY5M3YyTW9ZMUU0cDY2NXAzOTh2UVVFaDBvc3R3cDN3czBadlpwYjd5?=
 =?utf-8?B?a2NRcHVOcGNycFMwLzJMS0RRMG80NnJKWTNVRWFBdW92OG9JR3NjZ3JjdWR4?=
 =?utf-8?B?YWw4enV6dW40NnVsMjJJQWREZG1HeEVxWE1XTXh4c3Y1aVhRM1RRVXNCaVY4?=
 =?utf-8?B?QldqUSs2aXZTKzdDNWZPWnlNWExMSDAzNmdIYnluR0k4TFIyRUN1MnlnN2xK?=
 =?utf-8?B?elZJbkVMZHBqMVNLNVlSelVXOEF1QVBqNkxiaFJpdlQ2THpReGZSMjdpaWRo?=
 =?utf-8?B?a1VaQ1FaY283SjFuTDY4V1pxNFJUVkVrN25oSWwvbS9GenFhVExWdUQzN05W?=
 =?utf-8?B?dVgyNFI3VEw1VkFXU2NCUUtzeEFTQzhuYlA2Sjh4MTNjckRlaFBrRFpSY2Rj?=
 =?utf-8?B?alVycVVvWFRPdHVuMDFVN0x0WW44ZEh6cjVjcmlrbERPTmRibzE5TU1CMDU0?=
 =?utf-8?B?RWh4bHdvVW5NL0JHc2VkY1ZNS0JwUTREUjlUd3cyRmVpbHJ3U1NDWHVrTlAw?=
 =?utf-8?B?WVFnMDBvK1NIUEcycHBBdlJHVmN3cjhSS1pJZmVOZU9Rby83R1RJTFNQV0Y3?=
 =?utf-8?B?NEpkZXNCZVdwcHROQXdpMUpPTmRGTWMzT3NJNzZtSXVKMHJhb1l2aExCUzdN?=
 =?utf-8?B?MWJ0WUhEMVNLeXFUUnNMQy85TXkwa2t2L3RjUHh6S0J6S3FHSldDMFJGeDNK?=
 =?utf-8?B?VlFrTXc0TmFyYWkrbTd4TFpWTzdicXZnZStlMDh6NkI5Tk5BVk85aWJQTGw2?=
 =?utf-8?B?eFJidDNrcmsxTllxemZhZVpPemN6Rm14Tm1KWlpkMnA1RlRqUlV4NHVZTklF?=
 =?utf-8?B?M2YwcGdiRnR6M281b0ptRHlNeDI4TmxLajZwWHZzMk9iVDJESG1oUzJjMldu?=
 =?utf-8?B?L2RFS0ptTTVrVVdtNnJvNWVrQXhkbXFVQ0FGSzR6aFk1WTdCeGFKeXN6Ly9j?=
 =?utf-8?B?S1g5UGZFUGNWQm1TVnNIcG0yVTcramtKWmFyUzhmT2lpcXV1Rk5KZXEzMEtL?=
 =?utf-8?B?MXZobGQyYmNtNTVLelhkemdOdVAwZlIxS29JbGZFT3FPNFlxZ204N1Z5bmtt?=
 =?utf-8?B?Ykhuczh4aFFka2FCaUJ3eW96ZldTS21qOVhTaGZ2Tml5R1p2RTc4TXpvdWdT?=
 =?utf-8?B?bElWV0lMeFR2ZlV2TU5tYkJsYWZSODVxNFJJWDVNRElpbDhPMFQyZTVFbGlo?=
 =?utf-8?B?a0hEVHpUUjFwbU1PdkNJcE8yUFhxL0NCclJJWXpXcFp1MXU2NE1sYmlHWFYr?=
 =?utf-8?B?TENMZHZTWWwzUDlNVm1IeTFDUHVxaDA5THh1aDlEaUN1dWJmUWIyT2tpbElx?=
 =?utf-8?B?N3o0M0ZMTGx4VzBOc1kvN0tiMXU1V09oQ2lzdE1MSnlwVkpxT0NZQW5yQ01h?=
 =?utf-8?B?T2tzMHVYeUZGbnV2R204ZWNXNWdSYXBkSDlYRGtoS2dZRDVHWS9ncVdkT1lT?=
 =?utf-8?B?YkFKZTMrUXRzSTRRaEIxb3dNNFlYMUswT2cwY3dUNDlVWlJTMU4vdlFlNDFE?=
 =?utf-8?B?QVU0S0gvVnN4SHBhOHJlbTNaY2w3bDdnL3UzNnovdnBjSkRmMmVCcWxsMDg4?=
 =?utf-8?B?YXVNMWFvUzRXdmE5dmMvWjdkaHFYRWZjc1RJam85S1NZbmszdy8wQ3VHa0Vx?=
 =?utf-8?B?VTlKTXkzVEhCTmlUYXNocDRGRUVCVG1VRm4rYW9uSzcwSFFNRFJFaVp4L1Jk?=
 =?utf-8?B?ZEs0akdrMFZ3WGZta2FyMytXbkhpVzYxN1ZJTnh2eVl0Mm5mN1hLUDA0bEpm?=
 =?utf-8?B?RjE3d2JlY3JPVU0xd2x4ZENiTVdqRXphQ1I0dGV1eDRPcndWcUl4STZRTEF6?=
 =?utf-8?B?RVBmRXRPVXJRL3JIRzIxY0FVZjNKbWI2RTNEeUNXenh6SFlwcVh6RDI5S3VY?=
 =?utf-8?B?V3VlL2xjaXNSck1FSGtUME1ITTBCRnJUZWxiWHdLWTBqN012ejZhRzU1YUJW?=
 =?utf-8?B?MFJLTGVQbzNOU2krQlFUS2YyMUYzVHFKZWo4L1V3ZVUycy9tZ2s4OWdaTHRv?=
 =?utf-8?B?ZUVaSmtGTGRXelN1bFFLcW8zbFpZVDEyT0xqazhDa1N6NXpVZ2ZKMkhTNVJG?=
 =?utf-8?B?UERyZndSU2FQdGVaaFZ1Tk5wSnVXQ2NlMFhBN1ZtSXgzYnBXcUxVdFgxZjRz?=
 =?utf-8?B?V3RSQU02YmhlYlFqb3pUbWdWdzBwbUd2Q1BvbGMrMHA1cUYrRWFaWFN5ZDB5?=
 =?utf-8?B?V2xuTG9CVmdaakJGTlY3bUlzOFl0d0VTenpvN0pabjhTSitmQ2M5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e27d45-6bcb-4744-e013-08df4c7bee55
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 11:45:26.6878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2UEGuqfvqgVDT8ucfDrhyT+ZQiPBIaGr0pWDfhwJ7OsKpip6uXmY0d1rKDqb1lW6HaC5+VYexgypazZ1hdM0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6139
X-purgate-ID: tlsNG-d25034/1795779931-50D3CA5B-9E07EEFA/0/0
X-purgate-type: clean
X-purgate-size: 6410
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TW92ZSBJUlFzIGZyb20gZHlpbmcgQ1BVIHRvIHRoZSBvbmxpbmUgb25lcyB3aGVuIGEgQ1BVIGlz
IGdldHRpbmcNCm9mZmxpbmVkLiBXaGVuIG9ubGluaW5nLCByZWJhbGFuY2UgYWxsIElSUXMgaW4g
YSByb3VuZC1yb2JpbiBmYXNoaW9uLg0KR3Vlc3QtYm91bmQgSVJRcyBhcmUgYWxyZWFkeSBoYW5k
bGVkIGJ5IHNjaGVkdWxlciBpbiB0aGUgcHJvY2VzcyBvZg0KbW92aW5nIHZDUFVzIHRvIGFjdGl2
ZSBwQ1BVcywgc28gd2Ugb25seSBuZWVkIHRvIGhhbmRsZSBJUlFzIHVzZWQgYnkgWGVuDQppdHNl
bGYuDQoNClRoZSBvZmZsaW5lIG1pZ3JhdGlvbiBpcyBkb25lIGZyb20gdGhlIENQVV9EWUlORyBu
b3RpZmllciwgb24gdGhlIGR5aW5nDQpDUFUgYmVmb3JlIGl0IGNhbGxzIFBTQ0kgQ1BVX09GRiwg
YXMgUFNDSSAoREVOMDAyMkYuYiA1LjUuMikgcmVxdWlyZXMNCmFsbCBpbnRlcnJ1cHRzIHRvIGJl
IG1pZ3JhdGVkIGF3YXkgZnJvbSBhIGNvcmUgYmVmb3JlIGl0IGlzIHBvd2VyZWQNCmRvd24uIEF0
IHRoYXQgcG9pbnQgdGhlIGR5aW5nIENQVSBpcyBzdGlsbCBpbiBjcHVfb25saW5lX21hcCwgc28g
c2tpcA0KaXQgd2hlbiBwaWNraW5nIHRoZSBuZXcgdGFyZ2V0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBN
eWt5dGEgUG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQpSZXZpZXdlZC1ieTogVm9s
b2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPg0KLS0tDQp2MTEtPnYx
MjoNCiogbW92ZSB0aGUgb2ZmbGluZSBwYXRoIHRvIHRoZSBDUFVfRFlJTkcgbm90aWZpZXIsIHNv
IElSUXMgYXJlIG1pZ3JhdGVkDQogIGJlZm9yZSBQU0NJIENQVV9PRkYNCg0KdjEwLT52MTE6DQoq
IGNvbGxlY3QgUkINCg0KdjktPnYxMDoNCiogbWFrZSBjcHVfbmV4dCBzdGF0aWMgdG8gYmFsYW5j
ZV9pcnENCiogbW92ZSB0aGUgb2ZmbGluZSBwYXRoIHRvIHRoZSBDUFVfREVBRCBub3RpZmllcg0K
KiBtYWtlIHJlYmFsYW5jZV9pcnFzIHN0YXRpYw0KDQp2OC0+djk6DQoqIHJlcGxhY2UgQ09ORklH
X0NQVV9IT1RQTFVHIHdpdGggQ09ORklHX0NQVV9PTkxJTkVfT0ZGTElORQ0KDQp2Ny0+djg6DQoq
IGNoZWNrIG9ubHkgZXhpc3RpbmdzIEVTUElzDQoNCnY2LT52NzoNCiogcmVwbGFjZSBpZmRlZiB3
aXRoIElTX0VOQUJMRUQNCg0KdjUtPnY2Og0KKiBkb24ndCBkbyBhbnkgYmFsYW5jaW5nIG9uIGJv
b3QNCiogb25seSBkbyBiYWxhbmNpbmcgd2hlbiBjcHUgaG90cGx1ZyBpcyBlbmFibGVkDQoNCnY0
LT52NToNCiogaGFuZGxlIENQVSBvbmxpbmluZyBhcyB3ZWxsDQoqIG1vcmUgY29tbWVudHMNCiog
Zml4IGNyYXNoIHdoZW4gRVNQSSBpcyBkaXNhYmxlZA0KKiBkb24ndCBhc3N1bWUgQ1BVIDAgaXMg
YSBib290IENQVQ0KKiB1c2UgaW5zaWduZWQgaW50IGZvciBpcnEgbnVtYmVyDQoqIHJlbW92ZSBh
c3N1bXB0aW9uIHRoYXQgYWxsIGlycXMgYSBib3VuZCB0byBDUFUgMCBieSBkZWZhdWx0IGZyb20g
dGhlDQogIGNvbW1pdCBtZXNzYWdlDQoNCnYzLT52NDoNCiogcGF0Y2ggaW50cm9kdWNlZA0KLS0t
DQogeGVuL2FyY2gvYXJtL2lycS5jIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspDQoNCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMNCmluZGV4
IDE5YmI2ZjJmNjMuLmJmZDQ3ZjdkYzAgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMN
CisrKyBiL3hlbi9hcmNoL2FybS9pcnEuYw0KQEAgLTE2Niw2ICsxNjYsNjYgQEAgc3RhdGljIGlu
dCBpbml0X2xvY2FsX2lycV9kYXRhKHVuc2lnbmVkIGludCBjcHUpDQogICAgIHJldHVybiAwOw0K
IH0NCiANCitzdGF0aWMgdm9pZCBiYWxhbmNlX2lycShpbnQgaXJxLCB1bnNpZ25lZCBpbnQgZnJv
bSwgYm9vbCB1cCkNCit7DQorICAgIHN0YXRpYyBpbnQgY3B1X25leHQ7DQorICAgIHN0cnVjdCBp
cnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQorICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7DQorDQorICAgIEFTU0VSVCghY3B1bWFza19lbXB0eSgmY3B1X29ubGluZV9tYXApKTsNCisN
CisgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsNCisgICAgaWYgKCBs
aWtlbHkoIWRlc2MtPmFjdGlvbikgKQ0KKyAgICAgICAgZ290byBvdXQ7DQorDQorICAgIGlmICgg
bGlrZWx5KHRlc3RfYml0KF9JUlFfR1VFU1QsICZkZXNjLT5zdGF0dXMpIHx8DQorICAgICAgICAg
ICAgICAgIHRlc3RfYml0KF9JUlFfTU9WRV9QRU5ESU5HLCAmZGVzYy0+c3RhdHVzKSkgKQ0KKyAg
ICAgICAgZ290byBvdXQ7DQorDQorICAgIC8qDQorICAgICAqIFNldHRpbmcgYWZmaW5pdHkgdG8g
YSBtYXNrIG9mIG11bHRpcGxlIENQVXMgY2F1c2VzIHRoZSBHSUMgZHJpdmVycyB0bw0KKyAgICAg
KiBzZWxlY3Qgb25lIENQVSBmcm9tIHRoYXQgbWFzay4gSWYgdGhlIGR5aW5nIENQVSB3YXMgaW5j
bHVkZWQgaW4gdGhlIElSUSdzDQorICAgICAqIGFmZmluaXR5IG1hc2ssIHdlIGNhbm5vdCBkZXRl
cm1pbmUgZXhhY3RseSB3aGljaCBDUFUgdGhlIGludGVycnVwdCBpcw0KKyAgICAgKiBjdXJyZW50
bHkgcm91dGVkIHRvLCBhcyBHSUMgZHJpdmVycyBsYWNrIGEgY29uY3JldGUgZ2V0X2FmZmluaXR5
IEFQSS4gU28NCisgICAgICogdG8gYmUgc2FmZSB3ZSBtdXN0IHJlcm91dGUgaXQgdG8gYSBuZXcs
IGRlZmluaXRlbHkgb25saW5lLCBDUFUuIEluIHRoZQ0KKyAgICAgKiBjYXNlIG9mIENQVSBnb2lu
ZyBkb3duLCB3ZSBtb3ZlIG9ubHkgdGhlIGludGVycnVwdCB0aGF0IGNvdWxkIHJlc2lkZSBvbg0K
KyAgICAgKiBpdC4gT3RoZXJ3aXNlLCB3ZSByZWFycmFuZ2UgYWxsIGludGVycnVwdHMgaW4gYSBy
b3VuZC1yb2JpbiBmYXNoaW9uLg0KKyAgICAgKi8NCisgICAgaWYgKCAhdXAgJiYgIWNwdW1hc2tf
dGVzdF9jcHUoZnJvbSwgZGVzYy0+YWZmaW5pdHkpICkNCisgICAgICAgIGdvdG8gb3V0Ow0KKw0K
KyAgICAvKg0KKyAgICAgKiBPbiB0aGUgd2F5IGRvd24gdGhpcyBydW5zIGZyb20gQ1BVX0RZSU5H
LCBiZWZvcmUgX19jcHVfZGlzYWJsZSgpIGRyb3BzDQorICAgICAqIHRoZSBDUFUgZnJvbSBjcHVf
b25saW5lX21hcC4gVGhlIGJvb3QgQ1BVIGNhbm5vdCBiZSBvZmZsaW5lZCwgc28gdGhlcmUNCisg
ICAgICogaXMgYWx3YXlzIGFub3RoZXIgdGFyZ2V0Lg0KKyAgICAgKi8NCisgICAgZG8NCisgICAg
ICAgIGNwdV9uZXh0ID0gY3B1bWFza19jeWNsZShjcHVfbmV4dCwgJmNwdV9vbmxpbmVfbWFwKTsN
CisgICAgd2hpbGUgKCAhdXAgJiYgY3B1X25leHQgPT0gZnJvbSApOw0KKw0KKyAgICBpcnFfc2V0
X2FmZmluaXR5KGRlc2MsIGNwdW1hc2tfb2YoY3B1X25leHQpKTsNCisNCitvdXQ6DQorICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsNCit9DQorDQorc3RhdGlj
IHZvaWQgcmViYWxhbmNlX2lycXModW5zaWduZWQgaW50IGZyb20sIGJvb2wgdXApDQorew0KKyAg
ICBpbnQgaXJxOw0KKw0KKyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdV9vbmxpbmVfbWFwKSAp
DQorICAgICAgICByZXR1cm47DQorDQorICAgIGZvciAoIGlycSA9IE5SX0xPQ0FMX0lSUVM7IGly
cSA8IE5SX0lSUVM7IGlycSsrICkNCisgICAgICAgIGJhbGFuY2VfaXJxKGlycSwgZnJvbSwgdXAp
Ow0KKw0KKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KKyAgICBmb3IgKCBpcnEgPSBFU1BJX0JB
U0VfSU5USUQ7IGlycSA8IEVTUElfQkFTRV9JTlRJRCArIGdpY19udW1iZXJfZXNwaXMoKTsNCisg
ICAgICAgICAgaXJxKysgKQ0KKyAgICAgICAgYmFsYW5jZV9pcnEoaXJxLCBmcm9tLCB1cCk7DQor
I2VuZGlmDQorfQ0KKw0KIHN0YXRpYyBpbnQgY3B1X2NhbGxiYWNrKHN0cnVjdCBub3RpZmllcl9i
bG9jayAqbmZiLCB1bnNpZ25lZCBsb25nIGFjdGlvbiwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICB2b2lkICpoY3B1KQ0KIHsNCkBAIC0xODAsNiArMjQwLDE2IEBAIHN0YXRpYyBpbnQgY3B1X2Nh
bGxiYWNrKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmZiLCB1bnNpZ25lZCBsb25nIGFjdGlvbiwN
CiAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIGFsbG9jYXRlIGxvY2Fs
IElSUSBmb3IgQ1BVJXVcbiIsDQogICAgICAgICAgICAgICAgICAgIGNwdSk7DQogICAgICAgICBi
cmVhazsNCisgICAgY2FzZSBDUFVfT05MSU5FOg0KKyAgICAgICAgaWYgKCBJU19FTkFCTEVEKENP
TkZJR19DUFVfT05MSU5FX09GRkxJTkUpICYmDQorICAgICAgICAgICAgIHN5c3RlbV9zdGF0ZSA+
PSBTWVNfU1RBVEVfYWN0aXZlICkNCisgICAgICAgICAgICByZWJhbGFuY2VfaXJxcyhjcHUsIHRy
dWUpOw0KKyAgICAgICAgYnJlYWs7DQorICAgIGNhc2UgQ1BVX0RZSU5HOg0KKyAgICAgICAgLyog
UFNDSSByZXF1aXJlcyBpbnRlcnJ1cHRzIHRvIGJlIG1pZ3JhdGVkIGJlZm9yZSBDUFVfT0ZGLiAq
Lw0KKyAgICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19DUFVfT05MSU5FX09GRkxJTkUpICkN
CisgICAgICAgICAgICByZWJhbGFuY2VfaXJxcyhjcHUsIGZhbHNlKTsNCisgICAgICAgIGJyZWFr
Ow0KICAgICB9DQogDQogICAgIHJldHVybiBub3RpZmllcl9mcm9tX2Vycm5vKHJjKTsNCi0tIA0K
Mi41Ni4xDQo=

