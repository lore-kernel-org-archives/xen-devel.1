Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB06C61DC7
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:38:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400447.1636104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWYj-0002eC-E4; Thu, 27 Aug 2026 09:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400447.1636104; Thu, 27 Aug 2026 09:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWYj-0002e2-9w; Thu, 27 Aug 2026 09:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1400447;
 Thu, 27 Aug 2026 09:38:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1wzWYh-0002d7-LH
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:38:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWYh-002LkA-21
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:38:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a90057f-bab6-0a2a0a5309dd-0a2a450ca456-0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:38:07 +0200
Received: from [40.107.130.73]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a90057c-f479-0a2a450c0019-286b82493340-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:38:06 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9562.eurprd03.prod.outlook.com (2603:10a6:20b:599::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 09:38:01 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 09:38:00 +0000
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
 b=f+t5lHy6xG6wsH2yuZzIWRr3r8a4KiPkFT4LUPIcWT0HcJrqNNbETq3vy+ZD+Prg0AkD3QrmY+/qZeoGcwBqlx0PBjBUR4zl0KmZXVrdBkra+rMVmEuPdbStG+dwqVxnP9YVff9MqRYNSnihPfNSqQHoQEieHOOV6zfe/6r8S9SQgmZb+dRe1mIPqphDt4RGwDNmu0onk0w6F3LtoRoVZEe+n+pcDy5A62fOwapvTi0xCSW8hxqDiju9cUYHPLpIpOgeaW2+UuMZwryvKDD1eqaqu0IAvkD9KbZe7oYXqZwXFpqmqxpMxg0+misEjFBliN5eAJp2V4c67ghWPLyVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgziTV3hVaV5ve/1Bw1hIfKe/GnHCsU5TuUVeBnQKfQ=;
 b=GQ3Yp6yRtDOqgKOvqCVI8JEFhAGf3qElRpzIpDi2ppaZjtQmZ8g4k5npm4nAzJ14vBJ3IqAc5FFS1fGAnYHlegUeunKuXREcnEZ6YgBw2Qr6TYttGOAlM17hCytKhR5K555QX6pZVoiKcE576JwpboJXzUjMbS6fTeQMKdphxuLBFB4vgFg8B5JMwbU3izBcViTsdBmQuE9zWO69vO6sWmie+Gz9fGckooijFzgHDX2L3T2WoQ4p6bQ2AcIACsZiG6UGdYw0/nqkfoeCdmV28FmbTyyamnXxRxpi7scuw+tOQl8IJ0mex1qRTWE6jtnMf8Umx7eFpLOzThNEKrk8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgziTV3hVaV5ve/1Bw1hIfKe/GnHCsU5TuUVeBnQKfQ=;
 b=i+WAeEYh6m5hoshdVQ0IDM4iV5NesisBkkLZG4snoYayVIqFxGz8Adhz2YJiUyvhlQS0aadrK1k77g1RVVr3Xewq9eKvLG6nyg5vkuI8QFL67HXZy+xUlYjJgAKjOniTgUULUCaMys11AnsCDatGxAZeG0M8ejWNKTvpxu+RydsVMupWJ7PMxal/eP4Y84QIrrNwaPvytmulJo0t3/SXxrz2nCXEAPLKI2ZbSgHokFfh9uau/xSKFMQlXFSigbffq9LFC/ox1sAZNQxHyiAtzXgZk0q+/9DTF0FzVphgNPDlWLG5uS5hkVRPH7MbS9m41bdpQVAFwRjn5i22v9oDdg==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/2] XSM labels support in dom0less
