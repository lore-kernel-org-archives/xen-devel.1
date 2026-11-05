Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104E606A332
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 20:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=PVum1IiB;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Eh4hmwRp;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=gIfoZRky;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=DOuLnb/O
Received: from list by lists.xenproject.org with outflank-mailman.1475488.1682144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3ol-0002W8-CD; Thu, 05 Nov 2026 20:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475488.1682144; Thu, 05 Nov 2026 20:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3ol-0002W1-8s; Thu, 05 Nov 2026 20:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1475488;
 Thu, 05 Nov 2026 20:12:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xP3ok-0002Vt-9d
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 20:12:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP3oj-001MVf-F5
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 21:12:13 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aece306-e002-0a2a0a5209dd-0a2a4501a852-20
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 21:12:13 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aece31b-5984-0a2a45010019-94a392172908-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 21:12:13 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5IX0Av2137923
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 20:12:11 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hry6615xh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 20:12:11 +0000 (GMT)
Received: from DS7PR03CA0042.namprd03.prod.outlook.com (2603:10b6:5:3b5::17)
 by SA1PR16MB5850.namprd16.prod.outlook.com (2603:10b6:806:3b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:12:03 +0000
Received: from CH1PEPF0005BD5B.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::af) by DS7PR03CA0042.outlook.office365.com
 (2603:10b6:5:3b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:12:03 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0005BD5B.mail.protection.outlook.com (10.167.244.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 20:12:02 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HiNfZ716348
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 15:12:02 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4pypa-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:12:01 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id P3oVxIt0Mf5COP3oWxfs08; Thu, 05 Nov 2026 20:12:01 +0000
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
	:references:subject:to; s=ppford; bh=k9+nX7rqR0aWeqB5DqB9W5f9dYZ
	bObbrwXglaBheaE4=; b=PVum1IiB1uQQzS/Uq3NscAuzFhXs2LZ7vwVEQK5YUWa
	5wQ2F8b5zmrCC5Mo7cGh6dzFRVofCWZKQ7UeNeeRS3IvuT0+PGF/uxuHUP5K7n03
	N2Qlq8ZsZBnmhIwNM+cQ+2/m8I/rHkuSlMDpeq9eqwb5LUdPg8D6PIyoGTWpBh+a
	XcYk+Isb79AJSh9IIR+eAK1uj9/e5YhZrhJA9uG/3gpi2I3ldvQlQaKmSiqpl7tF
	GR30Nt/6/u3ie38e/+9s8KaPdAwuTzXeeCAPsBlqYKsQRDFstyMMUwQa+sBmRbhL
	6WevVeQHm+7nCsZWDk+gK2Es79/tRiTTgsDrL/vrqOw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9/mlfa2T1K0uf2x/SYkkC5MUCDfHZczltmmKr52wjYwUxuKYuq+BhLmBdU3J8fpRqZA56+tDYf1WBrn+mQPF4G1pRn26ptv+vr/e4G2b5w719nFLqGEi6rPF/OCpUmzstpxlaguUqj/uJTHBhFeZwfUbtLC10rC+u3AFywbteb98ynr0eX7dDcyX0gHgLPAzu5rbImyx6tDAGOtje4mjKs1F7SjbnVYzzt70GzqiRlffRfK8wjB5Umb6fmGOl5f5O1VAwDgymk7i+g3is3MSEzSwZDD+mOQqqwmRnIJUicyl8fnFG1xuM2kldz5RavI6ey9thhlFdKd5gNxek3GKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9+nX7rqR0aWeqB5DqB9W5f9dYZbObbrwXglaBheaE4=;
 b=FdfRxCYXdXH62cpV+rK15QRrLUZs27mHgLYS6mVXYg1oy2eyFQ08s4BOWK6TXZC6DkeGK6OvCywBkQR+blHHd0SzXg9hURIE3y9UnXgzEZJtCCjNxM5SOeQr4cp+Nlf98BmXWTR0fT0gERcJ7lpwqadMva/kq0dd+u9XJ0exi36b+nPK/GR0QOKw9TVNYbhpCP7UUBOYDYuj7dsox1D0BMbmmhvqzNe2XWNU/Rh2IVqge1sxx7wDRRFqfct3wG3USP+4rjV3ciVByvqQ3ZIpoYpfCLjJsXOEEWZQYRvYd+Sos0it4P+BGCI4YvWZ9/1/4qmQLtG9pvDn3Z3p6Q2FNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9+nX7rqR0aWeqB5DqB9W5f9dYZbObbrwXglaBheaE4=;
 b=Eh4hmwRpREoSaVvepgDTjqurx55zUCmjcol4RcY4n1tO5xwVryKTPwacbJlBVxtmlbLURoSO/omZWT32EBdlT8Aq/uYqmpC+b9uhNqiCDZWggwWaaQVxANUaK/iI56ueGPi0UGYbz/jeXZh5Lo4xmCpusqZlkhsL507tdC6mYGQ=
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
	 bh=k9+nX7rqR0aWeqB5DqB9W5f9dYZbObbrwXglaBheaE4=; b=gIfoZRky5H/H
	/WS9Zdw2MfeVkY3WcHdpObNqM3J2mOapWDGe+3Em6pzgB4nkesfO5QFScW9Rw1nn
	EnVSrK6/avvl+h/vELu6GybDdx0u6x7HAQUoLIoMi8VYhlAgOz07aTepIkNdYkT8
	+39E3awzbcTYm51oQA4QoxJmyhq5Q5p6JZQjm1MR7CP23T8s55VoI76Vi7OXTMkX
	+vJ6Y/PNiVJ54XqpMu6LDuTT5sA1JHkuhurfm2nTvEIYnSTQYAIn1BKiICitYp6F
	oqQ7mIVt9NWy/Gg7ZQguIOZ2crAIpGG0pLXlEkeu7BUL2vEHpfy+rlLecS9BMvyo
	thXUDA1Q5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=k9+nX7rqR0aWeqB5DqB9
	W5f9dYZbObbrwXglaBheaE4=; b=DOuLnb/OZ2keDE8KaDI2Rt+tqKNZVkLx3YRZ
	+gYWFZeM9DQ2RbIoSIYrxUOssKUGqn8EEZ3am4hDTPz+HY5SSM0LhbWhqP5UD8em
	OVZ9dqC0W+l3haqjFXpL+yi+y1WePdyeVaZluI0yBjo2ix8JiNngNhliQ4CXf6Qo
	8sC+aueKPvYMImRQdg25bfN3qcB4UGo3v0BzRyabLXgFTUuSRTBYfBmZhKX5m9s/
	XYh7Tg9QR7vRyaeHey0+RlqVFPMW+mo/wcPg4iSOk6JwrpPeZsjmx7pGINzspgBv
	6EoWcZlavchDgOryWamubw3HdqbXlfMovz4hUgAvZWkeXGISKg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: P3oVxIt0Mf5COP3oWxfs08
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Nov 2026 12:11:59 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
        roger@xenproject.org, teddy.astie@vates.tech,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 14/28] x86/hvm: vlapic: update signatures of both
 vlapic_{clear,test}_*
Message-ID: <auzjD+GxOTZ1uHDR@kraken>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-15-dmukhin@ford.com>
 <022aebef-ed2a-460f-81ca-4fce5742f904@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <022aebef-ed2a-460f-81ca-4fce5742f904@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050080
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5B:EE_|SA1PR16MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: b2842d74-21f1-456f-214d-08df3b790e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|6133799003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021135927099003|261102123227099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5voUbar1d24xdsw9iE2eCcIVyvdVUC3qNSMvQb5xU6todUZPt11V7XyQ/sQtSSwnacBVAakhSKAwfWLihDc83B1ZKc43mwFiDdj+5kutmscxZvv/KzrHEEJz/vCg3mHlhI5DW5NPTUKv/nqc2TWggpzzhVCelQ72Wb9GX2JyWYqAldDJtRTgKc1XE5Z2DePXjibScNDxx2yvI4Ig6/TFu6Q2Eg8RHD0adFMbcSPajHS4T/p/UOemrr+Z3UJL+g0xJziaYTM8QyzHMuey42CL85E3zBGTgEMPMx2lDKglOsFoBnzAR+XSONEJgnjD9eWvMKDaQ7d/Y9H5GWr2Lmo9JCwjvDbEJ6ByL2NJcthgSEeIFlKezeV9ti8cV4PPawEXIDUPEfGb87QzJUsh3nSXgEktGk9gnZKIqiIHDrVUEnNRKYWnEXA8Xm0VoXQWpVfzXD/sOOZFeEVp/TrrVfzxV5nkq3EhlXgrDDOiZwu7teTO/zDNipewVuMTPn8/FeSc0EkKFlPLR+IurmOiLCN/uZQZYdgWZDmc9K2HfC9/yzwft/NbnzpdyZiMSjWO6A6JvcmNSHoJhTbBalTha9ADJaPozPsMTKQqSHJyk7G5RoswIsVvYPT89n/erp3eBJCXfNf6UqZnDWDlnQDUzxWaACqhulonE+F2lS0l80xfNH8a0CTp+vCGJb6kKsX02uIzTybbi30iwkJzKkPrDY1cCQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021135927099003)(261102123227099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qCO6HMp6fUpORkCfkt6U03SFyHAuGarrY8N/vL9M3PUQBEvuC/t6knR4N5TKOzd+dmGrq0dR1VURAu2IlTMj4076i/vqAnWqXYWuf75cpflWH5j1YZILagam3jyJmOa5yCHOiH+w75A9hWTqRxh8K6kV+7Ue27uF2IgSwZcu0KHbVlbPvh4HClNCIlevNfG6Z0qw2vg1qVgb+mDvJ3apJ4lpLN7XIDbuHim5jVpwtIZ2IBGjIFamDdtvPYRV6B88ztiWzGBM9rNjp79U2Ae9ngoDYkStIMP/ABdlqX2gRl2bGEepgfLrmfjkomWCizbfracpcqA/tRhAYN8Z8CXzide4LXOYH28InqDeX/UBpgnqqBR1fJ+5KplAgbKNQSr6j9NfSLZJ9Yv6wMRkXpux8ZUcDqU1J/NVJ7T9azNzRmJz6Yiz/GMSnGwcCPHUfpfH
X-Exchange-RoutingPolicyChecked:
	E6+qwwoHJ27c8IXmDP274ZafUJLB41X0heD7VTtrvM/6eCjSwkoXqpiCUEIxr/zay6o9SUB6sGLHvvEG+Tya81lUZQ5Cx5tkCQRhrZVwNkl9TygZLo6QWbR1WkuVvOgsFhRO8iwMgTP7x1OOWYy6NK+v5gy17RgRVEXe9UyxuNCMMd2opEE1ReWgjA9RZLROmVIRogo8YMZhPSowQHXaVPIR/RvXS6UYZLaFra/am45fqefFWfjW+MlyrOjeKOUFPeKswsItaNFBqGChQnAl4ioD76mVmWi7tng2y1UK5SanvN7Id67llPWSZszRCvuKXACmQot1a0FFGXpi5ygl2w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ffq1Jtkp1tPPRgGDh/ObfrEpwzcRtv32u9+/JL5KVOqUHN0eLXb7wx+cHLnRjxU1RLoy4OfXod9hFFLlrgNcbJy5uvwcFjU7uJd9mvPGvcaoonUrPG2AHesSXpm75mHDSebhWH4jAWZwb4NOVzdGFjaRqkjQftc3jZ3cDJspOUKliWhgpCcrMvdogVIbya/nqNYjHl1GiWjRpHpt9XBpBhVX9nH1r7R6sgAndKj73cliqpaY2IyikCu3C7FtY8eH5/wSSILF0Xd9/uudViRkNzPLVEJPdlvB7/1QPdAGupRZzak6RgXuwBd1KEuxPfadBM/OE6PviCAMReDWMQZJxJy8P2wFa5yKPf6WMm+DyTSOoCQ+ASggr8xtqMMA+9T+jyY8tp6Xd4lIunN9q28BosUbx8pVX8W56yzKkiaqG9rwJRY2Avm9cgsuljqkQH+7gcDS7S4lVPbpKJwGyu2uZdPRLXdoN68c7x5yCNPJi8qgPQJgmXa0YBJHaO542kNX+HaIFZT75QOLvr24vqiCys1+slJcigUWgi/tOpxmWhh/1iEAcd5iEnzfZOC08Tb2LFZ2VIJLUgHADum1wswSxpF8mf/p1Z3uhjVDoAXozO82iGITh2arCtj/oD3Rtt9fpFrP9LotzJp724kVF76VFA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:12:02.7896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2842d74-21f1-456f-214d-08df3b790e81
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0005BD5B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5850
X-Proofpoint-GUID: xf4CyuPQfGqvA2Xy6gbRO5nGHRukhC-R
X-Proofpoint-ORIG-GUID: xf4CyuPQfGqvA2Xy6gbRO5nGHRukhC-R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX5O1CdzS4IAt/
 IOmfilbYRdJUzWZyJuMcieNAV0MmOWNzUS7FYRkZO1J0RMEhlzTqohou+i0xobnCqRUO/AQy+aw
 qvooVpz982GKty8cif3vK5ihNEcOZZP7uYBlD3yIFH+gAEu5aSZn
X-Authority-Analysis: v=2.4 cv=bNODs/+Z c=1 sm=1 tr=0 ts=6aece31b cx=c_pps
 a=tLhGFq4bAmKo+yvJBjszOw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22
 a=cbNQJ9GKAAAA:8 a=ZkvK363a-EHjJ4peWMoA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfXyUnm8sGMfa5S
 69pyHvjL1qGb3MKhZH8m5J0nQVM1T4gnJUaEHLjtnfBnBzDmoa6/cUir/iUVwjRWmEKwWD+EJM9
 K3YtZDokLGPiVDgAfoS2NeR4DM5BE8pfIN80ESD1M+60ay5lLB9ItEcKa6YfuJrC7rQkD6e1eTw
 BoxgQV7+g7P/LKAbLHl4QBVnWONYKBIfFhRjhpbuhodO0zzkoUuXRc62iQmttnY0skBAYT5o6iH
 4nyRCjBHs+JDaRRF4mF2aPILe62MldARx0D5PtcV2sjPoNfP6c6Qte1mi7+OGi66NiZwVniHwgc
 G3gbyLpNPZ2S/Dn28LiFtnqNOIPvgLmPYjkMqRLC9aKH1uBTt21Jh/Z77/v4UCLPPX7lYXusMXg
 GTyREypA7rXacV8lb0PA5BJOZ/LV72qqV897VYfnMqytAnvLf5W8Q6qUekgOtFH7AxqN79eVGK9
 +tjwozRqnrWSBrSIcXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050080
X-purgate-ID: tlsNG-d62444/1793909533-BC359757-F2B3DDB9/0/0
X-purgate-type: clean
X-purgate-size: 1991
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:33:17AM +0100, Jan Beulich wrote:
> On 05.11.2026 02:33, dmukhin@ford.com wrote:
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -85,14 +85,14 @@ static int vlapic_find_highest_vector(const void *bitmap)
> >   * IRR-specific bitmap update & search routines.
> >   */
> >  
> > -static int vlapic_test_and_set_irr(int vector, struct vlapic *vlapic)
> > +static int vlapic_test_and_set_irr(struct vlapic *vlapic, uint8_t vec)
> >  {
> > -    return vlapic_test_and_set_vector(vector, &vlapic->regs->data[APIC_IRR]);
> > +    return vlapic_test_and_set_vector(vec, &vlapic->regs->data[APIC_IRR]);
> >  }
> >  
> > -static void vlapic_clear_irr(int vector, struct vlapic *vlapic)
> > +static void vlapic_clear_irr(struct vlapic *vlapic, uint8_t vec)
> >  {
> > -    vlapic_clear_vector(vector, &vlapic->regs->data[APIC_IRR]);
> > +    vlapic_clear_vector(vec, &vlapic->regs->data[APIC_IRR]);
> >  }
> >  
> >  static int vlapic_find_highest_irr(struct vlapic *vlapic)
> 
> Each of the functions only having ...
> 
> > @@ -166,7 +166,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> >  
> >      if ( hvm_funcs.deliver_posted_intr )
> >          alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
> > -    else if ( !vlapic_test_and_set_irr(vec, vlapic) )
> > +    else if ( !vlapic_test_and_set_irr(vlapic, vec) )
> >          vcpu_kick(target);
> >  }
> >  
> > @@ -1414,7 +1414,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack)
> >           !viridian_synic_is_auto_eoi_sint(v, vector) )
> >          vlapic_set_vector(vector, &vlapic->regs->data[APIC_ISR]);
> >  
> > -    vlapic_clear_irr(vector, vlapic);
> > +    vlapic_clear_irr(vlapic, vector);
> >  
> >      return 1;
> >  }
> 
> ... a single caller: Do we actually need those helpers?

Yeah, I would rather drop these...
Thanks for suggestion!

> 
> Jan
> 

