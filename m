Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F229C9831E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 22:56:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433160.1653970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sMA-0001HQ-UD; Thu, 24 Sep 2026 22:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433160.1653970; Thu, 24 Sep 2026 22:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sMA-0001HI-QV; Thu, 24 Sep 2026 22:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1433160;
 Thu, 24 Sep 2026 22:55:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9sM9-0001HC-Im
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:55:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9sM8-00DpDO-CD
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 00:55:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab5aa44-8faa-0a2a0a5109dd-0a2a450697ca-20
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:55:56 +0200
Received: from [52.101.69.132]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab5aa7c-195a-0a2a45060019-34654584990f-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:55:56 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DU5PR03MB10302.eurprd03.prod.outlook.com (2603:10a6:10:516::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 22:55:53 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 22:55:53 +0000
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
 b=hSzIHLS6QVqLQRmIRIppM6kfov/aSOB+xeoXDBC7UaYxrEtLydtRZEXcmJitBm7rcdbmBv9sPkxwuLr4Z+J8BPbZdV7RJyuXlvy52ugfDkUFfuc7drDBoFxAu9KPCoHATTZ27cwCgkBWLMQAwS5/TJTFz2gyjh1A8L+p/4kor+WjWvODImMWnJb0RvXmrVkJvXXNoigNZ3n6Ah/17wyW412VhG0MQpnNfYmLROXkxB3iNnhz9evRZ/dPuE8QUZjyUaiSoxN7JMOgB/BhihF4n9S1nLsyj5V8dfoUwA9NAo3h9tiSauZh3XDVXrw61+sCXH0I1S+yscMWSAuJesnW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NXdfsFy7WUPX36tY0/mB+5XsUobklrPPlsiV5ayEJo=;
 b=r0tpbR8SyQKmS/SQyHsYt7MiycHQjV9RPIfAEhLB/ZW0x8isu+2f0Dc+Zj3Vtzsjwb7f7L7i7MYBXnQtGVJh5K4pZZZimAIwHZAvv/rDDD7RLTXbzB87a/xcw40BFicZFzbkjMBZ+JsYz5vj9FZfbEm7offb/hJAlHPAPGMigO6CwX3cbUAMV2xMjLryxawWm6LJ+/UT0gSTfzJYoYmq3xOIP1oBoHZQC+V1D8cmP6MzlXGkKNL2ZxdpsJornXrfYCgSBDCkKr2AtEiD7rUdqT/CHKfkz95Nyt6lx/JZzKmIfd/5PqBnjOulgyhf2BEHCTnsT8zaAArkRdGCNcnd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NXdfsFy7WUPX36tY0/mB+5XsUobklrPPlsiV5ayEJo=;
 b=sBiw5355T8qecBt/FhRdqcqiLUzN4WN3rOzCltRoZQ2lTKcr20/sNS4552HNNYRJIAM5je8RJntIJFKbajXoLDlq4PKrpdjQZ1RSZZPG2331YERfXr5d+GetWnLj7Jp2baPm+hzWrNvuf86wTQEgguR/YA7P8KdxYQm83TlPMfwKd569WZK4Ofmla9iGXvdZP+fpRGwD5jqAmJxnvdFQyrjTZo5nFywmoWIsMtcumVXoRKqEiPL9+d6JJQSrWikOKYtFHAeu13X1nnttTa0S1XijLA8Kj3IQol1mD4xK9ivxvP2du/DH6B/4AlMKrVcO9Lxiqyic6kyAh3FDRqTKxg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 4/4] xen/arm: vgic: free eSPIs using the bitmap index
Thread-Topic: [PATCH v5 4/4] xen/arm: vgic: free eSPIs using the bitmap index
Thread-Index: AQHdTGdvGfT1E9oBQkCUIpVOvCgdbA==
Date: Thu, 24 Sep 2026 22:55:53 +0000
Message-ID: <877bka1cp3.fsf@epam.com>
References: <cover.1790160605.git.mykola_kvach@epam.com>
	<8c61cf31b69377737d1f688bded43d123ac55d00.1790160605.git.mykola_kvach@epam.com>