Thread-Topic: [PATCH v1 0/2] XSM labels support in dom0less
Thread-Index: AQHdNgfA1drElJutwEqAemyOuAaNVg==
Date: Thu, 27 Aug 2026 09:38:00 +0000
Message-ID: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS2PR03MB9562:EE_
x-ms-office365-filtering-correlation-id: f631fe75-9492-4d0f-c06b-08df041ee2b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|11063799006|6133799003|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 +5yhiouHXzDMuCNkHAVpdoQVMSSKPnmB7t/WkGa4v+3q26WUk5u6sNGd2O9i98g3Tildq82Se4nulf1hf5l+atooSTr2n/smSEfBycRZ62NhBQ1SIJdHjKk/Ws3bT8b7n1lgPL931NvAq454l6XwRDul1leTv3ZcDuXD/CUgamFJYtCmN6RtEy5SzBCBRzvROaLaw3HJpwk6VzuT+TF9plgHIkQEtU/u3d72wREyZ0PvivaKmtib5MficufeitaFQAakjS2uIZ4LbJxXht6K7fCYqabProBrfjO5c2bOp7J/4nhYZkQXwDIrBWLUJQlrhjT9RmEmdbkGGMYiV1NujTAM7V9TSETib4OlwMJHolLsW7PmS6RHymyGL9/SjJpOZ26JWdgK8h/6KAVmhscbdUzxLJMzKef5jaRgvySt7JXxh8PZj8cKe7EhNUmu6X4djuvBnvj4t+DXpp/D92L9+pfRfvx1fEU3xIoRiO7qz3F78z7GLRNCeh3AF36KjfguUcxKSwLv39kLsPbpl+eRd5Z/gPvAYWwoCfLBX5Qi4JeygfLNnTjif8F5tYmZa2QSP+RM2B36yxS/Py6DzFiRrxmqxFawU2jSMyecReEvP71zQozkKbR0gabqGr9lbzliTUj0L4BZTR1aOIIPRenf1IK/owONz0fr2tMMpbFuPQglewDB0JJ2cRaYRMzqLTxdHNA1iDvwXWfHRpIrYx9PkTAzitESwrMFhEQ2Npnil9o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3dNQmJnRGNlTXJyaW9WeTJJZSs2SkhLNEFaWHJIRThnVjloMW40UVFFNWJl?=
 =?utf-8?B?M0lsZFRsaDhPWWpZa20xeDc0WmtHRG0wSHpmc2YzaTlCbkRacnpPWUVtV3NC?=
 =?utf-8?B?cktaY0NjMGdEUXRFQ3FxSk9pUWlwelYzMGtZRFRxMU5YTHRWTThaK3A0a2Q5?=
 =?utf-8?B?d0w4VTdBZk82M25QeHdkTFF0MHVWMDB0UHNPeWcvRzdQK1ZqWVp6WWZUcGZa?=
 =?utf-8?B?dVdDVXcvVDU1SmtEa2toNkZLTnlUSjNialRsUGp6RXhhZi9Xd3NSbG94VmFG?=
 =?utf-8?B?Sm5uaXFDQlZLaXpodVNFV3JzSmxyN1JSUkdISFZVYThrLytsVHpReTVLbVlz?=
 =?utf-8?B?a09UY3JocGpQeWpXeFlrRFl3T2JUb0hnRWxsM0Y2aExpVVUyM0V3eFZpNE1K?=
 =?utf-8?B?UXQ2eUpDZTRHQTArckdwSnZqVnQ1cWcwS0ZZQzREN0VSK3FqR3QxM1lTY0tv?=
 =?utf-8?B?YjVjbHlrZW1WUm14dGE5MEEyNTJMQ2dodjZoRWtCeEVLQ0M3V1E4MjJjQTdO?=
 =?utf-8?B?Y0dYT2Joa2l3aXdCeTFGeDVYazVQcVpOUGpNa291dTlhYkdxSndvQXBwRXVa?=
 =?utf-8?B?K2hxWWpXZXUrU2N2TFppcFJlaXJKOEpHS0pNMzBpZE1xTHhBK1hwdEN1ZHpP?=
 =?utf-8?B?RExVTGVNOUFrV0Q5N2pvZThJeUdvdFJud2t5bmhKdXVlVlQ1bG9iV3dlYk1s?=
 =?utf-8?B?clJYOHg0K24zcytvRkRFdzR6RmdKbEZ6OU01ZG51dDJSUmJlWHhPYUVFUWg1?=
 =?utf-8?B?THJyVmVONFd6VlF4YVhQS0UzckQ4NmFDQXZ5eUZMUDBoL3AxeFR2cGxIUWtI?=
 =?utf-8?B?K2RaOUNEa1RjdHYyT3JhaXNZaTJpZU9tYXZja0pJSUloTlJBWUsxTlc0eGZs?=
 =?utf-8?B?QkJwL1RkYSs5eWVpYUFqb3pjNzQrWEhDUnZXa3ZUblkxaHRaTmM4VzMzcjhm?=
 =?utf-8?B?OXpCY2Q5WUVoOHo0OGE3VlZtMk9zazFvcGNlVDI3dm5oZGRBOGdObGVQb2Fm?=
 =?utf-8?B?NW5YZGhib01UcHZjVHh4NDBxeWtScFRTZHY0R1Jjbkk2S2M5MjdSU3NNYThB?=
 =?utf-8?B?TTl4Y01UekFua2pseW1vNFhNMllRNmFBdUk3eEczZWcvMDNrenRxOFphTFpx?=
 =?utf-8?B?cEpMTGFiT0N6aXV1ckJLTDd4eFFZSldKeWFaMTAvdmFEb24vYXU1YUFnMWFl?=
 =?utf-8?B?ZzBqWFNOU0JDUUNGMTV6c0xQVnJtd3NwMU5oT09ETmRPNEhKMGJMM3lFbXkw?=
 =?utf-8?B?dHlFd3hyYTNaZS9PRjR0dU15SnVPNkJzZHBod1Z5QUVGNWVkWjg0cWVUOTho?=
 =?utf-8?B?TnVrZStFQ1Jwdi9vNU4zYit5b1dIK3JuOW43eGYvMGgyVFNOTzcvNFRPL3Jn?=
 =?utf-8?B?blI2L2NnWEFUK1ZyNnVVTk85aGdXWmJpQlVCVS9iVG9NNDJhWEN4djBpT2NN?=
 =?utf-8?B?UjBZcU95bzdMQnhZQTAxUkNSdlpDWWd2SksvaUxVZ1labitUSS9Gam10T1Fo?=
 =?utf-8?B?cU1CS3BZMG94V1BwUzM4Y3REbEtDK05XVkxlZ01IdDFUNUNlV1VuMjNiUUZ4?=
 =?utf-8?B?OUF4UWVxaHZIUTE1NndvSkZwdGhiTXNSa2JXN2VvMEQ5RUU2VEFWNEJVNjh2?=
 =?utf-8?B?K0VjdmdWVDU5cDZYbnFuRExYL00xV0djdFRkS0d4SzVtcUNSQVF4K1BWcllt?=
 =?utf-8?B?WFlvMGZhQUR2eTJDcXkxRFVETVo3SWNUSDcwWG80MlpvU2dSQWZsK0R0QVJ6?=
 =?utf-8?B?MUxFWTVKMUh2alROR1gvMUZuY1lGUk0xeitFdmlDNWF6SHl1Qm9LaFRSNk01?=
 =?utf-8?B?YzQ2R0NrVzl4Nzl4all1WHpGdm9XQWxPUi9YeEJ1U2RZZHliWnMyK3g4S2ZO?=
 =?utf-8?B?SVJJbGRzQjBDZDIzWnk3WGp1RWRSTHFvb3NWOUg2SFNmUXFpU2ROQTNnV29r?=
 =?utf-8?B?bFhoNks1dHNLUStDZDhPY1gxcnpmM0JWMUk0VDErSXZyUkZHcVZlR0s3eWpq?=
 =?utf-8?B?UFJacVVYb2V3ejBsMnNGeisxa0R2UVJFMHo3NG9kL09mQUJqSDFDT2kzcVB4?=
 =?utf-8?B?VWwrTWVSNG9uS1ExcjNrTkNDdGJHb2l5M3VrZlozMENTb3NDVWsyTzJvT2tk?=
 =?utf-8?B?eXFGdVJ4Vm1JTGF3VkRYZExJNnJjUk1nOW1JbFhLWGVOYlp5RWd3ek50YkNT?=
 =?utf-8?B?aEltNysrWEF0UDVrMXYra3B6SmJRQkw5WHA5aGdtRHFXNEJtd09HMm5UWFgz?=
 =?utf-8?B?dDhQQVl4ZEJjTit6WCsydFR1Q1VTbXZ6SnV0TVZnTEt3c3NsbUwrUFVIVXpM?=
 =?utf-8?B?bStFQ0phaVpsL1F6WjNTUXdtUnZnVWNUR3gwUEZOSm94ZzNJM1g4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f631fe75-9492-4d0f-c06b-08df041ee2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 09:38:00.8471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/ozBgqlgBpXycrR8Zoi2yepJirdDLQz1Wcj3YoFk6p44iGbBVlhFA/6povdZU+idVlTI5g7cxt83tJKHR6kMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9562
