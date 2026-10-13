Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE28CA9ED0
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 02:52:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446656.1662747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGScq-0007GS-Aw; Tue, 13 Oct 2026 02:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446656.1662747; Tue, 13 Oct 2026 02:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGScq-0007GL-8N; Tue, 13 Oct 2026 02:52:24 +0000
Received: by outflank-mailman (input) for mailman id 1446656;
 Tue, 13 Oct 2026 02:52:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xGSco-0007GF-KB
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 02:52:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGScm-00BZr1-Gp
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 04:52:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd9c79-bab6-0a2a0a5309dd-0a2a4503a1e8-26
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:52:20 +0200
Received: from [40.107.162.94]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd9cde-fae8-0a2a45030019-286ba25e2992-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:52:15 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by GV2PR03MB11669.eurprd03.prod.outlook.com (2603:10a6:150:344::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 02:52:10 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 02:52:10 +0000
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
 b=xRSR/dwMy6l/C82XgFabrzxPLxcHDpDYad7BuY8ej9LES9XloFQ3nxR5btd66w9oV2buhoGWwVKuTFq86qemoC/rF1k0JW8fyBaASAo1LXfk9eRc5D8FVmLbGC+Dv6b+DEQrgWzijMV1w7RH19ZOHhDu7cJ6lgscQQI6fzt9YNTh8Duw7Dujb7D3T4PmS33a6ztp/sDb/aQ5WQ19cUV5Fln0VgMQwkiSkSjbHEJU3jVfM4nbRmyRox1PfboBaKXWH98hSgq7OW8sIIMf+mTvE0riTudSBKYgGY3WczPNQbFeTn6iKG1UzLq6Xi+tHHdRPOIsfkMuI/qYwzoDsJTUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPrlI+dwHbsY7j0KZuLyjs8scp0KgJZRDLEnutWvKk8=;
 b=aQ/ZWgVDUQasR68XdwP5kkueA2OQw++p17iG6sbnRHyMrTiNIRkae2/aUW/AGZVIJKBCzdZzO3JHXIgCJFaX4Za7hs/l+qMIB7SyUJ5G1G0i9LQ6/Zd2heK+BhNkAlAL+U4MXfc0Xn2HimQcmKCwjz4plylAlmXkQeac41g5YENxFg8q7qjRlQU+FoxHB53Bq/Lxf/mIABqxC6NeaCgcJDFR7P3vcYXMkvXCRf2LjyEtKmqC2CX3eJvtfEPoCV/rzREHJ+75c/FKmFWzYeCsG1HqX7geHfhpd8BeXjFtLDG0jlmD6B5LCa+VQYRERmI/5riZOwnDaHSVAY1VyohaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPrlI+dwHbsY7j0KZuLyjs8scp0KgJZRDLEnutWvKk8=;
 b=jCSx1MiAcJSGi86k1OdbO8tt1MnIEFDiwYUMWaI6T8jgsvYCDaRYVf2HJ6MSsFc8TItnaGA34/qimyYrqvtqabWoC40YjfWoJVsVqqBSNLRPJ9dyF3HDVpn1xRMJrOW3xnPAUEmnCFAaw8mx9nciBHMP0GBn6kPgkmf7YcjQuiaWztN4ekyJWkbrUZUbJqDotIakjTC7gGeZ2JiUaqfJAPyKd10ZoSJKBByWNEldwOTav7vVvmvA8dcHyJhGW8xFy88SDX1TbGrJZ5BHwZl923FLpSkrZByR55VjD++e14BgBoitnquPzTgl0ngKBQLr7xFHt8dj1koCt6EX6othYA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
Thread-Topic: [PATCH v4 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
Thread-Index: AQHdUEUVmn9fk6RBvEynggq2k9Sfvw==
Date: Tue, 13 Oct 2026 02:52:10 +0000
Message-ID: <87bj8ywbvq.fsf@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
	<8f586eb079dc00fb2f4612349bf55d84bf52d105.1790707009.git.mykola_kvach@epam.com>
In-Reply-To:
 <8f586eb079dc00fb2f4612349bf55d84bf52d105.1790707009.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 29 Sep 2026 22:02:11 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|GV2PR03MB11669:EE_
x-ms-office365-filtering-correlation-id: 5725fc6b-c3ff-4fc6-fde1-08df28d4f9fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|42112799006|376014|366016|10067099003|3023799007|261009223027099003|38070700021|11063799006|4143699003|6133799003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 O3P2sI8EuJeURncCiZRLiCfkDL/JZ7FRRxVVGRnG0rVEFEUm3zRWZLrMTPpnNwig5rBqAEwTFB3q7PUI7bSdoaP6ac52MlJTt1e7EaU8NADY7eUYwcZ49Kve4gbVpuTZp6Wz7XJcyMs9k7Qj7JTVEwOcco6xXdC4gPmzGkIOHrkRR9+qVXIi0PpyqDw8tg5EPL8gGaBj1gfLjlbjeoXjT74JFolSeR/9RuPEaGhq2DwgTFyD7KemnV8ptFuiivjCnQ9ytHKtnMtSc/wHByuIGY3ttMHu5wnWLUWUBAmOAx3d/x1Fx9L087R/csXLBlAweYtCpjQBkBAIcPtu9vLCck+4JCtA4ycOsIGYY6hn7K5Y8lD0g1ffIJ7mXvUlXyKo4urevW3jgElWyYgAB+qHxs2CxTCwNsR4qDk9hBGihztMVvCoAePH/XiAI3nJ5XOmyUKtbjF0QYd8yfl/1rPgdeswWKMsICfQ0QOzI2CmZcM28cLOP2oMolg0Y56QFfBYUDBylE9UmkY9TAGWvZUm0oTxj+YTC4Qy4h1Hi4g+f2E0kfOROd6gI88MCH8A1WGa9u/x9km56dTneBSUgT6uQ7h6gwkgGt7gy/R581rwdGxNw9AXmwz85YIbxbo8lwx2NHrtbdRZ6Xko4gE9TGBxHveaxeZrenfFTyVLOVbSbrlxXspLGnUelSuLBF5XOYgFTqR/GvGyBrlo+AB+LYThfQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(42112799006)(376014)(366016)(10067099003)(3023799007)(261009223027099003)(38070700021)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RcylxPzF8tIFlAr12hjtM9uisWP4IbABQcLtKDy+Sj+CHgoWLHqDUnp5YO?=
 =?iso-8859-1?Q?0xnB84qu9JZ7VXG4z/n3LIpD8G/JbF/TvVMPrDsSYR2orj0Q7pVc3K0aia?=
 =?iso-8859-1?Q?j/e69jtEPeECNRPLMQfQa2BSj+lAieFmrAPAES+71dXJV4oHjbPUdYxE/1?=
 =?iso-8859-1?Q?z70Bp1g+y13tGpsjU984s/UX2fwlcZZm+UtBP5duDs7DMPwcvyFAxJGqvu?=
 =?iso-8859-1?Q?D9NuuJZc9ApDv3c31fVmMQESZYaNBnDjcO1/0+xC3e4zyqcRw5/a82QKEO?=
 =?iso-8859-1?Q?EWc5IWO2U8WHSdfdN2wiF/Mpi2sBb6nbXyJl3op7xuajDuAJ8ppMbGChXT?=
 =?iso-8859-1?Q?GXvjPSSvactbsYrhzK+ocjb8FW+DkZtN4WwcHQn4ZIn8W5G4ZT2iOn5ngQ?=
 =?iso-8859-1?Q?5bPVvhjx1QeiVwWv7R+QKJ4XS0XiCSEd+d6kz3c8kk8mnajMHxW8GlVLqu?=
 =?iso-8859-1?Q?0uRm+rhAz5EN3XIFogtn+WogtPoEoJdY1XcaKUiQg7j7sRPDT187zHFQE5?=
 =?iso-8859-1?Q?OPOHfWUPNSC3OpdIMQNYQ5ODOfb8kgeH8fODBHUINkUi5hmEqIhla/A194?=
 =?iso-8859-1?Q?v09A2baJY2juPshkOBdGIxds2OyuyxQwwRW+XISBsbgu7vWA3asFs9rgHe?=
 =?iso-8859-1?Q?CqrVSsWAgtb5NggBhV9TVqTo0NAqcElPl3Ydosw5d0ooxVAeEQbTUwwv4N?=
 =?iso-8859-1?Q?pYPVLTc3vmHrcX6WjRjEJ1/gg1UOzSkpb/hMTxoQPxGIY7ZOWISU3M6IFk?=
 =?iso-8859-1?Q?ntb2d/01N/rybIRX6bWQa7ILhs1eLA/qz9V17sK8VpIYGMTGFxFrGfMeum?=
 =?iso-8859-1?Q?2HXUHqZRzQgwn3W0egDwPvAlVdTGVWp0X1JilGhUkWpd7i10dK3qqOb0k5?=
 =?iso-8859-1?Q?vzFQ7td6LksVO6P48BUlEua41HbIrEsNnw56A2TRgz5zToydYNvEVBkVtC?=
 =?iso-8859-1?Q?D6w/+xyc/5wysfbSVCZFnIissjNHLx0sQ+c/tnIONf9Xf7zY1j2fZtGiQ5?=
 =?iso-8859-1?Q?u+t9MAVZ8Ve3y9nMJ6z0THTLqeKdPL/1z1emaMqTY8lYFbjEJCSmSu8t7p?=
 =?iso-8859-1?Q?CYO92z36tetm+eLw/dAW2ksbPEs7AOOHkUpMPvwkgvyKVIKCxqlqEGD3BG?=
 =?iso-8859-1?Q?SHHeQSgOgO7GZH0B7CkP8/vKKU83f1TXkK7MXoQmckAw1TuXKSRaKRS2Hd?=
 =?iso-8859-1?Q?WZeackSTh9Sog+YE5q+zKCROueuE5igLk33U1iC4oWaC0Cta38mOUqYTCq?=
 =?iso-8859-1?Q?aBg+GyOrQMjJSlG+LPah6KcyRNFjf4AMqXaVUQWNizhtMl0crNgfxgOrEh?=
 =?iso-8859-1?Q?stQk1I/XnR9C5BvKQi/G3KzCsSD84gotnbPdwy1iZy7hDzm4YbWp9GVhme?=
 =?iso-8859-1?Q?y5QxpYf3NiOU8RTVY01OBoEbhV3KdzPkDhgAr7wJGfx4E5xObar9LXgZSt?=
 =?iso-8859-1?Q?E8ZPfGzE6mrgNm1jNyJcvqPA/xoRnaVhwrVU8l6PfFtA/ay0tf06Fa6tw1?=
 =?iso-8859-1?Q?x+Y346J1wQLqoS8P5XDYzYe4vE4QQyt+Nt/fmXnEl9I7M8F4PPl3ZVTFXn?=
 =?iso-8859-1?Q?MwOYZtig0C4kgRhItAsXj0YQZTPW3H1d8tuoBXLPiW1DQBk7WxP1dz8ZDX?=
 =?iso-8859-1?Q?V4r5dNYQnFucUTZ79UMxLAY0nytENVkmFGOsdVhHAfHzgmw7VrXS/aaNkj?=
 =?iso-8859-1?Q?IRafoYWrTiAebxBoXYH65DzEoeizgl+g7pvNIB8rlMFcnpYVSSToJqHDu2?=
 =?iso-8859-1?Q?ErI8JcpZuqXZtmk8PW9H/6pZNbUzPHB/PKUbt2Ypw11J4OxGJszmj8ogBs?=
 =?iso-8859-1?Q?sdOTfThR9miwnBBR1TheHqGlIrbyYIc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5725fc6b-c3ff-4fc6-fde1-08df28d4f9fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 02:52:10.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLRNhvGqkZF8ZggJAWHaXcLliZrjLIbFdpGRUKr8pjKVlCJzj9C6LScAmGTxTIzGu7YnhT1D5kdelgZ+tQFLghmeX8+E3SQrzTbxehgt3Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11669
X-purgate-ID: tlsNG-33051d/1791859940-77AF14E9-F6408D28/0/0
X-purgate-type: clean
X-purgate-size: 21599

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> ITS quirks can impose restrictions on memory accessed by the ITS itself
> and on shared host LPI/Redistributor state. These scopes are not
> identical, so a single global ITS quirk state makes the host LPI policy
> depend implicitly on the quirks seen while initializing host ITSes.
>
> Add per-ITS quirk_flags to struct host_its and keep a separate
> host_lpi_flags state in the LPI code. The quirk table now records the
> ITS-private and host LPI scopes explicitly through its_flags and
> lpi_flags. The R-Car Gen4 quirk applies the same memory restrictions to
> both scopes, preserving the existing R-Car memory policy without relying
> on an implicit aggregation step.
>
> This also removes the assumption that all host ITSes must expose the
> same quirk state. ITS-derived host LPI restrictions are accumulated only
> from quirk entries that explicitly set lpi_flags.
>
> Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n>, and ITT
> allocations. Use host_lpi_flags when allocating the property and pending
> tables and when programming GICR_PROPBASER and GICR_PENDBASER.
> Memory-related quirk bits are named GICV3_QUIRK_MEM_* and are translated
> by shared gicv3_mem_get_*() helpers.
>
> Collect both scopes during the ITS preparation pass, before host LPI
> state is allocated. Keep init-only annotations and includes in the
> implementation files rather than the public header.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v4:
> - Calculate the table entry count in its_map_baser() instead of passing
>   it as an argument, and move the table type selection into the helper.
> - Keep the ITS/LPI quirks handling comment above the shared helpers.
>
> Changes in v3:
> - Collect quirk flags during the ITS preparation pass added earlier.
> - Keep init-only annotations and includes in implementation files.
>
> Changes in v2:
> - Replace v1's single global ITS quirk flags and same-quirk validation
>   with explicit per-ITS and host LPI quirk scopes.
> - Drop the v1 ITS pre-initialization approach from this patch. In v2,
>   host LPI allocation was moved after ITS initialization by a separate
>   patch.
> - Drop DT dma-noncoherent handling from this patch; firmware-provided
>   non-coherency is handled separately with explicit ITS-node and
>   GIC-node scopes.
> - Keep host_lpi_flags owned by gic-v3-lpi.c and update it only with quirk
>   flags that explicitly apply to host LPI/Redistributor state.
> - Rename the current memory-related bits to GICV3_QUIRK_MEM_* and use
>   shared gicv3_mem_get_*() helpers for register attributes and allocation
>   flags.
> ---
>  xen/arch/arm/gic-v3-its.c             | 150 ++++++++++++--------------
>  xen/arch/arm/gic-v3-lpi.c             |  45 ++++++--
>  xen/arch/arm/include/asm/gic_v3_its.h |  19 ++--
>  3 files changed, 118 insertions(+), 96 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 511e49a116..280ace0577 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -52,43 +52,40 @@ struct its_device {
>      struct pending_irq *pend_irqs;      /* One struct per event */
>  };
> =20
> -/*
> - * It is unlikely that a platform implements ITSes with different quirks=
,
> - * so assume they all share the same.
> - */
>  struct its_quirk {
>      const char *desc;
> -    bool (*init)(struct host_its *hw_its);
>      uint32_t iidr;
>      uint32_t mask;
> +    uint32_t its_flags;
> +    /*
> +     * lpi_flags are ORed into the global host LPI policy and must only
> +     * contain additive restrictions. Non-additive LPI quirks need expli=
cit
> +     * handling.
> +     */
> +    uint32_t lpi_flags;
>  };
> =20
> -static uint32_t __ro_after_init its_quirk_flags;
> -
> -static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
> -{
> -    its_quirk_flags |=3D HOST_ITS_WORKAROUND_NC_NS |
> -        HOST_ITS_WORKAROUND_32BIT_ADDR;
> -
> -    return true;
> -}
> -
>  static const struct its_quirk its_quirks[] =3D {
>      {
>          .desc	=3D "R-Car Gen4",
>          .iidr	=3D 0x0201743b,
>          .mask	=3D 0xffffffffU,
> -        .init	=3D gicv3_its_enable_quirk_gen4,
> +        .its_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADD=
R,
> +        .lpi_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADD=
R,
>      },
>      {
>          /* Sentinel. */
>      }
>  };
> =20
> -static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> +static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr=
)
>  {
>      const struct its_quirk *quirks =3D its_quirks;
> =20
> +    /*
> +     * The first matching quirk wins. More specific quirks must be liste=
d
> +     * before broader IIDR-only entries.
> +     */
>      for ( ; quirks->desc; quirks++ )
>      {
>          if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> @@ -98,53 +95,38 @@ static const struct its_quirk *gicv3_its_find_quirk(u=
int32_t iidr)
>      return NULL;
>  }
> =20
> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>  {
>      uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
>      const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
> =20
> -    if ( quirk && quirk->init(hw_its) )
> -        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
> -}
> -
> -static void gicv3_its_validate_quirks(void)
> -{
> -    const struct its_quirk *quirk =3D NULL, *prev =3D NULL;
> -    const struct host_its *hw_its;
> -
> -    if ( list_empty(&host_its_list) )
> -        return;
> -
> -    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);
> -    prev =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_=
IIDR));
> -
> -    list_for_each_entry(hw_its, &host_its_list, entry)
> +    if ( quirk )
>      {
> -        quirk =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + =
GITS_IIDR));
> -        BUG_ON(quirk !=3D prev);
> -        prev =3D quirk;
> +        hw_its->quirk_flags |=3D quirk->its_flags;
> +        gicv3_lpi_update_host_flags(quirk->lpi_flags);
> +        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
>      }
>  }
> =20
> -uint64_t gicv3_its_get_cacheability(void)
> +uint64_t gicv3_mem_get_cacheability(uint32_t flags)
>  {
> -    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
> +    if ( flags & GICV3_QUIRK_MEM_NC_NS )
>          return GIC_BASER_CACHE_nC;
> =20
>      return GIC_BASER_CACHE_RaWaWb;
>  }
> =20
> -uint64_t gicv3_its_get_shareability(void)
> +uint64_t gicv3_mem_get_shareability(uint32_t flags)
>  {
> -    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
> +    if ( flags & GICV3_QUIRK_MEM_NC_NS )
>          return GIC_BASER_NonShareable;
> =20
>      return GIC_BASER_InnerShareable;
>  }
> =20
> -unsigned int gicv3_its_get_memflags(void)
> +unsigned int gicv3_mem_get_alloc_flags(uint32_t flags)
>  {
> -    if ( its_quirk_flags & HOST_ITS_WORKAROUND_32BIT_ADDR )
> +    if ( flags & GICV3_QUIRK_MEM_32BIT_ADDR )
>          return MEMF_bits(32);
> =20
>      return 0;
> @@ -391,13 +373,17 @@ static void *its_map_cbaser(struct host_its *its)
>      uint64_t reg;
>      unsigned int order;
>      void *buffer;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(its->quirk_flag=
s);
> +    uint64_t shareability =3D gicv3_mem_get_shareability(its->quirk_flag=
s);
> +    unsigned int memflags =3D gicv3_mem_get_alloc_flags(its->quirk_flags=
);
> =20
> -    reg  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHI=
FT;
> -    reg |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILIT=
Y_SHIFT;
> -    reg |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILI=
TY_SHIFT;
> +    reg  =3D MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
> +    reg |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                     GITS_BASER_OUTER_CACHEABILITY_MASK);
> +    reg |=3D MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK)=
;
> =20
>      order =3D get_order_from_bytes(max(ITS_CMD_QUEUE_SZ, SZ_64K));
> -    buffer =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    buffer =3D alloc_xenheap_pages(order, memflags);
>      if ( !buffer )
>          return NULL;
> =20
> @@ -438,19 +424,41 @@ static void *its_map_cbaser(struct host_its *its)
>  /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
>  #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
> =20
> -static int its_map_baser(void __iomem *basereg, uint64_t regc,
> -                         unsigned int nr_items)
> +static int its_map_baser(const struct host_its *its, void __iomem *baser=
eg,
> +                        uint64_t regc)
>  {
>      uint64_t attr, reg;
>      unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(regc);
>      unsigned int pagesz =3D 2;    /* try 64K pages first, then go down. =
*/
> +    unsigned int nr_items;
>      unsigned int table_size;
>      unsigned int order;
>      void *buffer;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(its->quirk_flag=
s);
> +    uint64_t shareability =3D gicv3_mem_get_shareability(its->quirk_flag=
s);
> +    unsigned int memflags =3D gicv3_mem_get_alloc_flags(its->quirk_flags=
);
> =20
> -    attr  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SH=
IFT;
> -    attr |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILI=
TY_SHIFT;
> -    attr |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABIL=
ITY_SHIFT;
> +    switch ( MASK_EXTR(regc, GITS_BASER_TYPE_MASK) )
> +    {
> +    case GITS_BASER_TYPE_DEVICE:
> +        nr_items =3D BIT(its->devid_bits, UL);
> +        break;
> +    case GITS_BASER_TYPE_COLLECTION:
> +        nr_items =3D num_possible_cpus();
> +        break;
> +    /* In case this is a GICv4, provide a (dummy) vPE table as well. */
> +    case GITS_BASER_TYPE_VCPU:
> +        nr_items =3D 1;
> +        break;
> +    default:
> +        /* Ignore unimplemented and unsupported table types. */
> +        return 0;
> +    }
> +
> +    attr  =3D MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
> +    attr |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                      GITS_BASER_OUTER_CACHEABILITY_MASK);
> +    attr |=3D MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK=
);
> =20
>      /*
>       * Setup the BASE register with the attributes that we like. Then re=
ad
> @@ -464,7 +472,7 @@ retry:
>      table_size =3D min(table_size, 256U << BASER_PAGE_BITS(pagesz));
> =20
>      order =3D get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(p=
agesz), U)));
> -    buffer =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    buffer =3D alloc_xenheap_pages(order, memflags);
>      if ( !buffer )
>          return -ENOMEM;
> =20
> @@ -562,7 +570,7 @@ static int __init gicv3_its_prepare_single_its(struct=
 host_its *hw_its)
>      if ( ret )
>          return ret;
> =20
> -    gicv3_its_enable_quirks(hw_its);
> +    gicv3_its_collect_quirks(hw_its);
> =20
>      return 0;
>  }
> @@ -583,33 +591,11 @@ static int __init gicv3_its_init_single_its(struct =
host_its *hw_its)
>      for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
>      {
>          void __iomem *basereg =3D hw_its->its_base + GITS_BASER0 + i * 8=
;
> -        unsigned int type;
> =20
>          reg =3D readq_relaxed(basereg);
> -        type =3D (reg & GITS_BASER_TYPE_MASK) >> GITS_BASER_TYPE_SHIFT;
> -        switch ( type )
> -        {
> -        case GITS_BASER_TYPE_NONE:
> -            continue;
> -        case GITS_BASER_TYPE_DEVICE:
> -            ret =3D its_map_baser(basereg, reg, BIT(hw_its->devid_bits, =
UL));
> -            if ( ret )
> -                return ret;
> -            break;
> -        case GITS_BASER_TYPE_COLLECTION:
> -            ret =3D its_map_baser(basereg, reg, num_possible_cpus());
> -            if ( ret )
> -                return ret;
> -            break;
> -        /* In case this is a GICv4, provide a (dummy) vPE table as well.=
 */
