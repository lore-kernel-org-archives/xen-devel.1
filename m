Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A5A60A263B
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=jcMWeGfK
Received: from list by lists.xenproject.org with outflank-mailman.1480650.1684423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeUl-0001ab-8i; Tue, 10 Nov 2026 05:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480650.1684423; Tue, 10 Nov 2026 05:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeUl-0001aU-5j; Tue, 10 Nov 2026 05:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1480650;
 Tue, 10 Nov 2026 05:34:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xQeUk-0001a6-6E
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 05:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQeUj-009N8o-CK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 06:34:09 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6af2acba-2eae-0a2a0a5409dd-0a2a450cbb9c-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:34:09 +0100
Received: from [52.101.229.143]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6af2acce-f479-0a2a450c0019-3465e58f4431-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:34:09 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by OSZP286MB1798.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:34:05 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:34:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4oE5+qbSAQXOujbtgnVYzxHOPm04GoDnhwPnnEstLiynDtqYs40MqokW2JxUc40cDWAktCxJINb5PXfqzplrW6l2CzUXliGI51g1Z7otr7rv8aj62f4G/nO7x18vG4Md4w8OKMPFBtiZYnD4NIZ9DpTvi5Iab+xRWl3v/9qwSPJrfZWp8d3YLPa1/mURXfU0UqOMAg5k6ewdjuMaibMS/eOmxtOr2QHDcId4ix6S7FA1xxQ3O3KM+YwSZoZZ8CQKZnjSiPoIcTXVzXVH6R26Ht59ig3bNz/n6yXg9YHSjkCBOPD69mJ9VKFAS5Sfwp7ciITsPXawLG5nV3OsxsaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO/BlyspGW8/fljNwHLFGQiJUQ2rs7BIXzcynWWSm3U=;
 b=xoikGSTy4CoHe7kHd2OJPOr+hM5nNWVH7fj/QQcBuQuR4xxkkkVi9kT5ZpZIHNDUPBf6XwuPUtidSDtxzD4kx/XVfcQdiXhpJ/7toh0oY6teeXwmYaLYzNNixaQ1zqW64u8R2dDciJERYNSA2WsM8ghyYEfVLaHnmxLBjvtw3wOua6Cp6tR/sA4rXQDsINkrh/XblTIum/L+XitN+vrzKtreBd/3fCIZwCek47d1iU0sgIwSuADoZzoTafaL9RrfDaAchKPXiYWDHECCtMqxb+0GEilrBXkp45WQwjJmwIA+6QKHhnW6d8nIUEcfrmyMXwJ+jT0khWEV1zmoyKedyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO/BlyspGW8/fljNwHLFGQiJUQ2rs7BIXzcynWWSm3U=;
 b=jcMWeGfK1i6oacp9axBMS4CuojhB65MXWu9ewgyvDLQo7jdKuLVM6BghdOk68Ea5D7U48S09jXMoPfqwLUJ5Yd6eXatwSloFCmd622DonpxvGWvWl4usb4T+iuRgdi7y+1+YzdmnVZk4QE/lgEZMPnT/WJg/rRZ+OrLhOIJTjpY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Tue, 10 Nov 2026 14:31:42 +0900
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Subject: [PATCH 2/2] xen/domain: Save PMU counters to mdcr_el2
Message-ID: <20261110143142.000049a1@valinux.co.jp>
In-Reply-To: <20261110140828.00001529@valinux.co.jp>
References: <20261110140828.00001529@valinux.co.jp>
Organization: VA Linux Systems Japan K.K.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|OSZP286MB1798:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4a8af2-77a6-4645-e30e-08df3eec3c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|56012099006|261026121527099003|261102123227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bLfIT9L4JxAcZv+aJBsWKK/4Ihg8tDj5GGGchXqBhq/25fRuYjD1ACK5GMun1RQfgXEBs7iKm3Q0l9C76H2oiaSLUuY1QN0VlNbB8YPhIkaaM3HlseWIsyQF9qsBZ/uV193fm2/Zd0Mw56DrF8eZ0QyYLZZ7fY7Ry+/tI9AMTLx3BRKZjV8bzF1/+3EH1Mm0TFjWY23IdjPY4tSjui+u3GJavLkb/kwtiVo9jbGMK8SoEr/i7IYkmEm26NG4sGjattUN0b+EUJVdLxUhSke7ZU87EQdOI8t4V2veRrE7ZBck4dvrnKONwybKK+YI8PIwC8VktPz8OgXPSpec7A7hcvab3BadhuXNVnQsg1Dx97C9G4PtDcG0OD8F/usl/zh7y3X4UwkMfYLlYSa70V8Wj1Z1HHT7kL/tN0w5h/UYqPvzUr5A0/UhuNF2nlnMqIPIJiGh1kgE8hgr5kx9V7Vo9caBDsPGre+/AKYpsGURb39olegLRs2aAfSWTg9tFNBdCpf/k9WVb5ahsOnoXtL/QPl9RhFzY+OGfRHf5ouaJisnH0yaNBUbMReGmQWD4u3RS/Z6HKm4aY38b8paXHLwbu2pv9tlcr11osyQQy91SZrsuXao654wTZ3EgsWgideXhW5qVP0Jn2bodbdey6FoFZpMUIjXjWgc7KAmjQI8DDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(56012099006)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eEKh9tji4tvFlLXnVMkKd3EG/2fqqmgGIh2eNbuF6P+ANVe9XbPSHewDwG8G?=
 =?us-ascii?Q?piIf1YLMUUjVQS5lOg7K5qMzH79dd9NJtjHh/I0q5LpE6ZY4oW5Yt0IfMxt9?=
 =?us-ascii?Q?XqVtU0BfoIzwLg4hzD0IsoA1RHLwYp/P+Iprouy2uT7IHrhWiaF7rfgEAzXd?=
 =?us-ascii?Q?/KDQHEn47CfRDfaa3qHXkPa2PdBtLM3f8Fdtp2cGYJOoiA35FUUSGH5eE+sH?=
 =?us-ascii?Q?M6V+BHhLl8vOM50ZnyItPU7DMNc3JMKPzP8WefYvbKCaxnWdLg4BdbMGkWnf?=
 =?us-ascii?Q?eFGqQ3bS4wyJJSG/28uUgGTzbmfVfMYW97G6zipHUxnYfSCNfZfZ9PJmWx+x?=
 =?us-ascii?Q?1gAfw0rFIqn37dl9W1XZLEG3BMk56aoR/s2p4Ytntab0hKc0C2omDtc4M4OF?=
 =?us-ascii?Q?TATZn+r6Be0mluRQ28QuQDlp59026+1eOlk/HFlQb4E2LC6ykKtAWQjzfOjw?=
 =?us-ascii?Q?2iDKypUK626GuxSy+RYD4W5LapDHX2LRedziSLRboofglFQbbn3KtSa3LbtJ?=
 =?us-ascii?Q?pN4Y7epnSisy9Ody5dtvfUvDNCvmp+MD4VKT+wTjZc3CJipqEHmVnwcHBgje?=
 =?us-ascii?Q?+hcM3vIYVzsPf+JizDOABf+zXAgOsxO7UzCzpEAlnoo7Us4jbk2CujLvmNUt?=
 =?us-ascii?Q?QuPIxlt6mRsat1GVoWL0HcXKqG3oPcAc092STU61BzcgCr+7IK1wvQ1OvHoh?=
 =?us-ascii?Q?Zrb/m8wQxCUYgf9Bj8cbXT6aZNVPQJWwiu3vta9b10Q07MldXeiqea1oAMay?=
 =?us-ascii?Q?3w2oFxQ+4wgBYImcgjnasVFCVGIl3EsO6B3yPoHih5bmNNi2cPA2a73vD999?=
 =?us-ascii?Q?HRACXdwfW55kG7MaffqqkzO2Nf0o5XMOWW+rLmLbf4ybx1qGqzhGkXeXfl//?=
 =?us-ascii?Q?RLFlUC8N0GerIQIZhdt9Up3K57MDF8N9Cke/RmPQZ0+dRIxk1YKnQsIbZpKt?=
 =?us-ascii?Q?nwKSse35/AwLxYGJ+osjZkD3KMVN49Vx4azW2Md5egwn7gC2RxWE3vAv4SkA?=
 =?us-ascii?Q?oZ3aCZABPgmnyrIeLRKYak3+Cj3RxrUboANe78SnuVisgpj1PPaFMfZ/0mHH?=
 =?us-ascii?Q?TZhDFPPAacdMIddHgdGvGTZ5ofjxXGEAUMktSJlBYwMPJ1Pn+Sw+K69KlPU7?=
 =?us-ascii?Q?0D7Ed7zm4l5ZyWjI6VnZLRe2ameCOTmdsy8NAIeq8k9jnklXAm1T9eXzbd93?=
 =?us-ascii?Q?OZ66aevGXBPMU4pi3c+1tJaRC0x6gwWGdq7yfjdvxIbjKLFPZYqFdhIujQDy?=
 =?us-ascii?Q?xqkRFzmDLUA8+3TBXCiScR+wbFm7vzyQ77dBaqSVZe38xBZCZ7kX1NvINzT3?=
 =?us-ascii?Q?L2Zk8g8rOTaWTXMFQr5QZ6u+3+zQuVaEBP1HJyCJRxGb0K3T7pHIL6gXkIut?=
 =?us-ascii?Q?XGYlqribVSvdLkmbY/bzTl6FcYqtBoNvCvjO1JYH7JP6jPxF+nAazuJtHOnc?=
 =?us-ascii?Q?yZdaz5JdZOk+wY3ocZIvUeCS5XiIShZIHRpubd9gMxWqOqKmHpr2mRSrrgID?=
 =?us-ascii?Q?auVXiLKo5KN5jqhD8mN3CAL4ClA6L84G209ZvSSb3eri/XuwMv1WkM1okXPe?=
 =?us-ascii?Q?smcKaCeKBGHmKvIpq9pShXTzvzWJZZKAtk3WEhbZVkWh7nuCMVim9L+yn1DL?=
 =?us-ascii?Q?EQihDbWKX0XygGKPtmiMGh1/FIOqzofKeL2Q5MDRk5zPtciTWW/ZjIxgGB3f?=
 =?us-ascii?Q?H7I/L/evFV7IpMpbwRxcjx67Tg09xnICwVHCzxSCkgluIbNfwVmeUGINB7Q+?=
 =?us-ascii?Q?VtN82btJhA=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4a8af2-77a6-4645-e30e-08df3eec3c2c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:34:05.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pxr51W2gGFS3a0U0kIStKd5FXCgYytmY+gzw53tcTIAfEqqVUnk0nXgw515KYTaiUnE3AwZZmgt/RPtxaP9i1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1798
