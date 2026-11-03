Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FDA606B12D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=NUqZ2ALt
Received: from list by lists.xenproject.org with outflank-mailman.1469431.1678239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlY-0000UD-J0; Tue, 03 Nov 2026 10:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469431.1678239; Tue, 03 Nov 2026 10:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBlY-0000U6-GA; Tue, 03 Nov 2026 10:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1469431;
 Tue, 03 Nov 2026 10:29:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xOBlX-0000Ty-80
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBlW-006iIf-DQ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:29:18 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b77c-8faa-0a2a0a5109dd-0a2a450becc6-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:18 +0100
Received: from [52.101.69.74]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae9b77d-b7e8-0a2a450b0019-3465454a5744-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:29:18 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVUPR03MB11404.eurprd03.prod.outlook.com (2603:10a6:150:35b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:29:15 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:29:15 +0000
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
 b=jepu+NwZbUm2HCnTqSskwC4HTKhQrfGxHYQAKlayMouon4llrif/p8gCn8jebljZLQ2RcIcM5Ri5t18oiE2jU3K9ByPKrreGUJi/z/XcXo8n1twONPkfuHJ9IvN7mn5RE1gOUCQjFTefst6I2AvnnSZJ2gWMMWcqjtW7JVf5DYbsk/P7I7nnMRU0sOpE+y2Vpu6jYvWVVKB5qTeLZRx2oKSsd+CA4N8jovEUxb19xJrjE7tSH6J0sd3Bq+/tV1G6C/T0hg9NtEAIKYjetfkn0WsRQgkL30ICoWmLRiXxvvdqjk5aVewR5f4XECJjF5hVHh+CDVs+uML3BGkM7GPHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7RawEqNR4EeE0XVmRpP8Agh0nsUlJTSg8eEocl3PtE=;
 b=hoUv5ZSHyp9F90sjq0/7BIxSilcIm1mM6c7payBLsFBCeKBaPDEL3k3+41avXSKU/4cLRofY7wc124HsJoHaQTxBv0jBO/9+Z7rV9J0HfLzLLQxbV0yCr0GBxEhYKk94jjekg+L44kiUU37UCI6Ulr0DB1j+kjIKN2rPfoANuY3gczMXKfOiVJb/PJttvv0QpwBXOJOs5yCD9YuVvLReflBkqefqDBhSozbp6uIsUKjg4oRMoGhvg1Jlx45yxDLtLSyFzbH8b5jnLj+M1HlujfylIFQrWL0W1+6X48kmb0PLQfnL52lXmazgOW3Ph0lCLHs8yp+osLmLwbCpvESNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7RawEqNR4EeE0XVmRpP8Agh0nsUlJTSg8eEocl3PtE=;
 b=NUqZ2ALt2eq9+tPMZVqxF55H5HWLAUrSf8jD31XphYvx9/saGzqRnluYwsNcEHsIjpneE0ON25e3yWLpGtakonYHrl6vX2PvxxjWGGZT1XLaLv+Rthittd5dA8MIUindENpTDRoq9WKt+b6HWBCU5M/K35vhwX8JUNPdwvHLsPNabETH3TcseGrXdWVPrcC3MAtmFpk3z5rU+ET2TUyTxlgSeXv5BcpdxaIMO2idGioA43KifMrAZv4ej1h6iz1UyY4uRj6cca3OCI7B+KlYUwXO6n/WIo+/abtzuUHjdK9Vg3xVoNSmSvJ/4GBEyl1c4y62cyK5uU5EA2KbVLInVA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/4] xen: address MISRA C Rule 11.8 violations
