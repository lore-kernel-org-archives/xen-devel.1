Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AA606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=pdA+yjEV
Received: from list by lists.xenproject.org with outflank-mailman.1462683.1673866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLy9T-0000li-GG; Wed, 28 Oct 2026 07:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462683.1673866; Wed, 28 Oct 2026 07:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLy9T-0000kr-Az; Wed, 28 Oct 2026 07:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1462683;
 Tue, 27 Oct 2026 22:33:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <prvs=75389f537=graf@amazon.de>) id 1xLpj6-0000JX-Tg
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:33:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLpj6-0096cf-39
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:33:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <prvs=75389f537=graf@amazon.de>)
 id 6ae12693-8faa-0a2a0a5109dd-0a2a4505e70e-22
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:33:04 +0100
Received: from [52.57.120.243]
 (helo=fra-out-012.esa.eu-central-1.outbound.mail-perimeter.amazon.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <prvs=75389f537=graf@amazon.de>)
 id 6ae1269f-4cb1-0a2a45050019-343978f3bf91-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:33:04 +0100
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
 by internal-fra-out-012.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:32:57 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:12547]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.44.90:2525]
 with esmtp (Farcaster)
 id 09484581-dfa9-4b4c-a117-a67a540b1263; Tue, 27 Oct 2026 22:32:56 +0000 (UTC)
Received: from EX19EXOEUC001.ant.amazon.com (10.252.51.133) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 27 Oct 2026 22:32:56 +0000
Received: from EX19EXOEUC001.ant.amazon.com (10.252.51.133) by
 EX19EXOEUC001.ant.amazon.com (10.252.51.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 27 Oct 2026 22:32:56 +0000
Received: from BEUP281CU002.outbound.protection.outlook.com (10.252.51.199) by
 EX19EXOEUC001.ant.amazon.com (10.252.51.133) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Tue, 27 Oct 2026 22:32:55 +0000
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:20d::13) by BE3P281MB6226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:104::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 22:32:46 +0000
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d]) by FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 22:32:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=amazoncorp2 header.d=amazon.de header.i="@amazon.de" header.h="From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:Content-ID:Content-Transfer-Encoding:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1793140384; x=1824676384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GWEbN3/mwk69KDD6DP1aJIFo59Q4n3h4QilYTdK6KJ8=;
  b=pdA+yjEVu6CSgBC0MEfAKTQBsK3mXbYKLQMBQRsOfTpJv/rLMuwq9jbN
   nDPfy/EdICXBN8oeoExICotu8iwnuODACTwqw884xMotZoAvww2tYjVKw
   tZ3klU5JrN4cSMwLhrq+HSZwpeXtHIv7s7Fbnoxvjz1D1WySbWcXAHinA
   suBcdyBTSYQR/4i/h6weFizQN4KHatZGehJXWCz07iTb+q1npo6ePk+Wz
   28i1QEoNQKh7S1OyE6w6EPI+/hkU+GN9tdDYgOw45A4KP/r9eWf3w4HP9
   CgsZ32cb+NxLQ+qkw2vmA2vYVSUDKXYVEUxxSKKMNrDqviA5UoumKQ7fQ
   g==;
X-CSE-ConnectionGUID: EB+pMZTETUW8U34DPIYAZQ==
X-CSE-MsgGUID: P4uhTOAcSjGDhFl9mhH+Ng==
X-IronPort-AV: E=Sophos;i="6.27,181,1787011200"; 
   d="scan'208";a="21795587"
