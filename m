Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64593606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=WRtVXqQR
Received: from list by lists.xenproject.org with outflank-mailman.1493588.1693498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTV8I-0006cm-AQ; Wed, 18 Nov 2026 02:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493588.1693498; Wed, 18 Nov 2026 02:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTV8I-0006cf-7U; Wed, 18 Nov 2026 02:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1493588;
 Wed, 18 Nov 2026 02:10:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xTV8H-0006cY-F0
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 02:10:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTV8G-001js8-Rl
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 03:10:44 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6afd08fb-e002-0a2a0a5209dd-0a2a4501eaf0-22
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:10:44 +0100
Received: from [52.101.66.91]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6afd0924-5bcc-0a2a45010019-3465425b871b-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:10:44 +0100
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 (2603:10a6:150:805::10) by AS8PR03MB8467.eurprd03.prod.outlook.com
 (2603:10a6:20b:529::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:10:43 +0000
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544]) by GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:10:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZ4P4p/lTK8elefhBkCQ1ULDukGnu4Twv9dVbd82G+Q8b7fieX/pSKW9/B4cPepR9/HsV3xiZSZiYVqz8joy6bELYaTpLhI/+z30G9ewLVQk+Zu6wW5xTDFaMX8NFgCTVVtAhJ5t2s3PJjWuuEprlTpnncxaxTxl8r+R16SP99a+sjDINpm7EJo4BVCXy1Foturn7UG8mp11oEi9HBvXR9HokzLbSiv4y2D/04DgbhtRhQHr/tOyV2iHP9ASo7Iqr46zLDYAWmV6mRY1/rnW1Q3+p3rmXh6KNqWm2T2yPQIlyHJOkDzyMxY8Nb3G2T9CAfDRW+Qq2toMpoyE/5SqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZmQtJLHjLRC4iQvxf8oPa9XiafR3PE7KfPqSvoKcb4=;
 b=U2Ei98Z3gdHXzYkDoCH0M1urcgSvD0PWm2s/tnwaCgtcd20OXs8Mo9hWtbEazLoE2lOnLR8q8FWhmcJlYyY/g8kDFrDxgDVhkP2y8kY5rvfEOsG4GSt1HQh0Mf4ykvcQUROntke6p/EL4ft8whUn0W2PUnzYqmSnNPh2qZP8bgRMZnpM2QC5owjrwMfms+1xJPRLnMad0+XXlIjuMW5zrDDEs3w3QpT4exUorPZCCY9kGe1RypM6LKlU5AZBLPM5M46bpQoaJbTGUIGFAa5tpdqY+WOicCn50YQDa79pbWu6lbvduG3VKpodTeqLnxmeAnKp1aRhaYBLQzZh1pG/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZmQtJLHjLRC4iQvxf8oPa9XiafR3PE7KfPqSvoKcb4=;
 b=WRtVXqQR68QTe87b7+srYjVMhzJvKmmlEi7y0/PUuxuclMlXpwpQaKuHDL6OyoE/HTxFRSPUlrGPjEACCHGBxk1Cx1on3mng0MoWpXoMXN48yDdF1w/x0hjyvZdVqczfo8sn2H8r88x+UFgeUQ+WnVL5x7NmpZg00mBw1DstKZ5NCeN8qLdsNGKYytrVafR55lbgYfIqri783oenSemJWqkwwR7baB8xZdsmWzy7zqEBbw3G4yLpSKnlQ3JLrsXexBszVEEDWyd/p6VOBNPpHwGvXytaORl1ulP+5C6ZXeGU466OxF2AHvUwNkowWjIqUl5kztg4nzQCWH++UEkiPA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/4] xen/arm: guest_walk: refuse an address outside
 both halves of the range
Thread-Topic: [PATCH v2 2/4] xen/arm: guest_walk: refuse an address outside
 both halves of the range
Thread-Index: AQHddvgLLKv7Oha5C0G7B7gsa06XibczFhYA
Date: Wed, 18 Nov 2026 02:10:42 +0000
Message-ID: <87mrr6nb31.fsf@epam.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
	<9ec26a7839aa586343f6c566e07dde208f781a3f.1794962603.git.stefano.stabellini@amd.com>
