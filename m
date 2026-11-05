Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275A606A337
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=VJgI7XY5;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ansV6Sh4;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=hvA/C7P2;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=R9jcIeIb
Received: from list by lists.xenproject.org with outflank-mailman.1473228.1680901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNf-0000U0-NM; Thu, 05 Nov 2026 01:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473228.1680901; Thu, 05 Nov 2026 01:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNf-0000Tk-IF; Thu, 05 Nov 2026 01:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1473228;
 Thu, 05 Nov 2026 01:35:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNd-0008TB-9Y
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNc-001wz8-M2
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:04 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd16-2eae-0a2a0a5409dd-0a2a450285f6-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:04 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd46-6ca4-0a2a45020019-94a392176616-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:04 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mVFi1469714
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:02 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk511jk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:02 +0000 (GMT)
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by IA4PR16MB511274.namprd16.prod.outlook.com (2603:10b6:207:12c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:59 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::5d) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Thu, 5
 Nov 2026 01:34:58 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:58 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nw2N2971351
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:58 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrm2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:57 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNSx19cggTjoOmNTxge7s; Thu, 05 Nov 2026 01:34:57 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=mHb
	Y2cEQEvRPTVjvhml188mlseK3hau22WWwZyaMhvo=; b=VJgI7XY5Z+hU2/V8YcP
	Lm6oeuycYs3/+Z8+J69EjD3Pkv17FLVJJCpFBo/xli53zX4kBZfcggh4vBss5Ovd
	ojfLeHZH8uvHfOhzfKfZ4ob14HpdR6BYUCyQEsFU+eBJiG3R8jIFgajjyaJmrvwF
	hwMI4n0Pmym/eYSPCOWgXpYPUgZrxszknEMETl7IX7Wvo5PMC/LX5Icg2QI8WtHV
	wjunbSNFohupXsotwikB4mFY5EgL65//MUK7rQp4or6tu77AwH1VWUZ3EKh1YiAU
	suq6qlkMso+oruGdYdxmPesj419qx/8BCE1fKvpZWXg8wP+BbTGCZAR4ebQuBTO8
	6dg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twPlspMbv48vtMQFVIWr+FCnSHNS8xWQi+rKSPs85j3Tl9WV6n1IDfrWFifybrbOUvxV2kdwC96eKam0EVjfuJJ51oEjXlLyekXt2LDArpvTokILshh0KipQZCa9xx+y/i0X3woT4VAVo2J1YkJ+6pgcVoRI1ZzS83e+5giw3UxdTRGOhB8olO2u34c7OA3kI5zwCd3Z1OG3X8ZMmTaSH7W62snIsy0J+YD8s0LMo42L8APZmDtBK8y5G0inJwtwi3PWsHK4tYviUnO4b5TOqUCTJ8Cairjl3cZAaQPVUUNthEyPsaUx/RX8CkgKLLY/BK6IIkL+6vefT8M/ZyTeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHbY2cEQEvRPTVjvhml188mlseK3hau22WWwZyaMhvo=;
 b=AQ+1IHT2IXjoq/3EWRZGguePDr2T6sfzp6e1H9Ctv5J2lz8k1UELcPsUF//asmOgvi4cDmpYvEj/58rFP1KvmEHKIMTobdC96lF/UQg9wN4H4KGy94L8/8sbhPGpo0ACBamfO/Rtnl7Fd5o1x5c3aMV4TGB7UKUV01Od25wTjn49orRwKoOvqRZRSlM5V63KkrxFG4F5r4YlixLAuZgLJMuz8/VkUVnr3Q6EG0eCJemoKgByNHQ88pxAxOTwHkXUyD7vdn8LGxl3VUYtV1W4UP/YdhOhO8rdDHpOL+xgMZ+DU/nhWMJRV65bIMwtHisx5OXhzoDdVa4KmpQCk5Mwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHbY2cEQEvRPTVjvhml188mlseK3hau22WWwZyaMhvo=;
 b=ansV6Sh4hwTIbCZ7cdgfCdGAptBUunrg/tbswng7/D0eXHUzK3KYTO1n1SFREoG2uIqLlA6H8CwjPYB43MTR6sHcejXkzJ9aeNhqM9cpoGFAwOmMg4fsYjBNbu7Ouwcoa+Nc7I/tU8HXqGOe7IAp42cAo2ScKidDlgO5UinUm3o=
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
	ppserprodsaar; bh=mHbY2cEQEvRPTVjvhml188mlseK3hau22WWwZyaMhvo=; b=
	hvA/C7P2lZoMmaJRYU2Pkc4YSHVvN/AlZ2HSOZVZJZ0azEPlLKtbf2XcldqFtJJv
	0ixhr5ddCD1getVAnlquHHQ+KRMR3T0JdQ6Ll+8jaabJNA+rvSgP1TG1muZrXZHY
	3NDrT5w2jA6LJ7c/KsD0gXM3POpeJ1sWSBxePxanDuT4FblPJfxpdyshNp6D/d+/
	pm6HxOPGItmDKum3KOF13800zGe/dLky9oe/g78s9v8d3jGGa4I9JOGTrFLph1me
	J3g0PaTiYgBBqPaiT0RQCEdtr8y8kdrZLRpMe0Ic1WbTfCVW3bQSDp6YDH7fzqf3
	YzulVmpQKpfW1GjLGxYksw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=mHbY2cE
	QEvRPTVjvhml188mlseK3hau22WWwZyaMhvo=; b=R9jcIeIbKa0t8o2369uQv1S
	a41oJQ5bR6s3g/GIIXFCHeQKMjA32Q8FLJz+m8pPeLhDt6bT5nSRHU5b1ygxmNxG
	R1VMFCYI6UcjNqrN6Y9dG/+5+YhcqKKF2cHzWfEQB6QVaIeaziJFdIe8ZMnUK+2k
	pbHc0DfTRE3hYL3UbJp5MacpCUnAPALY+5LLsS3RpGK1i6YxqWOSWc9P65cEQQ8x
	3XsoLTDOXl8ZMbH7a0+wb+xYzPkam5f15RzdSSm5t1olIRLjgYZIYKrjvpzS8PTt
	fmRyhj6RAW7Nr47peSEeIrHJUW+SvhQwkD2/TCwKlOr8oYSSfLkfl0TwDdqDgbA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNSx19cggTjoOmNTxge7s
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 20/28] x86/hvm: rework XEN_DOMCTL_debug_op
Date: Wed,  4 Nov 2026 17:33:37 -0800
Message-ID: <20261105013347.719392-21-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|IA4PR16MB511274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4b51e687-7cb7-40a7-2c8d-08df3add00b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|261021123027099003|56012099006|261009223027099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	11OCqQrw7ASxqgxf/t8SUdI/ez6Khfel0J0+UsbiXtxgIuc5ynPDx3SPHKepiySJVAwL8snT+Y0eBhhV/NuCSNWse7KSCPb17CDDtkzlaA+WaEygLzyJp+4i+3Zdw/lMr9QomzRyke/ZkyTBrjFLepI82bOMCDKtLV7zMo/0XJCsHiuyJFWvtTIZyMTLvgincz4DTO10L0+iNI1eRkBPcBalTofr270HqeAMmLx0VkTE54NILVQY9u0KOElCU2pAZuuGIbYvTRs3Tak/OQbSJDmzQgfjv6isVqftopvhLqwfMYqPuNaVgyEq+8FKdAEzy+R9QaEVYUIq6vg3bncSQ2kfNxH74yxFprUDDahVkfeee3mBU1aLNcJ48+L752P0ZvxEcNny1HQXQINk/cY1gfP2pAoBd1HX7ZAe/0CVW/bkM4IWjEG0C2N4i78KhTIV+UDAwLxl0uibY1qffLWhmimKc/5RRXFDJGGaB4Zqsi0MLHkNe6sD/Ko5eaHYfJkgcO79cBtB/ZCG7DhwsLebSoJko15KlfW2emV9fzKOVUr7fRakHCOKEAWzlhrNZX36Tul47W48QFD73uUYNvZyNf6YttJB4Oyr+llY5yII30Jf/WnCcSKIP6dgbIF9wHJir4GHG7GCORxJgtkdo/njMe7HDS5dOqjo+KhGq1entU2DZQjwCfEwrwOFPzgPYiWzsiMQbyg13J/8raH+5nxsgA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(261021123027099003)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8qPuxy7Gkefx32IycoV0Il+cYHVsbvbGHfmnCpwC508OOWLdaCDEZhjCbPYOfCxcKIXV1BzhvmB/kUxGWzWFVawAajm3A8ZG7r8NPAMj3bNSF2MB1TE9SwZcvajM6bc7heiceL+dspzvMElza90A/pfRsmXhZ6Pl9b3tDYhHYU85C+R9FTOs/ouW3HV4LqAe8wtL1ElhTncVDY0NvRyC2rU31W0i64UR6y0KyN5743A5prcvHiZhFF9Izj6MDMfyulu/MfkznzOOIX/Ai9KGHfWqGuzY6LZrQ6wrluu7Wvn4tRKc3VXMyVYTIZb2rgv5wsgoyeNBNS5BrzFDueqCqLMowJKD2H5swHA2z9RInmxB8CsQZFluYpmmAlAbfIxTAU/T2WH0nLwL5jaQJl08ezRAjYJydRl3VmrF95kaYXyCweWmBwIflcCZ+xcoNqpb
X-Exchange-RoutingPolicyChecked:
	tpuKP1mCJbHk8Eh3c1fbR233jZeI27QI/FHKfK9zszhGlPzayNpTdO5SpGbw015K4cdqOZHk/zk3sT1Eih5hsFGy+XWn3hhoEGvyhD9/UIaDbf0H6YrdBEkQW7n5YdILe9CrEchu8KUMmuLf+YK6yTmDJjP8Xk68AVj+KoJZP6ndhnDc1JbEzClKz1Z5fY6IBOR9zQnnZOhWqnQ1vxKU8W9f6fUg8FqV+60rOsd1DwJeNU4DWjQzOi+m7892UpRFHc4HcLXRb2w0JNx6B7stUlqphMQLAzXpcKDoLvz4srpT/rTfSdk08PUJCjXmOrJfPQecGeSJRzuQ8MbArJEBXQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XqtLds2ieEgEq5ydxJ4+WSHXjI/GGjl8J7lAHjpQNgy7W7GDBOnEkGXaVdc+gdLB/fEQasJxNTpiMnRGcRM1kbkThLiPWatmMJ1qAQ7zPg5em9y1S7f6rATJqEzB0sopsH8SdXLgm0DIAbVx0A6bSzO72l/UsexIILTl6gWGmw5UwiHTe1gmr81k+0N8jJOOVjt4oNXTGCRtwRkXcxYeOpgKeyghNa1zh8gIlVgmZwnMhgLXAUzt0vPtCtXCh5652xZKkfRoH8v0Wm9+3mVWGvlRMvC4tkavmR+84J3fYyMVUM0CaoVolMbIPAOgcr6alVnwMOo9AAZ7T1UBXhTsiP/ksy0rKfUSGzG46NE7bfZrSnlkBISAaaD7zNAHmxDaT24xkPOqAEsspS0nygCK5zMs823S12lBC2lSS5WF4wBBEe+s9krrovVIxlx+TulgmRUBZg9NTWrAFBkntcDiOuqJbaj+nLCjYg4H6XDI8kkLFXb0pdJ09bg1/ypQmis0CzDt6tpMGvRVS5s6FUyYTIEXXxtcpt1MYcuJAsW3u4PLDjgufrbmjXIoFEKr2RlSIPgFUoJ8WH2cF6SDs153zuI7a3Av62UXozloJ1cbveqOfDC+zHT5Z1plz0FwvuSDuZMSORXk7M+6WMYtvUTkHA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:58.3153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b51e687-7cb7-40a7-2c8d-08df3add00b1
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR16MB511274
X-Proofpoint-GUID: S2gwo7FINhk4xp7sCcAO8UPhwEU3Ufdv
X-Proofpoint-ORIG-GUID: S2gwo7FINhk4xp7sCcAO8UPhwEU3Ufdv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX3kEZrvH8bUZx
 jhZNty9tUwsboc61kPAsEbvC3J0JkYgLBt/Ydts0FueeZvkXVV4R2eLBf7JnDWjZG00TZtVEFyJ
 JAd/RRnQXoWRaDmsYUCjvJawaDNxHDn521aP03aCfzGN3XH4zoT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX5eD6dy5YTCWU
 sig03n8ODmKmI2t7zsemZ+uht7/tCJP7RnawUvhuUSPR+l+MPl2Uf8jypAEojjKoCaWAD0wZfmO
 Afgb7OljhJjUnuMJPcH3WCnb2H7B7161vZLqmahuLWkCeJSbNIWVe/aejsti6JULgVsdOAQ28B2
 jYbr8HFc5HRAlwksVaNC5OGqrq1r7ZCrAf3MrvGQA/poIAO+EmED8MN5yDaVe3JGvNcHdAdCJ2X
 Yibx2yEsoYsjQSq58v2IJ7Khxf1Yy4YNayTK/9qliuNN7POHhNajdXQk4fs8+IIXk/1RKTHz8Ld
 Cu1zWvs/Lt9Y5nF7TmH8fEEpT6iZsTivbH7qZ7tKq2O2Ov6QNpNmoREfmjRiNhq6+zItZdL6Jwg
 PKKWM5HfXzgZQsV04oBPw4/drJyUqV7LSX3Y1T2//LUNCZuJePKkxVn/9eghYEDC+Uk5f9oQepv
 pJk6rgEB8b1wQXlK3ng==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebdd46 cx=c_pps
 a=feJg8xcwi6yo0k/5NfVkgw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=AkNqmx6zKqa0tKD4cjMA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-720697/1793842504-30FCE2AC-9EF12CA4/0/0
