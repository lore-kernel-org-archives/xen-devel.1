Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE19CCA490
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 23:46:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452718.1667407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHrcs-00088p-3s; Fri, 16 Oct 2026 23:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452718.1667407; Fri, 16 Oct 2026 23:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHrcr-00088h-Tr; Fri, 16 Oct 2026 23:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1452718;
 Fri, 16 Oct 2026 23:46:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xHrcq-00088b-Ls
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 23:46:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHrcp-002KNF-Ua
 for xen-devel@lists.xenproject.org; Sat, 17 Oct 2026 01:46:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ad2b72b-8faa-0a2a0a5109dd-0a2a4507cddc-8
 for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2026 01:46:11 +0200
Received: from [40.107.162.91]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ad2b743-b4ea-0a2a45070019-286ba25b1f6f-3
 for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2026 01:46:11 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DU4PR03MB11084.eurprd03.prod.outlook.com (2603:10a6:10:5f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 23:46:09 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 23:46:08 +0000
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
 b=eiB4Fovet63O+nFW2rvB9jfXf6ACGAxvs++fz7XQnuZY+59HjMiJNLFnyk+Cltug8UP3cK9W4Qg7zXX9g57iLpz5ZX9O7tKV7JkW0Tst6acCTDGHaJ8v28ZbAQ6fI/RR/jYfhcnxUgb5dXT1vQOL23vMeRvarvDiLAAGG4QeW50PwfQZ04iCa6F9h+ZQ/hu6J4o0w9ttwh9Z7pM98NPCZpSZZaOJjTBmEAsGGSs4c6P5XpG7Y4ujNTCYQrVO/NNxafIuZdR4+IOh6lTZWl+3LUrlDirdzYsfRJN/d9DKha7dvcPfS16ERi/myxHaBxGw7rV0zeUmMpJ+U607BJsF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTCy0pkM79qOAMYhPwHCq/VHMUiYVsH4lrrqGHveSG0=;
 b=Ot7tcpRDN2hbILdfnQcht89okkoosqQWm/EvoJ5YnNI3kN+edHS1tc0N50psE9cL+meTBMvCvxyIw/Xd6c2g7CVyJqshDuK3U4g7+gm53A8AN8SI2qMFZp5dymQEqKVKIgdXVp+epXGJr2tbeMXGbZT9HtlGxci1ZesjVQ2/7LfGd8eFpx6EZoNtTu0FFmJBvtgS61DlA69a7aCKPqvbbOe3An2kHD7otK1c1XyC1gCa6U+WeoEmE80OXJH6PKKwVzxKtYsVpuDI49nNS/871Tvt6XdhjTzJxX48EK7LbyLWFqW/vB03kle6d0LPkqkDg6xG2GwJkgQXrdY/h3B/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTCy0pkM79qOAMYhPwHCq/VHMUiYVsH4lrrqGHveSG0=;
 b=YCT/lXUHXJ33yvPu/TBKp+hnqRtH9FxS+oeTWdP7ouJDOc8bT3ZjmppmX0yeJuTnuazQIwCKv1dRgMWrKDS6T/nL/qqv3Uko/3SX0QO250815J5LfYZ2REEzN3NWf0E7SG73Tzqx6978M2VIznu/Z79DNRRKwV5FYxqH26eWMSxK16cNIXTWEf5A6Zt4Mw8OBySIHkc3fg/4jSPymBxRo6KnPm0fYgMw3XX85BI4M6z0NT5j9kLkGMkByjAwzm1cdlWb1t203LIcn82/0TmywKSwV20jJ3Uy9K7JGeZZDnC/6WoQ7d/lyM4dMX4hkEIML8BQDaff0J2Vm7MoR3Y9Sg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Index: AQHdLu5n5DTKasDPakWayAUOcTtpgw==
Date: Fri, 16 Oct 2026 23:46:08 +0000
Message-ID: <87o6ctus3l.fsf@epam.com>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
	<70484b3362f3b816bf4ed5f70c374c198a8a6eea.1787042017.git.mykyta_poturai@epam.com>
	<87bj9q84w5.fsf@epam.com>	<6b106b71-cc16-420e-9466-91246fc06dc6@epam.com>
In-Reply-To: <6b106b71-cc16-420e-9466-91246fc06dc6@epam.com> (Mykyta Poturai's
	message of "Thu, 8 Oct 2026 08:48:43 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DU4PR03MB11084:EE_
x-ms-office365-filtering-correlation-id: 0f995c87-5d83-49d6-db01-08df2bdfa6a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|23010399003|366016|6133799003|56012099006|22082099003|10067099003|18002099003|260925021311599003|260925021911599003|260925022911599003|38070700021|4143699003|261009223027099003|11063799006;
x-microsoft-antispam-message-info:
 lM0fUpUKjNndao/QAzHfXRxEUy/2M1mAOHocj4wP+8P0Q0GJp1RaexNfONNGyWT6z2Tls/VwUUhB6jGySlHKa29FQWJ4b2cje+nt+jLoMzWl62rmWR1zjH6wZKElsI9gArCMSDgo3OhVfHAtqN9R86OKWZ7oMX5xyecfl9Bhw+1VjthxfpHE+aIUBy7DBudcuVkFTNlEQ0jl+hderudul4bYO4DzKV+zhYYMI3AJz7+KcceOmiqqifemlh9STCifqT6yiNwU8Q6cDxzoFiC4dDubMfu/QjTiVkrTfFiMR4YtEsuY1aZyAsckC1+avICO12/NfK6gr+IYQZl8wdhFR0vsbyVMhR5yOrg+DhxJNoO3sevlNGroAPb6hvtw20JBvT22bKXgIKgN9E7jd7JidG0jpezEhQJH3x9TnuedJjTzcaLuH1moN9ID2o8326TDuJ5MXYVED/jsA+drACgYct7MqmR8MVrbvvmrD4dzHeobkapxP2njr27MD/6DzBpXHPU+7TZCmLqjIKQoWguuOAu4L0v0x2iMdQRq6viLHl8lbtG41gB5TQubhUc9SzTWyDZVGZVEjrDgd2FrvNFTCgFSjCqNo7t+XUIbwC+PWkNypNtxVxwVRbqn/Z0PWRhM9sNXMBwqzusi7zfDyNUTLqHqxFtv3nQFtjRh3UEXZsSE3z240ua1FWKi+Yv948/RF3oWgdbDskC2BY/RvO2nzmWnbU1HonFdYMnMIFqMpQg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(23010399003)(366016)(6133799003)(56012099006)(22082099003)(10067099003)(18002099003)(260925021311599003)(260925021911599003)(260925022911599003)(38070700021)(4143699003)(261009223027099003)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U1lQNWdxOUp6c1gySysranpXb2dVWTBkbTdOeks4MHltaEJJR3RZQUtYN0t2?=
 =?utf-8?B?TExwWGNuTDBTVUM5azFhTFkxNUhBVkxPS2pGSWt2dlZjeUxtS1l2c2xTeG1U?=
 =?utf-8?B?MmdXWnNSVllNbTJNWTZ0OVlGQlZZbVJWd05WQjV3QnIzUEJvVHVVS0w1akpG?=
 =?utf-8?B?K3NMdEV2Y1RtM0pzVHVldEZBRHpqcXBlNzk2SGRxb0VuOG1kNHpndisxZjR0?=
 =?utf-8?B?M2dTb1poTGEzb1Rrb1N5SEtYRUdYZ0F3Q1FaMmNsWUFPR0lhblVJeWpKMEUx?=
 =?utf-8?B?VkhTTDAxbTZoOUpqVDNGZ0cyTWR5L2VnZ1l6b0t5RGpKNHFiQnV0QXNMbDdD?=
 =?utf-8?B?SDQ0ME5DWXYxTG9qNGxTS2xwMzA4b3F4eW0zdklFMnNNR3VXUUI0K2FPQVBa?=
 =?utf-8?B?Mm54OVc0WUpFNW1WRlBSNlZrSVVsRUNFR3ZrQ01nMHhDbzRuQ3Vyd0hpNEZ5?=
 =?utf-8?B?MU82ZmhCRUhUeTBHbVVtSDNmVVQ5T2RJUUpxczZRdmc1dCt2L28vTHFHSjBT?=
 =?utf-8?B?QVExb0IxME1FOXdYR3ZuMTF2SlplNzc2NkJTcTlST3RtUWVuNllNZm5QeXVv?=
 =?utf-8?B?RkloMzFRSGk3Z29TcG5qQ1hGSVExS1RBZExGaUk2V0N0Y0ZGeE90QmFzV2Qv?=
 =?utf-8?B?KzBZUXJNM3JheHp3blJSMGxOODFnS3RwcUlqUUFOZXhLRVNERmo2V2ttS1cx?=
 =?utf-8?B?TFZtQVpjOC9BRStML3ZpcVNtczUrMmNqRW9xMisxRE5PR3BqS2dpbjFaWkRY?=
 =?utf-8?B?Rmd3S0ZEamdCQ3QzZjNFZGtjQnJ2VmI4L1lwcWFkMkt1UG9PUWtwMzU5cHRN?=
 =?utf-8?B?MzhacWJ1YzhxU2YvS3M2ZjVFZGVkUTBrTDZJSzVseEFQaTdpWWZ4dDdGdWdx?=
 =?utf-8?B?bEd1WEN0MHpWeHRWaHYvaHU2YXZ2SXRybFVkVEo4YmwwZWYwUitGSlI3UWtx?=
 =?utf-8?B?YlRjU2U5NGhIVzNwWkJwZnZ3MVpPUDd3NmtySVdCNFZDcW1leDZ5c0FDbTBJ?=
 =?utf-8?B?TDdMTW00MHgydmZnT2lFd3c5K0VGbG9UYy9tNFNNZ0FxeDRUcDJmVFh6NGRR?=
 =?utf-8?B?OXRKMzZkcnNPWktpV3V4czY1TVlNcTRCYTMzN1FobEpRdXlzM2I0SFFFTmxh?=
 =?utf-8?B?YlA3cVI3L2xHK2FXUW0wMkhsSFlQU0dib1FoMGlUTDl0NjV3bnI1YkxEWVIv?=
 =?utf-8?B?UUR2M0h6OVRYWTV5bThvYm1TZG5mZTJqWFY2UXRaZEhUWlhaeklsZGo2QjMx?=
 =?utf-8?B?Qjc1UktnSndKdjdWNmlXVW43T2prQWQ2T3BOTzgydzBtMHJIRWlqQzBoWjRS?=
 =?utf-8?B?bDRrZ3MwWHJNZWRUaGdWK2xDdDEvbHBuY3gxQjNlcW54WDQzdlZVd29kemJQ?=
 =?utf-8?B?Q3QyTXdheGZ1RG9oZGlFNyt3dWZOZzY3RGtWdmFWbnpsY01tNWowcklNeFdX?=
 =?utf-8?B?RWJDMDJ4M3BFOWxWRVhYQXNCWFZNQXBYOFVOOG1hTGJJOHR4eXdINmNUdGhR?=
 =?utf-8?B?MGJrb2xMZSsxRXkxMjF5TFgxOE1lY2d6OSt2cmhGQXpoek10cU9ZcEVzS0tZ?=
 =?utf-8?B?ODRHckV0MGFTTzkrUU40RFIzbjBRTy9hQ2M3MHU5d2psek1jdEo1ZkJXRk42?=
 =?utf-8?B?UDdZZWhXNjl6dm1LSzdhUTJIUlNWZkhkSk5VKzlmbks5MG9kQ2w5QzBkUWJZ?=
 =?utf-8?B?WWpQTkNtd2JhQ3BOVTFWbzVHdFVySS9UVEZNS3NwaGNOMWE0cG9ZdmN6ckdY?=
 =?utf-8?B?Qm9zemJhdmJjT0ZsOThyaXltVmFMTkNiVE1wWUZjaVpEeUMwL3YyZFNUanBL?=
 =?utf-8?B?eW55QVpyNWNYcnlIVkdIN1AydzIyNlU5aU1oOGxhNGtsL1pXNWEwOTFuQnhK?=
 =?utf-8?B?MjlrdDFKcFI3dHdxazJOZC96dENqbnZPWk1SSlBzYm5QRjRwbjNzRWlJNXRu?=
 =?utf-8?B?QW81SVFMU0J5d0FOakhkMkYreUUxVDBNaEhJMms5Q2tRUUQ1V2tHTUlLUWIv?=
 =?utf-8?B?WmtGWGJSN0VodTNlTkwxdERyMXRmOVIwSU9mZDRpUmM5RGxwbUJkQ1Aya3dN?=
 =?utf-8?B?MXNJVFlMMUpjaTV2WnVTdXR6UUdqUE05MkZNa3RKbXEvM1lWazcyRFFWR1JO?=
 =?utf-8?B?ZVJaei9ha3laNDlxSGhUVkM4MnNVT0c5WjhmZ2o2VXBTaHVHbXZsMkFiWGF5?=
 =?utf-8?B?V0lKTWtTRWtxa0VBL3ZBa1JuUGVDV2Z4cUxhQTdBQndtWURZaXNXYTltREt2?=
 =?utf-8?B?TlZHNHRCYzYwd0JudVBFMUZBZTRWMnhXNWVUeHRiOEs4Ni92aTZhaEVOY0g5?=
 =?utf-8?B?SlJRb1BDZ0lUWjNjS3hFQTdhY21TZlpaUzBxZlR5VTVlWVRTaVI0WHBoL0pV?=
 =?utf-8?Q?NGn3ztwaGOed1d1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f995c87-5d83-49d6-db01-08df2bdfa6a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 23:46:08.2862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nefjvrt6RFqxO59Eh/ZXxZ+1cq0qwuVflbGU1THqE14y5Gt1VvOtoORfltE+kd85Zq51QZKD9UlME6+vksQ5Akum7LdHeTfDKrrgGwPkJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB11084
X-purgate-ID: tlsNG-ef75cf/1792194371-A4CCFAE4-04AF2808/0/0
X-purgate-type: clean
X-purgate-size: 4772

SGkgTXlreXRhLA0KDQpNeWt5dGEgUG90dXJhaSA8TXlreXRhX1BvdHVyYWlAZXBhbS5jb20+IHdy
aXRlczoNCg0KPiBPbiA5LzIyLzI2IDQ6MTMgQU0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0K
Pj4gSGksDQo+PiANCj4+IE15a3l0YSBQb3R1cmFpIDxNeWt5dGFfUG90dXJhaUBlcGFtLmNvbT4g
d3JpdGVzOg0KPj4gDQo+PiBJIGhhdmUgYSBjb3VwbGUgb2YgcXVlc3Rpb25zLCBwbGVhc2Ugc2Vl
IGJlbG93DQo+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBNeWt5dGEgUG90dXJhaSA8bXlreXRhX3Bv
dHVyYWlAZXBhbS5jb20+DQo+Pj4gLS0tDQo+Pj4gdjgtPnY5Og0KPj4+ICogZml4IHR5cG9zDQo+
Pj4NCj4+PiB2Ny0+djg6DQo+Pj4gKiByZW1vdmUgc3VwcG9ydCBzdGF0dXMgdXBkYXRlDQo+Pj4g
KiB1cGRhdGUgY29uZmlnIG9wdGlvbiBuYW1lDQo+Pj4NCj4+PiB2Ni0+djc6DQo+Pj4gKiBhZGQg
dGVzdGluZyBhbmQgbGltaXRhdGlvbnMNCj4+Pg0KPj4+IHY1LT52NjoNCj4+PiAqIG5vIGNoYW5n
ZXMNCj4+Pg0KPj4+IHY0LT52NToNCj4+PiAqIHMvc3VwcG9ydGVkL2ltcGxlbWVudGVkLw0KPj4+
ICogdXBkYXRlIFNVUFBPUlQubWQNCj4+Pg0KPj4+IHYzLT52NDoNCj4+PiAqIHVwZGF0ZSBjb25m
aWd1cmF0aW9uIHNlY3Rpb24NCj4+Pg0KPj4+IHYyLT52MzoNCj4+PiAqIHBhdGNoIGludHJvZHVj
ZWQNCj4+PiAtLS0NCj4+PiAgIGRvY3MvbWlzYy9jcHUtaG90cGx1Zy50eHQgfCA5OCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5
OCBpbnNlcnRpb25zKCspDQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9taXNjL2NwdS1o
b3RwbHVnLnR4dA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9jcHUtaG90cGx1Zy50
eHQgYi9kb2NzL21pc2MvY3B1LWhvdHBsdWcudHh0DQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi40ZjYwNjhkYjMwDQo+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+
ICsrKyBiL2RvY3MvbWlzYy9jcHUtaG90cGx1Zy50eHQNCj4+PiBAQCAtMCwwICsxLDk4IEBADQo+
Pj4gK0NQVSBIb3RwbHVnDQo+Pj4gKz09PT09PT09PT09DQo+Pj4gKw0KPj4+ICtDUFUgaG90cGx1
ZyBpcyBhIGZlYXR1cmUgdGhhdCBhbGxvd3MgcENQVSBjb3JlcyB0byBiZSBhZGRlZCB0byBvciBy
ZW1vdmVkIGZyb20gYQ0KPj4+ICtydW5uaW5nIHN5c3RlbSB3aXRob3V0IHJlcXVpcmluZyBhIHJl
Ym9vdC4gSXQgaXMgaW1wbGVtZW50ZWQgb24geDg2IGFuZCBBcm02NA0KPj4+ICthcmNoaXRlY3R1
cmVzLg0KPj4+ICsNCj4+PiArSW1wbGVtZW50YXRpb24gRGV0YWlscw0KPj4+ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+Pj4gKw0KPj4+ICtDUFUgaG90cGx1ZyBpcyBpbXBsZW1lbnRlZCB0aHJv
dWdoIHRoZSBgWEVOX1NZU0NUTF9DUFVfSE9UUExVR18qYCBzeXNjdGwgY2FsbHMuDQo+Pj4gK1Ro
ZSBzcGVjaWZpYyBjYWxscyBhcmU6DQo+Pj4gKw0KPj4+ICstIGBYRU5fU1lTQ1RMX0NQVV9IT1RQ
TFVHX09OTElORWA6IEJyaW5ncyBhIHBDUFUgb25saW5lDQo+Pj4gKy0gYFhFTl9TWVNDVExfQ1BV
X0hPVFBMVUdfT0ZGTElORWA6IFRha2VzIGEgcENQVSBvZmZsaW5lDQo+Pj4gKy0gYFhFTl9TWVND
VExfQ1BVX0hPVFBMVUdfU01UX0VOQUJMRWA6IEVuYWJsZXMgU01UIHRocmVhZHMgKHg4NiBvbmx5
KQ0KPj4+ICstIGBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX1NNVF9ESVNBQkxFYDogRGlzYWJsZXMg
U01UIHRocmVhZHMgKHg4NiBvbmx5KQ0KPj4+ICsNCj4+PiArQWxsIGNvcmVzIGNhbiBiZSBkaXNh
YmxlZCwgYXNzdW1pbmcgaGFyZHdhcmUgc3VwcG9ydCwgZXhjZXB0IGZvciB0aGUgYm9vdCBjb3Jl
Lg0KPj4+ICtTeXNjdGwgY2FsbHMgYXJlIHJvdXRlZCB0byB0aGUgYm9vdCBjb3JlIGJlZm9yZSBk
b2luZyBhbnkgYWN0dWFsIHVwL2Rvd24NCj4+PiArb3BlcmF0aW9ucyBvbiBvdGhlciBjb3Jlcy4N
Cj4+PiArDQo+Pj4gK0lmIHRoZXJlIGFyZSBYZW4tYm91bmQgaW50ZXJydXB0cyBwaW5uZWQgdG8g
dGhlIHBDUFUgYmVpbmcgb2ZmbGluZWQsIHRoZXkgd2lsbA0KPj4+ICtiZSBhdXRvbWF0aWNhbGx5
IG1pZ3JhdGVkIHRvIG90aGVyIG9ubGluZSBwQ1BVcy4gSW50ZXJydXB0cyB1c2VkIGJ5IGd1ZXN0
DQo+Pj4gK2RvbWFpbnMgYXJlIGhhbmRsZWQgYnkgdGhlIHNjaGVkdWxlciB3aGVuIGl0IHJlc2No
ZWR1bGVzIHRoZSB2Q1BVcyB0byBhIG5ldywNCj4+PiArb25saW5lLCBwQ1BVLiBXaGVuIGEgcENQ
VSBpcyBiZWluZyBvbmxpbmVkLCBzb21lIFhlbi1ib3VuZCBpbnRlcnJ1cHRzIHdpbGwgZ2V0DQo+
Pj4gK3JlZGlzdHJpYnV0ZWQgdG8gdGhlIG5ld2x5IG9ubGluZWQgcENQVSB0byBwcmV2ZW50IGlt
YmFsYW5jZS4NCj4+PiArDQo+Pj4gK0lmIHBDUFUgYmVpbmcgb2ZmbGluZWQgaGFzIHNvbWUgdkNQ
VXMgcGlubmVkIHRvIGl0LCB0aGV5IHdpbGwgYmUgYXV0b21hdGljYWxseQ0KPj4+ICt1bnBpbm5l
ZCBhbmQgbWlncmF0ZWQgdG8gb3RoZXIgb25saW5lIHBDUFVzLg0KPj4+ICsNCj4+PiArTGltaXRh
dGlvbnMNCj4+PiArLS0tLS0tLS0tLS0NCj4+PiArDQo+Pj4gK09uIEFybTY0IGNwdSBob3RwbHVn
IGlzIGN1cnJlbnRseSBub3QgY29tcGF0aWJsZSB3aXRoIElUUywgZHVlIHRvIGFuIGlzc3VlIHdp
dGgNCj4+PiArdGhlIHJlZGlzdHJpYnV0b3IgYXNzaWdubWVudC4NCj4+IA0KPj4gSW4gdGhpcyBj
YXNlIHlvdSBwcm9iYWJseSB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0DQo+PiBDT05GSUdfQ1BVX09O
TElORV9PRkZMSU5FIGlzIGluY29tcGF0aWJsZSB3aXRoIENPTkZJR19IQVNfSVRTDQo+PiANCj4+
PiArDQo+Pj4gK09uIEFybTY0IHRoZXJlIGNhbiBiZSBwcm9ibGVtcyB3aXRoIEZGQSBpZiBzZWN1
cmUgRlcgc3VwcG9ydHMgdGhlIG5vdGlmaWNhdGlvbg0KPj4+ICtBQkksIGFuZCB3aXRoIFRFRSwg
YXMgYm90aCB1c2Ugbm9uLXN0YXRpYyBJUlEgYWN0aW9ucy4NCj4+IA0KPj4gQ291bGQgeW91IHBs
ZWFzZSBlbGFib3JhdGUgb24gdGhpcz8gQUZBSUssIE9QLVRFRSBoYXMgb3duDQo+PiBjcHVfdXAv
Y3B1X2Rvd24gY2FsbGJhY2tzLCBzbyBpdCBzaG91bGQga25vdyB3aGljaCBDUFVzIGFyZSBvbmxp
bmUuDQo+DQo+IEl0J3MgbW9yZSBvZiBhIHByb2JsZW0gd2l0aCB0aGUgd2F5IGludGVycnVwdCBo
YW5kbGVycyBhcmUgc2V0IHVwIGluIA0KPiBYZW4uIE15a29sYSBhbHJlYWR5IGhhcyBmaXhlcyBm
b3IgaXQgaW4gYSBzZXBhcmF0ZSBzZXJpZXMsIGJ1dCBJJ20gbm90IA0KPiBob3cgdG8gYmVzdCBz
eW5jIHVwIG91ciBlZmZvcnRzLg0KPg0KDQpBaCwgb2theSwgZ290IGl0LiBJIHRoaW5rIHRoYXQg
aW4gdGhpcyBjYXNlIHlvdSBhbHNvIHdhbnQgdG8gbWFrZSBzdXJlDQp0aGF0IGJvdGggdGhlc2Ug
ZmVhdHVyZXMgYXJlIG5vdCBlbmFibGVkIGluIHRoZSBzYW1lIHRpbWUuDQoNCi0tIA0KV0JSLCBW
b2xvZHlteXI=

