Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02031CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 08:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446734.1662836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXSr-0003mq-6L; Tue, 13 Oct 2026 08:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446734.1662836; Tue, 13 Oct 2026 08:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXSr-0003mj-2p; Tue, 13 Oct 2026 08:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1446734;
 Tue, 13 Oct 2026 08:02:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGXSp-0003md-VI
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 08:02:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGXSp-007tt6-AE
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:02:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acde584-2eae-0a2a0a5409dd-0a2a450cd23c-42
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:02:23 +0200
Received: from [52.101.70.90]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acde58b-f479-0a2a450c0019-3465465a9be7-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:02:23 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by DU0PR03MB10185.eurprd03.prod.outlook.com
 (2603:10a6:10:467::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 13 Oct
 2026 08:02:17 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 08:02:17 +0000
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
 b=iwuNHAoOTWaZ87U75jEd5aJmljP5qoE/McafoLsoENsdi21QaX4XC3N7YHX6Mr+Hds1Tx396B94eAdQWtwF26M8uGD1zVfNLJu/hU4VfZUahMSsZyjGodcfpbJdKZa/oaXYxQ5s81NO2cUnPBrJFO3FXS7Q/8yo/e/XRx6/5BNmEfKvALnxKwNG6r1TBHTus9jy9/IR8utkoTsNrMO21fR/GYEIw9CHg2GRqVz4sn1OTg+S4EV/qcSHJLnAWZDG8KRKI9n4K+2f1xyCJO0SV6RH3YQu63L7vggW9VNpLWQTKXS/jzvSuE1HigV4SM52xwBYdUwkJz8rRcD2hbzhEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXrJvms2a1fUMsTZGoIsoOJgrnt9gqkfUisB09F6mIQ=;
 b=GYCltpehfsEOluG2AqZhcAC2eiCLJqFfDbSIV5RLrrEx/LsjKHoWMDN98wjsGF2dumw1CZYb54h430nC7Xinbf9yxeRAZL00oBoCU+wcNXrJ/wFlSU6O5wHaUn2lGYK4VNNCSa57zgs8lUk1npZgxGhqTBVto5M+P1PgRFphso8kD+caq5Z3YxCLOaL/KTQvaqWJs3PsHoR3+gaLKWUcXwk8gIxEvLupBDG6UkmIMFCw7/Lb5U4pf2dgluI+FG5ThiEOtyo4NbeGk7I4e0M12cR8Z9fWmjxCBEmc/wNXPkme4zbnUUWuuBDxYYTTKgw6gJrMTzPK9o8OlG9qo6q9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXrJvms2a1fUMsTZGoIsoOJgrnt9gqkfUisB09F6mIQ=;
 b=Yin0wi5H262NgmGIrcoj7ME4IuXsKWpdXrHKMNlqyhT4eDCfr4kMOc0H2FvmYUvCcm629YsUtFzDnqcEgSlc7bAO2RAHfj2A3tFSatatbFajZDTIrps+MTmtw8yn47S2tQAQ666ZKpnrA/drw1GRtnZnLP4xGyB7H2DD3C5ofA/qtst/pJxBtU4HdqkdXjwj1PXCXMt3h4O1bm1No1GrAHsWoQknkpmXtkTBMPkffVh9IkIsAKwFqnC2AK8/5md3jVjtsrCBzH0DxypAtX987iOAUC0aV/RnjHvMGmpQKlvU4wFULnAAdc4ZMm98TaXcGkhdkHs2kT0UR8gQkFsjQA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdWose+3ny6aV1J0Gq+fH4413ZRLb7GmuAgAAC0QA=
Date: Tue, 13 Oct 2026 08:02:17 +0000
Message-ID: <a4b9fc24-35c9-4fcf-9798-3f3afd840d0f@epam.com>
References:
 <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
 <d10c7b4a-bd83-4a18-810f-50fab37ab841@suse.com>
In-Reply-To: <d10c7b4a-bd83-4a18-810f-50fab37ab841@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|DU0PR03MB10185:EE_
x-ms-office365-filtering-correlation-id: 9d1dac99-b1d1-4e26-494c-08df29004caf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|23010399003|1800799024|10067099003|11063799006|56012099006|5023799004|4143699003|18002099003|261009223027099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 lQD6F1wEe5Js69Ct8PfxmkTrlBhu50+/x0PmoBWdsM1hEkPUvs88azSc5XUwuDUcs/+XTOpwY+5ROvPDqudwYdH3aRPhr+hklcHQ8AaOO3nT1pz/ErHDPHqD+9vhTWT5+DcwXqWk5o/4k9AlHELuDVKWaXCSex0FRNLThzsPX1KPXUE1Xy0AAav+OnewsEaqkU2SVbajONvwRxueB2aZJVZEr/C62lFLkaB0p/JaQDVinnsyPG9CyayPHvfcXHu90gVF+fBazYFib7uaMxRZsWj/GJGvshJz1RzEpeXcNXKbRAKvJPZQ9hs9Z6NZqhrqnq10+cXmhBFEl0z+BiB2pL3v4jEvmLky8hLQ9FcmGdePy7uuU/QLuHpsrKN1Y6AGHI+2ywp4QC1wQjUEdnCWLgbAFpIUx6EYeOhDe2vkYLpSinpPGNWiV6dm6B/81v2O7X6zTDdvCiVut0zZpjfcc+mrycJ0Fn4bS20Ei4xTmasRfn0KyHVC0N2xfKD6Rv+0XPFnYtTh3k2EwIV2XKD47TGVcI0wzV9mDS6LKiiAOlovKRW3Iqbg6hhclhmixNvKAQQFP7c/k47YdyfVh8sgEa6k5lK9FyZhWl6LAKXHVI/l1kjgX37tG7DhOf7R81JLa7+Tu+BeWIFkEwul24B/6InE0QfPYs7lUbUr7/mCKk5pRM4yQPv9Y7n4CioNrvtX8V3by/QXP6cAevvyWlc5uRC8wJ8oHRqOWG6FQ4uWjnQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003)(18002099003)(261009223027099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEVNQmxGb0UxVWtZUXNIblhoWWFaakowSEhCdUNMSjVSRENycit3VkRFWVZn?=
 =?utf-8?B?YzNxcERhdTZUSWcvOWlRTllyQVJwVUp2bUNjaVd2dlZNZlQzR0ZqdG9EV0hu?=
 =?utf-8?B?NWx2MFZJbTBIa1J0bkN5TFpEWHhyZUZYczBtZHVBa3NwaWE2eDhaTVg2aEVI?=
 =?utf-8?B?dXMxMlJHOEJnb09NemRvaVkyTk1mcldUSysrUkF5L3loY01QTWRuTlF4MStq?=
 =?utf-8?B?TER6NTFWSkhpZXBkQW5mMjJ6d2xoeDBmQStxZHV1YjVUU2kyK3orR0tIRUw5?=
 =?utf-8?B?NFdNenBzSkNLZ0VPY1BTWEdwYkx4Y1pBVnU5V3pHd3hCNCtmMHJCVFJnYmZR?=
 =?utf-8?B?bTZ1LzBTWnUzUDVILzJseXJ2dFRFUW5DUS9EVStLTjd2ZUpZWSttL3NuTDZj?=
 =?utf-8?B?QUY4RWMxSEhtZlNtVFZybjRWVTBFVXVFWEYvam1JUjZ6eGlkR2R0bTRaTzVL?=
 =?utf-8?B?UjZ1Yk04UWRmNTRtblkrUTVNVURnUDFpM0tPY3ZQdHllajExRndMbXBsRmkr?=
 =?utf-8?B?emN0Y1h4eGd1VEdPd2tlTnZUQTUrZnNhelZpR21rTE51ck82MzdaMlhpbDRF?=
 =?utf-8?B?cjJiQXA5MUNJbGNNS3ZWOXZWZjhweXR6UnR3dWRiU3AreWVYWnVWZTlENnBS?=
 =?utf-8?B?SC9QT1ZHOTZxM2U5c2U2UGxBODZ0QzhEcVdwYUNSaEIxc0RYOEIwdFRCTm85?=
 =?utf-8?B?UGVZbEtCOW9UMmc1MlF4eGdJYktjM0pSSm9vVUVuSnR0RGgxY1B6azU1QzZj?=
 =?utf-8?B?d0dRaU9sbGtjYmZjWG1kWldFaDFPbitVMW54cExCdVJVTGU0QUFIZWVpU0JJ?=
 =?utf-8?B?MHBsUVU2ZGcrOXVqWVlOd2xCc3Uyd2Q4TWJTYkt4NDZPcDZGTlZ0VXZFY0cz?=
 =?utf-8?B?TC8vRU5JaUtTeFJNLzlzMFkzL25UQnVBaURnWGEwOTNDUmdXajNMNW9VS2d6?=
 =?utf-8?B?SkVDSjhSbWx3TVArNlBZVDZzenNJVS9PR2M5WmQ3TG1uSjlFVlpJNUhibjhN?=
 =?utf-8?B?T2N4VHVHUklZUUVCbnhYRmdVSkhWZVduaUdLMVc3bmQ3bVBscDFKMjNwVzll?=
 =?utf-8?B?VGd6eUdoL2V1WUNmeHhoSWRuV3lpbUJ1dGVPbDg3RXJpVlRDcC9SZXlCYjY5?=
 =?utf-8?B?amVYeXRrV0FFL29mUWU4b1ExbVBEYzlpSjJEVWxjbVRzbmJjVU1kd0NxQUFx?=
 =?utf-8?B?bU9MaXFpTWpSZ2VBVWVleUV6a1hBQ0NCS2hoSmorWkFrUVNpOFdsOHIvOGFv?=
 =?utf-8?B?MGZJaGo4b0pidTZpR3QwSzdFbkQzN1dETGgva05YU2s3eExuSkoxUHdYVlJt?=
 =?utf-8?B?bHh3QzFvRHdVaHBSY3pHRFJDODZ1MEplU1VqL0picXhldFBJRFVXZXZ1OThE?=
 =?utf-8?B?NmlYSU5sZFNyVkVFZzVkVUl1YUhlbWdsa0M2K0hEZEUzTnRLNG9jSGZVdDB0?=
 =?utf-8?B?OUdjU1ZMNS9TdVRIVlZoYlU4d3ZuZlM0Z3haNWlMU0tEWWRDWGxTN1pueXEy?=
 =?utf-8?B?M2ZJNFJGdXF0eWxGTHltdGpFbDJXSVZUTC8yS1ptOTBWbnVubmhYbEk2dDR5?=
 =?utf-8?B?WlBTVkg5djlvdGhnWTRONUdsdHEyaXVOUSt5UmkzQ2cwT3M3Y2xJUDI1NGtP?=
 =?utf-8?B?SWpuaG1IUENtMWRpazBaeUxBbkJkWUNrbXpGa21Wa3BCUzVSaHNJTG9jbStp?=
 =?utf-8?B?a1pyMkI4RjZJaDl2WUdTaGJVWjB3L2kvdmM3VVVvQWc5VHJOd1hyM2xoa1hJ?=
 =?utf-8?B?c2JNRXBYbC9ubVRWZ2YyR0lPK3VzTFdlQWpYcDJpWFlPOFNKMjFjcFE4RnM1?=
 =?utf-8?B?ZVhUN29jcE95NmtnTnZkZml3OXBtRTJGZ0tJd241dW5WdkxGRWltckVSdHlX?=
 =?utf-8?B?UllnazV5V3lkV05PSjZRa2srN2lic1I0SjE1TzVZbTB3TStCK013ZkxaZEtv?=
 =?utf-8?B?VmNwSkZodmZKOGlYb0NTODlUUlQvTUlQNWxWTnlqT29yekpXTUFJOHVYS1JZ?=
 =?utf-8?B?T1dRcU42TldPN281dlhXKzErQUpRbFFHcmxVTWQ4akRPR2lkZGY4VXBici9t?=
 =?utf-8?B?QXZEYW1xMXczeTZncXYzbmZDbkJkSW50ZUd5L25qUVVNbWhUbldkS20yVE0z?=
 =?utf-8?B?dWUrOG9MQjVOMHpGbDUwSUJudkRKeGNlNFgrWDFxYXBCYmRRNHBDOGJPT2Rq?=
 =?utf-8?B?NGNGdFF0SDUvMnRXTWdwZjdOL281MTZIVnVaSG4wZ3ZBaW5mOXVaNzFmUlNv?=
 =?utf-8?B?MjQvVCtpaVRGUVFSQkU4TVJSZ3VhMmdCTENxRnZ5ak9tZEg4WnFzSlRsdUlv?=
 =?utf-8?B?NUVTeGtiSUZxQTVjdjFlS0RGdmlybG1Jbk9EYzZFQkgyalpuSmtXR1QvMjlW?=
 =?utf-8?Q?ds8l4yXxJBt0gE64=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5716514C834D5F49B11518E730C8E4C9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1dac99-b1d1-4e26-494c-08df29004caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 08:02:17.3162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rvaV7etIxKG68JR697Pa3EF4/oVQp4WFdccYv5SHFQMhEwI+9pdk3N8S0o5ZfaXwHuF+5su1Jn31m8/BEiufqI/StO3XJOik5koDemCL18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB10185
X-purgate-ID: tlsNG-d25034/1791878543-51D34A5B-C501E734/0/0
X-purgate-type: clean
X-purgate-size: 1808

DQoNCk9uIDEwLzEzLzI2IDEwOjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMTAuMjAy
NiAyMjo0OSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2dlbmVyYXRlLXhlbi1zeW1z
LXBhc3Nlcy5zaA0KPiANCj4gWW91IG5lYXRseSB1c2UgZGFzaGVzIGluIHRoZSBuZXcgZmlsZSdz
IG5hbWUgaGVyZS4gSXMgdGhlcmUgYSByZWFzb24gLi4uDQo+IA0KPj4gQEAgLTAsMCArMSwyMCBA
QA0KPj4gKyMhL2Jpbi9iYXNoDQo+PiArDQo+PiArIyBIaWRlIGV2ZXJ5IHhlbi1zeW1zIGxpbmtp
bmcgcGFzcyBleGNlcHQgTEFTVF9MSU5LSU5HX1BBU1MuDQo+PiArIyBUaGUgcGFzcyBsaXN0IGlz
IHRoZSBmb3JlYWNoIGluIHhlbi9zY3JpcHRzL01ha2VmaWxlLmxpbmsuDQo+PiArDQo+PiArc2V0
IC1lDQo+PiArDQo+PiArY2QgIiQoZGlybmFtZSAiJDAiKSINCj4+ICthcmNoPSQoZWNobyAiJHtY
RU5fVEFSR0VUX0FSQ0h9IiB8IHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSAncy9hcm0uKi9hcm0v
JykNCj4+ICtsYXN0PSQoc2VkIC1uICdzL15MQVNUX0xJTktJTkdfUEFTUyAqOj0gKlwoWzAtOV1c
KS4qL1wxL3AnIFwNCj4+ICsgICAgIi4uLy4uLy4uL3hlbi9hcmNoLyR7YXJjaH0vTWFrZWZpbGUi
IHwgaGVhZCAtbiAxKQ0KPj4gK3Bhc3Nlcz0kKHNlZCAtbiAncy8uKmZvcmVhY2ggbixcKFswLTkg
XSpcKS4qL1wxL3AnIFwNCj4+ICsgICAgLi4vLi4vLi4veGVuL3NjcmlwdHMvTWFrZWZpbGUubGlu
ayB8IGhlYWQgLW4gMSkNCj4+ICt0ZXN0IC1uICIke2xhc3R9Ig0KPj4gK3Rlc3QgLW4gIiR7cGFz
c2VzfSINCj4+ICtoaWRkZW49JChwcmludGYgJyVzJyAiJHtwYXNzZXN9IiB8IHRyIC1kICIgJHts
YXN0fSIpDQo+PiArDQo+PiArcHJpbnRmICclc1xuJyBcDQo+PiArICAgICItZmlsZV90YWcrPXt4
ZW5fc3ltc190bXAsIFwiXnhlbi9cXFxcLnhlbi1zeW1zXFxcXC5bJHtoaWRkZW59XVwkXCJ9IiBc
DQo+PiArICAgID54ZW5fc3ltc19wYXNzZXMuZWNsDQo+IA0KPiAuLi4gdW5kZXJzY29yZXMgYXJl
IHVzZWQgaGVyZT8NCj4gDQo+IEphbg0KDQpUaGUgZ2VuZXJhdGVkIGZpbGUgZm9sbG93cyB0aGUg
b3RoZXIgLmVjbCBuYW1lcyAoZS5nLiANCmxpbmtlcl9zeW1ib2xzLmVjbCkuIFRoZSBzY3JpcHQg
bmFtZSBmb2xsb3dzIGdlbmVyYXRlLWxpbmtlci1zeW1ib2xzLnNoLCANCndoaWNoIGFsc28gdXNl
cyBkYXNoZXMgYW5kIHdyaXRlcyBhbiAuZWNsIGZpbGUgd2l0aCB1bmRlcnNjb3Jlcy4NCg0KQlIs
DQpEbXl0cm8=

