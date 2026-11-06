Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73497606A32C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=sTFI3pqi
Received: from list by lists.xenproject.org with outflank-mailman.1476356.1682496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPFIy-0004Ku-SS; Fri, 06 Nov 2026 08:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476356.1682496; Fri, 06 Nov 2026 08:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPFIy-0004Kn-Og; Fri, 06 Nov 2026 08:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1476356;
 Fri, 06 Nov 2026 08:28:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xPFIx-0004Kh-5C
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPFIw-005Vuk-2F
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:28:10 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6aed8f94-e002-0a2a0a5209dd-0a2a450a9a36-14
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:28:10 +0100
Received: from [52.101.69.143]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6aed8f99-f2d2-0a2a450a0019-3465458fa792-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:28:09 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by PAWPR03MB10167.eurprd03.prod.outlook.com (2603:10a6:102:363::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 08:28:06 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:28:06 +0000
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
 b=IpQa5urMt4DhU3qZyaom3Jf39oMiDPY8rt3SYqRM7NjWQeY+aXmW11PJpa+i3tNWGAb3gIhmkcTKOBSler3IUu/Owc4ZPbiEb9CcRGAV0KQ+hKrs62Yvzt5S4vm0BX1EvHwDnJXHmcw/B0gGnU4IhD5vqxByja8ITKP7z6qY3gKjixkBo7gmE8Q3jUxLav9cHx2GOUFzhjOz0r+sz5Tc+RLlk/PxqhGK3Eu7nW9X9THcN3KmV0my1hp9z4wzPwidIL9Aq+7yD/smwy2uotW+iryV/NYKD5q/tx8isvwmJ9p5g4WVU2KkYE2fXaiLS3Sj7H6d3gwYKx5uZUdPS/gqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYwFRbSfknF0MGvs/x8hjTYIixhyIk2vqIBdL/UrpZQ=;
 b=rYdnp4KRBq6PN1WkilXslDRWOUMAZ8gaaLvGpSukWQnn2yMeu/cQLqHGMz7LzSiFwLCzBPz8lPHlhDWFPBRvD8NPix89tSvtk5Qfxh+IukgbbzxuAWhlRqmd1DqIWte4EsgiC0/svlnjOGBAZJQuevZfTA/1t3j0xMK9KLemailJdOuB2LCYpsGud2fJHXCCwJ9tvixRr2b6CgPpG9DsdGacj4y9Zk3BMAoEPyybkfkxXMcSqDA0FIeYBZBgI3tLpTy0MOWDKGZ52Fspdd7JDOw1/vIbyaC1KnxIridEjp0DTTuojIzkhgb7lW4VEdHcPOxZ8Y6c65qdCAJn7UlBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYwFRbSfknF0MGvs/x8hjTYIixhyIk2vqIBdL/UrpZQ=;
 b=sTFI3pqicNX9SlIrq7ifRAflIZZWpub057VYMAsA+pDcgxiEEHeWpZ8MJQPVYPW70j7xuaY5+GMrzzGO0LL3GbLa9wI0uqtdQ3m+ej+sBYTTHCNV0Hng+5iBaxBSgIaCn3QOSdb2CfM3ORpGvXCZ6AuoBgP7GnfaSlXkTIR9zXIVJZVcJdVqwWmg1S77gBsydvTs1h/oxalLtKerJsBlTHl7D7ZaSs6nCRLEc11OlTnWN2/j/+GLM0g4fWXwn8Qh5kP7Y6SwplHaPey2/qAZ/tvlacbM8LmZvezwmZZMkam8FWMqJO7BNMRTHmc9DqzU9LZ83voCEP2PGYbkmeU2iQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHdXK6sWnTwG0FjdEmPa5OC537fErcTDN4AgA3LQAA=
Date: Fri, 6 Nov 2026 08:28:06 +0000
Message-ID: <642f3615-d4b2-4937-841e-143b441a2400@epam.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
 <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
In-Reply-To: <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|PAWPR03MB10167:EE_
x-ms-office365-filtering-correlation-id: f57054e8-b5fa-4b13-7fca-08df3bdfe1f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|38070700021|261022075727099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261102123227099003|4143699003|5023799004|11063799006|10067099003|56012099006|22082099003|18002099003|261028144727099003;
x-microsoft-antispam-message-info:
 /58Zv6wnewssz/rSVwRlhje7qC2c0TBNvHg6M1GC0DtHBWkU9KMDHkulM9WtnLsEZN4kKLGond2B9NA7Fb/Mg8gEwN/uMKYTOG9icem1kYNIcJ2WeR3qLSnRrnCGLjOGzeIeeZP1VbXeCUCbp10mWsVcezsFrdlYcY/uaV4qJjn0l0IWlAf241aem7W7wBxQ6T7sDZBOfSZ1iYQfxyppdfFUQSRAvmaj8s2wmHuHWrFBPGmz36lSN93kSyRggfQnW5xiMw09XHd/OsGnWTcVIuhC7emeqwDlAsJtNx78PDjzWQ1GwSFAxxTzCU08ZNZzdGcCx2koT+ju+jVQLZrnWZiMV1q3AdXZs56lq7LEhCJVnsVD3a57d7yIGd1JKAAiDvUtnUMQO0zwNLcKjOgq3AuqGC0z6k59rAU4lukEG9Xe9dqclXzP4HcNRqj+4v1527trQzDX/uTSXNuMGahZsBeIF6J+6mdGKXt6c/7VdTpDGUy3YmxoFoW7D7n4/mwTr4osXK/4Z9vak3JNKtphDCCnUpTc4mFfISvunchBJXeDY1ub1XVu6NyVgM4SFVCtRcpU617iOeCVTlAqdMc5ae9a/WAg6Oosv3EV2/qK6LeLHhmoRaeORa2Ax0Q0OnUCMHymhzlOJfEZWFHC5gqK3HatT90ahRovhcCmqISV22pPbr/iera7XWAhaphjgaOYvBcPmG7zot0rqyOiitRDFN/20QfH3VgUR2BOOsRei4w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(38070700021)(261022075727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261102123227099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(261028144727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEw3VGtIa3hrdWtNKy9uUlVVVGRmbHpTN2dwODM5WkhBTUo1K25qUmV3Q1d4?=
 =?utf-8?B?QXZid3FFR3hRRjRPSFBMNFNvZ0FRMjdsaFBYOE41N1VrOGh3QXZJMUdYS0tr?=
 =?utf-8?B?cXMwZENpN1JOdzFCWHJOZGxETHkvNG5SM1IzMTc0QUdIbS9wMUVOMzVMWC9v?=
 =?utf-8?B?NDJHNVBKTzk3elhKelV0by9KbmgwZkszSzcyWDlrYmlkUXhYYndIdDF1VWlU?=
 =?utf-8?B?WmtNZHVzbzBUcC9tVE1sVXZIZmtJd1Y1RTZXMWkvU1JmSXJLWGd5M2xKcnVD?=
 =?utf-8?B?TDVkNDJPSlF5NlR0RkMyTERwcVBvS1FmV1BocUdzbXVKblQ4ajhKWDRiZSsr?=
 =?utf-8?B?QjJacEVvMGtTcTVCbHl6ZEVkZGVhWkJteW03YWtYVmVCekdER28xSStzK055?=
 =?utf-8?B?WmxyQStPYkNnb2VsWjRON2U1SXEwMVJSZU03b2ZTck90OVRyd0xRVVV3TVVq?=
 =?utf-8?B?a2Vycmx6V3dENGJCcDlJbXVvS1NqOE54N2E0Rkg0a1l0SVQ2K2dDVytPR3dF?=
 =?utf-8?B?b1pUUVF2SUp6eDZ5akYzdk83aEVzc2xDS0tOMEdvYnN0eE9Ub3htSUY1d1or?=
 =?utf-8?B?eGVpaTZ5REZUeXRtTnBHREdya3MvajdBbThHN3FLOHlDV2hjbW1kTUUydTJa?=
 =?utf-8?B?bEd3TzhqeDBlVGgvZXJKYWpKaW1PWVZxN3orOUxzK05JNnBDQ3pERjFpa3V4?=
 =?utf-8?B?USt4YzRUNk5Od29CQjJpYWsyZEI3ZUd0TXdlcW1SYWFNV2wyZ0JvVks2TjZo?=
 =?utf-8?B?K3AvdjhDUUJQd1IyUUpHZ2lvT29VSW12MkJrWGZlZGNsa0c3R2JwOHVHVXl1?=
 =?utf-8?B?TkxTaGdJQ0w1NzYzWGx1NGZ3ZUhQYUhPVVZkR3FaQ0RHcFpuK3plRWxNTnpi?=
 =?utf-8?B?TkdYdFRqVkJHc2Robkx2eXk1NDRpZW1MNXd0WnViZkg3V2RWMjB6ZW5ZZzY5?=
 =?utf-8?B?YXdnZ20zMHlQbTQvb1liU01BMnZ1aHFjbzhHL2c5WFNhTGNjNmZkQ1k5VjFY?=
 =?utf-8?B?TUFFL0ZhckZtYkRBVmpoOWpCZHJHUWxsNjdzazVQRFNEaUZWakJsY0szTGlx?=
 =?utf-8?B?MlBRbGMveThncDBxM3R0WUN4enQ5SDMzcER4UGo5U3FWejdrMkhwcGJid2RY?=
 =?utf-8?B?bjEyOVB3d3UvZEhNTTNjdmtCS1ZNS0F2Mi9KVG9Jcy9NZ054SGVBVnMyNnBi?=
 =?utf-8?B?VWhqM1ZjUFJhQTVDYzEySDlSdE9QR3NMK3hwOXJMOERUeFFrN3UwczhUZ0E0?=
 =?utf-8?B?WVpLZ1NYTFFvUlRoUjNHNXVSTzhLZHVEVkMrampRMHlOcS9NcFQxMDM4WndI?=
 =?utf-8?B?UzYyUkt0dytZS1lDY054T3k2Rm9ROUo2b1hYV0VVV0FPcERBcnUzazB4VVFP?=
 =?utf-8?B?S3JFcUQzQWJ3UXY1RStyckdRRkNjQ05NOE8wd2pzQStDZ1pLSmNPbTByNVJv?=
 =?utf-8?B?emJVenZaekcvYmtoWGF5dHVoRkZtTVZWNlEyNWhIdVVHWHdrREY0cm5HRjhY?=
 =?utf-8?B?Z0oyMS9pQUhMMUN2RTM1M0NtQXFpY00vbkd2SmtuZEpmTTg4eUQ0aHBHaEhr?=
 =?utf-8?B?Y1FJWmltTDljbjNzbEF5UFByNHRuNUtLdVlFMXhDeDBhR1hmSzZEZUpJMnE3?=
 =?utf-8?B?dWY5ZVVJcTNrK1AzcWl6MXJlNndadlBmZWhKdHNKcDk2L25oc1pWTDlwK01Y?=
 =?utf-8?B?RnZKaG1uK0tuMGhwSWxhOEpmR09oWVc4WjVNcGl6VzZaZHVhVEV4MEJERkJB?=
 =?utf-8?B?Lzk1MXNRRW5TVDR3TU9WajNwc2lyekxPcVp4MGlqMWpsTG5Qb3U5WkJSRVRY?=
 =?utf-8?B?UklRQ1pKOTVDaExXNTZVR1lBTXRzWG5MaktJVVZpdTUwZ3B5Qlg2WEU0ZGM2?=
 =?utf-8?B?UmRSeEtFVEZRdGN0OGJ4SzZzUnFhdUt6Y1JTRUs5RzlTdHRSOXlSUU1NU1gr?=
 =?utf-8?B?WFBGSno2WVM0NjIwdW9teStOblRXdzVMSjhaUlYyWGYrWGJOdCt5WklRVGdr?=
 =?utf-8?B?K2orNG5FZXB5QW53WDhXNk1jS3VlUXVZTFdwNVFZeEFRVVZISll2TFRTNlF6?=
 =?utf-8?B?RXA3SGxqdDFkK0dMT2FyelRuc1RIUXNNUXp5YzREbUdsWVl1akJhN1R1SGFU?=
 =?utf-8?B?YVBGcVMrTldrMTVtSkVPcWVFVE9QREVUdWEwSGF1c3ROMVltWFE4MHZ5c01x?=
 =?utf-8?B?VmtkZVpSWE9RNG1DQmp2T0JaUlJ3YkJrZ2czUGF0ZmdCOFFML0l5SjBkb25w?=
 =?utf-8?B?TlcxQk1qMkJ3amJORXF1S3BBTlh5QWxwQkNOOUdQRVVXUHZXSjNFZmxXakhC?=
 =?utf-8?B?Z3ZTUS9JNEY4K2NIVnRLanBmRndsU0M1dDFQS2lJRHZuVFhTN0tsdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15CD6BE8F6DC6841B5889C933D75C996@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57054e8-b5fa-4b13-7fca-08df3bdfe1f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 08:28:06.3295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3rClMEYH+DlJHZkkhJRvDhK+cnd6D8hWSOJZknoeC2VjqP0phd+cXInrwFX2FZ0mMEOs9PmJ70xeyHmBQPBmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10167
X-purgate-ID: tlsNG-4011c0/1793953689-589C9CFC-CCF8C0AA/0/0
X-purgate-type: clean
X-purgate-size: 3420
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjgvMjYgMzo0OSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjEwLjIwMjYg
MTY6MDgsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KDQogPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS9NYWtlZmlsZQ0KID4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUNCiA+PiBAQCAt
MSwzICsxLDQgQEANCiA+PiAgb2JqLXkgKz0gY2FwLm8NCiA+PiArb2JqLXkgKz0gc3Jpb3Yubw0K
ID4+ICBvYmoteSArPSB2cGNpLm8gaGVhZGVyLm8gcmViYXIubw0KID4+ICBvYmotJChDT05GSUdf
SEFTX1BDSV9NU0kpICs9IG1zaS5vIG1zaXgubw0KID4NCiA+IFdoZW4gSSBhZGRlZCBjYXAubyBv
biBhIHNlcGFyYXRlIGxpbmUsIHRoZSBpbnRlbnRpb24gd2FzIHRoYXQgbmV3IGZpbGVzIHdvdWxk
DQogPiBmb2xsb3cgc3VpdGUsIGluY2x1ZGluZyB0aGUgcmVzcGVjdGluZyBvZiBzb3J0aW5nLiBJ
bW8gc3Jpb3YubyB3YW50cyB0byBnbw0KID4gYWZ0ZXIgbXNpeyx4fS5vLiBTZWVpbmcgaG93IHRo
ZSBsYXR0ZXIgYXJlIGNvbmRpdGlvbmFsbHkgaW5jbHVkZWQgLSB3b3VsZG4ndA0KID4gU1ItSU9W
IGFsc28gd2FudCB0byBoYXZlIGEgSEFTX1NSSU9WIGNvbnRyb2w/DQoNCkkgd2lsbCBmaXggdGhl
IHNvcnRpbmcsIGJ1dCBJIHRoaW5rIGd1YXJkaW5nIGV2ZXJ5IFBDSSBjYXAgdW5kZXIgYSBjb25m
aWcgb3B0aW9uIHNlZW1zIA0KbGlrZSBhbiBvdmVya2lsbCB0byBtZS4gTVNJL1ggYmVpbmcgYW4g
ZXhjZXB0aW9uIGJlY2F1c2UgaXQgZGVwZW5kcyBoZWF2aWx5IG9uIHBsYXRmb3JtIA0Kc3VwcG9y
dCAoaGF2aW5nIGEgd29ya2luZyBJVFMgb24gQXJtIGF0IGxlYXN0KS4NCg0KPj4gKyAgICBBU1NF
UlQocndfaXNfbG9ja2VkKCZkLT5wY2lfbG9jaykpOw0KPj4gKw0KPj4gKyAgICBmb3JfZWFjaF9w
ZGV2ICggZCwgcGRldiApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGNvbnN0IHN0cnVjdCB2cGNp
X3NyaW92ICpzcmlvdiA9IHBkZXYtPnZwY2kgPyBwZGV2LT52cGNpLT5zcmlvdiA6IE5VTEw7DQo+
PiArICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIXNyaW92
IHx8ICFzcmlvdi0+dmZzX3JlYWR5IHx8IE5PVygpIDwgc3Jpb3YtPnZmc19yZWFkeSApDQo+PiAr
ICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+PiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8
IHNyaW92LT5udW1fdmZzOyBpKysgKQ0KPj4gKyAgICAgICAgICAgIGlmICggdmZfc2JkZihwZGV2
LCBpKS5zYmRmID09IHNiZGYuc2JkZiApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiBwZGV2
Ow0KPj4gKyAgICB9DQo+IA0KPiBUaGlzIGxvb3AgY2FuIGVhc2lseSBoYXZlIGh1bmRyZWRzIG9m
IGl0ZXJhdGlvbnMsIHdoZW4gdGhlIG51bWJlciBvZiBTUi1JT1YNCj4gUEZzIGluIGEgc3lzdGVt
IGlzIGxpa2VseSByZWxhdGl2ZWx5IHNtYWxsLiBJIHdvbmRlciB3aGV0aGVyIHRoZXJlIHNob3Vs
ZG4ndA0KPiBiZSBhIHNlcGFyYXRlIGxpc3Qgb2YgIlBERVZzIHdpdGggVkZzIHVuZGVyIGNvbnN0
cnVjdGlvbiIuDQo+IA0KDQpJdCBjYW4gdGFrZSBhIGRlY2VudCBudW1iZXIgb2YgaXRlcmF0aW9u
cywgYnV0IGl0IG9ubHkgcnVucyB3aGVuIHRoZXJlIGlzICBhIFZGDQpzdGlsbCB3YWl0aW5nIHRv
IGJlIGFkZGVkLCBzbyBpdCBpcyBvbmNlIHBlciBWRiBFbmFibGUgYW5kIG5ldmVyIG9uIGEgbm9y
bWFsDQp2UENJIGFjY2Vzcy4gQW5kIGV2ZW4gYSBmZXcgaHVuZHJlZCBpdGVyYXRpb25zIG9mIGEg
bG9vcCBsaWtlIHRoaXMgaXMgbm90aGluZw0KbmV4dCB0byB0aGUgcGNpX2FkZF9kZXZpY2UoKSB0
aGF0IHNhbWUgYWNjZXNzIHBlcmZvcm1zLiBJIGRvbid0IHNlZSBhIHJlYXNvbiB0bw0KaW50cm9k
dWNlIHRoZSBjb21wbGV4aXR5IG9mIGFub3RoZXIgbGlzdCBmb3IgdGhhdC4NCg0KPj4gK3N0YXRp
YyBpbnQgY2ZfY2hlY2sgaW5pdF9zcmlvdihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+
PiArICAgIHVuc2lnbmVkIGludCBwb3M7DQo+PiArDQo+PiArICAgIGlmICggcGRldi0+aW5mby5p
c192aXJ0Zm4gKQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBDYW4gdGhpcyBo
YXBwZW4/IEkuZS4gZG9lc24ndCB0aGlzIHdhbnQgdG8gYmUgYW4gYXNzZXJ0aW9uLCBtdWNoIGxp
a2UgLi4uDQo+IA0KPj4gKyAgICBwb3MgPSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LCBQ
Q0lfRVhUX0NBUF9JRF9TUklPVik7DQo+PiArDQo+PiArICAgIEFTU0VSVChwb3MpOw0KPiANCj4g
Li4uIHRoaXMgb25lPw0KPiANCg0KSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gbGVhdmUgaXQgdG8g
aGF2ZSBzb21lIHByb3RlY3Rpb24gZm9yIG1hbGljaW91cy9mYXVsdHkNCmRldmljZXMgdGhhdCBo
YXZlIFZGcyByZXBvcnQgU1ItSU9WIGNhcHMgdGhlbXNlbHZlcy4gTm90IHN1cmUgaWYgc3VjaCBk
ZXZpY2VzDQpleGlzdCBidXQgc3RpbGwgdGhlIGNoZWNrIGNvc3RzIG5vdGhpbmcu

