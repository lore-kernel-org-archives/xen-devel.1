Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8ABC5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 23:39:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388676.1629673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw3b-00040C-Dq; Tue, 11 Aug 2026 23:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388676.1629673; Tue, 11 Aug 2026 23:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw3b-0003zq-7a; Tue, 11 Aug 2026 23:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1388676;
 Tue, 11 Aug 2026 23:38:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wtw3Z-0003kI-Fn
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtw3Y-004Frg-9x
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 01:38:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7bb1e2-bab6-0a2a0a5309dd-0a2a4503ea64-36
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:38:52 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7bb28a-fae8-0a2a45030019-94a38ff1a5a8-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:38:52 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BNF7FD2550157
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:38:50 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4g0cat0gsm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:38:50 +0000 (GMT)
Received: from CH2PR11CA0023.namprd11.prod.outlook.com (2603:10b6:610:54::33)
 by BY1PR16MB6506.namprd16.prod.outlook.com (2603:10b6:a03:4a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 23:38:46 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::e) by CH2PR11CA0023.outlook.office365.com
 (2603:10b6:610:54::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 23:38:46 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via
 Frontend Transport; Tue, 11 Aug 2026 23:38:46 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BNFguc174340
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:38:45 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fxjw5bn47-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:38:45 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id tw3Ow46T2QLYTtw3PwVLgG; Tue, 11 Aug 2026 23:38:44 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=lfC
	78eHoWgYYe74UlSw1vBBwAHUxfo+fJj/g8JTvi60=; b=Z4x6H+bQFOAprHkQt0r
	2LEnNBOspDJ92HcxU0e77iIz6QtU4S0j0aEldmPz+ImVgSbFaR81QFL05h+a4zLa
	xdZ/pXJ3vR0bYxOKvW30hMmP104pIgn0DR1b/EYCq/JtUqSq5Y3qaHOpZyJt4onH
	v1IE3cLoX2kpdWEjxBG7BbNm1uFDiyr9/BcDag1Z185Pl7gaUozuS9/dJhKlGW4n
	qrn64YkagLm/cld9YFhYLimkVOl4u6Jr0tKMcnnAmPrIbhA7EEwYur4l54wyxeee
	7prDzI0X5MQBPOOIH7tg5KQ+GOkK311EhROYY6yIrlprWO8DJJGvirjzDFTHssyB
	o/g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+5jid48BtMC1HBJDL6OMtAgFq6/imvmdrkGQmM08DuTNC+dVxEPFDxp4lD+TfORuij3Vk20cK3NLodTS27ms0MT1iRbR5VxsIS9CqbPzaemej1VWVX5JLK1zoOMqk82dMoyJz49ih3WPEfB76AD/dGqpRHpPuam+7eyFt6H7X1bKk9MMq76AA7Z0sHgUv4QnXKpm8Y6e/3XX+4T7UYeSYnGohGksnL8ZZUdPQwpwnHueSVrxk8pVCximMABawxi3er/51XQIppaOSYdX/jXeiIpdZFaAwE9xN4YRF5T1Jkm5YqOtxvNYWBoY7aOvHA3LO/RH3ln4E4pbQZNeTmoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfC78eHoWgYYe74UlSw1vBBwAHUxfo+fJj/g8JTvi60=;
 b=Mqf+Sw3W7jzL3h+h1Ut8BPqO8Kb/TV4p+L7qFauRg27fFlCi1PAP8A8vnlwBLw5JgiKUcmmWVUbsV79PKw32EOBYzQGNh6NEk2uYdyeAqd1PU+kYVoJBmYwOIdSVbG0i1D7TQboo3SW0TrMuMmS4AX3julky+qGI+o16akBSRUDTErk8eVRqh13wIDwxAvXjrp5FciiqMDu3k33xWGR6ybgciVvoFSgraF+2Xdzs1mwB+JTJZTT/1FppEtSb3p8lbpfLhTKeSs8zQIpFkYNse4NbXS5Fkl+8+9hhsJZUaSmMBf7AFYocuArVsJ6SUl1JB+JKS7A9wFWMHnd+REea+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfC78eHoWgYYe74UlSw1vBBwAHUxfo+fJj/g8JTvi60=;
 b=hL5KTdglM1APsECmTM8+P5l5VfoSdrXu4Lnz5GSdvGtzL0MiRdrl4qDBLtJdtTpJK9guPEPsVFlsGuIV3aPmQUgyr/zU8gIThnPMjSWWV1lFBGsFzhQuZDyN4dzdBCgWR6Bc5NywePFU8L4A/7TjfSzgrOcYtVobZjt0aiZmvV8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=lfC78eHoWgYYe74UlSw1vBBwAHUxfo+fJj/g8JTvi60=; b=
	Olo4GwK5q/KdGPKuVCtXnD1hqQbUYDlWw+Ip0S94xVJCQN75BNuoGoHYwm6LKERx
	ow7zP0ufHPjGFoatPkbF0GW6SldGa77oRzHnMedsUpprZHBMzib3zZEXDfG+c12o
	MmsO3K9h/SYj7h7X3AKg3pr32MfRuaC1AvHQWPHhmULrS8wSKvdE+ntgicpTEbPH
	TaIZOOghnn+GNijDaNCYVvixJtsohOqN3BtHB9gk7aLVOX0UeKGZreg5s5o8uPm6
	pGG7x/l644MgUACOEvZkjbWzwGQo5kcR3TBK6hBSyq5VN1pI21eH8zjxir2neoIQ
	zP+0aefE1B+j73pmGqe0bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=lfC78eH
	oWgYYe74UlSw1vBBwAHUxfo+fJj/g8JTvi60=; b=XunKjxrJqNpYsUKCUH0+p4W
	PPfYvSdn4Kb9SedFBUu+vWEEX4RKdhB8cujc+pGjnzmLDldjHOROvpoUoAQSBCcX
	jvGzToiy2Xnmzwjn6IMoPidd6Jyn6XEWxq0C9SF4EpfpI8BopkE+yA0BAvyrWOTc
	qbN3sZZGWkdgMmGqoZv5G44seNMlv5IZ/pJjOiENdpA4+Yttjf+kiaFlaXPP/TGA
	1Dvg6Q7D//RsgNuH5t9t/SPlnTRjdrmo/6pqhli63PMCHyYcyOBpe3wfnXMhkzyl
	vLV0u+8D8yje5yYaMbelxS01IUCMUBOMXLtCNm6F17/2F7blrghJr5oF5YTadSw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: tw3Ow46T2QLYTtw3PwVLgG
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 2/2] xen/console: add build-time rate-limiting controls
Date: Tue, 11 Aug 2026 16:38:24 -0700
Message-ID: <20260811233824.1874525-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811233824.1874525-1-dmukhin@ford.com>
References: <20260811233824.1874525-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110197
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|BY1PR16MB6506:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef86380f-366b-407e-358e-08def801afdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IEuKrutZUqu405Z8h2klxpkfs+rVa3Qc2fl3/X4zPUSvAlsrWmPL1YRoFeidFXwPbIf/iECTKGRGqD4R9OBDnuESR/lykITcve8MkUzMYFBIJfVNuzhJg7CR5aQpujdlffW4+ENRMu40Ud85iLhPmArL2i89H4/Pp5NLxQDPX3ZfNzMopU0vJmcO2Sl5yHvabGGEQM/h7NLY9XGxNBp2hGAzZoi6WgoqAqdPxemqkArnldF0RpsQjp35rsWi73UjVg7AcdFXuODMF4LGfNG5L8qKBOPHAdT+AOIMZaZewlv5dVIU4pKoMDOQ9SIODt/TbKLcqQEdkmC00QRCGh6fXcbOmMD5NlszFLsSyKtbyLt634sxEOFHwzyow4KndeS4FKA5CyhMySYUfwfme5U3bDMyY0kYFD0M+YPyZblwdwkHE1Ykkp4bZLh4gVondAS41ZS8Jumm53pirpOBU6ZX0dQeBfM9adaNLt+txfPLo1j8sybodDNoMbf3vbzpZM+qufVQu9ymQL8GhKmhqNIFY70hUxiNCJxdMpSYOD8XGEsafY7+i4x5u715oM7fPBHVyITF+6TiGHVeQRP3sU3sA57uNbFVn7uIT3Dza9SYKG39W0WS1P5CT7JtB00B/EY8QLr16UUbCSPm0qlDjlHBNJnfeXtz2rRzvyCK6tcrEp9chPYryzGp6XslxkR4wdwBqXi9G3eQ066eaB4pZlEq2Q==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yuZgVisinybyWRWMXr4HRKa6YQMSAeLiIBoQxQl5RrKTwWHzOGn2d66btwxF94lhRpBRcXAFUjSBEm6Yd5orOJvJxrKAAz+Hz/rHe3gWSQdqushyXn0CF7k/oCsK0cJvDrrsFTj9YjLS7BuuQkOUJapU7lMLtBBbvPLlhmadr9SDveVMcDIgNKLTYeeZcDtJn+xfKq1zikm0DdfVn1QeFPEIh7ooCEn5nW2Uec1KFXHEa42OCrZkk13TmeeVN7ySgEFBoeXKgARSvT4ybG5f1k764ZkWeb8Aa1o4vDG8z6Rq7b9SEkYM/WIe+3/K8C7OvV6okyj1/vV0uFPisgextmtvJDhhnBrbowJQRis5Bpkee2zossuum8XgmaDbXnjT7aeXtF8zBM89Y7YFOXu5k+VaEy+FXYyLKyeWKra6MkahUYLZYW9grt/pikg1y0jH
X-Exchange-RoutingPolicyChecked:
	RhqBtht/5rO7FOjVGMIFFZgjuN4Vvox9WMFatZE62JfHL8ePRAH/fMngG6wcW0jyuOH5kkSBU95iK/UN2xn0X4aQkmYsBxWdckbeNJrUXWQ7f0FxUJK93Ut3FlI6ZFY1bgZ/p3tg2Ha5mHwUVXbZrMWhioJ/H9MxleDpFVV8+Rsq0U0r3SrmANCFxoZu391PC3CM1xFwtV1GmRlRhdi5EYa38dG/5qFTX9qxVqhEm18JmbNHt/oSCxVUYmL/pI+vLp4mc92clyOOne7zEW/lPcMhFO7Fj4Or51MDQDy+PIbVopg8HasKqRCQ+nk1zvFK/FoqZdagvK7t5j2ftfP2/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cKu5K/FdQvo551snGMCCe0YvsCzqwB6aO32c5a8Fpqo+3GdkLSXZB2PjcFxenvhUmY+j4m3RaJtuVHjpjINdErf3K4jJ42HoObpsppI52KOo7J4xBnm6Db1SLkCLkQy0M3B4TCJ25v/kNKEHorpKVWWV+WJ0dzxEGbMSU/CFDw2QyeFyy5llUjELpx49XWVSphba15oBDd0s4kIF0SCsEEye3+PT2fJhqO2BJHwV9YSJ96BgKCf/XXlBkefMxHy1s1A3z/dMx4pIua1gKMSg6cQSjtzbWb6aLOGdQ+XVJmNACkmR0BqybFmFJ0b2U5utZ8Zdw3XU0we14akA6cX4JFza0OvA9+OH5uNFuCes/+gpJ3QeRapAAnfqfupLhxc5n+k80+KmD5t1ZLLiwwJKEiAuvFEKk8rfIJyzG3UE+Q3j5zq5Dqf/HpinH2EavUUQbEuFyrSwGEdY/w8lH9rid8p8IHIGeqQZbLun0evXdJf61MS08eAVS1b9BUhE6k/bIjd6/7p+5XTvD2miqeCZUxeS++NUFQtLCmMDyx38hBmYnUm/GRS8VVTl4fNvk59Z1xsbuq6XRCib0EcxVEnJ9N9QUpS70gXgFLZYsBqAupBE8XoQADZ6UBGK/xniU+i3AeOv+pM+aO3rgffFzcaEWg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:38:46.0314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef86380f-366b-407e-358e-08def801afdf
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR16MB6506
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a7bb28a cx=c_pps
 a=Nwoz+Mp4en+GxkTyGjE1QQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=NNVgaHFa0Tc0tJPwRXQA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE5NyBTYWx0ZWRfX/jR1HsgqQpaW
 KQtlxZAYc0nD2FZb7ZmJ5h4HlAhnDd3wfBUrM3e+il0wIg+d2S5/5o7yiAbSlk0ApkmG/H/Bkfp
 a7TGoWQRz9dI3YoGambmFKOsRn9l2+z9jbiBOKcntg47DMqMQHEC1UnNdyDfnaLQrPCLb+70xUP
 DCaCFFbWQlWyxgPuGpocmYitZvfpNa2IZ9VdWXqdp62mPmrid90NVDoFdfoqYGxp0eHmvWx91IG
 Nl4WYFrC5Snr9uvxz+5SNjQOEYuvOA6LNBrVDCJnzUZ68lB4x/SiTPvamZTM/P88iWm0EauwQ2S
 3FkJp3EbmcrdhYwzod0L+cqajmxqwkHFQ0b8XUEOux+lnjCAbPEdHVoPptU9nBBR8gpBR2YlkHo
 bIQBUHnAgvBLHfD6Qlur8ub9+/lucFMsxPI8ADjEDWmXUQnPttqVZ2ErofelKFKyNN2TajlYHqp
 G2gkX2ExFnKnzW2W1NA==