X-purgate-ID: tlsNG-d25034/1794288849-004CFA5B-29A2DA54/0/0
X-purgate-type: clean
X-purgate-size: 1648
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

According to arm documentation
"When EL2 is implemented and enabled for the current
 Security state, reads of this field from EL1
 and EL0 return the value of MDCR_EL2.HPMN."

To be able to use PMU counters from guest domain, the
counters should be read from pmcr_el0 register and saved
to mdcr_el2.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
---
(cherry picked from commit 8711910a8fb66eb454172a9e6427aaf62bfc3a80
xen-troops) [Daisuke: modified to follow the upstream changes:
 - adapted to b836ef686e ("xen/arm: Hide PMU registers from the
   guest, when the vPMU feature is disabled"), which moved this
   code under is_vpmu_domain()
 - instead of reading PMCR_EL0 per vCPU here, use
   system_pmu_num_cntrs, the minimum number of counters across
   all online CPUs, so the reported value is valid no matter
   which CPU the vCPU runs on]
---
 xen/arch/arm/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 34b5a85f9f..f864327006 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -503,6 +503,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
     if ( !is_vpmu_domain(v->domain) )
         v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
+    else
+        v->arch.mdcr_el2 |= system_pmu_num_cntrs;

     if ( (rc = vcpu_vgic_init(v)) != 0 )
         goto fail;
--
2.43.0

