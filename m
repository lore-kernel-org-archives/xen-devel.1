Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F4C88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 19:19:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422055.1647639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Yfp-0001xy-Eo; Tue, 15 Sep 2026 19:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422055.1647639; Tue, 15 Sep 2026 19:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Yfp-0001xr-AO; Tue, 15 Sep 2026 19:18:33 +0000
Received: by outflank-mailman (input) for mailman id 1422055;
 Tue, 15 Sep 2026 19:18:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x6Yfn-0001xh-Hf
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 19:18:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Yfi-00DBEC-Mp
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 21:18:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa999ed-e002-0a2a0a5209dd-0a2a450ab7e2-8
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 21:18:26 +0200
Received: from [52.101.62.6]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa99a01-f2d2-0a2a450a0019-34653e06eafb-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 21:18:26 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV4PPF3BC8B6302.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::20a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 19:18:21 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:18:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yM2FTaVxTtzS4/pZXivfmJjDOj2lXgJr4uUyk2bIRETM9FGofG+GZ6qNs2k22tSpu69o77S8AWmoZep5dt5F9dGxYogOw4lg5tHMoPqAzlTjWBIUu1iCKmg5WE2B+mV8elOKWLfGlzbUKUWkO0xmVaIViw2uvA0iIPOeWUsC87keTYuFmaZ6RgOS2wm5eQQSXSJCdBPqyguVcuyrLGKbR0mvG57OqEUKNnIhZTOQoZxghVK3F9OqEZIBP7CunloO+d+5nfuP61w8y/P/n6J48sEWxqf0eZmqxZJfagqHK2SpHgJBQ6UpU/AOYKXHXr4UcyS5D0wmSwlV8FuR5Vn3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EEmnDY2RvtYHr/tatAELGHNf+vce1RQws0XaHh4hcg=;
 b=nutDMDSOKSlef94W/PY6nJwnY5Zmk2M+dZlxEj0VMamgexjq+DWgsTtQyM0qvUGxz80alWYxUA4JtnZmo5f5Suy01cXtow/76tgJ5NP6dwcTYkpEf+RjmGaXY7YW5p52RLepP/y0XgVWPqCpOmuwjRXZV3OubJ3rQBGG8D4lB9YGygHs0ykdCc4bKTIJQ6tqszInUWzjHSk3ocu0kYO817LLswTXJgeydUj2B71DgXbBot7rWQouQhiDCI/EyDQYjj65Vt2Rl0vcnqK9jhR2bXBP7OjR6YzDIrkvk5OdjoCJSDP1hqzquEgprDZsZ3e/C4xauEQjJZWV59DmDc8T/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EEmnDY2RvtYHr/tatAELGHNf+vce1RQws0XaHh4hcg=;
 b=LnI2LoiATmOiKcILdVYRlZdS4UrWWK8NK8R6//oU+2AHlddVZ175CsRfUGdbv5FRRx/l/QXF6C9pxjvFfmYZYPhtSReEM0VtMzIJ1gRsYCMHT/GLx8DSjnnaWTP/2ukf+13MdAnuvSGH2qLkt5ytAc0EdT47uRSCodFIUc/L1rQ=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "teddy.astie@vates.tech" <teddy.astie@vates.tech>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
Thread-Topic: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
Thread-Index: AQHdQWMkTXxtUlg8hk+HuEHbfTb847bJVMcAgAaZYsuAAAcwAIAAFYQS
Date: Tue, 15 Sep 2026 19:18:21 +0000
Message-ID:
 <BY1PR03MB7996DDDECF48C82F7CA37EF9F3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-8-kevin.lampis@citrix.com>
 <a6ec6fb7-719f-4968-9b6f-0934ed61ea19@citrix.com>
 <BY1PR03MB7996E1DADE6C578C978BC9AFF3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
 <de0cdb7d-66bf-4bf3-afd6-9dbcf038011d@suse.com>
