Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F6FCA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:15:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446060.1662019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD3n-0001sc-Az; Mon, 12 Oct 2026 10:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446060.1662019; Mon, 12 Oct 2026 10:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD3n-0001sV-88; Mon, 12 Oct 2026 10:15:11 +0000
Received: by outflank-mailman (input) for mailman id 1446060;
 Mon, 12 Oct 2026 10:15:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGD3k-0001sP-RN
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:15:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGD3j-003ziU-Ko
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:15:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6accb312-e002-0a2a0a5209dd-0a2a450a8f0e-42
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:15:07 +0200
Received: from [40.107.162.80]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6accb32a-f2d2-0a2a450a0019-286ba250b6fe-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:15:07 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI6PPFBC76E4C1C.eurprd03.prod.outlook.com (2603:10a6:808:1::38c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Mon, 12 Oct
 2026 10:15:05 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%6]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 10:15:05 +0000
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
 b=DASIu5pBHbQ+nhKw4HjPq1KtenWnWr4ZYE8lryuPQXgegxMtB7pGfqDtkDjTR7bg7M3UqSt4WExhY4ZO5vJvHlBgfBEZDfhamaI8uKZucmwjlsdHJRUwFFT2Wj5yGCjiMkPtC3jRZM9ie/ocF/dVsyMB0iBbOt0V1BExMR3lKbvaqfFn52ksurjZsqHwluuGBvw46Ed+0QLtJnZPqRS0gN3bLYW7As9W9T4zEOvl1HIYe3Bq4ICkRIE4RpmlAzsHo/NIhobwFBOBPiWEuEkqUCfBXctK4Y0irlXqgvP8/9ptfEz2Kr6D7ODgU1S4zLPYXiMGnyxXdd41XHX/BF5fYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdSVHxmzLHDAE4+2UJMx+JXYC1Wuqrav4CgAXIvbqtY=;
 b=Y0iZRtAeFHZSpp1D9vDSJ6QU9VOv+goVZMgmcsWRl5fu7WAZziTiRoIGTn+5ju0FHKgo1+rc1nXsZHR8Bc/+OHxTmRphk/rZf/v4NBEEl4WcOaQ7rozCkjcCNvwxVXMk2ofsUk+bVk1rbCK/4t+ZSXXfJJYUJXOj67cRXkrbjrIuqIoJpPWZPAKhdZ0QgIgt+t+ACNIkEU3jVMbvbXPir4c6eE/fLRuNh3+srGVnMI8jTMf3OYgAjsvT/OK4wOHCOnnmCP/hJRJ1Fw1tVQPaOlONOU9vmKdDw1OmIfqATALS9Ew3xCLfU15Qu/hzPKJ7R+gi6ae5v/9lk/4YtzkV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdSVHxmzLHDAE4+2UJMx+JXYC1Wuqrav4CgAXIvbqtY=;
 b=fi+sIlEYDYmrbUxTP6E/S7+HLQkrWu1vLQvj+35wezXXh8gv66IoGIJGUKXAW9OHT3IR/AJP2hSu2TT+OmIo3YhrfI1Ku3c4fH9luqYkh8ZX8lCt8e7lmD4UQAIfDT6Z5P+VF6BakSg5pyuJ6fYx2ZVwBioq/plXKKYuhvqnVaNBkf23f7TlER8X8Iy/qoezW86Zb9ij3/ue8SBYQnHdHhz3TF5QyQ50xn53OVRHntN/Nc0lAms/jAc2hKQwiXxMmjLaTrV1o2g5ZORQpbOaWtp0aZKbp+RzQnnBrLOkNaDniX0vbhF95fnYIcylGiIOUcHnyFfEv7J0eec1HhTSoA==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v4] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v4] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdWjKML/KTfuhVBE60GMkd6tz7+A==
