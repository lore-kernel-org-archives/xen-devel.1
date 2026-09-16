Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8620C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 10:46:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422682.1648110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6n9R-0002Sm-8P; Wed, 16 Sep 2026 10:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422682.1648110; Wed, 16 Sep 2026 10:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6n9R-0002SQ-1P; Wed, 16 Sep 2026 10:46:05 +0000
Received: by outflank-mailman (input) for mailman id 1422682;
 Wed, 16 Sep 2026 10:46:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1x6n9P-0002NI-Jc
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:46:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6n9P-005QYS-09
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:46:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6aaa7363-8faa-0a2a0a5109dd-0a2a450c9f74-22
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:46:02 +0200
Received: from [148.163.151.68] (helo=mx0a-002c1b01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6aaa7369-f479-0a2a450c0019-94a39744a6da-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:46:02 +0200
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68G8j54T700548; Wed, 16 Sep 2026 03:45:58 -0700
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11022122.outbound.protection.outlook.com
 [40.107.200.122])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 4gqa0ka9yy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2026 03:45:57 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by PHXPR02MB11343.namprd02.prod.outlook.com (2603:10b6:510:3cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 10:45:56 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 10:45:56 +0000
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
	proofpoint20171006; bh=JTc6OttRkqFr2IJN61bUNmzaH+my9K//Vu9fu/m3Z
	Oo=; b=HPSF88vcHpu7V/6CCbEPY0gTGaylMCyFJnShtb5Us1jBlFEwmLF9UF7fT
	dXsTg9f6OIrEibOZ4HSP6i/tpZFQX6CO16VxXk+Czc09EhoBsTo+imeyPx3ewVHl
	Na56EQeUQ9Uh4/vorX/WdeUhulUj0GtvNEYRDKXzyR96rXQtbEJz1KZNu/foRSSN
	ukkFP5u+gGRhOvMMvI1c4gPQmR7eXvfskk/i3pLAwU8XE+nMVIkMAWLIm0pdZOld
	cMVReFQEq/7o6FAIk7Pts7/owFv15049fuWXECv0SifZuwslkOGh+ktFTjawWpY/
	l+/dAmQDooIHRsEEQ89vlh5mu18LA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWBUpy6cJOv/8rH4IrKRao34eGCsqct/+iCDZM9JNMAxSmJF1a0LqXul+2BdWXURctViicXLDdoGRHqM940YI+uxTOeD8ohB3VOSqUCMxF0YZsq+FGQ2fw1VEqsCWIzB6Z1hczCVwhDCMtIk2hAWfao0tSsKC5jYvDv9inVCClpl1aWXg+hWXTls8C8waV01woEvxYrqKmaAtzT0Cgdj6E4xs2fzKGhV+LnsFNRw9zrp5zs6R1EfljfSOZQKcppJxUTcc7+D/b4+WQz6bOGOhKlaTLe+htC38ysbbVYCLs0kWkSZfYCOTYN5it3EodCfGTy7h3hq17A9rHeDEz72UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTc6OttRkqFr2IJN61bUNmzaH+my9K//Vu9fu/m3ZOo=;
 b=VvDbG8iywoiJWTfQkfw6b4ogjC42TCswTdDfqaDkLw/NVSXLZ2iwyHFHYtluE/fHhiE7EuIuEs89nTltfhvd0w0BZBHYH/1Gu+HjmM0Hz0hKNnGqJ89qKfXm2wyP7SPc3lcvwUu4bCCfjVvJG8IbOO3qq0EiOPcpz/WtIb4B8ERJHDsVXzqiQiAFUqtJ1iLCDz+JFfZ1mQv06VXdOIkCT+K6dPdTAXXVe5lZ+zyP92sc5uoIdfC0StOk4vDMv61LvuxQf8msDqPKufsrhoMqk8xTW6+HcVgjjxs2w/WwtSg7w5rfwFfwfAch3wjXSQu1NKcpbDlQq9WZ3DlgSnPmfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTc6OttRkqFr2IJN61bUNmzaH+my9K//Vu9fu/m3ZOo=;
 b=iLm1wj2oLJHdcLkjedcYjgWDcttr2XQEu2rdQqgZhTYtBSE9WcEg9JRuOme939+lBNYCxy2WYKW83Q7U57yVWEHzjVe+awcANQo5wqx10iqTkKNtKTD4GCxRLEqfG9eOdYsQK/pEuzDrJO1PRQ4j49ZxVYQh+wWlC8o2SNNi6JcdhDXLiC04KswPtyNLLH8xCBGxnGqhKiAgtIjyigDbrZ3ecy8zGjCyvLtvFFPz5X6Ct/8lVwPStRZWOD/HR2QRfDXSAQ3zOo2bJrl2rVXeYuzd1CpCxRomMvu6pf0gtaASqRFoRxvbV8wiJ+dZC9VXJXzFLAFAJSOEVS6c5rUUlA==
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH 22/22] i8259_common.c: add missing 0x prefixes to "info pic" output
Date: Wed, 16 Sep 2026 11:43:50 +0100
Message-ID: <20260916104435.600211-23-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916104435.600211-1-mark.caveayland@nutanix.com>
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|PHXPR02MB11343:EE_
X-MS-Office365-Filtering-Correlation-Id: b282492a-627a-4b7e-460a-08df13dfb024
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|3023799007|10067099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	o5fIuqwFZ6u2uLBnHwEQkkattin1LC/NI8LYF1LAGWQPhnYmafuQ/2ayPYEd0yxY40fO9ol/5nv9gnr+urPQtkaDyCsvFD+r88NLjAESze6AzOtldEvUsDrmxhJlP/WeYL3rGzAk0J06wsx/d7IESxWDKQ/rNshi4ufhBrmc9uymQbi9xZ+13nE/9ZLUxKLAAQaF04WcV1ozNn9JjTD22RUN1lJbYu3p9QyjybnLJWNhB6+zdCBSz0Pn3GyFr9hkbakhrYKRtb05H9z9xa5qHxrgXKspvtj7nz1is9XZjoffIggDEIHJJCRg+AsHkkeRT2y4B4U7Q2AVtwc3HqYxqJcB5IH1ABn6YAOad/CeLbDmVCExxpg0XUmyPnkZ2EP5L+512KHaZb3BFRBOPlSWyGH7YGcces8gKpdvMmGJL3dBZdKU9i7AuQuwRATZKVPLi41x788x6BsIuQFNaCl7Gh3btyTy6WjdykWMG/f4iFbwnj+tI+89zrIdNUWMYptYbWtkh7SgyOPAJr33zsA8vEtllF9VGKhKEQjobxa9Tk16U5CRmhJDssGI1hGjQH+Ktpf+UtGram2hH7pOs8R0Pc4TUDTv+o7Vtw8+yCSFkp38FhOXl+YsigHEMaIhwCQ8gHF0KGbJyjOQXYN/fxAJBo5cPoMlt2eVxDreqKv0YJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(3023799007)(10067099003)(56012099006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eCw1hWh2Qh3daljCkUA8m1AsNubDKl1vUdFi0U4rndIZeak/ypnCLW+GjyON?=
 =?us-ascii?Q?fDNZtZw3CyX+wo4d7U+wWKaLpfP0N+iv6HzvxZG6Xy2i1yFH/SDtwGkMipEs?=
 =?us-ascii?Q?sDJHT4vgxddJmKXjEHrjacWG6rI09l9nYVF7Xiqq4xcEDX46yfFB9xXPKFXK?=
 =?us-ascii?Q?4E8FGYv/Vq+tTTAW7n8jzjWjc20a7hBNwOGm1yvnl+Qsmzra+DA0iof4+HwN?=
 =?us-ascii?Q?/cwfqe0sImMa4PshlofRih4Hsbrlu2P2pLVbjbU5n4uGnTOYDbOvIwui19um?=
 =?us-ascii?Q?uuWHR6qDGSTG6QgYpEbUWZjgNVM+2IMeLrS8UsW2s84/Fz3+brZq55/+NYGs?=
 =?us-ascii?Q?PMpH39DWZWSJYvxlC8V11dYdeUVJBRZSZhVKa5Yo3gnpjGJr1jgIBC50YMXF?=
 =?us-ascii?Q?ORankv1NgDZexVF0Jq7JbwMjby01f0mkb/wpGj8Kk+SYV2DS3gCHGpY/y0jy?=
 =?us-ascii?Q?17FN+8aqpXsK0JTuVUD0KI3gAEAYcA/fNYKm8iDbrkI2oCCR/qYIg4BKydvb?=
 =?us-ascii?Q?l5KCNvo50fgja2rFyukWJqQezcJ84KFk8vdVHa++6zKbnwedMOB/zzcJ0mEN?=
 =?us-ascii?Q?JOqRWvDWIbcP5hz9ejtx/6bFT1JEQtdbh+lbGALQr6+KwkjEgBdTvg+jHVh1?=
 =?us-ascii?Q?Bdkg9UMWhJ+4VzjXE28STL95BgrvY9ChFOOHkQMdzgSao/Bh2beBuvCXSVbm?=
 =?us-ascii?Q?M4G1fkcGk3sHj7HiRRJNGBRxCvgFtKSTMSNr+P8lIP6OM725aceMY8ZZnCBs?=
 =?us-ascii?Q?l4ouMcVYWwxchhTsyGlZ82XXbdXka8xpgN49qdn4UY4tE74YwneO8n33BD++?=
 =?us-ascii?Q?Jq9VZ8bDjgpxtJM5OsPSQHxGLHdwWWqpR0XBx6d1RzVyKhmG8cpiPcp3kES6?=
 =?us-ascii?Q?y/q84v/j/0la+ii70kcaHThlqHEQSeD07VfHPjztOMGXeGwFdjD0jIZlx60M?=
 =?us-ascii?Q?9xUMsIHNnW+B5ii0XSjc7UqqSH8xWVaAXPRu5vji9wAiMXJ2/9TRfI/Ys5Qv?=
 =?us-ascii?Q?Toj0R+yAcBOu1iO5YIzHMbq/8Knqr+wZQKs0KUF5FsRkcWZGxqf05BXuEB5s?=
 =?us-ascii?Q?6x7lUBjEhJeagCt84g/SuS5wfO4lgxcbit+8bNodbQnaJRsZwB0IxSJTPdde?=
 =?us-ascii?Q?rV/T84WB2BdiQ4O7rT0G12+Ff+4BJlW+ACt6B6ZgzuR1Oda1OrB3B4Ri0iff?=
 =?us-ascii?Q?zYJ9rmcY2jMcWUgX3p7AtZDtN8VZBrXfNiJ9hbirVJtKJMkS3bOtoP8au53/?=
 =?us-ascii?Q?T71YbvxHWJgGX5e8DRA2uwTTDORA0Kl9nhQ9+X6jGPK0GLuMXx6FG4fqtTgY?=
 =?us-ascii?Q?AaxDzvgN7MGmyP5xIZygl7APS4f4MnrMvAlzNU0F1JHMk2D0FDD+HmdC0FnB?=
 =?us-ascii?Q?Ksg32eilX/oy+BzINuyLdi5to1sQI9/KuJOUeZjh4rQ38IFWtiP+dE7WbqrV?=
 =?us-ascii?Q?+rjZnWSaYPd6mQ01yAylmTK1FW28uiJ/31EU/5mc+O68Gtw5KPONkgmMn/Mp?=
 =?us-ascii?Q?W8BlEcF1v5c49DKtVcoj5qBEmQ5Dx1RTsygGhZhKlxE2/4b1nTfwnZC7v++W?=
 =?us-ascii?Q?TNtr16YoYK13U2FVi4cbfPe6VugqtHHp7Lv4aR5tIcxVuuySDxs43ZOaeq0f?=
 =?us-ascii?Q?7ihM6YhEuRtyXhGIw8vnPbclLILKkBiaqpONTUhqoopSo4V8W0UK4hm/qIxA?=
 =?us-ascii?Q?BEekkOfj2xKktU8fwD9Ayc3DqFBBz8wfsYvnplruj4/tnUHw7czxuz8iI5AI?=
 =?us-ascii?Q?/4BJL/dxFMfBx/EFTRP6Gh1Sl3jxbNI=3D?=
X-Exchange-RoutingPolicyChecked:
	UVopdt5oxqgddegIluQzc1POBGWpGLLlOgrj/UBD+y5nszAu7D5M4JxxH2+cyepGzjCNr7In9eq+hAeNPt4/JEF72BBwznf8N/peTHytsz6J74SllwkbbLJaWqVltpCVaM69q8RvQLKC6SX6HswXhi6q/ZaJ0ROh33Gfay5VrpmrUSiFJl+gK1FiX9hjMve4jF+8CQvH7MzwyCSxPQVPf5ks5ofqE4US2mgf5TrCzZ6Q7Qm04mufjikHMgAQAMuXvZKuDYU62Q2V7d7if2EniCWjmRioD7uojqAOhwMBBQ9fzyNQRgOktF8l0Db5QgHzXpykxTs2vhwG9vXTKjIQrA==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b282492a-627a-4b7e-460a-08df13dfb024
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:45:56.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RSu3+crYflFY0p8Nw54PssXWVyLZaZ1UqrFM1v9ctcvD3rwNyug7WmrMtjKEJ8yuortByDYmcoPsNYN1VYocNFQknDlpoGpzG/Sv+EWioI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR02MB11343
X-Proofpoint-GUID: SkqHOwJ-R7bjBoqc8w8XNeV6j_Zkt_z6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MSBTYWx0ZWRfX7BVlohr3YCLU
 9smf44hdQb7QhqOzM19zvNIbYsTMLcpXN+LZw1un/gs3w7rAs6mhu5aUHsaclUupk87JrAIAv7m
 rtf+sIK5e8tvikI9Ghh/cXZaeIQBA/M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MSBTYWx0ZWRfX61FSD+DTlV+h
 2QIuL4OO/xAtIB54PnCW0pHxszWMPxXGpz1xLHM1h5aaIao56ll3Kg8eK+SjQCHY1jhvjwMRgE7
 0BD8fSDiNIhVTMGA2TDpP+s49jERuXextxEJqCi54GLhYXe4LKq0csIU4aiESsjkPHxfx6NLJZk
 c8MIAcKLbm1gQWm/O0gc0KKJJgL+FqOWvEGti8/lj+2D97HfdFY/xq3vzq2QLB9GGIngCcn1pbi
 7UGO4ztsBIGSpy1qxczzbybzzoNwvnImeJ2c45PbGZwgeo1QO0/M3fxRQozFQaCLG4yL0goyeVD
 FQ0aa50IygeRQFJ0lryfDtb2Z24NkHbARhAlVFy/IpYP9jwLqVP3Gh3fkhHqcHfWKLpfOaIcl2K
 rRr+tMnVvvoJXcvrm1h52wmpxy7HRUQAE9TDiU1G8u+gF5LNl76EnneX7fRQEGwxMo5wPgpKmsS
 pvEsLyTa5uhvnpylm8g==
X-Authority-Analysis: v=2.4 cv=P46vFSAu c=1 sm=1 tr=0 ts=6aaa7365 cx=c_pps
 a=jsJx5cRpnMcsqjM19+T+dw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=Ap8k9tRZuQ82DLYWQqG7:22
 a=64Cc0HZtAAAA:8 a=ap9nPAedobMI28Fi-wYA:9
X-Proofpoint-ORIG-GUID: SkqHOwJ-R7bjBoqc8w8XNeV6j_Zkt_z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-d25034/1789555562-014C7A5B-B28A8292/0/0
X-purgate-type: clean
X-purgate-size: 1136

This indicates that the specified register values are being output in hex.

Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 hw/intc/i8259_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index 3511303c21..64d6f3e959 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -119,8 +119,9 @@ static void i8259_common_print_info(InterruptStatsProvider *obj, GString *buf)
     I8259CommonState *s = I8259_COMMON(obj);
 
     i8259_common_dispatch_pre_save(s);
-    g_string_append_printf(buf, "pic%d: irr=%02x imr=%02x isr=%02x hprio=%d "
-                           "irq_base=%02x rr_sel=%d elcr=%02x fnm=%d\n",
+    g_string_append_printf(buf,
+                           "pic%d: irr=0x%02x imr=0x%02x isr=0x%02x hprio=%d "
+                           "irq_base=0x%02x rr_sel=%d elcr=0x%02x fnm=%d\n",
                            s->master ? 0 : 1, s->irr, s->imr, s->isr,
                            s->priority_add,
                            s->irq_base, s->read_reg_select, s->elcr,
-- 
2.43.0


