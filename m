Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11737CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 08:50:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440613.1658014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDeOM-0002JW-7w; Mon, 05 Oct 2026 08:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440613.1658014; Mon, 05 Oct 2026 08:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDeOM-0002JP-3U; Mon, 05 Oct 2026 08:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1440613;
 Mon, 05 Oct 2026 08:49:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Miccio@amd.com>) id 1xDeOK-0002JJ-Qp
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 08:49:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDeOJ-000pt1-TZ
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:49:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Miccio@amd.com>)
 id 6ac364a7-8faa-0a2a0a5109dd-0a2a4507ad78-2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:49:47 +0200
Received: from [52.101.57.16]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Luca.Miccio@amd.com>)
 id 6ac364aa-b4ea-0a2a45070019-346539102ad5-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:49:47 +0200
Received: from PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8)
 by MW3PR12MB4441.namprd12.prod.outlook.com (2603:10b6:303:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:49:44 +0000
Received: from PH7PR12MB7113.namprd12.prod.outlook.com
 ([fe80::2104:fa11:f054:7dc]) by PH7PR12MB7113.namprd12.prod.outlook.com
 ([fe80::2104:fa11:f054:7dc%5]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:49:43 +0000
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
 b=yZzfx7PLx8y6+49PjSCFAwIBe0KGXE6Xf6anT/vUc3WfzgR+S2UF/LP31YFYDamDr7W1w2Fgxm5pazubN2ezN/N4Mxk9tm9PnKYd1vMVnkR6jUfUKEBB2Da2QwBolJbHRX1ZdGnyspE6UOEg+IwiLxhqZ6pxdAdxO21zCSL3lsXTVjjfJjt1yDyQspCxzRKFGN2aZQHwXlf+FjNbkd5PrdgkSwJCVtY59nbIuOBSSx3Vk7mOX4JJ0e56vO9EyCA/2mdn8ZF7g5Szn7KSSFX+rlwD001unFkRDRdyucWb7ViwiFl30N5lW+SIcfsDpHuHD2W0TIEKvh+XaVzE/Sze7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcUEXBoaP+7nw7lc1wyIUvZTFfcRbUfKFrTeRFvIcqA=;
 b=MaKZhvRCsczwV1XkZ5zUNMQQgZmS00b6ZVWrXfcxHmfYDRn+KUG6BN+RIHtEBfo389GKQGAJmzzKqmKJwMXMx+tw2yUCT4vM1HT6CgLhYamcG4bkfEnO6LIrIcLexhvoaEGLBp23cLijLRud/6QjE7LEjLYJogMIUdwCdeInqeeoe8b95xo59F0xKaxgA4esWVWthBuqp4eNHW2oCHl+CIN1H32JTg2ll7WAKMsoGM1w5D0DIvKjKEGQVCT5gv+M71mptFbo0cOgi0oNDdcGYHDF3CG1VvpZWcYOJ7qcaCwLCwauhO0HHVp/7p9YFAOXGMd/jewjbWXFGNMBQ3tkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcUEXBoaP+7nw7lc1wyIUvZTFfcRbUfKFrTeRFvIcqA=;
 b=TaUCwaEmvXGi2LwZlHXIQU/R2gUQdPE0/LgrLSmgjFI1d8zU9+a0gfbasdwAdWoFM7O9N5skSkY2DJtGzU+g2RlG5DXaWcIcB/7hD22JGn+VJlwv/JE04JfglfzE9OQ4C8XOFf4l+qg6olycLzzxdw8GpKu+eTVYXmQ2upEeXwA=
From: "Miccio, Luca" <Luca.Miccio@amd.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: "Nowshadi, Saeed" <saeed.nowshadi@amd.com>, Seb Hinderer
	<sebastien.hinderer@vates.tech>
Subject: Canceled: OOO Luca
Thread-Topic: OOO Luca
Thread-Index: Ad1UoczsW00ZEttDeU6QxqgKziCZ7Q==
Importance: high
X-Priority: 1
Date: Mon, 5 Oct 2026 08:49:43 +0000
Message-ID:
 <PH7PR12MB7113604C1C0285E5A658BB11EA962@PH7PR12MB7113.namprd12.prod.outlook.com>
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
 PH7PR12MB7113:EE_MeetingMessage|MW3PR12MB4441:EE_MeetingMessage
x-ms-office365-filtering-correlation-id: 394c2a20-2978-46a4-b3ff-08df22bd99fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 uv+4R4nU5GVRIhvBp/ilBDDqw/JjqcNpVmFYAk8GvarBJfPVG+Az4IOKg2JdyB60ugvokUUcqYMBOGNkqAWKt3R/XiUFqzm7/EA7MgBmA4mfQsU4oyuqGAvcyj5Mdax5bvOooCcJqBWy1xwbBK6D0UAaqAb0Cb35un4uPawytl/G8Jz0cJT5ZqCp5KmyBBVJokj41AF6NMZ7By90Npvs4YGA7S0dCR/FSrY+A7QWgJukyBnBBCerbpkI4fLG164POQ/769pCSRzk7vM/xgDtEn+MripwTbHm5LnZFwOda0JxjZsxzVKrNTanSb2XVul52pYLKbLOi7dtYzH8Z4D2rVhIjabvShSGIikB1lJBAgee+SKb4Ms+gUumQDOHpIi4mzV029jgb9meYmLbxcxOXZxF89eFfxzNAqiuhcihz4GUafEGT09kSXGVUWaGbUMYHrW22YxQY7+bwdUSiREqtQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7113.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GI5LjFqaoLrVguD/MuYp5o7VFlErViNAr1sYKA0dGb45bljHgjFZXtJtJI?=
 =?iso-8859-1?Q?b49Bfm+OoJtzwYAPsQB5dF/R/kacv1fQUb+HMTMCSxsBCtqmgcfoj/csvq?=
 =?iso-8859-1?Q?bU+zUBeYq8y3KZiv9uFfNalkm2mHodSmUXKs57T8aq9UEyzYEGDiRUD8Lg?=
 =?iso-8859-1?Q?hSLGGUgPKLHa3YNpVis7jY0W2/1lTRh6WIKx1z/R2fFKjpM+Wy1u+Y1Kiy?=
 =?iso-8859-1?Q?eW7ay2PMvRcoPyxrzGRjuycxXLla7I5tYS6CDut+3L0sb+9cF2wlsMB+61?=
 =?iso-8859-1?Q?fZ7IOttssKWuz4bbiF05Juuub6+sUbWwzRwgaW6RbyJl68U7hjwtKZuDCy?=
 =?iso-8859-1?Q?5jA15f2lQIsPfvEpdJkw497zAOMBTP2sMqxbKuRwqm1cEBOtg9ROdh+5/t?=
 =?iso-8859-1?Q?5u8i7IxtWRF5hnCsAhrDGguNWNlZ0gHfBP5JM7hdSTYrcqllndrlaDi6in?=
 =?iso-8859-1?Q?6BFc11vmpCenKFi6XIdkVR0e0cBJ691EufsArvUEL6XNnUKf/h5onUmgxm?=
 =?iso-8859-1?Q?MAHs6BWvWCyh0r6/HT2b3cUmoR4v+isSTMc24Fz2hURSOadlQH3dFi7uVA?=
 =?iso-8859-1?Q?iqkJ59TtOTK7Wp+CAnJGH/7RidfId520ARHghfC5s9aiwlQ9s4EC1bjuV+?=
 =?iso-8859-1?Q?FkNfbcmO5y43cv3kVHfZ+nb0HaPIziWAtclYVKmJKK2ojHnV5EO7xHSXgz?=
 =?iso-8859-1?Q?OLHHhLOKFSbK9voL/rULVPkOGx2OBIA0TdGwjjGsQmbHL6QXPSJua5Cvkm?=
 =?iso-8859-1?Q?V1sDPv6xa+CZzqodivetfVDe6ym/2bSR92tgTf533oMnQSLxpoZfQr3zTE?=
 =?iso-8859-1?Q?UDGI/MmbSxFQWAaB0gLIK2qkk0K+WqFl66eJpfQ3VZ5U19M6vjWvc+N/YZ?=
 =?iso-8859-1?Q?Ij3kAuiO4BGlP9sCMayfULUR7K6fgG3boI+y0JFflBOKChRwfl3kCKynf1?=
 =?iso-8859-1?Q?GvHZ3Z+k4TR3EtUjAxpqUvs0S6uXsWEKaWkczrJcnXcAZD4cntfVYNbS19?=
 =?iso-8859-1?Q?Q77McTkY/R+dLOYg+IZmDuhAnDhcMl31yg814jigu/GjOHmBxhjoyg2gJO?=
 =?iso-8859-1?Q?6aecO3vBUk0isZLI2Pg1G3uVfJ6Uzvqeq2F7nS4ROQv/YIARRuNUDz5nix?=
 =?iso-8859-1?Q?n3unut073AE6ymMdodSvLtYaOfasvSTBL2WR0rn6BUJFJm906v1OZShnhT?=
 =?iso-8859-1?Q?lPSE7cRkT47XFHLCovkufaclgNf8CtTX/1KvV+IfHZMz2pzDOkvY4tAYf8?=
 =?iso-8859-1?Q?Szwxzmrm25udTLh1MnPQf2gP/IDtpGQSqF3+mhBj8wU8u/ZxqSWS1FSBnH?=
 =?iso-8859-1?Q?wwSxnmlpbgDCB5je7ApS5yBDAfw8Qx/QLpjsxK4FDa03orwQh2HiwoLz3R?=
 =?iso-8859-1?Q?Mh1WxsePRhLtg3ulQcGip58vsoZz1ruUNaqiyF3XNERgb5t3SvzOwsK3NN?=
 =?iso-8859-1?Q?dY/GcjgydPWcp0EMV/mwbGvSdksEipGplD9QH3X4dU4s4ulqPjHGFQXjYl?=
 =?iso-8859-1?Q?j1ku9UOxqEpig85tMzoW+Em4fRIaH/j3NrF3goKx0CYac+zHdx71ghOXL3?=
 =?iso-8859-1?Q?QN/djul9YH0S4GPumBDtefgSa1L9AMhkpeBGq7VlMGWY/phfnXkYPVcTVM?=
 =?iso-8859-1?Q?2Rv/16acfCamzcHf0SuYQAVzrUk4S+a8VkHAkm7iDqdQWT1A2oymr6mPXa?=
 =?iso-8859-1?Q?WU4UpkCud2x/+oCZEag5jUevpbUkk/+pFUBWWcPOCEUQKGd5XjaloC1wxK?=
 =?iso-8859-1?Q?7y9//OExr1qqADEmp4oOJiSmPBeXaSIm10QP0rUu88AHZK?=
Content-Type: multipart/alternative;
	boundary="_002_PH7PR12MB7113604C1C0285E5A658BB11EA962PH7PR12MB7113namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7113.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394c2a20-2978-46a4-b3ff-08df22bd99fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 08:49:43.7329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTMz3oXbzGuin9XzAgs9Vo2mF0RMKaydYnLNZ8tt+O2+/RElY4+RJdDvpQ9rnadHL7s5rvIpyRHuykrTuCoYKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4441
X-purgate-ID: tlsNG-ef75cf/1791190187-A76D2AE4-DAC9D032/0/0
X-purgate-type: clean
X-purgate-size: 2588

--_002_PH7PR12MB7113604C1C0285E5A658BB11EA962PH7PR12MB7113namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


--_002_PH7PR12MB7113604C1C0285E5A658BB11EA962PH7PR12MB7113namp_
Content-Type: text/calendar; charset="utf-8"; method=CANCEL
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6Q0FOQ0VMDQpQUk9ESUQ6TWljcm9zb2Z0IEV4Y2hhbmdl
IFNlcnZlciAyMDEwDQpWRVJTSU9OOjIuMA0KQkVHSU46VlRJTUVaT05FDQpUWklEOlcuIEV1cm9w
ZSBTdGFuZGFyZCBUaW1lDQpCRUdJTjpTVEFOREFSRA0KRFRTVEFSVDoxNjAxMDEwMVQwMzAwMDAN
ClRaT0ZGU0VURlJPTTorMDIwMA0KVFpPRkZTRVRUTzorMDEwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7
SU5URVJWQUw9MTtCWURBWT0tMVNVO0JZTU9OVEg9MTANCkVORDpTVEFOREFSRA0KQkVHSU46REFZ
TElHSFQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpUWk9GRlNFVEZST006KzAxMDANClRaT0ZG
U0VUVE86KzAyMDANClJSVUxFOkZSRVE9WUVBUkxZO0lOVEVSVkFMPTE7QllEQVk9LTFTVTtCWU1P
TlRIPTMNCkVORDpEQVlMSUdIVA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46VkVWRU5UDQpPUkdBTkla
RVI7Q049Ik1pY2NpbywgTHVjYSI6bWFpbHRvOkx1Y2EuTWljY2lvQGFtZC5jb20NCkFUVEVOREVF
O1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049
WGVuLWRldmVsOg0KIG1haWx0bzp4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCkFUVEVO
REVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7
Q049Ik5vd3NoYWRpLCANCiBTYWVlZCI6bWFpbHRvOnNhZWVkLm5vd3NoYWRpQGFtZC5jb20NCkFU
VEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRS
VUU7Q049U2ViIEhpbmRlcg0KIGVyOm1haWx0bzpzZWJhc3RpZW4uaGluZGVyZXJAdmF0ZXMudGVj
aA0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDAzQUFCQzZDQ0Ex
NTRERDAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAwMTBBOEIzNDZCNjY1MzE0QjlEQkNGQ0U1
NTk4RTQ3REINClNVTU1BUlk7TEFOR1VBR0U9ZW4tVVM6Q2FuY2VsZWQ6IE9PTyBMdWNhDQpEVFNU
QVJUO1ZBTFVFPURBVEU6MjAyNjEwMTUNCkRURU5EO1ZBTFVFPURBVEU6MjAyNjEwMTcNCkNMQVNT
OlBVQkxJQw0KUFJJT1JJVFk6MQ0KRFRTVEFNUDoyMDI2MTAwNVQwODQ5NDJaDQpUUkFOU1A6VFJB
TlNQQVJFTlQNClNUQVRVUzpDQU5DRUxMRUQNClNFUVVFTkNFOjENClgtTUlDUk9TT0ZULUNETy1B
UFBULVNFUVVFTkNFOjENClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDoyMTI1MDgyMTQ1DQpY
LU1JQ1JPU09GVC1DRE8tQlVTWVNUQVRVUzpGUkVFDQpYLU1JQ1JPU09GVC1DRE8tSU5URU5ERURT
VEFUVVM6RlJFRQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOlRSVUUNClgtTUlDUk9TT0ZU
LUNETy1JTVBPUlRBTkNFOjINClgtTUlDUk9TT0ZULUNETy1JTlNUVFlQRTowDQpYLU1JQ1JPU09G
VC1ET05PVEZPUldBUkRNRUVUSU5HOkZBTFNFDQpYLU1JQ1JPU09GVC1ESVNBTExPVy1DT1VOVEVS
OkZBTFNFDQpYLU1JQ1JPU09GVC1SRVFVRVNURURBVFRFTkRBTkNFTU9ERTpERUZBVUxUDQpYLU1J
Q1JPU09GVC1JU1JFU1BPTlNFUkVRVUVTVEVEOlRSVUUNCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5E
QVINCg==

--_002_PH7PR12MB7113604C1C0285E5A658BB11EA962PH7PR12MB7113namp_--

