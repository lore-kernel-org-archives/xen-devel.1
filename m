Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93816CCF2C1
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 14:21:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451972.1666830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHio1-0000te-Rg; Fri, 16 Oct 2026 14:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451972.1666830; Fri, 16 Oct 2026 14:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHio1-0000sr-OG; Fri, 16 Oct 2026 14:21:09 +0000
Received: by outflank-mailman (input) for mailman id 1451972;
 Fri, 16 Oct 2026 14:21:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1xHinz-0000bi-Eu
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 14:21:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHiny-001Abq-Rp
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:21:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad232c8-bab6-0a2a0a5309dd-0a2a450cb32c-46
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 16:21:06 +0200
Received: from [148.163.155.12] (helo=mx0b-002c1b01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad232d1-f479-0a2a450c0019-94a39b0cd23e-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 16:21:06 +0200
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69GE5C4r3215871; Fri, 16 Oct 2026 07:20:56 -0700
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11020114.outbound.protection.outlook.com [52.101.85.114])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 4hb045k1ju-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2026 07:20:56 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by BL0PR02MB6547.namprd02.prod.outlook.com (2603:10b6:208:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 14:20:53 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%4]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 14:20:53 +0000
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
	NQ=; b=hZ2oksFO8APuCWu3L2f5zZ1k9deAuiZIgapHsDmMrlE8NiTfiIWpPOZQY
	Ef3fU2tAAmV6E2JwkbxJmJJE7ShhimwmA4VnMkrX/uwMkBagWmMrU4xE8VnKGSmr
	DhHuilXpwBMdWdY5YHaknc1KqujUUYwzKqoqZ47X/g4cge1BydpOH3yumjKK5l+k
	t1SMR3H/u+CRqpshdPQITsdT6dB3CFjbu7pKagSdytcLd0yPA/N0F/rKyG3rEhu8
	UtOFniK7UyMOQ1Gs16xaftin6XCadW3V5LAQTM/Do1760Lo0HwlJs3/4Uck/55q3
	WzIBvUtLhY8r797nkJH+UxHh+avSA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKEeACrkX44kYQU0dcQ84lGgnuClF8L+IBVBGu2HyzojVWPm4rxhw5xuJZq3g7+INnq/rfHa4E4vHW2zP1kTVkcSS7K6T/HpMyH4qvN4btoLOus8ltFJJg0ydkLe5y281/cc0wA9vQ7KVtBvI1pToQLYLwLxJuI+a5XfsdVVCJ50L4Q3Mupxn94q8gdPbWG6872j7YNmK1ON8yZYGbqi/Fp5cqKRIK2/DbbWXLrNdtivEED4aL5o2mdu66MkQzvJEHGhBVGi0G+eEe4cq0RZMWiODZMmAr8dSoRmja24UQDnxWfmmJdg0Z8CDllmJEoP+RUi34kbqgXX7Ja/Pc4Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTsNITGc20yNxz42lJwDN4eLhxBiwmVbhEf4oSGIBNQ=;
 b=dDumQLZ9N6g0CS3d8bPRO3VFZpW2ovNJXvQzJO/83J655w8AZ4gW8ItRZDfHQ28qiTBAnUzmuoiDw7FGH38UBA7v/YTxGqlGYvStYxLIscKFcCeh0psuWgG5CknVxMNBSRIWJtFjyWPpD4IQiEeTs/yJ2yQFiZ7YJl0LAkngwlGfYfMQFnjfuzhQTohHhMdZYj4FedXeFCjpU6fQWPdgYrk22FVg/rS2UkmSeS8gDIrTZjS7xtdHEpxipdMnvCqH9AOxc5f/0l8nGsPFmaPOYNE74cfX/SvO8/d+jFARtxU1wnQ0P82QDTqsC4bIBG7pqxy47DDhofUGKo9LBXottw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTsNITGc20yNxz42lJwDN4eLhxBiwmVbhEf4oSGIBNQ=;
 b=UqZsIhjwhwOZkRvhxCcZ86/OIGlVv1lQKzNe/uF5HkqZ6i9AZHwZuPiKWVGSqsg0DbQyR+VybK2ORsg7Q2MoZNO8c8InuSmpJtxcwP8Cjrt5kadZ8w9DeQtFhK7utS/nSRkjNfoAfOcKfsc1ziRbuMmdjxm8WtX6/qfopWGk+9ZXTTXCJ3eMdPKy5Lt99D6l74q/3M5xD10OqCJ1AmUDkYvOh+mngD0rpBiM3eueiUVRZJvyS5anKeixWwAIUXaAniAyuyrxlAIEdY8Kf5bcXc1ZXKR1ZBV9nbBToBqu0R23U9xDPk6pOelGmX2hpss1QkR4nbAMKkRPIqddVkSSuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nutanix.com;
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH v2 04/27] i8259_internal.h: rename PICCommonClass to I8259CommonClass
Date: Fri, 16 Oct 2026 15:19:10 +0100
Message-ID: <20261016142031.1204281-5-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016142031.1204281-1-mark.caveayland@nutanix.com>
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|BL0PR02MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f51369-4cc0-490a-d509-08df2b90af86
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|10067099003|18002099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QBuOvyghhHQYhQsGL5CNi6VJxInWJFeEjzSxT7EAlfKW01F3oYDAXk7Qu3j1Xzza7KCwdjbLHDA0FngJe+XqmreGwyJLQ6lMcOb7WkZFq7KLlxj71LnQJIYv3BzX3UVVebhzw6TCuXF4KdDbBXGwKP4XKJnrb+afksWmGJyokFqbmLYXBBahIJhz9qHSZx64KuZD3sQkVNZmtw4QqQKJBL//stfTMZbRtCYLRObFi/GzJGx3KK0R6RLTdXmZsyP+exzFFQYhRZn4SXdP7CvM5CTN6mSDAiwoNVOngNC+YppN9BD0Q6VfqiR539g+QkbMBJWx8pmCJHEtaFbYh5TOBvMJeaSWnqzBRbTV/xYBwTFeOYT6SuNH9tVzmDvPBZSs0jtND3Hu2ObTbnpYPBeP20QuO8XWAkTXgtotYn5wBdwolneHlmrc5Y6GcNnoLSuANr3AXBGZDCt43Fmpr8ruSoUazrcNtQRIGMFQqJbM6m2gCnd9yQlmo1BFUt529Pgd6p8vMNLNAZIOUrZZcRlRmDx4zRKLEpv6+prWZi5YkbHE7Abr4+4BSBU+DiawDYozeKQSpfKHyZ0tH8vue62z0OJO83HtiV5E+Cs2an1l6ez5Yquyqc8MFiKQj0k2n0Dj9KjXoinmmN8gvo5c3LKeTx8mAPFfPvyDX85eeCffkVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(10067099003)(18002099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?43XnQQM6/1C87BLUYWuoOoaLBNR25c0BZAYdAXkBRFof88BPOAml5ddfLYfu?=
 =?us-ascii?Q?eR2LpBNF9O6kAcmz+CjBoGJH3ek13DJgml1c2YOAP1DyQt/ZphNBxiUferjJ?=
 =?us-ascii?Q?NnSQ9ULXj9QluNj9DNc9RsE/4SOrgNkB9whWhDGSfE3chovgg4Y/X9Yc0BT+?=
 =?us-ascii?Q?hD0jg+g6hdTQpYjbTVsQ9DwDGrN25bIx050DUqjQzTf4Cl2kTjV4Pu/tON1s?=
 =?us-ascii?Q?CE5oT+vLA2mjiUP8zH6GKUEmk9T8BSOgWIhEtBckCHPboRQSMqG8FHH6u5J/?=
 =?us-ascii?Q?8msoKnaLu+IOgmeoNYCmywYKvIvk7Y35w62/wUqfVtULsy4BeUxDp7G2dbr+?=
 =?us-ascii?Q?r6ANek/0fVgGMofvwgaXkzYWD2nhrVkjOhscA6xPRki9ZfClf99hHtrNXuek?=
 =?us-ascii?Q?6Et1IM8RDi6IWbzQsX1WM6UQRogNSxbff0dWsJ9Leae91H1VLWQGYN9GYL7M?=
 =?us-ascii?Q?diVEY9Fkg5wNk01Gpgr1cVkNjF3fdFENA6adOKfMESznb1UPbVNd2rsPMdw9?=
 =?us-ascii?Q?kvynp2EIZcE8FPz7FKw7C75FXEOVPY3BEK4P2hgNWMHxoqgqt2v4E/17eqQW?=
 =?us-ascii?Q?/TcwsP26k8EFxq2mn48g9f8+7kYfBnnr9lLUYhmgnmth4V4HxHoXWs8PZU/X?=
 =?us-ascii?Q?9SR0clQY6VCMeKileu53Nub5SSygZbP7h/KViUC9ZyjwRqqWxeq+OOeG7+qY?=
 =?us-ascii?Q?tYdfbAxPNGk4ruB0JVPBEnX1Dsg6KheF028bMivvwkmfrfFOjTC0PCdgTsQJ?=
 =?us-ascii?Q?JVpLOPIIQGDpXTEgtDws5CNXNfvxacRCFeIkDpzKCBVOQ/4ajSJYeZbsDFYR?=
 =?us-ascii?Q?yDVte9I2qMkBUFzlNRxT6hvZHCIW+GU0eYw0Rx9/X4FZCSD/mQNlM7P3EgOH?=
 =?us-ascii?Q?SBiWaqhaJzMMw6XsnuRM9iqpk61HJZMtgchjmgrkeENNxbivboXq5GmNQyHY?=
 =?us-ascii?Q?+D+I2lh1PLJQqqEtohWT1cKvHMQGkiVSymAofDNUHTDGqF8fNZdua6I0mW2y?=
 =?us-ascii?Q?hykcRf34chb+/ihTCyFyfXnd4S/rWlevcJ82lH9s0e+HVP6UHVSxMB/wfckc?=
 =?us-ascii?Q?D4k0VV3+Y1coNyojQR9tDq5fgHaQSCxoJs27YhxMP7N2w8IXynQB66BE1lc3?=
 =?us-ascii?Q?YqdKsxyZe7/RfrqZxQ3D2ftIKmOHpjO5MqFdm9bC2VYgHNP6sHRdsjaMLARp?=
 =?us-ascii?Q?PQVbTdJTYJVCPkjSK5wzEPOiP23JKg+NmOvGXOAiSzprNw5aI61naxyui/af?=
 =?us-ascii?Q?LKSR5EEt3Bv12+MVyzt6cM7aJ327mPmcyJPcQvOA0AFxqTH7DZieR06KrA+x?=
 =?us-ascii?Q?AtS8DF5OPD9ssw0xvOoYj36hDsLAvS3vXuWy83praN8qbA/cpekye5J/xhNq?=
 =?us-ascii?Q?uL60WgIBH2wAb76XvCMymYJ4anM2VdCntUpy98o2VkgfQBMe66omNN+uhR9g?=
 =?us-ascii?Q?s4AvMh3ddPEugUUDcA1cr5PRnCkD2hFP32kFMH1a3PXYC7QXIojBNqFJgVN/?=
 =?us-ascii?Q?hmJgIQb+LoXxupcGjBYtzZj0mznpOV6KKarJuUHy7BXf0Y3ldY9qT9EGxK4I?=
 =?us-ascii?Q?6QQr03cQ6NyJ0COiUqFMKVD4xAAl+ARL0bhIL68TdQE2+4Y01zi5zA/JJ0/+?=
 =?us-ascii?Q?Yp+SYND9OHP7EFDAesyU1yaAk/sMhtj6en4ImXt/WTHuVJzFtSbcFs10UbKI?=
 =?us-ascii?Q?aZyMrp6/ufJYS/b0jXSf4TE7KsO/IStJG+WH8Ncb4A/NaH7ph8j3+zj2UA9W?=
 =?us-ascii?Q?0TaNKoVfWwUCOBsJJPkJ2PDOTEOaqq0=3D?=
