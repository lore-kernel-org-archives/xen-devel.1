Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD3C982FD
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 01:46:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428019.1650726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pa6-0008Vl-T3; Tue, 22 Sep 2026 01:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428019.1650726; Tue, 22 Sep 2026 01:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8pa6-0008Ve-QI; Tue, 22 Sep 2026 01:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1428019;
 Tue, 22 Sep 2026 01:46:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8pa5-0008VY-Db
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 01:46:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8pa4-00E4mF-GM
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:46:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1ddd8-8faa-0a2a0a5109dd-0a2a4503c75c-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:46:00 +0200
Received: from [40.107.130.128]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1ddd7-fae8-0a2a45030019-286b8280da70-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:46:00 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by GVUPR03MB11257.eurprd03.prod.outlook.com (2603:10a6:150:33e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:45:54 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:45:54 +0000
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
 b=h8A+e2xOEXN2W+H7ieUZzy+qMwjBNidLC4hbYn8pCcoOVUaXnBdOoll6L6gpDC8bcCzwlmVhSa3w9nfRsAbZrG1DZ2oQWwvpz3j4MCU6s1lIx/pytwuSsUhEaHxlpMM4kLNxQhHEoWQ4R5QXiJ3j3Vt5B7GQ4LhQGnDYODtSign+m2NZ0+2+yod4GJWTcoBOM+frSUVjR2F2y7dSy9VOEWucRiV4RnWsUA/Mybq2XKIjbjTU4VGt6t3oCtLhf68Nk/oNwzOuP2ktBa9+gC/1629qk9bBr6R+o+XauyOGx1USV7rLcCIO0YVjFIxbcSlJ5kHXo61G4mxpjSQ0JypOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPkawwD+HSAfDUsETDFv9ZVFdYkVi5OEd0ksNR02mWk=;
 b=N8AthuQrVBT1NiQ/Gj35VNIKB9orsZQMEdTnm2894ZMl1ooTb5/rmMyzUVAyvpTJRriYUnBL4fquSpXzA5u5lK9KKwdhdkkJErmkFT4lWShuFHMqIqyjWULxtZWvn8MSRw96wVlzjkup5ChbkEuclSjc0G6t+66+UMLiX/jlMHrQat0EyEKxKwnwNopU5lA+Yx0WQK1X5zKTL5ENfnMYR78ITG5r+Fd6Ok79Jet+nZAM270FnXIyKO8N0nZ31i+VyHN94Up6CrlF2bRitkFxzUkjzpmcZv+ATbiQR+aoyj/IUP+vWFpNkn7OZQqTnPPAZ+zClven2fMYwbAeymgzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPkawwD+HSAfDUsETDFv9ZVFdYkVi5OEd0ksNR02mWk=;
 b=cVsFBxIchGZhhCZE5PWegA9s+/p2BSAmmi9ApLe9HZ32/E63UEZb3JaR9I28UzjKi9HfRZ7NgcPXh9ewJ48hc5AlM6yrqijhJlKw9Z3qORN1S1frw8SlFyNpCXObPFe5Fe/20+GmZnOJwjqUSXHqOINhv1nOkOF8z7R1it0MWx+aCsGaRitakxCO7KYBMdrH8dwLdz8VzUy5zaeweZ3LDcsVNOOe+EnlY306hR8LxrvQNC/7QCOuGT0xA5u2nG9dEkE0xadxPHowTsvJvHPuysewO3tqKBNNIm7F9mCOfPooVqFk2YdthSUxmjICCAHNYa4DDqkz0mp2EatyfFHn4Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>
Subject: Re: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
Thread-Topic: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
Thread-Index: AQHdOqU2Vkz5DOI+4USs/ahFyLHJfA==
Date: Tue, 22 Sep 2026 01:45:54 +0000
Message-ID: <87fqz26otq.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<8fe86787-7590-44f1-be4f-461b61d7669b@suse.com>
In-Reply-To: <8fe86787-7590-44f1-be4f-461b61d7669b@suse.com> (Jan Beulich's
	message of "Wed, 2 Sep 2026 08:34:45 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|GVUPR03MB11257:EE_
x-ms-office365-filtering-correlation-id: 9b77da91-7d4c-4af6-d097-08df184b3db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|23010399003|376014|38070700021|3023799007|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 TXV5p8Oesz44ojly5+kpcoxvWYB8yx06JiT/rRQpFOB/Qmis0xlSZtd1nZHfETOmfL4lvydyWERuh6L2Ua1GCwyzuOvGcTJqMRBXU/ciNAnrT5cMMeyhDpNe5LHRjPSHjgLeUK1CyEEC/pSRWfY8qmnHz5xLEYnPTsnhYY58YdXdwTO+7b2xLD7Yv5AcdPypMYyOB4A4DqbrgfL5b2ZJPiihQbaCD3N/5Yl7kHvh5QvMPHeiwfCvZu4Z8lKU7GnKHj2AhjiAIYGaTMQB+0YUNBvJ5Xj2lQEEe05bul1HYfRdLa6ZeOp9Pna3vy40HMG8/wDvkrxVCc4hPmQj37i7sj3IGRV+2ysu+CZYAg2zbrZTtbJ2maooNxsLiJQnbGGLUa81bujjYQYKO7/fxoUsmACvz/aKSw2A2gNHjxT3TUk8ruwtiZ2xIfRC9WggpK6Jah1YHoDfhhASojIGx1XzIWBn5rDNeoS5mM6nvHv0aK6Bi+4O7pbwgEkmKMyfhl1gnliFAGKkvT96qnB4HihKMywKCwYmm1Vds7kjMfki42AllcEwUVisM/egA2hzR5CwQowEJbf3UZBj6syHBAoAVLZiejby0DS5gHxdbzbJ824Kw+icHrt03QJbVdsNWeGdGCuC/XV3sDYXEwNsrUSNC2b79dmtzw59nRHol6x+YHpLaaDiAiQ5X+8fEPMdrVCSmtKQOgYgL8eIdIPlKG7cYY9xAOZR0SI6nx+qTYyiYpk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(23010399003)(376014)(38070700021)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0Suwsx7MBBP1cAiDdT49sua9Q7eN6T4PZW2FTP5jO3z3dco6NdCkc/UIiH?=
 =?iso-8859-1?Q?LFOxDJjajnT33JVBvJ6jMcxGS1YbIOZLIMD2UBnJxlXl+dsc/3w6D/3Jqz?=
 =?iso-8859-1?Q?wL2Bg9sCN5sQ250KN7Qu96QNgmCbHxG99lE0ymZBmE/6A7guQGzEH2GK4v?=
 =?iso-8859-1?Q?Zg1dRg/2za59v6HOwrjPM8jBXooMyQhibAzTorzZnWkdWMklAQ455L/Q8n?=
 =?iso-8859-1?Q?aPuTR7ZLMK1XlASfeJuzhgexRJU8AInG/pq16d/HyTrojPCS0c1jxA0pPF?=
 =?iso-8859-1?Q?NAfRG/u2uvEuYMeFzFYFj5oH/T/5cPdV4FqKWBG8f/8Ub81gN0KCPY+I7/?=
 =?iso-8859-1?Q?X25wQC2hK7U3IXj9QCzroMDQnB52iuH1Nu6qTTwoYlt5ZXr9KU5Sc+VNfu?=
 =?iso-8859-1?Q?qX+o1A1rw/JeEu2dqjQ+mD3xIXRSMRrtV0TBLI7hVtDezdwM/sHiq78J1T?=
 =?iso-8859-1?Q?kSlS6CqIGl6tEzZ7yrLWeZZSPGDRA7Y6LYtJyj9begSXaZ2ZnDnvRipnfZ?=
 =?iso-8859-1?Q?Xc25GqgZ1Ve/HXj4YsneyfwJPY+YhSBcGDn8VUXh2lRRbY733k2cPUkY+g?=
 =?iso-8859-1?Q?6fXwIwkIH3cD6GeqbmBNGuVxvN87JgHxkwWso9Nhi/FIPTjrqHl/eWpMcj?=
 =?iso-8859-1?Q?7HaXi3xKDPdC0SYbmUHboP+Xr9S1I2bZtpN7ADVPxTD5UhmPZlijGzVaYn?=
 =?iso-8859-1?Q?5A/LtATYkpEC5lOe8s5ruJbr5TdjgPLVyLw5hhau5W8hG544N+7HgkwwWF?=
 =?iso-8859-1?Q?JDljYNFVtXRVNkbwDj/0tc6gBD7Ir0J2St7eJKpoFodwuaoC8FuLEKQd1P?=
 =?iso-8859-1?Q?gkzO6oYrPdnFrh2/abQwWPFvbODd+LtBNkLx5cpYDv/EwpsHKFR46xSNB/?=
 =?iso-8859-1?Q?hrK7lJEbc0yLe0sd+e5Vq1XEca6RUh8ochvCl2VlyCttyinfMaa+gW3DL3?=
 =?iso-8859-1?Q?kIWpd06leNm+t544qmyhtWcgIIFt94fCkMqZDs+wxV84ANc+6KUAzfSMAt?=
 =?iso-8859-1?Q?XefTXIRKiuiy+eMCw6gZJzUa24khct8rCngXlwDxk7u55HQTEHp15+GlVC?=
 =?iso-8859-1?Q?aX4WzDjkxcPCLwkKJNg/Hx7W51gXfGy3+TyChKK0iyn4aujmtw63ZY0hhi?=
 =?iso-8859-1?Q?CB6PsBTwUJpOolBfHOv/iSmkzAFEmZw/aaVGVbFCcZHzA7F4OoapHlHnqj?=
 =?iso-8859-1?Q?feMEqVyKiYWsztxYicnCHujZQwoj2fmihheMBsbzDL01SMuNgY7AeQtVm4?=
 =?iso-8859-1?Q?kEGCdTPvidPF3Jqm0L7Fy5JZsFs833gpBJ3LRZWu1vk4hk7RvuLH7hPG5W?=
 =?iso-8859-1?Q?Kw8m2al1+tJsPsMJCpPjnqUmyURk5I2JoaNxYndwj3ncuBWxnN2GYiQwtk?=
 =?iso-8859-1?Q?ftJPeUw4ASAFadW57NMb7cOKbjKilpVq3nLICiLQskv7GA/Mp2WOo6MxWx?=
 =?iso-8859-1?Q?BYBTs+IhCwF0HuID7yE03LN79OLbfthE7GWHlIMRczqiEd5JmHAsXf4nq5?=
 =?iso-8859-1?Q?XQbnf+VvjghspUftfy8RlPFTL0IWQ2jetJ80TDPkmyNlxkFM4P6PEWfdt3?=
 =?iso-8859-1?Q?e9fSjImcgnUmAs0aR1bxKuk0HA9vT27J6hktxhm27dgyL4aOpJD8/H4YBr?=
 =?iso-8859-1?Q?qiCAnt1IXWXDV2yqlyEp8MNHGAGY3WUjhdrKqgSg322Dc+uLXTMPl2MlBP?=
 =?iso-8859-1?Q?CWuEXXXaaRSBH5uJVyOcAIP3IQ2Tjbq8bI0A/k9vXTYL0iDFYw82cRIHiH?=
 =?iso-8859-1?Q?ppXyPRbu0+obwxuXS+VI9uDa23PwlPythRZlBrDey4atgo7AuImfEk7jvT?=
 =?iso-8859-1?Q?1pRIDOgnyMDXnxt3Tn4vkUfeZ9TegZk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b77da91-7d4c-4af6-d097-08df184b3db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 01:45:54.6019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKRWKgYXX8KlVzUNdoryT7fL1Nu5wAVMutV7MM57bL7HcxwWFdFS6uIFSj30y8e4GCAOd+3etebUZ0jnDWOJDjXDHcGrDCoP8a8PS7qemRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11257
X-purgate-ID: tlsNG-33051d/1790041560-764FC4E9-FF04FAB5/0/0
X-purgate-type: clean
X-purgate-size: 1792

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> Not doing so results in a number of Misra rule 11.8 (casting away of
> const-ness) violations. We need to allow kexec to use pointer to non-
> const though, so provide a means to override the default.
>
> For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
> incoming pointer.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -6,6 +6,9 @@
>   * - Magnus Damm <magnus@valinux.co.jp>
>   */
> =20
> +/* We're producing ELF notes here. */
> +#define ELFNOTE_CONST

Frankly, it feels backwards. When reading this line of code I am
assuming that you are adding constness to ELF notes because you are
defining ELFNOTE_CONST. And I had to check the elf.h to understand that
you are doing exactly opposite. I am pretty sure that other people will
confused by this as well.

> +
>  #include <xen/acpi.h>
>  #include <xen/console.h>
>  #include <xen/cpu.h>
> --- a/xen/include/xen/elf.h
> +++ b/xen/include/xen/elf.h
> @@ -29,9 +29,14 @@
> =20
>  #include <xen/elfstructs.h>
> =20
> +#ifndef ELFNOTE_CONST
> +#define ELFNOTE_CONST const
> +#endif
> +
>  #define ELFNOTE_ALIGN(_n_) (((_n_)+3)&~3)
> -#define ELFNOTE_NAME(_n_) ((char*)(_n_) + sizeof(*(_n_)))
> +#define ELFNOTE_NAME(_n_) ((ELFNOTE_CONST char *)(_n_) + sizeof(*(_n_)))
>  #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->name=
sz))
> -#define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIG=
N((_n_)->descsz)))
> +#define ELFNOTE_NEXT(_n_) ((typeof(_n_))(ELFNOTE_DESC(_n_) + \
> +                                         ELFNOTE_ALIGN((_n_)->descsz)))
> =20
>  #endif /* __XEN_ELF_H__ */

--=20
WBR, Volodymyr=

