Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5D5C5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 00:41:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399004.1635242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyfEL-0003Qr-8P; Tue, 25 Aug 2026 00:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399004.1635242; Tue, 25 Aug 2026 00:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyfEL-0003Qk-4x; Tue, 25 Aug 2026 00:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1399004;
 Tue, 25 Aug 2026 00:41:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wyfEJ-0003Qe-8J
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 00:41:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyfEI-003MnI-BZ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 02:41:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce46e-bab6-0a2a0a5309dd-0a2a450c8d34-18
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:41:30 +0200
Received: from [52.101.65.92]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce4b9-f479-0a2a450c0019-3465415c8ca3-4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:41:30 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by PA6PR03MB10322.eurprd03.prod.outlook.com (2603:10a6:102:3d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:41:26 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:41:25 +0000
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
 b=C9dstg/B3uTq8ygybz/N7VfoVkEJwE7Pq6gH+FOOTuHrLix9ogdA0qr0hBuAE7tJIAfiM6UnBzq4VkVR4/kR81lm5lzygccFdEhqH0Kg8uS+26/VpRauCugfOuuxcxr9Km/9G4sD4ilDtylF+gkk0DMNowSzKJtA/OhXxA0dE7EgKzXrtBrqKRloE0vGoJxDDd6SPDR7k5bWDufDrCARF4vQkCZeqDoXUMEXZu7Xfd9+yruaGDIhxXr838csa94tgW/kB2mZqQK37c6o3OqS1jlPRCwILxrGAtfC/hG6JzIfCIuFAgAoXJMh4vhx1Q3g8I5K+b7BDH7kJ/bUTQ9NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fPZb6IXciKqdn7cnZ1RMus09M3qUtKZeZmBPaBctNs=;
 b=PQ00KGbnFjn7QKiIUtm5ozDKGqoiM6UOKfmMSm2+nX929tBVnBjWcyRoj3HTMm2YAG0Hm5N6ohZEvBimZdUdU2l+aCE/q+rS/8ALhmuu4NqvraJ9zzg0wgomkJQiEZBQ6YOhg8qSKBw0YJNhsGBHbn3RbTig08VKSt+WK8CXdX129SwI/uK0xHmmbx/OmeTcnsN0Cryus/YTH1hAIM6BIgrNwP9YbadjpojGU3TWMt35x/+pVs0aBWuJJZ7si38fcHp0zG3osMZ2ju3OeYU/P5ZNO+V5EReOyt0WXZrCSAWqnkSg7LqHQLM5/2c4C6bvuIpFzB/u4AFQ9NyOthQbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fPZb6IXciKqdn7cnZ1RMus09M3qUtKZeZmBPaBctNs=;
 b=ufkC2x0cOxgMlcMyGeIn8oF5STcSvr1/7ZfA2aGoStuXnqU72Y6GwzlFIwDLwqqCI7Our3iZhp2dLIoijdNipS44WyZLs9GjgZy5yKj8mmdlZDV9bDj3GdpJs1Qa38Z1z92rmQZEKdqqNtjfgoOWipLIircQ1OttfVBJZUFg1xkY3lP51iySM5XSmqzF21ff453RI2WzDd4q+0NMFtxhebD/9YOwe8vof+cI62/ufUshVJAJQQvqkrsBOKigFZ9Xpnj3Q+ciFAvsSbZl1CbwhREYVURH8bfkX7U/QCi6PNPYGZLHGuFAs5hGDkJGLrrvPkfXY5GBXf6/bPyiHfPhQw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Jens Wiklander
	<jenswi@kernel.org>
Subject: Re: [PATCH v3 4/4] xen/arm: handle irq_set_type() failures
Thread-Topic: [PATCH v3 4/4] xen/arm: handle irq_set_type() failures
Thread-Index: AQHdLwVfgQe3/BFv+UOd2uF5vMSNtA==
Date: Tue, 25 Aug 2026 00:41:25 +0000
Message-ID: <87v78zvxor.fsf@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
	<a960bc4917d4673cd1920cada2cfdb7eb7475f23.1787050437.git.mykola_kvach@epam.com>
In-Reply-To:
 <a960bc4917d4673cd1920cada2cfdb7eb7475f23.1787050437.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 18 Aug 2026 14:33:02 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|PA6PR03MB10322:EE_
x-ms-office365-filtering-correlation-id: 6683d2c9-2f89-4e39-8e04-08df02419813
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|38070700021|6133799003|4143699003|10067099003;
x-microsoft-antispam-message-info:
 UkejqaFJWRe94jueSvjX+ZArVQ5ExU/xH8Gr1NRYO4mrJ7vEGhySxkdEP/avz009Lfx6qqxjRM5O+oE9WYU1BYEn83FgT+dLdz/AjkbXYPU28WeuVfrnI6Tf2/PSIvIW879qsTCbqp/NW8+o2jqsZZxYebgooBpr7CEaIWj/BgwtnrNmOwr9fAROqkGx7zPvH3LaDUtUGO2tatDZKXncj0HHdaE0k0XxYZjn436MzcuG7ndBHWGzY3nNSPEGFx/Jq6pMtB0Oy9oT/MTxkk5rcKktrep1uL8vl50Mx+8z91JRRTPFROjC5iAPA5wHkQObgj70Jsbr5ffU+WRTJYWkI6EftPHR8+8psMCV8wfZyqGG76F0Y0REojj7Wlly2MrFWjUrQ2Am3JKCe0G82bv/NOoxQuspoChzS7GbjfrVi6Hhtasw/OYULlFe5Sl0C23XH0zii/NrIwgY/XXkKjdIQxtC1i2/yw3c8qikmvKQtiLqSDfTCPq3e0xaCnsTV/5knZn+SPG5VAmeXJrK97cTgcwIuUJ3OLXJHInowNmWg2QqHRaPgLqyqQr3LDY22t+tgT66LbbgjYHzdxuoED7GqUAU/abh9ywfV7hG86XD7TyYH4JbUtCeR0o9p86WJq1ZGu+R6U2SGInrcPfTZtW4twJj1Rc6tXniCnj4GgEF/ceIhrrQtAXBg/SW0sHNu+9JGUTYseUvt/pKvn6JPKJhjOdfVHujoNfKIcYFzXP6HoE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mTLhSIU9P2lQssga/jpdbF1/9MwKoSh5IKQ5/EQmowmWW74GZPrC88JHQx?=
 =?iso-8859-1?Q?zx7bTT8RVcPabG3/9NNFTNH86emxqZ8Urwmai5seWGJmJssrEZu85xr43E?=
 =?iso-8859-1?Q?o1Wo10AhGd+YNMTF2kIjHSjynCCCxTcpo6FOQpJQMf/xxQg3+uCI5bMypk?=
 =?iso-8859-1?Q?ZPJ+2Unqa2IPIap6uQ1d1ns8FFO5POD0nUVq2HdCLz9ylj/IF5xyI/l/Xy?=
 =?iso-8859-1?Q?K7sbFOVNliETk6itNSlfHH+9TFmjgMwFPJtKrL9jHuqfOyn+UFXmoHn5MA?=
 =?iso-8859-1?Q?pjy2pXMH04OgG8DL3hRrfbODQIPv6SaMDquBCgdSeL0gRZR4l5UwNRMApO?=
 =?iso-8859-1?Q?nnpNp7dE/YNdjYUDG7dLiRSponeU8BpEvm1J4FHI1iuZOSCCNP35qC4Tiq?=
 =?iso-8859-1?Q?BhHsOpnSG8D4aX9kBJQ0N9v2IDL3jd4L9xt3CAtQpJEJzTTsw0oYtv6rdD?=
 =?iso-8859-1?Q?TmXqEuAPbIZwcHSmJGIEKzAru7pGvZQ5Asr1oI1KxQLCZyiSViGUVLlkT7?=
 =?iso-8859-1?Q?+WaAkjpvqF++GlpSi9tpCbQVScBff3NPI2+6lM+6GwPVr7+gIyBcYWSJJm?=
 =?iso-8859-1?Q?b3bdVckOPK2eF2zsrLe47T2QVBwPCpS4GHS2Ou3/CHkJJWFgCwkWWEeBYd?=
 =?iso-8859-1?Q?aVMacQVvQ5RXVLLSdvZGmKqU3voeUKn210VAsYjBIsQqAiyn7/cMnPnRbY?=
 =?iso-8859-1?Q?aVrIr8mJJbDagiviUnN+TkMOXPpnQuF+/HOwODIkEH/NEIVmtt1rqvlTAJ?=
 =?iso-8859-1?Q?u8v4Qhe0d1qdhOVHjunS446yVwgGGdf6BHBA8EtmtqynBQ8z87dkrKDPt2?=
 =?iso-8859-1?Q?0K/kPNlDYap1+yR7e0wm/mYqzTug/O76rT5AUu/bKodO0kiXXtL3eDOBKT?=
 =?iso-8859-1?Q?CnHVIbkyD4rMlsEduUQxKEZB2OGcIGbn0RFdmlMUs8eXlyBRHhb07osaUF?=
 =?iso-8859-1?Q?9WVMv008MekZEMP3zWzrtf3lwo0iQ5RBCaIRGsdseUG+Vx/dLfeO0Pkx4u?=
 =?iso-8859-1?Q?M17cM0IIXTT8KTRQ4U7RNdhJhft9A9nNliFTTXrPzQK3+D7Qqj0crFOYjC?=
 =?iso-8859-1?Q?AgEflo41qdzlStAAs0z7r1Pb97zMhls4kQB77ve4Cc4sWXPGldMeOUZGgV?=
 =?iso-8859-1?Q?1e85kpVXfErLeYDSQQZtg+BfebLYqqJrQCi4ZmDfcg6uDI0qzP8YaX/pbp?=
 =?iso-8859-1?Q?ZSZZRzGL8Cld8TI7+2YUEGw6kx36kTjJ2vifn3B3ZF2TZSNR5NdcN2P01z?=
 =?iso-8859-1?Q?xYY0t197hiDQWDTOQy/eWOw6K9jDc/wb7loCrH9pP3RA4UpZebzOYqfTMq?=
 =?iso-8859-1?Q?Z483hUz6FxhzVAKeFdFrv6GuBmmgd/frW4Q9F+3W/p1pm6o+twgu5Hk4ax?=
 =?iso-8859-1?Q?lWtlDoKh8iGwJ9jIkzLDCsPRsC3LusFf2pMgry6k45cJMCf1FOvLkm/p2j?=
 =?iso-8859-1?Q?GPw4oadAlgZfgusvLZifsJCrpCGgl3LeZrIbpPiAB2DPYDkiiqT+qw+c7p?=
 =?iso-8859-1?Q?k4wuIIKBfzB2hky/IF9eMnyOPhyqtaob9zSYZx597+Oya2L9d7KICngyFM?=
 =?iso-8859-1?Q?CW3AV6YS81+oO5IRyuojCakUp7vAp+uvG4vApYzCvxGmv3xaaBokBse9M7?=
 =?iso-8859-1?Q?vk+anNsFbgNccVwyA4c/q0QsQLjj6WC82I8x2GkomBaLnWs4tYst6et3YI?=
 =?iso-8859-1?Q?fVi/NttjwKf5GJ0maL4Oz2KxZp1/hCok6cj11qpEjvh8FDqrAXZh2LnkSM?=
 =?iso-8859-1?Q?AKQxVL54iVSip0fKFpsVGHWkAIKwZwK0ZIb1GNJ9pbcGXtabq039QQmrA5?=
 =?iso-8859-1?Q?EQoEYJu8c7IAX6Cbjz1td4OQdnz5wzY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6683d2c9-2f89-4e39-8e04-08df02419813
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 00:41:25.7266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdYOGq1bkNZNGi6yOTxOB30I3i53vSPLqAcwhlAl8gKMM7pVKfKx/NZD3LJnYDL62ssQowGZfdgZFQKRaSm4C47unKgbfbyO4U/2dhCIGTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10322
X-purgate-ID: tlsNG-d25034/1787618490-51737A5B-6B5E6E14/0/0
X-purgate-type: clean
X-purgate-size: 8712

Hi,

Mykola Kvach <mykola_kvach@epam.com> writes:

> Several Arm firmware initialization paths discard irq_set_type()'s return
> value, violating MISRA C Rule 17.7. If trigger configuration fails,
> initialization continues with an IRQ that was not configured as requested=
.
>
> GTDT and MADT retain rejected timer and maintenance INTIDs.
> check_timer_irq_cfg() and release_irq() later perform unconditional
> descriptor lookups on those values. Xen has no backing descriptors for
> INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
> access.
>
> Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store tim=
er
> INTIDs only after successful trigger configuration, make GTDT parsing
> failure fatal, and stop UART or notification setup when trigger
> configuration fails.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v3:
> - Avoid partial state updates and simplify maintenance IRQ setup.
>
> Changes in v2:
> - New patch.
> ---
>  xen/arch/arm/gic-v2.c        | 15 +++++++++------
>  xen/arch/arm/gic-v3.c        | 15 +++++++++------
>  xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
>  xen/arch/arm/time.c          | 18 ++++++++++++++----
>  xen/drivers/char/ns16550.c   |  8 ++++++--
>  xen/drivers/char/pl011.c     |  4 +++-
>  6 files changed, 51 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 43a379fdda..a24d387e7d 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1166,17 +1166,20 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_head=
er *header,
>      /* Read from APIC table and fill up the GIC variables */
>      if ( cpu_base_assigned =3D=3D 0 )
>      {
> +        int rc;
> +
> +        rc =3D irq_set_type(processor->vgic_interrupt,
> +                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
> +                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
> +
> +        if ( rc )
> +            return rc;
> +
>          cbase =3D processor->base_address;
>          csize =3D SZ_8K;
>          hbase =3D processor->gich_base_address;
>          vbase =3D processor->gicv_base_address;
>          gicv2_info.maintenance_irq =3D processor->vgic_interrupt;
> -
> -        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH)=
;
> -        else
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK=
);
> -
>          cpu_base_assigned =3D 1;
>      }
>      else
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..b32a9b5009 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1743,15 +1743,18 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_head=
er *header,
>      /* Read from APIC table and fill up the GIC variables */
>      if ( !cpu_base_assigned )
>      {
> +        int rc;
> +
> +        rc =3D irq_set_type(processor->vgic_interrupt,
> +                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
> +                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
> +
> +        if ( rc )
> +            return rc;
> +
>          cbase =3D processor->base_address;
>          vbase =3D processor->gicv_base_address;
>          gicv3_info.maintenance_irq =3D processor->vgic_interrupt;
> -
> -        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH)=
;
> -        else
> -            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK=
);
> -
>          cpu_base_assigned =3D 1;
>      }
>      else
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 186e726412..d08d0a3366 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -407,7 +407,16 @@ void ffa_notif_init(void)
>          irq =3D resp.a2;
>          notif_sri_irq =3D irq;
>          if ( irq >=3D NR_GIC_SGI )
> -            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +        {
> +            ret =3D irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +            if ( ret )
> +            {
> +                printk(XENLOG_ERR
> +                       "ffa: irq_set_type irq %u failed: error %d\n",
> +                       irq, ret);
> +                return;
> +            }
> +        }
>          ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NUL=
L);
>          if ( ret )
>          {
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 6955b2788f..39b5eabe7c 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -60,20 +60,27 @@ static int __init arch_timer_acpi_init(struct acpi_ta=
ble_header *header)
>  {
>      u32 irq_type;
>      struct acpi_table_gtdt *gtdt;
> +    int rc;
> =20
>      gtdt =3D container_of(header, struct acpi_table_gtdt, header);
> =20
>      /* Initialize all the generic timer IRQ variable from GTDT table */
>      irq_type =3D acpi_get_timer_irq_type(gtdt->non_secure_el1_flags);
> -    irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
> +    rc =3D irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_PHYS_NONSECURE_PPI] =3D gtdt->non_secure_el1_interru=
pt;
> =20
>      irq_type =3D acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
> -    irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
> +    rc =3D irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_VIRT_PPI] =3D gtdt->virtual_timer_interrupt;
> =20
>      irq_type =3D acpi_get_timer_irq_type(gtdt->non_secure_el2_flags);
> -    irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
> +    rc =3D irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
> +    if ( rc )
> +        return rc;
>      timer_irq[TIMER_HYP_PPI] =3D gtdt->non_secure_el2_interrupt;
> =20
>      return 0;
> @@ -81,7 +88,10 @@ static int __init arch_timer_acpi_init(struct acpi_tab=
le_header *header)
> =20
>  static void __init preinit_acpi_xen_time(void)
>  {
> -    acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
> +    int rc =3D acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
> +
> +    if ( rc )
> +        panic("Timer: Failed to configure interrupts from GTDT: %d\n", r=
c);
>  }
>  #else
>  static void __init preinit_acpi_xen_time(void) { }
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 120ac09d23..eb608ab8b4 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1928,6 +1928,7 @@ static int __init ns16550_acpi_uart_init(const void=
 *data)
