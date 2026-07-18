Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA25C44515
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 02:35:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365326.1615875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkutB-0005tA-1D; Sat, 18 Jul 2026 02:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365326.1615875; Sat, 18 Jul 2026 02:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkutA-0005t3-Ue; Sat, 18 Jul 2026 02:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1365326;
 Sat, 18 Jul 2026 02:34:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wkut9-0005sv-3D
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 02:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkut8-005cGo-CN
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 04:34:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5ae619-bab6-0a2a0a5309dd-0a2a450699c6-10
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:34:50 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5ae648-195a-0a2a45060019-94a39217861e-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:34:50 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNE0ic3152016
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 02:34:48 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ffrnqm2hb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 02:34:47 +0000 (GMT)
Received: from BN9PR03CA0096.namprd03.prod.outlook.com (2603:10b6:408:fd::11)
 by DS4PR16MB6972.namprd16.prod.outlook.com (2603:10b6:8:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Sat, 18 Jul
 2026 02:34:45 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::78) by BN9PR03CA0096.outlook.office365.com
 (2603:10b6:408:fd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Sat,
 18 Jul 2026 02:34:44 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Sat, 18 Jul 2026 02:34:44 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNIUtA3443664
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:34:43 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc6py048r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:34:42 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id kusywaUqNERZKkusyw7vfP; Sat, 18 Jul 2026 02:34:41 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=7HQ
	6p2ktQeas8tEBBZFKp6+oncTUNewPEkJCmWU+S1A=; b=HmBeXZUgtIeFWPM1LSD
	UWt1EEo+0zXhxwBZIIxGnrAdgtBe0mAbHM38aUEkDzhYPn7r4+FIribHtFTz6oKN
	S1+rBgg9u8EdihHmBIqlGc3JrUrQPLDw8cB7zM9KY3CuFKElU5uwU7EsHkIooxza
	7z2T5hOgPkNQmH6gJTH3JCJ7SbkumDkv5UOlPdjw2U+cmRlgbQEML3cqVi0PkDZ/
	rO1zHdAP3mKXs/DFPcxn7Y1FiZNaQqVwti9dbw49Lmel6kVHFLzOX759sT4I4rDi
	2QeJ3OtFDSYBHDyIwRIxKVL4smkPnl961OyfyMdSJ/jRsv61c8edcTEwQrA6zKX9
	7fw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqKBjCy1i0W11+BsLX5OVuuQfm3dhFGVccrO2nau2h8TowPjN+h0+ieAfmcYngvl2ihTuNaTz3+EekKai7/29Hnmo+oETCwXzMYcM7eNRBI2YhrE6mqH5gO7ketFYHr5zGaZesU8VU+qXks050ax+Sl866594RB9hJMeyG316xXHoPasa6+xHvnc9iqSEXzL0Ep8FYTp9HyrWpn8COqXNObOpX6yfauauUaqaBdSa3PevJKk4LnFmdZU3QlSrrWkbn5z7ZlRN/CkmVpHLhsm7BwgwgZwVypaCyQ9qdEjcyD45J4r6kqVTApys7mx1y/CZFWORIvZWL2W6PJLHyDjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niNsrKKGyN4n6Ip60OLL0+LAYJwgdJTFa6t0pIzmz5A=;
 b=yQ/igwVOC9M2ByOyrNu9R9RmreXNYfrWq6l9WlUvq8Ihz3UgnvbLgl3Ji/Aw+jpOhmAE3VUGGXWbbkbWRAFQLlHEcsEUhgI2GHSXCv0NTtWW7gNkim973umOjii1v/jymdlr4Pdq5NgHr3/ItUPJD6A1M+tqv4PjT+CScJAZ2vuKWXQYwIjcaTxfY/lLqG+LEuj+EE93/2Qy8ZYrC3EKEk/EVApQJ/jB18B3tRx/Ug4TDqeS6F0YYqrJ7HNQWZc847vFdgPnRhBvNljV5S2f6otqxzHXEsUQdXby6gJOsoym+iT8J4C2FuVOjy5Zi5Mr2oRfQQFNnDWcFrkk/Q+yYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niNsrKKGyN4n6Ip60OLL0+LAYJwgdJTFa6t0pIzmz5A=;
 b=C17d9/NHqMrYF46ZD2HyXsm9l1Hte9vg0tQjyNtq9pIVwgLbFarNBenz4y982bKKJozjdiVR9QIXARUBRA3Te3gS1tPZ7405hPV730j2rto6deHHGRNH7ztggRWr1Q5eXRWM2oWxvDFyDXkQza1pHWELjg0uS55iPI2eUQQo+u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=7HQ6p2ktQeas8tEBBZFKp6+oncTUNew
	PEkJCmWU+S1A=; b=NqH1jnloz/X4jR3TPCcQn6MxggkZXvCNOk4FrYHOdUtQQQb
	lm+qH5vdmgR2pg8eVuhm3O8HsQOk2nzNi1YqI286zHl71JZqHabtAx1Rji5VO64x
	44qiwbSnI+vgnld7NlMinpKDZBbB0I+zR9MJs55Xwmq26fIzqi1ZwPlU0ds3YmF4
	2vu9w1ykuESkLex2l5M/m08FGTxEA3zL7eyYvkrZJBmKDXNPXhJ8iJwr46k2Dg4d
	ENxAVmQG89KxMSQcxJgGIyHZbfkaLtmPwunveTdBwBRUM/MNr+nCZKWlW3cLs2B/
	radvjN5aAnTN8qxT3YoVLXGInGl88nhnHCyan/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=7HQ6p2ktQeas8tEBBZFKp6+oncTUNewPEkJCmWU+S1A=; b=XmZc0taUAvj9
	bex3YBNqUDgNILoEGhxlqBN4FQGla6svwL63fkG9VZCDHZAUYAeXGBYb/3zmsURM
	VF5NNQ9owRbYm+9UuS2lG8L8OH2MBDLCfAf2Iu+1UXcCEBkeWJC4PASLZD2qGqBJ
	1pw1740W1E+re2dhHXotgqQtQ2IqA0tyCHsFhrWIJJH4pFloh9fP0p1T3ox+dFrF
	1qy1IdpzAbq5dCflkxLJA+YHy3dq5BX81GDeiyTfWQDqey+MYa7cgR/EJRBY/m6B
	18rwggJS4gT7UgQif3xigFGXY8ghZgQzZPlzGs5wuYEVDv0zZCqkH/Hr/rvXpTqP
	4r5lyfAhbw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: kusywaUqNERZKkusyw7vfP
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 17 Jul 2026 19:34:39 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v3 3/4] xen/console: add build-time rate-limiting controls
Message-ID: <alrmP1FHd7AzlBxC@kraken>
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-4-dmukhin@ford.com>
 <1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180024
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS4PR16MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b863a25-5938-4b66-5772-08dee47520b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|22082099003|18002099003|10067099003|3023799007|4143699003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	QnORDoHvGx6fcjLjSHnvlkYRInxVc3iOVS882bkU3Rt7ax3hQebmZBvw2kAKry+7o3/85h/5kGNU00+7sDvz0MMvmsLxPQJkgIxPiTN63hdgw+E57FPb4YkfQkwbTHs/bLGnZOHqMoKoyOhCd9d8KeA98tZ+VGmtO5VdtrXeFIVJVSdmfdbOF9LDT5UKHqaHAnzIWnovwuVkRtis8bfR7qV4YjBbyXR+SkJQDesRfbsGzhWBY/XCIgQ+u53QY45beF99qeFqNQP9zK6E7+rZ+s+/G640Ir/2U+dWMA9ktp1BBIwjnK0rOcmjTmMNK8tNjyYS33T3+eZ3U6WCDM6VJBy+K11QZeyCexnuYUNMmgkrhXTnliDbVXFtA9aISPmurQI9avDtGXK36p+WLxN+9IZrvp5ewqS0SwSUtKm+JwrxAJiZiMGE3yg3qK5Yk8SwYdrK0UT1eG4sVdtB4BH7FLspxSV5JahcE6W+vQYAozIbl0S99kpKZcL0KyTL38fvkpCo0CoF/rQiQ7NWo+PwcKOloopzZtsd0AWdL1TJXtV29VTjuLxpDEeYZWUIJ6DCmCeyrO+nQQP59uriDyMnmEVR3OlFI8WxAiKXhss2QVjONn4g4Y/Pk7lygF6xph2OAz//4HOcfR4gMvgk6smeEkmNxRESv7oMfnbX1ZyEA38vZbVOMVN9fEf/hXUXIPKZSyWSmjn3cyQwOCxb7Fu5kg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q/+NBCWv2IIixKKggxhykP5eR1Q86KC/O/ZOqV2zaWD26jd+A0lWZzN+hlDrdcoxeb4J315nsySOhi5hMBqUT9e8PufuaQMQiWWLJWmtz6kUXOT4wh3oF/tIJtHFR5rrsRPPd18My7+ZBz3acQCiMjkiwrQLjh4/6x2MwGoauBwlF/wMsA8TAe6OGeIjy+6SBZdd79O999OlFdh1BNL75zx96NgDj+uBXT0u41IhE/8Itx6NY0DZMMH/i1uo/I46F40IC++SyvI4PNQPUIYtISnHkg2jXRYk6NujAvf28SRoe8bBQZ7rpIgHxoqAQFB/e31k9yItbdqBJzHIeRh9HOFWT8w4KpOhfg3IQ3yzvADyVAZqOqKM7zmw1CVHveMYgTJFZ0eCKzp8tcWSInHQXb44Brdf/yrcEC4R3FGtGlsE7+bv3RL1pKyNtMvl1gai
X-Exchange-RoutingPolicyChecked:
	K1jVAhDDugGmcWdlkD6oj+EXnmG5f8Qo00CiM0P6pYP0THRZvOZvP1GHJujFfXOj0cmr+naJUiFWVXUfUN1AH+LHoXj7+geQY8+gBENzDtR6W1XZ2PtOYTxfUjz+IzPuEGP9qn4PJzw893qMe3QXVoQ6ZSXhijWDW7aHNFPndqnq7epotVxFVS6afTUzuGdvF40y9Kya9QawKL0xaB9VzQpUZ8AZJImKS1a4o9JQ5loabie2OEc4yMRMMWq5ehGU2sZG+o6LxFKDQ4nP1mkX16uU6ZeS+IpaQHJ9fwaxtEhLG1smti92LJb16BQ7GO9B54JOgO+IcCNr/I32oA5/Uw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sKMbZAWyyInxxcG6bKXRQxI3nSchsGIHxXfopJaC5885C8WfBCdIWXr2XGoaEgogObuhIMKTlT+eqtRFFB059VZaKbEZEHaUFrTdLMLbBg0/0/qKFN9R42BeH7AosVUMPVk/RNGx7CegfSqBZP5r/bHRQkFXbZnJKvDvDjfNSpVAtZi1VHgOFDbUJfA/2170Oo/e2V26Dd2SF4jUFvp6BMtNhUhXqetSaIMZyst9Fmd7ipLM3RbLlZ6dZzgGPL+zeH3j/vQyNoOVQZRI1tpywjCu3pGu/VVn+BteIGb9bXwHhLChBnkDhcpRrTH8RQkThz+umkwBbDxpWr1pD6KgM/ANv430hgeDIwIKUTCHNdDPCaF9ytcXKUYXGpVpDQJKNautOACLXba+WZnYdSUHphFlfnFHGfIMaB0ZjMJJ5saFKFPDXcsyTF1YmXP8ORmqnx2TRBKWjLwhNyt6TGFkeJnmBXb4GQzmYycLVOx+tYJ216qRAsjInzWxZ5inoBO/HXyxiFjCSdAtEHDIgXGFsWORQZkfJnhc9M7lZgf1ZBWXPqUS/2KLD65NMxhKMH1JX0IgdgfD+q/4soIzJPcf/N0LUI+8dWvuPZ1X7/UeAZJU1rjpwUqvK118fQh1G/f3b7TBBruEPxXajmndu2TMww==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 02:34:44.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b863a25-5938-4b66-5772-08dee47520b6
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR16MB6972
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAyMiBTYWx0ZWRfX18Jt/MLHNKW5
 qOoeoJe1OCqJ1uw7h3QRS8/Akk17H386wy+gs8AfqBFYxE5lPA0nKsD/MwO+9az2GVLXS1Fbg79
 wMP+Y/A5q2R5wsSZGczyISo6x2+BAAfZm83JH6wMNVKnF2noW+MD
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a5ae647 cx=c_pps
 a=fdYRkKHAJehZsuGPaltaPA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22
 a=cbNQJ9GKAAAA:8 a=KvllD96pRQnmboTzS8IA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: vKdXCj83MSNT6vBS1NbvZlKk-8oEJWrH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAyMiBTYWx0ZWRfX0zK1j3J7AWdz
 RXXL20TzJGL/opw6iLMx3mRtOxxN3qMGOiMubZ0CVbzfYrjOQeP6QyCCtfitQ+aFAohPcpXw8Ul
 hvZuGHxmO8deTYA8q/Yk+k9QH0mXayGmcVp9xHo/hztKmTnfxO3da/GUB0i224DgzOr9RQ8d2hA
 J4wwriETMIml8LLJyHD3Wmdph1TKPsBq4Jy//HxX5k5Wus5UM4zv1dX/klHSeab7bvJ7gtE/ULb
 LhKhapw+32arOAq++XKXTwEmIh0QMaYksk7ppxkSmkCpnZWf8lNckl7QgXEpQ6v2b8H25gF7Dfx
 Fb5IuUiPi5sfOA9S2o0D3l6XgP4z3g+iUleKu2xEs5QIoYkaivKqNm+8kAnz/0KOJwKG1Qwf9kb
 8+WeHup2jfgn8a2E3cCEkqO3sxZp07aES/+PQZc6w+M1FU3KnNzKazmkyUD1wNi1b0SZEYlcSIe
 6lNSxfCMvj10C1Fl7GQ==
