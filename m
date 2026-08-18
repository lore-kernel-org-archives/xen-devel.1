Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E11C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 20:08:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394423.1633207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwQ69-0000VI-Lh; Tue, 18 Aug 2026 20:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394423.1633207; Tue, 18 Aug 2026 20:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwQ69-0000VB-Ix; Tue, 18 Aug 2026 20:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1394423;
 Tue, 18 Aug 2026 20:07:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wwQ67-0000Uj-6c
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 20:07:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwQ65-00Cd9i-RZ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 22:07:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a84bb5f-bab6-0a2a0a5309dd-0a2a45099ef8-32
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 22:07:45 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a84bb90-be1a-0a2a45090019-94a392179122-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 22:07:45 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67IJUQhH1656418
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 20:07:43 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010039.outbound.protection.outlook.com
 [52.101.193.39])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4g4udej4a5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 20:07:43 +0000 (GMT)
Received: from BL1PR13CA0145.namprd13.prod.outlook.com (2603:10b6:208:2bb::30)
 by IA6PR16MB6910.namprd16.prod.outlook.com (2603:10b6:208:5e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 20:07:40 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::40) by BL1PR13CA0145.outlook.office365.com
 (2603:10b6:208:2bb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 20:07:40 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 20:07:39 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67IJY0pv2229532
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:07:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4g376rbqg4-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:07:38 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id wQ5xwSO4ay2VKwQ5xwkZFA; Tue, 18 Aug 2026 20:07:38 +0000
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
	:references:subject:to; s=ppford; bh=WzM5qxYmd9iyICPmUpiIzQBL8ox
	hd/QudnmGtoNLiig=; b=kevm/YU9n/8sQNLdC4FCYSw8HmZml0pg1dHjISvht16
	AuQvFmdgtRV/O5TD7iR9DcEnsq06bN/Hr7v8X0BjSwKedB0HbB3NFjbvOMkemvh+
	KTOKN7YII3ZJTZOvnlmc80072PyBcmLlRs/DkRYYxLOe2Q208B0WmS9o6pxC1HSG
	nnpIpjowIvdk3K7k+KXPGD2samaaHR4j2r/Fw/gkEPwnTdV5AEZwyjhZ5P4SaiWa
	NawoSRMdudfV8ldqKqQNZu9xtq8TfIzGlkiMWt4qVjJvvGjJo6lkYOAQINPUwtCc
	kyX4ZIOErac5SIzTPD30o9qRcSeH3Df6U1afyOb5g9Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ziYU2Bl1vKtf2KjGaotU1Wl7Ab2Lz3/XGKSC3vLO7AMeYLsf7ZpEESLVS2FJ044zq1XUntN642g/oN9yaGam20eqBSbZbiTCRHVEGtO1ikYVRBEx/JrVrl0mPje9797wuQ7HRnfIirFbhTvUenOzhzBr2Ux7uX+oKU48wHceRg01LBS4cupuejvEWUsvsEita/Kn5dlX2I18jyp8C+LFaOXpwnQluFjHE0+xrIg/584KN2EVoPDMZNT5CDK5Fzp0vf7MaqDkXtg83MoohNL9DQ0Nuh2FSatsvW4CmOuiwshEFTCpyj+nk+5P2SRmzzAK/we3TmCTyYc2cX8HFFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzM5qxYmd9iyICPmUpiIzQBL8oxhd/QudnmGtoNLiig=;
 b=CWAHJXGnYemxt0iYLNXIiq57PXA3+z3znVFzIUdYp5fRTClPf3pURClCkw1eYyHEONRYUUkjfy9F1I5u7AvtvZOP2BdnkgGi1511i2Ccjzh1Pkq3AgsG0/LNhGMrItuN0lxvDjwlSkXpeFLZQHT7U18Yeht9b/HnRJTka0of46rtduXfCRoIMYXYt2vMZxe8PAHzFKqFvPEjHCDKiFdsez4gvMKunRTaMtWWxEwCoIlpcAoJfLRoiVTa7/DZW79u8NcB10IyR2Y0j1bmruDYSeFPZOMdb9QbDVaAGyow3DfZSffda2daPzWMntnBg39j0wyiXEqY79aoPyAFXyh+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzM5qxYmd9iyICPmUpiIzQBL8oxhd/QudnmGtoNLiig=;
 b=Vj7RetxRZI1Bcam+brUjIoJmQ4rITdvQfRqOEe9UBtoQZvMli6f0GJMNusHTvdHZH2i2Jt0vxHb2NUAXoapVuXuYQA+n7mGywZ932Wt5Yt/vRWjN4u5igE/UZnqHX9hMnekNwbuviJ5y1OL1BjKNA1xb5qq5wyHboqAvXe5njVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=WzM5qxYmd9iyICPmUpiIzQBL8oxhd/QudnmGtoNLiig=; b=G6NCSW4lU3MF
	pRUFbISTwwdKAOD+nf4ntNpfoUcy/Ab0dLtcMRZAQD/vzn73vvE7HQ5B5xBIjgmr
	5FIO847EV98z17Qx9tlDXGkgvRexOd7PNU/dpD6nYXOrAoMhw5RduhBYisjERFwM
	4J2MaxJJoaJbYnJc/rG+ocYXlK88y+Qg215zprE9UWvyRBeAKhbkJkZ7g5iDduqw
	wxd+i1Ma4QfwMSHBeJYABnJBEv0VfIF3OLT046NuL76OOAFa4pQOsZA7IIkvIX2z
	IDtcWG+2kf0iKwaFkp+i3x6Lhok+htHJEAuKhJHIn6iZGVKVeYsjT2y7qAO3TKgG
	QrlyyPlYXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=WzM5qxYmd9iyICPmUpiI
	zQBL8oxhd/QudnmGtoNLiig=; b=cNN/lzpPdUhPn7zVXpYqDBNxYscIGB4lw2Kx
	wZkDjzkD3sY6rMPkvTG2WVokj5p+Ejw0k4BXpHauw8lcz6nT01xf8xnbxZkJdn7f
	BsT7mGMzPP53uJUlNbaIjj0dpkIiAT8oYO9VovZfL/tIkIYz2L/VZZjGFnGe+/j0
	ea3azJZWhg+Sus5qHq/D4oJCskfxls+CuDh/EK7oYTY1PfSVNYvD2kCPYrNHrDZQ
	R6Hui3TrcPmNbWn8+fmqX3hOcWOdyAxyHK2ch2vAhJCxpYw16EIcLTkeVm4hQAuO
	Np4t+J45HiDEH969LCNTZ3x9mZCq+67t5RbOL1yFyQprYl4ueA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: wQ5xwSO4ay2VKwQ5xwkZFA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 18 Aug 2026 13:07:36 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 0/2] add keyhandler to show Xen command line
