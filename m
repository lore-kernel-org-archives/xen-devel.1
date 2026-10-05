Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEDDCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 08:17:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440606.1658003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDdt5-0005hS-SP; Mon, 05 Oct 2026 08:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440606.1658003; Mon, 05 Oct 2026 08:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDdt5-0005hL-PY; Mon, 05 Oct 2026 08:17:31 +0000
Received: by outflank-mailman (input) for mailman id 1440606;
 Mon, 05 Oct 2026 08:17:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Miccio@amd.com>) id 1xDdt4-0005hF-Sx
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 08:17:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDdt2-0081Na-Ew
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:17:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Miccio@amd.com>)
 id 6ac35d12-bab6-0a2a0a5309dd-0a2a4501e802-2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:17:27 +0200
Received: from [40.93.194.5]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Luca.Miccio@amd.com>)
 id 6ac35d12-5984-0a2a45010019-285dc2058e5a-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:17:23 +0200
Received: from PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:17:18 +0000
Received: from PH7PR12MB7113.namprd12.prod.outlook.com
 ([fe80::2104:fa11:f054:7dc]) by PH7PR12MB7113.namprd12.prod.outlook.com
 ([fe80::2104:fa11:f054:7dc%5]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:17:18 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shcHRq3HcW3Euw9ZvIgPvUQ8VRd7faWLxLVBn7LoieXG61p0+iNs+r02xn8hy00yk3h+SUnJm7JJxXUzeZrIqzmB76PeB62ziFfKb7pHT+tXAGGktEWFQRW6SkLTua05HpkM3Li9TZHQC3XESHizseVLMRBsEeRUhjFCI1H0FA4bAgeHFqbBLDGSsNS1458Lk+1ZGGLyFjc+R27rZ7ToqCA8URodWjaQs8usp/qmkHbcbN8Uugau04sQ+YltO+jIJQlKPfvs6nb5xDSwrfXYeCppnnwXpLXBPCMPeF3foMcKRotuHTP0dUNWBJunyQg/D9hyHZmM9KVaNTZVIe07qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwoWrD37V+KAFa1vAt3giR6sOXXiADq5chZq4oMWEMg=;
 b=QLstHEqH3biL/5wu/x0NCLHDa0efUtuXsYDBm2HK8EQg8p8HKE64bWofNGeJLH+9GNB2UkODdRKm7Tn9CcU8qZSE/Kpxai1Mzo0ZjVZnx2g1JLSFF4jUZv95HqZHiHE4ket8dSYn1Hex4HPyfsGACia7k7JDE/+3Fm9bLuv8vwfGCqZowl4/VSlgbnwqBGfAFI4tkaAqW98nUc1LO5IDa4pIupuG2lnNmSSgJgtHhITWK8BRrkUYwzOVciE3Y5XOCbccMdpDUxjQquzDCjM8CikihGnX1mNyT8Tv2L0CjFOtS6GeyZA2MdQt1X9fmVJhGPe7PF+e06d4/Scba58HtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwoWrD37V+KAFa1vAt3giR6sOXXiADq5chZq4oMWEMg=;
 b=UofhNG36yLlaEqXGHHzKPTtNI4OZ7jvXuV7MASULRcFUQMgjCUU2CZz8j7xjo7jqqlCBdIYnzGGKRwxZydzSL8RKQQLf6eTdBf48YS/egeKt2h4E1aNK6eI8EIT2txtWVrXoZBS7183qRoEGs1XdSUX5gOl/nJGZUxIJJXtbH6M=
From: "Miccio, Luca" <Luca.Miccio@amd.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: OOO Luca
Thread-Topic: OOO Luca
Thread-Index: Ad1UoczsW00ZEttDeU6QxqgKziCZ7Q==
Date: Mon, 5 Oct 2026 08:17:18 +0000
Message-ID:
 <PH7PR12MB7113449E03644C735BDB77ADEA962@PH7PR12MB7113.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-calendar-series-instance-id:
 BAAAAIIA4AB0xbcQGoLgCAAAAAA6q8bMoVTdAQAAAAAAAAAAEAAAABCos0a2ZTFLnbz85VmOR9s=
x-ms-traffictypediagnostic:
 PH7PR12MB7113:EE_MeetingMessage|SJ2PR12MB7964:EE_MeetingMessage
x-ms-office365-filtering-correlation-id: 81d48bda-736f-45ff-b697-08df22b91267
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|56012099006|10067099003|18002099003|8096899003;
x-microsoft-antispam-message-info:
 lXvSerABzbzFsj+hMOy1M4RL2wfivIRDbsga4FRveWqEgU+dyMbzgzuE/i5pe36ujDZNuTqW4w1KTzJAHsXQ8dQdT34TntnwdeX0xqpn9CWABMtUBkXn2Lxh7uNlrw01iqkmSIeCbPqgj1p2LCTRVlFywXAP1EjWtDWElPvBhdo36IuJKsXckx8vJbnFKrEKYX7SvGyRHzFJgGMxc1agEGu9BMpiQsHT/Uc0ARD6Z4lMhFxU3OYFqwQF/YhApFHgIqDNot4fbj/woytbtI6GPXqAhDO64uke0wx9ptwlrWNLxnXKRb6nRKxsS8cq7jN43TSTAi/8tW3EG0yAp1wfhxtr6LuMx5vXeeyPxkz7wSJjg0pmIEbWVsqkG6Ltd2vXe5JVEmrWhAvfcBnO0jabwuy8P2x98Kf4c0uXDXFjy88BGApnbd11Leh4QdtPnPynwK+aXadAARg27ZHSu5Nlew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ro;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7113.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EPoN6mHdrMc7oTjkyqaIsmWti9eWNW6+8KVXgHoOt0bKk4veq9mOVYYway?=
 =?iso-8859-1?Q?CJ8o7vvsXkX88m1nIVLP885f0fHxBPXl4q4ixwGV3RYiF6jjeW7DeT2YLX?=
 =?iso-8859-1?Q?BeVQz3hCUJpY4Xz5Q9OFAoyooah+pZrAJ7fXaihYFnJ4ztpB/co3hSUxij?=
 =?iso-8859-1?Q?UkFGnsBLdlHVEt0yjqFWSPDiCGHhg8hsCZqhYQd2I4ktLuo2V/84/FZkQ9?=
 =?iso-8859-1?Q?Fhj63H5HoFMwruBp7w/pp8kGLfxel2kDkoF38vpB7GaXZx3GU3QDGS8dV1?=
 =?iso-8859-1?Q?+LrSN2rnRTvkcjusWIZUQR4WtkUWh2VrObnNNYN8wuhhQ5kcCvw/JTsUCe?=
 =?iso-8859-1?Q?6waCr7gN/e+nfmSP+v4sPgo+zMKHIZZV3pslC4f8q/3ZC+/VOl4y9+qeeW?=
 =?iso-8859-1?Q?7PAu004tevqWv64ygc9wIRUl2v90unrN3zHK6CbpQiLd38Q8n8bFK35PqN?=
 =?iso-8859-1?Q?/QIpvPuyIwWWRouqKw4yfQMgaRHYkm+I6akHOJ87AiFAEmaBuwBPvJI7zd?=
 =?iso-8859-1?Q?FqAFeP2xMYat8VeMvAfIXDICfMGYH1ODlITxwtvsjuOLx8S7Y+bnMvELX7?=
 =?iso-8859-1?Q?AAskr+oQKjoqC/zj/SCaOvDKnehqhM7J5AVM0rQdAQaNYJde+KLumY9pfA?=
 =?iso-8859-1?Q?O0+SGcUXaZYyQxMa3ueQYqdjj2afGQsF1GdEF+eVNcaJyzfTzgZH+kg+K/?=
 =?iso-8859-1?Q?B/NRXDfqLqstY+Yo6R0vafEMECA/mCTEoCHqxOFXGT0WgQKrtKKXUbmlnt?=
 =?iso-8859-1?Q?zVVh1XtbStTrX0OqwhHFm6WaDtugWzxMefulebrWcBBXUm/L1RbyEw4hLp?=
 =?iso-8859-1?Q?JEpDORCsY2mSHQ+rZyIBZYRJAkW2QhIdArVI3ZbtCwdl0XdC5Rxc0aTgLD?=
 =?iso-8859-1?Q?viYcw6kC6isvDE+k8TFNN4K7+rronJLMOen8wBUghahDumKkSAQO4Kc2A1?=
 =?iso-8859-1?Q?gWDnvH6OCxTsMPhBtXFsjTnmk19b9zfeeF4aHTlpVGcK4GbrsNS5zMJ1T9?=
 =?iso-8859-1?Q?BMZRCAM0Pxf9ZOwVfNZFrVzYrSGScPYcqVLoQ+g+I/UbLxyJ8r+ctp6EAL?=
 =?iso-8859-1?Q?kYdazKrfW0sENpDGfrHd+rSNjj6AXwD8dImA4UZQWibiDeCAcPwVN1iQef?=
 =?iso-8859-1?Q?2w1LnbyyqFTyJQBCA+6kioyZ17FYKivgdIKUWGMpkN36MKHrT7yCP7IdqR?=
 =?iso-8859-1?Q?sg1L+2XD2wj/H5qY8AIe7Sw8lxwWMLqrD3GWk9xgVbnm/y3CRhOnAsDjkF?=
 =?iso-8859-1?Q?TzYFHvu35cvStMZeasJ77XfkmpKc+KSOSYvVBX2GfhsBgFUX4ykF4l62Rw?=
 =?iso-8859-1?Q?6mh9FdDqGMin+twAQ2u3IuD6W21URU0v9MzkcZnw16Avln+ABPgCgebdPp?=
 =?iso-8859-1?Q?0m+h2XesuH2e0cgAg4SjO1Ew1fbx5fhmwGprQ8dWmpQ19W06cZDkL7fIm+?=
 =?iso-8859-1?Q?tqAn6r+M+RnvnNCM+KmtMoVDlHrkaiZ3WSDCBhOhYlTMBdNd75KrjaZVxa?=
 =?iso-8859-1?Q?Gr6F2uSlUVl4qn3BQbMEzCZrkY9wEAXoutje2QdZFV4c1riQh9gIjZZJrm?=
 =?iso-8859-1?Q?ZH0jHde2f3gFqPJr18EpWkq+5Og+N3g8nzqB14+mvyrQ7SMVIRJ569HvaH?=
 =?iso-8859-1?Q?YpmoeU9My+3G5TVjYYl58kPZg6/g3a5AtUJTLwwgcHlxL23DC6Q1+cB+OM?=
 =?iso-8859-1?Q?Pfj0KAitxGPKtEJPRZUmsIEYm5CLoGVqiNJ2nRt2Mr+DXCZbb0QiirfePT?=
 =?iso-8859-1?Q?gN/c0UPEn2YybP+Sd51H38RCF7tZZlXJo0XMkfNK06vwqa?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR12MB7113449E03644C735BDB77ADEA962PH7PR12MB7113namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7113.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d48bda-736f-45ff-b697-08df22b91267
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 08:17:18.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0K3q4av+lIK1IVXJgknrHl3NtgaSMqvsPRI2Ad29yfT4aLSLhim7LEAdHOcR5iJADjJMVisXCApd4JhZT8lUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964
X-purgate-ID: tlsNG-d62444/1791188243-BE867757-3A361196/0/0
X-purgate-type: clean
X-purgate-size: 2582

--_000_PH7PR12MB7113449E03644C735BDB77ADEA962PH7PR12MB7113namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_PH7PR12MB7113449E03644C735BDB77ADEA962PH7PR12MB7113namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


--_000_PH7PR12MB7113449E03644C735BDB77ADEA962PH7PR12MB7113namp_
Content-Type: text/calendar; charset="utf-8"; method=REQUEST
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6UkVRVUVTVA0KUFJPRElEOk1pY3Jvc29mdCBFeGNoYW5n
ZSBTZXJ2ZXIgMjAxMA0KVkVSU0lPTjoyLjANCkJFR0lOOlZUSU1FWk9ORQ0KVFpJRDpXLiBFdXJv
cGUgU3RhbmRhcmQgVGltZQ0KQkVHSU46U1RBTkRBUkQNCkRUU1RBUlQ6MTYwMTAxMDFUMDMwMDAw
DQpUWk9GRlNFVEZST006KzAyMDANClRaT0ZGU0VUVE86KzAxMDANClJSVUxFOkZSRVE9WUVBUkxZ
O0lOVEVSVkFMPTE7QllEQVk9LTFTVTtCWU1PTlRIPTEwDQpFTkQ6U1RBTkRBUkQNCkJFR0lOOkRB
WUxJR0hUDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0KVFpPRkZTRVRGUk9NOiswMTAwDQpUWk9G
RlNFVFRPOiswMjAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJTlRFUlZBTD0xO0JZREFZPS0xU1U7QllN
T05USD0zDQpFTkQ6REFZTElHSFQNCkVORDpWVElNRVpPTkUNCkJFR0lOOlZFVkVOVA0KT1JHQU5J
WkVSO0NOPSJNaWNjaW8sIEx1Y2EiOm1haWx0bzpMdWNhLk1pY2Npb0BhbWQuY29tDQpBVFRFTkRF
RTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NO
PVhlbi1kZXZlbDoNCiBtYWlsdG86eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQpERVND
UklQVElPTjtMQU5HVUFHRT1lbi1VUzpcbg0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFB
ODJFMDA4MDAwMDAwMDAzQUFCQzZDQ0ExNTRERDAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAw
MTBBOEIzNDZCNjY1MzE0QjlEQkNGQ0U1NTk4RTQ3REINClNVTU1BUlk7TEFOR1VBR0U9ZW4tVVM6
T09PIEx1Y2ENCkRUU1RBUlQ7VkFMVUU9REFURToyMDI2MTAxNQ0KRFRFTkQ7VkFMVUU9REFURToy
MDI2MTAxNw0KQ0xBU1M6UFVCTElDDQpQUklPUklUWTo1DQpEVFNUQU1QOjIwMjYxMDA1VDA4MTcx
OFoNClRSQU5TUDpUUkFOU1BBUkVOVA0KU1RBVFVTOkNPTkZJUk1FRA0KU0VRVUVOQ0U6MA0KWC1N
SUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6MA0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElE
OjIxMjUwODIxNDUNClgtTUlDUk9TT0ZULUNETy1CVVNZU1RBVFVTOkZSRUUNClgtTUlDUk9TT0ZU
LUNETy1JTlRFTkRFRFNUQVRVUzpGUkVFDQpYLU1JQ1JPU09GVC1DRE8tQUxMREFZRVZFTlQ6VFJV
RQ0KWC1NSUNST1NPRlQtQ0RPLUlNUE9SVEFOQ0U6MQ0KWC1NSUNST1NPRlQtQ0RPLUlOU1RUWVBF
OjANClgtTUlDUk9TT0ZULURPTk9URk9SV0FSRE1FRVRJTkc6RkFMU0UNClgtTUlDUk9TT0ZULURJ
U0FMTE9XLUNPVU5URVI6RkFMU0UNClgtTUlDUk9TT0ZULVJFUVVFU1RFREFUVEVOREFOQ0VNT0RF
OkRFRkFVTFQNClgtTUlDUk9TT0ZULUlTUkVTUE9OU0VSRVFVRVNURUQ6VFJVRQ0KQkVHSU46VkFM
QVJNDQpERVNDUklQVElPTjpSRU1JTkRFUg0KVFJJR0dFUjtSRUxBVEVEPVNUQVJUOi1QVDdIDQpB
Q1RJT046RElTUExBWQ0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_PH7PR12MB7113449E03644C735BDB77ADEA962PH7PR12MB7113namp_--

