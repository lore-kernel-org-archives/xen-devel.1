Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF6DC5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 20:57:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388579.1629588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wttWn-0003B3-82; Tue, 11 Aug 2026 20:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388579.1629588; Tue, 11 Aug 2026 20:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wttWn-0003Av-2S; Tue, 11 Aug 2026 20:56:53 +0000
Received: by outflank-mailman (input) for mailman id 1388579;
 Tue, 11 Aug 2026 20:56:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wttWl-0003Ap-EG
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 20:56:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wttWk-00C9Zw-Jq
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 22:56:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7b8c68-2eae-0a2a0a5409dd-0a2a4509c774-22
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 22:56:50 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7b8c91-be1a-0a2a45090019-94a38ff19fd4-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 22:56:50 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BJJn0M2001468
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 20:56:48 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4g09ba9du8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 20:56:48 +0000 (GMT)
Received: from CY5PR13CA0020.namprd13.prod.outlook.com (2603:10b6:930::28) by
 DS5PPFB94A44349.namprd16.prod.outlook.com (2603:10b6:f:fc00::7e2)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 20:56:41 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:0:cafe::72) by CY5PR13CA0020.outlook.office365.com
 (2603:10b6:930::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 20:56:34 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 20:56:34 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BJLfCS3908633
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:56:33 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fxjw5bgvk-8
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:56:33 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id ttWQwfPJzl3RSttWRwAbBm; Tue, 11 Aug 2026 20:56:33 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=IpF
	aWXCS8wKrFCAJX7TdF+E6dLgoZO2PmKlN5PHgGG0=; b=izET5PSllWR/YnY6o3D
	ZEl1/PALRKXoOV8Ljkfah/KB7Ac2Uc52CNSYmzA2X+qG0374t02s+HqUR0JwOjVH
	YRGUkgzw2GDhC4VLoIYVogKFFGD7SErw3rLFk/oUJSQIeMeYqnP6XXnSVvFYiaWU
	9GJOoAe4Eux8xGg2bi84O24gx5zZRIF2OICnuCc0CLOmOqygy2sx41S7J2okK9/w
	Iumb+aQZExb0bdhyu7E4Bv38k/S1Kyv/ab4SbaZYp34/2/xvGs7XlshlAtCnUOvp
	auuIOIlTlxymBxGDx94yXLdFTOKaMDMF7gRL0DQJzvIPl9JCBbLOTsBtKPQrBsyy
	IkQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJoOPPTQDT/Rh5naPIfHi1ltmGlTuhYVl9R/r7OsTimr+nEmQnehQaAyqQ31ucJdAIMvsTzknmvRc+DmdcR0lGRfWYoXEovYPNSw9974mRt1gLeA52am2Vj0d+wEj9jVsWjEUXbbsuxZ9dSfCE2TIUEhl/PiDbzbWQpyN5uqO8qPDJK40Vun3WODTCS9xM9RN7vj1ANXNoSf5fjFk6C1c9vuhyhDoS5L691YZJ2SRro4JAHhs33+QZ26c/bHYoHxwO91BCh+ipFbjTrq96GqEJYFZDD6/jNt4zM/8Wq+KbFoZAL0BmmNatLDWWDxM+tDdEcA90f7c1/no1o4z1+q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaJSCv2lEXMaKDFwipG2L6SrodZaW09V9uuUK67N/dc=;
 b=voS6uiKb3XaJwLynr2rMmEVjKGzoPkL7NYUDMiMMXDC0J/OEqPI8dctiSx9lfiu6oXOX83MQtdeFG6dj3UTmOVAn/Ys+Xumr6CgwJOMud+9XoVnmLjUlUQKpjrmYdyzsbeGzuGxg9UWl5OuSNvNlY6JP5cJ7DmbfOcTgEuI0XO2Q99oKs6GsTjnRU63Sn31Eg4BhqI9+olt//uAOCZ+3x7hlYfASoaSDcbmA6s484wm086tDAbzpyYC35K0+l3hsHkLwlU/+VMe96pK0FmyK1CWn0BzScL7mKqGdFXClHETA0uCu0xixOh7/kZzhYRNiD5u2CRSjcUv+EZrZlduu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaJSCv2lEXMaKDFwipG2L6SrodZaW09V9uuUK67N/dc=;
 b=QrXvJ8czFuON7dpdgzWukIp+GAhrF98wkzMLxYpGH0PYTcHyDDG5JKg7a4sPrx6xa4oAcNE2JEzLTGw6OCyPXl3Q486/PWqrdDxvOrFtKpHnByUGXM2j/du9/cXtVTGhEjZCPGj4K2pZmzvf0AYHyvpaSCZylXKgC9k0W4IaX9s=
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
	:subject:to; s=ppserprodsaar; bh=IpFaWXCS8wKrFCAJX7TdF+E6dLgoZO2
	PmKlN5PHgGG0=; b=KYrRV3V0u1gXenMVXpjm8wdHwToNsP/2Jc0A2+buzA25kGb
	PkE1iVVzH5hNV7EYlyXzu/fyU+YCyAANBGOfP9lfS4XE2VYs4Bp/LHLyUq+u0niS
	G9cfz3qJojbm8aPe0X017urXdWkgWlWMbZ9UaB+JKiKv9W38UCDiEuXVysNFzSiY
	h5Z3hxFIe/jk/1YqwWSUoW1CNyV+qL4JEI1fZWisGLQCY9yGU4CO0u3PFms2MVSN
	d51ICdTnqXT4cqNWysMw43OS7BLQE/oKznKQjGk6PVMAToZTgJzEjiQtN1JKT1xZ
	1PiUbcgrzPOh6/m4hyP6mGVeaaKkW1aRzJ5AYqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=IpFaWXCS8wKrFCAJX7TdF+E6dLgoZO2PmKlN5PHgGG0=; b=Iw1dqGq4QgT8
	kFcFxHF9hqjln4bLWu5OxtT18K5bBBF7KIdc1HVfrQqB3332P4fs0dhmjBdursME
	opuvhBO4arcWZhLY/aI/cBI3Szq85+X0NbdcITtjLQBoeeKtHHfjHK9n+wEGt3uF
	PUfVfcibiXGkqD9tjhFlNt+OIxTl30pNFs7cnjqzMQ+ZkgulMwfuUDMw8xOplPRa
	RswsEYlbLoOxuLsCLJ4sYj1gq6E/FyTkvPfA/j1imLzB5+97D68cT1QGDKRI9vTE
	tJcAI4lRBVkpJY7b3ukdmjpNcgsX79vaIpQHXR3pST+33KgdjxJigkE8scnt7fS8
	EWrsZniwtA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: ttWQwfPJzl3RSttWRwAbBm
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 11 Aug 2026 13:56:30 -0700
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        sstabellini@kernel.org
Subject: Re: [PATCH v3] xen/common: add keyhandler to show Xen command line
Message-ID: <anuMfq/lDjxbR8Om@kraken>
References: <20260810230359.671587-3-dmukhin@ford.com>
 <anrXvTfBls4flBqK@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anrXvTfBls4flBqK@macbook.local>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110176
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DS5PPFB94A44349:EE_
X-MS-Office365-Filtering-Correlation-Id: db1e8af5-37af-47a6-d463-08def7eb073c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|13003099007|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0Iod4o0OXz0Z0KHnKNSnTGIzVax7RO4/o8VuNcRKKoveEsLPmXYO0jiOmzfs/asYjDLIguhQrtzN3eDBwmMnveR0oK7EK075o2z25Ii/OiGXlfEHCMcYRR73CYgfxaUR8NQv2v7wFUiRtcT9b5FWrfgw+Ol0TWFegbAEXnOzoEFpRUT4cLlhDOOhssaLAmGeeJfEx2f8wrsVWNNt26eAB6aa3rDlA5NOKWVZI3Vr/HjnUCHEPZ2wNszJfXP6IKFBIBpRdhyUpe+DoavkO+h4SlGsg3+NRIgQslmfA5up7ay+6nzOjkLwhH3MpUd1lfDUz20VoAyEGBiyYpvVbl3iZVzxmNeglwFUtNE8xfA76Wf7TA4E4WJ68fCUS3xpseNuUsjKmTSKlBgrV+aZa6ME4gYQh3GoUp14ZHWp1mjgJlw0zFRiVzSPqVzoqnTuEDVPSXJc7FFB4zJSNXELGBOgszChHwT5FbLByfRwzZpPSuTJsNxQP3N03c8upsXgCPdAEn7i/8vhpupdSvv9zL6Hjr8F5f1iPq9Iea3NUTVEAmtGQazTsAJWedYCZMaz5koXF+iQsHL9h09juMC6OWGyLUD21Lopw6bUsOA+PjJ2AP/XifGODTf/Is8X2K/76ClMUYJcvoZAEmXXuhpsG8Jp+9jnhvAJnTNcDyw0e7xc/sw8n2czdjoJVxqyozLuMg0OaNncVSoBRKTZEJ+7ZjByYw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(13003099007)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J6MpSU20onwor5Xl5d0AVzSHMl8AfVm0ornQ0hn+M0AA9POmCO8Y0IEvp4pATbVXE0TgChTrHF5mAhDyFV73xsD66wmB3t5pGpkTmIONYArktpcBX7qlu+6D1v0KIj9f/x1uzu4bWLRr8USHfxsR8a+uS6uxY4yWL+v7YMQlBVORB80z1RtkbgcN5OY3LQ0X1XLxQt95H5ZMDdzw+UWYrYgWETHFCtFkMNGt+HCQp7+qS21W9KCNroElg7bRCp/oJhBrzIyi+SN3q+Nj+D04D6mJMrGGLcZquvSEianhlHJbCmjWo1/2wKQNdIiFZQaeooeN90Ycqyd700jqYzIRhpjVFE6P7OTjxEhR3m8xHpeQ/JlD18GvV6/Jxs2ZpV5mjlB8I1g19mXOsOUmL0dIjx0J0FI/WHu1iRBfLbUFBZ5wHexsR6eBuVa0jMUTgX89
X-Exchange-RoutingPolicyChecked:
	qh4fB8KPIecNkOqEsqXzsaprcXL9g4bHijGGs4u3kX9lzZGlYHbXBXe4ymqrdPWyozB3ukPzaoQTR3DfsYlDo1Djt85VfpMKDywe5K0D//mVPYTWAYWe56gdJAE3/Ll8RfKS2XALFL0AVxyHww+6yejjoyf19iRjVmFob9RrThbVzPnMkjiVkN6QDw3iIMi7y7OohDIv72j8eQR7GGWaFGwBzeKXvA34M7g6oRsXGmVAelViLiGGk6WsXCojvZcGdEU4jKNogmuGd6cWbkFupWnp1NRiDV9ZnUHx/lHyaMKU907PukVQkHmD0oC6IIcAxDB6o0lkLhDI4VhIKgQH5w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y0IYgfAW+NIIpOi3rKP1laai4RbbhxyutmMRmTa0kKTOfvU11D8BmhTRqlysMhyWOfPuqqmDv7j2dVXSpddmzXSi972eB9VHQJKmVUl2PRhOv+WPU/kmvIBuuYqDr0zhrApcsQ/bcFlutV+tzVUE8cEzRwfhy6Kop4BFv4DTQCfekNFb7fFoIYeq9HEExLLlJg+FxrvRH8T0+Mybgu99lN4JvSVYRbsCY2r61ruhf9esx5zPabxtX9aD4E8lgPOsqr68XptS7icJghEOT52sC8K0hhnLA566DrPYAFCFJQsR3WcvKS/EU4sTtJ1Z43UoO7pxpDU0zPQwOb98eDejSRkbvnEk/21DPvFEmvejvu/5N1wRRdEGYrcsD83Tx0rr1iQNkH8yQLKJuC9WpPdEk/Qkl9Edcdjm+ecxf96A/jko0eKpMDPcWyjy661mqzCj6iRCS/7VzcdhQERxnbLIWmAQ9+ZZJfRLLv08arqvWBUiGZtMihI+hR7Ms+AfCPigKVN2w/bdPDuVNqr4N7cCbo10lGZF4wcNapYpDwzTWvj/dd7c2ihCuPjiZy3gUQuVS8eqIxJl1LE/1Q2GjhNaIB+zeBMMI34J9ISj8vgG5IFQzvTJRHdvU3RczNjSnjPxGgUz9Q8eVgpFjlecwlFx+w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:56:34.2514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db1e8af5-37af-47a6-d463-08def7eb073c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB94A44349
X-Proofpoint-GUID: jehaKD0yGhKd05ZUIIMdUO0dkWpalOsy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE3NiBTYWx0ZWRfXzwdh4ogVL02q
 DSZVB/EAgWeJtBwhGDvES/YYsd3AibyLhCtdGdDMW1ASGZzyyJIhFJhiDviSxnjiI8JeJ/T6mGs
 jTlm69/bHjb55Cledl9gCLXAY/UJX3tNJSM66SjZEfrGuos7Fa2s
X-Proofpoint-ORIG-GUID: jehaKD0yGhKd05ZUIIMdUO0dkWpalOsy
X-Authority-Analysis: v=2.4 cv=eKojSnp1 c=1 sm=1 tr=0 ts=6a7b8c90 cx=c_pps
 a=hWS9KTtKglmM4LJ/Q12dcg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=NaRELG4ay2vD9XK9qR4A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE3NiBTYWx0ZWRfX1Xh0Lp5szIkl
 jPMxhNNgydn3rBZ9cEIzi7nWJxkUqCVmp/P9whzVOLvLVBquX/gX0xtwrx3/QCHR8n7wobuhcP6
 LwNoe+jkhmlmD0YqYQxwvI5hqWf8Qeod70H1F5huYWFanL37GgV+Xv8Jl5lH00SQ9tyCx1ypX7A
 HiN5DG5Vd5eudhoJH8kRxqky4mMDYqG1jmw5e4x48IYiLJivqRZ+M9lhyD4DqquxlQUUpnYx3eQ
 LvCDp6W+/82Ohkl/zg5FjOIwhFRS/ovAEG+Sb0Ce1ZxRgmfRheaJjqUGOluo9hD/gnzQ9wAZB9r
 7JCyvkB/pkN8QuTz3bfi8v+MOPS1aZXxYykvnZNWvP+lnppMnZMj6xispqFqexgLwgaEFMgtBT5
 zaWaQLktdRN9d3g2R0LIcb7MgPlaDIouzTC85TSFa13TdmUwrAvdKU93Mh4QoELKdxtkIBaqcfG
 tUwnbZb1LUhbxCIyvyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110176
X-purgate-ID: tlsNG-bad1c0/1786481810-3A0C5034-66C9842F/0/0
X-purgate-type: clean
X-purgate-size: 2630

Thanks for taking a look!

On Tue, Aug 11, 2026 at 10:05:17AM +0200, Roger Pau Monné wrote:
> On Mon, Aug 10, 2026 at 04:04:01PM -0700, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Currently there's no way to print Xen command line on the emergency
> > console for debugging purposes when 'xl' is not unavailable.
> > 
> > Add new keyhander 'X' to do command line printout.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - account for CONFIG_CMDLINE_OVERRIDE case
> > - use IS_ENABLED()
> > 
> > v2: https://lore.kernel.org/xen-devel/20260803070047.3097846-3-dmukhin@ford.com/
> > CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2748655201
> > ---
> >  xen/common/kernel.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> > index d1bef9ac2b2b..54a7ee6f68e5 100644
> > --- a/xen/common/kernel.c
> > +++ b/xen/common/kernel.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <xen/init.h>
> > +#include <xen/keyhandler.h>
> >  #include <xen/lib.h>
> >  #include <xen/errno.h>
> >  #include <xen/param.h>
> > @@ -505,6 +506,25 @@ static int __init cf_check param_init(void)
> >  __initcall(param_init);
> >  #endif
> >  
> > +static void cf_check show_hypervisor_info(unsigned char key)
> > +{
> > +    printk("'%c' pressed -> showing hypervisor information\n", key);
> > +
> > +    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
> > +        printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");
> 
> Since we are there already, why not print the builtin command line
> using CONFIG_CMDLINE?

Will update.

> 
> > +    else
> > +        printk("Command line: %s\n", saved_cmdline);
> > +}
> > +
> > +static int __init cf_check misc_init(void)
> > +{
> > +    register_keyhandler('X', show_hypervisor_info,
> > +                        "show hypervisor information", 0);
> 
> "show hypervisor information" seems too generic to me, almost all
> debug keys could be defined by this sentence TBH.  I think this needs
> to be more specific, but I'm not sure what's the plan regarding this
> key.  Is there an intention to print more stuff here, or just the
> command line?  Knowing the full set of information to be printed might
> help come up with a better name.

I will update to "show_cmdline" since I originally planed to expose Xen
command line only so it is possible to better debug a system when dom0
becomes almost unresponsive.

> 
> Thanks, Roger.
> 

--
Denis