In-Reply-To:
 <8c61cf31b69377737d1f688bded43d123ac55d00.1790160605.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 24 Sep 2026 23:57:56 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DU5PR03MB10302:EE_
x-ms-office365-filtering-correlation-id: 9fef860d-dd31-4cf5-daf4-08df1a8efc8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|42112799006|10067099003|56012099006|11063799006|4143699003|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 e9+kLtoVR4w6SkD9pL4NM1l4lhyNpVWr9ab1IM4hC+jNVh+Z1oUbZZ/WWFgmUFEX2y7vxUkrBTR3S2t3l7s8WvsT7S0b+j/ouBzrDn1OS8PSlKjnI2ihs9p1SClPP6o2JnVT5hMoVC3n5ga0S/n3aOlWvpflKW3kWhM7/uZhxHwRqn5ER7ILnbkIR3EYFUn9hjEkFmHVENmQsd3gjgx7EcYsJh7slMIXft/jy+4lpxJGEFIE9O8pmJ2crajdddeCskAVbUmaMcoX+BA3mXAsFNpVfyRw+gX+sidSRZHAk6hlJFcC08ygoa0Hzm4IbrZnG1yPyCG7pa4T1whIvKRVU/Y+QgZLbWNp73VXbR9mfF8Yv1jl1WpyHELoOeY5zyFBdTTqyl7bvfSW9UvJYHa8Q8psNRHw4InnlhEh2Z6EXEe0XmB7mlIk9KA0gwlqzn3bSsLiE/ZClEljRWjw0HGoBZhP55wZHmoZFhKNsrnrsAne/4CiBz2NP64LC5iBSupvsbSJcFfecIernDta8Piy2dW8ZXxqubQckOoTQ2wzxR5aP70Rr00Rdu345X5Uev83fm7rpMZ1rYNhB7gGeYnYGLrLRe3pejJx58ApD/OALL5yYxcbCesgqMz09Th2KlgSGlKvsDXM9epItL5P12GZ8k9ykxXObuezVtlPCzVzb2Re1h+EIfAot9ZTpCPE0iF9VQm352TjH8oVbVowyjf790M/YMkWJzHhHFskd4AWiNw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(42112799006)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DAlDUkjrmh0hP0FLNdU0ECrqVmO5BdGamKbouzeDdQzreEb0aqezjieoqs?=
 =?iso-8859-1?Q?3TihdpZxVuP1qrJ45qUC2XvaG3zxjYawlCLqfjoCMUZxwC8sWxsh6YhiY2?=
 =?iso-8859-1?Q?cBaIrcO7e97EmQP+0AUCz8KnNPTJDTmm6lHNBAsfgDWV2Ob+qXzHq2ljd3?=
 =?iso-8859-1?Q?OFRHU3SahA8N+rob0kN+BZZzgDyGUN1zN89DjOBOfxWrq3rNRsEw19WD/Z?=
 =?iso-8859-1?Q?/4As++OdyvttlvvILwk/nd3rSNlrTtNDano+gymSGRJOYayXfqjHa4ffoL?=
 =?iso-8859-1?Q?Ef3FZf8k5tv52AaXEznL9Yx99yPQ6KsXYicSb1OKD148kMZwH69VFlWaLV?=
 =?iso-8859-1?Q?Y0XoF7vYVQLfoWV62ITKuLJtwVtT/YDA3JhIy8/hMvYPjmsjLk7w9bT1hI?=
 =?iso-8859-1?Q?SF4QFBazemludcbvCe2mrUrwiPHVkttxJEK1A/11drqrQ+UenjszrniFcq?=
 =?iso-8859-1?Q?HyR9AFJAbioiRz8LQnj4yyUcXtFl/3HzRUobjU7gvI9IjGhM9rUW57iKhq?=
 =?iso-8859-1?Q?dfQk2Q2P8KG/kBHfkOuZ4ymVisSDAs9iIFOsX2N9sCDinsOVessEKP9Iob?=
 =?iso-8859-1?Q?1/K9yoObwzPYA08azJv++2YfrfM2SBu/pa5RcPBSpmjDT9BKM51lhvoQvb?=
 =?iso-8859-1?Q?VqHEiF0kRMApB8Y3YlPQZA4LOObBPc2QHqu043zrGUCkcN76zaadJrQZ5Q?=
 =?iso-8859-1?Q?1GB85hOwZ9LMApNNedbitI/KGG8cHBUIvinsVxqESTUCPsApWpIE6RSF1J?=
 =?iso-8859-1?Q?lnltn8TZwcfHQjqckhi600PGmODtNaDsIrEDXBaUNUm8Fw4FSM5EgdduBD?=
 =?iso-8859-1?Q?WT0b51tIeinh8HRijPMraASTlhMJgtxFKseFRLpa3FBxu/mJaykcsu8d3l?=
 =?iso-8859-1?Q?paRpwYEnwoSr18QjJqxOzAKTV0BGmjrCB9yhNqex6kG4bsItCGGHASWuAR?=
 =?iso-8859-1?Q?PRxVPgCWhg2+cnmp6+f4Txh4IJM2eAy+LEh3rOp4V/Z05kSeydUirPTeUv?=
 =?iso-8859-1?Q?6f7nOyNxYFE1e8tMv4X+UWLGtkMQOcRePRd8mcatXmf3C5axWbADMi9vyZ?=
 =?iso-8859-1?Q?lqmPhN9BNJk0wgz8R6ingWpcEBJ63rl5q8+7MCjWX/LJjPQI6F/SQ5jFAb?=
 =?iso-8859-1?Q?E4Rdl3wMjgbVoMQrI+SsVpMGRNTExhLLJnbdPgOt4bsgCDsgLw8gM+Aa67?=
 =?iso-8859-1?Q?+q9/st5xPMRPbmNLfWSr1GVPM2g9h+vnQLjrKRvfA97XgRtXTT9iGzXisR?=
 =?iso-8859-1?Q?CYBVT3eGUJQsNmKc0oUdMAEB9vT2Vkn6gso6clRCCGFwk+EbTm+Ap4HZN8?=
 =?iso-8859-1?Q?0oAJdt1YnxrGlQjbXX+SUovIdMxAU4lJNO6193jrpBDZBmnBQSSeBnnVrC?=
 =?iso-8859-1?Q?qGde0v+Qq8YQNh3Xnb5Ot1epLBTl0jXgUgYg+Lfh96eBiXaVqOA5cv87iB?=
 =?iso-8859-1?Q?gDrSYPm82nE3knsB18ErCkVjv7AxiGksyjA+bntmzo8OyurysinmD3jr/E?=
 =?iso-8859-1?Q?A5hwcRmuQs2ndxaDD/a2qBbv+aYTygQWzozrp3XjB8TvoM/qJz6WCHydKu?=
 =?iso-8859-1?Q?ficja6S4uuUjwvXyjbCSEWGtjQLByY1HNluS003zK0a53oI2ADVYcgS/bb?=
 =?iso-8859-1?Q?Q0qv42p4/ZewuHdYD25vpADIBiRdjAJyg93yjQxp00zM3z/1bJ/1xDlBhO?=
 =?iso-8859-1?Q?M+4LfFDEXziXTR7t/1cQ/OQWJsOnWDypnQeo7Xat3o+pgXufG+hdVgn4fF?=
 =?iso-8859-1?Q?x5JitCoujNT3TAq2NygaoAkDgeFrHioaMJXneo3OzSco4wHtaldkDHcbIl?=
 =?iso-8859-1?Q?H3rAHmpgK0LHecbmTbG5Pine9AGBZJM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fef860d-dd31-4cf5-daf4-08df1a8efc8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 22:55:53.4313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrV94xfIdFA5Q61vUb5bJngQsbf6BzDPVlOacEj/yVlYuuTNYBAH1EeepG0+NdcfMvtsUXUhujknEn/u8XE6cKicraR7h4iQE3cVIz9q+Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10302
