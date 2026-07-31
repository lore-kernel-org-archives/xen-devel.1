Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3BFC54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 04:43:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378715.1623826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpf4k-0007we-J6; Fri, 31 Jul 2026 04:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378715.1623826; Fri, 31 Jul 2026 04:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpf4k-0007wV-DQ; Fri, 31 Jul 2026 04:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1378715;
 Fri, 31 Jul 2026 04:42:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wpf4i-0007wP-1P
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 04:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpf4g-007w8W-RL
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 06:42:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6c276b-bab6-0a2a0a5309dd-0a2a4501eafa-44
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 06:42:22 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6c27ab-5984-0a2a45010019-94a3921765ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 06:42:21 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V1uTOd3242283
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 04:42:19 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4frc7e43fd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 04:42:18 +0000 (GMT)
Received: from CH2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:610:4d::27)
 by IA1PR16MB5288.namprd16.prod.outlook.com (2603:10b6:208:453::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 04:42:15 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::73) by CH2PR19CA0017.outlook.office365.com
 (2603:10b6:610:4d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 04:42:15 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 04:42:15 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V1vrVU3135500
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 00:42:14 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbs770k3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 00:42:14 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id pf4UwgSVOjJj0pf4VwVbj1; Fri, 31 Jul 2026 04:42:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=Hq4WjT+4KqxAol7KOfUzCVNCO0m
	cidLSBw0Vu6r7FLg=; b=tD1X1u9OXXJusYVydpjy45qIw4fKTUm+EKrxKNMKC4V
	4Je8kpBYtCvpPYOTsDIGQJDj1//m/iLeyc0v+WeB5mAZkGCt+5eDwcdCdXO6mT9R
	AASDMw5zAQ+T5PdPoU6sMEtd1xa/KuQAi3JrFT7xt1MJSEnrImwUoPDmKfDQcyQf
	Wz4y92KSk4YkyKPnLwvSbWOnI01W+Cd0TNnQVEVyv3dS/ptaq9Fph0/sTcaTU0yL
	smVv0D822xmS6BKR3LGJJhoA5YuC8OOjhlACRLofCpthW7R6RXo2/rlOxRKn5RBc
	yXVW9eMcqBboRxbiUGabQq0d7l4LJ+YyN6VEEQtFuqA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2Gn4Dfs7ShkJEkyS+gOlJsfRRWC3sOuXcWrOlIcO65hFh9kxBBs8TQNQlpHNDrE1J5t1uRPfJ3HXH3pT5xo/NcrC8OI7DpeAGocZn3Hh3JWpAkK5Ys53THs4dPg/GV9m9HTE5sMdVQLG2IJhoR63yhCWvise0gM1uCbXmw8R4iMQPGgmhVN/ooltXgjwMFSZghK1Z/IT8tywo34X8yvX3LGP6U5o5qHgx/f5RAH47gvfvjeNqO5ZBcEh1pCioLTfqV2l57gk9bcsUrTD7p3DKPDf4M4CyZ+yD+RfrlpxYsZZetMpYhFvQArCzMcC9/UBLb4KhfLyO1DHpxEECOdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq4WjT+4KqxAol7KOfUzCVNCO0mcidLSBw0Vu6r7FLg=;
 b=KXLyO8w0P5oobd8tWBg5TkhonRWqCFSx6fYy+7kaaZ81boOwvj5XZiDOi8GZEstZIXibF3zCpJ0R78UAt7mgz1gQpwEHea/vl1s/cyEZGw3wgb4MU+n5tDJkkpCn32HZbqI5z6XHXDf3jgES5Xn96QK8ybqE4xqBJ+eVEUmc2GMRwphDLqFokUWZkvTihAAR8o0l7RVVCl0VdBnnxtlNgcqmerbrZGaPm32kKBV3b2xXrxy3pbZ+NhcLs50M7wgCT2LVbWOhzFJifsvGAavxk7ogN8XMzqerR49zdu5sdczyNBvedn+8H8ybrHiD/VPGu0qk/5zWQHTQKxwToSkbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hq4WjT+4KqxAol7KOfUzCVNCO0mcidLSBw0Vu6r7FLg=;
 b=X6n4Zc14zCkHnF7DQvvytWVXDfxK1+QoAgwvvcGIgZl0cFVdWyg2Fm5D0njK8p+NdcbkvakYUMW2VjFnzwvlFDv2NydKzb9emj2hyrd7niafe6JUeSmBEfpij++00NtrtlGV/ns7SfCUgXdmflETLm7yP/2I5IobnzHfw06QvEo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=Hq4WjT+4KqxAol7KOfUzCVNCO0mcidLSBw0Vu6r7FLg=; b=WyyMqpLwmTia
	iEYV1AsmWeyJ+Y0C0DBpIbdgB78kdy+UbuD0QkCNT+37g8C5bca9l6qoyEvOdv1F
	brSk91A8kZSgoBFxmpr+8XEKtvDo0D3APbRN5f35493KOKCfwkv78Kd4Qta4/xGM
	qICj/pducYmRKO40OFEE61lYxDNs6eyBnMHbzIWoshUX8DbhS7cwOBMt7+uBeZ3X
	LIQeQbrmqO5ZQiIAutd/M0WoTTprXJlf7zj8IjChVnl4HLZeFlFdDX36y6rJDYkG
	xZ6fm7gt4sX2XI/6217CuFzVCsbI/299C9TZ9iPTynjzDH9BG4FtbLRnbYR4WxtB
	zl4pk2X2hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=Hq4WjT+4KqxAol7KOfUz
	CVNCO0mcidLSBw0Vu6r7FLg=; b=T5YR5egJdwVGJjaxl6HAOqwB0hxrbLPmgaMn
	1REsMoLgPe8riGk269HMVthndzbmolAzEl9l77Ey5zXw7+eOYgchJxiNSote06nA
	KOYp+GmqIxdqd8E1qB1ZonBrwuLs486tdnCM6G0SuhbDo2dHmLr8QLknNvSzEnEq
	68S/JAkUm+IldQo6YNT3FSMF0TNPF3x/DnkNsZuZlEMjYPg9ANGyzpRBGsdBPQ7g
	25a1PxIfTSCxu9LIK1nPEZhgiX80y+LJEdX/fN1hB4NpmFfItv0S3m2sct6eXJzA
	kcVxNO+AzdDtR2S6mVvpe+TLM0IzEpzAOqygcQ2aSqgBSjrQNQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: pf4UwgSVOjJj0pf4VwVbj1
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 30 Jul 2026 21:42:10 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] acpi: reboot: log reset parameters
Message-ID: <amwnolcHTioaRjpe@kraken>
References: <20260730001854.905354-2-dmukhin@ford.com>
 <f71e5d41-329e-4859-9744-c390e26bb5f8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f71e5d41-329e-4859-9744-c390e26bb5f8@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310027
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|IA1PR16MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3d7c8c-596e-4a2a-3311-08deeebe184d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7hPePeqT0NVXoj2PnvZLMgxblFDtAF25F0Ir53EZQSBF9ahf4bsSEYzqC+aGavvfWSso241dnG0sP5QcNMZCDkUiExl5g3Ut4W+lt+EC82H2VYgREZq19+KtFCGORK2w/P5/ArV8Im3BLL3CVe6yVdiYeVwIchwJWEKhEpwWp5soLZzlO2N0zrK49uSxwWoC+LYWIyASI1sffqcW66C95IadyiQXr+dA931dNQnB6XYH9glTROEZSGDMrQ82ZSrfbv2TbTK9pRkNbnFAoiDipgpRNiwHkunnrd6QwPF2LgN6lp2MlRz3X+su908viugvOJFLnxyoTJnjhs2F5ZpGsy33Eu4IYe9if9fs8HL014ggi/i13akwVjZXgYKmxb20LLeN8doo0SUks6eXg+Okne2qPXVl8SsUXh5xtUHP16nD7SiIh/Y0ZxSy8p/gkNkV+uX53P9CFEOI73HU61bmGYPMUcJbcsBZXQshL/TKoRf70bno/UPPnmL2ttXu55VLcnhl3vQyEwMYj9FspCawAXX+ttUjE8/Wb5XE4W/g0PqT71UXcs/e2wA5m2WME+SKUqgCNTBTNQ70IyS6gc01s8bKvT2yDRB2k+CT3ckaMFtTP22eOW1wM5lwpPdZbtrKJTEsGGwpQMEn1xqocPiT0ouhjrvi5NxGglxWxTA8gdZMx9dJ3KIiEU26KgFscOz1z94WX1rd94I1s1mweI7vcw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jHIw64MNFzc0KPEV98mDSYFGQC5luUSKxbC5GqUc6ZwAyl3N1MY50Yr1R+9kxQarLeEfycUt7TuSlEtFvnuzPhSRNfkorqT+oT5tSpzUzV5Koar2IEyBADuXWc4+WzVNBOJRtbvB8RpFidVlMILllPuMJ/7R3pTFEbM+uM3QHhcgg8VTh54mRgDLqYF+MyXB+LlYaKlobDdwol4UXB7N2pmxkoVR1oLuj1JRmnvtL6LkMKNfLM2fD/V/YT0R1V2edh5w5ny2X4veYjqtXWi6sxduHGM5kX4jqXfVsZ9C9hNSpVtwNCziFthmhU7vBqScgM30UcbZ0gHpVScFPTHlKzFgl9a2DdPjpPjF9ofeBtS6m5WdgtecVER1ylqsQRC34IN6K6pj5oghMb1npoJQXO3Rx8r0oHqFA3eY6I9hfYFfiRBWLfLp5B4KHRREgtS/
X-Exchange-RoutingPolicyChecked:
	rUaVCuC6a7vJmd/Hb3irte1OAnMmx2A/YQP3fvM6XECOP1rqKrBvRMvcphSlqB2x8lnS8Pvt/xZFtZ7XF4oKccIHO7tS2EIzLZIKhNwmbaePFQPYYvVk8y1WDYTqQ4116rOCc4m8D+qrxCkeN4pjR3qNfDcaftifihvST+2HNnS7UOAJbVGgfCiMVLSYM97akRAas4Qvgoa5iZXRFKVAqdT59NAVD9ZqYTm1E0SnqFsNhRgVVwoLSFEAsyMDXjvgBh17FfGlmHo7yox24gYMEjtRLCx+Su0VVR/QAqZ/Qe0LWPhQuT/sv4uckqX7bydhpjRF98GbF6XIyhevo3CLpg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yq9wPN1QsS1I/a4LaKYiRtX+kOQFPPprNW0y5KMK5Z3nGiuS0r2D7+6Rr2ccOPqZHI6JMoC2y34wCfw35LSwg1rfJPSnEqXQguR5RD/ROKfZ37HY992J4LoMLSgHZ2FVeiRkRK1c/l6mWjiRJgHlMkc0TQhSAlmRcRnFjJX69ZF8kPnqpCwQS+OG2EYM3Wqs202nJI351/PnIdzI6WrrPD+AAPESmFbHeMJxDQssBsHArqStZt03xxgFwx2mEf1LBTz+U9srFQG97s1M6EvLwe4gJQj/Jn8Zr2A6aAFGTjwuLyEY06thF2e54tOiGfp+2BJaHVFqTzJctrzdhAgP7wcJwT5e9c7CtbXCyqXAArK5rxsAdOvNYpZ1xG9lL2S2i4jyGJu64jOomvmzJ3AqXVhoZkXNMuGIwsRM+k9Njgkir+7MyLhPzQFoJOqSS1vFdWQ6DYS3dypzvsHCwiattcDYiN7VngVKyErXimjvHnRa60N24c7h8FWQnC+vvyHYG3vrSsOz98Hff1xPY1Ryenw1ET9VWXgwp1zgcE2KZFdhYbdPMtUidSlcMAudKRL1wgmbhUel6kSq5UPYFVMo+itgfciHqHPqAhgRy3qpT5vd9Gb/2t8JWntGaYT6QA+6j+DUjvSmeCWMUxJFjR6s+g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 04:42:15.0675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3d7c8c-596e-4a2a-3311-08deeebe184d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR16MB5288
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAyNyBTYWx0ZWRfX2dLF3htp88yi
 3PvlutYBdTJXNhUAymsvN86JUbecucbBZ4gJsecsIJ3LnlNSwLHLdj65D4BnsXOV7ZnI6781N9X
 v72gVokcT2tqeun7dwDc3Q78ddBtqGrNLUXFUoQch5rSIE3j//Z2
