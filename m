Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2D8C982FC
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 01:24:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427969.1650662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pEz-0002Cz-Oe; Tue, 22 Sep 2026 01:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427969.1650662; Tue, 22 Sep 2026 01:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pEz-0002Cs-LX; Tue, 22 Sep 2026 01:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1427969;
 Tue, 22 Sep 2026 01:24:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8pEy-0002Cm-Uy
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 01:24:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8pEx-00FPmq-Or
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:24:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d893-2eae-0a2a0a5409dd-0a2a4506bc4a-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:24:11 +0200
Received: from [52.101.84.81]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d8bb-195a-0a2a45060019-34655451fcc3-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:24:11 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by PA4PR03MB7456.eurprd03.prod.outlook.com (2603:10a6:102:ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:24:06 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:24:06 +0000
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
 b=HvfKMmHTleRBI1pDwQjiVRhIQIIrIyzyYJNI5o/EIfQOY2lpfnKlH3QyclIYvP3UkZdMvIJn76yA/Zv2L0iGNIf9YNPTEyHEWlybDtO/z8zSqDcOqGDH8RGV/YRM86odlRjC4L4nOCkDsFkGxmRWt2TBLf1Vxpo9mPClU8yNA6OBMiSbs1wVzMjvuGNHBIAOJwIS2nAz2ZWbNxi9BHRVjm3YM5rWLKuhFG7WEZz/yZB+EJ3kgLMVTC+SRenFVCJr+3v1aMT2H9lm2QG63yE2UPKWsQ8pQNetNXxnlYV+I77l7pD3xAS+R6l+ZjAUCfX9OErnnwwkozAHZyrec31aXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFkLjgcY5vFbcVBbMNc6DQ0M31JpYAiTXQSw2Doajqo=;
 b=Vq0ucSRl+lG2GOEBa5J3+eJ7XGJye/zkN+u04P3W0Ie/XRnJ0VteKv1lAcssIyPnVzQDjSfNVyCj4/l6vnpIctRKm28L1yB0zeKYcxNO0zbkB3EHOfFrZPvPy+Wcotp69vDbtZW6pqvWXgK/p3HCrvwos9nX5o6DW9FroIWuv9VuXsjYL3HsakStMoIr9zs13h/gG/Me7gMwyFxFVFciZ8EioM/nkpRMBGrBApQwFwje9gtZCpfr1AomCpBMQ9w45DuhqHImMsu3V2ozYv79pFxawaNvSO4Y8gN1HDFau/adp3L4bdCAEBaKj07qGpGbQFBc/oBbXfZZ4hVapitaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFkLjgcY5vFbcVBbMNc6DQ0M31JpYAiTXQSw2Doajqo=;
 b=K0u2H+9ateCfIgteT+km5GgFwW0a6IO60dU6kmrdOua2aLmJXGFM2z/uxL2r5qKf3LFXmkAf/wStVQe08biuqxt5D02QAZTe52pu8uPQhU6yyG33B0yvMrDRGFy8T+d2Odwq5RNQkShksGBfpNKd9VIcRP+LLqwW7JB2lj6Rr4LYPWoo/SHPNxvAzsnH2ScoP2VaBOfWkKRV6e8MHn3a8onVTD9nd59SzO1GsVF6FI7Z55yN/on9sARcKw9G8ccSmgt0/muQkcarJw6ayT0jlBxejL0tkUP2+YhfpV1Lx/9KTEtiMdv/G4F+HoCrbbMWbprnrd0Mm2sMUJQxwTVuDQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>
Subject: Re: [PATCH 01/14] lib: obey to Misra rule 11.8 where possible
Thread-Topic: [PATCH 01/14] lib: obey to Misra rule 11.8 where possible
Thread-Index: AQHdOqSP/YfdAsU2nkefZ0kBfbUzQg==
Date: Tue, 22 Sep 2026 01:24:06 +0000
Message-ID: <8733v284ej.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<12d3f4cc-e3c3-4f2a-a791-724271473fb9@suse.com>
In-Reply-To: <12d3f4cc-e3c3-4f2a-a791-724271473fb9@suse.com> (Jan Beulich's
	message of "Wed, 2 Sep 2026 08:30:02 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|PA4PR03MB7456:EE_
x-ms-office365-filtering-correlation-id: 1ff4ce41-082e-4f2b-0145-08df184831d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|42112799006|10067099003|11063799006|3023799007|6133799003|22082099003|18002099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 nTf3+zrXUxebORWXSFSLaEszNYhZIhnScepHPsUUYRxPfNPcVukpYqobx1nHTu/kCFpM5E5yr7KqTO0IC5rqEkTX02nInkMRYSpgvr2De66CEB4DlRUEvT/0sY/Ep8zGhQXE/kUw+UBC8dZ2EquxhAAr8hcUrB840y8ZzvuJf4Ywd6ElYj/XF26mW4B849YwYKosB6rkxsTU5doKx3h5DlyRnaNWWIDm3O64VbB3MzUMLSDLyk5vMBcGuQni7LNwWjngL0R6DPPSi5435qYeXKqC8AJg9TcZpvE2dPRQg2c9mDzPfRUU8DPdCxKuBVAAR64pTJerM20PVTaj08TobER1eWwHa/yU+Jot4CtWdeTgLaERNM6AabIpQzqR65MnE4kn9jQOMqVIGEUs5C66RyEBu4QAJWsuNauSg3sdWytxP/Rclm/FyYHqEoY5MwK3ui+Gfuh22BduBuhbwZqdDGCjIY39YmqaHduOd0yBRNsZ7S08WvOuKoUph0yWjS4BuTY8q+o8IQFXlqlambRW/GuKl25GB+sOraa4P7txXlJrlZ1hztanPi7oAKRgiJXnmBVp+qRzZZQhFz6WN++yUl3MC1p7f4tdf+8ImGfkZc3LQPcQqbc+VkcAoF03Mc5NQVnpa8Osj3j/itKov/mnqE0l5brljTark/PHKxM3SrM+oV48JJK+EfiilXzISt8kTVAvwU8G3KoW+ZXSeQgD74UbinQ3NkdM7KkkC2H9N3s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(42112799006)(10067099003)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/r9LBPnMfEhNTd6PlSKzKZ0xzSs8k6gVs5Q30GnGl8XxYNypnsIODkYlv8?=
 =?iso-8859-1?Q?kqcc9yDbulL+bFYyzNr0f37E74P/W2nKvef9S4FuvyVOXS3I0BDNpFbppe?=
 =?iso-8859-1?Q?YFlRi6UlYukOD8OLUpAiLTS1U0HG8P9nmBDkNhS1MYiRAcyKE8b4tACzcg?=
 =?iso-8859-1?Q?jAFXiEqULZZXNNJwVwwg6ZFPVQhwsv4qOwNIEStOBn+wTiynOzn1IKWp1v?=
 =?iso-8859-1?Q?PTSI6GhXZF7a+TnkOGbJyAA06tGRpNIQZRwj+kDAdQT4coscY+fXLVocwd?=
 =?iso-8859-1?Q?rhKNn58o4pU3R73Z+Uwgv85TJ7vLEF6bQp/wei80pAeu6vwCo6Y0Pl7WZN?=
 =?iso-8859-1?Q?rLnbKH8TjGlKdPYTdlXWvoA4Co29E0oayZntXP+Ze59SejeG9ZYeOxnAYk?=
 =?iso-8859-1?Q?35uDbJFbRwGOuJT1Q93b9I15WX5iu3ja0mubum/88V5Yw0/JBO6ykjplsI?=
 =?iso-8859-1?Q?8nHaLPatDl5ZiaT9kzm1KZ9GxWgKvfGlElXh2+D/hMOGISg/td1UustRIL?=
 =?iso-8859-1?Q?hjrdtz6S12saers3Yq1b8deDyS4PE59zwJOTUa0/mPld4NBFvVAkBky4KD?=
 =?iso-8859-1?Q?V9H61ctnSQrsfLATOQkpYYRQpg1i3EmRrr56PApsLu1Qv+cwEZ22Lct5bx?=
 =?iso-8859-1?Q?z/xYY6JZWq3uhATUHiG/hdfZM4MIEA3hZEBtOHseXDHwAjd6TPme159nP0?=
 =?iso-8859-1?Q?4GXf/jRni5sY2EHGUqa2hEj+MBjI7qPjdmGu0to7wMob+ilD1QQBNrAlLz?=
 =?iso-8859-1?Q?vFkjomnJow2fKm5A/gX+B84T0gq/pW+emLUtk43ULvfuaiRhjIzQZ/Wq1e?=
 =?iso-8859-1?Q?y0RosbV3AdPFspNB5cixX6+FKV+dugAyGcz1q/0taE7DNc3UeqvDSKXjgJ?=
 =?iso-8859-1?Q?ENXT7X1PDeI9QPXzzYQBZtJcWp+gOZmAs+TpQedazYlGvD694XbcdFKHns?=
 =?iso-8859-1?Q?tWe5QyeFIzugo/F41k7ocWyAarHX8Y/iIyU2LKCPe7W39GF4Q6qilltGGW?=
 =?iso-8859-1?Q?Xg3j+FXinDaagcuUIwTn2uH/l+JiLPpcdh46CcplH2IxTCpA9Nd0vibgDl?=
 =?iso-8859-1?Q?LYQ1+Sdi47xURmESwUxnam2Jm4rjTdae/eLkAEWE3TqXAHTDJGI5UQXOAm?=
 =?iso-8859-1?Q?SU5zxulPh3php9ioAFJPTYvNjVmXfRJ7DvwwmN3yXJrraGRTT2Go/b5/eY?=
 =?iso-8859-1?Q?1uOJWzCXn8ITRjm5/dofZsNpkzOILMQLCTktDVP86HzlbGxknFKSCCjJ06?=
 =?iso-8859-1?Q?jYwh3LwnEY0dSzr2dvul6W5k0xh3EfqSbJ/vR9ml2QW/9eOovpWBPNlEAz?=
 =?iso-8859-1?Q?mB3S7CQG4GunCSI+5/Hbsl03s/BXlLN42QXQL8zi4b1p+VsqjxioQXmeNC?=
 =?iso-8859-1?Q?rafGQBjCoDOAPtz0BJZTkTjbpgypn8UMQ1KJaV8UFn+Fx2oDHZ34SJ6Bnp?=
 =?iso-8859-1?Q?TRZWo+bH6UIDjcaUVYXADUBuW6TiW8W3wFUGG6qojlTfd6w6DnIElguLFQ?=
 =?iso-8859-1?Q?qdB/P88t/LmVyrCFNaD5WZ/jgJsjQPnCuRITEDmbTO912T1WRGRVGBRHIx?=
 =?iso-8859-1?Q?KkUCnc1lvp5mWglriGa6NAafAjPHMtSxEw936W7nTh2WKYKIER6U8jkfmA?=
 =?iso-8859-1?Q?OSqSbagS2uHTMZ4+2xuInIDd6awkStp9B09vs7QW4XoMBuQAXKSXDWfePL?=
 =?iso-8859-1?Q?RHzZEMxx2NSNyUmrkmvZiUN/yZlBMsvZA5f6ZOxLzBNIKBIVWaHnBRvKkX?=
 =?iso-8859-1?Q?vw5FL16nrZM5JWZv4h/71ZAMmtLASlqftQl77a4RC/P+zTSQYDVSKBRPdH?=
 =?iso-8859-1?Q?vpoFtSUQvJ70L3HCDAZ4Tncs8NpOa4Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff4ce41-082e-4f2b-0145-08df184831d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 01:24:06.2683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOjvVxA5cK8dVphpKgykx0dxfDijMOmGIwJZP6cJjzGIzsJHWUZ1S2iZ4ypF5s2j+4gePJlQe1VEHUpSntYsENJtwntOeYdNGg9dz9fQK6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7456
X-purgate-ID: tlsNG-16d1c6/1790040251-F520877B-B0CB7199/0/0
X-purgate-type: clean
X-purgate-size: 3130

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> Casting away const-ness (or volatile-ness) is never a good idea, but
> some library functions (e.g. strchr()) require doing so. Where not
> required, remove / replace respective casts.
>
> While there convert touched functions to Xen style.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> --- a/xen/lib/memcpy.c
> +++ b/xen/lib/memcpy.c
> @@ -15,12 +15,13 @@
>   */
>  void *(memcpy)(void *dest, const void *src, size_t n)
>  {
> -	char *tmp =3D (char *) dest, *s =3D (char *) src;
> +    char *tmp =3D dest;
> +    const char *s =3D src;
> =20
> -	while (n--)
> -		*tmp++ =3D *s++;
> +    while ( n-- )
> +        *tmp++ =3D *s++;
> =20
> -	return dest;
> +    return dest;
>  }
> =20
>  /*
> --- a/xen/lib/memmove.c
> +++ b/xen/lib/memmove.c
> @@ -14,21 +14,25 @@
>   */
>  void *(memmove)(void *dest, const void *src, size_t n)
>  {
> -	char *tmp, *s;
> +    char *tmp;
> +    const char *s;
> =20
> -	if (dest <=3D src) {
> -		tmp =3D (char *) dest;
> -		s =3D (char *) src;
> -		while (n--)
> -			*tmp++ =3D *s++;
> -	} else {
> -		tmp =3D (char *) dest + n;
> -		s =3D (char *) src + n;
> -		while (n--)
> -			*--tmp =3D *--s;
> -	}
> +    if ( dest <=3D src )
> +    {
> +        tmp =3D dest;
> +        s =3D src;
> +        while ( n-- )
> +            *tmp++ =3D *s++;
> +    }
> +    else
> +    {
> +        tmp =3D dest + n;
> +        s =3D src + n;
> +        while ( n-- )
> +            *--tmp =3D *--s;
> +    }
> =20
> -	return dest;
> +    return dest;
>  }
> =20
>  /*
> --- a/xen/lib/strcmp.c
> +++ b/xen/lib/strcmp.c
> @@ -11,16 +11,15 @@
>   */
>  int (strcmp)(const char *cs, const char *ct)
>  {
> -	unsigned char *csu =3D (unsigned char *)cs;
> -	unsigned char *ctu =3D (unsigned char *)ct;
> -	int res;
> +    const unsigned char *csu =3D (const void *)cs;
> +    const unsigned char *ctu =3D (const void *)ct;
> +    int res;
> =20
> -	while (1) {
> -		if ((res =3D *csu - *ctu++) !=3D 0 || !*csu++)
> -			break;
> -	}
> +    for ( ; ; )
> +        if ( (res =3D *csu - *ctu++) !=3D 0 || !*csu++ )
> +            break;
> =20
> -	return res;
> +    return res;
>  }
> =20
>  /*
> --- a/xen/lib/strncmp.c
> +++ b/xen/lib/strncmp.c
> @@ -12,17 +12,18 @@
>   */
>  int (strncmp)(const char *cs, const char *ct, size_t count)
>  {
> -	unsigned char *csu =3D (unsigned char *)cs;
> -	unsigned char *ctu =3D (unsigned char *)ct;
> -	int res =3D 0;
> +    const unsigned char *csu =3D (const void *)cs;
> +    const unsigned char *ctu =3D (const void *)ct;
> +    int res =3D 0;
> =20
> -	while (count) {
> -		if ((res =3D *csu - *ctu++) !=3D 0 || !*csu++)
> -			break;
> -		count--;
> -	}
> +    while ( count )
> +    {
> +        if ( (res =3D *csu - *ctu++) !=3D 0 || !*csu++ )
> +            break;
> +        count--;
> +    }
> =20
> -	return res;
> +    return res;
>  }
> =20
>  /*

--=20
WBR, Volodymyr=

