Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384DCCAC5A0
	for <xen-devel@archiver.kernel.org>; Thu, 18 Sep 2025 12:17:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1126023.1467735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ2-0001hD-Ep; Thu, 18 Sep 2025 12:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126023.1467735; Thu, 18 Sep 2025 12:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ2-0001gO-7S; Thu, 18 Sep 2025 12:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1126023;
 Thu, 18 Sep 2025 12:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kqio=35=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uzDZ1-0001YH-5y
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 12:16:39 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 532489aa-9489-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 14:16:37 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8720.eurprd03.prod.outlook.com
 (2603:10a6:10:3ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 12:16:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:16:34 +0000
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
X-Inumbo-ID: 532489aa-9489-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt0C7Lz5i7UvO9H6f+Td0B39yB88DHo0AhgBQfbR7RQhNhcigsDy8xr2ST8O/pW1JfkyeeVvPEkt9kyBmG3wX/B+xBUPVmm5ZD2JFGJo6KKAd3DEc7e1WQrWZEg31CSPKdoLBiqYIhZidmswZls60elT4Xcmmi3Hn88vl+MjUQDFkfTR0uamV7jVK++VsVQ9fyZS2Byxjg0/u67aUFFOHPkshO7vtkHYyAYSBEZwP+hPESzFsUhmqJhFxwpKlTUg4HvN6GvY5IzqEHIJV8XM4v73aMx1qpKfdQDLXryyAEfpA4k0xLDF9G6Q5pT7Kfc81wMT1OphyZzEpkad67GaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN+9v4HUcACKQP3UTIJ7uIDFEXsmW14cpvwu+bPQxAM=;
 b=X36EViaamCgUl7S0uZstEwyp0QwDnTUad8+dRG5STkT714Vq6hD8Q3LwCE+N4Wpq+XX/Aaiz7+0rRpAMGEZ91zrc0xdlW3UUu8b1yltw8G0raDNn6IpzSRtkJS+55PYvjdSOD2lYgjJgyzGY48Xx3M3yHNtiyrKjurXOzApichaEb3ZdGpjnOxQJtTwR4R2zy4JRATkUAXzMYCb3l+/lmwutR0qjaaq0tenu7liSBOcQ6MmVoGFzkBV9hjbkf593RiHvL8z0NgYUX/OEKfZCyeW8uBVHGV15zxAHl+WzTe39N6r8NaVwdB7B62xBS4LM/ZeCMS/Tm8wYho51vK71fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN+9v4HUcACKQP3UTIJ7uIDFEXsmW14cpvwu+bPQxAM=;
 b=viyx9TeXvF/Fe9nCVYwFzbaror1St55N9Lk/5XjwMg6fRh7bgRo/4cwcK8wySeSzfdhW2ocKEuf/WpNdVPtgULlwPaIUvcw1qWQ3arCUeMXuanagSaVsZsTjE32N3wUDurXY1GWWdBDn4HjMZ19OXqJ8v9WkzGTHaHGjJJMmM+rk6YYzkZxWieNLuW3DK20YLZOvQy8dAX1N8TF9VnsKpteoYy8qz5bdtOMIlXa2FaRBI3kSUNVwzdu32uCqivqDWntt/S3UYBLsif2Xw1+mcKTtLHHm00a976lFfX+D8fcN/Kz3RTm0ezwImkhu8e0HyNH9rDhIv81roESkCXyVaA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/4] arm/gic: Use static irqaction
Thread-Topic: [PATCH v1 2/4] arm/gic: Use static irqaction
Thread-Index: AQHcKJYSC7sAxQi7Lk6HVSEybUuLWA==
Date: Thu, 18 Sep 2025 12:16:34 +0000
Message-ID:
 <772a7621c2d0976106c31e5d43205845b1e97a62.1758197507.git.mykyta_poturai@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758197507.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8720:EE_
