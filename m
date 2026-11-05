Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696D606D80B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=WydDKLuN;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=RkM7DTeq;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=i4a+lo+e;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=lA3jwnV5
Received: from list by lists.xenproject.org with outflank-mailman.1475506.1682153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3yW-0006Nw-9N; Thu, 05 Nov 2026 20:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475506.1682153; Thu, 05 Nov 2026 20:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3yW-0006Np-6h; Thu, 05 Nov 2026 20:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1475506;
 Thu, 05 Nov 2026 20:22:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xP3yU-0006Nh-Gm
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 20:22:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP3yT-00FQwA-MI
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 21:22:17 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aece573-e002-0a2a0a5209dd-0a2a4507bf9a-8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 21:22:17 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aece578-b4ea-0a2a45070019-94a38ff16658-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 21:22:17 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5KDwwn3784145
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 20:22:15 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hry489ef0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 20:22:15 +0000 (GMT)
Received: from PH7PR17CA0030.namprd17.prod.outlook.com (2603:10b6:510:323::25)
 by SJ5PPFE6E92704F.namprd16.prod.outlook.com
 (2603:10b6:a0f:fc02::ae6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 20:22:09 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::1a) by PH7PR17CA0030.outlook.office365.com
 (2603:10b6:510:323::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:22:09 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 20:22:08 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HiW7E977431
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 15:22:08 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrpwmy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:22:07 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id P3yHxHBZRz55iP3yIx3wOo; Thu, 05 Nov 2026 20:22:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=ve0Ydx3Hqgjq+XMCE7y3EJ0sh0F
	LCsw2yxkIN7KZfw8=; b=WydDKLuNvcO9nqCO4xjGTfLD7LgpD4E/bTeWFD+726y
	hFU5EzKTd6G06pbdl5D+4DZZngdLIX8gdxh087MLcNyy/cHhclJKlRwnbqGrFfv3
	W86hdGF8z/uBS7FjgiQX5zp9kB0Q6EqkDY/vqeFj8C+hqoaXSNduIy92EbTuK75z
	lkw089IponmO4mWA2dqnoaAgfqFQPvhq+wXs9jo05rCfOqt3iK3w637FjiIijQct
	7UPefHhrODCFaYmmYR1kZmFeGMKyOl3cdTpjGvVrgmTecJCk9Pmt6VtODtmbZY2Q
	GsCYD46SkUKaQ3l9NIry3YJhx8jf/qVLGYo+D9rjhQQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3dNkacPb3RkpjnCsej+toBGgEV8O7eeRFIf3x5U5TYq87UruMyW6pSbIkZzrN3g4fWsHxw/IvmOkGkXP3B+PJAoH6+Zyx9bY76eT4mQOzLBndXI1dZy4SiwAzmZGvPu0VZbnQZwmFotTgB2sgEoc9i/tuvH84k9R7NcvvA8lIS3NZz7KUmlnD6R4IL/ZFei7PUgvSPbjcwE9Vzb4VZw3RmkJlZjDSZ38hw7IgJU/Jjxijz3UjvuCbLeeqlCD5w4VV3XD8ZrFU6F4AUNxJ77DXYzDFUAky96EjDdC4Q9fz60L+ldgvYmL5+eSFByu1AKjl3lHeYdJjC8rwraZy7x5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve0Ydx3Hqgjq+XMCE7y3EJ0sh0FLCsw2yxkIN7KZfw8=;
 b=wh57s4LmW2V7iDsLLB1VFjPTZ2Vz47thPFf3a+tJ6D9wXraf731+VMly1K9ZtybtYSYMGvHAMGeYz/CDFPk5CIiFLVeoXvbj1rn6nhctu08DTQ2c4yicj04jkFtw1BcQzxU3N13Lra0s28U0VcXP+PasKkfcFJY4hbQD7Fn742aCFXxQ9SSyd077GVgEyQEZqfyldE0/cgMd7wKUhGxsXIcrdmfRzKNeO77tBsh+oaeeImYj/zhaB+tlrKUzchtLRNbzj9giiAIyo6S+QMUU7bLt7xMONhdLUigVJS54Mvo09zyOH1EZT/bjPh+F018CM/pEfjkgx838soaiz7jLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve0Ydx3Hqgjq+XMCE7y3EJ0sh0FLCsw2yxkIN7KZfw8=;
 b=RkM7DTeqpfGjDAbkRFGvBR4PGN6RcJwKp8M9yRG7g5aIY/P1g2BiaWtmLkrMa8AuDobE+BJlkP7dtIKFbc8yCmjXeZImVDgviWHRoVkan/iU6vRDf+Dc4kZ9ys50BW1909CCTayXUq5g39WlDkhULIvfXJR3uKsSedzUnNTed/o=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=ve0Ydx3Hqgjq+XMCE7y3EJ0sh0FLCsw2yxkIN7KZfw8=; b=i4a+lo+edqYR
	Uja/OLfqeAZ3utZixE7hZSNwaZGvQv1+qupDU5fbCS7OHk90uXjdKSRfnIF54jw4
	tr0+uTrAfjjruQtHQtpt27+sHVTuDeanv1v8RX8Kr2UvvNSEUt5EKzUPvXJPa2Tq
	snU7f8dmrnkMSVEhU3sfW/gpwcsML6+nK8bkiexkuX4lA/AVARus2CzCzFHV2DXH
	DVlaFGG8l5SK/+o0iBKB0G5lOeKifKslQ0c4XgaDSXoeQlWRugioZPW2buRC1qxq
	HkaZvx/HBzf4jFo6a197SXBE2dieT2VC5u488VCGRNtL5RU5ZF2AXe/lFduIUKqu
	Y4FKtqMKtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=ve0Ydx3Hqgjq+XMCE7y3
	EJ0sh0FLCsw2yxkIN7KZfw8=; b=lA3jwnV5CbqAkRkKDaohYpC0vRKiwFJ+8jA8
	j0Pus/Ldo2oKF77zPTewXkgIS6hyqi+jY2YPmeL+Ei2jECWpIDoL/XjF5Usc3ajl
	if3eoOKCHw6vRxvYlOFgCATwYCeupnuoikCwnyQ2/xMGJOPg+DYcExFtGRkGlVsl
	eL37l8Y01HMOh4WDUvD7De4Jlg7em5RFfYrLHA0rhPJla4eJXMYBmeSr4TMRYrMW
	o7j93UWMVURJevxR+0sBuRr0CcfvSOxxCe++7sdDH/xRfDAgKmOjZcvnuJFJlYpf
	+baD8LUw15czOGWeS/9WrOJQwRUX+otHA53i9xan4belYm7MHg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: P3yHxHBZRz55iP3yIx3wOo
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Nov 2026 12:22:05 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
        roger@xenproject.org, teddy.astie@vates.tech,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 26/28] docs: add coverage for svm_avic=
