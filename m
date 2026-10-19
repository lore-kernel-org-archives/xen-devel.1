Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3916CCCF2E5
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 12:05:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454126.1667629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIm7a-0008BQ-7J; Mon, 19 Oct 2026 12:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454126.1667629; Mon, 19 Oct 2026 12:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIm7a-0008BC-3s; Mon, 19 Oct 2026 12:05:42 +0000
Received: by outflank-mailman (input) for mailman id 1454126;
 Mon, 19 Oct 2026 12:05:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1xIm7Y-000861-QY
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 12:05:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIm7Y-001Htk-76
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 14:05:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad6078a-8faa-0a2a0a5109dd-0a2a450893fe-38
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 14:05:39 +0200
Received: from [148.163.151.68] (helo=mx0a-002c1b01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad60792-f659-0a2a45080019-94a39744730a-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 14:05:39 +0200
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69J8QPXb3199047; Mon, 19 Oct 2026 05:05:35 -0700
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11020128.outbound.protection.outlook.com [52.101.46.128])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 4hc83eugw8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2026 05:05:34 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by DSWPR02MB11441.namprd02.prod.outlook.com (2603:10b6:8:354::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:05:34 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 12:05:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint20171006 header.d=nutanix.com header.i="@nutanix.com" header.h="Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector1 header.d=nutanix.com header.i="@nutanix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint20171006; bh=GTsNITGc20yNxz42lJwDN4eLhxBiwmVbhEf4oSGIB
	NQ=; b=AIr4/LndUBm4HmJM7ul+XGeaMU5cKO/EyQ3higZswTn2COwA2xPROmF2/
	NLFJuARM2I5XnArsBhLUQ+0vCEfk9xGZRd5CNPaSn08HKhtYq06IxENhIBL4xyUK
	gtJfkgr9HEtjlwQWmGaHbP1wqL01HXSBo2ry3szsdDwAOJserTqljCvY80kXhuTE
	AbquMBQX16YNdiAVK3Dcie8p52SXD59a7S1bwOpNM7c4YTRCNMqohRrt+uObgwx7
	IvOAHEYVttFDQRjrwTRYXspdgptvZ40477VOwMOMSwsWeHX10f61A4qVzPS1YZye
	QNSe5N+ivTP/TXdjn4vfkqb5Lt+TA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNYYGKNIeO/QO2RF0m3rR2mBXCe0vKWg0oLgn7+ikThtjSS+f1ApitMP+R1KotOQD6OiDk6pvghwMA2d/SXs6Mj+BkH/E+/y3Zy0djY6CJQ/dUCZLOpy61gkttkpVnMHRt4r49OGODnGZRJNa35jdtGRWYphBM3eXuM+5i8Zz1SYqBlImJv3InEEVjWbmrTYXDT6nfVq/WOro6u0oDn1fTz1Cx005ceu3xQoTCEVqZVsMGCZVwl7fjwWr0D+otuiKa7rRq7XTytHwQ5JdeuxvFiyKybJcOtVhaJXeuGiqWlDckLOW3Rf22vpLKFV2T25SKmMPkHX2ibgCBF28oA5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTsNITGc20yNxz42lJwDN4eLhxBiwmVbhEf4oSGIBNQ=;
 b=chGuxp2u/uX0f6RHhx4K1oCFe9uX7hHxLiwvADD+hx9MyAati9yYsfoat0n9XoVBKG/Uiv0EEBbnyRMeep3r2hGaFiBla1taVUMYevzeFpbftUQXptXUkKT5G9ZDlMi2j/d4F6aFj0aVlZdSG+6ACYK57tL+9E/5MyIIuFoVi3eEqJP2IbHcYJG3x1zVliZyq8lDAW0FYzTLsCWijVNK+0nLvtHCywYhV7uA+CyMitaE/QN9e7k/7N9Nt8pS6TsHXVssCmRXT7c6eMh0CeF6TXfPCAegwWggvUD0zUMK5q6tS87aNIa8X7HKSAw5ME7wewe1hoBn/yHASEscp1y8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTsNITGc20yNxz42lJwDN4eLhxBiwmVbhEf4oSGIBNQ=;
 b=f7+ZfV1gkjdoHPLW2e8jyryXyZgqABo1KcYQPieCIo0X7qYCNqrrAyjug/dSQ4gBIRurQEiOB+XLV57Wt0ppNdGFpejC9mZxijcEEztm55dJJSDqxs3C284s7vuCy5kBfsVD9/wOIlK/tKkKMiOi76r0CrgcMbOPCAXcSp4FM05SiSAyaNaDmFZ+gb+9bDM7QiIyuwP4w+75vV9/z6oK/k7Q+DvkmJ7H6w9iCAW0+TXZ8TkX1l0YCmZeqrcwlVAG+gonWIVCCZktp80S2A16hwMkRgWd2j4BeLpct5sKpRirqJAf4PfkrS2toSXrscu1Xsiw5rbAlb5al6esCUshPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nutanix.com;
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH v3 04/28] i8259_internal.h: rename PICCommonClass to I8259CommonClass
Date: Mon, 19 Oct 2026 13:04:36 +0100
Message-ID: <20261019120517.1448687-5-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019120517.1448687-1-mark.caveayland@nutanix.com>
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|DSWPR02MB11441:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fc8565-1794-4941-f297-08df2dd94743
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9ds5idlkR0nUBu/o3Dp3dLNE6LnVxdlUlOGpi0bfXcbKcTWHWzoK8yrs1EtLCksYrr2s9sDp3Fa6mLjRvM+qwIEIdWn/wF464UJuU+2IVKOjMTww0y7sY08H71unzSBJXCDfhHqeWoUm+MA7KY76UpeDocoQ0SonKPYW4xl2r5KsdffFAFB+YETR9Cp9WLFlxJoXb/ZBgc64URjjVaG/FYI6rS05dPcYZL4WXlqmI4zgI3c7gOHL/XgM4f3LT9P7UD2ZqSx4MUoeFpkRaK6RWXLieWu98ykGAjYvA4fSVT5N3MOJXA8PJVC1fmpBWvpEOdro7ajbI9lu67cMGOaDyi4PPrtRxOKwl++mq6TqX1OWIMATzc7ASLVY62J+7NlJTGnUFhIyAy/QWEYeJaqpYyUI9MFGg17WqKvmJVKNKHxTkwrqVAV2iQheRaXdMQgSTEApEigymdl2yrs7++7Q9BLkZWyIebcYMnarLRnu/OZPZ3dGwevM7olSjkv66STLPqAq/B2a9nH139+H9WTsNCXp0E5dShIyw00iJehiNuyjwaSlUUjgNwxC1Gu6rckbqs6GZdHsmLe+Cs+6S/BPeXqPmLZ6+D+Gq2PQkOwt45MqIby02ys5nyPfgiX2yAdZDgEVN/fhwZ9ZBTn6prv0ErkbmZDaZuySieq0eAScyk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AGd3HmO68XxL68cdXTgf+lScNdNdfMh4WuDpeDMNt5byIr/ngQgN6xVcs+Kn?=
 =?us-ascii?Q?wGNq4BLKkhnLtn32hqMzlQtOtlGKs7fT+VfsBM6GPDRtJboWpCcnrv2FzdqJ?=
 =?us-ascii?Q?+eG9/vMBOmG7xMilc+A52zVTc09LJbwAW4fAboxJpVtWtbBxRKH7GAAxb9yR?=
 =?us-ascii?Q?5zYUlaZsONXp0nUym1VVW7lsm01nN6DFotaNNbOcvzr95oIEj/CYTLs+kHbL?=
 =?us-ascii?Q?FDedjeebzPJE+mqf1wKhhU1rLh4J9b0X44ZLE0fpCXMeXTN98ihwqlPm3rKO?=
 =?us-ascii?Q?8BplAKDVBrmABPEi5UHzTmFVSjrER3QCJ1yYsy2snMAY2o9o1z0tKiyDqeRH?=
 =?us-ascii?Q?wTsvUnbgYliQrVV+spH5vlfJlFiePPO7WiIS78OEi2valGTnXFmWDMXhO2Ws?=
 =?us-ascii?Q?0y5ld9ymG3e6N2hXbVjoHRtxWCRETkP4O0eIZxjg210uauuDQgVShk3G1Cik?=
 =?us-ascii?Q?1tjMSPLaPxFChwqMmXrLgnD557oGuXWRg357jdCiQbQcI4KS3XlvdQJm4hjg?=
 =?us-ascii?Q?7YruRkxDgvD4h0vAeJ6z1i7vg1ejvjFJxtjKM3rzT5VdphqCNCb7tr2YrvRw?=
 =?us-ascii?Q?i+ARNVNZaEqtRCAeWFUi6kSIXd5eBt/0s36nkkQ1/SUY5srQVgLnVm0Kfzwz?=
 =?us-ascii?Q?teJSdmhhsbxd+TDyhf9njqZl0AkHzDERQDwCfFFW5af5H5b1dGB8oBvob+wo?=
 =?us-ascii?Q?H59Yq3DywPCBAxYk/9TlazJ3W7X0Tc5vD5d3XH5TtBbaeVTS+VACHlkww0kX?=
 =?us-ascii?Q?rsGolcTccLuQRtp6yGHNGYNdCCUFbMVT9pxxiDp4WyAwRIukMxUsWaT60eDc?=
 =?us-ascii?Q?RRcfiyW4sYfBJ55N3pq/so+tQV9YvpOkxELHFlT2I1jhm9R2H9WvvHZbSWF2?=
 =?us-ascii?Q?BbTIxsaLc2qVViNfppKa8L2dYXV3AE0FG3HgWr18jdOuLKj4WFsHOq7Ju4Ye?=
 =?us-ascii?Q?zRZ5eCXob6Ou8sPDOvvCDBZCo49uDBjmJhW5/Qk3mbRq9El1N/lZQCXvM56g?=
 =?us-ascii?Q?ZR64boQFBGMzuUhbqUQutOBBEVZlpmLv/mJcS2S7WkI8udRzmMs4+isUVcvA?=
 =?us-ascii?Q?nwSRo41dF3jbSayqqoEI5uWCkFrlsiTDm490/1B/QMOiEWZl3rWPqFFCFwa7?=
 =?us-ascii?Q?S+EhpHlcmizWqxda5PBYVQiTykvbrAeeFQr1dPYj9csrsjcWCUZiFXPVqDh7?=
 =?us-ascii?Q?jLedps0mgukMsDJ3CYbwIZQRqbKkJp5FOmRBrkkYqNch9NxIDQ8Kr1ZQbe6t?=
 =?us-ascii?Q?Apivw5fiWX0bUx1eSBF14Tga89GOxlFIkLfVwZdsCXmalna4PhBs7gC6x1wk?=
 =?us-ascii?Q?TarG2zQRSahj+95zxS8uQeTaY9G/ptYhnXVO/ahHDOGO7Se83zInjIYTGezm?=
 =?us-ascii?Q?nM1+Yb6CpHBFxzJqmamZRj6yqg9egoUnRz112/XyWIvxdX4vmoZLkDJOSB18?=
 =?us-ascii?Q?LHEnw8YIQ5G1oYSPlmyuZhWjhTzxkAxWzB5K/Zy5/mlFvuAO9LNhtdGD17U0?=
 =?us-ascii?Q?cK1gOfBPpcu2IITCGYrEokQkcvATut8d5nlJUEuloeBBgq0rGmnQzx2qOL1u?=
 =?us-ascii?Q?hm1n/FnKmXvVs3tFrJAtjFqnBmhxiIdHbfeqLfzzjnHzg9StLgbwQyiFhVOe?=
 =?us-ascii?Q?VB8B9htIey5TNuG5gifHTulU51QfId9nEFb6Z8MJl6MflD6iwRCrfUeQRgKq?=
 =?us-ascii?Q?idUz2PtcsKA/9lwaasZSLeT/bu3KrKyacMaGndJqp8GA2/ifFN/GZKuZ0db7?=
 =?us-ascii?Q?nafbyCWkFh3/XX8yp3cT7ciavL8ABt8=3D?=
