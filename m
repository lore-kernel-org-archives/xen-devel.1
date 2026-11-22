Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEAE606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=YBB47vA6
Received: from list by lists.xenproject.org with outflank-mailman.1499750.1696398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVAot-0004LE-CI; Sun, 22 Nov 2026 16:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499750.1696398; Sun, 22 Nov 2026 16:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVAot-0004L6-8l; Sun, 22 Nov 2026 16:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1499750;
 Sun, 22 Nov 2026 16:53:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xVAor-0004Kv-Ki
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 16:53:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVAor-0011U6-11
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 17:53:37 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b031e01-2eae-0a2a0a5409dd-0a2a450be51e-6
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 17:53:37 +0100
Received: from [52.101.69.106]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b031e10-b7e8-0a2a450b0019-3465456aa008-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 17:53:36 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB9PR03MB9712.eurprd03.prod.outlook.com (2603:10a6:10:451::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 16:53:34 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0639.011; Sun, 22 Nov 2026
 16:53:34 +0000
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
 b=BlyYGw1Q2cQnt0MuWX5SwIwc9dQfkxyMoarvMZYLo1zFz1EBNOdHF91D59UmYAcP7mTwmJbL0iV7bAPx/MV5viN6wsgJWV8BJBO0GmAJXdt19jnYbZUufZbwVvim7LNnknpsyMSfmKjlg+Ij+seLK6Xe4vH9bEvG5vuH7VgWjlGf7GTqtkDDyw+8ZwjDgDEvPOWCopTGvFKiz8x28tBInRIdm4wErweWVx5rWME09HF+qcdsCFySrKL+6a9QKey598xseQ+c+FMa34UuXEn/IFw8paGG8hOWhXf2J9ztX4FWMg179+tBRXa/EGBEwmVkEXhij0ITyb3q7851QeCBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkDBF1CTxnSXrBSIqR1c9SMz3PtmcZDzhFNiAkQZ2E8=;
 b=JhIk9KszKA3kcf5vnkb5XYedRbjjqh1oZiu0v8yPOHE4hspG28upJFsjxgdgDninittKMnDxGKVV/O114hcgoaEl0Vpds7Vkbao0y/woGm2FONih4lPVMgxkAd5/K/42WrsiA4MPe09L4FQjSOHiHmMOlmsbaaK7zbAWYMIAhCPZrm5mb7L7RHIh9ENcPN+qK35WJvE0HEgcTarCKVtD0SDlgu+0z/LXtiLs61znvB+iMaKZwTepHh73W3eW5Th025lrq/2wK66NiXAPrN8HvUPI4a3cHn7EzGMVvpvvsVzXHMS4upFnDDw3Te0sPKhLjTIkmuTJsR3cQ2nS1axwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkDBF1CTxnSXrBSIqR1c9SMz3PtmcZDzhFNiAkQZ2E8=;
 b=YBB47vA6AvG1zvtav5lvhLWa6ZxGw0vqj7l+uMPqWnp194T3GhBG232j8w2kGT44S4rSbxqa+eW3L8GE0njRTOrLVmDwSTbbDO74lKe1Ddt3QWbRmU531+W0qpZxpcqt9tmGFg8SnZiAewDFgSsbWOi678Nrks2DQYNPApN1iFv2aeCEVA6IyAPQpin3tZF+6pEXhB5G4lpsXaP3vOLCEPzyDTrjip/h1MYaUfKXCAkPQYKosIn/eKmcENr7FBe4Gq/luCcP0SpK8db8JfBQvmouucqE20aR7lpVS8Kt3y9r8fcAs9cQBgsGSZj9heqICSgrS0pdYFBRb/vgG4kBfg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] PCI: initialize SBDF without casting away const
Thread-Topic: [PATCH v2] PCI: initialize SBDF without casting away const
Thread-Index: AQHdeqIC3nwGz5PvKUKiqmQO+EeUyg==
Date: Sun, 22 Nov 2026 16:53:34 +0000
Message-ID:
 <b5d5894ad6243b23ecf44dd4181ef244a967ee28.1795365039.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DB9PR03MB9712:EE_