X-Proofpoint-GUID: vKdXCj83MSNT6vBS1NbvZlKk-8oEJWrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180022
X-purgate-ID: tlsNG-16d1c6/1784342090-FEC7777B-9DF6F5A8/0/0
X-purgate-type: clean
X-purgate-size: 2767

On Thu, Jul 16, 2026 at 11:59:34AM +0200, Teddy Astie wrote:
> Le 15/07/2026 à 22:24, dmukhin@ford.com a écrit :
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
> > for configuring rate-limiting policy at the compile time.
> > 
> > Use symbols for global rate-limiting initialization in the console driver.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - moved rate-limiting controls to common/Kconfig
> > ---
> >   xen/common/Kconfig         | 29 +++++++++++++++++++++++++++++
> >   xen/drivers/char/console.c |  6 ++++--
> >   2 files changed, 33 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index da80fdba8469..fd22806884e0 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -672,4 +672,33 @@ config PM_STATS
> >   	  Enable collection of performance management statistics to aid in
> >   	  analyzing and tuning power/performance characteristics of the system
> > +menu "Console rate-limiting"
> > +
> > +config PRINTK_RATELIMIT_MS
> > +	int "printk rate-limiting time window (milliseconds)"
> > +	default 5000
> > +	help
> > +	  Specifies the time window, in milliseconds, for rate-limited printk
> > +	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
> > +	  printed within this window.
> > +
> > +	  Setting this value to 0 disables rate-limiting entirely.
> > +
> > +	  Rate-limited messages are those controlled by the `loglvl` and
> > +	  `guest_loglvl` command-line parameters.
> > +
> > +config PRINTK_RATELIMIT_BURST
> > +	int "printk rate-limited message burst size"
> > +	default 10
> > +	help
> > +	  Defines the maximum number of rate-limited printk messages that may be
> > +	  printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
> > +
> > +	  Setting this value to 0 disables rate-limiting entirely.
> > +
> > +	  Rate-limited messages are those controlled by the `loglvl` and
> > +	  `guest_loglvl` command-line parameters.
> > +
> > +endmenu
> > +
> >   endmenu
> 
> Given that setting 0 to either will disable rate limiting, would it be
> preferable instead to have a more general PRINTK_RATELIMIT toggle, where :
> 
> Setting it to true would enable configuration of ms and burst (rejecting 0
> if possible).
> Setting it to false would set both to 0 hence disabling rate limiting by
> default.
> 
> And we do something like
> 
> static const unsigned int printk_ratelimit_ms =
>   IS_ENABLED(CONFIG_PRINTK_RATELIMIT) ? CONFIG_PRINTK_RATELIMIT_MS : 0;
> 
> (similarly for burst)
> 
> ?

I can hide both selectors behind CONFIG_PRINTK_RATELIMIT.