X-Exchange-RoutingPolicyChecked:
	NL+NcRtx/WPEu3esGP8DKsrZd4CfGBIQT/ur5p3nHYZGQye1hKZZQQxSAV/SDXkIcOo9ROojHzwbxwnC1FQ8r7f9G5kr04LPJhf/xU6wZJceU4eB2oJoi4+1+Byudas6hFeNBLUAduz+91lXmKiW88jBBSjX0hnxi7AQT6n9iAoWyVfHHxOhNE5XvdLvIA8Z39Wy3s4/2DGCvphAsTDO5N+f3dyyGRsBM2HqZQ5nDHIjBrxPS2xpzmfvDNRqybAeJ7fsJ6zO0lzEJKmQ94vHlnZtiDsrFgzr53lkbjIUD05UtmGnDa17Pp9PM4YblqrA61rwPw/Nom191wbz1EugfQ==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fc8565-1794-4941-f297-08df2dd94743
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:05:33.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHPBp6NamtXVvcAsDznit2I8I77ie1mXyNqWRpCBdWl2F5VK/VI3AGbsWK6wLwaYY6sOhaPyEjPTfzmQzUch3okjlq9kKWLeUODVFHpnVY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR02MB11441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfXwSX+kaoFnatL
 AzzfSo4xoMznPWZv+j0Prxty3NIStoHfpS3pEu35gOEJtaOPf+KDjuNQtVpwg9CrHqX1bgBlb+v
 TZSny2ZpXrJVS309FYRPCuxDCfiGBFBIKIfdO+N/2W2icHVll7FVTLfGCYXM9vZDMiiaD1NkVMk
 K0jESeXO9VxiU7R6VwvPewwD3El8BoIuoh5OE09IHlpN+ABffEH/YDus+3U8MsjMCI9qB7UfFFx
 0echVDEBTRiI5+CCrCWOHb0ORWF8UNJz9yszm+BbeqopSJlv3jCUvRs5quNAnhJLrpMXKCF9aE+
 1yVn5G7p9ElzmdO5UkYhtjRANogEyzPlNMCoravfa+xvn6ZdmLBJVJwgQvzD++N3uDhkzjT8iuu
 ozY2r13sMx9SfWVVHGTDtpPp2stk22BuE/zUqnQwengonkImVyft3no6tDLSKylY1ZV3nlOe8s0
 TGncewxfeOYtPfUr7zA==