> -        case GITS_BASER_TYPE_VCPU:
> -            ret =3D its_map_baser(basereg, reg, 1);
> -            if ( ret )
> -                return ret;
> -            break;
> -        default:
> -            continue;
> -        }
> +        ret =3D its_map_baser(hw_its, basereg, reg);
> +        if ( ret )
> +            return ret;
>      }
> =20
>      hw_its->cmd_buf =3D its_map_cbaser(hw_its);
> @@ -738,6 +724,7 @@ int gicv3_its_map_guest_device(struct domain *d,
>      struct its_device *dev =3D NULL;
>      struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
>      int i, ret =3D -ENOENT;      /* "i" must be signed to check for >=3D=
 0 below. */
> +    unsigned int memflags;
>      unsigned int order;
> =20
>      hw_its =3D gicv3_its_find_by_doorbell(host_doorbell);
> @@ -801,8 +788,9 @@ int gicv3_its_map_guest_device(struct domain *d,
>      ret =3D -ENOMEM;
> =20
>      /* An Interrupt Translation Table needs to be 256-byte aligned. */
> +    memflags =3D gicv3_mem_get_alloc_flags(hw_its->quirk_flags);
>      order =3D get_order_from_bytes(max(nr_events * hw_its->itte_size, 25=
6UL));
> -    itt_addr =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    itt_addr =3D alloc_xenheap_pages(order, memflags);
>      if ( !itt_addr )
>          goto out_unlock;
> =20
> @@ -1217,8 +1205,6 @@ int __init gicv3_its_init(unsigned int host_lpi_bit=
s)
>              return ret;
>      }
> =20
> -    gicv3_its_validate_quirks();
> -
>      ret =3D gicv3_lpi_init_host_lpis(host_lpi_bits);
>      if ( ret )
>          return ret;
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 9ee338edc2..accfd48a74 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -8,6 +8,7 @@
>   */
> =20
>  #include <xen/cpu.h>
> +#include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
> @@ -78,9 +79,29 @@ struct lpi_redist_data {
> =20
>  static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
> =20
> +/*
> + * Host LPI flags are scoped to shared LPI/Redistributor state, not to a=
n
> + * ITS instance. Arm IHI 0069H.b section 5.1.1 says "LPI configuration i=
s
> + * global". Section 12.11.33 (GICR_PROPBASER) makes mismatched values
> + * UNPREDICTABLE for Redistributors that share an LPI Configuration tabl=
e
> + * while GICR_CTLR.EnableLPIs =3D=3D 1. Section 12.11.32 (GICR_PENDBASER=
)
> + * similarly makes mismatched OuterCache, Shareability or InnerCache val=
ues
> + * across Redistributors UNPREDICTABLE while GICR_CTLR.EnableLPIs =3D=3D=
 1.
> + *
> + * Keep this policy in the LPI code and accumulate only explicit LPI/RD
> + * restrictions into it. Per-ITS restrictions stay in host_its::quirk_fl=
ags
> + * for GITS_CBASER, GITS_BASER<n> and ITT memory.
> + */
> +static uint32_t __ro_after_init host_lpi_flags;
> +
>  #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
>  #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
> =20
> +void __init gicv3_lpi_update_host_flags(uint32_t flags)
> +{
> +    host_lpi_flags |=3D flags;
> +}
> +
>  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
>  {
>      union host_lpi *block;
> @@ -228,6 +249,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int =
cpu)
>  {
>      void *pendtable;
>      unsigned int order;
> +    unsigned int memflags =3D gicv3_mem_get_alloc_flags(host_lpi_flags);
> =20
>      if ( per_cpu(lpi_redist, cpu).pending_table )
>          return -EBUSY;
> @@ -239,7 +261,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int =
cpu)
>       * physically contiguous memory.
>       */
>      order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (u=
nsigned long)SZ_64K));
> -    pendtable =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    pendtable =3D alloc_xenheap_pages(order, memflags);
>      if ( !pendtable )
>          return -ENOMEM;
> =20
> @@ -262,6 +284,8 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdis=
t_base)
>  {
>      const void *pendtable =3D this_cpu(lpi_redist).pending_table;
>      uint64_t val;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(host_lpi_flags)=
;
> +    uint64_t shareability =3D gicv3_mem_get_shareability(host_lpi_flags)=
;
> =20
>      /*
>       * The memory should have been allocated while preparing the CPU (or
> @@ -275,9 +299,10 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdi=
st_base)
> =20
>      ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
> =20
> -    val  =3D gicv3_its_get_cacheability() << GICR_PENDBASER_INNER_CACHEA=
BILITY_SHIFT;
> -    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEAB=
ILITY_SHIFT;
> -    val |=3D gicv3_its_get_shareability() << GICR_PENDBASER_SHAREABILITY=
_SHIFT;
> +    val  =3D MASK_INSR(cacheability, GICR_PENDBASER_INNER_CACHEABILITY_M=
ASK);
> +    val |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                     GICR_PENDBASER_OUTER_CACHEABILITY_MASK);
> +    val |=3D MASK_INSR(shareability, GICR_PENDBASER_SHAREABILITY_MASK);
>      val |=3D GICR_PENDBASER_PTZ;
>      val |=3D virt_to_maddr(pendtable);
> =20
> @@ -304,10 +329,13 @@ static int gicv3_lpi_set_proptable(void __iomem * r=
dist_base)
>  {
>      uint64_t reg;
>      unsigned int order;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(host_lpi_flags)=
;
> +    uint64_t shareability =3D gicv3_mem_get_shareability(host_lpi_flags)=
;
> =20
> -    reg  =3D gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEA=
BILITY_SHIFT;
> -    reg |=3D GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEAB=
ILITY_SHIFT;
> -    reg |=3D gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY=
_SHIFT;
> +    reg  =3D MASK_INSR(cacheability, GICR_PROPBASER_INNER_CACHEABILITY_M=
ASK);
> +    reg |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                     GICR_PROPBASER_OUTER_CACHEABILITY_MASK);
> +    reg |=3D MASK_INSR(shareability, GICR_PROPBASER_SHAREABILITY_MASK);
> =20
>      /*
>       * The property table is shared across all redistributors, so alloca=
te
> @@ -317,9 +345,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rd=
ist_base)
>      {
>          /* The property table holds one byte per LPI. */
>          void *table;
> +        unsigned int memflags =3D gicv3_mem_get_alloc_flags(host_lpi_fla=
gs);
> =20
>          order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids, (u=
nsigned long)SZ_4K));
> -        table =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +        table =3D alloc_xenheap_pages(order, memflags);
> =20
>          if ( !table )
>              return -ENOMEM;
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index e1322b94f8..2a8233df54 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -110,8 +110,9 @@
>  #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
>  #define HOST_ITS_USES_PTA               (1U << 1)
> =20
> -#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
> -#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
> +/* GICv3 memory-related quirk flags. */
> +#define GICV3_QUIRK_MEM_NC_NS           (1U << 0)
> +#define GICV3_QUIRK_MEM_32BIT_ADDR      (1U << 1)
> =20
>  /* We allocate LPIs on the hosts in chunks of 32 to reduce handling over=
head. */
>  #define LPI_BLOCK                       32U
> @@ -128,6 +129,11 @@ struct host_its {
>      unsigned int itte_size;
>      spinlock_t cmd_lock;
>      void *cmd_buf;
> +    /*
> +     * Workaround flags scoped to this ITS instance, including memory
> +     * accessed through GITS_CBASER, GITS_BASER<n> and ITT memory.
> +     */
> +    uint32_t quirk_flags;
>      unsigned int flags;
>  };
> =20
> @@ -157,6 +163,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
>  /* Initialize the host structures for LPIs and the host ITSes. */
>  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
>  int gicv3_its_init(unsigned int host_lpi_bits);
> +void gicv3_lpi_update_host_flags(uint32_t flags);
> =20
>  /* Store the physical address and ID for each redistributor as read from=
 DT. */
>  void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
> @@ -199,10 +206,10 @@ struct pending_irq *gicv3_assign_guest_event(struct=
 domain *d,
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>                                   uint32_t virt_lpi);
> =20
> -/* ITS quirks handling. */
> -uint64_t gicv3_its_get_cacheability(void);
> -uint64_t gicv3_its_get_shareability(void);
> -unsigned int gicv3_its_get_memflags(void);
> +/* ITS/LPI quirks handling. */
> +uint64_t gicv3_mem_get_cacheability(uint32_t flags);
> +uint64_t gicv3_mem_get_shareability(uint32_t flags);
> +unsigned int gicv3_mem_get_alloc_flags(uint32_t flags);
> =20
>  #else

--=20
WBR, Volodymyr=