X-Proofpoint-GUID: oMdHp_ltnMEB90WS-U0iiuhgRza1q-LB
X-Proofpoint-ORIG-GUID: oMdHp_ltnMEB90WS-U0iiuhgRza1q-LB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAyNyBTYWx0ZWRfXxMAZrU82X5Zt
 lKx9V18uCn1lg++JAp8qZpRuVO+YZPbynoz+Y/jjDshdaY4TNJRk+NRVlyUw8mIK0xNVODpIvZz
 VWg3LgauaZu7mkUYauzjimpPprrucqkLfWqle2/BC7RFarjAX60QvwuY7PSz7MByiBc18SBm4BN
 1lUrGWinObIZPSIe8Y7Kds9TCOkn1WM9sokisA1Hi4RN48mln490b13rvIDpxkH28j4CnubeT8e
 wXTqArFXlkgmETPCIukgdhfZ6Xgw4p9myQJ/2qrUyWeks262t1lUXeziibyUnjyuM/jkatyfqfy
 KDLCP1ImKoI/aVRQN7bgB0l4t5MNw9VOuhS+W8uDDw7fR9YWbi1Vf2DHJczqXFa04TlMiTZE30A
 kU4fPiLlOVCbkqqS+hVsrrmd/qaxFPJqOHA/Zl0pc0kS99GnYpiWsEzT1pKNFhLG/C1lwE8bqa1
 Oawjt3b9uiQ1GURsBqA==