Message-ID: <auzlbS6B2k0yJJOF@kraken>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-27-dmukhin@ford.com>
 <70db6d7a-5e48-4a39-8553-4718f7ccdf73@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70db6d7a-5e48-4a39-8553-4718f7ccdf73@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050080
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SJ5PPFE6E92704F:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e212d4a-4407-4b8b-0f16-08df3b7a775a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|6133799003|10067099003|18002099003|261102123227099003|261026140227099003|56012099006|261022075727099003|11063799006|261022105027099003|4143699003|261028144727099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	7MCa+YJJJbVdf5YCIQ2NR4XlGJX1p5peclD1KQanyyfjDcnuQsVHG3aY7ja7ajCJ2LtpuB82q5vw/WYNpsycT1zV1ghAoJnPLm4+scIppMe+98sZZT/vNexvORpZOX8nPvlYok/UBqC7eNqdyNbT8B8OOaZOdFkJPP/ev4P5NoycWbsnFpfJPqdVqV5MjyfXg83NMKkWebBvhjGAlbTdrHf9d9+cWr90A485xVqNRl+em9DELB1u4gLipqOC/550JFA6qf7wFhqgwGjB0xhx7qRp7mVs+VjtoLzkMONpZVbm4jJDSDxwaNapfQhw0NKQJMVjPJZSJZgcnpA3wpUm86t+zzE8sOPZEDS4wcPylNhA9iOCLOr4NHSiTcrtTeZxiJgjjm5uTXemVCrDg739d7xWIKkw7OH3fFz/OmLR7l3LaG6GAB/QGihc8FhbrYhwlBIU+7dZd2mOco719VJaAJwIjTFgKPfSWeI0sjYdWv+/o4CGUnkFx5vaqgsUQVKfTqpkglfmNILtvZh+LeN0eveQ5Z71dEHNSqVkhPYq2AVy/7QGffoYtPw2FZrQOIRbsOmDdTqXOapZofWZfXim8cmgZBB2PpqUAJFYm8EVBe9PaoHCX43z/iAO4xF9Vlrnqnr3iz+TFq0DYUGd8fvbTOegeJaEPBfw/W4MkVsoNmkFop5w9NaCV9sM4WxQsb/weHEXgAhWl/xrBHG28oCkWQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(6133799003)(10067099003)(18002099003)(261102123227099003)(261026140227099003)(56012099006)(261022075727099003)(11063799006)(261022105027099003)(4143699003)(261028144727099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YteAU7qGtf8TfD8dy+RVQyTIGLj1tHXPeJ0msrsHaGs3RT17eD+bgzekNfY4Q2O8tuNGRvZrFhmjKv5HtY98CAyDQZW51xjO81o8erqmGaJ0IYdlM3SzFfDcCIbuW7ztjCxmarCkG05+CcGwrw494N5dbAui5In0TB+/rrkxqjotHYigfGoPxbYnnjBhlYWs8M4SeIyTcOlEjjLE+X930OanQnx1BGDhvULZvA7o5H5vHEQD0ACeWe117aHApZbFNEI/aNeW045nlFdLLejg32yHOjDoyZjEGjuP/wcbrvh2p/HmMxtI6yeKG94yX7JG/WefHbY3yR/esVvZ89WviByzfy0zwyNiQNKWxEyJuLB77E3ArQUt7OaC+4lKXNOKW60lvlCrgcb/FK2ATslv3WdTtFDjvYIfkFD/W7qnyBD1fIuYYMv5yEQgkwV9NhgR
X-Exchange-RoutingPolicyChecked:
	QLO5R06xns+cb72r5uzeZFFkXijeiAa1SOf7eZE8evNcTCionoVsFGtQENJ/5j5VfbmLuUvyG+mVmHor8ba/HfVEAA1bZ8OqkxOwgNNHLrrfEJlWNQAbZFORlzQ4tKuW6rs8+FSa/fyFU2sJajICQt0rzWksCLoGZdpQc3Kzj4q9oSFQPFHoSZosEszLaAbQccz0V0kx1Py0q9+0dvZQIacpC9ayLTVsg2x9o27Wlp715X8HlMYjf2Pmhn2H2LoGwBUWCqGbtocvUzXvy0WJ4fifOO04BBxIQkErWViiz5/BSSwqbP3FxEverh6bchORSR47m4oTVCL6t0YGoP0eGw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WKOIG0N51+4+2H7cjfho1AQ5oZ74McUloJb8IGQfjGziPIoqnT6EcCeo6SVBUleW0TbcB1qe1LGTcZEpqecz/76rnpU6BgQ3EqsQWIda5LTaPwlC+sTdmL5gGCHFByxGqBbFgHF8dQZB1Ay5WB/q6Sijgi+rAtyJRuLB9tzAIX03ifDwZX/IN5uGN2x1miGcE6y+qrf3sp+lWVG99bI+1m4g2Ugd1djfHSdU26hIXxnRS7Zk2xnA1JVVaZuYgx3pNRsHkNM53ePTskuP/MkGNwuGRyyL7GS/PWoq6TXSZnH8yQeT8bB1Tt1pa0e6zSo/wqtUogTFyXP1Ff6t3rKTEtiRwsYsp0jKfptFIfjABtA7RBJULPRPDF49q5039ptYPeABS6pAFxlrLHZYEuPvojGgRzk+t9f673WMphv5A4xbxwquHOqINpIiKZnYQITn7SKzAW3FOPO04VymO/UETu+KhewMDDP89AGU1rrl/KyqdWhY6nM5DFoE3u7kEziXZ9fM1roJeQQtAcDQnxsMB27cYgYzP82egqwbke18yS5Lpl3BtgEiOKpJTVo0KH4D1awQ4Bi2l68TNosTBVjJci3KNqzr6aBI4MDRitE2QulEfXVLQWv6VvQFC64pb6MHb/fC3dzOD30ICHMxGQ9EHw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:22:08.3843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e212d4a-4407-4b8b-0f16-08df3b7a775a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE6E92704F
X-Authority-Analysis: v=2.4 cv=AZEkjHXG c=1 sm=1 tr=0 ts=6aece577 cx=c_pps
 a=ZKvdAGA7hMB+bqOj1cvlrg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22
 a=cbNQJ9GKAAAA:8 a=KOL-L4hMpH293Zm-Ow0A:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfX2tU9mnOJqDm8
 O0CjPHcu9D0Xt4OBwkPG2/XoSTvSNm+GpCNzNKC77B+dsp19JgSex4y+EFg8wqFgFc8yTQbpVFf
 ETlVMs/vpPmVN8SyrxEWs9NsESwJfwT2xlabMtahwhsgkEH1Kw0Sx0jBOcfkcQULp9gl0q8SUXm
 7zgv/GD9s8bpCeOV/cO4rC3MhZUaYnJxIBzA/jnJwU3yfNzy74wpdubBMS6sPsxbwcz+BeVNKk8
 eyyuT0zoHdi9ZyfsgbXM4Y1vAdcpJVw0Fblcml/35IrjysYQmw6rCVYDu2LW9UjI3Mp7/RdVDzB
 HzQrgv5P1bQfiVm1aXA4KotO/3D6c0JuY4cUpIy9ss0FNDfhExBAuerOnuJ4FbU7Qj//cI5vBEX
 gTUD/M1fty6yq04W6pjOxm4v+iR/inv9+AK01+C5ff0yzO9nsYfBE7hfQtzex3sJRGYGDJlUN87
 r4dDLBtlIw/rBs26NFA==
X-Proofpoint-GUID: hPLn8QhFy4sA6OhIBqMWNrLTCcucl860
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfXzscUe/jKF9jy
 K+mqqAVs2+R8HVqkwfkofZ4JIXRV2gmnUcwdfID8TIU68oCcF1MflpHT3NQYQlUG4ovdLzMC66t
 eydkolRusoWjNxKx7rUgP+mTjMa9eO7MBHnRHC/JxRFXekGnffa6
X-Proofpoint-ORIG-GUID: hPLn8QhFy4sA6OhIBqMWNrLTCcucl860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050081
X-purgate-ID: tlsNG-ef75cf/1793910137-A48C9AE4-D114E650/0/0
X-purgate-type: clean
X-purgate-size: 1673
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:24:09AM +0100, Jan Beulich wrote:
> On 05.11.2026 02:33, dmukhin@ford.com wrote:
> > @@ -2673,6 +2673,27 @@ On Sappire and Emerald Rapids CPUs with May 2025 microcode or later, the
> >  `ibpb-alt=` option can be used to switch to the alternative mitigation for
> >  Intel SA-00982.  Intel suggest that some workloads will benefit from this.
> >  
> > +### svm_avic (x86)
> > +> `= true | false | nodoorbell`
> > +
> > +This option configures Advanced Virtual Interrupt Controller (AVIC), which
> > +is an extension of AMD Secure Virtual Machine (SVM) to virtualize local APIC
> > +for guest VM.
> > +
> > +This parameter is experimental and for expert configuration only.
> > +
> > +Xen has mitigatations for the following AVIC hardware flaws:
> 
> Nit: mitigations
> 
> > + * AMD Erratum 1235. A hardware flaw affecting certain AMD Family 17h and
> > +   Hygon Family 18h processors where the CPU hardware reads a stale
> > +   `IsRunning=1` bit during Interrupt Control Register (ICR) write emulation.
> > +
> > +Limitations:
> > +
> > + * AVIC in x2APIC mode is not supported.
> > +
> > + * AVIC in nested virtualization setup is not supported.
> > +
> >  ### sync_console
> >  > `= <boolean>`
> 
> This wants to be part of the patch where the option is introduced. New options

I introduced 'svm_avic=nodoorbell' later in the series, after 
svm_avic= appears for the first time. So my thinking was to document
all new options in one patch...

> also want to use dashes in favor of underscores. Plus the default setting of
> this option wants making explicit.

Will switch to dashes.

> 
> Jan
> 

