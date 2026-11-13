Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240CE606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 01:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=jr8G7dkT
Received: from list by lists.xenproject.org with outflank-mailman.1486667.1689185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRgAz-0006C0-66; Fri, 13 Nov 2026 01:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486667.1689185; Fri, 13 Nov 2026 01:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRgAz-0006Bt-27; Fri, 13 Nov 2026 01:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1486667;
 Fri, 13 Nov 2026 01:34:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRgAy-0006Bn-F6
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 01:34:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRgAx-001OHd-DY
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 02:33:59 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af6689e-bab6-0a2a0a5309dd-0a2a4503a24a-40
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:33:59 +0100
Received: from [52.101.65.143]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af66906-fae8-0a2a45030019-3465418fc9f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:33:59 +0100
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com (2603:10a6:20b:d4::24)
 by PAWPR03MB10043.eurprd03.prod.outlook.com (2603:10a6:102:35d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 01:33:55 +0000
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416]) by AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416%6]) with mapi id 15.21.0592.009; Fri, 13 Nov 2026
 01:33:55 +0000
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
 b=Kc3Ps9OIs/cjKDu3v+evNFC5DjM8owTDl/rXG+6DSpIipXhMUOfc9W5zY3jIt53dyHGx7KORLtc1QBYpBYx/xzyYwJp1IfDDPNJUHRcRTaboKD2uBLl5WMNj3jlUqnXNELC0G8HfwYupIcKO2GsVJj0SPOed/37CybSvL0V+hpfNr3paOe04ZIYdwpReC1zU7hC9T+dpbQT5/7dJJIWhfevI8qIGJchK8x0qJ8MjwL0wOGuWCIepqM72SKxcsLEJ3Lo9ixuSvprY3njeb2gqM6Ni2heCB4UWAWoYceQjIkqYI+u8h9Iiq+WFZN3KNIpkAtYlgaId0HFkfai02q04Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbwW+vhwpRpQTZIAHpOmZOATNTcH+CIUGKN+kQtyNRw=;
 b=Zm+JavryxfewyeuPfl8OPnljP8jF9n/xsyIlxBEkG2xWbTvbiaHSmqtE2iLeVuUsxLrIwPkCrkIND4YX+hR/PhghCC7DCB7AA7WiHzfd91LMMQKd7JzWeq72kqF0UchQJjzOXwR+AexkmjIpQn0i4qXEEugs98r1xGC/TOPPcssKTRJzQASuIsV6bq8E4drZiM/OL07hFF4G0xAebrZgTdrjg4JcdoDbNQuVLMZf3OkjPjjmrVkRym8K1UsbEmwigwaXQout9I8NhNkwVZHurLl7iXJx1NMwXrCbnVOy/tVXx8yz3sOs+bZSk7IJJ+h7lHO2tckRaD/SauBaSyWddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbwW+vhwpRpQTZIAHpOmZOATNTcH+CIUGKN+kQtyNRw=;
 b=jr8G7dkTq9linSiz3Hrc+PgC4sPuKSQP3p/Sf9P28O8MpXeIkcYPPBhAY8Fp+3S1xuhRojqIb/Sck/NYb4Bprpd9ZorSjbwnauCLhudoQIvVsO/LNxeHq4EePIInYf8s8tjmxAMN9HzOVBDmlsztTwQaBpw8QS29vVwehQ+gSVa2yoee8wnlsNmC5SAXcMiWmTU5Rmd77bEUaJUX7aUyiFJIVtYsXikvrMRGwfsPGcgNmCEM6pzAmUyybrW5VEaSH4l3pSWimUr0X8JRwz2mEdSfnHJs9l1PwxgIJnXdyrzVLBL7hpcFSq75xvglUDYfPnWr8qTQSWixx9Svj170sg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/link: Remove CONSTRUCTORS from linker script