Date: Mon, 12 Oct 2026 10:15:04 +0000
Message-ID: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|VI6PPFBC76E4C1C:EE_
x-ms-office365-filtering-correlation-id: df1829bd-def3-4238-712c-08df2849af75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|11063799006|10067099003|56012099006|38070700021|6133799003|261009223027099003;
x-microsoft-antispam-message-info:
 TF5ze+4vjmVJ/SuDBHBdjcpDQjcsZbPylR5B7irq0gGWvGs7elKtZyf4vlA0OQwIltD1C620G8+RRHMbnihTRaIl1v3xMam5kHYVDWcYjzvdPszEEf6Z7LnII5LKsmU4TYnKwRMiizi8Zo4GOoibB7RPBnugaHgXTkCogkcdQTq8tHA+mhnIyfDqePRxF+ufe6I2fPXeBI9Gjj2YIdCenxKav82CpihkbqnUUiQXkJYOHQbycSkJKqFwPXiNgMx31/0EvIBVjw1LWnwZZAoLGTlumJpFM0MFpqRbkD2RGRYuwk3H+H81BXd5hETFiqdrp1LkEYKr1jayZ2ZGDNW8ZzcwPxWOAvf9/bkkmJ92Nb5/gbAthP+mybwULVeb6hC9/B7rp/C/cQUejg05woYUSH4dFfCr6MKbfKkldPincjEERr7OgOOhC+6YzsZ7h81n2gkLmvEeKTNByivqDZASStCdqLGQWq6UDuGo+FZyqGvARrLlKHTMdeusG+8boHIpnO7VQwtAm1xnByvxQrgTg+v5zZ+SGFTDosm2I3uL3MItHcMcbOGp5WP6xhbEL+9TtMUXePHU2/6uZTkYLF1dAwbeWpBVbJ4XPqDrroK/Sor6tBpBatTNxpmTV0JGbIorpDk0g1k79qrshyOaD8drZrRaVjvDafkk7ppz+p2N6rzJgP/NLOkCtAy7V5TlFrdXMSsXgaGJu+sF9AcWQQcJXOAqMKfjw7L6DUe5TI0H380=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(11063799006)(10067099003)(56012099006)(38070700021)(6133799003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d01aU3BhMU16WUI3QVhaQllwc0FWUnQ0aEM5WlhkK1d5K2ZaL1Bjb09sZlV3?=
 =?utf-8?B?di83NVFic2xYNnYyQzdXaFBNVTFvOVllbklMNHdMQ1QxWjhxTkdaVldwaUtF?=
 =?utf-8?B?aGhaK09QMDdMZm1YeVBoZ1R5V0tTMzRFakRQRUI0UjVyWTQvUTFybU4rdXh3?=
 =?utf-8?B?WFQyT2pTSWNxUHJkUThuSHVIVm15R3dVbDVIdncwRmMxU203S2xVNW8yMzlE?=
 =?utf-8?B?M1I4Mzh1NHNCa3lXd3VQTGtpWGUzMGVYTjBGS2l5b1loWlZibmF5RXptSEZU?=
 =?utf-8?B?Q0J0Z25GU3VMbld4Y1QxbUhRYW1tclRhcDBlYnBCUzVSSERiQWxiZUx6Zjh5?=
 =?utf-8?B?dlEydEhtR09wZmExMjNoN3FXUWxrR0F0M00xeit5eFUxdkFITkRKcG9GT28r?=
 =?utf-8?B?YWVQR2ZrY0lyU1gvTkMzL3MzMXpmdURXaEIrZ1lVbXY0N0swWnlzYXhsbVpE?=
 =?utf-8?B?emZDUFJ6TG9lY3E3dytrU0dRU1M1TlZ4d0k5bVZxemZwSmltdGJpL0VqYzkr?=
 =?utf-8?B?Y25GTG4wNmk3Yml1a05pQ3UyMEhOQVJRTmhZcjU5VlZxdW5ialV2a05aS2Jn?=
 =?utf-8?B?K0NUTEJoY0tHVEhsdUM4UXpacGkrYlFlY2wwRk15bnUwdDdER2JDY0sxNms1?=
 =?utf-8?B?ZE5NVitNelQ4WWp3cTFqRXFxQ2RqVG5QWGpHdWNhR2ZSR1FFd1BkVUY2NnF6?=
 =?utf-8?B?Y1p1S3FaZ1RRdThjQUZ6bndyZFZpUUxKUjJEdmNlVGU2U254WWJXR1p5cjA5?=
 =?utf-8?B?b09xeHd5U0NCUWY5dytIL1plSlp2WlBTUFA5eUl5VzBkaWJBL0U2bWJSL1Ey?=
 =?utf-8?B?U25CN3ZVRHlmL1g1YWIvMjgvTkNqbXpRWnlLOU9SL1Zza0czM1VMTktFeDhI?=
 =?utf-8?B?SFh6RG5qZUVRTUdtNDYwdVNQQ2RTZU5ZckZsTlIza0JDTnZHMnVRWUFreFhp?=
 =?utf-8?B?VG1GNkVxTC9mYUZkVk8wZTU4SWxqSTVjOXk5Sk9hWDBrcXN4WFRaOWZPNUlT?=
 =?utf-8?B?aG9BbGRBSDJhbytzNkJrU0RIczZGSG04ZXJlSWJFWUtKeG56Um9EVTlScWlG?=
 =?utf-8?B?TjBuTEpnRFhEcnB4cWNiNEhDelJxTjlHQ2R6S1FhVXduSC9iNi9aMDYwbkcy?=
 =?utf-8?B?QW5KQjdBVW0xSWJ6SnFVdXJBbzBJNjQ2em95OXNudFplVlplYW9vdVZvczFB?=
 =?utf-8?B?UXIzSUwvR25HRytneDlGdFVhVWdSWXpDdFFQZDB5Y0t4VktsUzF2cG1PWEpo?=
 =?utf-8?B?aC9OaWVnb2Q0enp5d05BTkMzeURnd0FMa3RpcXpwbjY0OXZQUjJja05qTVZ0?=
 =?utf-8?B?dGRIRE96SWZYOGZBTkNxa1JuL21DNVVwcEYydXVPbkdBZTZ2RXVlSU1IcTdh?=
 =?utf-8?B?WXlmYS8yMVQzUldqUVVXOFcrcUx4ZEg5QTFIM3FXZWYwL1phZjZhc2dZR1lz?=
 =?utf-8?B?YWRJOUNWL2t1TnBPNXptZlZXYTJoU2owa3JRM0dtWFV0cnhFWTRzczBNWHJ3?=
 =?utf-8?B?dG5XdUxJQVZXdURHbVRjb25MbWhEVnBGclRXb0pSMG5wY1JVZGdGaVk4czdk?=
 =?utf-8?B?SVlGT1pYd2RLWGd6RWxYa0NQTEFMV0ppYzBjL0lkVGxNcERyY1k5eWtkQWZC?=
 =?utf-8?B?NFZ0OSt3VVk5Rkx3Sk44bEIyNjVyU0lhTitIVjhDZU1FNFdzZzRKcjhzTHpO?=
 =?utf-8?B?aDkzZUdCd0UxKzlTQk15dXJtR1RBREt3NzhKcStmVjFLclpiMGZMM2xzdldY?=
 =?utf-8?B?N1hrZWJITXVYZTg2MytEYm5CNVdFUTVCOXhaNFp1ZFp6eUpudjl4Sm4vbHlS?=
 =?utf-8?B?UFU4QjVna0tTa1F6dituVFRmWnQyVmpSRG52R0RVdUdPTUlGY1N4TGliQzRi?=
 =?utf-8?B?aEkyenVpaUF1R1JsWDRBZFNuOHZGL25Cd0E4SkJoT1dIQlpyakRiN0tiMUx3?=
 =?utf-8?B?cE01aStCWEplTU9oYnpCRytWSEE0VVdzaDdOQzNISUpBRkxCRjZYZE5DUE1y?=
 =?utf-8?B?anRKZndRbjdpRmtyRlJXaWV0Y3FDc3hFeDNCL0tKQm93bE1jdDErWUtYYmU0?=
 =?utf-8?B?amRtZFdDTXdqdStQTVZWYWc4d0VYZFZVcURISmtuRitlS1ZIcDdwTS81Smow?=
 =?utf-8?B?QXV2bUVVMEZiUmhJRHBsR0dNM2hPWlJiQitFMkhPNDFBUCsyeGt0dzYwTVpq?=
 =?utf-8?B?cFhBVmpsS0J0bXVvQWVja2MzdWxLa2NWSS9Pc3pOdzRuUU9kZVBhMzY0aXVz?=
 =?utf-8?B?MUUyMEplTS9SamprYlBlUmptdjFEZExxTWx5UWRKelVENUZ3SkhGNm80Y2ZK?=
 =?utf-8?B?bDFmVGZYcVF0L0VVM1djZUV6bGtJcHNDL3dqczE3bjQwMlNZWUpHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57DC008872D7FA4A91EA4C4DB9B4B4A0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1829bd-def3-4238-712c-08df2849af75
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 10:15:05.0756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQrbKrXGSy34hvzqjXvPSziLt0QFnh0I41Rgm63l9infQ3M+Kr+qcq0WSLBXcy2jfkUeEYfSODcJRpgy3XwUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPFBC76E4C1C
X-purgate-ID: tlsNG-4011c0/1791800107-585CBCFC-40E506E7/10/78276251493
X-purgate-type: spam
X-purgate-size: 7768

QWRkICJzZWNsYWJlbCIgcHJvcGVydHkgdG8gYmUgYWJsZSB0byBzcGVjaWZ5IHNlY3VyaXR5IGxh
YmVsIGZvciBhIGRvbWFpbg0Kd2hlbiBYU00gRmxhc2sgaXMgZW5hYmxlZCwgc2ltaWxhciB0byB4
bCBjb25maWd1cmF0aW9uIGZpbGVzLg0KDQpDdXJyZW50bHkgZ3Vlc3QgZG9tYWluIGNhbid0IGJl
IGNyZWF0ZWQgYnkgWGVuIGluIGRvbTBsZXNzIGNvbmZpZ3VyYXRpb24gd2hlbg0KRmxhc2sgaXMg
ZW5hYmxlZCwgYXMgZG9tYWluIGlzIGFzc2lnbmVkICJzeXN0ZW1fdTpzeXN0ZW1fcjp1bmxhYmVs
ZWRfdCIgbGFiZWwNCmJ5IGRlZmF1bHQsIHdoaWNoIEZsYXNrIGRlbmllcyB0byBjcmVhdGUgYWNj
b3JkaW5nIHRvIGN1cnJlbnQgcG9saWN5Lg0KDQpCZWNhdXNlIGNvZGUgZnJvbSBvdXRzaWRlIG9m
IGZsYXNrIGNhbid0IGRpcmVjdGx5IGV4ZWN1dGUgaXRzIGludGVybmFsIEFQSQ0KYSBuZXcgWFNN
IGhvb2sgbG9va3VwX3NpZCgpIGludHJvZHVjZWQgYXMgcGFydCBvZiBYU00gQVBJIGV4cG9zZWQN
CnRvIHJlc3Qgb2YgWGVuLg0KDQpTaWduZWQtb2ZmLWJ5OiBTZXJnaXkgS2licmlrIDxTZXJnaXlf
S2licmlrQGVwYW0uY29tPg0KQ0M6IERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29s
dXRpb25zLmNvbT4NCkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KQ0M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQpDQzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KQ0M6IEFsZWphbmRybyBWYWxsZWpvIDxhbGVqYW5kcm8u
Z2FyY2lhdmFsbGVqb0BhbWQuY29tPg0KLS0tDQpjaGFuZ2VzIGluIHY0Og0KIC0gaW50cm9kdWNl
IFhTTSBob29rIGBsb29rdXBfc2lkYA0KIC0gYXQgU0lEIGxvb2t1cCByZXR1cm4gZXJyb3IgaWYg
c2VjdXJpdHkgc2VydmVyIG5vdCBpbml0aWFsaXplZA0KIC0gZG9jdW1lbnQgcGFuaWMgaWYgRFRT
IHByb3BlcnR5IGlzIHVzZWQgYW5kIEZMQVNLIGRpc2FibGVkDQogLSBwZXIgTWljaGFsJ3MgcmVx
dWVzdCBwYW5pYyBpZiBGTEFTSyBkaXNhYmxlZCBpcyBsZWZ0IHVuY2hhbmdlZA0KY2hhbmdlcyBp
biB2MzoNCiAtIHBhbmljIGlmIGBzZWNsYWJlbGAgcHJvcGVydHkgZm91bmQgYnV0IEZMQVNLIGlz
IGRpc2FibGVkDQpjaGFuZ2VzIGluIHYyOg0KIC0gYWRkICYgdXNlIGZsYXNrX2NvbnRleHRfdG9f
c2lkKCkgd3JhcHBlcg0KLS0tDQogZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4
dCAgICAgIHwgOCArKysrKysrKw0KIHhlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmlu
ZGluZ3MuYyB8IDcgKysrKysrKw0KIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oICAgICAgICAgICAg
ICAgICAgICB8IDcgKysrKysrKw0KIHhlbi9pbmNsdWRlL3hzbS9ob29rcy5oICAgICAgICAgICAg
ICAgICAgICB8IDIgKysNCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgICAgICAg
ICAgfCA3ICsrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgYi9kb2NzL21p
c2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0DQppbmRleCBiY2IwNmJjNzk2Li4yYTY5ZDI1
MzdkIDEwMDY0NA0KLS0tIGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0K
KysrIGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KQEAgLTM0NSw2ICsz
NDUsMTIgQEAgd2l0aCB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6DQogICAgIG5vdCBwYXNzZWQu
IFRoaXMgY29uZmlndXJhdGlvbiByZXF1aXJlcyBzdGF0aWMgYWxsb2NhdGlvbiAoeGVuLHN0YXRp
Yy1tZW0pDQogICAgIGFuZCBkaXJlY3QgbWFwcGluZyAoZGlyZWN0LW1hcCkuDQogDQorLSBzZWNs
YWJlbA0KKw0KKyAgICBBIHN0cmluZyBwcm9wZXJ0eSBzcGVjaWZ5aW5nIGFuIFhTTSBzZWN1cml0
eSBsYWJlbCB0byB0aGlzIGRvbWFpbi4gRG9tYWlucw0KKyAgICB3aWxsIGJlIGNsYXNzaWZpZWQg
4oCcdW5sYWJlbGVk4oCdIGlmIHRoaXMgcHJvcGVydHkgbm90IHNwZWNpZmllZC4NCisgICAgTm90
ZTogYm9vdCB3aWxsIGZhaWwgaWYgdGhpcyBwcm9wZXJ0eSBpcyBwcmVzZW50IGJ1dCBGTEFTSyBp
cyBkaXNhYmxlZC4NCisNCiBVbmRlciB0aGUgInhlbixkb21haW4iIGNvbXBhdGlibGUgbm9kZSwg
b25lIG9yIG1vcmUgc3ViLW5vZGVzIGFyZSBwcmVzZW50DQogZm9yIHRoZSBEb21VIGtlcm5lbCBh
bmQgcmFtZGlzay4NCiANCkBAIC00MjIsNiArNDI4LDcgQEAgY2hvc2VuIHsNCiAgICAgICAgIG1l
bW9yeSA9IDwwIDEzMTA3Mj47DQogICAgICAgICBjcHVzID0gPDI+Ow0KICAgICAgICAgdnBsMDEx
Ow0KKyAgICAgICAgc2VjbGFiZWwgPSAic3lzdGVtX3U6c3lzdGVtX3I6ZG9tVV90IjsNCiANCiAg
ICAgICAgIHZjcHUwIHsNCiAgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbix2Y3B1IjsNCkBA
IC00NTMsNiArNDYwLDcgQEAgY2hvc2VuIHsNCiAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MT47
DQogICAgICAgICBtZW1vcnkgPSA8MCA2NTUzNj47DQogICAgICAgICBjcHVzID0gPDE+Ow0KKyAg
ICAgICAgc2VjbGFiZWwgPSAic3lzdGVtX3U6c3lzdGVtX3I6ZG9tVV90IjsNCiANCiAgICAgICAg
IG1vZHVsZUAweDRjMDAwMDAwIHsNCiAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9v
dCxrZXJuZWwiLCAibXVsdGlib290LG1vZHVsZSI7DQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9k
ZXZpY2UtdHJlZS9kb20wbGVzcy1iaW5kaW5ncy5jIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9k
b20wbGVzcy1iaW5kaW5ncy5jDQppbmRleCA0MWQ3MmQwZDU4Li5iMDNjZWUwZThjIDEwMDY0NA0K
LS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1iaW5kaW5ncy5jDQorKysgYi94
ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJpbmRpbmdzLmMNCkBAIC0xMSw2ICsxMSw4
IEBADQogI2luY2x1ZGUgPHB1YmxpYy9ib290ZmR0Lmg+DQogI2luY2x1ZGUgPHB1YmxpYy9kb21j
dGwuaD4NCiANCisjaW5jbHVkZSA8eHNtL3hzbS5oPg0KKw0KIGludCBfX2luaXQgcGFyc2VfZG9t
MGxlc3Nfbm9kZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBib290X2RvbWFpbiAqYmQpDQogew0KQEAgLTIxLDYgKzIz
LDcgQEAgaW50IF9faW5pdCBwYXJzZV9kb20wbGVzc19ub2RlKHN0cnVjdCBkdF9kZXZpY2Vfbm9k
ZSAqbm9kZSwNCiAgICAgYm9vbCBoYXNfZHRiID0gZmFsc2U7DQogICAgIGJvb2wgaW9tbXUgPSBm
YWxzZTsNCiAgICAgY29uc3QgY2hhciAqZG9tMGxlc3NfaW9tbXUgPSBOVUxMOw0KKyAgICBjb25z
dCBjaGFyICp4c21sYWJlbCA9IE5VTEw7DQogDQogICAgIGlmICggIWR0X2RldmljZV9pc19jb21w
YXRpYmxlKG5vZGUsICJ4ZW4sZG9tYWluIikgKQ0KICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7DQpA
QCAtMTQxLDUgKzE0NCw5IEBAIGludCBfX2luaXQgcGFyc2VfZG9tMGxlc3Nfbm9kZShzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKm5vZGUsDQogICAgICAgICBwYW5pYygiJ2xsYy1jb2xvcnMnIGZvdW5k
LCBidXQgTExDIGNvbG9yaW5nIGlzIGRpc2FibGVkXG4iKTsNCiAjZW5kaWYNCiANCisgICAgaWYg
KCAhZHRfcHJvcGVydHlfcmVhZF9zdHJpbmcobm9kZSwgInNlY2xhYmVsIiwgJnhzbWxhYmVsKSAm
Jg0KKyAgICAgICAgIHhzbV9sb29rdXBfc2lkKFhTTV9IT09LLCB4c21sYWJlbCwgc3RybGVuKHhz
bWxhYmVsKSwgJmRfY2ZnLT5zc2lkcmVmKSApDQorICAgICAgICBwYW5pYygiSW52YWxpZCBzZWN1
cml0eSBjb250ZXh0IGZvciBkb21haW46ICVzXG4iLCB4c21sYWJlbCk7DQorDQogICAgIHJldHVy
biBhcmNoX3BhcnNlX2RvbTBsZXNzX25vZGUobm9kZSwgYmQpOw0KIH0NCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94c20vZHVtbXkuaCBiL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oDQppbmRleCA2
MzMxODU5YWZhLi4wMjljZGRkNWNkIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUveHNtL2R1bW15
LmgNCisrKyBiL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oDQpAQCAtODIzLDQgKzgyMywxMSBAQCBz
dGF0aWMgWFNNX0lOTElORSBpbnQgeHNtX2RvbWFpbl9yZXNvdXJjZV9tYXAoDQogICAgIHJldHVy
biB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBjdXJyZW50LT5kb21haW4sIGQpOw0KIH0NCiAN
CitzdGF0aWMgWFNNX0lOTElORSBpbnQgeHNtX2xvb2t1cF9zaWQoDQorICAgIFhTTV9ERUZBVUxU
X0FSRyBjb25zdCBjaGFyICpjdHgsIHVpbnQzMl90IGxlbiwgdWludDMyX3QgKnNpZCkNCit7DQor
ICAgIC8qIGR1bW15IHBvbGljeSBoYXMgbm8gc2VjdXJpdHkgY29udGV4dHMgKi8NCisgICAgcmV0
dXJuIC1FUEVSTTsNCit9DQorDQogI2VuZGlmIC8qIF9fWEVOX1hTTV9EVU1NWV9IX18gKi8NCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94c20vaG9va3MuaCBiL3hlbi9pbmNsdWRlL3hzbS9ob29r
cy5oDQppbmRleCBhMzMxZjVmMGU1Li4zYzFiZWYzMDUzIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1
ZGUveHNtL2hvb2tzLmgNCisrKyBiL3hlbi9pbmNsdWRlL3hzbS9ob29rcy5oDQpAQCAtMTY5LDYg
KzE2OSw4IEBAIFhTTV9IT09LKGludCwgYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlLCBjb25zdCBz
dHJ1Y3QgZG9tYWluICopDQogWFNNX0hPT0soaW50LCBhcmdvX3NlbmQsIGNvbnN0IHN0cnVjdCBk
b21haW4gKiwgY29uc3Qgc3RydWN0IGRvbWFpbiAqKQ0KICNlbmRpZg0KIA0KK1hTTV9IT09LKGlu
dCwgbG9va3VwX3NpZCwgY29uc3QgY2hhciAqLCB1aW50MzJfdCwgdWludDMyX3QgKikNCisNCiAj
dW5kZWYgWFNNX0hPT0swDQogI3VuZGVmIFhTTV9IT09LMQ0KICN1bmRlZiBYU01fSE9PSzINCmRp
ZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMN
CmluZGV4IGQ2NWJhMGFlYWUuLmIxMzBmZjVlMjYgMTAwNjQ0DQotLS0gYS94ZW4veHNtL2ZsYXNr
L2hvb2tzLmMNCisrKyBiL3hlbi94c20vZmxhc2svaG9va3MuYw0KQEAgLTE5NDksNiArMTk0OSwx
MyBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX2dldF9kb21haW5fc3RhdGUoc3RydWN0IGRv
bWFpbiAqZCkNCiAgICAgcmV0dXJuIGN1cnJlbnRfaGFzX3Blcm0oZCwgU0VDQ0xBU1NfRE9NQUlO
MiwgRE9NQUlOMl9fR0VUX0RPTUFJTl9TVEFURSk7DQogfQ0KIA0KK3N0YXRpYyBpbnQgZmxhc2tf
bG9va3VwX3NpZChjb25zdCBjaGFyICpjdHgsIHVpbnQzMl90IGN0eF9sZW4sIHVpbnQzMl90ICpz
aWQpDQorew0KKyAgICBpZiAoICFzc19pbml0aWFsaXplZCApDQorICAgICAgICByZXR1cm4gLUVB
R0FJTjsNCisgICAgcmV0dXJuIHNlY3VyaXR5X2NvbnRleHRfdG9fc2lkKGN0eCwgY3R4X2xlbiwg
c2lkKTsNCit9DQorDQogc3RhdGljIGNvbnN0IHN0cnVjdCB4c21fb3BzIF9faW5pdGNvbnN0X2Nm
X2Nsb2JiZXIgZmxhc2tfb3BzID0gew0KICAgICAuc2V0X3N5c3RlbV9hY3RpdmUgPSBmbGFza19z
ZXRfc3lzdGVtX2FjdGl2ZSwNCiAgICAgLnNlY3VyaXR5X2RvbWFpbmluZm8gPSBmbGFza19zZWN1
cml0eV9kb21haW5pbmZvLA0KLS0gDQoyLjQzLjANCg==