In-Reply-To:
 <9ec26a7839aa586343f6c566e07dde208f781a3f.1794962603.git.stefano.stabellini@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.4; emacs 31.1
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB788477:EE_|AS8PR03MB8467:EE_
x-ms-office365-filtering-correlation-id: c2de21dc-5513-4fe1-d204-08df4519264e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|366016|376014|1800799024|18002099003|22082099003|261009223027099003|11063799006|4143699003|56012099006|261028144727099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|38070700021|261102123227099003|10067099003;
x-microsoft-antispam-message-info:
 GK3UxIp3wcxTBOo912Is9Z5SKtinRLAwJR9KhjxAuZsk0BjtuOCllQ6KcX/x5LE1zrUaYpO5UKPMBNN75Fv1mOHGGPRIH7CKDnUad9MZogwyn0vLgAQStaoFWN5ps8lxUXbxa0g5kSI8nc0ZWB8oM7UmYkeP6WnTmOm4zdK66Gi3xcppBpmE6BDhoVRrOOJTZPbu/5jEBuNhwVQE0QiOPVs/CXp8moeE4JesmoarOvXpQrCy0XUdD005TeBhXVtnPtnbbTKumiKxJYRGuqMbGyKZdCd+j6TRWXVgRr+h8kBC1tlvtGLWLqJ1m/bwQPd4dAYJ87iigCXcCtO7n4dnSns1AL/6GinX6uIuNwNc8MvNGLQFHp4H4VPmq/xu7HUYN7162TuJkcDo2ZJlgb1Q3laOexOlBwZuT1MO0j/zB8h+A/ufdfy0b0fJpjLxpZE4yB4uxJi2cjQDRselVyRAasbCTOSrDBUD5ZP/enAQQOn0/73AoUrlTZJVQynmkMdShJoMTb66jBFRsNJVnzs7NnKrOYa73bkyxs948BpKRoKcnzm26IziOcrGrOQnTBKCDlLJoBk/BP2sqR7Wu9+PBgJ1GeUyMR2m+UX+bblhQPIcc4J2DFxUThJZM5PDL2bKF8VzlZweGh+38TsKQT0WmI7nFxJjb5kTJzNUgPm48I4CC01+STqCckO7sUl1CZGUA7QHjhwtjCnubuhsxWVSZTi9gc6trtjiQh/JZslKG1o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB788477.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(38070700021)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TKcVMfrweTrlcvi/7zT33cPf+IL7uiyMr3ouRrmBvakHsEJVCjRzbGc4MD?=
 =?iso-8859-1?Q?Ny+BYhthQuPTyNXW4GsCMRqvd5JRH7QtW00Rj3B4lGCDNUl+ciNwxohMTw?=
 =?iso-8859-1?Q?vg3Z/DngT2Gpv9nyDi99pd7SzYOI1Wpr+rqSBGdXSFUXaE5yaKhO3pEBF1?=
 =?iso-8859-1?Q?fBKap/Uj8+oVfbrXN191jfoFsaagUCHWDXddoTpBSUtL7RwtwW+Vv/CmGV?=
 =?iso-8859-1?Q?fum4C2durvQsePog6kZ49BD1GiVWav/YdBtosn4QHURDc5ooh+lOa18NFg?=
 =?iso-8859-1?Q?bmFJs3/NhB7ntR9sIzfOnZ6HyxTOjzFKw1FkEQAZl4PvFSFWN3pvvvOz8N?=
 =?iso-8859-1?Q?mWTmL6U04c8DHiVwUvYslU1WKw0Cjn+ILWASGI3/1nVdjYmfX+hetYFlDU?=
 =?iso-8859-1?Q?Asg1ghYYM87kT15eZpgPkEDekbIPy/1s4BwY7eLq6xT9MVw79hxRM81dXe?=
 =?iso-8859-1?Q?KPXQO6aUrVwSRxhS3j7izqgPeRMkkVHKm6JAk3I94zgrsM+0NYZPnya4gs?=
 =?iso-8859-1?Q?exlo53nBp6mstR346K43mXGrm5QVexnJGydYJ/RMvdzmA1vbdo5VdnnRH4?=
 =?iso-8859-1?Q?WyNQHi4iM5LK5wTXp5AVViVzgqVeSa4ceN5eWAgbSnP0GnO0c3j6k3D80Q?=
 =?iso-8859-1?Q?gkDL3AVnEgA7IIwBEsShOIk1t6GCeEMPcLtWgTW1XGxoUwQu3r8sNlceKZ?=
 =?iso-8859-1?Q?TGd+7bX1bxvWjY5EHunMNzrP1xiQaEtZr/gEw8ETOywgW6eiOZFSzGflmx?=
 =?iso-8859-1?Q?eVVfUr5ZHjQXDTXeuP/fCYYNJkuaIk5PBVLFvzBnRekThikUKyRgvh6Aks?=
 =?iso-8859-1?Q?wF3aZXbTdR/rgZF7Ck1TCywzFg7AfCTOIUTxHrf0F2m/m1UAo0UQDNghui?=
 =?iso-8859-1?Q?3XD32PHTZpEtTSzGuFOIVeSdZ0orvw3DQstiFQoMH0bz1F50tiAapTGv2g?=
 =?iso-8859-1?Q?pjAuwKk1hHBkTrV2oZL5LtYZbfO9S1Yq57uKjkVj5zXAc6FH92xygJDOpF?=
 =?iso-8859-1?Q?khcSPHN95KcAnk8TpGSA8Jq1VmEWcYcLux34g+RR3Tjwl3RBQoZee9WMcK?=
 =?iso-8859-1?Q?TumsIY8xEMfojJUFOJHmknGEOZHcmCh/xJPPI2i22+a/8BmPdtdhqoZQh4?=
 =?iso-8859-1?Q?wHTjHUrp4Wnz+TyoWWfmXrKkLvY2QcAeHSAgeCa32yR+EW49a2bEzNt+Jo?=
 =?iso-8859-1?Q?36pOR3u1Iu/vkpzRFkzaTTpHPdpkQOnWpnBiQo8XW+iZhEYrn/W9aCLKBB?=
 =?iso-8859-1?Q?1+KX9BWcM6zzhgArLlnRo3tyUMLNlvRL5uriOVHZ04VgzatxX8g6+uvT6O?=
 =?iso-8859-1?Q?t7vYvwz1WfqFKTf1Tg6p4LInH6mft0LZpfkS5qNQAjS/5rSxbVEoQMdjos?=
 =?iso-8859-1?Q?CiJ5VkcipyaxBAhBqMciDWr1hox0DMkcMoiBp+uhKDt/tp2z19RhVxElfy?=
 =?iso-8859-1?Q?wpOtycxp/Hf+LiOTVSFagxqtUOgynSFzyA7He/SKst1ft/SSPtO0Y8ixbk?=
 =?iso-8859-1?Q?BjASpj9/cPmXvfVU8XuCOe5c2RGeNwbqMmlKLWq94iGZxZfk8ASXkHLPUP?=
 =?iso-8859-1?Q?QGEDXB+ZFaN4z3IXVsWDy6ZNiGnis7ZuqLK7l2aKCisuc+Xg/Oc52ZU+Ct?=
 =?iso-8859-1?Q?2OrE8BIK0aMSCBbJi8eYtJGuZuUMTjFxCo19sDtWaJDhGVWGxZdSWv9bj8?=
 =?iso-8859-1?Q?yxoj6LeNeL3fTfrjf2cDNbqzGeW8IktKzSiYrny7aZWK+cFwKWiLTXXWVF?=
 =?iso-8859-1?Q?DAxQvoLiEsS9WYB/6HfoBE5dVAXRx+Py4Wi7Gtbq0B5V8XFJOmVU0C7wtL?=
 =?iso-8859-1?Q?Vkp7nuEVrveq/WTYgCT+ryfpZbJmEvg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB788477.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2de21dc-5513-4fe1-d204-08df4519264e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:10:42.8993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iammN+6hBVKU9Tsnl1SjojC2Rsa9zIxAr6DAsu1jzujPGeL9Lsd33vp6H54prFtTIrkRI833mVj/iXd4Tvbz5n4XMGX7gHLS6rRZeHYXtrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8467