Message-ID: <aoS7iF7OQ2VEAluz@kraken>
References: <20260814010206.1321724-1-dmukhin@ford.com>
 <c2cc1049-3b92-4a72-bbf9-c49b2c6ff280@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2cc1049-3b92-4a72-bbf9-c49b2c6ff280@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180147
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|IA6PR16MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 028ed0e3-6669-411c-f62f-08defd645b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|13003099007|56012099006|10067099003|11063799006|18002099003|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HEhJcSOReOxU/vEykP/9ODAPnd1IkEXbZI46RpeVxxPBFptmTtEDPm2F0nGEIYHqPbIa5De7Ybfa+DrCPnnGMvJC7yOdD3Nr1zatazjqK0B9qHp5OXaTSOZ+u2lsIbAASLLuuPd+MbF7yX3kJi1A8Vj92XAnIfou+RaBdujzZdRcekYhMV3xXIpFVQIkpJPKtB35bHVVE6C71s2qPMzEwo1HO82iSnO/ACWmypqUmhLtcRpqjDTpQs3OIP65OUtwaBP4r+Slx+rVgro/1ufPgxA3IBq0zbLoK6CAl5ocFu2Cg46wAd67Es9lnwSD2KdJJ/AZSuhz7xvLA6pL5IW/XQtdW+IJC/fBKRnUp52Dsj4COVazMmgCHe6RaDT+PbfBvxjdx0Pvo85hGxiiXIN+xFZyUNC0hqBLFXEhHznKTYmYDGjre4FhdiX70fYbWCADG/lx6/n4RIQcflbWMGyluzShmCIJglx9oIogMItZqRZehu+cLNd66YKXYtd92kb0dVabkhjb8Z2DVHoMwAhxF7YQl6kALsqpNpq2X2Utcw8gv/SQQJ92+wNT7tlrR31xBupdM9IgRAX4Q9Atdxez4U02ticzTR+h+JkYg/TtW7utShRnhjNgD6LgAjnTPDFJI5TN4jwqc3fkD0D7sT5gU3tUw2m2lBWyrw6eRwWoWwLGGh7mnfcj8x0bULMLzQVMu51eM4rNxKZnxGTQ1Tz12A==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(13003099007)(56012099006)(10067099003)(11063799006)(18002099003)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n2cAXZnvG8oKBVGu0piN5kT8mFWSz4TRrhJeZvG6OHkg5teeE+dwFkK9gZEPZBv/aFA71bAq+HlhpK9tu7pP9KHM0uCO0kmFA4OIH6c43SjPBPxuH1m5yWcrsTJ0nLYGU35Y7V8UwO3oZnqyopdh8+d2mVY+Pt4DLC8U3gwyNkrx7YF5ihPZOy9MW7Gje5vYFbQE10jncToPL5NkvoePy4RKcjlUEnCK2OctVZ2MpxeeBeeuZMW0BzhJ4hyyG1Ti9BNNdJh5nJygbsXTRb560FxIfx/Z8ReIMkWRNK6YmMFCiA+7/l7qeQYCs8hkikoAO2H7X/Onb3aPU5Fh0EwntvtnBTn7VWtV7y2ynlAU5jbLvaBg7+xwtt3GncUWqWgpT1SOGdWeush4wAVyU4+yFjR/edVd00B/Sc5qYevyfLU0+UPTtoTBPNCGKJUdKQnl
X-Exchange-RoutingPolicyChecked:
	JGG1uCuHBjVm3r1dbL1TRtQ7KxGWuL4jXzV4V58k40WcDd1kswnhZdPkKG+ayAvckPEclBRQ1fzKqUQkFH+ISPEcvlvRwc4F16uq20vsb8OOBjc724Q6UZLXmC9axSSAbkmirEYl8T/gV2d17ENJlvOGb7hBWMBHxxpLQ0GWlXEXQp4Vd9VXfuZHUFlqmM/Jl+2heIsJznPvDcCR6cjjNWoHrvwdqiLC2aUEi2Kv6YqbQVBEGp/i3uARNSErtuk7963nYc+oQQ6VHEYsDHE2/L0a683reuGw6wMcWqs6t+e0fpovQ58LJ2waPsRbs7V3qr48aHGGI/iz38j2Nih6uA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uKf4PswFrUcTlNlAp0vau6BJ/brvt2OR2V5iE0yhRlq2aj854wifHqvYkCMidKXYC43QANkZWYIzW01j9kTewWh+L9SwqI2p3vWdXd+sWcajjz5hVsrByEqLVqDlTvY9xOw9Zsup0AK8USloObGZGRE4tryCR8TJgAyOZPUG8UZDCK5w5pDQ2fpUUAb5VMb0xSB657wMN9dM5ANZz94C+ox754b5MlxSlr8cq/4pKlIVfXsF97ToHNq9QGBPlYHB0E6JlfVLwpzuP/5dTuge1a7/DamXxwYKkNRWsBMQ2e09PEJExrUFKf6KuibBsjm2fB6i7SM0scv9xXbWFbIAt9H6HWhPFkZP4baFr15k0G3nK1FbdNe5IWBEYmWq0qrMwnH4sBXHSMFEGFnFXaN90GP70wmLSGGOJhYEvls5umqykwlzpcszfNfDqd8Uzj6aqHySkadExjQsaPqGv0HyvJu++71cgR98qm83cVGCQKs0LWgLwgGaki4d8aMUoX3l2Nojcjd7N4IsiZueA6M7OLs4PoGXw86s1PMfKQFpm9nw+f1wnl8aB7IimfGav1U9+keMYSaCATFMqQC+uYg+RqCuHkMrBbbxT5sWok0CjfxWLsP6/KBtxZnOczFzFW1LKAXLP7lQMdx9xnXh1uj1Jw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:07:39.9243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028ed0e3-6669-411c-f62f-08defd645b3a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR16MB6910