X-purgate-ID: tlsNG-d25034/1787823486-766DEA5B-23656ED2/0/0
X-purgate-type: clean
X-purgate-size: 1492

Q3VycmVudGx5IEZMQVNLIGNhbid0IHJlYWxseSBiZSBlbmZvcmNlZCBmb3IgZG9tYWlucyBiZWlu
ZyBicm91Z2h0IHVwIGluDQpkb20wbGVzcyBtb2RlLCBhcyBzZWN1cml0eSBjb250ZXh0cyBhcmUg
bm90IGFzc2lnbmVkIGZvciBkb21haW5zIGluIHRoaXMNCmNvbmZpZ3VyYXRpb24uIFRodXMgZG9t
YWlucyBhcmUgbGVmdCB3aXRoIGRlZmF1bHQgU0VDSU5JVFNJRF9VTkxBQkVMRUQgU0lEDQp3aGlj
aCBwb2xpY3kgZm9yYmlkcyB0byBjcmVhdGU6DQoNCiAgICAoWEVOKSBbICAgIDAuNjM3Mzc5XSBh
dmM6ICBkZW5pZWQgIHsgY3JlYXRlIH0gZm9yIGN1cnJlbnQ9ZFtJRExFXSBzY29udGV4dD1zeXN0
ZW1fdTpzeXN0ZW1fcjp4ZW5ib290X3QgdGNvbnRleHQ9c3lzdGVtX3U6c3lzdGVtX3I6dW5sYWJl
bGVkX3QgdGNsYXNzPWRvbWFpbg0KDQpUaGlzIHNlcmllcyBleHRlbmRzIGRvbTBsZXNzIGJpbmRp
bmdzIHdpdGggYWJpbGl0eSB0byBwcm92aWRlIGh1bWFuLXJlYWRhYmxlDQpzZWN1cml0eSBjb250
ZXh0IGluIGRvbWFpbidzIERUUyBjb25maWd1cmF0aW9uLCByZXBsaWNhdGluZyBhIHRvb2xzdGFj
aw0KYXBwcm9hY2ggYW5kIG5hbWluZy4NCg0KIC1TZXJnaXkNCg0KU2VyZ2l5IEtpYnJpayAoMik6
DQogIGZsYXNrOiBhZGQgY29uc3QgcXVhbGlmaWVyIHRvIHNlY3VyaXR5X2NvbnRleHRfdG9fc2lk
KCkNCiAgY29tbW9uOiBkb20wbGVzcy1iaW5kaW5nczogaW50cm9kdWNlIFhTTSBsYWJlbHMNCg0K
IGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgICAgICB8ICA4ICsrKysrKysr
DQogeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9NYWtlZmlsZSAgICAgICAgICAgIHwgIDIgKysNCiB4
ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJpbmRpbmdzLmMgfCAxMSArKysrKysrKysr
Kw0KIHhlbi94c20vZmxhc2svaW5jbHVkZS9zZWN1cml0eS5oICAgICAgICAgICB8ICAyICstDQog
eGVuL3hzbS9mbGFzay9zcy9zZXJ2aWNlcy5jICAgICAgICAgICAgICAgIHwgIDIgKy0NCiA1IGZp
bGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi40
My4wDQo=

