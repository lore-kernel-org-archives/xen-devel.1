Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D5CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:44:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440667.1658084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfFQ-0006AR-H9; Mon, 05 Oct 2026 09:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440667.1658084; Mon, 05 Oct 2026 09:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfFQ-0006AK-Eb; Mon, 05 Oct 2026 09:44:40 +0000
Received: by outflank-mailman (input) for mailman id 1440667;
 Mon, 05 Oct 2026 09:44:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xDfFO-0006AC-93
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:44:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfFN-00105k-KC
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:44:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac37181-8faa-0a2a0a5109dd-0a2a450ae1e0-28
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:44:37 +0200
Received: from [52.101.84.99]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac37185-f2d2-0a2a450a0019-34655463ba60-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:44:37 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by DU5PR03MB10390.eurprd03.prod.outlook.com
 (2603:10a6:10:516::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:44:35 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 09:44:35 +0000
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
 b=Tgx0loYsbJKfssRlkv7vkrDtV8QVvjeKkRQ0z2TvxLYP6sCYRxc1JOWZX5YMzYgdHHTDxcOKkDnD0x5i8N6UgHZ6Nkmrii6eJgbhxGcMJbzWu1d/yRHia3KVnEUHdZCS2z/gWf4zk482TAbhzfZE62Hn0M+JCE016H5rpnfx+W/FcUBm1Gj3kI8bYkhNCPyycJDn6x0PCFV5zE05uHLhP5w5C/F+Qv//hA4JRLjdgPWMF69vG0mx7Arqp2Toscxd3qZNLGZBgCFDshpG2zO3WSVH/fpGUN/DizWQ3ljAOLCHr/epH3ctWsMy075riMkrWl5vCvwz6AHcms98zXwIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pnCXQKrzQrfUUdy+YjIJvH6HSIvNs9n2WNml8n6OrI=;
 b=AeCMiFglRr1kP7owyHLNW7UCtVgoRLpD8wV3xxMm6SqsaTahGIrqnioDAF2AoWBOnoyxWjNc6Jpu6X2+FbsQuB9pNAjuhbPkLk5vZyLk+z/PzYs82H6BMzecDi54KsrOPzcCFMKMlULHMqK674hZQkmu4ma+GY8+vmtKNmTBNAnOyqJqSHD9ij/RF2h1N5siFVYgIQl+XfFi+zhJMTcSDdtPtAqzo/wjWdpLNFXMkVBuI1eIK34hsgGdOcmKf4y/1IpcZfSfS+PwloKUg5AACdEuoBiQ8u3VHyfTjAm63kSyir/P0p4pKF7eVbm3LcThKwnLzZJ52cphyWR4e8Xpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pnCXQKrzQrfUUdy+YjIJvH6HSIvNs9n2WNml8n6OrI=;
 b=jd6rCHHAzk+3WTx3aYAAjGA65ve2JA4W+MmT9RVSIcsKiJkKZ8SuJAzYmjX4yLgQlaeUPjYyRn4jmXEpokV5xYPMAz8+ev4ecOdaG9yGx2uKBsGNl3JFHenwiAXStnRKeDH4uv7td6CXwMuotKEhh9Uq0x3UVz+bqg187eiCX2wP3FbawECGq/sDUnT6HePJBkHaMHmlSGmcq70MzH9ErXRHRpkKCcZwo6pSJw8SXwdgCsWXSKy7SMOcm0bIp/4wYpl5VljMF/5u1OijHh1OlHd0v+av8aB+tac3gCqik1UzmhFUzHyUpjlG9wLDa/qQFQTCoi8zznKGG4z5YL3+nw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
Thread-Topic: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
Thread-Index:
 AQHdNrs5d+cYyXDbRECyxJjufAxZUrbHhHsAgAANlgCAAA5igIAABi4AgAAr2oCAAf2rgIAD60EAgCEzPIA=
Date: Mon, 5 Oct 2026 09:44:35 +0000
Message-ID: <0b7ba176-cec3-435f-9b2b-793a68e0e153@epam.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
 <aqJhJO2FtkrJCabM@macbook.local>
 <f17563f9-3a42-4002-afa0-b763e125dcd6@suse.com>
 <aqJ4myv4_II75W5K@macbook.local>
 <f51588b3-4100-4353-a35d-ac0780f2aab0@suse.com>
 <aqKikxvL_6SCs_Cj@macbook.local>
 <46dcfb81294d6f644a4d3f3c11b1f47e@bugseng.com>
 <e21ebe06-2fb3-40c4-9176-4719c07fbf76@suse.com>
In-Reply-To: <e21ebe06-2fb3-40c4-9176-4719c07fbf76@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|DU5PR03MB10390:EE_
x-ms-office365-filtering-correlation-id: bdaff581-691a-4da4-5466-08df22c543cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|42112799006|1800799024|22082099003|18002099003|38070700021|4143699003|11063799006|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 5Fsq912XgsI3ZvlK/Y+LBlEfyCSWz/BRsUvclmbnOD5x/7UTVtc2WvqWWkwVvkRIAucRzR7y9WCaEtTNy2hUuJmEqjOo1tTGtQbYvT7f3L9xkJt7+D+oHzSBAWUbTRWaDcJ428fZgaRNfse6rL3HDRCbIARkq1kG0JzYB0XwcSZksAmHpJqRQDmlWdB5zoiop9K+8VzNVcnIy3GjuR8uZagzpNMbJrN4Wfi1xm+6qYamtDuJX5Q+7wzehS1I/hoWnIrQ5EXG9ev6V5nhG42/fFiMRDJFYL3uUGf3K3m1xr8X6AthmKP1KZXkHHSB9hnsSN+KenH4+01Yx1HASSnYdDA66+3STVFwbeKdPPAdBjOGIt0d5meE+tGfcIptgYNl0NSm8S6DgCtDCISvi2N4uUyVOiRcXwS8OwWcvtlFJwcXZhdL2GganeaXyjUiK6OF2To3Ujygv4QxfCEjGH3DGXXc5tFVVb2op6iF/obu0UicpsL5lMiKTwbaBgpZpiY1VQ6pvX+RUM3dSWm1MVegmpce3UaC/EN3D4xfcP6IQkDRbducq+Sowc0AO6DAOsH6WrgDerxZe84X/z5QxuH4qmsrUhpGRgB81ujdAZHXfw2/RV2mM7jVS/3a42fV7KcZu8dXxiGuauKb53Moh3FIOAW5KxZNQv7jAB7kdBx/mgYjbhy9YmJHBMQqh2LLKuEp+kV+gDfu5l3ywqhLC/jb6HkrArn42/iOXhyi7PR5448=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(42112799006)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzR5UDVvRkhWM2dWOEhjQm44UWNtLzBiUDRseHYwMlAyeEZDSFN4ck80S0ho?=
 =?utf-8?B?c25TM0lqWWprQ0hhU2V0V29hNStsSlNUWFVGeWdhY2NLdi9McXhLeUZ4V1Qv?=
 =?utf-8?B?Z08wWm8vY0x0clU1NjZWdVU3UjQ4VHU5aVM3TlZld3l1aG9mNEVkVm9jakJ4?=
 =?utf-8?B?eHRETlRZTVZCVVpLQk9lLzloajNGTVh4NW5aOVlSTWcyempEYW9KaU41L2Nu?=
 =?utf-8?B?UWR3eGxxSVVDUUlWc08vMmJweWFEL29lNWNrZHVtVjZiYS9lUHNpMmFFc1Y1?=
 =?utf-8?B?SFA0Z2VNelVoZEFSLzhPdVhBZ1R5N0FlTFdwN2VaRk5DbXkzQUMyN21EcDV6?=
 =?utf-8?B?YmVIK0VIL05NMDhpZ1lJTmhRMytRanNJenV5SUthdlhFSW5ralBXK2pkUWFX?=
 =?utf-8?B?QVgxbU1DSlN0K0R2TnV2WGVKZzBHTk9JSjJCQ0VFazVCVnRWZGloM3d0M04v?=
 =?utf-8?B?UExBY0tXUjNjQVhnOVFPZElWRDVROFc2WDRxMXN5cFBFcXhQL2o3UUtyWGhH?=
 =?utf-8?B?Z1M2MFB6ZU1wR0pBSXA2Y1FGTUd1VkRjOWRvWkJVdzhQNWsvalh2Z1dLUVdL?=
 =?utf-8?B?a3JZZ2FCbElqTG54Vlh1cldkd29OU2tJakJTK2x6MXJ3RXFZUWtqeE1jaDRo?=
 =?utf-8?B?SVcxN2hMdEszSXp4NVlCMVZndXBLaGc1MzZBazRadTZDbTVvajUxTEM4MlBu?=
 =?utf-8?B?NjdTV2ZNbEJWR1RHcGRaVzN2ZXRGNTZNMFpab1hZMUxWTndwWlhXV2pvOU1W?=
 =?utf-8?B?aHFmd29ZVUswL3hkQ3IraWFMZkl5bGFlaEw2cGNiZEhudTFXS1E2MUZxZGQ5?=
 =?utf-8?B?S2UrL1JzQTJ0WUZ6YXNZdjZWZU41ZTRjbmpPdS95ekxIMTg5bFY2YWN0QVZE?=
 =?utf-8?B?UG9DRmtZVDhsbzVaUFZ2cXpOSVdlSTI2TXYyb1VVTG9mdGFZQXJyUmpKdHFk?=
 =?utf-8?B?Q0hTUEQ0VnlYZkljZ3JyTVc2VVhmZ1k4R2VjL2ZlRytmS3lTUTA2RzRVajJ4?=
 =?utf-8?B?QlNVcnFNY1MyYXFpQkpuc2pGSHdTN0hZWmNGbWVLMnVvSTUvR0FUS3JUajc0?=
 =?utf-8?B?dWhCbkh4eG9paGtRbEFBTkQ5NWtSQ0pnSmh0YXRza2JGVFB0VnFtU0NWQUk3?=
 =?utf-8?B?RDZuVXVqL3BRMnNnZlFqbVo1NmZmQnRFU2ZaRW8xTiswc016K2d2aUE4YmdK?=
 =?utf-8?B?Mno0MHJCRWtkKzhCZEp3UmVreDNVeGVCZy9MajNnZFo3V2pxdDgrZUNRR3hn?=
 =?utf-8?B?cUhiTVd0emNQQ2p1QVJLcDVUekgzUElkczJXeVpVLzVQVWNSQkc0Y0xXWHpa?=
 =?utf-8?B?Q2RJc3JRZUdXbmNyZ3hBczlDMGtUU0o2cEhYZHJZN0dhYVBCOUl5T1lPS09M?=
 =?utf-8?B?RHd0UnFkRERBQ3R6N3ZNaGI1aW9XQ1hPV2R1dStsQTF4R0NVL0dldUVDSzUy?=
 =?utf-8?B?TUhsbFRpcEllSER0MURiM0U3K081bjJTRFBWN0I3R3JvaW92Y2VaYURGcUln?=
 =?utf-8?B?NTRZNldWaTNZWjIvQ0U3YnNOU09saDlWempyQjd1aHBOSUx4OUpHd3hDVy90?=
 =?utf-8?B?enpLT3lnOVloRXhkdi9BK0cwL0ZET25KeEg0bXJWaGRSOS9UYmRHLzFKV3Nh?=
 =?utf-8?B?S2pJZDMxTDBlMXhkWS84a2NZdmxQajgvLzVVQXl4ZGNBaE1IeWpZcDRjU2dp?=
 =?utf-8?B?cTcwT0ROZ2V0NXdWcFVWU29uYVdrVVRHMVpOMWJhQm9KMlIyaTBRY291UUVw?=
 =?utf-8?B?VEl1SGNTU2VqNWtrRGxOMFY0ZUZRQlJkVkNZcjlCazFyTXhFZjdxUTBYUXBu?=
 =?utf-8?B?a3NEZzZhbjhDVDg0UUxyanFkaXJKSy9zZW15V28xWnZENTZKNTBMMmVXU2xL?=
 =?utf-8?B?N0lGTThZTVpKN2lLUjVYOHRsQytZREVNUEttbmdLRjl1ay91M1Zxd0VRRC9R?=
 =?utf-8?B?WDJBMDJDN1RCQmZBM1B1c0hweURtZkZYQ3lYQXhvVXpMejh3ME5pNWg4bkR6?=
 =?utf-8?B?WDgyeWxJNlFhZ1NOOS9iZ1QxWHY0VnE4bXM2QXp0cHp5ZmJ3RzlKZFB4R3VI?=
 =?utf-8?B?ZHF0L1Q3Z09jT3Q5ZS9mcVQ0d3h2T3ptcTF5aFFsRUZpTDJKNlZwRmNoc3Nn?=
 =?utf-8?B?MjhQa0FQUGIrbVlFdG9nTEhXZWJQcDU2ZmdlZVVTZ0Iwczg4aldXcWIvdGE2?=
 =?utf-8?B?TnRGbHkwMEJ0TG9Wajk1VnJWYndwa05UTG5OcTZDVE0wRlo0bE1Qek12dndQ?=
 =?utf-8?B?THd0TjZKOHY2RFcrUjVYb1g2cUd6TXpFWFZmVVJnS0J5N2JYUmxDRnowcWNV?=
 =?utf-8?B?MjEvdHlkNElVc2hjazFBWDRvUnF5K2M2Yll5MzIxV3A0MzFCVmF2Tjltcjdm?=
 =?utf-8?Q?5TiRo7QJvbRgyqz4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F40A71840CF2D4ABCB20080D30E64A7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaff581-691a-4da4-5466-08df22c543cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 09:44:35.1425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TqnJzXWcvz3fYoYVfhJDpAZNVmZ6FIJ6hMWIbg70o6AMmq5JKmF0QRIf3GFDYwr3+Xi1sAvvvR1CaGnrcPX9mIWz8mlD/J60exIZYKu9/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10390
X-purgate-ID: tlsNG-4011c0/1791193477-4BED2CFC-1F313C99/0/0
X-purgate-type: clean
X-purgate-size: 5050

DQoNCk9uIDkvMTQvMjYgMDk6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wOS4yMDI2
IDIwOjUzLCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+IE9uIDIwMjYtMDktMTAgMTQ6MjksIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTE6NTI6
MTBBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDEwLjA5LjIwMjYgMTE6MzAs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIFNlcCAxMCwgMjAyNiBhdCAx
MDozODozNEFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAxMC4wOS4yMDI2
IDA5OjQ5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+PiBPbiBGcmksIEF1ZyAyOCwg
MjAyNiBhdCAwOTowMjoxOEFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+IFRo
ZSB1c2Ugb2YgdW5yZWFjaGFibGUoKSwgd2hlbiB1bnJlYWNoYWJpbGl0eSBpcyB2aXNpYmxlIHRv
IEVjbGFpciAoYW5kDQo+Pj4+Pj4+PiBjb21waWxlcnMpLCBpcyBkZWVtZWQgYSB2aW9sYXRpb24u
IERyb3AgdGhlIHJlZHVuZGFudCBzdGF0ZW1lbnQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFVyZywgaXNu
J3QgdGhhdCBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgZml4ZWQgaW4gRWNsYWlyIHRoZW4/DQo+
Pj4+Pj4+IE90aGVyd2lzZSBhbGwgdGhlIHVucmVhY2hhYmxlKCkgY2FsbHMgaW4gb3VyIGNvZGVi
YXNlIGFyZSBsaWtlbHkgdG8gYmUNCj4+Pj4+Pj4gZm91bmQgYnkgRWNsYWlyIHNvb25lciBvciBs
YXRlciwgYW5kIHdpbGwgbmVlZCB0byBiZSByZW1vdmVkLg0KPj4+Pj4+DQo+Pj4+Pj4gTm8sIGFp
dWkgbW9zdCBhcmUgY292ZXJlZCBieSBkZXZpYXRpb25zLiBJbiBwYXJ0aWN1bGFyIG9uZXMgaW4g
QlVHKCkgYW5kDQo+Pj4+Pj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkuDQo+Pj4+Pg0KPj4+Pj4gU2hv
dWxkbid0IHRoaXMgYmUgYSBkZXZpYXRpb24gdGhlbiBhbHNvPw0KPj4+Pg0KPj4+PiBNYXliZSwg
anVzdCB0aGF0IEkgaGFkIG5vIGdvb2QgaWRlYSBob3cgdG8gZXhwcmVzcyBzdWNoIGEgZGV2aWF0
aW9uIChwcmVmZXJhYmx5DQo+Pj4+IHdpdGhvdXQgYSBTQUYgY29tbWVudCkuDQo+Pj4+DQo+Pj4+
PiAgwqAgTWF5YmUgaXQgd291bGQgYmUgaGVscGZ1bCBpZg0KPj4+Pj4gdGhlIGNvbW1pdCBtZXNz
YWdlIHN0YXRlcyB3aHkgdGhpcyBpcyBoYW5kbGVkIGRpZmZlcmVudGx5IGZyb20gb3RoZXINCj4+
Pj4+IHVucmVhY2hhYmxlKCkgaW5zdGFuY2VzIHRoZW4uDQo+Pj4+DQo+Pj4+IEkndmUgYWRkZWQg
Ii4uLiwgLCBhbmQgdGhlIG9uZSBoZXJlIGlzbid0IGNvdmVyZWQgYnkgYSBkZXZpYXRpb24iIHRv
IHRoZSBmaXJzdA0KPj4+PiBzZW50ZW5jZS4gV2lsbCB0aGF0IHN1ZmZpY2U/DQo+Pj4NCj4+PiBU
QkgsIHRoZSBoYW5kbGluZyBvZiB1bnJlYWNoYWJsZSgpIGZlZWxzIGluY29uc2lzdGVudCB0byBt
ZS7CoCBJIGRvbid0DQo+Pj4gYmxhbWUgeW91IGZvciB0aGlzLCBJIGtub3cgeW91IGFyZSBqdXN0
IHRyeWluZyB0byBmaXggdGhlIHJlbWFpbmluZw0KPj4+IGlzc3Vlcy4NCj4+Pg0KPj4+IEkgZ3Vl
c3MgSSB3aWxsIGRlZmVyIHRoZSBjaGFuZ2UgdG8gc29tZW9uZSBtb3JlIGZhbWlsaWFyIHdpdGgg
TUlTUkENCj4+PiBhbmQgd2h5IHNvbWUgdW5yZWFjaGFibGUoKSB1c2FnZXMgYXJlIGNvdmVyZWQg
YnkgZGV2aWF0aW9ucyB3aGlsZQ0KPj4+IG90aGVycyBhcmVuJ3QuDQo+Pj4NCj4+PiBJIHRoaW5r
IHRoZSBwb2ludCBvZiBhZGRpbmcgc29tZXRoaW5nIHRvIHRoZSBjb21taXQgbWVzc2FnZSBpcyB0
bw0KPj4+IGp1c3RpZnkgd2h5IHRoaXMgaXMgcmVtb3ZlZCB2cyBhIGRldmlhdGlvbiBiZWluZyBh
ZGRlZC4NCj4+DQo+PiBBY3R1YWxseSB0aGlzIHNob3VsZCBiZSBkb25lIHdpdGggYSBkZXZpYXRp
b24sIGFuZCBJIHRob3VnaHQgaXQgd2FzIGFscmVhZHkgdGFrZW4gY2FyZSBvZiBieQ0KPj4NCj4+
IC1jb25maWc9TUMzQTIuUjIuMSxzdGF0ZW1lbnRzKz17ZGVsaWJlcmF0ZSwgImNhbGwoZGVjbChu
YW1lKF9fYnVpbHRpbl91bnJlYWNoYWJsZXx8cGFuaWN8fGRvX3VuZXhwZWN0ZWRfdHJhcHx8bWFj
aGluZV9oYWx0fHxtYWNoaW5lX3Jlc3RhcnR8fHJlYm9vdF9vcl9oYWx0KSkpIn0NCj4+DQo+PiBu
YW1lbHkgYmVjYXVzZSB1bnJlYWNoYWJsZSgpIGV4cGFuZHMgdG8gYSBjYWxsIHRvIF9fYnVpbHRp
bl91bnJlYWNoYWJsZSgpLiBJdCBtaWdodCBiZSB3b3J0aCBjaGVja2luZyB3aHkgdGhhdCBpcyBu
b3QgdGhlIGNhc2UuIFByb2JhYmx5IHRoZSBjb25maWd1cmF0aW9uIG5lZWRzIGEgc2xpZ2h0IHR3
ZWFraW5nLg0KPiANCj4gUXVlc3Rpb24gKG9uIG15IHNpZGUgYXQgbGVhc3QpIGlzOiBIb3cgd291
bGQgc3VjaCAiY2hlY2tpbmciIGxvb2sgbGlrZT8NCj4gQXMgc2FpZCBlbHNld2hlcmUsIHRoZSBz
eW50YXggdXNlZCBpbiBhbmQgdGhlIHNlbWFudGljcyBvZiBhbGwgdGhlc2UNCj4gZGV2aWF0aW9u
cyBhcmUgY2xvc2UgdG8gaW1wb3NzaWJsZSB0byBmdWxseSB1bmRlcnN0YW5kICh3aGljaCBpcyB2
ZXJ5DQo+IGNlcnRhaW5seSBkaWZmZXJlbnQgZm9yIHlvdSkuIFlldCB3aXRob3V0IGZ1bGx5IHVu
ZGVyc3RhbmRpbmcgd2hhdCdzDQo+IHdyaXR0ZW4gYXQgcHJlc2VudCwgaG93IHdvdWxkIG9uZSAi
Y2hlY2siIHRoYXQgdGhpcyBpcyBhY3R1YWxseSB3aGF0IGlzDQo+IHdhbnRlZC9uZWVkZWQ/DQo+
IA0KPiBKYW4NCg0KSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgdGhlIHZpb2xhdGlvbiBpcyBjYXVz
ZWQgYnkgdGhlIA0KX19idWlsdGluX3VucmVhY2hhYmxlKCkgaXRzZWxmLCBiZWNhdXNlIGl0IGlz
IGxvY2F0ZWQgYWZ0ZXIgZm9yKDs7KSwgDQphY2NvcmRpbmcgdG8gdGhlIEVjbGFpcidzIHJlcG9y
dDoNCg0KeGVuL2FyY2gveDg2L2NyYXNoLmM6MTE5LjUtMTE5Ljc6IGBmb3InIHN0YXRlbWVudCBp
cyBvbmUgY2F1c2Ugb2YgDQp1bnJlYWNoYWJpbGl0eSBvZiB0aGUgbmV4dCBzdGF0ZW1lbnQNCnhl
bi9hcmNoL3g4Ni9jcmFzaC5jOjEyMi41LTEyMi4xNzogcmVmZXJlbmNlIHRvIGZ1bmN0aW9uIA0K
YF9fYnVpbHRpbl91bnJlYWNoYWJsZSh2b2lkKScgaXMgdW5yZWFjaGFibGUNCjxwcmVwcm9jZXNz
ZWQgeGVuL2FyY2gveDg2L2NyYXNoLmM+OjE2MDA3LjUtMTYwMDcuMjU6IHByZXByb2Nlc3NlZCB0
b2tlbnMNCnhlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oOjUwLjIzLTUwLjQzOiBleHBhbmRlZCBm
cm9tIG1hY3JvIGB1bnJlYWNoYWJsZScNCg0KVGhhdCBkZXZpYXRpb24gIi1jb25maWc9TUMzQTIu
UjIuMSxzdGF0ZW1lbnRzKz17ZGVsaWJlcmF0ZSwgDQoiY2FsbChkZWNsKG5hbWUoX19idWlsdGlu
X3VucmVhY2hhYmxlIC4uLiIgaXMgYWJvdXQgY29kZSBwbGFjZWQgYWZ0ZXIgDQpfX2J1aWx0aW5f
dW5yZWFjaGFibGUoKSAoSSBob3BlIEknbSByaWdodCkuDQoNCkFjdHVhbGx5LCBFY2xhaXIgc2F5
cyB1cyB0aGF0IHdlIGRvIG5vdCBuZWVkIHRvIHBsYWNlICh1bm5lY2Vzc2FyeSkgDQpfX2J1aWx0
aW5fdW5yZWFjaGFibGUoKSBhZnRlciBmb3IoOzspLg0KDQogRnJvbSBteSBwb2ludCBvZiB2aWV3
LCBKYW4ncyBwYXRjaCBpcyBPSy4gTWF5YmUganVzdCBuZWVkIHRvIG1lbnRpb24gDQp0aGlzIGxv
b3AgZm9yKDs7KSBpbiBjb21taXQgbWVzc2FnZS4NCg0KRG15dHJvLg==