X-Farcaster-Flow-ID: 09484581-dfa9-4b4c-a117-a67a540b1263
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjW0TusRwVgpu/dt/5IeXj1IYuJqqkyM+NuJ8Acc+tpKNHCSXiWFLcabDdPnjHXU9C7oKu+rmji1Dmai3xmKZsvFmsMNcVWEUQe0LK1wTFZqktid1R0sG8S2zL7k+oiBqLbNy+vurkw0cb7ehn/WjlXuEkvb+77YJy7TmslRDdXZOot0zI/mkfXOBLcOJBJcG/vmolw2flzx3y/kQFZFhGYhvgzpXyRc6J+hWyPsm82cz2uvC/wKTpz1Y6NhdJtCK0UUfn1NNk8xIXCabAWlPBcV044MeW0YTFEC12390pGl/FbAazy50YswNWliKVxscevCWLpz7flwULH5XpKfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWEbN3/mwk69KDD6DP1aJIFo59Q4n3h4QilYTdK6KJ8=;
 b=xekt8P6ucGj2j4PfYBIY5ywxLYRvjymEb3eBlKJEreaOjSU+ww7R5ftFoxO0CC1t+wIFH6ZCsvvs7im9J4THPHjGGBs1umuslA9EYGrc+Gjq4YM5eyNiI258/YkHx7tEWW9Tdtk1u5bkX5gjQad4FD21Vk3CBTEtpV9+I1DFEHNVc0xD2BCWLs3n/efzYnt7BualwNeG3ZP2rx65w2iys/iqvoXVWGXrTD7Yp76Aas2QcOhmfJPpurhV1RZJMY5smCU/Zh3i/fjd/mJmUSGjeu8vhfefGnTC9B7wp5lUnY/HN4XvtfaUTBnkR2g7QBMGOPEsMkfwsI94RGAFw6hKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.de; dmarc=pass action=none header.from=amazon.de;
 dkim=pass header.d=amazon.de; arc=none
From: "Graf (AWS), Alexander" <graf@amazon.de>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, David Hildenbrand <david@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Peter Maydell <peter.maydell@linaro.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
	<liwei1518@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Chao Liu
	<chao.liu@processmission.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Daniel Henrique Barboza
	<daniel.barboza@oss.qualcomm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Sergio
 Lopez" <slp@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Bibo Mao <maobibo@loongson.cn>,
	Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
	Xianglai Li <lixianglai@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
	"qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, Song Gao <17746591750@163.com>, Eric Farman
	<farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Matthew Rosato
	<mjrosato@linux.ibm.com>
