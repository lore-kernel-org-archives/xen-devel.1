Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E187CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:22:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446941.1663070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZec-0002kV-Du; Tue, 13 Oct 2026 10:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446941.1663070; Tue, 13 Oct 2026 10:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZec-0002kO-B6; Tue, 13 Oct 2026 10:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1446941;
 Tue, 13 Oct 2026 10:22:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGZeb-0002kI-BC
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:22:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZea-009DtT-Nw
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:22:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ace066f-bab6-0a2a0a5309dd-0a2a450a8410-6
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:22:40 +0200
Received: from [52.101.83.82]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ace0670-f2d2-0a2a450a0019-34655352d1f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:22:40 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by GV2PR03MB11212.eurprd03.prod.outlook.com
 (2603:10a6:150:301::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:22:35 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 10:22:35 +0000
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
 b=LP5YT+LY/TlxlGnDvW4TIegZ6Me7DQ1+dxKPzd5bwyC1ovthYhrQvor8nO1rFItPZ1jzaQWi10dOWC+nELL7ALSDce+ht3qVO+RFHFG9txRiBkIXENw784bEw0ouzCyElAB7FK9p1o4krB639Lq/WGpSVwgD6mq1LNCEgzzZJJ0hEWBMrm8hhymSHGJxVpj2zL6CnOizRGSD6id6MgS0YxIzqn4bUlZXq2nNytJSrjfhUapHOn70PTN1qCK29Dp6UlFHiwLybRlcy2lF/dPLrkWyETlhi6F61jTMWonyWag6HV/TSp1ETBaEcmtoUlrHIaxFumegAsgChHMMWiuEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk7XfF5vyuKqzJnWuw8EkW1cQgLzwf8lHA1FdW5LCrw=;
 b=Q8SO5Qyx0w1GwnaGWPRJ9zaaPyj5HMWjd5nRj6zgqxM3XmVtdIC4QY6V4700wTse1QIlGyw9tLf1vf8qG7bc4JyX5KEnr60NUpKeWq+wbP/qo2tXgxsezmcs2FNnTqC0dRwQI2dnvs9yNyjsnRocJ+qeoTMCIw8Qc5M4U4pKHRTJ5Ah8+GIhsvSSgyrfpq5cjYkbpbouLP4BkgmRzaInNTQWi+MjjybTBNYaTmoQReXSpEUKsl5svbzgqBNpRi8lqLkKpvwAWP10kEGuOgg6tM9S40ScHgFvt2a1zEOUze3C/yVlqbDOFvV0PVyWLtqA42jPssNTTt6BZqXxJNLe4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk7XfF5vyuKqzJnWuw8EkW1cQgLzwf8lHA1FdW5LCrw=;
 b=CJdpYpI/d08HXsrECOFNuXIy7oKQXmDaMzGyHKNSDn5P4+0oY18KIEgH3P6AAfWxMS/Sj+h3IPsV+hx4fhP8A4oHXEiIbSH+EgiM0U4EFvP9EbRlqf9NDaNssoJ3y2B+iGX70s82B8rCYLGFh1nOA85TW4TEH+vxTtUhgqktQjJX0qxcJD8li6+mCbPcn7PrYDvxF+XdXEPSCQBXt9j1y00116jGuSjS264JNEYnZu9XRrhnWypXi+4FjRFUCA9gG1YbDu3IoLlJ7B0TgfswjVzZ3qQcDqM60Hw1aYf8bI+Ir+WZPabNDCxb05F86rbSuwpmAestbdeboYVVPwX4QA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Topic: [PATCH v2] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Index: AQHdWuhYpZfkS0sLoEKj8O8bb8Y057b7HjgAgAAlfQA=
Date: Tue, 13 Oct 2026 10:22:35 +0000
Message-ID: <a1ea7238-b752-4afe-a72d-a92dcc67e195@epam.com>
References:
 <a1200bca22212f81bb2265b761a7de5fc91e798f.1791877354.git.dmytro_prokopchuk1@epam.com>
 <0b68d552-1d90-48d1-bc06-76caf40e61f7@suse.com>
In-Reply-To: <0b68d552-1d90-48d1-bc06-76caf40e61f7@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|GV2PR03MB11212:EE_
x-ms-office365-filtering-correlation-id: 02c0d847-0007-45dc-bcca-08df2913e670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|7416014|1800799024|376014|366016|22082099003|10067099003|18002099003|3023799007|11063799006|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 UDykJuaLRuUiW/zZipb5A7h146IvTEhYnZ4Gsp5MofndoTslxRbvWUfKYiwXKLhMEijzYH4HlAUIjI7Xt0VKubxmDtVWgqiAKlWcQGLcpneKHsIDWukPYy6/AXLujThmyCph+7QsRn6T52StMuXsqr6Ko2R28tLzM041WwMtEzbthTHYzEocah37EmmZYTm0/bN4DhGHXDRasoNI/bbOrRG0v+hFi21PhchQigLvF7lwmo6zMMhJV0AuPyYUo6FRdmthZdSZYrhuu8vpPsOHBs3mU6Lp569f6U8/6ZSxz1JM2LfrP5PxsGa3w/iq3dxrjV6XQzsFJQYfJwR0UHsb/5HGSHwrMRkNwAKvZG1P4Npu3l3jiQynPXm1Gwk3hZ66JmYRSkn5bjNRUK7h/Uzjp35tS0T/wU/xNUpp0MuFskRpTXwaW0q9ZNROMI4Cb0tKGTs8DYmkUV0a86OFDurk9Q0Q1ui5oTVqaL49tcfiJZ0ldrrGHmLrgY79jmGT22wxBVT/GYdCjH0AT2wGs6DTwz9tbgF/xKWjJr0LXg0OLKZu4RZ6hnt1U61C3/RLTjYebfNzD+67F22lHnCjI9735xfq1m1dVC6BCZtw0PW1KRKMWvJ+SVWYO9lgmCkYYg3JJP1cTTbR0LgHCaCbzn4ZDsD5/dHmKrbsA+8+Z0i8ygq1mrqcUGesKj8ocIh29Q6Sr/C48RikRu4tzrerAH8uV9mXxjRmuAoW4ytwPxBllF4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(7416014)(1800799024)(376014)(366016)(22082099003)(10067099003)(18002099003)(3023799007)(11063799006)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHdENmpMdTI3bFNkMnFaaTFXbFRvOFFSaVhFT2dHS3hSb2lLdXhTSW50RFYy?=
 =?utf-8?B?bXRtNVpwd3k2RzQ2TmcvWHFObitDeVBrUGF0TWE3ZVNBdU4wUTlNaCttYlNp?=
 =?utf-8?B?SkZIVzRia0tRWE9uT1Zaam5DNHp3Tm82RzI5T2lEOUdud1M0TmtQNUZSbTc3?=
 =?utf-8?B?VXdXb1h2Z0hUUENTTk1CS3JteFN5QnlJVVcrcVRjR3NuaHdWVlpBdzZab3Z2?=
 =?utf-8?B?VkJjTkhwOXdTRVZkalIvOWJxU0FsOXJMRUxhaEd5ZDB5MDMyR0Y5QThSNXgv?=
 =?utf-8?B?amFaRFgzWWlKUjlzYytROFVjUVdHanhaSUcvMmVtUWE2ODV0eXZaeG13MGtT?=
 =?utf-8?B?Y3U1U1hHNktLNlhIR3ArZThSREM0dlRHMkZlTnRoTTVZdkczVFVWMERaRVBH?=
 =?utf-8?B?M2JJZDRUbzcya2ZWWjQwdDYwUCtlMHJ1NUJaTUNBUmVGeHFLbkwyUTRNMm9S?=
 =?utf-8?B?eitqMEhlU1I1OFhKQjNySEQ2VEhTNnFkNytNbEZuMW1MeERJclp1dFhib0lw?=
 =?utf-8?B?UWh3RWdsUGxoSm51Q0IvZUhrSHRWd3ZnMWx0anpZMGVrS3hZdHgxclRwN3Ny?=
 =?utf-8?B?T1pXVkYzNGJ1S3paRGNPaVFlZjN1WHhQRDBXNDhrSnE2M2FQRkIvazFIa2oy?=
 =?utf-8?B?bW4vRytUZGJua0pyNkZYakFaUi9wS3dieXNOeDEyN0xodEk5bmwxcEEvUlRS?=
 =?utf-8?B?QlFLaklBNHcxOW9QS1U0YTZuSDljREdodmk1VkIzMWlSMDhqVkM5YUJ3Rko4?=
 =?utf-8?B?RDZuRzhXWVAyaXpYYnhKdUZBRG44MkxOWWpZMVpsQnhpQ0tEUGx1b0RNRmxk?=
 =?utf-8?B?TFU5cUx1VTlVWS9TbUUzTHV2YlFBbnUrZ1pwYTVMM0FZT3FyS3k1R3A2bklz?=
 =?utf-8?B?YklWNkdxdTNEY01jYklzZ3Z2T1k1SzNzRnZyMGZjczdpQkZ4aVJKcDhVcDcx?=
 =?utf-8?B?cnMweXlDN29oQ1hWc1RqemwzdEpXaU1ZM05oQWx6b2lKZFpzMmwweFFvUEYr?=
 =?utf-8?B?Tnd0Qk1jZXJKZlBTZ3FLbUR3ZEJOaVBBb0pvRThpemdaK1BoUnM3NUQ4a3Rh?=
 =?utf-8?B?aTZZaFZ2V3RHSkhleEJid1hWQ0s0bStod1llL3N3elF0RFNJQ3Y2andOSDJZ?=
 =?utf-8?B?eXVYNnZ5UmVtY1JubGIybnpmdktvM2JEQnRPRjZ4dWdrOTl1T2pwWVI3SU54?=
 =?utf-8?B?eWlxcXg0Ympnbmh2QjdTU0ZsZHBsYVlXcktwN28rdzVSZUFuKzk4NVpRODFO?=
 =?utf-8?B?NUkybFEvVU9Rd2F1U3dJTGZOZk5KV1RmODVZSTYvbngwaEJtM1B5OWtUYTR1?=
 =?utf-8?B?M2Q5RzdYR3Q3VkcxdlJ1TkRSYzZyL0F3V1pERlMxVDEyQzF3M0VWdEpFZGZN?=
 =?utf-8?B?YzdDOGFCSS92YWduRE15Uk82MjN4bFBQK2ZRcmV4elpLdmR5L2xDQ2kwd0Ru?=
 =?utf-8?B?bUIvTmswTDRwK09Fc284VXhNNHZCVUxwRUdsRVltNjlVQmpoMytaN09RMlo3?=
 =?utf-8?B?djFPcnp2RmVkSXZLYk01VzNFWGdoa252Q1ZacG1UelU0RTFGRmtkYXBGdDA3?=
 =?utf-8?B?eUR1N2syK01yTkUvQWt3ZFFpVk4zUFhEaWRKZmRlZkIyWm1mL2lEQWxqbWRi?=
 =?utf-8?B?OGt3V0d0TFlLWXBvOFBFQUpPMzdMbWRDbDJNN0w5cUdFNmJ1a3VnOVRNbVJD?=
 =?utf-8?B?V2JZc1Ezc1Vwb04yOWYvY2dkbkdPZU0yM2w0YVVjRURvZ25NbCt2WXc5NHpt?=
 =?utf-8?B?cGFPNzEwaXFMN3MvT0ZpdEczQ3ZsNzhsaVFyTjRGM0RxQW1SVlBtRWJId2ZB?=
 =?utf-8?B?MVJxTnlsNmlkYjlJYlAzcDNiWGZUTmdZN2xya2t5ZnZSbXZkRHB4bEp1THJS?=
 =?utf-8?B?OFRmMGZGRHhYSXFnWHBtV09DYUN4VEdSRlhyQWdETTkybHVENHZYSDZ2TDBh?=
 =?utf-8?B?RVdmWmkxdEhhT2lEUFZzMEtTclNZckhVSEM4UjJBNmtSQTVkUnNUcnFBU2FN?=
 =?utf-8?B?YmZFSGR0UGFTR3JzL28wOFNFbmN2OGV1N3ZkNUJla1NsK1ZvT1E2bTFUQmh1?=
 =?utf-8?B?UWVocE85VW81UlA0L05YbGttNXRmdkE2bkRCYldvd0ovTlVLemE0ZDY4dXJq?=
 =?utf-8?B?ZGExQTZiak9RT3FTUVFjTE9xcHlHZU1NTHhYUXlxMk1MVTRVdmwvSTBVVE05?=
 =?utf-8?B?bUlQenJoTGJwYzg0disrYzl0WTdobkl1OFJQODhLREdOOEVtZWhiWFREYmV3?=
 =?utf-8?B?cWFCMXkydEFzNHAwLytDby9sOXl0WTNIdTFpN0E5TFNReURHQWJzRURrMEI1?=
 =?utf-8?B?SlpNaUlFR1hKek84MXYyelNmTkxoRGR4K21oY0pHRGUwdWxhL2FrYmMxS1pm?=
 =?utf-8?Q?riMzj0LlLTIme7FA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD3D77BA37FC2440B1D2672E58992A67@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c0d847-0007-45dc-bcca-08df2913e670
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 10:22:35.6711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVf3TJuTPNviHfvy2XIsbXhNuwTbIDAx8ncJh5VGukkd5ViIagiei8R/bA7AqtN1ABt0UPj8TSWnWZKMgzsnAmCR3mwursX49pzOoJo6ToM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11212
X-purgate-ID: tlsNG-4011c0/1791886960-512C8CFC-518CC11E/0/0
X-purgate-type: clean
X-purgate-size: 5026

DQoNCk9uIDEwLzEzLzI2IDExOjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMTAuMjAy
NiAwOTo1NiwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gLS0tIGEvZG9jcy9taXNyYS9k
ZXZpYXRpb25zLnJzdA0KPj4gKysrIGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPj4gQEAg
LTM5MiwxMCArMzkyLDEyIEBAIERldmlhdGlvbnMgcmVsYXRlZCB0byBNSVNSQSBDOjIwMTIgUnVs
ZXM6DQo+PiAgICAgICAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQo+PiAgIA0KPj4g
ICAgICAqIC0gUjExLjENCj4+IC0gICAgIC0gVGhlIGNvbnZlcnNpb24gZnJvbSAndm9pZCBub3Jl
dHVybiAoKikoLi4uKScgdG8gJ3ZvaWQgKCopKC4uLiknIGlzIHNhZmUNCj4+IC0gICAgICAgYmVj
YXVzZSB0aGUgc2VtYW50aWNzIG9mIHRoZSAnbm9yZXR1cm4nIGF0dHJpYnV0ZSBkbyBub3QgYWx0
ZXIgdGhlIGNhbGxpbmcNCj4+IC0gICAgICAgY29udmVudGlvbiBvciBiZWhhdmlvciBvZiB0aGUg
cmVzdWx0aW5nIGNvZGUsIHBhcmFtZXRlcnMgaGFuZGxpbmcgcmVtYWluDQo+PiAtICAgICAgIGNv
bnNpc3RlbnQuDQo+PiArICAgICAtIFRoZSBjb252ZXJzaW9uIGZyb20gYSBub3JldHVybiBmdW5j
dGlvbiBwb2ludGVyIHRvIGEgZnVuY3Rpb24gcG9pbnRlcg0KPj4gKyAgICAgICB3aXRoIGEgY29t
cGF0aWJsZSBzaWduYXR1cmUgZG9lcyBub3QgYWx0ZXIgdGhlIGNhbGxpbmcgY29udmVudGlvbi4N
Cj4gDQo+ICIuLi4gd2l0aCBub3JldHVybiBvbWl0dGVkIGJ1dCBhbiBvdGhlcndpc2UgY29tcGF0
aWJsZSBzaWduYXR1cmUgLi4uIg0KPiANCj4+ICsgICAgICAgVGhlIGNhbGxlZSBkb2VzIG5vdCBy
ZXR1cm4sIHNvIGNvZGUgZm9sbG93aW5nIGEgY2FsbCB0aHJvdWdoIHRoZQ0KPj4gKyAgICAgICBy
ZXN1bHRpbmcgcG9pbnRlciBpcyB1bnJlYWNoYWJsZS4gVGhlIGNvbXBpbGVyIG1heSBkZWxldGUg
dGhhdA0KPj4gKyAgICAgICB1bnJlYWNoYWJsZSBjb2RlIHdoZW4gaXQgY2FuIHNlZSB0aGUgbm9y
ZXR1cm4gY2FsbGVlLCBvciBpdCBtYXkNCj4gDQo+ICIuLi4gd2hlbiBpdCBjYW4gc2VlIHRoYXQg
YWxsIG9mIHRoZSBwb3NzaWJsZSBjYWxsZWVzIGFyZSBub3JldHVybiwgLi4uIg0KPiANCj4+ICsg
ICAgICAgbGVhdmUgdGhlIGNvZGUgaW4gcGxhY2UuIFhlbidzIGJlaGF2aW9yIGlzIHRoZSBzYW1l
IGluIGVpdGhlciBjYXNlLg0KPj4gICAgICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBmb3IgRUNMQUlS
Lg0KPiANCj4gV2hpbGUga2luZCBvZiBpbXBsaWNpdCwgc2hvdWxkIGl0IHBlcmhhcHMgYmUgbWFk
ZSBleHBsaWNpdCB0aGF0IHdlIHRvbGVyYXRlDQo+IChkZXZpYXRlKSBzdWNoIGEgdmlvbGF0aW9u
IG9mIHJ1bGUgMi4xPw0KDQpUbyBiZSByZXdvcmRlZCBsaWtlOg0KDQpUaGUgY29udmVyc2lvbiBm
cm9tIGEgbm9yZXR1cm4gZnVuY3Rpb24gcG9pbnRlciB0byBhIGZ1bmN0aW9uIHBvaW50ZXINCndp
dGggbm9yZXR1cm4gb21pdHRlZCBidXQgYW4gb3RoZXJ3aXNlIGNvbXBhdGlibGUgc2lnbmF0dXJl
IGRvZXMgbm90DQphbHRlciB0aGUgY2FsbGluZyBjb252ZW50aW9uLiBUaGUgY2FsbGVlIGRvZXMg
bm90IHJldHVybiwgc28gY29kZQ0KZm9sbG93aW5nIGEgY2FsbCB0aHJvdWdoIHRoZSByZXN1bHRp
bmcgcG9pbnRlciBpcyB1bnJlYWNoYWJsZS4gVGhlDQpjb21waWxlciBtYXkgZGVsZXRlIHRoYXQg
dW5yZWFjaGFibGUgY29kZSB3aGVuIGl0IGNhbiBzZWUgdGhhdCBhbGwNCm9mIHRoZSBwb3NzaWJs
ZSBjYWxsZWVzIGFyZSBub3JldHVybiwgb3IgaXQgbWF5IGxlYXZlIHRoZSBjb2RlIGluDQpwbGFj
ZS4gWGVuJ3MgYmVoYXZpb3IgaXMgdGhlIHNhbWUgaW4gZWl0aGVyIGNhc2UuIENvZGUgbGVmdCBp
biBwbGFjZQ0KaXMgYSB0b2xlcmF0ZWQgdmlvbGF0aW9uIG9mIFJ1bGUgMi4xLg0KDQo+IA0KPj4g
LS0tIGEvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4+ICsrKyBiL2RvY3MvbWlzcmEvcnVsZXMucnN0
DQo+PiBAQCAtNDM1LDkgKzQzNSwxMCBAQCBtYWludGFpbmVycyBpZiB5b3Ugd2FudCB0byBzdWdn
ZXN0IGEgY2hhbmdlLg0KPj4gICAgICAgICAgYW5kIGFueSBvdGhlciB0eXBlDQo+PiAgICAgICAg
LSBBbGwgY29udmVyc2lvbnMgdG8gaW50ZWdlciB0eXBlcyBhcmUgcGVybWl0dGVkIGlmIHRoZSBk
ZXN0aW5hdGlvbg0KPj4gICAgICAgICAgdHlwZSBoYXMgZW5vdWdoIGJpdHMgdG8gaG9sZCB0aGUg
ZW50aXJlIHZhbHVlLiBDb252ZXJzaW9ucyB0byBib29sDQo+PiAtICAgICAgIGFuZCB2b2lkKiBh
cmUgcGVybWl0dGVkLiBDb252ZXJzaW9ucyBmcm9tICd2b2lkIG5vcmV0dXJuICgqKSguLi4pJw0K
Pj4gLSAgICAgICB0byAndm9pZCAoKikoLi4uKScgYXJlIHBlcm1pdHRlZC4gQ29udmVyc2lvbnMg
ZnJvbSBbdW5zaWduZWRdIGxvbmcNCj4+IC0gICAgICAgb3IgJyh2b2lkICopJyB0byBhIGZ1bmN0
aW9uIHBvaW50ZXIgYXJlIHBlcm1pdHRlZC4NCj4+ICsgICAgICAgYW5kIHZvaWQqIGFyZSBwZXJt
aXR0ZWQuIENvbnZlcnNpb25zIGZyb20gYSBub3JldHVybiBmdW5jdGlvbiBwb2ludGVyDQo+IA0K
PiBOaXQ6IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjb252ZXJ0IHRoZSBiYWRseSBmb3JtYXR0
ZWQgInZvaWQqIiB0byBtYXRjaA0KPiB0aGUgZm9ybWF0dGluZyBpbiB0aGUgbGFzdCBzZW50ZW5j
ZT8gKEl0J3Mgbm90IHF1aXRlIGNsZWFyIHRvIG1lIHRob3VnaA0KPiB3aHkgdGhhdCBoYXMgcGFy
ZW50aGVzZXM7IGl0IHdvdWxkIHNlZW0gdG8gbWUgdGhhdCBqdXN0IHRoZSBxdW90ZXMgW2FuZA0K
PiB0aGUgc2VwYXJhdGluZyBibGFua10gb3VnaHQgdG8gYmUgc3VmZmljaWVudC4gTXkgbWFpbiBw
b2ludCBoZXJlIG9idmlvdXNseQ0KPiBpcyB0aGF0IGFsbCBzcGVsbGluZ3Mgb2YgdGhlIHNhbWUg
dGhpbmcgd291bGQgYmV0dGVyIGJlIGlkZW50aWNhbC4pDQoNCkkgd2lsbCBzcGVsbCB2b2lkKiBh
cyAnKHZvaWQgKiknLg0KDQo+IA0KPj4gKyAgICAgICB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgd2l0
aCBhIGNvbXBhdGlibGUgc2lnbmF0dXJlIGFyZSBwZXJtaXR0ZWQuDQo+IA0KPiBMaWtlIGFib3Zl
LCBpdCBpcyBpbW8gaW1wb3J0YW50IHRvIHN0YXRlIHRoYXQgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biBib3RoDQo+IHBvaW50ZXJzIHNob3VsZCBiZSBfb25seV8gdGhlICJub3JldHVybiIuIFRoYXQn
cyBsb3N0IGhlcmUsIGp1c3QgbGlrZSBpdCdzDQo+IGxvc3QgaW4gZGV2aWF0aW9ucy5yc3QuDQoN
CkFuZCB0byBiZSByZXdvcmRlZCBsaWtlIGFib3ZlOg0KDQpDb252ZXJzaW9ucyBmcm9tIGEgbm9y
ZXR1cm4gZnVuY3Rpb24gcG9pbnRlciB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgd2l0aCANCm5vcmV0
dXJuIG9taXR0ZWQgYnV0IGFuIG90aGVyd2lzZSBjb21wYXRpYmxlIHNpZ25hdHVyZSBhcmUgcGVy
bWl0dGVkLg0KDQo+IA0KPiBKYW4NCj4gDQo+PiArICAgICAgIENvbnZlcnNpb25zIGZyb20gW3Vu
c2lnbmVkXSBsb25nIG9yICcodm9pZCAqKScgdG8gYSBmdW5jdGlvbiBwb2ludGVyDQo+PiArICAg
ICAgIGFyZSBwZXJtaXR0ZWQuDQo+PiAgICAgICAgICBFeGFtcGxlOjoNCj4+ICAgDQo+PiAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBmdW5jX2FkZHIgPSAodW5zaWduZWQgbG9uZykmc29tZV9m
dW5jdGlvbjsNCj4gDQoNCkRteXRyby4=

