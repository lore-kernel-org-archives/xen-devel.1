Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ABFCA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 09:26:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438965.1657482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZX4-0002EV-Jf; Fri, 02 Oct 2026 09:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438965.1657482; Fri, 02 Oct 2026 09:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZX4-0002EO-GM; Fri, 02 Oct 2026 09:26:22 +0000
Received: by outflank-mailman (input) for mailman id 1438965;
 Fri, 02 Oct 2026 09:26:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1xCZX3-0002EI-QC
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 09:26:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCZX3-00Ffmt-5M
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 11:26:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6abf78b7-2eae-0a2a0a5409dd-0a2a4506ddfe-18
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 11:26:21 +0200
Received: from [52.101.84.126]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6abf78bc-195a-0a2a45060019-3465547e60f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 11:26:20 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI0PR03MB10878.eurprd03.prod.outlook.com (2603:10a6:800:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 09:26:18 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 09:26:17 +0000
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
 b=MUsGhvAguR8F/Ll81hLaK4IyT00ep3gD+TIhJh6AQLSJ6QvJK7G0cAW6jQZIUPtsHooG1s8V3GVrtigqLMROwNAEpRK4Ni8MZYmIlM22D02uj7CQPjBjwgTl7ApdIFGSlbzfHqnnj0AuF2E31yYQYSeTA0W26QrCTsfqiynUZABuUgnRH4ERQrCEH/2MKhPU3iigr+FGBHbm6nxiDGrJ/c+N7mjKJzEmjZl0Uedg53GsDAg5zaQNnFcS3L+bIOYmyG8MqOpMh17Qk60oINPtiCRCdGomyw5seLyler0Q99uZgwAvMWDWkcZ+A8IxuWvDEbIzsf10DlEjgD6z+Nq01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7s6X6WnuV0kG9p5KD1YOj8CZuFMb3B7X9fzXZUv7PQ=;
 b=OQxGeSm/Xi/g4EreMc6bnL9rr118W2N/WRDWGJ2EniwoYZi7vliuw7wnvQSiAeM3ZulNmjbV3tD4/mHaA7H+wSZAYE6S7QOeneho3H31L/cuDGgpTn4hpXPRpBlfu8b/8tFMbRRtJ3Y/j7yy/A339pP3uV2BG6qdnIG74qGo90FrSbWNMU5vFmOqawwUNHQbMEbS23w5hrgvqkXqYCT3cERaWkDlHn8IePHgmeVqa4j0aEHShYj30dZ8eUZdtEe5VNnGobrxGmgntFWRutozZe+HhOMD9yYhrADYrbnw382KQEoZNWPKjEPHsvBWDvFn6k6cRK00Apq+0BDG4sMQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7s6X6WnuV0kG9p5KD1YOj8CZuFMb3B7X9fzXZUv7PQ=;
 b=vVBZRTv4IXff5YPkPAt3JCtmVCqJl31fprWgNeBCD1coYkZlrAma5yYJQXcuftoLojmjYF4yHxdH+EokqTiKuMah6UAvOuPjgtFVVlw0M67hNTnBM47brtkI5G5E2DkXYO6k/2L1Bm+SOP5/Np8ryvFLwJPRlMDMCl6NvP/k+JbfKRLDBE3ISUcOkx9yH4QLGFMQ6YgJFLQkeLySqtJ2+h7R8kMrN5qFgvKTBOugc+9P71XwcxIy1oL2NCrIJmZkgIr1cQUXiJ4XrW7X3ZxfrAVOJ0xMQhcrlYpSEmY62mqLiFI6pv5oZT3kIDqYu22sLjK6y6qePS8b8IDZDEtZYg==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [RESEND PATCH v1] xen/xsm: flask: restore sidtab state on policy load
 failure
Thread-Topic: [RESEND PATCH v1] xen/xsm: flask: restore sidtab state on policy
 load failure
Thread-Index: AQHdUlATCy0sfywDV06Ga65AkQTQHA==
Date: Fri, 2 Oct 2026 09:26:17 +0000
Message-ID: <20261002092556.542986-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|VI0PR03MB10878:EE_
x-ms-office365-filtering-correlation-id: 1c9abf11-d142-41e0-652e-08df2067366f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|10067099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info:
 Fw8wjwhjatM1nKU4b8z9Q6ZVhQJC6lNHF+VYbXI4zzvHjgqhFZoRLV1u9ykAYJVW9XVGEfkhYoRP3lqA5w4wLCy+75hBvfkjg2HxX4n93P5LYViWl2VFAYxEdoIeLGyROARy+5pXFc3FXRE3juQOCRCJRgR6ophmO2whNy7u75tHOtKTwLo3uZaG4H2ghbeJEuklwdAmZkNvRae/Y6JrVMraSXkVNXFSIWTdgwIQ5vNA65TYMdOCXR72jkRZBJgFGqYM0PJopw/+SkbUiDCi3oZFI14yHFbhTcmbq+fepAq97NvBbkxNrfKJs2utJoTZHnLFV9QhWmwsotN37DdFHTT+F9viacPz5PVDcDFD0tTgwR+zBtD7ys5hU2DXevtTCkZ8PzR27gmcjFHlMfFjdNUGtFwfxQoEVmDYAydD3qAzXsdSzWAbniwveTP1gDId8O9Z2hFHJXXbDP65BwCTc+Iav44zpJpt2za365JLC6QYD4ecu5LOEY7/KTwf89KfruC/rgUQ/8Z7nK52Fbk7BMsqTeIW1NeMywPRe1yvVjzojeisr3LlMkJHoC9ef22wqdZO22iNiGozxVB5Z4mO+amsSfWO3MV20HcmwOLv+Qnn2ta8gI6IeXrxEL7V33GRAKK+KuhA4PLQ8u1XCCL9V0Q8OYNNzdjcwn3+2+0sYX0+nK4tuQT/3m4Y5I3oGH/LEwa6apRLDCCq9hTWwfEW2VsEjQAScPktkuvfMzhK7y0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVdTaUYvT1NNak9JbWNxWGtmR3lOaWdDenR0S2Fwdm1HUDVsSzNMT1IycnlJ?=
 =?utf-8?B?YVB5YjEyOEpNelJ5bHFUWUdXY0Z5NzNXQzc0V1A4ejBUT21ndmsvK2JFUGpn?=
 =?utf-8?B?ZjRiN3J4cCtVR0FXQ0xMRGU1RXczc05FQzZFNUdmODhhNWVFY0w4TmdQdG9i?=
 =?utf-8?B?RDArcmIwQkhUN2svcnl6RFJmUXQxSGtHbFhjRkJiZHY5b2JGelBzeUIvOW1u?=
 =?utf-8?B?NGV5aytldGdOa3dOYi9VRDVONysyQWJzL3NhcFluSnl1S29YT0R0UC92c3pK?=
 =?utf-8?B?TGloQkpFQndSSkc4NUlGMWhJY1JVMWZqa0pmZjljNHZzcS9HbFUwRXIxcDlN?=
 =?utf-8?B?MEdaUjNmOVZaVFA1M2ExUjJDVmxCMjN6SzBWdGlEU0xwQVE0RVljSEkrMXl6?=
 =?utf-8?B?b2xqc2FabVZHM1pBbHF6amhleGRublpsUThWeXAvMWJZQVVaWVpSTW9wTktK?=
 =?utf-8?B?SFo5MjFwc0JHQ3hlTGxiY3Nnc1pxc3ZlN05BMTdERzFCREovSHZYazQxVkRY?=
 =?utf-8?B?cUU0ZmxmNWpTVUZSdFF2WHU0VHVIWXBUVU9NUGc5ektjWElMMjZBNlF0TWtV?=
 =?utf-8?B?VWdzY1djY2V1UW9MNzgzeXNWVGh0bTRUenB3MHpqVWxsemFEbWw4VTBoTWxX?=
 =?utf-8?B?Zzd3T3RlUnJjTUY3aW14SWNWQVhReGVCazZIY2xsWjR2M0d5KzBIb1lKTFQy?=
 =?utf-8?B?ejJMbWFzbCtPVHFmSi8wdnFFdUI4SWdTTzRJdFJEWnZZVCtRV2xsRDVmamxW?=
 =?utf-8?B?RjAzQyt2dWE3bElqTS94Mk9QL1ZuK0d0cDJoNHowR05aN1l5L3Exc2tPRlAr?=
 =?utf-8?B?WXFVb3NFakM5cUFxTXVqNDNxOVJqZjV6aXl0SGNIOEF5UDczYTNmRHVHOTRV?=
 =?utf-8?B?anlIOUo0UWRLOVk2dHlSclozeXVRY3dBOFJsdDh5ZENPZm1pN2dkdFREUHRM?=
 =?utf-8?B?VGRybW14b214YmRZWWVPQjV2N1BOdHZLNEdQdi9nT0s5MzV0NENnYU9URndS?=
 =?utf-8?B?OG9WTldYbGNMT0s1dUZ2OCtvTExMMUx1OC9zUnJSQ1pqSWZ0cldyT1NzNGJJ?=
 =?utf-8?B?dW5JcDlrR0xldDk4cGhhOVhLcXNXVm1OK1NwQ0RrVVJPTjQvOXY3QWY5RlRx?=
 =?utf-8?B?dmUvMlkzOExOU3ByN2tzd3NWVk5UZ3BFL012amtOSE5JT3J4MkpwSU1OSnd1?=
 =?utf-8?B?UEl6YmFzZ2ZGZFRRVG5ZTVVWOUxUaXRyNlJJMkFIUDZqS216aUNYai96cmZM?=
 =?utf-8?B?L3Fua04yR1RpR293MklramlFMW9wdXhSOGxsY0xrbkp3WUZxOCtiSG5yTmU0?=
 =?utf-8?B?Z1ZqSnFLcy9CaGZIVkRHaWkvejd4NjhFVWVlcXNvem90cjhFL3lCT2p6VXBn?=
 =?utf-8?B?eXRkaU1rMmlKd1dpbFdDdVJ3K3dvdGFPbVRPb0JNalU2c1MzRjM4N1dDK1lQ?=
 =?utf-8?B?NUpGaDJSSGVpVnZMTWo0UHhwUFdDMVplSHhzMFZhbFAzTDhwdkdBM0Q4cWE0?=
 =?utf-8?B?eGFVczlYaFZ2L1lXeDZkSS8vczB4RW13M2F1OGtHN2tFOC9FcWFRT1c4YXV5?=
 =?utf-8?B?VnNOelBaVGh0UW5PVWJCNWJHY24zRnY2N1hNTFB5TlNsZ1MzZThRSVdsS2pE?=
 =?utf-8?B?TytxYWJ4TVhpSUR6cmZubTAxZmJvcnFNcktsUTZva200UVVlS3AzbUZaMHlv?=
 =?utf-8?B?MW1OaTI2YmVrZmFoQmVTRThPV282bTVwa0dkZEhPVzczRVlpbXFWZU5IdzBW?=
 =?utf-8?B?VE1yZUorMWlRclBhMTJoZzN5ZkdhZHRvNGZrNVpFc00xYW54YXlrbUthQU5G?=
 =?utf-8?B?ZDdRV1I1V2l3NHNWcHUzY3hwcVlINkpWbUIvWElJK2djM3dCbklickhXUFVw?=
 =?utf-8?B?bFZoWUYrYXVxOEIrK3lxNzJNTnMvRnhXaXd1RFh1N2IrN0Z3ZTh6WngvdEVR?=
 =?utf-8?B?U3N1YWZUQXdsOVhyTGRGczM2YXAxdlN3T0NTSFgyYkg0WEhkUGdJRFBNNW9D?=
 =?utf-8?B?NnJnOGlFbWRmeG84Z2pRU2UxUmdGSnJCa0lnZmNEVGtRdER3YTAwNGFLaC9Q?=
 =?utf-8?B?UWFlOXhKc0hRd29COUN1SEFxUFQ2OWJHK3RhUEVybkJIWnNLS3Bvc1dicStQ?=
 =?utf-8?B?OUhvYVFMY0FUVTFjd2NZNzlEem5tK2lRb0hnVmllMUNYaTI4VzVnODBML2k3?=
 =?utf-8?B?THJHKzB3QUpLbS94Q05SeEltZ2NmVFhkbVJ1Q3craXNoQkRXamNRc1ptVEc2?=
 =?utf-8?B?dUkyQi9sa3dZaklhUGdTOE1USFNyTmRubkZuV0R1Y1EwSWQzSGJMMzkrYmEy?=
 =?utf-8?B?TWFZajZ1L2IzWlI3Y0VpS1I3MTRFN2R2UFEyRWN6MWswdDhsRlNVYWZaK1Ni?=
 =?utf-8?Q?xzwXLyuTtGApOTEk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9abf11-d142-41e0-652e-08df2067366f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 09:26:17.6698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leaxsULZFJc3fdx4YDgoCvRcbspRRPY20auA//xIo887V2kwT4xjVUHvbOboTBvyYKubxXhO7IW9N3OpiU4MYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10878
X-purgate-ID: tlsNG-16d1c6/1790933181-F520877B-1E578FC7/0/0
X-purgate-type: clean
X-purgate-size: 2932

RXJyb3IgcGF0aCBvZiBmYWlsZWQgc2lkdGFiX21hcCgpIGxlYXZlcyBnbG9iYWwgc2lkdGFiIGlu
IHNodXRkb3duIHN0YXRlIGFuZA0KZnJvbSB0aGF0IHBvaW50IHN5c3RlbSBpcyB1bmFibGUgdG8g
YWxsb2NhdGUgbmV3IFNJRHMgaW4gc2lkdGFiX2NvbnRleHRfdG9fc2lkKCkuDQpUbyByZXN0b3Jl
IHNpZHRhYiBzdGF0ZSBuZXcgZnVuY3Rpb24gc2lkdGFiX2FjdGl2YXRlKCkgaXMgaW50cm9kdWNl
ZCwgd2hpY2ggb25seQ0KcmVzZXRzIHNodXRkb3duIGZsYWcsIHJld2luZGluZyBlZmZlY3Qgb2Yg
c2lkdGFiX3NodXRkb3duKCkuDQoNClNpZ25lZC1vZmYtYnk6IFNlcmdpeSBLaWJyaWsgPFNlcmdp
eV9LaWJyaWtAZXBhbS5jb20+DQotLS0NCk5ldyBmdW5jdGlvbiBpcyBub3Qgc3RyaWN0bHkgcmVx
dWlyZWQsIHRoaXMgYWxzbyBjYW4gYmUgYWNoaWV2ZWQganVzdCBieQ0KZG9pbmcgc2lkdGFiX3Nl
dCgmc2lkdGFiLCAmc2lkdGFiKSwgYnV0IHRoaXMgd2F5IHdlIHdvdWxkIHJlbHkgb24gaXRzDQp1
bmRvY3VtZW50ZWQgaW50ZXJuYWwgYmVoYXZpb3VyLg0KLS0tDQogeGVuL3hzbS9mbGFzay9zcy9z
ZXJ2aWNlcy5jIHwgMSArDQogeGVuL3hzbS9mbGFzay9zcy9zaWR0YWIuYyAgIHwgNyArKysrKysr
DQogeGVuL3hzbS9mbGFzay9zcy9zaWR0YWIuaCAgIHwgMSArDQogMyBmaWxlcyBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svc3Mvc2VydmljZXMu
YyBiL3hlbi94c20vZmxhc2svc3Mvc2VydmljZXMuYw0KaW5kZXggMzVhZDEwMzRjYS4uZjVjZWUx
ZTBiMCAxMDA2NDQNCi0tLSBhL3hlbi94c20vZmxhc2svc3Mvc2VydmljZXMuYw0KKysrIGIveGVu
L3hzbS9mbGFzay9zcy9zZXJ2aWNlcy5jDQpAQCAtMTQyNyw2ICsxNDI3LDcgQEAgaW50IHNlY3Vy
aXR5X2xvYWRfcG9saWN5KGNvbnN0IHZvaWQgKmRhdGEsIHNpemVfdCBsZW4pDQogICAgIGlmICgg
c2lkdGFiX21hcCgmc2lkdGFiLCBjbG9uZV9zaWQsICZuZXdzaWR0YWIpICkNCiAgICAgew0KICAg
ICAgICAgcmMgPSAtRU5PTUVNOw0KKyAgICAgICAgc2lkdGFiX2FjdGl2YXRlKCZzaWR0YWIpOw0K
ICAgICAgICAgZ290byBlcnI7DQogICAgIH0NCiANCmRpZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNr
L3NzL3NpZHRhYi5jIGIveGVuL3hzbS9mbGFzay9zcy9zaWR0YWIuYw0KaW5kZXggNjlmYzMzODli
My4uNWQxNjUzY2QwMiAxMDA2NDQNCi0tLSBhL3hlbi94c20vZmxhc2svc3Mvc2lkdGFiLmMNCisr
KyBiL3hlbi94c20vZmxhc2svc3Mvc2lkdGFiLmMNCkBAIC0zMTQsNiArMzE0LDEzIEBAIHZvaWQg
c2lkdGFiX3NldChzdHJ1Y3Qgc2lkdGFiICpkc3QsIHN0cnVjdCBzaWR0YWIgKnNyYykNCiAgICAg
U0lEVEFCX1VOTE9DSyhzcmMpOw0KIH0NCiANCit2b2lkIHNpZHRhYl9hY3RpdmF0ZShzdHJ1Y3Qg
c2lkdGFiICpzKQ0KK3sNCisgICAgU0lEVEFCX0xPQ0socyk7DQorICAgIHMtPnNodXRkb3duID0g
MDsNCisgICAgU0lEVEFCX1VOTE9DSyhzKTsNCit9DQorDQogdm9pZCBzaWR0YWJfc2h1dGRvd24o
c3RydWN0IHNpZHRhYiAqcykNCiB7DQogICAgIFNJRFRBQl9MT0NLKHMpOw0KZGlmZiAtLWdpdCBh
L3hlbi94c20vZmxhc2svc3Mvc2lkdGFiLmggYi94ZW4veHNtL2ZsYXNrL3NzL3NpZHRhYi5oDQpp
bmRleCAwZTQ4ZWM2ZWFlLi41ZDJkYzljN2UxIDEwMDY0NA0KLS0tIGEveGVuL3hzbS9mbGFzay9z
cy9zaWR0YWIuaA0KKysrIGIveGVuL3hzbS9mbGFzay9zcy9zaWR0YWIuaA0KQEAgLTQ4LDYgKzQ4
LDcgQEAgaW50IHNpZHRhYl9jb250ZXh0X3RvX3NpZChzdHJ1Y3Qgc2lkdGFiICpzLCBzdHJ1Y3Qg
Y29udGV4dCAqY29udGV4dCwgdTMyICpzaWQpOw0KIHZvaWQgc2lkdGFiX2hhc2hfZXZhbChzdHJ1
Y3Qgc2lkdGFiICpoLCBjaGFyICp0YWcpOw0KIHZvaWQgc2lkdGFiX2Rlc3Ryb3koc3RydWN0IHNp
ZHRhYiAqcyk7DQogdm9pZCBzaWR0YWJfc2V0KHN0cnVjdCBzaWR0YWIgKmRzdCwgc3RydWN0IHNp
ZHRhYiAqc3JjKTsNCit2b2lkIHNpZHRhYl9hY3RpdmF0ZShzdHJ1Y3Qgc2lkdGFiICpzKTsNCiB2
b2lkIHNpZHRhYl9zaHV0ZG93bihzdHJ1Y3Qgc2lkdGFiICpzKTsNCiANCiAjZW5kaWYgICAgLyog
X1NTX1NJRFRBQl9IXyAqLw0KLS0gDQoyLjQzLjANCg==