Subject: Re: [PATCH 08/11] hw/nitro: mark 'nitro' machine as secure
Thread-Topic: [PATCH 08/11] hw/nitro: mark 'nitro' machine as secure
Thread-Index: AQHdZmMX3joabFtXaUWVQ1RiPsBvJw==
Date: Tue, 27 Oct 2026 22:32:46 +0000
Message-ID: <b5adb841-9f14-4eb1-a69f-7e7b443e9f23@amazon.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-9-berrange@redhat.com>
In-Reply-To: <20261027181400.1752951-9-berrange@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRVP281MB744463:EE_|BE3P281MB6226:EE_
x-ms-office365-filtering-correlation-id: 18fac4b7-fdbf-4656-7e07-08df347a39be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: cyC+3f1YHm6wUu9JacJXPts7iepG6XLMm2+IHmQTOXCcxWFNMrsfdGc7fSLrEFGkhiw2kmpW8Pd7nfSuJljKT1XsbfvEbqfSpWGp45UFfVym6fg9UQyjF0S3v6VGhegdPMuTe1g7Ij4hfS33F7+9jXqptbq5U5T2oaUDrSsvydT4ztFEjNZp9ft2bCNUkh8crKcfiWiPVOn0lTkzvWdsFjv29NLndxrvG0fuEpIGEahTbKFfdulhFOUyvF7I6/aUUuqMvbzLv/nOkhIiScvZPajy+75HmaGE/qJQHrLtA/7GuHKZ8XjC2zRmDjlobE0yiQ82t/MZfPZdSUQsu9sOiJ2qgykfuJITJm/R7QtoFcaiDPdYg4FHcFHNGKviJHPoe6YLdECpZyfBQzcliTmAnQcu4stAPfIs1PPUJd43yTjH4hYt6hugIn3Q8TPghu7CYKA7z4Ke1tf6GnCu5IEbHCAuELO4NunYt6Eou3qLVIuiFiyl5hYwc8eQew15A7rMCq6K+lGhyieDrAQ7lYzDkuhCCjOXL6Fv58PnjYZjcj8IXvFs5iu5fg/VqVnGmFIUV3Y3i9H4D3A4Sfl11isjksscHslU2+fwqrHGcV9uKKTor2bIuzSdnAXCn5BqUG8cbpXF+cOIncTwO0jwlcrEqxL+dpLVuzusX7TuUVkzrHZINkbKGaeYKukYH9MwiNDBqP87oH0jml4IiOFCMrvRWbvIpuS+kqo1ZxsBCDeGNyw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emFQd0puMmo1aFJKaCtxdmp4Sjg1QkdJZy8xL1FSMlcxaUw1bHZyb2NQWjB1?=
 =?utf-8?B?V0lUR2tqdnIxcW1MK3FrOSt3RUNhMUJyTlU2QVl1VTBmay80Rkk3Q2dKaG9t?=
 =?utf-8?B?ZHd5eFQ3My9kNE00MmRmbWI3MzZ1TFhxcjFEa3JqaE53ZDZLaGdsZVJaMkZN?=
 =?utf-8?B?QmZNaS9XSktBV3dMT1FQYlpqd1R4MERNMmtmZUJjT2g1Yy9nNFord1VRYnFp?=
 =?utf-8?B?RGNTb0xtRG9PaEdtRWZReElwdXlNNnhwNnNDRjREVHRnMlJFZCtwSWdJZGFW?=
 =?utf-8?B?UjVwRWhlZ3UrOUppTjZQRWROeFAyUldQemtheS9zeDhHU1h2US8rS0d2aDN4?=
 =?utf-8?B?bWJacEVzVjRuMXRFaU13VnFRZFZpT1ZMbUhMbzgvUms3TzVJQjRHVXd3ckY5?=
 =?utf-8?B?Z0RUSnVOV0dQUmlyN2hVUjg5RG1wYjdWaExKa2tHSGQwWVZnM1hUenljbEhI?=
 =?utf-8?B?WGZtYUNmd0hQd3JwMjI3NmlpakxxMm15S3U2eFRCUEFqL2M0dDEwWGdsU01a?=
 =?utf-8?B?UHk4MFJkcGVIalA1UVk4NUdUM2lxTXpIQTQ4TElaUEdtK3k5clVMWjBNQjVv?=
 =?utf-8?B?QTQ3SFhVaVMzbU9rT001NGVnTSs5RWtNNmdDK25YRldVQ0tKVVZrUDFwdFZ2?=
 =?utf-8?B?STNiQ1dFZzdGQXg1S0NKNnR5RGZvVG44QjFINyt1UGxjUThhZFppOGxxT29m?=
 =?utf-8?B?ZENHQWM5UllMK05tUENkVVpUWTJVZVBGdlhYYVRwQURMYmFudzRMS2V0bUVS?=
 =?utf-8?B?aHh5N2NOOEkvQkZiZjlWbkRLVjhMY0dudlIrSi9wR3UvYXFueHpObXpDa01j?=
 =?utf-8?B?L3J2dlVtZFQ1UThHSEo4bjc2VWZTUDcyblo4NStaclpwNVR2WlkyTzA3RGo3?=
 =?utf-8?B?MjkvTmdpSmRsS2pKVHVvNld5OGZBbTUzbnhZcHV3bk1ZelUxY0VLaVlmWVR3?=
 =?utf-8?B?WTFyTVR1MkJOTkNqZjRzZUhzUTFuNDdNU1hXWUZYR282a0hnV1B4alU1U3JS?=
 =?utf-8?B?OUVCcFhwSU9jWFhKTitoUXllQ1lDYnA4WnZQV3BaVTRUQW0wZVhGRjMxNmx3?=
 =?utf-8?B?TzJZQmZzbmtGSzJ4NFZDRXdmKzUzcERtanpodHBubFhZcXhsd2R2U1MxMjYy?=
 =?utf-8?B?eXRuN0VMc1F2TmdGT3hmc2tzZEJIbkxKNS9GdGJtSXppQVV3WU90cGVQRUNC?=
 =?utf-8?B?TUhxT2ZNQjA3NzR1TXJwNldCVzJrRTZxRjhxNWlVbThZKzdicTg0alFNeGhY?=
 =?utf-8?B?QllYcjhWQkdFa2RwT2xIZ1dJMk02VVVlNG5IK0N4QlQ0YUZpQ0ZlOGFsbTBN?=
 =?utf-8?B?cTJQLzhOemp2TmdFeVpSK1dBZFlLUStKWVA0YnVYdmpCYVo2TjN1T05rUTVk?=
 =?utf-8?B?czZvUlRMZmFFNm9wK3ZEVTBhU2F5SWVFbGJSL01WUGtTK2JpRy9QbUtDdUpz?=
 =?utf-8?B?WGttd1dzRjk2WGhEZ3NyZXpVbFhoOVJ2bXBZN3N6MXZwczF5QkIxMHlwZW5N?=
 =?utf-8?B?SXpUcDJZR054NUVlbE5HQVRwSFVqSGw5TFdzclk2azRkYlZ4VW1teVk3MGRu?=
 =?utf-8?B?NWo1MFU3SDAzMHA1WEdNeEl5d2VKOWJzZW8wUmRtTE44bVVTYUd6UlRJbU9n?=
 =?utf-8?B?U01TRXZMUndZVHU4dElTUUhoZG1KQWxBOXI4TC8zYkwrRmdIUFJTMi9VODhZ?=
 =?utf-8?B?NWN4MkJ5VXNKY1VzSTVCOWU3dEVSRHZiK0o1TDhXVVVrMDRkS2xjM1FZVTQr?=
 =?utf-8?B?K3p2a3RZSzFKTTdTQUlkd1lUazVqYzAxN1JvbEI0WWJFK3o4UW9wZzR0Z21i?=
 =?utf-8?B?YUpzeVZIMml6YWh2NjRGOVp1QllYNFFnOFBNUEQ4V0Rtc2kyQ2VSUGZiZjZG?=
 =?utf-8?B?VERoUjlOM0RLRHdjWUhWU1hmZkpOQkxRK0Mva2dwUzdXOTlIZWRPS29CdDRT?=
 =?utf-8?B?RHRHOE5mTFl5V3I4T2lpYk9SMGRrNnU2RDdMUU1YL2l1MndrQTdIMFNpR3N0?=
 =?utf-8?B?OW5KbFFDam9QbllndzJaWVhCVGwrZEtUQ0VjTUd5dUkzNExRNDZIMzgxeWhE?=
 =?utf-8?B?Tjd2U0RCaFRxUFRxOFBiWnF1WklNaTNPK29WQlJGOHdPUEdRQU1WcElpaUl0?=
 =?utf-8?B?WjA4MGwvR2xVd25QOFBxRlgwbFpLN21uTnBURGdETGRTQWExa3N2Y3NRWVZ5?=
 =?utf-8?B?Q21KOVdySGlRaThzeFpUQ0swOUxTWWpxK0ZCcUpiV1hEdlhPZzZMOE1uN2cy?=
 =?utf-8?B?WS9UdE5UTGFVU0tYRzFMaDByazlaRC9qREtQU0tKMUZCU3ZjRUQrY2EzRTd6?=
 =?utf-8?Q?/6lkPpd4HClXTVIakb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF1BC35AFB46F5468A8F8B74BD81FDD6@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NBDV8OtVjbURIZoZ+dl98PYqYeRz1lRrtKBzL5beaGAPyDsJluvOcBDPVB0kK/YMAN3e1KAxp8RayZuGGNacM+D9mabe8M1EBLsbWCWEBCPLkTRgU+RVjA90iT1I7M3KFxJBB8nRQqrayLrsdYrC6RYtlhrnKjAmaOKKf3qV957Qy+sH4KipLsMLtxTgqpMsnt/67mFbiWVDR6lfHCcTHbQewN/XSN4S1DN1rpGohxWN5S/uXv/Vu1EZ4pde1hJaEDCQiWGERNPF+7e7X4rNucFFYEnE+SR26l7D5J/F5L0ov1O6ybolDTkkH/rkkxR2nuGO26Eqv+L41IxXWdzhHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fac4b7-fdbf-4656-7e07-08df347a39be
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 22:32:46.8788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6Re2qSIFeVXf8vTz5LrzKCNGp/bvqL5QF4oEG2KmYKwrlJ5jIA2qbjZ43RYxsBM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE3P281MB6226
X-OriginatorOrg: amazon.de
X-purgate-ID: tlsNG-c201ff/1793140384-73CB82A1-2CAFAB79/9/66687
X-purgate-type: clean
X-purgate-size: 460
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQpPbiAyNy4xMC4yNiAxOToxMywgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToNCj4gVW5saWtl
IHRoZSAnbml0cm8tZW5jbGF2ZScgbWFjaGluZSB3aGljaCBwcm92aWRlcyBlbXVsYXRpb24sIHRo
ZQ0KPiAnbml0cm8nIG1hY2hpbmUgaXMgdXNlZCB3aXRoIGEgcmVhbCBBV1MgZGVwbG95bWVudCBh
bmQgdGh1cyBpcw0KPiBjb25zaWRlcmVkIHRvIGJlIHNlY3VyZS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NCg0KDQpSZXZpZXdl
ZC1ieTogQWxleGFuZGVyIEdyYWYgPGdyYWZAYW1hem9uLmNvbT4NCg0KDQpBbGV4DQo=