X-Authority-Analysis: v=2.4 cv=Kq99H2WN c=1 sm=1 tr=0 ts=6a6c27ab cx=c_pps
 a=Ik8WVU4vKgjy7N2tmpohTQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=cbNQJ9GKAAAA:8 a=5wsYkIIrmv2MwfxbtaUA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310027
X-purgate-ID: tlsNG-d62444/1785472942-1D47D757-29F24A35/0/0
X-purgate-type: clean
X-purgate-size: 2817

On Thu, Jul 30, 2026 at 08:26:38AM +0200, Jan Beulich wrote:
> On 30.07.2026 02:18, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Xen does not provide much details for system reset debugging in case
> > system reset happens via ACPI subsystem.
> > 
> > Log reset I/O address and reset value.
> > 
> > While here, fix the missing default case, guard it with
> > ASSERT_UNREACHABLE() and drop full stops in the loglines.
> 
> On what basis (i.e. thanks to which earlier checks) would this assertion be
> legitimate to add? Besides being a wrong use of an assertion, it also breaks
> fallback to alternative reboot methods in case one doesn't work.
> 
> > --- a/xen/drivers/acpi/reboot.c
> > +++ b/xen/drivers/acpi/reboot.c
> > @@ -6,6 +6,7 @@ void acpi_reboot(void)
> >  {
> >  	struct acpi_generic_address *rr;
> >  	u8 reset_value;
> > +	pci_sbdf_t sbdf;
> >  
> >  	rr = &acpi_gbl_FADT.reset_register;
> >  
> > @@ -21,17 +22,24 @@ void acpi_reboot(void)
> >  	 * on a device on bus 0. */
> >  	switch (rr->space_id) {
> >  	case ACPI_ADR_SPACE_PCI_CONFIG:
> > -		printk("Resetting with ACPI PCI RESET_REG.\n");
> > +		sbdf = PCI_SBDF(0, 0, rr->address >> 32, rr->address >> 16);
> > +		printk("Resetting with ACPI PCI %pp RESET_REG at 0x%"PRIx64" (0x%x)\n",
> > +			&sbdf, rr->address & 0xffu, reset_value);
> 
> As indicated on other occasions - %#x and alike please in favor of 0x%x.
> 
> I also see no reason for the 'u' suffix on the literal number. Plus if one
> was wanted, it would want to be 'U', to match the Misra-demanded 'L'.
> 
> Also - nit: Indentation.

Thanks for taking a look!

This file uses tabs - I can convert to spaces, but in separate patch.
What do you think?

> 
> >  		/* Write the value that resets us. */
> > -		pci_conf_write8(PCI_SBDF(0, 0, rr->address >> 32,
> > -					 rr->address >> 16),
> > -				(rr->address & 255),
> > -				reset_value);
> > +		pci_conf_write8(sbdf, rr->address & 0xffu, reset_value);
> >  		break;
> >  	case ACPI_ADR_SPACE_SYSTEM_MEMORY:
> > -	case ACPI_ADR_SPACE_SYSTEM_IO:
> > -		printk("Resetting with ACPI MEMORY or I/O RESET_REG.\n");
> > +		printk("Resetting with ACPI MEMORY at 0x%"PRIx64" (0x%x)\n",
> > +			rr->address, reset_value);
> >  		acpi_hw_low_level_write(8, reset_value, rr);
> >  		break;
> > +	case ACPI_ADR_SPACE_SYSTEM_IO:
> > +		printk("Resetting with I/O RESET_REG at 0x%"PRIx64" (0x%x)\n",
> > +			rr->address, reset_value);
> > +		acpi_hw_low_level_write(8, reset_value, rr);
> > +		break;
> > +	default:
> > +		ASSERT_UNREACHABLE();
> > +		break;
> >  	}
> >  }
> 
> As you're already touching the entire switch(), would you mind also inserting
> the missing blank lines between case blocks?

Yes, will do.

> 
> Jan
> 