Thread-Topic: [PATCH] xen/link: Remove CONSTRUCTORS from linker script
Thread-Index: AQHdcuYXdO6kvJPNQUaD4haEjbTA0g==
Date: Fri, 13 Nov 2026 01:33:55 +0000
Message-ID: <87y0ax8qjn.fsf@epam.com>
References: <20261112204032.3325011-1-andrew.cooper3@citrix.com>
In-Reply-To: <20261112204032.3325011-1-andrew.cooper3@citrix.com> (Andrew
	Cooper's message of "Thu, 12 Nov 2026 20:40:32 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB6070:EE_|PAWPR03MB10043:EE_
x-ms-office365-filtering-correlation-id: 270dcca1-58c9-4cd3-1efe-08df41262e6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|261022075727099003|261021123027099003|261009223027099003|38070700021|260925022911599003|260925021911599003|260925021311599003|10067099003;
x-microsoft-antispam-message-info:
 ccGRV++ktu8Pehm8bmkCQ9Oh8YnHMxoLQaBb6doQA7345wFqPsNWnEbZdlLP69cz/8cbwaHEG4/C/VZlupjE+Toj6YopG5z6yi7OrVwbyyjQoJKGlVE/yT9S6GrzulCTs8YhUpxrla53L8CNBA3mvsIKhcISE5wf8T1Zpawb+pKEtpIZFLo836DEsXbwzDsC5P+dr5eYvaiMVn4EvjTAmcOUFr4tv0w4HC6qJr8XgiNBdW/gPeT0AMZpphF823l6CIJ4rBmtF6I/GAne27zlsqvpl+poPU9I3ukyLYtsblu0yKi6robnBX32Qrf1bOnfhm+dCoe7gf11omiLdJ1fhsAdgKyr10I3Zq3nzlb60rVxkr5MZKGW7UXcc3v/IpBkPW7qaevhUVKcKwjJ0AQ0gDdm6wkiaWz2EEc/eiBS9NVnVLs9P08aRjC+PvP3/gBjV1ZY7SzfETjVVs5rXb0V7eLep5dZxTD7oq3FegkIHVxev1G7onAczo5WAytMQqYnSbB+GqhgfI+/A7a4zQuPXLNTjSzx/Y3q6fU9UWVR0xaTfms6N+p0i2ROH83FX66KV4EyN6DYxaCxhrFrECPOFowK7zV9J2u/O1P6F7KGuvWMCzPwmYQUCLZZT+OymAoStRX+BnLfCjWZ3KvLWzVYKhB4HvzEojOFf67BctHFiqrNs1kLhXuXuVim42VSltZKCwbW6v9SMkmrUdbGMYaraw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB6070.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261022075727099003)(261021123027099003)(261009223027099003)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjJmNlkraXcrRFBhRnY2YldtSEhnaVpFM3Zmek9sN2VJRlBibnNVNnYxMWhx?=
 =?utf-8?B?UW9keTRGMTAyaHBqaSs4Tm96TkNVVjdsY1FSdDQyR3RUNWZRWXZjYkRjRS9P?=
 =?utf-8?B?bVE4M0FPbTFZZ3VyY05jMEx3L3Z1UXdURFMvOTgrZTdaSVNwT2x0aDh5NU9B?=
 =?utf-8?B?aEJZdEJEREN4S2V3V0J5SlFoT0pYN2xDejNTdnpybXJXaVorako0eTJJUXRG?=
 =?utf-8?B?VEFkSllvclZUQnlXQzhISThFUTZ4dFV2dzdhNFRoOGg5UHpVZDBHUDRZdkQ4?=
 =?utf-8?B?ZEt1eG9SUW5HTks1SlZhdVptUFdtQ2Z0MWZjK0NUS1hGZ0hVVzVFekRWUXVQ?=
 =?utf-8?B?ekNTRVpjeHo5NmZ3cG5mdW11RThRV0VDZnE5U0RNSVBqc05FNEdLM25ocnNx?=
 =?utf-8?B?SGhtVDNQZGJXM1g1VWNkT1lwR096T3JBWkJiUjQzT2V2OG1CRXBWUlNWM3I3?=
 =?utf-8?B?MFgzclVYYTBGTTRNRUJlK1paaTUyV3hUcmNaMnBoYmZVMWRYSGxqbDU1S2Jv?=
 =?utf-8?B?UkZ1VEYrQTVyeE9rQlNPcmVNYnZxWjFpMUhsNDdsTk1BclNHcDhlQ3ZOeUJC?=
 =?utf-8?B?MFdKSlhWNHo5VnNWZFI4bmtKa3pIVGZqNmd4RERBTVVEa3h5S01rM2U3Q2lG?=
 =?utf-8?B?UTFiL1Y5UXpjUExaSFBlbXhaTUlpaUI5YjJPVmc5Z0ZkeHA5R1EzdHA5ejlJ?=
 =?utf-8?B?NTdXQURyVFFGTmRveXA4OWpHcmppbWxmeXFIUmFXSFVGSEU0Q20xVm5jQTZL?=
 =?utf-8?B?MzVVOTJPQStqaTF5UlJnOGFrK0lzMXJYRU43RnFVWmsvVVBEeUZFOXRJYXF4?=
 =?utf-8?B?SUY4cDdBM2UxMkgxQ0Z4ZFV1RmNlRXdBRDJrVGQ4OFpnUHJTMWsyWUh1b2J6?=
 =?utf-8?B?UytMTUhZYjBKUlFuRCtoUDBVa21NRGlIUGVWdmx2WHBLaTZXQmMvRk9kdlgx?=
 =?utf-8?B?clp5YmxOcVpGOC9lTnZJd2ZRa0lBTkxWYS9qOU9oeHBJS1ZFbVlKdURPR3p1?=
 =?utf-8?B?WU5TTjRyelVtWnJlMXUyRXE0SStUaG05WitndWJheVovSjdKVkU3K0JIa0wz?=
 =?utf-8?B?dUkxVEhNQk9pWDU1OXdGRXdaMTc1WHZPMmpPY0FlT2lwQUU0cVNMUW5teVBP?=
 =?utf-8?B?MXdsTWcwcEcxaUdzMVpTS053VGNTNG1tWkdkbUJ3SURQeTJqOHlyazREeUUx?=
 =?utf-8?B?dlE2R2RZeWdmaXRTcDhYdzNuemUzbmZtUUlqQ2kzQmFhN1NKQUZxTFpNclRK?=
 =?utf-8?B?c2RNeUF3ZVEyMTdWOTM1VkZkaEpXdXpRejFQc09OQVM5TmpsRHpQaDQ4cXZC?=
 =?utf-8?B?RC9NQWtwWXc0TVNDUWVhNm51VEp4T3c5QnQzL01YSk1PeFN1Ylk2OG83ODhx?=
 =?utf-8?B?REpxTHB2L28xcTVOWndWZjJHdUhSUnB4YitQUlYvc3ZIaU9SRERDK1ErbElk?=
 =?utf-8?B?RVg0bjEwbnhLRlh6dE4yRkc0NjVUMGd1U1BnMk9jQm9OaXBHb0hTN2hIbk50?=
 =?utf-8?B?Ynk2T2UzWDZuaFVsbUZuLzJHelRCeWowL0FleFpCK3ZBY0FLY2tFd1lJSC8v?=
 =?utf-8?B?VUJjbEUxaFd5bVNCK2NxV1FvZ0JrQWIvVFZHQnZmczNzK1FTV2V5V2hJbzNI?=
 =?utf-8?B?UExIUEdtVlUvaVdHdSs3VmQ5SzZGRCtjeUNjcDlCUXdvQ3l2YjVSTUVBVnds?=
 =?utf-8?B?N25xUEJLMnVXRHVYWjh5T1JGOHFvU09IaWczOFU0M1hZMDZSYm5sWHEreE12?=
 =?utf-8?B?N21hRVVrTUxOdU9iNmJMN2UvR0NTVVd2cG5pUTR4bzVjLytkN1o1QkxibGxV?=
 =?utf-8?B?QW1VT05JSHVnRjB4RkhERXRMRVdKZ0dtZ2c3L0F0bHYyTXFkcEZNTXU2a212?=
 =?utf-8?B?aHlmbkFCQXJWRFRmVkE0Y3JBNVV5cnZNQnV1VXJkSVZrZjdTdjFqOVNTUll2?=
 =?utf-8?B?KzFLNzI4TVVEUnh2c3FFOUtab3ZLenU1NkJYa1ZPZmxENkxZSnBQMkFHeFJK?=
 =?utf-8?B?YSs4TUdXSnM1ZEI3WEpSZ2hNQXM3bU5oM3Y0dE9iWTVCWTZLZUVvcGd6YTln?=
 =?utf-8?B?eHJ4NitpdlkybVoveW1DR0hibzE4US9mbXQzM0hvd1FUTUl6dGEwbE9YNnB4?=
 =?utf-8?B?dkdxWXh0ZjBPd0M2YzN2aUlneFYrT1JzeWhDbDVzT3RRUlkzUWNwVHpxdFlK?=
 =?utf-8?B?NDJFUDJLaGU0TkY0LzU4OHUzR1Yvbyt5OGNBVjBITDNTWUVObDBNeGZOOHNi?=
 =?utf-8?B?WWxPUVdlVmxUVGpFaTJsNFVJWmk0YU1tMGRpM1lBYlNEOVgyMjBmY0poL3pY?=
 =?utf-8?B?ZEp0YmR6VUJZRkduR09UdG03T0FFTXZiS21yVDVFeGdaYnYzTzc1SERSQk1N?=
 =?utf-8?Q?YXYxJoto4458kDZM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFB37222CF082D4A93FE1951BE274426@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB6070.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270dcca1-58c9-4cd3-1efe-08df41262e6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 01:33:55.2564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LM9c81jtpzk44Eo1jyvEd+mOUa4LpD2hh2f0ZGIRS5onFIJqSp+2TJXocSc3usXgXHIrHHs5FAXDot9JvzcioWGtp4NEJZ4+iNLZbV1Ua/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10043
