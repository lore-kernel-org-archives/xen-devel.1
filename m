Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA1606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=FE+gG7Zi;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=IfRTYTQI;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=bu8Fb0WR;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=BVKUdOrp
Received: from list by lists.xenproject.org with outflank-mailman.1473383.1681044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPu-0001Mc-2b; Thu, 05 Nov 2026 01:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473383.1681044; Thu, 05 Nov 2026 01:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPt-0001MR-Un; Thu, 05 Nov 2026 01:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1473383;
 Thu, 05 Nov 2026 01:37:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmPs-00018g-GS
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmPr-00E0Zh-ST
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:23 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddc1-2eae-0a2a0a5409dd-0a2a4509c1f6-16
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:23 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddd2-be1a-0a2a45090019-94a38ff11f32-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:23 +0100
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mn6t1339679
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:22 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrbv9t30a-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:22 +0000 (GMT)
Received: from DS1PR03CA0018.namprd03.prod.outlook.com (2603:10b6:8:233::15)
 by IA4PR16MB644269.namprd16.prod.outlook.com (2603:10b6:207:148::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:17 +0000
Received: from CH7PEPF00000019.namprd21.prod.outlook.com
 (2603:10b6:8:233:cafe::18) by DS1PR03CA0018.outlook.office365.com
 (2603:10b6:8:233::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:17 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH7PEPF00000019.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Thu, 5 Nov 2026 01:37:17 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mhEP2969470
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:16 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrpb-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:16 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmPixkZZHqQa1OmPixYpeF; Thu, 05 Nov 2026 01:37:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=xKM
	I1QxU/Ai3xJowBb3M7E1rgRfwSD9G3lY0z8xfDrs=; b=FE+gG7Zi1WbY9shEbyX
	hqPZls86A2FoL8teTUyYOe8B9Xd7PQINJ5YUKmG/XEHtB18t8ko9ysw4+744pJL+
	wDzP+KVcxvqeiGox5aEf7nnkEIvcMgvF4mSq0CLhj4gyiT1ETtLXRMW6m8sJE2hL
	VPvuDzdwT7vWsTVso0u7dH3ZnMze4gvUGMQs52QxXFAABH8ZHM3J2kaEee12CB/j
	xroARCj0TnkJwBI9Oy3hXb99SD0HKmVM6x7ckMC2gjsbzJFXcrTkJfHWFGq4qtQH
	JhZypBlbo6n8DV0KbCe6QvhKOVaGpivPl3sEk6tukd+tZMrrfoDguERH/tmuIQ4x
	BQg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSrSUDv/tdI7SY/Pg8FZhW/xZwAQJbjwpKLm1g69mwTDtXFtIpm6pnwz6Cq7n3a0lppwtyaQJSqvxwBda5gxTJnDmDO8vIVxD7djGbV4Ez55veop6S6Yek+bSMSIeMJf0JHSedOpFF0jRw9vtSSv7khRX9mGpPoJwNKhJPxYOmvoVRyGfx2qliZw52ATEcML/A3A7HDjhkPTKxAXyEC+r9dKG/5uHQqa0Zfd1ZS9Q4JaDZLYyVnqSwrnxzjpSJE/haXm7aN6u5YpnA7K4ktedXPQxLnUfx1wTDIpUxShid7D+/C4wOsh7OeF1OogSl/aTFkTR5QCOhJn6zUOeAY/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKMI1QxU/Ai3xJowBb3M7E1rgRfwSD9G3lY0z8xfDrs=;
 b=WfVTmOkRTsn7mnLp2uX/7SR1qMJNhn0ycFwvdXYbiOT3ACoZQ6Q45nd30cL3/bN7g9J4TC6q9ccG9f4iWCW7hFvLiWSBYOi1CM6Vb8TYK9kgIXjCEibLYmbZhLXCuHhmVs88yX7NCy7fNcjv4JX6DYuZWEE8osymtXT2m8xmqQ5BwkSPtWVWRcjkmCl257q2/a/RU4xAdml9we59qLqoa2jLKexwk05J3nnWOCih3zH+0O+QO0iSeDdni3QhxUyfPrlEGA21MwuGEwxeCxRNCBCGGEYGCD2HgNk7ywOeZ4oZaOIILKODCRCd0sgsw8C3TohJl3kmeBZhk9TIhWSlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKMI1QxU/Ai3xJowBb3M7E1rgRfwSD9G3lY0z8xfDrs=;
 b=IfRTYTQIoLngtmhTD+WNXecJ9kKfCaYdZ7S2DkQT9829qZ+3Io1WO/oCe2hMLUCmGnv6PPCQo8Lv/w1uvfsZT0kekETiLrulZ0DRcMXYgMPhSTjGSu5fi4uUmTtDHrrXcWKcADXfl52SQWTUkR1JHFoeNPpmKqHeCaUfpfshENE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=xKMI1QxU/Ai3xJowBb3M7E1rgRfwSD9G3lY0z8xfDrs=; b=
	bu8Fb0WRpOzpzC6AIaydDi/maqeQKSyhAtlXjHAyEsJeFl0KuaFE4b7lPbl4byEU
	J8O1qvklBFtthtvyIiu4WDdBhjAz2xG0WznbltWCUO/37PHX6n3J1DT5i6az9q1A
	5+Ep4MxXf3vZ0Hcsg6HPXbmXn3+8aB6vvqkAqh8BGYPFMQz6XYetiSeHKWNeVETt
	Jv7V+OhjfqDsmAy2yzSfmZDK8BQW+CkQ1pl/Vv3u70YRt03mSXePxYDaqL4C2rlU
	ngRN5HoT/yEPFoNteXu23Bz5Tfwnl9JBw3LMy2aF31xRcD6/ZjzShLwSEXXVSrAu
	Qnns5ipUeXdabSo7fOp5ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=xKMI1Qx
	U/Ai3xJowBb3M7E1rgRfwSD9G3lY0z8xfDrs=; b=BVKUdOrpvhhN+33GrrrmVwn
	k6IXsJnd4X9pZKXzGuLJPmMed2KruTBv2SjS18O7NgMFBxIxU5TI1yrBBFveTeDe
	XkP6jTGqk1VabRIi1ze5Hi1Sm5JY89ZapY9TfE5KZhTAEmG3IkC2dlOghfC1l8Hv
	XboVDTAZ5MimW+6jpYcuvOoVs/atLlFaUwwQiGW6PuFlR4BzlgWqVWPxzKC0b3zj
	BXcP898AQvipxn3XVDMWU2+iQEHy7m2YrEP+Kt2MoYX1iaPcavahqfGyQ6Mg1Z9w
	FNCAdDoVSMxcA+LlB5upW9cNcONQwFvlSA897NjGp531J3eHUTQCKbOUe0hdGHQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPixkZZHqQa1OmPixYpeF
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 04/13] CI: enable XTF build jobs
Date: Wed,  4 Nov 2026 17:36:52 -0800
Message-ID: <20261105013701.719658-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000019:EE_|IA4PR16MB644269:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20fbe84e-9841-4acd-ff4d-08df3add53a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|13003099007|10067099003|11063799006|261021121427099003|261028144727099003|261026121527099003|261102123227099003|261026140227099003|261009223027099003|56012099006|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	laLWfneKHkPT0lcRCum4xwWyrEzD3SScC9sAcrlnu9LhM35zvMuLC3q3UqwrLHquif/mZk6jih1ADXlsiUmaFRo9c58+dUJS+wLykERa4xdwLN8pO/DTNtZPlLxlBSKMobOpM/8EUSEjgSmJdZFXDWIr0618ccdAJx/YTefI7lta7zTUmgIvtS/wHM+SAt3XfWzApT83gpDt/2K/mcdJV0odsSFuX+KQI5O+WziG0/9quNApIKVhnIXzTsD82W3vJ5TmDWaaGpp2tc+aa72M/jxe5xsym7RwNhi6+0iR/pdB9svSorhNtE1R/dP2bb5j3sXjOhDgzc+PlZVYAszkrPKO9bqgxZrfmqf2QsK5X1uh6SuUdQVZizW3VSw0mdLffCrf5upImzTOuTtnZqDfq5lYu7Ml8J5WigRK1Jx0/jIttgggzejx5fRh22eM7c8ONt7nYt3nFr/88YRiMZ84FZcv7gijWtRSjazvgwBYkdiBDYMAEkyX9xrTRapW6KkvfXDiJ48M3a6iEQfL8Sd2u2SQlJ4uXGKubqWjC2FiK8HjM7gH5u+6zAhwLbqNOw/1/egCde5TqmBGtm3VbbnyjoENuZiAS0wnOtbUQ+aUYyhTvTaoq77bTVWEWV2CEgEVs8DjKRKL0Zhx82uqx3I+6Q==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(13003099007)(10067099003)(11063799006)(261021121427099003)(261028144727099003)(261026121527099003)(261102123227099003)(261026140227099003)(261009223027099003)(56012099006)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qzXUjBSNmLPlOQqITd98clfDi98VMVD6FvXf9As1t9f5wrLJMBs4/qzL/spCQGuNtnaHFN3mHpFXqCjFh+H2+vJR9jKgonNfFa/KhxO0fBWbNMUgivBWXOhdBsLAmZfD83nhT3HQp+rC6OxqMjqMLjA6JZ26BJ1v7uaFrbypVxPkRHtiGzSUlgmOqhx4JFyHLhXyedYUqznZz8Rou441ikSMrn59G5jEfOT7daDFLWkGQvEimeR082FFEUzBPnr0g4xz2R9HXuQxDrr3j/bs0e11Uk3DPvBQVYjoftUGn/vr7j57DZ1m4aBRtKrvkOulPy3bu2F+El+3eVjUHI/7hwLv1xdoI+y8dU9q+qy1a765FyQFB6nv34hDHWhIl+WMvRfsz4g/MTIMjpm35tKD8OcHq9WXNN3HABJzjjVEwTUzlLUnFy3AXcNQYclsvG/p
X-Exchange-RoutingPolicyChecked:
	d98+Rjp8k3YoGx2Lah/XO4BJkSYx2opieX7WKcJPyjiSj91AnLBCZMhTM8WrEMdMDDUWk9MZC5RZS51fIbD8eeA1SkkAxDVK3beZDf8foLwxBOwRzzR5wBlcdSl86/0fA0YSP3O61TXBD5IJ7ahlLneazp3EH9PN/tFhXqViygzsdWffb0OMgq7maI60Nnse2uBLVNyQi/yhe5375kTAuch6Xwf+s2DWTjD/2uACTorUKtgs7XU56loOiX9gPTcYtqM7SFe2Y01K1SMCiDbIkVQpP2ZL82IQ/9Q5M45/pDEtWccO3o1/zA69om02lW22g1foucEIvMcxbUUYdbsqAg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XnrzHzKCNzl/MOpHKlnwOkQxmsAgL0wS/tR24t6nwEOXf51TF5IzMhKPJboxRLIrw/YDBKgtcgwoswk+9hqkX63Cnack0bqV7A8e1VoDKIYqGVHIvKTPWdnXtBRDtolsDAAVxkhddKQRG7mMEMm99eO1u5vwGAvynE/KGV1BqGa3KQ7NA9om3xNykEpl4IP3JonG1oAe+/U8xWhzdFfa1heIZSM72rEaLhoPmbkiaDPqaact7vW33W/JcbDWE/5+g2zBLuzTm+8o6vpQKeiIqcQOawaKaUtQj6oHHRqhjTDl8VwikuFjtjSQulE99cDDNODAuY8UUGYFWN3An3p289Yl9fXrqWIwhqtnhhLAWb45usQ0yLSlmeJp7MploLiPmuDNB+LJZEwK2dYBxYAi+ZmoC3yRxY1ZOJ7Sr8oaSUTW1Ka593IxpBntkPjHLpzCLtS1TVxavC8Ece3QLSirQiJZpv15KCiCwjN8zQPmdsk0RDhZVGCqFjRK/PFA8JCiKGscWKg1SZlLaHXsxzUTHvTb4xQ5VVYPToYamd1KxcHpesQXzXXVMk0Tkb+/qEEWV6VOjB8AoSKHltglOi1tuKR4buW5jvyq11DiKJcmEq+Fjj86tdHiQFjPv0KiD6x2K9HWcva5AVDSxc5D8lk4Fg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:17.2752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fbe84e-9841-4acd-ff4d-08df3add53a0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000019.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR16MB644269
X-Proofpoint-GUID: kNccnbaLNz494VNHsTc2Qxb70v0vs8wl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX1LzQ+2KYORlw
 +8JBYLA/mYpMRu4pXA4j7CD+LN0S3DaQL3h7i7EqmcqkjfxkqNGUI6pEseaA0odJkGJcJdAwhqc
 LWBBI3lhHpsKnKkv3OmIARR4gkBTt2CcPGTFriX1E/bGaTJ+pkEC
X-Authority-Analysis: v=2.4 cv=JKmuIMKb c=1 sm=1 tr=0 ts=6aebddd2 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=p0WdMEafAAAA:8
 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=rN6oJH6SHpm60vEaH9gA:9
 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX21jx1L+2emCy
 b55cFXxBs7cqPjvuh5B0RhmqJzz3ggMR3KlzivV6Wi+uXXPQd9IPlIGMeh0m8wmkd1x4d+Iq4N1
 hwkorbNWaX8kJV1yUdw+DIGS+8KZmalCRfEPjmGNr2l3Q112xk0TNmIoCt4G6hSljseEuZ55Orh
 bs/rCSwSEpm5zkgj68OtAgGmmD1h8UYI/c+pX7496lkMj4w/O86Eojc9xqE1o/98vlzvmerlxf+
 IqWs5NacCB4JBf5KsNKz6HZ+l7w4hz+7Rm3rHEyZa8V4ejF7XUu4Wr0pRkxHkl6TB3t5T2pz7eJ
 RBvOz9FsA0eaI2I4fENh7LZ2JRBbDYLkVk8U74FIw2hxYgDB3XnWZ/Yc/CJwz1WHfgpPwDnm6Am
 O0Y44BrIX6DYd2TmeAkwkiohMzkMn8I9060rjktDl4X54/uRXmOmCXnRFNRmDqBd7xcetypzoQt
 TOiQCXnNhcFXof/fSWA==
X-Proofpoint-ORIG-GUID: kNccnbaLNz494VNHsTc2Qxb70v0vs8wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-bad1c0/1793842643-BC8C9034-CF8D6F40/0/0
X-purgate-type: clean
X-purgate-size: 2559
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Build and publish XTF binaries to be consumed by test jobs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/build.yaml | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3d37e0b572d0..1f6228ba74ff 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -288,6 +288,7 @@ alpine-3.24-x86_64-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
+      CONFIG_SHADOW_PAGING=y
       CONFIG_MICROCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
@@ -297,6 +298,9 @@ debian-13-x86_64-gcc-debug:
   variables:
     CONTAINER: debian:13-x86_64
     EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_ARGO=y
       CONFIG_SHADOW_PAGING=y
 
 debian-13-x86_64-clang-debug:
@@ -305,6 +309,9 @@ debian-13-x86_64-clang-debug:
   variables:
     CONTAINER: debian:13-x86_64
     EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_ARGO=y
       CONFIG_SHADOW_PAGING=y
 
 debian-13-ppc64le-gcc-debug:
@@ -840,3 +847,52 @@ macos-26-arm64:
   variables:
     XEN_TARGET_ARCH: arm64
     CROSS_COMPILE: aarch64-elf-
+
+.xtf-common:
+  variables:
+    BUILD_QEMU_XEN: y
+  script:
+    - git clone ${XTF_URI} xtf-${ARCH} -b ${XTF_BRANCH}
+    - make -C xtf-${ARCH} -j$(nproc) ${XTF_CONFIG}
+    - DESTDIR=$(pwd) xtfdir=/binaries make -C xtf-${ARCH} ${XTF_CONFIG} install
+  artifacts:
+    paths:
+      - binaries/*
+
+xtf-arm64-gcc-debug:
+  extends:
+    - .gcc-arm64-build-debug
+    - .xtf-common
+  <<: *build-test
+  variables:
+    CONTAINER: alpine:3.24-arm64v8
+    ARCH: arm64
+    XTF_URI: https://gitlab.com/xen-project/fusa/xtf.git
+    XTF_BRANCH: xtf-arm
+    XTF_CONFIG: |
+      CONFIG_GICV2=y
+      CONFIG_SBSA_UART=y
+
+xtf-x86_64-gcc-debug:
+  extends:
+    - .gcc-x86_64-build-debug
+    - .xtf-common
+  <<: *build-test
+  variables:
+    CONTAINER: alpine:3.24-x86_64
+    ARCH: x86_64
+    XTF_URI: https://xenbits.xen.org/git-http/xtf.git
+    XTF_BRANCH: master
+    XTF_CONFIG:
+
+xtf-x86_64-clang-debug:
+  extends:
+    - .clang-x86_64-build-debug
+    - .xtf-common
+  <<: *build-test
+  variables:
+    CONTAINER: debian:13-x86_64
+    ARCH: x86_64
+    XTF_URI: https://xenbits.xen.org/git-http/xtf.git
+    XTF_BRANCH: master
+    XTF_CONFIG:
-- 
2.55.0