x-ms-office365-filtering-correlation-id: cae7e762-8cac-4f01-2791-08ddf6ad3574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+dpW8LAhJ06u06AuGS/fjHa2MiFdTB5R0aXz/D/nRfgKeSL8sXkVfkXtOV?=
 =?iso-8859-1?Q?xy7vPZUN+LLPYCrc5/0ZlRbFpMnzSzgnWaOL5Shc+MtVyqjATHnvk205S1?=
 =?iso-8859-1?Q?poxMu+x2ck4MhFGJJw2MHxiX9b1gwv0DRP3PK+luab2pzLPYisK/rTYJ4E?=
 =?iso-8859-1?Q?RdIAprd+GHYfAEYRf91VpD6PXl0tczk2oMSV8s/mwR23NVyae14zZW3rDO?=
 =?iso-8859-1?Q?ek7/UXgenXLjMbBtt4oKIU8z7auEBui0bmgxKDTh3ICIj2H1IIlh7TwHeR?=
 =?iso-8859-1?Q?mH6tyzfMoSDq3hxCAiGiUEVvAV/VtypXrxTR20okjCmrEsLWp7pInym626?=
 =?iso-8859-1?Q?a1GlI5SfcXIBljC5vQvkD26JRy1c3eHFYZj+MSUKcH2sOxs+BBrgNVBhvB?=
 =?iso-8859-1?Q?CsjbCqPJmFa4I7gJ3guHrYDL6/bC4E/2FYCvJPxNsRFYqLnIJjoJB6MlCB?=
 =?iso-8859-1?Q?boK48vxxEzWszsbeR43p5J8dHKmuYyccpG2YgqzNtJgQoJntgMh2O1YR9O?=
 =?iso-8859-1?Q?RHggLLg/JMmASlsDHUt/bdhoGwSF8F6hdm6Rmgtt26Zvcg9rR8iTB5rBZ8?=
 =?iso-8859-1?Q?fQjauxgUE2c4+vVawFTkLhdV4jqKgzc/cRF4OewiGBKSeBjmBM2o9bcLr8?=
 =?iso-8859-1?Q?kURIz7UoA+oto4JaAq+a5uvo7FRbrqxMwaZkoPloC4MP886hSuj1Xw79u0?=
 =?iso-8859-1?Q?qw2vJpR1dDc5ZhDbHIA8AmfsAqK+mr7yp+y6BSdo+bLBMMBK1chtnnn5Rb?=
 =?iso-8859-1?Q?XQ+vLnHh6E+sxMcjCQSK+pecOpnnWwi2BOsi1OKSVtve0Z4udvNQuma1of?=
 =?iso-8859-1?Q?9+ilYnWm6pvCKfS+BOxt0ztEVLgdhhYWdY+tI2nxQMdI/r37G7gqKDLwbt?=
 =?iso-8859-1?Q?PXBVSMi+vw2OFjqr30e0yO4vs2cw03fZU+BcJQI1TUfwLt1PfVw5gZ4VE5?=
 =?iso-8859-1?Q?ZcsJWWuh9IpB+GE5rLLPTgo3aiY3YRNkBoWxHRexxGOJOHEFUAItx/GfyN?=
 =?iso-8859-1?Q?ZMSaOkpIol1QlcZeO0v11MNsycByrfIGied42vMgkh0hySlW1kci3j9G7l?=
 =?iso-8859-1?Q?J5wpI+4nLJRuLT1D9k0rrK6uzpUuh1DyixHCmyDO80DC+UvdIT1e2Z6wnU?=
 =?iso-8859-1?Q?LkkOMKLY2IjIgyLYYgdHgrQZf73cWTw+2DWrPh8gdDBCSOeOX91I8yG4gn?=
 =?iso-8859-1?Q?a7DZYn4k98G9GnM9b0/+FENEFTNlDyEWEc5de3lfRHCFYhraQIxxXX3Yk0?=
 =?iso-8859-1?Q?KLzpsKjaZXkqVjbNyAg6FZo4CX9gK2QyulRy2E/FMOMl3ncqFxtxUS0tnv?=
 =?iso-8859-1?Q?YlrUpeTje94rCh/T0MK2yTk5GfYu0K7JbtcMsHQFK39wsv4tANAYpStFft?=
 =?iso-8859-1?Q?me++CcCBpjClAnesnt30BksQVWCBo3NQhypcm4Io0gp1n3XYEC0YUu51xJ?=
 =?iso-8859-1?Q?9MesahjFAEmXKUeoVmtkAuQlsDMOCjl7OKPfmZifyOySgwfxmpOq4K0Qoz?=
 =?iso-8859-1?Q?1jzzh1SuB5V/HqfPiTK0nH8FXrqxOVT+9JvfU39Rlh+w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9AXeTR+sAmk+N8MS+D0lmqrXoWyEjQvd5qQnkiyp4pp4ZL/8iuEa0l8pB7?=
 =?iso-8859-1?Q?82skyVWL4WI0SrRckxWF4C2qnsgiNLSfcoLK9cvnOUdDNPbSSDXhodibln?=
 =?iso-8859-1?Q?gmlaSRdyf3+XvQe1+v4hom+w2Ls/bRM8xPzVjnwdU7P3FjfefSFWnqrNhf?=
 =?iso-8859-1?Q?7qQd/bWBNxMLTQaHfElQDFhpqM5SvqPJG48+HAdtgSQNvNdRWB/2M9AGe/?=
 =?iso-8859-1?Q?TgdTOl2zLkzKnoG9WGShwnKRRvredMczzkHAP2q17wycqEB9RzMVDE6TLk?=
 =?iso-8859-1?Q?NsuXIedNEtUTis3c3MRLREMVJKv4+WcZ3JsomDlJauyiMX/Avf1wtGmryO?=
 =?iso-8859-1?Q?6DLjE7/op2JzkPyfuyH1TlaB9GzsgiT6RUa98UdJd+YI7jLc7Zw1IakwuK?=
 =?iso-8859-1?Q?w07zVj6aKlsS0PIIG+hTKROEPoTlstIdqaQIJv4YPFej4Iro7bUKD7ULH2?=
 =?iso-8859-1?Q?tzlj15tTPuAkcWPqwm0iKChD2vD7aA2zIF0ePAGP8W/igZpsqZsYIaXz4t?=
 =?iso-8859-1?Q?UJ2E8un/MMs8YkxfGB5YHK1daOcSkkkt1ZFezvFvDrPQJOn2ziLBOkiEGl?=
 =?iso-8859-1?Q?Laib6T6FvWLnN0rOjFZwIDDhUO0G6+ekvdRc9A5oh1gdPTnWPpdp0q59C1?=
 =?iso-8859-1?Q?UtHm7769C9j0unYSE2Y6ef3CCjNmBhdddKXSNQkTUHySlJYtaBNQEqBzDQ?=
 =?iso-8859-1?Q?f5GzTQhAKcB+Vp9oQTDfdxGlJYpWW+YyQbBxk7SZIDpHMKijDM6PbvldA1?=
 =?iso-8859-1?Q?Yh1iGKiyA0INNbS8sadC1DbX7m6/t1R3fSYnuLXZBqYGPGp0lzD/n5fHU2?=
 =?iso-8859-1?Q?eTJ7qv6aNQ4Vtc2q+Lc5Hsh/dFclhneEMNiQqqlAMY0CBGQar0jIt0YDp/?=
 =?iso-8859-1?Q?IKqFzV+PHELihewmEz2ciFl2P1v4xCTAMvGQYSSK4REoyWfqG9XOn0BDIX?=
 =?iso-8859-1?Q?lHjjTcb07hp4vKPgfc9tRR6rdaosJAGBEIyniXR62Gb8mM55KWQ911I/s0?=
 =?iso-8859-1?Q?/1qrknxktmCUJea/bwYTnCEYv93R7GZ0c6f2ZYJV9YCChuhfZymUGdUKog?=
 =?iso-8859-1?Q?FAxtHPz7G/MoqmYQbbziUhczKknsSbTG5Gk3ByGyTMljlBdDbIv/Mnh+78?=
 =?iso-8859-1?Q?Oms6sKl+4ZWqNdRr9Msu9xUYKINm51+DHOX6f/vVaWpfORVtrj8ieMCYP/?=
 =?iso-8859-1?Q?UmJkLjnSRJCw9Du1YG+wWeT3Do9ZACya2/12/4M/Qo42tyIYQFaR63m/XS?=
 =?iso-8859-1?Q?D0Z4KxS1/R+1c+Q0lDGDKkNuXGRg5li0IzWko+hFv3/g2jgPw+3G+9TWyc?=
 =?iso-8859-1?Q?Z2HhSyMXCgEaCzBs2MU23iPGcqdZMd00vDw53S1RERNr9ZXdvxPZQ2JMDJ?=
 =?iso-8859-1?Q?HLzQAY2QpEB6NXV7xIAFJi0aPoHrDMCEId4a6IbWYvSLgnd+vEvOYatc+z?=
 =?iso-8859-1?Q?BQ7sAqpeAZ5llHyrEjNQ7ObXkFkCjXsPr3YJ3YxSDMJXQTiufeYakBnFPa?=
 =?iso-8859-1?Q?algavOjo702uh4f7bMD11Ct7NKt7Tzf5AowDNa8u5bX/D2U2OXJD7C3DxB?=
 =?iso-8859-1?Q?zaNxkVENRQCMvrKx616W/ylvzHTfVq3njmTBA2VYd1LueDSQ1/D+WRwmbT?=
 =?iso-8859-1?Q?1YEtJba9oblUR5zbsA/HvhNiyNmf8/lu9cPhX2T8xa+VFER0kni50DMg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae7e762-8cac-4f01-2791-08ddf6ad3574
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 12:16:34.3028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8R8K8OacKiNJVLSdVHA74R5XaA7FdAH+7OonUEL2uTZCHNrsJCv4usnFBA1YpK+rwNueMSzpySn2rfglqfifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8720

When stopping a core cpu_gic_callback is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 260ee64cca..b00747a250 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -386,10 +386,16 @@ void gic_dump_info(struct vcpu *v)
     gic_hw_ops->dump_state(v);
 }
=20
+static struct irqaction __read_mostly irq_maintenance =3D {
+    .name =3D "irq-maintenance",
+    .handler =3D maintenance_interrupt,
+    .dev_id =3D NULL,
+    .free_on_release =3D 0,
+};
+
 void init_maintenance_interrupt(void)
 {
-    request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_interrup=
t,
-                "irq-maintenance", NULL);
+    setup_irq(gic_hw_ops->info->maintenance_irq, 0, &irq_maintenance);
 }
=20
 int gic_make_hwdom_dt_node(const struct domain *d,
--=20
2.34.1