X-purgate-ID: tlsNG-16d1c6/1790290556-F440377B-AF5C30B9/0/0
X-purgate-type: clean
X-purgate-size: 5350

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
> allocation bits immediately after the regular vIRQ bits.
> vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap inde=
x,
> but vgic_free_virq() used the raw INTID.
>
> Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bi=
t.
> This writes beyond allocated_irqs and leaves the intended eSPI bit set.
> Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind=
,
> and during vPL011 teardown.
>
> Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reservin=
g
> and freeing vIRQs. Use vgic_is_valid_line() for the validity checks when
> reserving and freeing vIRQs in both vGIC implementations.
>
> Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended=
 SPIs")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v5:
> - Add the vgic_is_valid_line() guard to vgic_free_virq() in the new
>   vGIC implementation and use the same helper in vgic_reserve_virq().
>
> Changes in v4:
> - Document the compressed bitmap layout with an ASCII diagram above the
>   conversion helpers and refer to struct vgic_dist for the full layout.
>
> Changes in v3:
> - Adapt virq_to_idx() to the configuration-neutral is_espi() helper.
>
> Changes in v2:
> - Call is_espi() without a configuration guard.
> ---
>  xen/arch/arm/vgic.c      | 42 +++++++++++++++++++++++++++++-----------
>  xen/arch/arm/vgic/vgic.c |  5 ++++-
>  2 files changed, 35 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 0ba13e18da..acded6a40f 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -25,6 +25,21 @@
>  #include <asm/vgic.h>
> =20
> =20
> +/*
> + * The allocated_irqs bitmap is compressed: eSPI bits immediately follow
> + * regular IRQ bits, skipping the gap in the INTID space.
> + *
> + *   +-----------+-----------+-------------------+-------------------+
> + *   |   SGIs    |   PPIs    |       SPIs        |       eSPIs       |
> + *   +-----------+-----------+-------------------+-------------------+
> + *   0           16          32                  vgic_num_irqs(d)
> + *
> + * INTID ESPI_BASE_INTID maps to bitmap index vgic_num_irqs(d).
> + * The following idx_to_virq() and virq_to_idx() convert between INTIDs
> + * and bitmap indexes.
> + *
> + * See also the allocated_irqs comment in struct vgic_dist.
> + */
>  static inline unsigned int idx_to_virq(struct domain *d, unsigned int id=
x)
>  {
>      if ( idx >=3D vgic_num_irqs(d) )
> @@ -33,6 +48,16 @@ static inline unsigned int idx_to_virq(struct domain *=
d, unsigned int idx)
>      return idx;
>  }
> =20
> +static inline unsigned int virq_to_idx(struct domain *d, unsigned int vi=
rq)
> +{
> +    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(virq));
> +
> +    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(virq) )
> +        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
> +
> +    return virq;
> +}
> +
>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>  {
>  #ifdef CONFIG_GICV3_ESPI
> @@ -854,19 +879,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union=
 hsr hsr)