X-purgate-type: clean
X-purgate-size: 5134
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Currently, XEN_DOMCTL_debug_op assumes operations on VCPUs only
and only for Intel VMX-supported HVM domains. This limits its
usability in the test infrastructure.

Generalize XEN_DOMCTL_debug_op to allow operations on any x86 HVM
domain.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/domctl.c              | 24 ++++--------
 xen/arch/x86/hvm/hvm.c             | 59 ++++++++++++++++++++----------
 xen/arch/x86/include/asm/hvm/hvm.h |  3 +-
 xen/include/public/domctl.h        |  1 +
 4 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 12c14bb3f514..7a52aff71620 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -912,23 +912,13 @@ long arch_do_domctl(
 
     case XEN_DOMCTL_debug_op:
     {
-        struct vcpu *v;
-
-        ret = -EOPNOTSUPP;
-        if ( !IS_ENABLED(CONFIG_HVM) )
-            break;
-
-        ret = -EINVAL;
-        if ( (domctl->u.debug_op.vcpu >= d->max_vcpus) ||
-             ((v = d->vcpu[domctl->u.debug_op.vcpu]) == NULL) )
-            break;
-
-        ret = -EINVAL;
-        if ( (v == curr) || /* no vcpu_pause() */
-             !is_hvm_domain(d) )
-            break;
-
-        ret = hvm_debug_op(v, domctl->u.debug_op.op);
+        if ( IS_ENABLED(CONFIG_HVM) )
+            ret = hvm_debug_op(d,
+                               domctl->u.debug_op.op,
+                               domctl->u.debug_op.vcpu,
+                               domctl->u.debug_op.arg);
+        else
+            ret = -EOPNOTSUPP;
         break;
     }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..42139837904a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5200,32 +5200,52 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
-int hvm_debug_op(struct vcpu *v, int32_t op)
+static int hvm_debug_op_single_step_allowed(const struct domain *d,
+                                            unsigned int vcpu)
 {
+    if ( (vcpu >= d->max_vcpus) || (d->vcpu[vcpu] == NULL) )
+        return -EINVAL;
+
+    if ( (d->vcpu[vcpu] == current) || /* no vcpu_pause() */
+         !is_hvm_domain(d) )
+        return -EINVAL;
+
+    if ( !IS_ENABLED(CONFIG_INTEL_VMX) || !cpu_has_monitor_trap_flag )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+int hvm_debug_op(struct domain *d, unsigned int op, unsigned int vcpu,
+                 unsigned int arg)
+{
+    struct vcpu *v;
     int rc = 0;
 
-    switch ( op )
-    {
-        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
-        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
-            if ( !cpu_has_monitor_trap_flag )
-                return -EOPNOTSUPP;
-            break;
-        default:
-            return -ENOSYS;
-    }
-
-    BUILD_ERROR_IF_NOT(CONFIG_INTEL_VMX);
-
-    vcpu_pause(v);
-
     switch ( op )
     {
     case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
+        rc = hvm_debug_op_single_step_allowed(d, vcpu);
+        if ( rc )
+            break;
+
+        v = d->vcpu[vcpu];
+
+        vcpu_pause(v);
         v->arch.hvm.single_step = true;
+        vcpu_unpause(v); /* guest will latch new state */
+
         break;
 
     case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
+        rc = hvm_debug_op_single_step_allowed(d, vcpu);
+        if ( rc )
+            break;
+
+        v = d->vcpu[vcpu];
+
+        vcpu_pause(v);
+
         v->arch.hvm.single_step = false;
 
 #ifdef CONFIG_ALTP2M
@@ -5233,15 +5253,14 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
         v->arch.hvm.fast_single_step.p2midx = 0;
 #endif
 
+        vcpu_unpause(v); /* guest will latch new state */
+
         break;
 
-    default: /* Excluded above */
-        ASSERT_UNREACHABLE();
+    default:
         return -ENOSYS;
     }
 
-    vcpu_unpause(v); /* guest will latch new state */
-
     return rc;
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 1f0f7749b579..6efc533b35df 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -369,7 +369,8 @@ void *hvm_map_guest_frame_ro(unsigned long gfn, bool permanent);
 void hvm_unmap_guest_frame(void *p, bool permanent);
 void hvm_mapped_guest_frames_mark_dirty(struct domain *d);
 
-int hvm_debug_op(struct vcpu *v, int32_t op);
+int hvm_debug_op(struct domain *d, unsigned int op, unsigned int vcpu,
+                 unsigned int arg);
 
 /* Caller should pause vcpu before calling this function */
 void hvm_toggle_singlestep(struct vcpu *v);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4ca8a2d7ca65..546d9a8ac9c0 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -768,6 +768,7 @@ struct xen_domctl_subscribe {
 struct xen_domctl_debug_op {
     uint32_t op;   /* IN */
     uint32_t vcpu; /* IN */
+    uint32_t arg;  /* IN */
 };
 
 /*
-- 
2.55.0