X-Authority-Analysis: v=2.4 cv=VsETxe2n c=1 sm=1 tr=0 ts=6a84bb8f cx=c_pps
 a=Bwi9XBBeLLDh9/ECaGV8vA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=iox4zFpeAAAA:8
 a=cQZ98t5XXQgEeC-qFB4A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=3whSkbs7g9Me0DR5EJEX:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: zBUfd1HXRecJUv2-Z1X61XkQu1pJYLhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE0NyBTYWx0ZWRfX1I98SVwN3ev/
 tbMnqlhj3D4yIY1oibI56LFhLQOLZOikyJBMolJNLucrJ9021nqE0ThNerrNiiUyWOEITApi1hM
 A5ekcYp4nk8PaOn/V9t814omOg5anjdi4FRxcvCUdO2Tvg9mlMuhol9T1UFqxOcazLAI0TvJKkN
 8a5VM6iok5xZPbhc4xDxLyZTKv7t7L5e29uwtBGATP6XDr1D+zpfqRJrUdOpNTZp4livvnxEeAI
 aOxpC9Q1Mq8FkI76EEYLGryPz0PqIMQXiGsrzJ6/p1ymvuz+PvlV0QGKiu5cu49bC0EmVudyR9J
 eNqCgyxrdWnXCVsWnezjOlROqLGtasaFQrWZrvnbJHUr4uC9IC2qesGcdd25VJYJ/2JQaLL22kz
 QvOhV27YrdPTt6WzrZhCTsNfUyOjq4tXiyRaSohfCH/U71H2oEEMmw85D+o1eV5Dt7rE4RJaW/2
 /KfLuV9nTRBGzWzPOrw==