x-ms-office365-filtering-correlation-id: 335e89d0-61b0-48d2-de4b-08df48b92581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|42112799006|38070700021|10067099003|11063799006|260925022911599003|260925021311599003|56012099006|260925021911599003|261009223027099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003;
x-microsoft-antispam-message-info:
 svjyL0kRUupjZVu6oea6L/IsHd9C7OPyenl/p8CuIN7QupHbzlOl6XYrk4ZkStR8vEUnGBL3rISo7M598Y91qLCYrE05yvW+rnuw+gyykA5RGvu6Ja5psGUpuTam+W7UY39Cv4mFvODSfRLmEjqmL9MNIefySmDt9APF8oeJqN8YMExcitMSx7OmhVAa53AEcuH9/Mol59uVxcM1hBDYIbQAzCL7sBxntYRk56vJKRFVwgacrE8zOmspNPu3OK+yl3l56+wP9Daey9fA7YtUvD1B/cLHDprMzmwhTQDOrTqThMVgSjl5xKdjEYIlE88e/FdIXO+of8ssy8/4+9G1U2djBiOqmJhsnaA//m1EL7tcHGZMuKxVyTyzdMQa2mBU7Pz22YExpPLvcXtiVSupj3HHk63nbP3TTloAEG4PL9IHmJk8A+coHyymHoI22dsDoZ8TOlRq7cPt9sO3823QCznChxxsaHcdEAwQqK2XfHOYX9+sngOaVB7wqAA+qXHlk2uPssztc0+Iqol5lR3jb7UsEw6AgzWOKg89tRAOcWg4fkD46aJ/T7JsCjSUj0DXqbCCaVy3UpKMQmTBT4cVAJb+Szl/QZ7l22+LTR1KVZNS6E8gHOlBL/5fE1fCOqKc8n2WBwk92evC6jtvpaXfKiXm5trTlMGQKVmdJB8gDDw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(42112799006)(38070700021)(10067099003)(11063799006)(260925022911599003)(260925021311599003)(56012099006)(260925021911599003)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1NTUTZMZTFHRHVLOFFYb1ZJUk1UbFpNSnpTLzByaXppSnpkSWsvRWxxak9F?=
 =?utf-8?B?YU5XS1FOL2xGeWIrR1poRWs3NUNvYWowekNkZ1pPc3REaXo4STJ1QmxhblBN?=
 =?utf-8?B?cmRXSjRHcUp0YzlydlFKRmhORmR2N3gyTFdlNUFoanVJUXY4ZkR4L0hDWmJG?=
 =?utf-8?B?NEFFdVpOSmJNZHE4b1daR1VOdldMbzRlYmEzOXI2bSt3dWZvRy92TjNueDlo?=
 =?utf-8?B?L1B3aUtnOStqNC9jRnhITjd1U1JVOWgvL1N6Q0xTeHhpc3FIemloR3RKSVRw?=
 =?utf-8?B?UzJaWDdZOHBwVG9USFdYN1dnaGVSakdHdE9kS0JZY09OajNFcjlNYXhCOXNP?=
 =?utf-8?B?TlJTNVZrTm5ndVdOVHFNbEU5VjNscjQxNitSMno3akhnRnY3YnYrUDRXcUFq?=
 =?utf-8?B?YmZNczFGY1hrNkRNbmJQSW1uVTRVZnVUdi9iNjJGallsU2hMNmFObndzOEoz?=
 =?utf-8?B?eVpRNWhneTVuR2VwVmNLNHZnbVkvVHlTd2JkU3pmdVBmMnZlRFpqUWREaENH?=
 =?utf-8?B?U0wyTTlCUk1nM2dMTDBmN0NmNVZGUitqN2VQdWpmTFI2YnpyVTVCVCtybmNt?=
 =?utf-8?B?Vkw0bkVoRVU3WWE0UWRlOE9rMVdaWkpTSEpSc0JGT3ZKRDBWZ3VaQmRxaXVK?=
 =?utf-8?B?OUsvZityTWZSY003Lzc1RDF3alRpdTNDdlBQN3VIYUIzNjJ1N2FEdXVqNTBJ?=
 =?utf-8?B?VDhpeElyZDJKdFU3ck5ia01CaEc0TWQ0NUtXSlBXOTFNYnovREhqanF6VzY4?=
 =?utf-8?B?UEJvSDFlZUNkZDJRTEQrdXVxa2N5UWNVSGlZd3ZWanliYSsyS00zdThGOVVt?=
 =?utf-8?B?V0NPK0I3RVlkaFdRMWthZmNiV3VVeTVldVdqUGFkVE1HdGJyaEFidDRHdUFO?=
 =?utf-8?B?M240NmpVUElSV3p1K2FyUEFVMEVtc00yZys1QlI2RHBKemNvMDNTL1RuVlMv?=
 =?utf-8?B?dVhqekVjeEJYeHJybURWM3BtWTNYVzFlYU1jZkpoWnIxU1ZaVU1PM2RYNXFq?=
 =?utf-8?B?YjJlRjlUejFGRlN1aXhGcTh0eUQwQW9pd2l4QzNnQmRmTTYzNnh4a2ovS2hB?=
 =?utf-8?B?dlB0SENKV015QW9kU2thZkppM1BPMXBsZGs2ZnZRcFFUNjFoMFNIWE9zdVdH?=
 =?utf-8?B?bjZldkdZM3NHdThKWHVuREJzVDdLNUk0YkVYckVZeHpTQTFLczloeDZrZ3NV?=
 =?utf-8?B?VElCRUlQeExKMzg4UTVOMnRDM3NwYUhybXFnQ2VENDlwd1ZBclIwL3BodUI1?=
 =?utf-8?B?MkgwN0twY2krUHdPdXo3WHFKcmlTNFBsZkJrcGpzbmRjZGdWZUljc091Q21m?=
 =?utf-8?B?R281T3kzWEZ4Qlh1cUk3YVBWSldEeE1XUjE0RjZmZnYwL0ZhVzRZOVdSenY2?=
 =?utf-8?B?ZUwydVlXMWVOWHF5ZU9MelUxVlpPZEN6NWdEaGprUGdPcGZSbGxmeVJmNkoz?=
 =?utf-8?B?aWF3RU9Wc1NQNGo4QjkvbnU5N0tNWFlVR0NxU0F2MHdXcVJCeHNOc2hWVzEv?=
 =?utf-8?B?ZUpMZ0RVYldwUGhEcU1vZXNoZCtaRE5ydEhSemcrZHNudkxmRW5Wek43MXNH?=
 =?utf-8?B?WS9TcTE5MVBxTWNPQUsyWTJLUERFRTJad09vdkFlc0VYZW8vbEtsRkNybmkv?=
 =?utf-8?B?NERibWlQNjY4WmcySHhLMFFRcUJRZnAwbXAzRVVCTkltYW84MkptWEpFWm1Z?=
 =?utf-8?B?YnJpOGNmbWRtZmRzNXNXU2xUVFk3eEFMVklPa0w3dHB4Slc2RUI4UitpMmti?=
 =?utf-8?B?ejBOdmV1MVNKcnhzdzRISG9RbFd4anp3QUpLMG1sVmxqcnc0eGUwalluMjUr?=
 =?utf-8?B?bTRTcWFzcENkNitFaFB3cVFGeHlOcjN0WllSQWR1WGcvcFNmVjFuRnRUUjdo?=
 =?utf-8?B?UWFQSkwrQkhZWnE1L0ZHWjROdmRlK1lYREpKSzZwM0RsemtvVklTeGpnbG1O?=
 =?utf-8?B?bjF1VjNGT210dnhtTStPRVcxdWhNRXpHY3ZpaElDOWtSRWYza2xRTmRFOEQx?=
 =?utf-8?B?YUtoWmNCdVlHbmZGYURzMGRQSXpuNExvNFRjTUl1dnl4d1ppNGJPdXFGeXEz?=
 =?utf-8?B?NnFzWFZoWTJOM3NpNVpFbldsc0NKOUNCNTNHdDdidWo1Z0RxeU9GRTRQWG9D?=
 =?utf-8?B?TG9QTitmRUJLY2RnTVNJdHVSdnYxWVFxSGU4UWN1QnkwVVhqL3NQUFpHN0t6?=
 =?utf-8?B?TEpKNGhEL0xzcG4rUVhsNGVFbmJIUkdwTXRvMGM4ZlJnZnpmZTJkQmJ2K3Q5?=
 =?utf-8?B?ZVIwN0tMTkxiZWM3RHRFcUxITmxSTkRtUFFRWWpzalRqSWhuQ0JmSTlDanJT?=
 =?utf-8?B?MUQvVVhONTlQbjRnWDlSb1RXK0JhSWg0TU9GdlNmd1R2UTFPeU5wWTZVNms1?=
 =?utf-8?Q?fEoim9hV0o665vWY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335e89d0-61b0-48d2-de4b-08df48b92581
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 16:53:34.4709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: orvSpfKWILirNC3fPCGBx49A1mVMQNnZY/lsAqDy3LLi8T7htXgwxRgWo0okS0CwhNI5UYJYJjWdU02g4wiPjCHj7BHXSC5nmrZcRn3i+nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9712
X-purgate-ID: tlsNG-42698a/1795366416-A8ECE9EA-15D149B4/0/0
X-purgate-type: clean
X-purgate-size: 2580
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDExLjggc3RhdGVzOiAiQSBjYXN0IHNoYWxsIG5vdCByZW1vdmUgYW55IGNv
bnN0IG9yIHZvbGF0aWxlDQpxdWFsaWZpY2F0aW9uIGZyb20gdGhlIHR5cGUgcG9pbnRlZCB0byBi
eSBhIHBvaW50ZXIiLg0KDQphbGxvY19wZGV2KCkgaW5pdGlhbGl6ZXMgc2VnLCBidXMgYW5kIGRl
dmZuIHRocm91Z2ggY2FzdHMgdGhhdCByZW1vdmUNCmNvbnN0LCBiZWNhdXNlIHRob3NlIGZpZWxk
cyBhcmUgbWVtYmVycyBvZiBhIGNvbnN0IHVuaW9uLg0KDQpEcm9wIHRoZSBjb25zdCBxdWFsaWZp
ZXIgYW5kIGFzc2lnbiB0aGUgd2hvbGUgU0JERiBvbmNlLiBUaGF0IHJlbW92ZXMNCnRoZSB2aW9s
YXRpb24gYW5kIHJlcGxhY2VzIHRoZSB0aHJlZSBjYXN0cyB3aXRoIGEgcGxhaW4gYXNzaWdubWVu
dC4NCg0KTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJv
a29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KLS0tDQpUZWN0IENJIHBpcGVs
aW5lOg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1hcHJrcDRrL3hl
bi8tL3BpcGVsaW5lcy8zMDk5OTU4MjkxDQoNCkNoYW5nZXMgaW4gdjI6DQotIGRyb3AgdGhlIFNB
Ri0xNS1zYWZlIGRldmlhdGlvbg0KLSByZW1vdmUgY29uc3QgZnJvbSB0aGUgcGNpX2RldiB1bmlv
biBhbmQgYXNzaWduIHRoZSB3aG9sZSBTQkRGDQoNCkxpbmsgdG8gdjE6DQpodHRwczovL3BhdGNo
ZXcub3JnL1hlbi9lZDA2Mzg2ZGYzZjVhZTQ4NWE0MDllOGMwYmVkMTBiMDFkN2ZkMzNkLjE3OTQ5
NDgwOTEuZ2l0LmRteXRyby5fNUZwcm9rb3BjaHVrMUBlcGFtLmNvbS8NCi0tLQ0KIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgNCArLS0tDQogeGVuL2luY2x1ZGUveGVuL3BjaS5oICAg
ICAgICAgfCAyICstDQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQppbmRleCA1Nzg0NzJkMDY4Li5jYTRkNjMxZDhk
IDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQpAQCAtMzI5LDkgKzMyOSw3IEBAIHN0YXRpYyBzdHJ1
Y3QgcGNpX2RldiAqYWxsb2NfcGRldihzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgdTggYnVzLCB1OCBk
ZXZmbikNCiAgICAgaWYgKCAhcGRldiApDQogICAgICAgICByZXR1cm4gTlVMTDsNCiANCi0gICAg
Kih1MTYqKSAmcGRldi0+c2VnID0gcHNlZy0+bnI7DQotICAgICooKHU4KikgJnBkZXYtPmJ1cykg
PSBidXM7DQotICAgICooKHU4KikgJnBkZXYtPmRldmZuKSA9IGRldmZuOw0KKyAgICBwZGV2LT5z
YmRmID0gUENJX1NCREYocHNlZy0+bnIsIGJ1cywgZGV2Zm4pOw0KICAgICBwZGV2LT5kb21haW4g
PSBOVUxMOw0KIA0KICAgICBJTklUX0xJU1RfSEVBRCgmcGRldi0+dmZfbGlzdCk7DQpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQppbmRl
eCBiN2EzNTM3MWE3Li44M2NiYjk2ZGIxIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUveGVuL3Bj
aS5oDQorKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCkBAIC0xMDksNyArMTA5LDcgQEAgc3Ry
dWN0IHBjaV9kZXYgew0KIA0KICAgICBzdHJ1Y3QgZG9tYWluICpkb21haW47DQogDQotICAgIGNv
bnN0IHVuaW9uIHsNCisgICAgdW5pb24gew0KICAgICAgICAgc3RydWN0IHsNCiAgICAgICAgICAg
ICB1aW50OF90IGRldmZuOw0KICAgICAgICAgICAgIHVpbnQ4X3QgYnVzOw0KLS0gDQoyLjQzLjAN
Cg==

