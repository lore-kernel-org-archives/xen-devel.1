Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777F4C982FD
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 01:39:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428011.1650718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pTD-0006xN-7r; Tue, 22 Sep 2026 01:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428011.1650718; Tue, 22 Sep 2026 01:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pTD-0006xG-41; Tue, 22 Sep 2026 01:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1428011;
 Tue, 22 Sep 2026 01:38:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8pTC-0006xA-FJ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 01:38:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8pTB-002gUU-Ro
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:38:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1dc09-e002-0a2a0a5209dd-0a2a45038a50-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:38:53 +0200
Received: from [40.107.130.117]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1dc2d-fae8-0a2a45030019-286b8275a079-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:38:53 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DU0PR03MB8764.eurprd03.prod.outlook.com (2603:10a6:10:410::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:38:50 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:38:49 +0000
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
 b=Ke65qUcf3o2jVUC/74NBANBgtqwHL6SWTn8Bxoo5+HZ/WN6WX3/U1f3oD4xCs3LQfa6vwVBimby72KWg383IPnBkRYGYvoWMOcc1CviaOf5uH/r/Tn94s7HA6rHwq0gjwAIGhBhtP+baE+50m77m244VXzcZN+YQE+ZMkzpDmZt0t0nl1QyqFYFMkl/IhkYrGgEZrZzBXXBPeDgvSfjRb8TdLdfTEE4siBXgnAp4G+TbAGbKr8cRUNwsIOlZ1tRpvdoeA8F9HBSH+SOBMxeK373i8Ikp9zq/Usw0yUmvboW3fg/jDLOVCrrue+ZTJzT0QpUwPgj0ENfs3gmj/Krc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsMUKnh3vh9o89yTEYUUhLjALRKkl1FwoelPpntop3g=;
 b=pRP5OrXrYOk+6yDbosOiDBqYfmY2nR4gxJlKOTY47dfg8nAdST6qgrdsxaXm7xWcuwgStTRMNnxFWsqLBSKZDuD77WDIo5diXjLlXEW0IsnUyDWuw8v+ueXKhi2VLuwp+4wzXSc6+5cvlHc0sLCunUU0RxNuY7OnKakjX4fvQ5J4xpymkZBzz8jJgtrCFnOln7Y6BoAjKsuNXP5xUj8/aTnfzyDHeLtCvUzbT+EXcV9THiFDQGLB20J8nv+aFxtSycz6LrcA0QE9aSonkJkpGH8/hxMIZbzPZvPC9x69oRWM6SNx7kppLGJ/CQldw3CdQqC8EgxARt/XWznG6HxdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsMUKnh3vh9o89yTEYUUhLjALRKkl1FwoelPpntop3g=;
 b=gKo/DNhP4gVEiOD2avnmuJf0qqNN+VOo+WP74ytaSWpAu0Lz5LYb0fcd3AugJ2nPX9bQ2dcTJM6tN0iozk/e57kWkgxopRRgw9vq5prh76yylZ/RitVmeyDCEpoNNHc1bpzJ5iAawcv5TImk4UvuINd2d+JTva1LSuPVx+owSubE4toXmUTgTAssC78MDeqHpjMKaJjQUzbdGSuL2uxAmVK7VkSN1xZkEBVgV2Kq3XoWOE56fp9gDpG7cSB9apIPqIXQBijxvbJUdhmmhqFrTjDCc/3m05279bIiPPqKVh+J2/0XE1ckPb+uSOKu06mc6add9zFIRNv0d7c0/qVPeA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
Thread-Topic: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
Thread-Index: AQHdOqUePUfY0zBPU0K0F/hx5odMHA==
Date: Tue, 22 Sep 2026 01:38:49 +0000
Message-ID: <87qzim6p5i.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com>
In-Reply-To: <f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com> (Jan Beulich's
	message of "Wed, 2 Sep 2026 08:34:09 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DU0PR03MB8764:EE_
x-ms-office365-filtering-correlation-id: 0fa83995-07f5-41f3-acc1-08df184a4087
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|42112799006|7416014|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 xuIxhnhKopfxHoKlW8At3FzZA1wvJw2FVbqSXNyiVTESuc+xcEpvct4Dcb61JuA610aajbCHv2ZOgW08IU2yF5Hjx/Xi4P19ObmDykVAcW9HGph6v2nVHRfVFyJdL95M+nIOHiaL+AHK4ihddUHHePJUG+VfZNfRwjMsZccr3Th3kxXJ1tFb2cFQwY4czG7bQ2yQR3bgZxfwSmLETsNmJv2D/UqcbJJl1enlhE+34ZMy/j4XV2LsSNJBNF+MAbxk4xwReWKDy+43JOfpCYQQR58c/Ovd6Z4+H6WLV8XufxUNN2DKGnQetSCiU5ZteiLyYRYYkdTQi3a6w2CPA0XiwM92nnnfHBCNnNnx7yRLY+zwNNh5vrY33iehdtKrtIRWNIMcog56HL+rox+pjpYvflEQmzMlAg4mfzdTDHfugksUjg70JGZVidnJqL5yAgegAT0DU1M0/nJNa4XvlvoDnDswEvy84HhplKOu/Uw1Y7CQCmrubfH+V8IhESZGXoy71AZkxw/ofxYZhy85XZYZMwSt9jCtlvipR/iS5XFbXpmopSp7pZrA3EkwA1bkgf8q9Fez6lMXcA9xxTjRcvXUGetjQIBXNb/Y4saY1MOBAMhVgTjvX9ErfKPSptc7QSTR3rM3J3dyf9171AXrYcWx/F/rLgjZod2Z9wtszmpUmgIWmKmeRcGnQhZxO5KofZn4s4+tt2AuIB78y77Yl3o7D7V9fYUA1sDYtlgnuLh2G+Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(42112799006)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2QeU7vFajhkBUE/P09vwE0bN5Jv7xBlNWvjER/uvR1tedlH8zmbzwhsuhd?=
 =?iso-8859-1?Q?9p48oeBMCChqfX7vspgPw8wlmgIOCWEjoDADDScKE5zL8/pCt41dgQb14S?=
 =?iso-8859-1?Q?+YCF0VOXRq37VyEYAn5b0YrWdRnKj0u402/Mb7mXK50NYXRNUIccfzKJrs?=
 =?iso-8859-1?Q?1R3XI1iM21Whtm2rN2SXEhmMWI90M+fuI7Kmyijd9FcCUvlNIhSDQ3YJgh?=
 =?iso-8859-1?Q?BZMK2byLTO9dCypWdrvGmQZEbLk8HkkJBQnl+87ajO3DPJRUcdUPBUUKtE?=
 =?iso-8859-1?Q?G6LdlAiyNR2ktdRZhyjkiQldy7JDKnzmxKLhuN7tHa+n2H+EdfY8RNSjkJ?=
 =?iso-8859-1?Q?B6YuOY2m1jqsT9xlcGh6zJyc/oBzdyJNX9bixDkQ44eT2clF7wGmTKUj5V?=
 =?iso-8859-1?Q?gkSgtV4HgEvPB3oKKBUy+e15BMvP6jt+Nbxz+Bka/W6GtpOerK7Ip/llBD?=
 =?iso-8859-1?Q?spoCIBznFD+sWXGth17UZbIDPnYTr+GmVVGd5M9U8EtK/R3VM8jCSYv6S0?=
 =?iso-8859-1?Q?/akUmWpQN0lnfSyyS1kkZ6BGF9WZ3uHufdxkWXHnph4SSw/y2M9JXHPGfD?=
 =?iso-8859-1?Q?OUb5+sukWsZBaY3WbRfwU589ilIqdALCiYKUUtQ7xtgur0fA5hF0vb0veP?=
 =?iso-8859-1?Q?zrPR5bWku5QWp3HUmMAGH3cdUCQTswmofWfUpuDAwHX69OslJFx8aOMe6u?=
 =?iso-8859-1?Q?RIyU5VHBpQ0qokQjKCif7SGD9wyztgh+WH37OhyLcCD5quAx+907WaEspD?=
 =?iso-8859-1?Q?JhcL+dMCireSbxYupqf4agiS+1WLdPc5nSLxlV62Yt7MCf8iHrVZchc3xn?=
 =?iso-8859-1?Q?fXV4TKB05nSWQXPb9u2SfVOLgz4HG+6TK8dfUheU4QfhQHpF4EnVbStaXw?=
 =?iso-8859-1?Q?ugHSGtDGWL5RrqDbRA5RBobQB7CDl3+Qw9h7pakvq8VhlsnZ4FnmtMfYWD?=
 =?iso-8859-1?Q?BtH73g5W6KdxtDuNdyNN87flgsy8RPBmZ+0WrlUlDDCJ0vN0nm4XeSCXaC?=
 =?iso-8859-1?Q?CFEKgcMma146qc166JQJx+XZ/QMeLlzV5oxjfvMssK7LDVZVF+8m4F+E/w?=
 =?iso-8859-1?Q?HmU3JirGv/qHxhkOzy6uPUeHjor4whCQ5pzlNglRpQmKqY2qMYaQX2eKoZ?=
 =?iso-8859-1?Q?P+7ItC9nxXLMNxnp97BnqlyDeeKXN//pQ3yuGUudINgFX6QlQB+whx0hPi?=
 =?iso-8859-1?Q?Ag9l98ZAbC2s6w2ISzz9zesFFxfD9JYRkCoyHFwBMPritxRnMWriyu7JQ7?=
 =?iso-8859-1?Q?VGcV4X8YGz45O/UY00ouK4JtefyJ51zrIEu5HtVGcvDo1YrOPj/GGSFQc/?=
 =?iso-8859-1?Q?opFt9Y4XATXKHei/29FJVP4G5i07BD/1IiF4BzOlnRmZm1cGQyjAOB+yaV?=
 =?iso-8859-1?Q?m/9s9at7K5I++0LEUtFEg7OA16gnil+gdr/Q0sVlWZiK+rRuWjM2o6ijif?=
 =?iso-8859-1?Q?Ex8Y7K7SGE0qocurCPH9tH3FVkcFoe9jo+utGtH9UXnZ6N5cOny2OgTues?=
 =?iso-8859-1?Q?AuMylMl8NtH3Y0o5jn6iKi14+1LbQOh3vHaqxFQAEVoqD5yjM+tHFObumf?=
 =?iso-8859-1?Q?futcuvua6vhvToEZW76TeB2EgBu1/nT1gyftEYw02xH2TszUXlb8YirSJw?=
 =?iso-8859-1?Q?FxvgzwFPpRKdzP7vbVWwWzR0m8VtQMEcZ9Y5r+1dLrXQ7jIY5FbZNGk3tH?=
 =?iso-8859-1?Q?Arpdpkrmu//B+mO69UUKgTcupMEYnTdFW6Fw8txQOAwZWDleOGxvpVlfF9?=
 =?iso-8859-1?Q?vg7mq4x95963hlvgNfc+0d19dYeBa6hHq7efIgF3ve8/UT1iIY+8UcIkDH?=
 =?iso-8859-1?Q?+iZ27Va7UrwQKAXR7rtVZrsWwqc08B0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa83995-07f5-41f3-acc1-08df184a4087
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 01:38:49.9016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6X2UosTAelHqX5M8zjUtBS9t9ld3M5OXBpUMegWQHbZCXwS4NOQ0enOAF1CRfH0bFl4ZENjl9yfRLKH6iIaoJC3TtL32zb/8LfJnAlX8910=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8764
X-purgate-ID: tlsNG-33051d/1790041133-6D0D94E9-38833626/0/0
X-purgate-type: clean
X-purgate-size: 2174

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> Outside of drivers/acpi/tables/ (which is excluded from Eclair reporting
> for dubious reasons), arch/arm/acpi/domain_build.c is the only user of
> ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
> introducing a "const" variant of ACPI_CAST_PTR(), and at the expense of

I think you can avoid adding ACPI_CAST_PTR() by providing a const
type. Like this:

+#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_PTR (const u32, a) =3D=
=3D \
+                                         *ACPI_CAST_PTR (const u32, b))


> altering an imported file.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/acpi/acmacros.h
> +++ b/xen/include/acpi/acmacros.h
> @@ -103,6 +103,7 @@
>   * Pointer manipulation
>   */
>  #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
> +#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uintptr=
_t) (p))
>  #define ACPI_CAST_INDIRECT_PTR(t, p)    ((t **) (acpi_uintptr_t) (p))
>  #define ACPI_ADD_PTR(t,a,b)             ACPI_CAST_PTR (t, (ACPI_CAST_PTR=
 (u8,(a)) + (acpi_native_uint)(b)))
>  #define ACPI_PTR_DIFF(a,b)              (acpi_native_uint) (ACPI_CAST_PT=
R (u8,(a)) - ACPI_CAST_PTR (u8,(b)))
> @@ -116,9 +117,12 @@
>  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
> =20
>  #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
> -#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (u32,(a)) =3D=3D=
 *ACPI_CAST_PTR (u32,(b)))
> +#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_CPTR (u32, a) =3D=3D=
 \
> +                                         *ACPI_CAST_CPTR (u32, b))
>  #else
> -#define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (c=
har,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
> +#define ACPI_COMPARE_NAME(a, b)         (!ACPI_STRNCMP (ACPI_CAST_CPTR (=
char, a), \
> +                                                        ACPI_CAST_CPTR (=
char, b), \
> +                                                        ACPI_NAME_SIZE))
>  #endif
> =20
>  /*

--=20
WBR, Volodymyr=