In-Reply-To: <de0cdb7d-66bf-4bf3-afd6-9dbcf038011d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|LV4PPF3BC8B6302:EE_
x-ms-office365-filtering-correlation-id: b1063f69-9f11-44c9-5488-08df135e1b60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|10067099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 ff1nODmWyPzcI4ctkhjqfXaGumbH3Jbm6vpeothZ/pjuOTtRTkLj1UvUmEtUmU6gLxLl/Ko7JGE2r19pg2Pel3VFAFmfK8ZpBMcYS5WRn1IKqBu0k6SotVxVHW0UVkkPkl1Ob1WgK9RGJidxNyRNeeN7IZ4BdMwQNxMldE66I181amr/8IPU2Rum/8VeoiFdYU5DCGQ4KqGzUTvggNqCiV/xsXTCm26njQDaRA8DOqWH8XDGWJyna4N3QkVT00zQFzrn7WRJ5or1kmIbXgjNPwTFJV0vRRh6NauTv4ItgOuFvwetZ0DSlFtIdTCUXA2VVpIPiVitpmnr05ZUPaJOhLe3csFAeVzABqfdHOEXbia9hcrdDR5/Cm9UyOcnngPR44AZg/5VBi3iMxg/e58FFTkcMAfp3EsxLZRW2TU4zxJx/8ZBuuJbQmtT5dh+2OBcRIduqDNuOspvxWZxviT0RLSr6s7wJFg070/TFeKzk0vB4+YOPflJv3/KOGE6qcnu/CFkE0IgPHSeDZpueXDFy+xnrC2erBkMHLO3gcpAKc3+FP8pK/FAgnBjJrbeJer7nDcH2//3qDXt1KeXz5swPtDyBYuXwak3VcCTCECj5kUOktqus/uxCk7FGvHX8znhxNwdKv2uma67dKBtJMNm3sDrPmyCQ8NBGB5aIPB9z+aXQONVpfZlcDsOfVJ9SRi8RDRXG2PZSEtcD1XpGlITBqu6dyzuB0zigy9nj0ikIeE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3dCKJfYa3BW2fpm/z5ikYXMD1/M8laN3o+FEd0Y7MfN/YX/+hv2zyY9jm0?=
 =?iso-8859-1?Q?k0fpKBbfoTsZfbP2Xnee+uYvDa2o9XpxV3uHqCAp7h0RDwZoyEr22siVdk?=
 =?iso-8859-1?Q?OPiFw4/dFhla4JmqGI9/RX7GZHmOy2UPanL/EChywrrRmCQmaBZOqcgdny?=
 =?iso-8859-1?Q?uA/qhjlYu/NVqQ5oGHIj+nGfa1AMS83ZU9M5MXv5bluXwTDCVQL4ItZ7Hb?=
 =?iso-8859-1?Q?o+QAokIRP6SKwPz2KDTB5qQIBZbtg8NFWW5/snD4gR/f4u979M5gdiG9B4?=
 =?iso-8859-1?Q?svDkVCkWuWRq5lmWGcnacfTkRVm3uvOuf0W6OOJulVQ43LTgxvbaGDVlvX?=
 =?iso-8859-1?Q?qALGC6pjMQwIMm7dh/qzW/WmaIguWl7+Pn+VbpJVQCwaVhMbOsB2l/Uizh?=
 =?iso-8859-1?Q?iDnOqknCcqbdyo7NjRRzWYQ6frX38FfkDizKC/i1cO+28DfQouce/hcJ7E?=
 =?iso-8859-1?Q?U9sKkGYqs/t0JnjRUVq8wBLoj40y01M1TLL8Ahk7lpzBdbdrEoNLWq4242?=
 =?iso-8859-1?Q?EUZHaHVkWAc/dUI4WKk/by07F8i/Ve+yQueQhAbZnqs2rbqscp/2I2N9GH?=
 =?iso-8859-1?Q?pjzTRa606lnj5ArUBFqchJfpsHyC5zkLh9inGEHqJ6tJW5abxWuBncsLVL?=
 =?iso-8859-1?Q?qM92lE9da9kswyW50f3MaecOTmLhi+rC40Ac0M+81QX/ebYLy5+VKdVD8l?=
 =?iso-8859-1?Q?1hpeag/p5dCmKdyr9X22XiWCIisYyjux5tS0+URKg2bocE8dNP7xKFJu22?=
 =?iso-8859-1?Q?Z/83EK2QU8K+voKVlCxuiJtNeZw7D4vhXG7bw0u0PJ7fJNSYcJ/yVHRJcu?=
 =?iso-8859-1?Q?yeKYtOQoBZC5/r061glXGulPsIVEkmsauoaClguw5D2AjU0nFVwrNdvLRB?=
 =?iso-8859-1?Q?HWm9xkcIdRGlEDdCNv7xdF17+nJ0gwWae7GagcX7JTzw4XShEqejSRlloz?=
 =?iso-8859-1?Q?FJE+IAWt7Jk5r32QjSYIgesCtWeV1hqvnU50VJ+mznfbO8c+E0pmYoUk8V?=
 =?iso-8859-1?Q?jD1XYI2QlO2nT/D93LiSjnnRSsfRDFLT6sHSAvSzd++M+M/sqy55ZcFBnY?=
 =?iso-8859-1?Q?e8IzKcaW7EqZiPsf4mgqDMlkBkvq3qPjRTfV6JQdvKJ/qDoexvzlsZF1JH?=
 =?iso-8859-1?Q?ulS8Ue384PX3y1saqijW/3OKrEgqAMxrlAhgXBDqJmvmUsvVEU9Z3lpDIU?=
 =?iso-8859-1?Q?lqexr1ThFAq6iQRSd7Ldyct1PUGG2jD/bPz4Ey3KK0vr8+sRgbmzkaf+vt?=
 =?iso-8859-1?Q?vXBbLvaf+MYMVg28ckr9KNZnsF3icl+U5v4NRYozfUTgUeDRIrKpKGzBy9?=
 =?iso-8859-1?Q?9xHKYRe+A5KhvpEPWnhdi9Nm1pIv4ut7W35WfXkPOVnMqayAHEmg3N9Qx1?=
 =?iso-8859-1?Q?CoPwsbfkjVn2BKEqO2iAtPQexGMbKgnkQUff0ajM4b7TRuV86lTyip11we?=
 =?iso-8859-1?Q?roPFlmSmG3FVBrHp+nbVS/h+ZsXa2PSj/4IrN8LATdQ+CsltwM+FVnIcYp?=
 =?iso-8859-1?Q?t7/hTFLP7j4MzzjlHZZSXnkKv4aB/k5/2ORNHgeiGy7D37CRv8jV99ho40?=
 =?iso-8859-1?Q?bwyuwWwAJ3Hm4mtkKpXJfUWzIhCfyIrJ6rDpGnESyxA/h6K/HKvwkidzj8?=
 =?iso-8859-1?Q?zM5bR0Mgg/USbs8O9lk93SrOrHbgtYKD3tcHHFpVf5PlPTMdnP8pUWhk7K?=
 =?iso-8859-1?Q?KqQTAN823voQ9U1gb2XVz4ECLwh0k1zyxlWV1MOjqAhiDk+1SEMzr3ZumW?=
 =?iso-8859-1?Q?PaBHuRFNF/apTcRUPrdLw2k6voXJKAJ8upJcEZ+P8+ZPrb?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1063f69-9f11-44c9-5488-08df135e1b60
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 19:18:21.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+kZDZh0p9vV7T9hbHTUtDQh7wT2CbsgRjUMRUH9rPnjKuChJv0lrwRUeVgWiMm5LoMzyh26wtvN7ud1WBchjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPF3BC8B6302
X-purgate-ID: tlsNG-4011c0/1789499906-4ACDBCFC-E720D5AA/0/0
X-purgate-type: clean
X-purgate-size: 241

>There's a stray + at the start of the line (apart from the one that=0A=
>indicates the inserted line). I think that's what Andrew has tried=0A=
>to point out.=0A=
=0A=
Thank you. I don't know how that happened I will be more careful.=

