Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C279C54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 06:17:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377123.1623349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpK45-0003q9-25; Thu, 30 Jul 2026 06:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377123.1623349; Thu, 30 Jul 2026 06:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpK44-0003q2-Vc; Thu, 30 Jul 2026 06:16:20 +0000
Received: by outflank-mailman (input) for mailman id 1377123;
 Thu, 30 Jul 2026 06:16:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wpK42-0003pw-1Q
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 06:16:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpK3y-007mtO-OS
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:16:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6aec13-bab6-0a2a0a5309dd-0a2a4503be8c-48
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:16:14 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6aec2c-fae8-0a2a45030019-94a392173584-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:16:14 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66U3c3Le3666914
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 23:16:12 -0700
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012002.outbound.protection.outlook.com
 [40.107.200.2])
 by m0482516.ppops.net (PPS) with ESMTPS id 4fqprb4x0g-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 23:16:12 -0700 (PDT)
Received: from BY3PR10CA0002.namprd10.prod.outlook.com (2603:10b6:a03:255::7)
 by LV8PR16MB6671.namprd16.prod.outlook.com (2603:10b6:408:258::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 06:16:09 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::41) by BY3PR10CA0002.outlook.office365.com
 (2603:10b6:a03:255::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 06:16:08 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 06:16:08 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66U3e4nY1848433
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 02:16:08 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fnc7qdp2n-20
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 02:16:07 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id pK3pwTDm1VWzXpK3qw7tlk; Thu, 30 Jul 2026 06:16:07 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=sjCjhJ26VF+1qPOCp45hylXgx
	WwgLMWRt5jQ8dGvmEg=; b=rqmz1n1HmL49s4KAffZzjV/j2uUuBVFcQtM4rBgEI
	YAC8cYPKxFKpzF6zsPloXq8teh6Zz5MbloOIWRNB/F7zv2ck2IQe192j8maqDaTU
	cAFxbjCXTY9SEq8qM5BPCHLozKg6d1+ir8nTNkuN8xrfZ7CLIqLDRTq7AmVp+WiW
	IIkwtViJReqZ8ihN7IdK+GzQmJ4dYXng4BDt5OBfcon4Ywh4eMyZr9TSBmEtlPl1
	WLP3qMkx4KOY3tPNv7bh4YDRRrpeSK2RJ6OLp98tfnTeNuVZLF8mwrBIs/IOqBk+
	Kw0XNqQ3dc+J4ilY1GSvyrnb9Pd5z+df2BWp7kLFqMgSQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uw+q38XXP6FAUPrVJqVonnO20kUzJYNHR+4QKcxSm+7g3aIAG9Xuhhve72ocMFTATO07+HY5/PejaQ7+Syotghz9zUFb3d0B4kTq/5o6RGw1tPRvwTwPHwkP08WcZF7D4i/h2sh+JdvxYHcag0er3TTnf9ZLvTIgmkbs1QA5T2+8w02wQ3GAsBbhRmRZbvmpOfVr1E9nlbRvzP6M1cUiKnu6lXriyEoTcmeh3Lukyv4I2WcUPRhNWUUWDXBu582R61wWGEHwjW3dUGOqZ4+0/wCpu/t/kNYYsfbAAAzU2VoM6Tw8APq53hz+tlOiep08DboKScGQT4Xw1t8BV8zw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjCjhJ26VF+1qPOCp45hylXgxWwgLMWRt5jQ8dGvmEg=;
 b=XY84uD8Z1HwuhbyMXzT4i4wWjI/JkZR4mO4Ys/JsXmWnUHRxx3DrfFXttA7ufPaRa46PHf6RBy1zV5CL3feZeGY7YNmhfMwqyhLTMc5OQKNcHbwGW9n9k6rWRGJv9I268v8UzH0jphxWofSqqsrToE6sxc6+V0/5RnVtkwG0lz7I9AnDcybNgEXZQv63fbm6E4zLbeJIfNhncasqgvc1RzfwKua0SwFHzhuc0xV+0jr07w0pg/iJ+UZrmGass02BfoIj+AJG+8ZGMArtZXt6J19TtdOgmmko/GuXtGwG9S+SA7y1O1NYo4D80HTz1ESD7pFfv5FkM4264wxMBsOgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjCjhJ26VF+1qPOCp45hylXgxWwgLMWRt5jQ8dGvmEg=;
 b=K0xT+7POKfIn/wqf6YmymetUjXHyRvzPGIGHBXLNiuYe75dxJgemJVLunaTP3uhUBGq4WgzxG3ceDzBQtv87rJIbuamPDtvp0hm1fkxofx/484SbifFJ5eTRZLa/+jSIhdm/3/U7mXaG0c/d9oRSrgR1ukd7YdiVn1eZaLDyWZ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=sjCjhJ2
	6VF+1qPOCp45hylXgxWwgLMWRt5jQ8dGvmEg=; b=ofi6NNeCdDk64Di1CQXOdrY
	ob5VUUZuI5tveD2UHw+EjO/tXhP3XXvBvOHLtbAPFBEUliyXc79Lof14ukyK62dd
	thUIWEvHKyzpl9zUzCUMMKDJ3LVeeBiKI7OkdcfJ71FYuN2Iczzt1fV3xC36jDyG
	MuYmz4eoCxvcTdq9vkcAU6dKY27p60dZTFECeouEL0cGUPAulEntSz4QevIlR162
	U5lUFwBXchiQ+U9XJ6CBtkr6XNOjsm+p8JyQsk3OCEeyOAKp9X10deVbOkc8r86M
	/Ty6ZV88LEMMlLQh/73xTch9OJa9q9TVqU4PJDvEpK06cIzJVRSfyjrT9fJPwgQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=sjCjhJ26VF+1qPOCp45hylXgxWwgLMW
	Rt5jQ8dGvmEg=; b=uto4mExHIhQAnatZtqifB5Tii9WJa31vo8ZLKYRNMvqm1aQ
	B+hCDDDP0EjK0QODWW1PpEuYcTG6hXWYqzuzSq3y2bLxiwkB6NPAL8lCZu5jSGuP
	5F8/IlG2O5zu18xgzh1hHdRGKbl4JBQ3wjsp/A6XfcHZfQUxHr7ngmJHwEnntnu7
	c81yQRQcGyEWEgNVFBahL00dija/pSr86K0H1TdfUAzWsk7ZAOuyniwak3Bhjsgm
	dYs/zS6DobL5hDHJPed7Fwl28oyuoIl2I0AhadMvnGeBdDHHjrIqqNr9ffI9MCTj
	j69s/2h0Vu1zQIJR8WYm4+zL3hljvhdci4u3kig==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: pK3pwTDm1VWzXpK3qw7tlk
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1] keyhandler: add handler to show Xen command line
Date: Wed, 29 Jul 2026 23:15:00 -0700
Message-ID: <20260730061459.2702672-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300041
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|LV8PR16MB6671:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e0894cb2-2631-47c5-dc06-08deee020b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|13003099007|10067099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2E9+fTOW99w0MlZrpclvFcL9a9A0jqXu+nBi9bCthv5/NGyGoOJYQcWb1bfmHKTxxz5vK6ZLrJF6fLWBE9W6eEWcY+o24rQIB1RwTE3ZKH75uQbgmMstkTh90/myw366HwGN3H/QJTimE+zur1Q/dZonRwhFp7GKPxrfBTIp50egQlb/mkiltBjlNhJGUuygHXQgKvl+j+I5sSOD929v2/hpiZLSVjBk8t03PjHyY3UT3sW3KEK7GLpHJmcGb0l3g19gMdafroNQUVQn+AXPme2c9dy/md9ZbeiFOekNwFIpWB7uXjDSvRqHBBqmYwP2MXM2GW8EgU/xtxhXygyoLL7FpOf6cO2aOwnSNOrJEf4/LJ9dR/pPx5FdYJKIWJq2TaO3WrbI+j/VTsDziBK0CfRnPlBtA027HKLaIHuGneevrFsg7Lf47WWty7E+TyLlw2LlH0Ea0MajSupNMIuZMcOnus+NPcrZ5a6LffzOXUzaw1eLhVCpV0Ce73RMOF7B6evyWCt/UrWBxKTxuWXkseSafxxOiTrkBXUz8cZkPD9bfRCWUKaGmHxdbhWspQHmLe+0to0K0S2rFA9KsU1XBmymiifDr7KVnXgCCyrJpxl+WvFZIMF0dSVzc1VgRbRuhxw4/VTAFfF6C74J1xBFcSpFeZuNQlspH6TqZcv3Ux2XB/bOktK6li64wDj/kEGRMfYXNWza/JqxxtKhhQ6uog==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(13003099007)(10067099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dl30sk0aKtDcb/sn1/KrFebKxCu0v7uy3F6D5u1VWbARXokitYguA9Evu77Rixm6FMGYlrhzeaSx0PIXijdL/uJ2JKGfoOLqVbSOqckdyycV1FtYMV/1IxmTd0OqjPnhaM5+cdBZSH+/qYjQ2cqVy5ajvPPKhYfpSFlZDpu08Q2sBmBSVC4SDF22O8mIfg4rKCvh76XhKWV4ilP47ykYrJ/+IS0b/pgvDsD6WVGKWY8ZvVJa0/GcT0gkZq+E/WRXSmo9oonCT8z5ob+0UnCnyjtJdDgvXj3jPPbAEKFhVxOqMX+61IetzFk1VzUn+TwG8vewMyFmc0h1kY1wO0LgPw7XdWFfXowYhhgWjCiRYQyt+CvJ8QNey3jMIcmwvZV3VERSvyKVXfZvADGxELgrI+sLE61FtX4Nk3SuU9TbIgUxOpEhV2KrZSwMaT/XvqPX
X-Exchange-RoutingPolicyChecked:
	pnEBsfIQeewSmH1/wcBx19SfKA3h6QiFZp1EzAk3J29GvHQHsxfvALQs55pWs/iYAdEPBJwQCm7wdikIM5/Y7qttOqzVVrvRHnBODAq8QQ5448yF3e54PWHErgAqpyJr8C3knTpf8FOWYJiiGWoDM3Bp6jcapl/XTq12JV1qlLM93maBRKJvlHRHWp1ugpN8dXeuw6aDAzrlXhK1SIy9ADHZYczDc6wC34MokzfNIK1xoAgQmClyMznqSuVAO+y0vmZu+qyMGfD3QJEYoHLQz/V/9GXzOJnr1UUhQ4ih0gBZmKHdCMyKpKKGEeB/8hbhq9OOkNjiU4p4P9a4XrqSuw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lWl3MqMbFbf+Bk6+dQ8O4CHFIqakTkoYRoyIpz4pXePGZ3naFP5V+vCOhILGA6YGWxOqXmwADms8lwinzceK9I/xB3QcuRkzQViXTSmVEUzjP52LiKtGBzf15h0ar8vcSX1xwopd5BdPw1htbidumtXV3FtVe83vd8EyZAGQw+zy7VUbypXgt61KpR9ecwTlhl9RW4VPtNXnyW3P+PRSmV0Sml3x/nD1cL79Ns0DWR3fB+0kdRatC0/wFVYj02+cl/09MqW/4r66BPmRnCxjZsr3oV93yQvUnTMsMHqTx3npSvfUV0xyuYYatR1NjnIVh9CId9eyx9eIX6TI3rpKVPXuzs9Af+ZsDxHiUGxQNYNlZFvCeu8ysYCz80nByUt7j8DglVoqYURN7YefHHCZxygzc2HrLaYntYU9wcpApb5BEQbIAGe9eOjj+kgIwk1wuyNTSYZSJhwNh5r5aJoq92QuNHuTgI3tPR41J8Yegqm0JFAZmB8mU39ZuSROFHHKmf024j6mSQ8n/IAI8tGSY+n6DH6OFtJOqMmUwExTeoYgktQxpqA4PHHz5BMh5kdXdI72RvIIRgPqQxA51U1d1QL558PdmyL5S73mMA/rqoi9rq+IJ8WdPXrihwitVOWctKKXESuKLiCTK/cwEdv/7Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 06:16:08.2375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0894cb2-2631-47c5-dc06-08deee020b76
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX2hM7n93iEsIR
 +iikul5VYWggtnWWaF5BRnMRH3BdnH0AOAU2FekZUisOy+r3rW5WMEF3NG3loQv6Yq2GRjsK7Gf
 xeRE6DJwnXckRUe7yaCgviA2NuRzhAp/xlr+45DEk1N70246607lM/9XEXv8VWO7YDZX2osF95v
 V/gTEVWdaeAukEwzs297pReltt43JZRF53P17eRd57WkgAtVo+y/J7Np/A9PTOjXWtngIS4S9E4
 xfiIfXq/jbc9jtMVJP/TR7Gha9kYhXKNFIDPMqCBKZhcgyV3hyP8FX0ZExWzHTvFieltRKsF72Q
 9JH3bZXj61GKaAcNl4iwtPzf2e5gBgFN8Qmc6vm7gkHwOT9DZFkO0gGdqYI5MQKTNzzOS0zxccn
 Q1XUorThHZJNqeWIWfbI7ScWQCeE9I9Q4d90UgIMjObSRcOft1frKFc8jT2lol8NassessSFlSi
 ZeSn0K6bPDBDer/8ncg==
X-Proofpoint-GUID: C7xYJNt3KUjW2v0-_xJ3jujfJhv8VuSX
X-Authority-Analysis: v=2.4 cv=EYj4hvmC c=1 sm=1 tr=0 ts=6a6aec2c cx=c_pps
 a=fjiyZBo1bxGOeg3e+tCWfg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=PulOWRRJR9CbBUe92eMA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX43HCSwtXds4e
 zhnI/VKx+EC+OwIK6tIiV1gGn+q41mbPZ8ua5ZY8ntYsgRGrGb4IlPpm929K6XfSg/OMznb++NU
 ujdsOqtdpiqy9jr9LaPKAS6MVBY+UZyG3VKwwIHA8GFC5t6krB8l
X-Proofpoint-ORIG-GUID: C7xYJNt3KUjW2v0-_xJ3jujfJhv8VuSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300042
X-purgate-ID: tlsNG-33051d/1785392174-6DAD44E9-483B6232/0/0
X-purgate-type: clean
X-purgate-size: 3343

From: Denis Mukhin <dmukhin@ford.com> 

Currently there's no way to print Xen command line on the emergency console
for debugging purposes.

Add new keyhander 'C' to add (saved) command line printout for debugging
the system.

Also, fix indentation for KEYHANDLER() entries in 'keyhandler' array.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2717339023
---
 xen/common/kernel.c     |  5 +++++
 xen/common/keyhandler.c | 18 +++++++++++++-----
 xen/include/xen/lib.h   |  1 +
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fb45f8139995..9718a89d8088 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -232,6 +232,11 @@ void __init cmdline_parse(const char *cmdline)
 #endif
 }
 