X-Proofpoint-ORIG-GUID: OPzSNOkcSE3aUA07YuHtOQ_pjdw018Eg
X-Authority-Analysis: v=2.4 cv=RI8mjIi+ c=1 sm=1 tr=0 ts=6ad6078e cx=c_pps
 a=gFm19s7yh3VV2LjzJhowOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=y4UcunY2MAxhM4LwGdWI:22
 a=64Cc0HZtAAAA:8 a=KKAkSRfTAAAA:8 a=qh9Ixq9Ib_qUO60TQ2wA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX/PrXe4l9dJ2s
 9MfIXz4eQ0IMD14wM/LWqfHqlAcfcG7+WMaeC9z3sEVJ8hKn3ipLXlYXlYBfDUYuSmdWlHIMJ2I
 0PzicdB2SmAgXOloD8wBmCF4ahLWVEs=
X-Proofpoint-GUID: OPzSNOkcSE3aUA07YuHtOQ_pjdw018Eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-c1860d/1792411539-D775B87B-6789E03E/0/0
X-purgate-type: clean
X-purgate-size: 3291

Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/isa/i8259_internal.h | 4 ++--
 hw/i386/kvm/i8259.c             | 4 ++--
 hw/intc/i8259.c                 | 2 +-
 hw/intc/i8259_common.c          | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index 7a2f9addaf..e039d6f067 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -32,9 +32,9 @@
 
 
 #define TYPE_I8259_COMMON "i8259-common"