X-Exchange-RoutingPolicyChecked:
	iwxKzO2JD8ypCN7bl7++cRKTqD/CwLWMwXHVWL8VPw6dfQDml1ycbbTRexWaL2o9AOqIHaatFK/5wbsJJoSAuDN/AOHQXghAB/SduTjoI29uQ5P79q/OVLv/ulvG77qbWnOAjsKbNH6McYtMSP7E2OrFZy8AI+dcdNYr9AAN3Ewp3I17wGCmPzcluhnobsQ7CcRm8QCXZdK2ObWB/sOk45Wev3pJ/i64D56zDNaX+MJeT+p2FaJAq6Xi1/Gyb9MbOaiPKOdTYLaYlXy5sqG0kt6fumLALOXxXRw+/BkAzS0UTVMmG8grEgGeY891zwBuU4T7w0h/rh5hJ2Yi2zvHBQ==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f51369-4cc0-490a-d509-08df2b90af86
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:20:53.2877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oW3A3b4UVUpnLilZUn2yhOJFOh4z+ThO3xZfDhriDgXYFpVEm9iKQjYQIo3fwpwkR5W/pMO4dUP+7XtxJcvMPhe3WMpB2BlZF7CRNdSk8II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6547
X-Proofpoint-ORIG-GUID: jvWUXxaD_Q9QsNvO7n45Qpegz4tyMhgo
X-Proofpoint-GUID: jvWUXxaD_Q9QsNvO7n45Qpegz4tyMhgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX5gFwT7wyv44Y
 2RH+du6E+zXblrUmRB2oFfAWzMVoNlMruBIw9HEMIhqKbbauq4tsP0UTlJyd91Qdntdi+m8Tgru
 yy8ee9DuMRjioHSZCtbntI+oHXXqTqPjONfNwMUIx5xmgTRcvt2RFBQSYcfiRZrf+PtKXPPMIwn
 2iiYauxBvwYDLvulioSoiwb8tIo20nR2LKXWWbqHajaBHWWGpyC+85lerreAPuJDDSMgWAgWV0Y
 TsnDTfxQWTexFd8IR5X4K6Qk229MzBB/jSWfnbWHe2tGCT71jRA2uA0bU91waGH1viJcLZCdXO/
 ZEeeP7iZigq218sGDQjhSVdxy/0AWjVB2dERYxGcH2pn8EDzQEs7bmtN/Nk6vLJM3DRS0lnXpdM
 6vIH8LpPA9BgiW5ycm2VgWQ2nmqdbT0N7HGBPEoQE8vkMo373Ch5O+jwx8Wh32Erk3TT7Qi88iL
 SPlpHVrMadtsqCgL23g==
X-Authority-Analysis: v=2.4 cv=V/ToQuni c=1 sm=1 tr=0 ts=6ad232c8 cx=c_pps
 a=0Uzpqe5Hikn09oORNzbshA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=jxMXjlTPpCISP5mWtjnE:22
 a=64Cc0HZtAAAA:8 a=KKAkSRfTAAAA:8 a=qh9Ixq9Ib_qUO60TQ2wA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX3xPpqpxDH2Ku
 SomnvFHplVFykTh7iX+tT2G2J/Poz+KvgiLvYhPvd+pb3oG0Ng5NylfgOO0znaawVpBeZruUghL
 s43RsF5Rs3hfgEEkFw7ITK+DS+9TW+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-d25034/1792160466-020C1A5B-C57FC5A3/0/0
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