+const char *cmdline_get(void)
+{
+    return saved_cmdline;
+}
+
 int parse_bool(const char *s, const char *e)
 {
     size_t len = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index cb6df2823b00..55a370ac1790 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -28,7 +28,7 @@ static unsigned char keypress_key;
 static bool alt_key_handling;
 
 static keyhandler_fn_t cf_check show_handlers, cf_check dump_hwdom_registers,
-    cf_check dump_domains, cf_check read_clocks;
+    cf_check dump_domains, cf_check read_clocks, show_cmdline;
 static irq_keyhandler_fn_t cf_check do_toggle_alt_key, cf_check dump_registers,
     cf_check reboot_machine, cf_check run_all_keyhandlers;
 
@@ -60,15 +60,17 @@ static struct keyhandler {
     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all diagnostics", 0),
 
 #ifdef CONFIG_PERF_COUNTERS
-    KEYHANDLER('p', perfc_printall, "print performance counters", 1),
-    KEYHANDLER('P', perfc_reset, "reset performance counters", 0),
+        KEYHANDLER('p', perfc_printall, "print performance counters", 1),
+        KEYHANDLER('P', perfc_reset, "reset performance counters", 0),
 #endif
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-    KEYHANDLER('l', spinlock_profile_printall, "print lock profile info", 1),
-    KEYHANDLER('L', spinlock_profile_reset, "reset lock profile info", 0),
+        KEYHANDLER('l', spinlock_profile_printall, "print lock profile info", 1),
+        KEYHANDLER('L', spinlock_profile_reset, "reset lock profile info", 0),
 #endif
 
+        KEYHANDLER('C', show_cmdline, "show saved command line", 0),
+
 #undef IRQ_KEYHANDLER
 #undef KEYHANDLER
 };
@@ -512,6 +514,12 @@ static void cf_check do_toggle_alt_key(unsigned char key, bool unused)
            alt_key_handling ? "alternative" : "normal");
 }
 
+static void cf_check show_cmdline(unsigned char key)
+{
+    printk("'%c' pressed -> showing saved command line\n", key);
+    printk("%s\n", cmdline_get());
+}
+
 void __init initialize_keytable(void)
 {
     if ( num_present_cpus() > 16 )
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 3c545ff33c61..094873dc8ba6 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -19,6 +19,7 @@
 
 struct domain;
 
+const char *cmdline_get(void);
 void cmdline_parse(const char *cmdline);
 int parse_bool(const char *s, const char *e);
 
-- 
2.54.0


