Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB01CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 16:07:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442536.1660092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUAR-0001HA-WD; Wed, 07 Oct 2026 16:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442536.1660092; Wed, 07 Oct 2026 16:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUAR-0001H3-Sm; Wed, 07 Oct 2026 16:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1442536;
 Wed, 07 Oct 2026 16:06:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEUAQ-0001Gx-RD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:06:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEUAQ-00D9eH-3r
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:06:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac66e1d-bab6-0a2a0a5309dd-0a2a4506acfc-2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 18:06:53 +0200
Received: from [40.107.162.87]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac66e1d-195a-0a2a45060019-286ba2576a2f-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 18:06:53 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by GVXPR03MB618890.eurprd03.prod.outlook.com
 (2603:10a6:150:3a8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 16:06:50 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 16:06:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHBwVMQREhQ15uoSCmR6T9WmCBTpmWof16i92QAM4w/8vKs9lb/3Nv19Fj95B2Y7JzKizMfYRDwCBitm+S+lk231zFEn4XR/suJfqmQ9itUsb1WN2Q/7F3WaSbPRvp8WpEtC5Bmi81Dut8zAeLYsCk2rOHG6lVw+pBO8AppFYZjTUtVWqznzL095RAbjJ13ZF9oLs5zqnn9BjrGFG1czthuUGPPJ4TOdUlCAXE+Gmio7Y3Km8pDP4ANjs12/dpja6vgUw9krfbMEUmOJjxwCWMHcoTnWXZCeCH5L6cBS6l/rhp6Qte4R2x6pmfGZWJriFqKIFF84awedbM0+2GqY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5SFiT6sE6nHK4ZZuS7tB8MC18Q0At9FgX0U3zXzrO4=;
 b=th3Ke+5QGls+F7aq4FD4M2eN2aq1cLOlAQPTTiU2RNnNQsMmiAvtYcLxhp3soQstBn+dg0JGYjC7oHyQ/BY9QP8Hww1HQnG0bXaGoiTcUrairzGljk3DdVDDm1I0/g7JviPkoMo4BMMS0SVo+u1cyK8EWEzPMRAD2neLPpjoUajH2YKM8GDQGTVIyGyXh8GPWc9Yy+Tro7/yBZ7YVI7hASbe3HIluWHok0dbzgMiXuUyTkFdqG0iPUCWTB/kzq5b10NwQ2MM+VPheU2x974H7zH4gfOwleLqrJB1KSCH+7OdEqW+GcKV939kq7uOs5vLVL2v5yyU2GSadJ+6atw5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5SFiT6sE6nHK4ZZuS7tB8MC18Q0At9FgX0U3zXzrO4=;
 b=PpKqsvFZ1RKtXqhusOb9vN5WhWvx0+XNdXg20kYr0WezQ8akSaMDKKBKI/wkcUgLaDzqa6ttppN8My7kiaNDeBokxkV00lW+HGB2ch0L6tDeITH4QT1vAYBJd1x3crAJR7uiH7+XfDALOdiFeaEwIp6uY7jlvGJwj21VlKH3vIMpk2MTcQHjdqt3P45ayGo00REKxp2rbyZjS3LvU1jAhYRdlSll/afi/RDLYKF8cA73JqKg7Kg+24kdYlg3M/32UOXOnJaqD2rF+zUX5Yhnxft2Soegvp7O2D2o9vHV0CCdYN48FN9ajSe3j+boy1ElhMBwVK61mFpeOIPw5nKzZQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/6] x86/PV: adjust APPEND_CALL() to comply to Misra rule
 18.2
Thread-Topic: [PATCH 1/6] x86/PV: adjust APPEND_CALL() to comply to Misra rule
 18.2
Thread-Index: AQHdQFsRwAlF7v7XhUCFnbTczq2eTLbyawGA
Date: Wed, 7 Oct 2026 16:06:49 +0000
Message-ID: <62d12b18-7413-4f65-9182-d410d3093140@epam.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
 <cad11ffe-43fe-4a0e-b890-2e2838170e97@suse.com>