-OBJECT_DECLARE_TYPE(I8259CommonState, PICCommonClass, I8259_COMMON)
+OBJECT_DECLARE_TYPE(I8259CommonState, I8259CommonClass, I8259_COMMON)
 
-struct PICCommonClass {
+struct I8259CommonClass {
     DeviceClass parent_class;
 
     void (*pre_save)(I8259CommonState *s);
diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index f10643a120..68607d721d 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -29,7 +29,7 @@ DECLARE_CLASS_CHECKERS(KVMPICClass, KVM_PIC,
  * @parent_realize: The parent's realizefn.
  */
 struct KVMPICClass {
-    PICCommonClass parent_class;
+    I8259CommonClass parent_class;
 
     DeviceRealize parent_realize;
 };
@@ -142,7 +142,7 @@ qemu_irq *kvm_i8259_init(ISABus *bus)
 static void kvm_i8259_class_init(ObjectClass *klass, const void *data)
 {
     KVMPICClass *kpc = KVM_PIC_CLASS(klass);
-    PICCommonClass *k = I8259_COMMON_CLASS(klass);
+    I8259CommonClass *k = I8259_COMMON_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_legacy_reset(dc, kvm_pic_reset);
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 45db87a2ad..547e86c5f4 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -44,7 +44,7 @@ DECLARE_CLASS_CHECKERS(PICClass, PIC,
  * @parent_realize: The parent's realizefn.
  */
 struct PICClass {
-    PICCommonClass parent_class;
+    I8259CommonClass parent_class;
 
     DeviceRealize parent_realize;
 };
diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index 17040bdb1e..ac8dc7cf00 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -56,7 +56,7 @@ void pic_reset_common(I8259CommonState *s)
 static int pic_dispatch_pre_save(void *opaque)
 {
     I8259CommonState *s = opaque;
-    PICCommonClass *info = I8259_COMMON_GET_CLASS(s);
+    I8259CommonClass *info = I8259_COMMON_GET_CLASS(s);
 
     if (info->pre_save) {
         info->pre_save(s);
@@ -68,7 +68,7 @@ static int pic_dispatch_pre_save(void *opaque)
 static int pic_dispatch_post_load(void *opaque, int version_id)
 {
     I8259CommonState *s = opaque;
-    PICCommonClass *info = I8259_COMMON_GET_CLASS(s);
+    I8259CommonClass *info = I8259_COMMON_GET_CLASS(s);
 
     if (info->post_load) {
         info->post_load(s);
@@ -223,7 +223,7 @@ static const TypeInfo pic_common_type = {
     .name = TYPE_I8259_COMMON,
     .parent = TYPE_ISA_DEVICE,
     .instance_size = sizeof(I8259CommonState),
-    .class_size = sizeof(PICCommonClass),
+    .class_size = sizeof(I8259CommonClass),
     .class_init = pic_common_class_init,
     .abstract = true,
     .interfaces = (const InterfaceInfo[]) {
-- 
2.43.0