Thread-Topic: [PATCH 0/4] xen: address MISRA C Rule 11.8 violations
Thread-Index: AQHda34svJNUpbDbMki9nKAlagRptw==
Date: Tue, 3 Nov 2026 10:29:15 +0000
Message-ID: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVUPR03MB11404:EE_
x-ms-office365-filtering-correlation-id: 0c83b23f-1ad9-4783-2bc1-08df39954f6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|42112799006|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|18002099003|261009223027099003|261102123227099003|261021123027099003|261022105027099003|261021121427099003|11063799006|38070700021|261026121527099003|261026140227099003|261028144727099003;
x-microsoft-antispam-message-info:
 qNDDj17Sutm4k3jTPjOr3B046fbi7v9/nav7BBJ59WnoNTjMnFPiGlroZFB4jurzu2/VOmVro8o/yHcFsAo5DjTQrfHJnKGy8Gt6gT63CHmg7tjVgfCSYyMDz8hIm8skSNDBtaiIC+GjiQMbXPkJCRO8xBTFfwv5aLF0qvo3oC6uUyouZ9wJJ//EWFqaTRCxRKhVIvuOGvv5M5N7KbaBpua7M+BHI69dmMv33s+8B/H7xsslt9xM+OmSq/6g5PJBCRAn/svpYs6WcNofSEqVDmj+0p5IqQkaLRCfO6pMXH60vQEYg8cYh+ZTAYwxFK6dx+/Wk24fNGF3jAoAOQ2hXzzpS3llAJkUfbU4fwXyVSMdaZ43KV2zN9ZvCljdBJeNJkJvlCOr8+XPi89I2BBD4wmj6xWFz40xnCukWwm9eDJvL8J7/2SLoS/K7/lk/swMtW/i5TQyBlqGHwrI1gRkvPBIwVzl8Z0DPAmqyn5Og/MHl9XIz9hkgiePhr4g7JUG2Dxj2+dgMezV4h/8SelDd5K9giM/iP7pBz391Fn2IjcOPhJoR3COd0bfDpWJug8012xZScCNz70fwWVUbu7zkN6U/OPtdjUa3ae/j55qjm/d4bFLsjjL8h0jun4mTUyUvPdbKhYC6VI4MngK4ec/vgDA+fLaV8ExxLVkbVNGtIyjfgJ8gVtSQyQTVXIC3M05bv7MYWU5N0TABcLaWyXnQgmqskCP1uWASBS6J7kjX04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(42112799006)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(18002099003)(261009223027099003)(261102123227099003)(261021123027099003)(261022105027099003)(261021121427099003)(11063799006)(38070700021)(261026121527099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXJXbko4NnlmViswbmt5MFhOQUpzYTFHRzB0aEZ2RjV1eDVmZ1RKUktkc0lR?=
 =?utf-8?B?dUgwWXBYV2tNMnR3YXhOUjE2OFRuV1RwQi8wdWxZbFN2MElFTW5aTDRlczQ1?=
 =?utf-8?B?KzhpYUJkMURDeTBzWGl0aTIrTyszRTVuYTFDNVZybURuOWk3aHpKOUY5cGxL?=
 =?utf-8?B?ZXBXMFpxSWJXSzkyb1dJUkltbnphV3NuNFBiMHB5YzlDWDVqQzFoMFYySGhG?=
 =?utf-8?B?eGRrcHU4TjJQeHRvVVdFRitleVJVSU5BbmRUdC9OeERTWlhtUGJpZVBVZFVV?=
 =?utf-8?B?U3dSeUhSeW1oMVZsNldiaVFVeWV6aEk3V2xpQ1JFYWVZenJ2bFY4cU5Ga1Nh?=
 =?utf-8?B?Rm0yUmFtWjVhR1RyQlVMRU4xdmFiYzJHUkVsSDIwcjZjVFFGdyt5QjFoM3RZ?=
 =?utf-8?B?RWh6cTZ2VHRIYmhodEtMTDZxWFkxN3RFQXZlUW1oR3BGYnZMQXNVZno0MGRM?=
 =?utf-8?B?ZlZPamFVNGxuNUxXY3pxdXJtQUd6cllLaWppV0h4MDdSQXFJRUdBcDljMzJ4?=
 =?utf-8?B?SkE4YU02YnZDcUpsK1JCeXMyZnBFeEh0aXI1aVkzcm1OMXVRcXpQRFR0MDBX?=
 =?utf-8?B?MFBnVUhGTE5sbzdMMlVRTThjaE1PN1dmWjNOdkxndTZ5QStRSVFETmdJOHVT?=
 =?utf-8?B?OFlXdnpDbUZ2alpCSWZiKzAzUXR6bWhwRXRjdWF4RVY1MllZK1lIY0hNaFIy?=
 =?utf-8?B?aXJiVDdvZ1Z3TVczUHc3LzJ1TVRZRkRJZ1BFSDR2SllwNjhKTHRDTmhodWd6?=
 =?utf-8?B?VUdROTdGK001MXh2eThQbFMyM1R1bzhoOWtFdHpaK1I4cUJ0UCtMWjRIZkhi?=
 =?utf-8?B?SEZlbjR3RTBidVNBR0pXMG9sMXB3aDU2OHMxS1VtMGdYYkpSdm9LbDRycEU5?=
 =?utf-8?B?U09GeUZWbE1ieXFOODZuMlo0VXprdnRpRVB6ZjIralIza1RVeDYvd0hoRERk?=
 =?utf-8?B?TmZIckFmNWp2WC9qejhlVmRUZ05mWGJPSk16b045N1RaU2hTSG4zVm03Skcr?=
 =?utf-8?B?QXhZY2xBT2p4eXBoeUh3SEpwclFJVzMvdVF3cE5TTGNhSmhzZjhjYUZDbTZp?=
 =?utf-8?B?cktnY0oxaVdRS1RoTFBKOVViZmdSZU53ZlRyYVl0YTYxeEl3UmZTUzlMVG4y?=
 =?utf-8?B?MUg0bFZYemkxSUlCSXQxVllWbS9DM1pCa0RqU0ZvejA2V0VuTTJhZnZFdXVi?=
 =?utf-8?B?em13bVVBa2hkK2FkajdaR2xramk0Y0l5OThTcjRqZ2xjRXJ4dk8zUlNTdE9h?=
 =?utf-8?B?a2puWDY2SXc2Mll2cTE1WlMzR0RoS1ZNeXN1c1F5aFIyQzdkMG9YdGRDOW40?=
 =?utf-8?B?YkhJQ2xtd043MEY3Lzl2TWxDaGJxdmx6NnppQ05EZHF4SUhZOWZaM0tNTlVN?=
 =?utf-8?B?YmFwenphNkdZQlptRDVoREVhbU9BVlBZWmtIRDlaaFJmTkhzNCtTNGhuQnkx?=
 =?utf-8?B?NEJ6TVphSVdCQVhmS01xZExBd0RXYWtjemtvd3RBWG53NVF4bTBOMSs2MDI2?=
 =?utf-8?B?bk94d0ljcU5nTnFlQXVDcWVGWkgzaDlXM2ppeWZ0aHZhNi9TNW9jOHhlemFJ?=
 =?utf-8?B?cURlTDBHcmhoQUQxeDF3TDl0WmtGRU1oemRzMVJmS0Y3dG1ibFdRT1ZGTWk0?=
 =?utf-8?B?TXh3RVQ1QWQwODFMQnlJMWFOK0lMT0ZOTjFuTlh1K3RldWxabk9XZ3V2UnAw?=
 =?utf-8?B?eDJuTmtvYTNqK1dicE5GbW1XMWFoZlZEMkVWSWZxekJrY3g1bXRsWHFKMkh4?=
 =?utf-8?B?QUIxaDBXNXZrQk1hcEtmY1pSSXJkcExYRkFHSExxRHlVcCt3REhpazY3Mjlm?=
 =?utf-8?B?MDZheFh6cmtmSlY4MXl1ZmxTV3JwMEdkM2dLYVdHYW82TXBhWG93cmNYRHJE?=
 =?utf-8?B?MXNBQTI1NGhiRmx0TmdmTVFIVFJWK09BMTBWSElaYzR4MDVOaFZiMnJXY2VI?=
 =?utf-8?B?UTNETDRMR0d5T255Yzlhb1JpalRyU3ljblJqVTl1akJ5UW5BRTlSVmFhTXNO?=
 =?utf-8?B?cUZUTVFJdExmMk9aVGk3c0NLaUU3NjlFczVhemFnUUVhMFlMelF4Q1ZPSGR2?=
 =?utf-8?B?NWp1RHd4TEtiNW93T3ZIaW5FQ2NFZ2d3amdwN3JodjVxS0hiWDhVRGw2ZlVa?=
 =?utf-8?B?eWp6RUI1RVpUM2t6VGhzeWczWHFMMXE0S21KeWlITzZrTDBKYW1QMVZJY3kv?=
 =?utf-8?B?MjRLK3IwcVFzeEVXcHVLSXNqQmlsSy9rWkdhQVZBc3hFMjRZOEVxR3VSenRU?=
 =?utf-8?B?U3NZTDZEQ3VBeHVyZ3daa1Z4bjNIUlpzeVlKaG9FSHZKajlUekFjcSt1N3JM?=
 =?utf-8?B?SjhLM3kwVXpYSTlpamtGUGZ3U2s5RU5jNlZ4eTJNN0U2QzllWGlDaGg1VDI3?=
 =?utf-8?Q?qiPms4+gW1lydnjk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c83b23f-1ad9-4783-2bc1-08df39954f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 10:29:15.5301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlbYyjqlny592TRXrQ2Jz9+BffCkPRskSQklh5mQQB0iFxD6vW4A+1wGi9cXURhanDZzLzrMCkMltD1T1bcUfvxK/1Ad3o6OVlkrIDBUjSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11404
