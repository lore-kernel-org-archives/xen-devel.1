Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0BEC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:22:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388888.1629857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4E1-0001WM-Nl; Wed, 12 Aug 2026 08:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388888.1629857; Wed, 12 Aug 2026 08:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4E1-0001WF-KW; Wed, 12 Aug 2026 08:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1388888;
 Wed, 12 Aug 2026 08:22:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wu4E0-0001Vy-Oe
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu4Dz-00DTSM-Me
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:22:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a7c2d2c-8faa-0a2a0a5109dd-0a2a4505d506-16
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:22:11 +0200
Received: from [52.101.201.25]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a7c2d30-4cb1-0a2a45050019-3465c919d5b3-4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:22:10 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA5PR03MB8402.namprd03.prod.outlook.com (2603:10b6:806:47b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 08:22:03 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 08:22:03 +0000
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
 b=PiKofyZfKHk7Y6j/BcRGGqbaZcFY4L0t74T5xt5yOhk57dvjfwxYmXIEZYtzVnEneLEV/1looT2NZU7b00zvGz/hCF8928493CyymT/+aIqrxMSfT48NNTpVAyKLjpnrOTPAra4vdmzutxmKvZzlCT36YI16NdMKa2gu+ysJwIy6hLlxlRbJ0vQTuubn9vBZYGls1iHgoRk/cORCYMOsw9jApQ716z09WvRtob7HluoyiI4cRnakc356C3Jvy30IhktTEkY52+UVNd34S1uAuvJNX02xL45Q0/T66vpLJT2qq4f6yuIeQ9DOrxzqiRUnbtCBYW6GQrDKZ7dr7r9iYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PUu/HzIHmCgPGEa4oww1wsRdsprVs1lpIQOyApukl8=;
 b=T/RMGaIGXtjHBdEXJLHnC3fb5qh7bs4te4zFlQDiz7e8Ejb5p9Yin4Y3y1WcujFXruiuamjR9zuiwlmPL7zWSPIsnpv6niaSwGof5YhK290m+BR259jmYCjw/1WfQPcxj8bZMYHwxIGrxk+m819Wkvw7FyE2ioDAVLBHiKm96Jh7t4CuXPOFftc8kUatR8Qb7ujlBnVYd3qZtGBWr80fMlquItvYCAZXpzsCIxrLZdYB9EGouPqAzq5arYFX65Yw38gx3Hq7RUqOjxyvPtrp7RpVx1pvy69/yA+B+kyTR0Ckfy90IN/wZ2OQtDprc8QQIMkO3dXtbqOjrkEPOsw4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PUu/HzIHmCgPGEa4oww1wsRdsprVs1lpIQOyApukl8=;
 b=GIEVTF8Q7YJfiwENMEjPZSfF8bx7dz7SCb09jZNncnuj/6yGw2iJw4S1heojyFD+7DLMkXbFsbZIczzWB0B8pfhqj4xdoAwimxZNE6iGZBDncQ2oVC6eQcw6BBgxNf7LBkSy9M9FdhhtkFnvHemfyWkDOQNEyXrzLHo69a+jU7M=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
Thread-Topic: [PATCH] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
Thread-Index: AQHdJrO8whNB7U0leUOma0sfTU1dNLaaGXsb
Date: Wed, 12 Aug 2026 08:22:03 +0000
Message-ID:
 <BY1PR03MB79967CC42060F5EE8E97A4B0F3DC2@BY1PR03MB7996.namprd03.prod.outlook.com>
References:
 <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
In-Reply-To:
 <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|SA5PR03MB8402:EE_
x-ms-office365-filtering-correlation-id: 15209b41-e978-42b0-671d-08def84ac9f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|38070700021|11063799006|10067099003;
x-microsoft-antispam-message-info:
 Lj+sXxPss+i0pPauAhEHXIGjJtocW1CyTHQw8FyyIIHdlOsdl9m85/dkANqvkA+GZma0BmdFe8WSsiTr6ZoaW+5XsQZ8nq4KYIR68npNoRXAhdLa9f9mOQxlyS8WiGjE2T8brAEsFLflwVjvidCKihZuFm2pD/V5aLX8ak1tOVEW0jIeCVTVlV3S8kHbue17R3hB1UHsWbWBU+zI5XlaCox3goj37ewgg/y5kD6xs9wOfT7TarJvDRT6igGJa8dS0uHu9/qLxPkAv48bp2F8QBe+bwdp+yEiaIa91WuniO4mzbJRzY2et3NWsgruRuUA4JeCTc509l5cRJRPkEyI4DK9+wamt6/ihykklL62zfCUrLkH1LvDnakFUFuoLkZuKYA2kjhIaz8YCiAcuFVBAgUFtrE6J9XeUDj1/D/9WJHIXZmz5MWnYHZqe6B9KM0c+GDLZO0eLSYbEUPrJ2MGekAcQuLb2zWXHEwEMkp9I25n5KDzSFjtA3FrAxEv2SWaSepl7P6aFwzy9gd/aR5+/n5ldnhLBmmUoXOfwtiucQz0pwSA77tkISY/3M0NMjPIBUkhLuUSGPCSmmfIUMNWmgvZyU+7nZVihhEIr1a3YVopuwLf34W92Z8apMJx/YX6T9kmdiW0zX52XkCx3/N4+CbnPK0HzKjjtNohpH5n3gRuwbb4eRbU8QPwkZCU9nujvwwI1MzQZuVlq4tbtbADDteOokchfiES5c2/agy9hhY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Bjp4229fHsQGXy2APT4VQ/Sc1Xh6JLpC5G42aLkjB0s6lpIxy/cv1E3JWQ?=
 =?iso-8859-1?Q?t+C90qQrtrYoSDas1QPz6QEnC+A3g/ICCvHL7k8+7MBXi+LmwXLCGXf4vh?=
 =?iso-8859-1?Q?2XyMMtrLqLz0pFDw0Nqt/Oj9KHrSOc52U/xc+/aLzXqb72m5DpT+6N90Kl?=
 =?iso-8859-1?Q?sfhra7wDzv/O/SsEsxAcdHd+wGNmjKTfR8UCV96PdUZ1ABA76W4WQ2nmEe?=
 =?iso-8859-1?Q?0tswqqOZ5E3GWodou3Y/liBUf9HNDfZqyqCa15fCkmmvic1rzDlRSrbOnY?=
 =?iso-8859-1?Q?Rvbx5k+H6T9JIuLQ+fX8DxgGGXhNreEGGxRquxOIt4rH+lWwwa7d6RTuNI?=
 =?iso-8859-1?Q?OelRpwJ9m8mqb5momO5UXEpmkE98Vhyad408jKVWn1FbrIXv37esayj2S6?=
 =?iso-8859-1?Q?A7OGekl0ZXxnQWURocZxC5nH3gQxrmDMma1o0my9/SuAyomieBSJfhXFtH?=
 =?iso-8859-1?Q?I8n2WuqGpJC0mPo5fQqaB1Ag2kRaIPMPxkVVKBTRl5VyEctXdAubDMQq9J?=
 =?iso-8859-1?Q?/u+rNvK3/N29el7bT4sCCwkdh0T0GvdX5pIsHbLUIpu6awlhx8/l5xay9f?=
 =?iso-8859-1?Q?p6KrB64xsxdrVUT8h5e5D/AZEJFkXs7ODQZeXYClNTEci5Pp3o3PKJQPZk?=
 =?iso-8859-1?Q?sXZEIYhf4LYZJKDHlhX7sV4cnOZYgOfcXvjuVt3rK6VYtC1j+I9+1jGLBi?=
 =?iso-8859-1?Q?lh8VBscGKLZrTj8Ri85R7Rbl+CuadXtnxYoK5rmcaRWlWxUX/KbTvBDR/U?=
 =?iso-8859-1?Q?D72a/MxfYsHwU6f4cX0byYj4SDIee0HZEQ16FI14fL0gdW4/ehUJYnkCkg?=
 =?iso-8859-1?Q?ZA4JBV1RlY9bMVUx+5Poz3anp/rNs0sH/sV33OARFRdcxe6Ok21f5Up+Of?=
 =?iso-8859-1?Q?xo78EIXQ9XiH3KAF6kGP1Y5gd5KGp/Lrfba1mfy7MItHN+JTSFQLh87SzJ?=
 =?iso-8859-1?Q?A8DZfzPD5FYv14EKSdHUK5dlHacI+6ne1A6LQvvpmGPKiZbrUTUo29Fi39?=
 =?iso-8859-1?Q?qaT8gxwte7xI/H5LcmyzaKmrXd5SuEWauE8lolXuj/mXVjXle5gQzeZq8K?=
 =?iso-8859-1?Q?qEQg5oF6X1ayOJrcisvjMMwPOq3KGJMsxk7lXYAOw44uMpzd5qLYvq7eR2?=
 =?iso-8859-1?Q?5qvcOAQNE76Fi7wfRO9yjamx0fMZQIVRBWHGTaepd8voCE8HS8uS2J+DmF?=
 =?iso-8859-1?Q?2GnAtyVoWwM73hTtfmJ6tZUpy3tsiS1Y5srFwdxeq1TrBkOFXfLaeoXAs0?=
 =?iso-8859-1?Q?iRbXAiY5t2EBNGkySsKpl38y6qzZO1Qf3SobpK1H/LZeEIZ3C94cVTmdhi?=
 =?iso-8859-1?Q?X4xpfns+0VD0qdlBInjqBPauX0o09+f9KOJs0P4CKUY8BCkodkr4Ch95+j?=
 =?iso-8859-1?Q?6HoXHiy9BCMblhJebj8HUaCXVoZkk05hq5En4gFEI2DW3m49LPGhuO+/W/?=
 =?iso-8859-1?Q?pBHa6Lhp5pdnEy2VWa8v8PZtrYwQMQR42Ga+LUEVxd4Ycj3CtVIaO7NbMA?=
 =?iso-8859-1?Q?IbZJYMzjoquCrBFPGnAEa1dtWJYcTGs2tkFvDGi2vxRn7uF8r7Gn7PyhgE?=
 =?iso-8859-1?Q?BewcqqeZ2r97lT1LwfbZY4vf3YbhipbZPXIoS+Q6GhjMPe+t+Dzr5Xj8Zk?=
 =?iso-8859-1?Q?+1iay0ZOWQUTmwsVufc4D7PzByFOMVfDkHB/r8IjQ6R3bm8pV5C3yMPtDi?=
 =?iso-8859-1?Q?aRwDUG48mL3E6Xjp1oZa4+N2TXdnRX16eCm/Df8BDBeJuJTrds9gPcKwIR?=
 =?iso-8859-1?Q?6LVE92urnMqCpgGWCFs2RClUfQ07DeIwlbCs+UEwseuBQx2/fcACpingUe?=
 =?iso-8859-1?Q?r9PJ29ZICg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15209b41-e978-42b0-671d-08def84ac9f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 08:22:03.2385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgNXytxFbUgwcgo2UVuw3Rh5da7Z1rMAVAujlJzSjM3G8Xgiy7+th1+PhlyepaLTIhgU3BkomWsDmXKXEwwcng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8402
X-purgate-ID: tlsNG-c201ff/1786522930-F64B42A1-DDA81F40/0/0
X-purgate-type: clean
X-purgate-size: 235

>CC: Kevin Lampis <kevin.lampis@citrix.com>=0A=
>This now expanded sub-command field can be used for your "unmap_page_range=
 optimisation"=0A=
>series to avoid having to introduce a new dedicated hypercall.=0A=
=0A=
Thank you.=