X-Proofpoint-GUID: zBUfd1HXRecJUv2-Z1X61XkQu1pJYLhf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE0NyBTYWx0ZWRfX11meS7G0gRjW
 bEKF+nbWsQo1sF2l++I7oBYSVSv4jCmqN95lIaoPDyYFarCCXV7CGnxP2oHWPPcyOhR7ojuouyM
 HRTRE0Y0Ynqr0W1CNaiR1wXg29bWp5YivA5SLvud/w3cjRTFaxnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180147
X-purgate-ID: tlsNG-bad1c0/1787083665-3A4DB034-07E69C09/0/0
X-purgate-type: clean
X-purgate-size: 704

On Tue, Aug 18, 2026 at 10:49:33AM +0200, Jan Beulich wrote:
> On 14.08.2026 03:02, dmukhin@ford.com wrote:
> > Mini-series to add new keyhander '?' for showing system information,
> > including command line and version info.
> > 
> > v5: https://lore.kernel.org/xen-devel/20260813035139.915536-2-dmukhin@ford.com/
> > CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2758940285
> > 
> > Denis Mukhin (2):
> >   xen/common: add keyhandler to show Xen command line
> >   xen/common: move version printout under '?' keyhandler
> 
> I would have wished them to be the other way around (as was requested), but well:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you.