> =20
>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>  {
> -    unsigned int idx =3D virq;
> -
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> -    if ( is_espi(virq) )
> -    {
> -        unsigned int num_regular_irqs =3D vgic_num_irqs(d);
> -
> -        idx =3D espi_intid_to_idx(virq) + num_regular_irqs;
> -    }
> -
> -    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
> +    return !test_and_set_bit(virq_to_idx(d, virq),
> +                             d->arch.vgic.allocated_irqs);
>  }
> =20
>  int vgic_allocate_virq(struct domain *d, bool spi)
> @@ -903,7 +920,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
> =20
>  void vgic_free_virq(struct domain *d, unsigned int virq)
>  {
> -    clear_bit(virq, d->arch.vgic.allocated_irqs);
> +    if ( !vgic_is_valid_line(d, virq) )
> +        return;

I don't think that silently failing is a good idea. It needs an ASSERT()
at least.

> +
> +    clear_bit(virq_to_idx(d, virq), d->arch.vgic.allocated_irqs);
>  }
> =20
>  unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index ba029b8a3b..84212bbefe 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -712,7 +712,7 @@ bool vgic_evtchn_irq_pending(struct vcpu *v)
> =20
>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>  {
> -    if ( virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
> @@ -756,6 +756,9 @@ int vgic_allocate_virq(struct domain *d, bool spi)
> =20
>  void vgic_free_virq(struct domain *d, unsigned int virq)
>  {
> +    if ( !vgic_is_valid_line(d, virq) )
> +        return;
> +
>      clear_bit(virq, d->arch.vgic.allocated_irqs);
>  }

--=20
WBR, Volodymyr=