In-Reply-To: <cad11ffe-43fe-4a0e-b890-2e2838170e97@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|GVXPR03MB618890:EE_
x-ms-office365-filtering-correlation-id: 1dff950c-8dc8-4f9e-a32f-08df248cfedc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|42112799006|1800799024|56012099006|4143699003|10067099003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 oXebRXSpzUAbtlAFZmiWouicqvc30FG8rTQrd9o8h7Ao63p/9I+zOlnL4v16E8lhGm/mJVbs2d+S991pRLuaUWkzouy80TLdI49uXEn/dikREC1rGRE2QarapWXNoOEeMf7SikJymC9zPFMirK4futeI2hMdXDR0LH51Rh9Xg9rsftOU4kPsfTqB7mUeVRruz8yWfBb3m6QkmXYkZ1jua35mV/JQLo7wrCirB4PEYbmljTrJAUtDtV9Ay06dvJW3KG6yGQ5leMjwVOdN3Efo6gbwHzIWynj3vG/tPaV1e9roEN1P/9bfVZjNYHDULF5eEV1cXeTLMrcv67PrlCq7A1bC6UMdDUx5jUogmMcm2wnEbMqFhrlJStUimblYgY2cBXKDCbUygb8MeXhQsVoWA6q1d3AkUqdqlBEg+mXA2f8o9XkKVZCl3vFhz8HTHNj/qB+5AlOrOBT0nnMn4350AyR0MDTmqL0zlfKMxrqeWTGTIhqunGx8fi38qF0e/so8L4aMjyP9FaCrcyNrlcvLnXQFt2locXgiWhl+bqn2w2zaZItyqroWIeyvaguASrqEO+MwoLxnwQ/+367XWjsylfwl4PC+hUltD3PP06lortJpW3p61WpfMT8CSVZmjAlgBX2jid4SLqMzT8XnUHxOzYiXbMWoyddrrO0mpxHKsM1cL/Ua/f5LIAvBtsnCQCbosoUadGWz4SlgkQV2BkTytlIIMIOWaWbE5Awn5JOxnEw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(42112799006)(1800799024)(56012099006)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEtuSVp5M3RFYlNUSmZ5S0hRcEpEOCtQc21UUnE0bW5QT1RKU3hHM3hIVjF0?=
 =?utf-8?B?emNwUmY2M2h5UDk5M3ppdUZIYnE3TkJYbWNhdmRPSWUyN0VCNGJ4TWE4cTNB?=
 =?utf-8?B?a3dlemNlRWhTak9oMFNRZWlJSVV6dmtsODRpQnA4c3JjcjBYNm9wblBrZDNL?=
 =?utf-8?B?czZ2c1FkTENHWU0wVjdONUU2RDJuR1liNW1VNDFCSHMrZUIraUtBUHpVcGJW?=
 =?utf-8?B?Yk1USHVsa3drOXB3ZDdjQy9OWVlvaURFZzdES2JFOFVmN3FZTUh6T0lQbW91?=
 =?utf-8?B?NnpEd0pCMFljT2QyeDBwMnFLcFRKWmpacHFRNEtadDVwN2JuZ3JzZ2lWcXBW?=
 =?utf-8?B?bm9FSVVpVkZQOTVTQ1NvOXFvMGE4SHVtdS9kTnVsVitMdCtlV0d2NzJPQnhY?=
 =?utf-8?B?dlZ5cXpnRHVwckVSdXQvc1dCV3ZrdWp3UGhuVFg0ZGszRVFOTjdTOVZFWWhL?=
 =?utf-8?B?RDJ3M05DWTFjRS9iQU9pZXNlRUdqUEpycTFkdzZkVFB6VGxkN2o5ZC9mQWE2?=
 =?utf-8?B?NDhXN2xMSlNyaWcxTnBhenM2cCtFd1haZEs2NUJwOEc4TnVNZit4QWMvd2dZ?=
 =?utf-8?B?bXZLR044eDhaQmlvditHdjBBVEdraU9Icmo1N1Y5SWxFNWsrbjllb3pDRUVK?=
 =?utf-8?B?TndSMFdtSUxCZS9hMllhcGpsTmZRbDZnMDVLRE02RjBrcFYwS0pvWEg3OWlj?=
 =?utf-8?B?R25ZNER5TE5pQ1N1UHUvYW03VVJPdHMwNFNFUFcvNU5iVGVNUDB3NG9IQWd0?=
 =?utf-8?B?cjZEam5CYXkrSThhdk5PMmg0V0oyZjVBamprdkhXaEg0T1hYMFVrRWs4eDlp?=
 =?utf-8?B?czRwUzQvQnpuOFRTcVFNZ2dEbkw0WHpCaFNUcHdCY0lQeU8vbEJBMHV5eXZp?=
 =?utf-8?B?ZVhYQTdoM2UyKzVSdW1CUEwxS0JCZ0FWcmdQeWpKTUtkNDJHdE1RdjZrMXc4?=
 =?utf-8?B?RWZ1VlJka0RMNkN4bnUxQ09DSm1YUDArTVFKUDRkUjJkamh5LzZBYngyMkJ5?=
 =?utf-8?B?eWhMZGZMTW16WjhDWXdDNmdVbG9PblJyWFRQV2tVSVlESmY4M01tRmNBM0VW?=
 =?utf-8?B?L2xjSDQ1bGNJeFppRGZic0RxYlR1MlFCdTUwS2FMMGhkTGo3a1g1RlVHdWNm?=
 =?utf-8?B?SzFhVWFUM21xVlNta0pOWldKeWVpRXFVWnVuTFk1T3Z3T2VySGxSRGFIR0hr?=
 =?utf-8?B?REp3OTZ6NG1VSGFvN0JSMWxtY1Q0N2NncUJmVTJvVnozOGdWbWpLZmJubGN6?=
 =?utf-8?B?aG1FU08rWTZlcFc0ZU8yTUxwbTdlanJSdkZaTmIrTUNZdHF0YUE3d3JlbDVt?=
 =?utf-8?B?N1pmLzNjUERrYk96Zmc0R1ZhMTUyNzBBdGc0QTJHc2NPeDdWQWVYT29rNHVX?=
 =?utf-8?B?a1JPVm10UXoxL2JaR2VmY1RwRTdTT2E0VlJNTWlYaDZZOHY2UzNVMllEVnpa?=
 =?utf-8?B?RFowWGlNVmNXdXE2bzVQazZjU2R5VjRTSFE0TVJ5bU9aMG9WT1pNQVBzTitR?=
 =?utf-8?B?RjY0ODMyaE80RjlaUEV5TCsvejg0Q3A1SFFqM2ZNMEFTODFTdW8wTm0wMmpB?=
 =?utf-8?B?L1dGVTJMMEY5ZTRta3Z4aXlhMDhzZWx3ZzVxRUU0bHR4ek9oY1VoOVNSSkdz?=
 =?utf-8?B?SXJCeW8zRnRpL0F5T0RaVWJJVWdOTXpKQU54aUIvVTFXUDNIYWY2VllFaXVy?=
 =?utf-8?B?eUNhdStRUGFQR0hkaUdZZWpDck8waXNYTlFZQlFOeTdmYzJLWnBXcWc5STNl?=
 =?utf-8?B?WTlxUUR0YnUxeDg0V2liaXJta2ZJOFdObVBZL0IvQmVoWTAxV2Z4by9IamRD?=
 =?utf-8?B?SkpNRHg5elBYR29MeFRVLzVnaWg1aWdVWVBUNlVMcEtPbWNkTzJUT0VxZk9Q?=
 =?utf-8?B?b3VPTDdJbVp1dEdlaDUvRVVTZG16WlQyUkJZdVJod0tTVGJMcTFzOW44RlY3?=
 =?utf-8?B?S3hjUnlEdUEvenVqeE0rTEJYb2h3VTBWTTRUTVQyYkFpWVhLak82S3hSYmZO?=
 =?utf-8?B?SHZ5ZVdsN1Y5L01ORjh1RHV3L2dUZ3FhM1RZRFhwQ2h4eVN0aXRnaXZaZzIx?=
 =?utf-8?B?M3dKOGpPdmprL3dDWkkyZCtjcVljSjZ2QmtyY1JVd095aElJSlVsS3M0ands?=
 =?utf-8?B?eTZGcndKOUNZQkNkV2JRZEpXQWpaVHNmR1JTaCsrUlJIQ1RKS1IvU2NXdGt0?=
 =?utf-8?B?UVA2dkZQWXJGSi9vSTR6cFhOMkxSSmtMQWpVTW1wU0xWd2xaUENacGZpSmxr?=
 =?utf-8?B?YmFuWE5zdHRoeFN1WkZBZUplUVZTdjVqeFN0cWU1b25HYTdUNURLU1VZZjZk?=
 =?utf-8?B?Zk9Zc0hvVlRyYkJHbXN5V1Z2VDE4ek1MVCtNaytDTmtyRjFSb0Mzb2JCUjJ6?=
 =?utf-8?Q?5w8fmFlZuig+cj9c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E85B772EDF04468DC025755CC27D73@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dff950c-8dc8-4f9e-a32f-08df248cfedc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 16:06:49.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BnzBBWNO+5JizOv6DNlTxxKKM2PgHo6TWMFj888uinNMWWj1HjlgRafUPlduVAJxLQEmmP76fuxPhISAyqsi8FzAGr/tdWI3iH1Y4D5/zKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB618890
