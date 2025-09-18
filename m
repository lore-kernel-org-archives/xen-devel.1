Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149D2CAC59A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Sep 2025 12:17:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1126021.1467722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ1-0001Ye-Qn; Thu, 18 Sep 2025 12:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126021.1467722; Thu, 18 Sep 2025 12:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ1-0001YX-Nb; Thu, 18 Sep 2025 12:16:39 +0000
Received: by outflank-mailman (input) for mailman id 1126021;
 Thu, 18 Sep 2025 12:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kqio=35=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uzDYz-0001YH-JL
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 12:16:37 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52537508-9489-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 14:16:36 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8720.eurprd03.prod.outlook.com
 (2603:10a6:10:3ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 12:16:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:16:33 +0000
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
X-Inumbo-ID: 52537508-9489-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km6aThQ7Mhvz2C04B/mdxpNvaW/XS8Got8rK1+f1sosjSvenkCLNOX1Sge1jWAIaVAtoLFhQJ3o9l8YYdv0cMU5k1umQcfPrhFQv3Plu7tR0vX4B46lm0AU3SqSazA3shSjufqsqPRs85fVvw66UwQQXl61oUqR2MMpO9s6XNiUrNTEYxtMpbuz+vTYEs6DjgnFrjh8iHrCRAWKZvGbawJDcon4AFPi7nDgeB2/eilUWtjlpQh5cb/D1s0aNZprB5RyqOtfvnsQibNqgai9UdHkqpsTZ6WS3RZWPa77c6s4E9sw38zOrvsm1vRhyBz3ukbQ0CYvcznrD/0q8ghBtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjOMxcbZy0hyh0dIObKoLQ2p0jnzV1Yb02lrehaU3Hw=;
 b=wwAX46GDFuCrUJNGrHOckVW/We5/zneoZp4xUGeB45mIvNDUe0YdoMIg1Z8VfKZeneLCL04EgnWI413m/zb/WTgV5w6vzXC7edB30TTH/vwkG9QWYXV1kSiX5jIjund6hp9f187wubA/TEwGx33BB97yH+yig+41Miwar4kAgZXtK5jYH8NiEaTZNNVkJuuibhXvZfdPYgKh3SrBS+RWHZC/8btzG/bRPZrxHLrTNL16UQTp2e9I54UT1/TEGw41hwz32XHl/kBGdc0JYsuTPC2k1tsMT+FiMElRH4aGfQ8kfcaaXiiHY4HCaPNvkeeeDEwfdv9xI7x8BskdMEVoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjOMxcbZy0hyh0dIObKoLQ2p0jnzV1Yb02lrehaU3Hw=;
 b=eocPpzRTztq3glkk+xS8o9PbVOf+aptaFZrvOlQCcZGFe6xXexqgVh4rwOf+crVqvtu2Sqpvl9G43zimJ3iG9p0TlYWOEq+LEfEc2ay2gUzLetqOgzABOjQLoLT7Vnrky2qC1z/dYuDeo0FzweJYcF6hPL1noqLn16ELgTECGSeePtoIziSa/TXVHEhwWUE/7zHcyvQy1HEqnTXA6kdvhNxQTc509140EymR2IwWZ6EP0s8Tjnfe9lATMNBfBAWVo4NW7KgBLwX/MDrk7ojt3BAPC7BJskIXm8xOfQwlCovmF4pT+8EVlzFawkVa3C7oUJ6NKP9YNLkcolWqPoDGyA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/4] arm/time: Use static irqaction