X-purgate-ID: tlsNG-33051d/1794533639-756834E9-35A1BC72/10/78276251493
X-purgate-type: spam
X-purgate-size: 3482
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW5kcmV3LA0KDQpBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cml0ZXM6DQoNCj4gVGhlIG90aGVyIGFyY2hpdGVjdHVyZXMgaW5oZXJpdGVkIENPTlNUUlVDVE9S
UyBmcm9tIHg4Niwgc28ganVzdCBhcyB3aXRoDQo+IGNvbW1pdCBiN2E3ZTM0NmM3MTAgKCJ4ODY6
IGRyb3AgdXNlIG9mIENPTlNUUlVDVE9SUyBmcm9tIGxpbmtlciBzY3JpcHQiKSwgdGhleQ0KPiBz
aG91bGQgYmUgZHJvcHBlZC4NCj4NCj4gVGhlIC5jdG9ycyBzZWN0aW9uIGlzIGhhbmRsZWQgZXhw
bGljaXRseSBpbiBhbGwgYXJjaGl0ZWN0dXJlcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFZvbG9k
eW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCg0KPiAtLS0NCj4gQ0M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyQHhlbnByb2plY3Qub3JnPg0KPiBDQzogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZh
dGVzLnRlY2g+DQo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDQzogVm9sb2R5bXly
IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBDQzogQmVydHJhbmQgTWFy
cXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiBDQzogTWljaGFsIE9yemVsIDxtaWNo
YWwub3J6ZWxAYW1kLmNvbT4NCj4gQ0M6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2No
a29AZ21haWwuY29tPg0KPiBDQzogQmFwdGlzdGUgTGUgRHVjIDxiYXB0aXN0ZS5sZS1kdWNAdmF0
ZXMudGVjaD4NCj4gQ0M6IFRpbW90aHkgUGVhcnNvbiA8dHBlYXJzb25AcmFwdG9yZW5naW5lZXJp
bmcuY29tPg0KPiBDQzogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+
DQo+IC0tLQ0KPiAgeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgIHwgMSAtDQo+ICB4ZW4vYXJjaC9w
cGMveGVuLmxkcy5TICAgfCAxIC0NCj4gIHhlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUyB8IDEgLQ0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gaW5kZXggOGQw
OTU0YzkwYWZkLi5iNWNjYzczMmJkOGQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS94ZW4u
bGRzLlMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPiBAQCAtOTUsNyArOTUsNiBA
QCBTRUNUSU9OUw0KPiAgICAgICAgICooLmRhdGEucGFnZV9hbGlnbmVkKQ0KPiAgDQo+ICAgICAg
ICAgKiguZGF0YSAuZGF0YS4qKQ0KPiAtICAgICAgIENPTlNUUlVDVE9SUw0KPiAgICB9IDp0ZXh0
DQo+ICANCj4gICAgLiA9IEFMSUdOKDgpOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvcHBjL3hl
bi5sZHMuUyBiL3hlbi9hcmNoL3BwYy94ZW4ubGRzLlMNCj4gaW5kZXggYjIxNTkyNzkxNjljLi5m
ZWU4MTA3OTE4NDAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3BwYy94ZW4ubGRzLlMNCj4gKysr
IGIveGVuL2FyY2gvcHBjL3hlbi5sZHMuUw0KPiBAQCAtODYsNyArODYsNiBAQCBTRUNUSU9OUw0K
PiAgICAgICAgICAqKC5kYXRhLnBhZ2VfYWxpZ25lZCkNCj4gIA0KPiAgICAgICAgICAqKC5kYXRh
IC5kYXRhLiopDQo+IC0gICAgICAgIENPTlNUUlVDVE9SUw0KPiAgICAgIH0gOnRleHQNCj4gIA0K
PiAgICAgIERUX0RFVl9JTkZPICAgICAgICAgICAgICAgICAgICAgICAvKiBEZXZpY2V0cmVlIGJh
c2VkIGRldmljZSBpbmZvICovDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9yaXNjdi94ZW4ubGRz
LlMgYi94ZW4vYXJjaC9yaXNjdi94ZW4ubGRzLlMNCj4gaW5kZXggZDFjNWNlNTljOTBkLi40ZGM1
NWY1YWQyNmYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUw0KPiArKysg
Yi94ZW4vYXJjaC9yaXNjdi94ZW4ubGRzLlMNCj4gQEAgLTkzLDcgKzkzLDYgQEAgU0VDVElPTlMN
Cj4gICAgICAgICAgKiguZGF0YS5wYWdlX2FsaWduZWQpDQo+ICAgICAgICAgICooLnNkYXRhIC5z
ZGF0YS4qKQ0KPiAgICAgICAgICAqKC5kYXRhIC5kYXRhLiopDQo+IC0gICAgICAgIENPTlNUUlVD
VE9SUw0KPiAgICAgIH0gOnRleHQNCj4gIA0KPiAgICAgIERUX0RFVl9JTkZPICAgICAgICAgICAg
ICAgICAgICAgICAvKiBEZXZpY2V0cmVlIGJhc2VkIGRldmljZSBpbmZvICovDQo+DQo+IGJhc2Ut
Y29tbWl0OiA0MjYzZmU0MmI3MzY1OTZjZmE1YmZlYzY2MWYyZjU1ZjAyNzU5YWE3DQo+IHByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogNjgwMDcxMTQ4MTI5MzIxZmZhZjdiZDc0MzVkMDMxOTA0MDE0ZjU1
Ng0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDRlYmZjMmExZDhjZDE0Y2MxY2Y0NzdiNmRiOGNj
OWVmNzIzMTA2NzQNCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