X-purgate-ID: tlsNG-16d1c6/1791389213-FE27077B-37E24A42/10/78276251493
X-purgate-type: spam
X-purgate-size: 1964

DQoNCk9uIDkvOS8yNiAxNTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlIGNhc3Rpbmcg
dG8gcG9pbnRlciB0eXBlcyBtYXkgYmUgbW9yZSBuYXR1cmFsIHRoZXJlLCB0aGUgc3VidHJhY3Rp
b24NCj4gdGhlbiBlbmRzIHVwIHZpb2xhdGluZyAiU3VidHJhY3Rpb24gYmV0d2VlbiBwb2ludGVy
cyBzaGFsbCBvbmx5IGJlIGFwcGxpZWQNCj4gdG8gcG9pbnRlcnMgdGhhdCBhZGRyZXNzIGVsZW1l
bnRzIG9mIHRoZSBzYW1lIGFycmF5Ii4gVXNlIGxvbmcgYXJpdGhtZXRpYw0KPiBpbnN0ZWFkLg0K
PiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBEZXBlbmRzIG9uICJF
Y2xhaXI6IHJlbGF4IGxvbmcgPC0+IGZ1bmN0aW9uLXBvaW50ZXIgY29udmVyc2lvbiBkZXZpYXRp
b24iDQo+IHRvIG5vdCBpbnRyb2R1Y2Ugb3RoZXIgdmlvbGF0aW9ucyBpbiB0dXJuLg0KPiANCj4g
LS0tIGEveGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9wdi9lbXVsLXByaXYtb3AuYw0KPiBAQCAtOTIsNyArOTIsOCBAQCBzdGF0aWMgaW9fZW11bF9z
dHViX3QgKmlvX2VtdWxfc3R1Yl9zZXR1DQo+ICAgI2RlZmluZSBBUFBFTkRfQlVGRihiKSAoeyBt
ZW1jcHkocCwgYiwgc2l6ZW9mKGIpKTsgcCArPSBzaXplb2YoYik7IH0pDQo+ICAgI2RlZmluZSBB
UFBFTkRfQ0FMTChmKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPiAgICAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgbG9uZyBkaXNwID0gKHZv
aWQgKikoZikgLSAoc3R1Yl92YSArIChwIC0gY3R4dC0+aW9fZW11bF9zdHViKSArIDUpOyBcDQo+
ICsgICAgICAgIGxvbmcgZGlzcCA9IChsb25nKShmKSAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICAgICAgICgobG9uZylzdHViX3Zh
ICsgKHAgLSBjdHh0LT5pb19lbXVsX3N0dWIpICsgNSk7ICAgICBcDQo+ICAgICAgICAgICBCVUdf
T04oKGludDMyX3QpZGlzcCAhPSBkaXNwKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXA0KPiAgICAgICAgICAgKnArKyA9IDB4ZTg7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICooaW50MzJfdCAqKXAgPSBk
aXNwOyBwICs9IDQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQoNCkxHVE0u
DQoNClJldmlld2VkLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVw
YW0uY29tPg==