X-purgate-ID: tlsNG-42698a/1793701758-A94C39EA-3FAB0369/0/0
X-purgate-type: clean
X-purgate-size: 2136
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBzZXJpZXMgYWRkcmVzc2VzIGEgbnVtYmVyIG9mIHZpb2xhdGlvbnMgb2YgTUlTUkEgQzoy
MDEyIFJ1bGUgMTEuOA0KKCJBIGNhc3Qgc2hhbGwgbm90IHJlbW92ZSBhbnkgY29uc3Qgb3Igdm9s
YXRpbGUgcXVhbGlmaWNhdGlvbiBmcm9tIHRoZQ0KdHlwZSBwb2ludGVkIHRvIGJ5IGEgcG9pbnRl
ciIpLg0KDQpQYXRjaGVzIDEtMyByZW1vdmUgdGhlIG9mZmVuZGluZyBjYXN0cy4NClBhdGNoIDQg
ZGV2aWF0ZXMgdGhlIGNhc3RzIGluIGxpdmVwYXRjaC4NCg0KVGVzdCBDSSBwaXBlbGluZToNCmh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBya3A0ay94ZW4vLS9waXBl
bGluZXMvMzAyMTY0NTIxMQ0KDQpEbXl0cm8gUHJva29wY2h1ayAoNCk6DQogIHhlbjogbWFrZSBz
dG9wX21hY2hpbmVfcnVuKCkgdGFrZSBjb25zdCB2b2lkICoNCiAgeGVuL2FybTogYWNwaTogcmVz
b2x2ZSBNSVNSQSBDIFJ1bGUgMTEuOCBpbiBhY3BpX3hzZHRfbW9kaWZ5X2VudHJ5KCkNCiAgeGVu
OiByZXNvbHZlIE1JU1JBIEMgUnVsZSAxMS44IGluIHhlbl9idWlsZF9pZF9jaGVjaygpDQogIGF1
dG9tYXRpb24vZWNsYWlyOiBkZXZpYXRlIE1JU1JBIEMgUnVsZSAxMS44IGZvciB4ZnJlZSgpIGFu
ZCB2ZnJlZSgpDQoNCiBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9u
cy5lY2wgfCA3ICsrKysrKysNCiBkb2NzL21pc3JhL2RldmlhdGlvbnMucnN0ICAgICAgICAgICAg
ICAgICAgICAgICAgfCA3ICsrKysrKysNCiBkb2NzL21pc3JhL3J1bGVzLnJzdCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAzICsrLQ0KIHhlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWls
ZC5jICAgICAgICAgICAgICAgICB8IDIgKy0NCiB4ZW4vYXJjaC9hcm0vYWx0ZXJuYXRpdmUuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0NCiB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tDQogeGVuL2FyY2gvYXJtL2NwdWZl
YXR1cmUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tDQogeGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgICAgIHwgMiArLQ0KIHhlbi9hcmNoL3g4Ni9j
cHUvbWljcm9jb2RlL2NvcmUuYyAgICAgICAgICAgICAgICB8IDQgKystLQ0KIHhlbi9jb21tb24v
Y3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQ0KIHhlbi9jb21t
b24vc3RvcF9tYWNoaW5lLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysrKy0tLQ0KIHhl
bi9jb21tb24vdmVyc2lvbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQ0K
IHhlbi9pbmNsdWRlL3hlbi9lbGYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysr
Kw0KIHhlbi9pbmNsdWRlL3hlbi9zdG9wX21hY2hpbmUuaCAgICAgICAgICAgICAgICAgICB8IDUg
KysrLS0NCiAxNCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMo
LSkNCg0KLS0gDQoyLjQzLjANCg==

