Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCD9C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 01:47:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428026.1650736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pbS-0000b8-B9; Tue, 22 Sep 2026 01:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428026.1650736; Tue, 22 Sep 2026 01:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pbS-0000b1-7n; Tue, 22 Sep 2026 01:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1428026;
 Tue, 22 Sep 2026 01:47:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8pbQ-0000av-8l
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 01:47:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8pbP-00E4rP-M2
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:47:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1de25-8faa-0a2a0a5109dd-0a2a450cbbc4-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:47:23 +0200
Received: from [52.101.65.105]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1de2b-f479-0a2a450c0019-3465416981af-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:47:23 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by GVUPR03MB11257.eurprd03.prod.outlook.com (2603:10a6:150:33e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:47:21 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:47:21 +0000
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
 b=CcqhSefTJ8UTG5UEu4NrlEHR/1RPImnioC3u1El6JsiYk2hCsgALmn3yfIeu6sXSykj9R4PEnXo8reRRqsAf7fk+fnehLeKN7g5cvKnLuZeZoO9UJWqxbSnAlA1sxwiF43uEb9OAI5sOzfSftz/gWsDc4KHrVvzwE161xZnZ2u0s47Rm5oAhOWGVQAhZ6t6H410fdzGOxfmor4gmYf8vyo8I+0JtdaZ4J30Nrdl/hL5m4cQHqon5O1Ve0xfqIto0KslNUpibPsR+Xj2x08nWPREqCTvZLo/fdpoQG6rguTn4PzipZyp8RmoMyLnccqjbEWt+FGwaTlstf/jn46pzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABjxkqnr7LrSZ7UP9i5GI6jpB4IZ0Q931uLfva6gBHU=;
 b=y95KIFS5i9f1kzH0Y0mNkl1nLU+6h6YnNxiUHgpMLxcW+YAh0XDfQZplV6AacKMaqzPLCqCIRKLvEptX3rX8ls9go0P4jmJv7LX1hfPoG6U/5SJ09cG17LyNmeujia0SV03ZuqBrQDDxZ1Dk8HcZBcK2MjyzYMjdcDDY0cIlhLlzExCM1T0vPwYgFG8oMhULkGa2bfpjrPzmWeI0rJDndIqJryUtLa7GoUjSLfB517JnnF8y2jRheDgkd2qzatjynfiSJShAEUfLMcoKFV4cI/UD+PFT/Y1hB8pSWYz0HV76R7gRsw8Xjw7/sgtyy9E9+Gar51UqxcGJMCX06ZpFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABjxkqnr7LrSZ7UP9i5GI6jpB4IZ0Q931uLfva6gBHU=;
 b=PQ2hEfAhW5TLB6cTBA9e87LpOUgKRD8o0qXhY7oN0RjcRxQ7+jxIPyuxtYNd/uJ1o5feJycQ4ACyeTy2+LmEN6iA03MFxOZO6sdIckvj1YFFhWP07w1c/x2/ObFrY2oelaS2vp+CZG9UN/74mshuZ4i7JlrfLXCH2rSC0FDZFoH3scr3qjbtTcIxZDnFz1ud/GaaT4OZEglvjkWvdSjE6xVKxdoXMf1CV0AFdvuap798alLYatBNgfnazR1t/FLCxXvQjJhKM4T0R29cljIM960P+wJKOuHQH3A5xSZtpQD9UKz/xgyIG8NEBDHoxrsCpZ8a2F2b2xtvB/PD/WDpbA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>
Subject: Re: [PATCH 11/14] crypto/vmac: don't cast away const-ness in
 aes_key_setup()
Thread-Topic: [PATCH 11/14] crypto/vmac: don't cast away const-ness in
 aes_key_setup()
Thread-Index: AQHdOqU/WljR8KEAWECIzLfq3OQ1uQ==
Date: Tue, 22 Sep 2026 01:47:21 +0000
Message-ID: <877bke6orb.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<1faace7c-2425-4691-b23b-3ffe033e5bc2@suse.com>
In-Reply-To: <1faace7c-2425-4691-b23b-3ffe033e5bc2@suse.com> (Jan Beulich's
	message of "Wed, 2 Sep 2026 08:35:10 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|GVUPR03MB11257:EE_
x-ms-office365-filtering-correlation-id: 2815586a-16b1-4982-bbf7-08df184b7173
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|23010399003|376014|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 sVy5WZXdI+E9YvfF8sVqrP+oCixKGLgt7YT/uyM8lujJh3wP+5J3oH5jpTE+FM1x7fP72hZBTNOgM+D9DuSXRF92U2P0jBr/VV3jIVOaK3P6njmuiHaBBYGsTEhEVPUjCTPrf3ByfQTc2K1bWdSHFUiUXlqol4BjvBRPQvmP/M7cUSRFU+ELvpJkFEDAx5H21EXBBl6ihRVcfGuEixtbLRPPpxJFhKuHth5RRvykX0Ho5ibKJefFgJKkuX1LR73yY/uejQn8IxUMu4rgbzRYI3b2q2tX55dySukEo6h/9QE9sxpqewmrNoNxndelK5BKw3qyHPVqgjv8ONY4jEmnAzaMO1rabK5RqVhgKUNUVC2DZWuqwMR8ATCPMqpZr9ehg0uMJlTBqxXIk+DSlVYez1VSSQN/m3Bc+Opl0D/sYp4kYS9rGE5jJF37yTAeT59eBmVE6l4dB837gLQxBey40GHbVmvHGX1dS3l/KXP5THZHgZMCV2Ma3wwTuNbG4osFOo1GQXw3yZgFJfJCjOJz5QcPuq+KFmoLZw5jedUse4w90Bb4bhJemM6K73wZYv0fPLNvoAs8rNkwVFpC3A8vLM5nR3Yr5pGvlUU/ajL+NMH8qSHHZcU51ISUcJE4jIjGwSZyc/YVmfLRcDFILnQhObUJx/7r8ujAESw9OqhAGYcUB1nAfcjh2/6HK5tVw2C6zceKj9fa9deLoQGH0lxjJaDZkNiDJofeMsVOFWdtfMU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(23010399003)(376014)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fC5ylRB8RPjezt2J8c2kV+k0qnjbTT0yB8mJyjAsxldGbAyBoHnQqjv/Co?=
 =?iso-8859-1?Q?uTNS63/o5LnYSvyUm0XDKlnJ4CE8/rFRgYL02efS6fhyZcLygVg8GmYnxN?=
 =?iso-8859-1?Q?jXIu3v17gID2Q1gVhtEfkR1ahZUJ8vnQvXWn+87LikdY37O1NG7t/dTJq2?=
 =?iso-8859-1?Q?NZY6ZYz/ExecR9rCZbe03frNHrE1WOGEvMgss4jK6nxhq13Z2kFHqS1DLo?=
 =?iso-8859-1?Q?bMuLD7Md1vwGHapkK+Qa+lNjXrFmltMrsXUj5RvoOfq220en1b3L+t04S3?=
 =?iso-8859-1?Q?wrRW90UJoD5l7UykvirkD4k8XESUFBk/09XjD7RUCA0hb4ZiK4PGFsrxcU?=
 =?iso-8859-1?Q?W7j6NYBaoa4aY17m/EZBo5d+svuxe+aX+9IzNBF14zD1uNtF7ZQQn9M5g0?=
 =?iso-8859-1?Q?NE+eB1wItz7ql7eWnfaYifF5pkDufIWOJtFIgyvKHxtG/ncwF1SL8XI5VC?=
 =?iso-8859-1?Q?snZt+Cqw7uSqBB9C0mRATRXO5RR8jQ1veypbLGKO/ZHmjNq53NenPf2obo?=
 =?iso-8859-1?Q?CyI/rylScc96r8GcFbpL7M4pTb2ulmCvO2mrEgqqSXVc0dAPp8wUGcVAZc?=
 =?iso-8859-1?Q?gKBJuNJVXcKI/uL28x8Jce2MYiHuNn45c0SCYz5fA7du66iaEPiThjFWcS?=
 =?iso-8859-1?Q?WUzQzIlI+E3ukCgLc+uYxorIrrSRdcwDLkbzy0NN7wNyjUMWi3vpFJXqps?=
 =?iso-8859-1?Q?qHsrqyo0iA4428u71cJphaVoXWV6W6xFbu2n34ZkLyCp75l9w1GWSpIZm4?=
 =?iso-8859-1?Q?aaoS2xV+s1ncpE8fI3KEGvKzG+OVPQfvNxq1ASdS1fjZVNjQIZv6eFmaKw?=
 =?iso-8859-1?Q?hfSEsOzS4hxjf11ASjoolFGkYh/q/UO6ztZmknpoTdC/w7yyHtRjd9HdGL?=
 =?iso-8859-1?Q?yoBb6yup7KdGy7D4ewlc+g5btVYm6TPszqTtmZn1df6PXH90hakRUYx7eq?=
 =?iso-8859-1?Q?v4APiMkg/w13p3lRw9CiR3UinVHkpyGoeEEXSqDqTRaKqpdCTqW74kgDIs?=
 =?iso-8859-1?Q?PFavoFf0KtkWJ7glLQa0nX+244e+mZ77IAZHrIbtj4zc8SmstbvQ6vKQID?=
 =?iso-8859-1?Q?m0ErrIIFy6ButmFVXtFJt3PIalpqgYDe6aQqhoa9gby+RArKDfW+RZkTd5?=
 =?iso-8859-1?Q?s6UvAq6ta7dwWv8PcS9gudk2wlXgmncF4L3axVQNXxHi303wMK0RNoBw6u?=
 =?iso-8859-1?Q?7KGxwr6Lfzv0h4tomAiaanl4HFBXM8VK/hXAkY97Cc9qqfRvAVmb0Oh21v?=
 =?iso-8859-1?Q?Tnj/NZwyTHBjNHiBfLeWhZVsJP9ahydZQ9hiURxKSSnI055/+cAHsXeJaX?=
 =?iso-8859-1?Q?IgLW6i8mqCIHxqlzC1b3mrPNNfCIuDy8bcEdC7rL+W6xJOb+OECh5/HH7g?=
 =?iso-8859-1?Q?SCSfJGRrB+wgqU1DbV70OdHIVMHNZoehZPIwBapEwC+pt1Fbk+PrDU0zgp?=
 =?iso-8859-1?Q?TH2bQE95AXF7w3Cm7PbVH/SBE/8Qt1Eq+zaxuwduwF4k+zaGk30ED+FogB?=
 =?iso-8859-1?Q?Zea9JtMWlZKm/EiFZ4XPeU0Eq1emEArpAjVVKKFfohuso1IpAy0W+aQY63?=
 =?iso-8859-1?Q?IGOTp34yDewERllkaNgkgSZrLWHfd/Z+gWprAD5IpIfHYh/Q8zWgc+Tbe+?=
 =?iso-8859-1?Q?0/VqRLOuLzehNw6NcppmOaI8Jf0gA9RzZXbaDRydmwYZP6J8MuLYnujIuz?=
 =?iso-8859-1?Q?7T3GqORjcK4NJJKolY+f/K2VCvJvqKM/iQ0KdC5bRZuzHfCkIx2dmX/n5c?=
 =?iso-8859-1?Q?2DCTBJRiaSP38smmgW6iSHUs+Px8u1tdSmheo/5nWK7uvdSbpDEs21fhzQ?=
 =?iso-8859-1?Q?7rFP+ZKA+0j52zULIS6wlhhYFkrto1w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2815586a-16b1-4982-bbf7-08df184b7173
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 01:47:21.4437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKgyutQK11O26aMrcPTCw+Lbf1Npjm34+j5mn+S1zwl1sNIISa0ZszkjLNS+rGW9TRj4GuJ+a+VyA2Efjm6HsS9cmLIC4yaUF8gvl5j7LcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11257
X-purgate-ID: tlsNG-d25034/1790041643-76ADCA5B-A40C5CBC/0/0
X-purgate-type: clean
X-purgate-size: 928

Jan Beulich <jbeulich@suse.com> writes:

> vmac_set_key() passes in a pointer-to-const, which has const-ness removed
> despite rijndaelKeySetupEnc() properly taking pointer-to-const.
>
> No functional change.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> I was wondering whether I shouldn't adjust the adjacent aes_encryption()
> right away as well.
>
> --- a/xen/include/crypto/vmac.h
> +++ b/xen/include/crypto/vmac.h
> @@ -69,7 +69,7 @@ typedef u32 aes_int_key[4*(VMAC_KEY_LEN/
>  	    				    (u8 *)(in), (u8 *)(out))
>  #define aes_key_setup(user_key,int_key)                 \
>  	    	rijndaelKeySetupEnc((u32 *)(int_key),       \
> -	    	                    (u8 *)(user_key), \
> +	    	                    (const u8 *)(user_key), \
>  	    	                    VMAC_KEY_LEN)
>  #endif
> =20

--=20
WBR, Volodymyr=

