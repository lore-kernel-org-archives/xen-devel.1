Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB1606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 21:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=dpnbP4Y9
Received: from list by lists.xenproject.org with outflank-mailman.1493238.1693327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQmK-0003Fi-Ik; Tue, 17 Nov 2026 21:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493238.1693327; Tue, 17 Nov 2026 21:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQmK-0003Fb-G6; Tue, 17 Nov 2026 21:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1493238;
 Tue, 17 Nov 2026 21:31:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTQmJ-0003FU-RF
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:31:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTQmI-0004qo-Se
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:31:46 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcc7bd-e002-0a2a0a5209dd-0a2a4509e8b8-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:31:46 +0100
Received: from [52.101.66.91]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcc7c2-be1a-0a2a45090019-3465425b909b-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:31:46 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB7655.eurprd03.prod.outlook.com (2603:10a6:20b:34f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:31:45 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 21:31:45 +0000
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
 b=nwUfdEKGYKNCZaDZvQjWfvfaSuCfrJOsq3EonqQBx5VTr5KVEXc+tsrtzwMUoCXva/of+Mim9ZeizDeFX/K23PufsK9+mT+Efjn9ISoNBsa3FQ+EPbGH3rihmK8WGdSNSCn/7+KspdXNOfF2HCEjHYgu0kIjhw6aHTKXL0RTg4tFfE4SPMUoh6T+KcL00j6iP3n3GTXLpRkfmCT+VKCCDmJ4B/X+ig/+wlnm50+E4l5MnMIwuCWpwRTpKpSnYzm38BNNMsJL99VvoMk/246F8t68YdB7idmULXLTA2LcGghkSQV5sKzxHtLuW94vWmfEgryCR1S7nZh7X9d9OFIxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS4FOq+gx0XLaq6e+JhIdA2zgGATpIC0hJ5eH48iM3k=;
 b=pSgSotWWLBUv6gJfclMH/cD4nNdIvFEUEG/H61jwBTzsWCl3fHN/Ou62gnQY911Id0/L756hqeVvXTa+BWrQ03xWLVNyI6zywc/xKleZxTLUemJ32fMdP8dHGGMXdl05QrCWpw9zYDyq/hYW8Y22ReWkSR8ePfNrNMJbAhjDbN05CIusHyw6LYsajvjuBPgzqje0CVe1oIu8NLaqpKuruFWUj91TXDmjWT4bmSESdSetDJt5kmmM5MBH4yP7OkNlDb7QNpI3B68AZf5CDGbU83IKVhj8jDGSrj8s592LYwj2vJRyBFOsEb+oav1lFFzPPyl32tSgffmP94mJOBcmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS4FOq+gx0XLaq6e+JhIdA2zgGATpIC0hJ5eH48iM3k=;
 b=dpnbP4Y9N8otngLEEEh6aXeYsJyBg79WJWdpQlL6Rw3BO/yriBDMsHdODn/yz7VglmSdMK1KWGDzpjcDrw3KOUq06e4hv+ZfgJRrawqbs+HV/VVjmXNDJm+jI+ryKF/ZY3+hSoaca086kKY7wjuuRCWX6SRuJca6LLTuBnRVCOKXzSiPJ02mRyu0tUpXxCKsXFOaqx6MUDWtcWcqY5vlgycoocRX+KfgKyCEikRhOU4bRyUuau5srDQ+1im/CB9qGq3g/wy5xO9++ROVr5FECeKSC+M8HPqdUhILqKBiZ5IgTC5OAe8V6yNoGZjFtt86bffo4MCeb6qfma+YIlXEqg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: deviate MISRA R11.8 for capability enable callbacks
Thread-Topic: [PATCH] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
Thread-Index: AQHddtsL6F0/2Q3MIESmeIeKPz/reQ==
Date: Tue, 17 Nov 2026 21:31:44 +0000
Message-ID:
 <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB7655:EE_
x-ms-office365-filtering-correlation-id: b4619cad-5877-4af6-ad8e-08df44f22dbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|42112799006|376014|1800799024|18002099003|6133799003|11063799006|56012099006|261028144727099003|10067099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003|38070700021|260925022911599003|261022105027099003|260925021311599003|260925021911599003|261026121527099003;
x-microsoft-antispam-message-info:
 VT2ITynBdzvTMmLyWTHV/oQq7KuRvpflKsaIDT9w9vu9bnnavBXgBipYYIU7OwZcQ2uOIA6JzSh2y8dQB9A5C+K+pZ3mZMGogOll5ykeohLhJeWJFUoaS3Nd9Rge6PEOrSi83LvTagnR9zlOKRfKbTGdL+uKUwvGPLFVYrg6AjfVdpEW7jsIzfFJJoHoHW3b1cPTxN9I0clZIiRKcqOjTnq/agqueZS0dee9ME5MHt7kkA+Du3kDEud+kkUXwQNAG1cfpvT2FFs2tIqy+3DIl//xLzGV2FM4nE/cW8NYY5T8JtB0xL9ccdusc9cXZgtRM5n8dBQjgjQWcNjKjolO9mUGPZysPE/Z1nBp36GPv9f6r2U/c8GQbs+tM9qVfBjrL2yoJXYAczTpNpYyxvrC3N66l1MphFbjUX6Nl/lW7hopGvYN5umX7FIMtQMM3+iEB+TuTmrcmzGnEIW+dheXOxH7cF8JBEv8/1cjrmEKs1x7G18s4ej/cn1wJEhl+drvGvzQMG2eEbrTyxxEukGraG4tJOI+5FtUnyu0z4zTwFNoC/nwOikuGmGSle5pRnMoivjSD/IziZ+nD3bqwQrQ9TkMvKOfoH0oIPZn7OJlLnDkqBtfgQEOqx6+ClbVdgYfisk7v0XmN/WFVjbmOK1dGkPfKVfsd6KVN2mMgfkYdMuaXNqo91zzwpim2anFbve3sjNHv//8Br47mZHru0FlnSFWH9HxXkxrYLf54qtAQQQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(42112799006)(376014)(1800799024)(18002099003)(6133799003)(11063799006)(56012099006)(261028144727099003)(10067099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003)(38070700021)(260925022911599003)(261022105027099003)(260925021311599003)(260925021911599003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTRBUnQ3UWFWdndUMDdDQUxLanJmT2RXa3RuOHkxOVRXWS91cnhtb1ZuenVZ?=
 =?utf-8?B?RndLTkVSTDFqWnA1L2Myd1J1TjFTaUgrNW5OaE9mdlBaR1BCd2FlYXlHampL?=
 =?utf-8?B?d3NZQjlDS1FLdS9RZXhHd2hOQ3Y3T3UraVZJSUZyQWdYTjRmQUE0YWhBdi9O?=
 =?utf-8?B?cFhETVpOc1lraisvMEJmaDNLY1YwOXRWMUw1YVdCdGNyOVRTV2w2Z2VqeHNQ?=
 =?utf-8?B?ZndLeG8zdDdGRmxDTnNVRE9MaFRFeS80TGo4WEVFVG56eEFOZG1Dc0pDdE1j?=
 =?utf-8?B?bi93aVd0dXB0dHRGMVpPdFh1emJ1T01ISjVNaTU1T2JoTkE4R1o5eHJ5UW80?=
 =?utf-8?B?YW1pdVY0dzZ5WXlCbU5hZ3BpWnYvQWhPd29GM2luVDBUT1AxcWNpWmQzSTY0?=
 =?utf-8?B?Y0xhZ2NDOGlMWE91OXB3WHptWHRYbDZkYU40SlJYUzNjcVdOQS9UUmYxZ3Rz?=
 =?utf-8?B?aGRiNlM2dXFMOUljbTkvcDBSdFljYUxnajNwQi9ycHJJbEVHSEd1ZzhVeUhT?=
 =?utf-8?B?NWV3eHlTTExMRFl5YjAyQnIxYWNDRDNFOTZpaTROWjJ2dW9LRXlhQ1Q3akNM?=
 =?utf-8?B?OTNlakFlbXdFYzVCYm1QazZLTXF1VDB1SnovZ3UrN3l3V1VUTjdqdlMxWGVh?=
 =?utf-8?B?QW1lV3pzOUt2eFFRVGdWdlVnOW53TitOWk9jUHR2TDJVUUxqWUlrZ2xFSC9E?=
 =?utf-8?B?ZUtNTHRBZjl6eDJxRDE2VG9iY2dWUzRCK3Y1UXQ1WFZMUVVwQmk4WGVCclBy?=
 =?utf-8?B?bXNzSFA1aXNDUjhRdEFwcGRud3lBWGJvbkVBR01kOWJSWVcwcWc1eDk0dlBH?=
 =?utf-8?B?Q2dZUUxXUUk1K2hpdG9NT1ZsemdUZG5aLzhocnVzWWpyVlJ5a1VFZVhzS3RD?=
 =?utf-8?B?V2FSMW9VeFNsQTdLeUZhLzMrQ3N6Tkdyd281SmNvd2luZ1pZT0UveEhaN2hP?=
 =?utf-8?B?b0VuRFp0dGk5ZFJnaUZycTdRL2xLNFcvQlJVZzQ4cVMydHdsZ3gxSmc0TGdj?=
 =?utf-8?B?OSs3TzR5a3FLNTJqWWNsYSt0UU5KcitwTUxLNklyR1IwSnNVK1NhY0UzYVRG?=
 =?utf-8?B?cWd0YkRYcndMZlF0VXhDVzlHRlRJWU4yUzZnZGZROXVQMmQzbnpINUdlNGgw?=
 =?utf-8?B?VndMNjh1MzZaTFlTQ0owYVdvb25XRWtUd083QnpUc2RDUk44dmF0Y2YvYUky?=
 =?utf-8?B?UTJoOURwQ2VocHJzTDFoeFRTNG9MQTRzOCtWak5udVAzNllwb08xZHVGNklV?=
 =?utf-8?B?UWd6VkdoTVFrZHdWODQvSWpHbS9MdS9KcHFqSWMzYklGelpidDZCNGltVG5a?=
 =?utf-8?B?RDRNamFDV0NoUDBDZEhuTDhwL3cyRHlFNzcxRDdodTE2YlJzcFlMNU5qU0Qv?=
 =?utf-8?B?VlNxUWRqNTNHNGthMUpRbXc0UUg1U0FTT0l2T1BZUFZwUEkwTmJJc3VDYnVt?=
 =?utf-8?B?ci9lVEJWNHIvM3luNDY0anBKbllFMmJyREFSMUhFbDB1bk5sdGNHVkFGM2Js?=
 =?utf-8?B?NzQ0bEw3Qnk0eFVxaklrNlJzOUFISGJQMGJjMnJERG9xejI0WGpmYzNRYm9B?=
 =?utf-8?B?K2xXNXREeWpSWTExTWZmTFYyQWtramgyaUVSakpMU0RiRzJzY0VERVZqLzcr?=
 =?utf-8?B?dnJHYWI4aHJWNGliMll6MGtaTXVubmZaVUJ1SWJMSTJZODZVcFpJVkxac2tW?=
 =?utf-8?B?TlREZ2U4ZTJZMitOZ2loSmNBVzArMEVRSDJIcVQ4WDl3S3hwU3llalRXbzNj?=
 =?utf-8?B?VDc4c3ovck9Sa2N5VFovcWtMUmxqVkhGbktKWTA0UXhzM1h4N21DM3d0bXFZ?=
 =?utf-8?B?UmZLN1hYTHNuOVdsbDlxMjVCNUFaMWsvRndWUDdpdE44U25Lc05uMmVNZDdT?=
 =?utf-8?B?SWFUS0hMNkVwR2Q0OXdJTlJxWmJoWlRhc21XcWFWVW1sZ1R2Wk1sWS82aEw2?=
 =?utf-8?B?WEo0TzNzbFNlcUZlQXFMVnJWaUtDbkh0UTcvbUdmeEh5aUk3K3V3ZlZCZ1Jx?=
 =?utf-8?B?bm40clRDVk8zRHBXR08wU1llWThkbkk5VGl1YUZYcWsyM3pwUlJjYUo5eU4v?=
 =?utf-8?B?aVpNeWxaOUVSUzdKOGNYUUhBVDVvWG9GVHVOK2g0eFFUdERENmVNYW9mMVNU?=
 =?utf-8?B?QlduZ1JMbUloTm1LbklVMFFqTzRtQnJIbWk1MWl3b013bGFuTnJvRzF2bzQ0?=
 =?utf-8?B?dktEUnlpMjJSNDBxUk5kSnl5Vk9sMUwvOWovRWx3Wk1tS2hwMjBGcHVnQWtX?=
 =?utf-8?B?blhxREVqWmhWbzBKS2RHZmR5Sit0SXhxQnRFcHBhWWNmT2ROT04zNDJHQ3ZL?=
 =?utf-8?B?N2x5R05TZjZveDBtSCsvWEpmNitSYXU5ZWlUZVNHKzRuc3pQZkZmNWY2MnhZ?=
 =?utf-8?Q?LuPNj0FASAZbl8b4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4619cad-5877-4af6-ad8e-08df44f22dbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 21:31:44.9823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgikSDTNQ9CDY5BLq89GRmIZr1edln47wBSLzTPFs/+cV3frIBehXW1fBuHqJzIu10RNc4In6FV+CMVZa+BZi3iU83JJc94DK571V/t1qBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7655
X-purgate-ID: tlsNG-bad1c0/1794951106-39CC7034-A8BFD807/0/0
X-purgate-type: clean
X-purgate-size: 3630
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDExLjggZm9yYmlkcyBjYXN0cyB0aGF0IHJlbW92ZSB0aGUgY29uc3QgcXVh
bGlmaWVyIGZyb20NCnRoZSBwb2ludGVkLXRvIHR5cGUuIGVuYWJsZV9jcHVfY2FwYWJpbGl0aWVz
KCkgYW5kDQplbmFibGVfbm9uYm9vdF9jcHVfY2FwcygpIGNhc3QgYSBjb25zdCBzdHJ1Y3QgYXJt
X2NwdV9jYXBhYmlsaXRpZXMNCnBvaW50ZXIgdG8gdm9pZCAqIHNvIHRoYXQgaXQgY2FuIGJlIHBh
c3NlZCB0byB0aGUgY2FwYWJpbGl0eSBlbmFibGUNCmNhbGxiYWNrLCBlaXRoZXIgZGlyZWN0bHkg
b3IgdGhyb3VnaCBzdG9wX21hY2hpbmVfcnVuKCkuDQoNClRoZSBjYWxsYmFjayB0eXBlIHRha2Vz
IHZvaWQgKiBieSBjb252ZW50aW9uLiBFeGlzdGluZyBlbmFibGUNCmltcGxlbWVudGF0aW9ucyB0
cmVhdCB0aGUgcG9pbnRlciBhcyBjb25zdCBhbmQgZG8gbm90IG1vZGlmeSB0aGUNCm9iamVjdC4g
RG9jdW1lbnQgYm90aCBjYXN0cyB3aXRoIFNBRi0xNS1zYWZlIGNvbW1lbnQuDQoNCk5vIGZ1bmN0
aW9uYWwgY2hhbmdlcy4NCg0KU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRy
b19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCi0tLQ0KVGVzdCBDSSBwaXBlbGluZToNCmh0dHBzOi8v
Z2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBya3A0ay94ZW4vLS9waXBlbGluZXMv
MzA4MTIwOTIyOQ0KLS0tDQogZG9jcy9taXNyYS9zYWZlLmpzb24gICAgICB8IDggKysrKysrKysN
CiB4ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jIHwgMiArKw0KIDIgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZG9jcy9taXNyYS9zYWZlLmpzb24gYi9kb2Nz
L21pc3JhL3NhZmUuanNvbg0KaW5kZXggMzU4NGNiOTBjNi4uNjdmOGVkOTg2OSAxMDA2NDQNCi0t
LSBhL2RvY3MvbWlzcmEvc2FmZS5qc29uDQorKysgYi9kb2NzL21pc3JhL3NhZmUuanNvbg0KQEAg
LTEyNCw2ICsxMjQsMTQgQEANCiAgICAgICAgIH0sDQogICAgICAgICB7DQogICAgICAgICAgICAg
ImlkIjogIlNBRi0xNS1zYWZlIiwNCisgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQorICAgICAg
ICAgICAgICAgICJlY2xhaXIiOiAiTUMzQTIuUjExLjgiDQorICAgICAgICAgICAgfSwNCisgICAg
ICAgICAgICAibmFtZSI6ICJSdWxlIDExLjg6IGNhc3QgY29uc3QgY2FwYWJpbGl0aWVzIHRvIHZv
aWQgKiBmb3IgZW5hYmxlIGNhbGxiYWNrIiwNCisgICAgICAgICAgICAidGV4dCI6ICJUaGUgQXJt
IENQVSBjYXBhYmlsaXR5IGVuYWJsZSBjYWxsYmFjayB0YWtlcyB2b2lkICogdG8gbWF0Y2ggdGhl
IGdlbmVyaWMgY2FsbGJhY2sgY29udmVudGlvbi4gVGhlIGNhc3QgcmVtb3ZlcyBjb25zdCBvbmx5
IHRvIHBhc3MgYSBjb25zdCBzdHJ1Y3QgYXJtX2NwdV9jYXBhYmlsaXRpZXMgKiBpbnRvIHRoYXQg
c2lnbmF0dXJlLiBFeGlzdGluZyBlbmFibGUgaW1wbGVtZW50YXRpb25zIHRyZWF0IHRoZSBwb2lu
dGVyIGFzIGNvbnN0IGFuZCBkbyBub3QgbW9kaWZ5IHRoZSBvYmplY3QuIg0KKyAgICAgICAgfSwN
CisgICAgICAgIHsNCisgICAgICAgICAgICAiaWQiOiAiU0FGLTE2LXNhZmUiLA0KICAgICAgICAg
ICAgICJhbmFseXNlciI6IHt9LA0KICAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCiAg
ICAgICAgICAgICAidGV4dCI6ICJOZXh0IElEIHRvIGJlIHVzZWQiDQpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2NwdWZlYXR1cmUuYyBiL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMNCmluZGV4
IDhkOGNkMTlhOTYuLjRkMmIxODNhNjIgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vY3B1ZmVh
dHVyZS5jDQorKysgYi94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jDQpAQCAtNzIsNiArNzIsNyBA
QCB2b2lkIF9faW5pdCBlbmFibGVfY3B1X2NhcGFiaWxpdGllcyhjb25zdCBzdHJ1Y3QgYXJtX2Nw
dV9jYXBhYmlsaXRpZXMgKmNhcHMpDQogICAgICAgICAgICAgICogYW4gSVBJLCBnaXZpbmcgdXMg
YSBQU1RBVEUgdGhhdCBkaXNhcHBlYXJzIHdoZW4gd2UNCiAgICAgICAgICAgICAgKiByZXR1cm4u
DQogICAgICAgICAgICAgICovDQorICAgICAgICAgICAgLyogU0FGLTE1LXNhZmUgUjExLjggY2Fz
dCBjb25zdCBjYXBzIHRvIHZvaWQgKiBmb3IgZW5hYmxlIGNhbGxiYWNrICovDQogICAgICAgICAg
ICAgcmV0ID0gc3RvcF9tYWNoaW5lX3J1bihjYXBzLT5lbmFibGUsICh2b2lkICopY2FwcywgTlJf
Q1BVUyk7DQogICAgICAgICAgICAgLyogc3RvcF9tYWNoaW5lX3J1biBzaG91bGQgbmV2ZXIgZmFp
bCBhdCB0aGlzIHN0YWdlIG9mIHRoZSBib290LiAqLw0KICAgICAgICAgICAgIEJVR19PTihyZXQp
Ow0KQEAgLTEwOCw2ICsxMDksNyBAQCBpbnQgZW5hYmxlX25vbmJvb3RfY3B1X2NhcHMoY29uc3Qg
c3RydWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzICpjYXBzKQ0KIA0KICAgICAgICAgaWYgKCBjYXBz
LT5lbmFibGUgKQ0KICAgICAgICAgew0KKyAgICAgICAgICAgIC8qIFNBRi0xNS1zYWZlIFIxMS44
IGNhc3QgY29uc3QgY2FwcyB0byB2b2lkICogZm9yIGVuYWJsZSBjYWxsYmFjayAqLw0KICAgICAg
ICAgICAgIGludCByZXQgPSBjYXBzLT5lbmFibGUoKHZvaWQgKiljYXBzKTsNCiANCiAgICAgICAg
ICAgICBpZiAoIHJldCApDQotLSANCjIuNDMuMA0K