X-Proofpoint-GUID: ChUkaRMPOyQIewr9pTotpSbMg0t9Tagw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE5NyBTYWx0ZWRfX21k/7+pdzKVl
 G4NXOeMbrvYgrV/xXQcI9z8sAaEls5HFha/hjpoY3MUkfeFxQBpoRsMr+LbPE2bffOspogGL9Ej
 tf5LxsFzjdWjUj6P+5Srcu4GcH2hcqvJBUh8qkGJvN8eb5i+n0Wb
X-Proofpoint-ORIG-GUID: ChUkaRMPOyQIewr9pTotpSbMg0t9Tagw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110197
X-purgate-ID: tlsNG-33051d/1786491532-6D4D74E9-987C4E51/0/0
X-purgate-type: clean
X-purgate-size: 2521

From: Denis Mukhin <dmukhin@ford.com> 

Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
for configuring rate-limiting policy at the compile time.

Use symbols for global rate-limiting initialization in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- dropped footnotes in Kconfig options
---
 xen/common/Kconfig         | 30 ++++++++++++++++++++++++++++++
 xen/drivers/char/console.c |  6 ++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba8469..2c80fc7c81a7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -672,4 +672,34 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+menu "Console rate-limiting"
+	visible if EXPERT
+
+config PRINTK_RATELIMIT_MS
+	int "printk rate-limiting time window (milliseconds)"
+	default 5000
+	help
+	  Specifies the time window, in milliseconds, for rate-limited printk
+	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
+	  printed within this window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Configurations using a value other than the default of 5000 are not
+	  security supported.
+
+config PRINTK_RATELIMIT_BURST
+	int "printk rate-limited message burst size"
+	default 10
+	help
+	  Defines the maximum number of rate-limited printk messages that may
+	  be printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Configurations using a value other than the default of 10 are not
+	  security supported.
+
+endmenu
+
 endmenu
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 56bf111ef181..cf1c499f597a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1344,10 +1344,12 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
 }
 
 /* Minimum time in ms between messages */
-static const unsigned int printk_ratelimit_ms = 5 * 1000;
+static const unsigned int printk_ratelimit_ms =
+    CONFIG_PRINTK_RATELIMIT_MS;
 
 /* Number of messages we send before ratelimiting */
-static const unsigned int printk_ratelimit_burst = 10;
+static const unsigned int printk_ratelimit_burst =
+    CONFIG_PRINTK_RATELIMIT_BURST;
 
 bool printk_ratelimit(void)
 {
-- 
2.54.0