Thread-Topic: [PATCH v1 1/4] arm/time: Use static irqaction
Thread-Index: AQHcKJYSTyRyVCV94k2TjQUv8/ENTA==
Date: Thu, 18 Sep 2025 12:16:33 +0000
Message-ID:
 <9d10949d60aa930d6b281824f5879e804ff18918.1758197507.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 31f31b0a-6ea6-47e2-99cc-08ddf6ad353c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YzNTj8o+jkNn5B5E1TRG6hh3zQAfk3CsyF4ZnoeQBPtKBeP2YaJsfmFotd?=
 =?iso-8859-1?Q?BPI0j4ug3uRgL4bdt3WhA3vgbeGZK2+n1yNjuL9R21q8AK2oTH19lzPtPm?=
 =?iso-8859-1?Q?nTxMNfRR3cb1RLScMZN4SyVh18eRoTRUXon8COPaip2SO6lFkDj3Qn0IP/?=
 =?iso-8859-1?Q?L9tn/DjN68ekmukIDY++CW98ryDkyNFgKEjmfwk6xpv+FL5T6OcrY7qQik?=
 =?iso-8859-1?Q?9F1jfErNn8DHL1SVL1PYrefC9/zsg9VZoMAki5thHEGwtv1p7oQSJiTJQy?=
 =?iso-8859-1?Q?BECtLPe7yNa1+5CiN8CV/xp9pcF4722YQ1qTK7QdDoity2UZH5K6wuHHLB?=
 =?iso-8859-1?Q?ELJhyOtnW7viHfEZQbsQwqtE97KFwAoYlpu/VpVmD3Q2ppSFHSDyX1BPcp?=
 =?iso-8859-1?Q?Fsk811+41nzCUzHBwDwq8Ipt88vVFG13p4mwWf+PJqgjUjAc+o5TQ97K9I?=
 =?iso-8859-1?Q?YxzBH1rwK/GJFRFtypmV4uG6Esc0iywwvyHKmOGZ4OnoiDmQ9ocnvaNIvc?=
 =?iso-8859-1?Q?Oqr9RSIPJ1YdyWSON9xB4ktgTcrUfAmeHbnpiPfcz03hXjzc7nt6o0ZuSV?=
 =?iso-8859-1?Q?IE9uNvSuKb3hNwdDm5szNtMHzFNt0hfYfHlaK/lmkIabyRodW5B1DubaMl?=
 =?iso-8859-1?Q?DKIPwzTMNgy8iCYInj2RjRkmH26WSdnl7l5c79pGHjr7yo6nztE3SMFDYC?=
 =?iso-8859-1?Q?qybDdPEynADvUxi/pC5nUtJ4ClJ6sb8m7SiuQ1rop55Jr0Wh76OskD9uuz?=
 =?iso-8859-1?Q?bkE3UxD+i/3jO9FHrzsKrvJHKdgagZe+tGV6wYcSikIPfiMUxCIrMPEj36?=
 =?iso-8859-1?Q?6GX3DlhLCIfmYSUKOpQBSCl0hziCRPukK8WAjt1Tzjyg0dnx4x2yMl6OBO?=
 =?iso-8859-1?Q?bMrCoap+hJYgVTEVaZ0+/ucUZyLCeB7Pj9T4yoImElMkFPHIwQvTjACK0c?=
 =?iso-8859-1?Q?Fr30kHpS6tR4B4MvYvFPdt0pdRtEu0Ce00vZG+hXCZ5u8gqrYZ+vWunBX2?=
 =?iso-8859-1?Q?dRnONAfAGNK4DCYYa3ytyyaBYW2k78O2Q8NVQfVaIUWgbh14MmZkKAAs9p?=
 =?iso-8859-1?Q?D6Zg7wRMXk1KL9PNlODwjzq0lRNdsFMAOp6hX3H0zpduodb8J0n0nLvPIP?=
 =?iso-8859-1?Q?5skQUOfI12lVNE7p9FBto/r+1sijioTH43TlIsRcwDsuoIZfKOCJmRiWbd?=
 =?iso-8859-1?Q?dem7yxJ2bkSR2NL6p/VQM5kzeOjkWlX3ZGVbjBZbhXCdXOLF94dAskmW4n?=
 =?iso-8859-1?Q?PkAZM4FClEfAlXdQv1zGDe0ll3GkVe1dv/CqfyiVEyIN33q9qqwQMxtrWg?=
 =?iso-8859-1?Q?uhZWavcBwUKu2OozvrfjLWJ5oLxnQykof+x/ClIhfPYKfwYWidSjIzAVI6?=
 =?iso-8859-1?Q?XXF//YpOPSOb5NdCP4Q2u90r3ySXbvUirAI/S6FaU8rpUAxLpVcnJVGY0d?=
 =?iso-8859-1?Q?SjQCbwWWqQP7Tsvs1X1W1JaQhFe6HySzpQLCfjYmvYIU9rhuVoVPjILtxL?=
 =?iso-8859-1?Q?xHCRlTI3WHS3+Zp4rSBBTqreunDFk1hQi1eY4sIEZPKw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f1/9zRhD6KxfdbHVyMtGGcyelbzJq28o1cTn0YbJN9/DfjcrIOQ+yh7/fJ?=
 =?iso-8859-1?Q?qr3oXgim8LBOwU+eX5OBZDwlzocYTYW+n74ycZAzswojkddp9/yVc7KjTc?=
 =?iso-8859-1?Q?zqW3JMHQthDpQGG/ubWMQBEdfSehV3/aj3CCUpm4pMcgNGfHecbtxEuOkD?=
 =?iso-8859-1?Q?kR6b806irkxxE8ysjT7PMvRi2IS7hTuKIKa+z0vUFxwDFfxAQKJmjv+YMK?=
 =?iso-8859-1?Q?YmjVt6GHEklVdK1argok/HVVUs2tt+clB4ovb3S7GyVin2MpVBSl+237TT?=
 =?iso-8859-1?Q?xPgW6MqRZCLEinPdcGrqF4rFypORD66C5XM0TmHFtPSLfwA1vHmYECla1N?=
 =?iso-8859-1?Q?vJ+4D1qGZz7FBNoeWMF9NT2swQvRMewDDH2kkJ9RfQiVtZ4irc9IVjgmcN?=
 =?iso-8859-1?Q?/Cu60UFam2LLdHGJuS7Mw/oBsoe1fFswvTitGTkXxRCPLc4ymv83ndnIse?=
 =?iso-8859-1?Q?Nic8/5EUnORSj7osz7q1pZF0JSOdOcm+0+nGHG2RXTDNP6m8zJ9bN7LeFV?=
 =?iso-8859-1?Q?y4p+YuWrMSNIOkyw96gvEseqNj1zcrb4yRl3WhUo5rCBovW5CJQ4FDO856?=
 =?iso-8859-1?Q?ggRehXP3lio5vBM8PkqHnHGWo1G8AVDZ7PIqv8ZzjtKZZSQflNcy8alL4N?=
 =?iso-8859-1?Q?mSne1cev80hH74HNQ4xsaSCR5ZeYmLBTz4OpsDgd/KR/cRpuHI2MBCmYTc?=
 =?iso-8859-1?Q?bL3A5R3QDmpfr+dCanIl6xKi+5SO3Jx+xtszbsKQUCoH3z4XPSG792QZxu?=
 =?iso-8859-1?Q?Z/u/lCYCz4WVadGpQM1JN3CSBRc6x90Qhc88wltxIjQlfWhhC/KFpF9Qyd?=
 =?iso-8859-1?Q?ex3IjtYg/idNmjAIaR+hOh7cZO6WnRPk+jolqHu23+kLPxijpjzs2+kXwx?=
 =?iso-8859-1?Q?eFXdtQoDL5FcqEr4RlfsqdrrDW+tkMoh3KdaPA2HiBIggnFP/HzEDQ05a4?=
 =?iso-8859-1?Q?PuX77oFm/DSoUE/JNXpLpB5Rw13R3cChkaBuq09DetI8JGsfqdTCA82QNv?=
 =?iso-8859-1?Q?7V7vFz7RLqWlXg85WU8hYmsZTu1aABncrAD7iuUj6W0wCKlWHQjNauWyZA?=
 =?iso-8859-1?Q?flJ+XkWEPe1d0ANThdj2u7wkOIIMB+38K0UoOem8hgsKWlGBGGAUeT2sTP?=
 =?iso-8859-1?Q?BScAHTqNTOqSR6vXtJbgb177InEUnU2dpcHZT9tifKlVCOZOFWGuN69pT8?=
 =?iso-8859-1?Q?/Zi8HHiFGoi8R0a6igtNa3/W71guRHfMYQjyt9uTsHcccDHUOkn88wmCvf?=
 =?iso-8859-1?Q?JpPaSC8HhrBRbY6tlp7CjmWW6zSd2yfAj36VkBnG4XcwpWLX2gmuPmYpde?=
 =?iso-8859-1?Q?6DG3wu/QSItodj4dx7kMgq/P2ztizKV+m7Q0aq7E33U2cZ3LWkPAiaa9gZ?=
 =?iso-8859-1?Q?9x4FiL/1aywP7I4U/Mrkv1cV23rUHG2GbxUWlSHMdg3qWD+ArQhX9LT8PB?=
 =?iso-8859-1?Q?8Q25y/Rfu3jjX3R9AGzm5epW6PdIluJ/6hF5h3uQZomQS2M8Mn0g8S/YNF?=
 =?iso-8859-1?Q?BiCzGqWkc/OlJWk7/6UWhrSYp6rcWKq98oYur09/QWsc5oSJ1X2l15iYlO?=
 =?iso-8859-1?Q?ZAjgnLtD2pMvv/9AKzJAFaPPNngIdjWWDE7LnEVZhzy4b0jjW3MaDCdd23?=
 =?iso-8859-1?Q?qAOMOhrjT0d+r8oRRNSHujGX1RF6B2mB9xwWfgUKqv8Md1ncmeaiEE4w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f31b0a-6ea6-47e2-99cc-08ddf6ad353c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 12:16:33.8766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FHIFFSrWQvE9ad+iUzBbqAjkCaPHJjjGORDkVQBmacKdV3QURPmy8lhckE4dX12Mq4jeQGhUMb25QDodvMUyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8720

When stopping a core deinit_timer_interrupt is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/time.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..6f215de210 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -303,6 +303,20 @@ static void check_timer_irq_cfg(unsigned int irq, cons=
t char *which)
            "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq=
);
 }
=20
+static struct irqaction __read_mostly irq_hyp =3D {
+    .name =3D "hyptimer",
+    .handler =3D htimer_interrupt,
+    .dev_id =3D NULL,
+    .free_on_release =3D 0,
+};
+
+static struct irqaction __read_mostly irq_virt =3D {
+    .name =3D "virtimer",
+    .handler =3D vtimer_interrupt,
+    .dev_id =3D NULL,
+    .free_on_release =3D 0,
+};
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
@@ -314,10 +328,8 @@ void init_timer_interrupt(void)
     WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
     isb();
=20
-    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
-                "hyptimer", NULL);
-    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
-                   "virtimer", NULL);
+    setup_irq(timer_irq[TIMER_HYP_PPI], 0, &irq_hyp);
+    setup_irq(timer_irq[TIMER_VIRT_PPI], 0, &irq_virt);
=20
     check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
     check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
--=20
2.34.1