X-purgate-ID: tlsNG-d62444/1794967844-4DD595FD-68C224BF/0/0
X-purgate-type: clean
X-purgate-size: 1995
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Stefano Stabellini <stefano.stabellini@amd.com> writes:

> The bits of an input address from its top bit (bit 63, or bit 55 with
> the top byte ignored) down to the input address size must be all 0 for
> TTBR0 and all 1 for TTBR1, else the walk faults (ARM DDI 0487 M.d
> D8.2.4, AArch64.VAIsOutOfRange()). guest_walk_ld() chose the base from
> the top bit alone and translated such an address. Refuse it before
> reading any table.
>
> Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>
> Changes in v2:
> - Cite ARM DDI 0487 M.d (D8.2.4, AArch64.VAIsOutOfRange()) instead of
>   A.k, in the commit message and the comment.
> - Move the Cc list after ---.
> ---
>  xen/arch/arm/guest_walk.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 151b837541..8c73ceb04d 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -408,6 +408,15 @@ static bool guest_walk_ld(const struct vcpu *v,
>          if ( (input_size > TCR_EL1_IPS_48_BIT_VAL) ||
>               (input_size < TCR_EL1_IPS_MIN_VAL) )
>              return false;
> +
> +        /*
> +         * The bits of the GVA from the top bit down to the input size m=
ust
> +         * all be 0 for TTBR0 and all 1 for TTBR1, or the translation fa=
ults
> +         * (ARM DDI 0487 M.d D8.2.4, AArch64.VAIsOutOfRange()).
> +         */
> +        mask =3D GENMASK_ULL(topbit, input_size);
> +        if ( (gva & mask) !=3D ((gva & BIT(topbit, ULL)) ? mask : 0) )
> +            return false;
>      }
>      else
>      {

--=20
WBR, Volodymyr=