>      struct acpi_table_header *table;
>      struct acpi_table_spcr *spcr;
>      acpi_status status;
> +    int rc;
>      /*
>       * Same as the DT part.
>       * Only support one UART on ARM which happen to be ns16550_com[0].
> @@ -1959,6 +1960,11 @@ static int __init ns16550_acpi_uart_init(const voi=
d *data)
>          return -EINVAL;
>      }
> =20
> +    /* The trigger/polarity information is not available in spcr. */
> +    rc =3D irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> +    if ( rc )
> +        return rc;
> +
>      ns16550_init_common(uart);
> =20
>      /*
> @@ -1975,8 +1981,6 @@ static int __init ns16550_acpi_uart_init(const void=
 *data)
>      uart->reg_shift =3D spcr->serial_port.bit_offset;
>      uart->reg_width =3D spcr->serial_port.access_width;
> =20
> -    /* The trigger/polarity information is not available in spcr. */
> -    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
>      uart->irq =3D spcr->interrupt;
> =20
>      uart->vuart.base_addr =3D uart->io_base;
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index a336241033..97c53c11e0 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -363,7 +363,9 @@ static int __init pl011_acpi_uart_init(const void *da=
ta)
>              spcr->interface_type =3D=3D ACPI_DBG2_SBSA_32);
> =20
>      /* trigger/polarity information is not available in spcr */
> -    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> +    res =3D irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> +    if ( res )
> +        return res;
> =20
>      /* TODO - mmio32 proper handling (for now set to true) */
>      res =3D pl011_uart_init(spcr->interrupt, spcr->serial_port.address,

--=20
WBR, Volodymyr=

