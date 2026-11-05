Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B0606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=CUYcPoSs;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=BEsmsHXj;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=bau7B4e1;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=q2ge5zX0
Received: from list by lists.xenproject.org with outflank-mailman.1473176.1680811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNE-00053b-Nx; Thu, 05 Nov 2026 01:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473176.1680811; Thu, 05 Nov 2026 01:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNE-00053G-KG; Thu, 05 Nov 2026 01:34:40 +0000
Received: by outflank-mailman (input) for mailman id 1473176;
 Thu, 05 Nov 2026 01:34:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmND-00050I-GH
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNC-001wz8-TO
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:38 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd16-2eae-0a2a0a5409dd-0a2a450285f6-22
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:38 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd2d-6ca4-0a2a45020019-94a38ff1eb72-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:38 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mYBH2064415
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:37 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011015.outbound.protection.outlook.com
 [40.93.194.15])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrbp3t5w5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:37 +0000 (GMT)
Received: from SJ0PR05CA0202.namprd05.prod.outlook.com (2603:10b6:a03:330::27)
 by SJ0PR16MB4798.namprd16.prod.outlook.com (2603:10b6:a03:42e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:33 +0000
Received: from BY1PEPF00026956.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::88) by SJ0PR05CA0202.outlook.office365.com
 (2603:10b6:a03:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Thu, 5
 Nov 2026 01:34:33 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BY1PEPF00026956.mail.protection.outlook.com (10.167.244.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:32 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50msot3109191
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:32 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swayd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:31 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmN3xqmAt9qreOmN4xphDU; Thu, 05 Nov 2026 01:34:31 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=nTk
	i03+UZl4gqycijB+8IvHThLFtDt3d8yvUXUI72Io=; b=CUYcPoSsefN2pGo04jO
	hLevqQyjt7KZW/N/CkdF6JYX3fRjFGyJMlZvP7m4MjwCRc1eW7Kd587nVmhyVPdA
	XewUdHDVgmAHpQO1BAwbikYkGetIs/H77kI4PAsRj8yg7K84ds/W4YKSCWPCAaph
	NfdpuzW6VJsFQR57z1GRX48l9J+4GGBGB4eXL+W+3OE9TQBryGNzSkl4rHcj625N
	iKIp5Wz04CAQiV+TTDm5eEIrMGJQiE+yaTFERXtspdq1Rcwu6xTdGErJ1ERLfm5F
	BxS0qpDtBj325VX3LM7SBZbHGV+EwkM8ismWwQAFbXKQf1ZPNQHI2GruHv43/oWN
	jNg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkA+Uc5xrKi2U5Pemwi9se9R18Bsxen+B8aDi+XnliSyyPEeXjXW0N0HXmalnnqTDH8KAJ3O0aZIhvaXETTDz25q+Hox+FLVw2tVJziDOqGMTI9uEDH1fPSno/9cstsNUWmVmcEBZg4ECuu9Gpw8XnUEOb71dYy6TUnyIPG/k3VJDzi8WrOByaOCb/Ey3kvqpSfh6UffhQjZAn0Wj1Tvw/IYsOYm2AfyHzvERWsKRRYL1cl2ytRPXTSLnClZYRAWVDJ++3LrlE5oqg/4y8qSvpODNzjk7pQQAguuv2+UoOC2HI0bRfF7btm/PfieSyz9w/e99QTsOL7Jx56yA/HgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTki03+UZl4gqycijB+8IvHThLFtDt3d8yvUXUI72Io=;
 b=mCPjDQTcDzevPEQxlNvyo+2u4mVcCDxLXadxNl3MUXWE2esast4/3n6Lp1JJyOs1uok1y4YICb0KYHxP3UILWP+yK+qvTQYctI8EDliRpOahT0FhuCELUT5EUnSY2C6O6My0+fEqB+HbgjCNeuo4FMg8infeM5TFFDTAcU65tYBRXNwoAof5lysetiQnVxzA3847e86ivWtsWAJIzZfz/syvgKV0pryzeSuh9sVwHjCyTOvUQgwOVZhEbYwZttpiZ9i/Iss7xMTdZaV+lMbWx1IQegSVSElCOENOSj0fAx1uYJ0lcI+Px0/BYBbSEsI1aQ1/UcfRGlaJIjhxqv2pJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTki03+UZl4gqycijB+8IvHThLFtDt3d8yvUXUI72Io=;
 b=BEsmsHXj1ugyNU44pk418GpLZPJ0Uom4OHx4r0EyoXKUImZYJORRvNlAS+fC6E1zJwaU6lCrkhnDblHvAwMWHh/Om2MvFDEZTefgerJs3lWTgy/e3R/Bp3lXcaJe1IU5Ityvhxf6rk3ql0p/Xqrjg/lCFx+vOSPFWWX1pkCcxKw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=nTki03+UZl4gqycijB+8IvHThLFtDt3d8yvUXUI72Io=; b=
	bau7B4e1mzH3RDf8f3k5w8vs5SQ/zPMHzeK51o/IWNJtuECN9fazYPvMNq9HefRQ
	ejXL9W7rdXJZnAecXQbj2FHP1pmH15egDshSWd0NZYSywCm1Fqyq93LfLAnnuvUA
	+HNm/ED8YnVi/esn9O7VCRpNEh0Fd7H95a+sgtU4JbacmmtcjR0xVA5XpOUItq78
	KA4eAEroT5dHXpZnSRsEqcGom2QQETszXm/tJgEK8hdsSSsuj7L95pzoRlqwnx+x
	/Ca2COemg09pHpNAYCVwXLyAO0aaJxvVU0PmGQYlOulBm0bWxg4qdYklHGr8IJYZ
	gHfiSQ9kgCR48owasRYV9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=nTki03+
	UZl4gqycijB+8IvHThLFtDt3d8yvUXUI72Io=; b=q2ge5zX0a9P9srRabtoHJBF
	x+8SMvsVfpKb/ILQzxitwT6mC2BuPzVeES57e8HHNv/EXWu7oS5gCmHuJp789Yyt
	pwpCufSMIc8M20ePnmGlJmEtQgNJ9YsNkWPN9kmDB4m8Yn5UchiUJVJMKFxIHKGa
	rbt2JEN6zWoptz7tRxQjEQbPRDyGHgGGyYre3G7D+AtMI1E1VbRMrfyA+A0FF59x
	e1ezCRQ91ifH/6uX2KgH1AvAbU5OTpXUMFgA0iWmE3MkYfF2CNWURr2qUqswqRrS
	P6K3Tgqojlp+R77pbCaPaQMtamPBgEkVV1LFsZnYt/dxyUEGmwyJQe6g2QiatOA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmN3xqmAt9qreOmN4xphDU
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 09/28] x86/hvm: fix hvm_emulate_one_vm_event() definition
Date: Wed,  4 Nov 2026 17:33:26 -0800
Message-ID: <20261105013347.719392-10-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026956:EE_|SJ0PR16MB4798:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e9c5f47-cc0c-4651-adb9-08df3adcf1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|261102123227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	emQWucfHkP0nRzdC497p35+LDdUipX5hLMCpcdFzw+84n/ioKmtSdoCbT6Vy0dfgKW7uis3XUUKs2SuSBrNeH6fCM7awYBSgPR58HmSCcbxfKTOpbfaHzXtdZvD95/vqHJjCujggBubhIGQcXZxYcwihTDdrZrPfPgG6aM3Pam6Yg5pHH3Td+LMGRaOSQ9G4ISe4+ExnYM/tsyFbs4ZRc/n4aBfbz2Jqd0oR8HZ4mp21ojWq++Sg0aVoJSZivfmAJM6Uo+vo+Xe/dTY02UkKNl9aO5xJVcGWe3fOcKMsQEbvjlgo/rxxmE4rIDBU+kFH/gmqxNtmZwjc51eqwxkdNC0EsU4YD9vvYYYBYooUUqGcP+0+ZOgHCO5uGNNIm9tphpZ2gUhOMZcB84Q70i8/xnGnD76blbObmNDOrCttAWrYm75s4j7HJoPhpOxNvf/jAgoUFmkP9wk5FWOjKCGXM5y2hh86FCBOiUhceRVrq/VUrzDwHran97Gp6r1LKmG44qG7mFo4aZoiMgwL+ALD6CH8riGo7dKDLA5df9RtB5DjE7QRUigdCZRjApCNGviydVUtAj1opt0mP5X8V3KIzcUGFP8AHSUdjFkzG3S9P13tHF50mqq8I6Tm7FMEs2f7VwoNWCuFxbGTy5czDMisS+7GgfCEc2R5NSkvx9mgHj44niPSiSqIs2ozleIu3Xfx3dmQzhVPFQ+6Aq+EEse1YA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	muub5RWd1h/gWhJGcy8srySSPGlWQti3Xhu24XhL8dIpV6ALBfy7HFDNHTiuFdAwg2gAoQ2TY//XgANE7zrFkm6Nt8zTnsCftHl43PC5W2vjmQwmko0Hcm3G05ELazzCRk644roql+4ngt9Pb+HIKyTW1DVespXZk/H7dxqOmpqsmn/lvLIQ+GJTrZGDUux+pLdDtavx+RxIhSaTIiUxQ7WOWEKD4EXa/e9IO+kwXSjsmbJ19tnY1NAVZ90bJptfEixxw0ntPrilho1+4PaqJJP1s+dObpRcIhogj4K4pJIYaxqCXnR3tikh6gODknIrbpbqR9sRL3p2LNzgyt16OxpXJYGTo2NINtpNYvjx1BOrWjJG0VRAHcbwtRK8RW1lFXCYAh0iYdEqheE/TrPV1wvOSnQkbKOTHECK69qUbtBghqeGrzU0wDvz/TkTLJ5b
X-Exchange-RoutingPolicyChecked:
	ukXh7pShRVhYnZ7XOk0Z/uYn6UogwDY0NrNQ3eeCG3ynuvhy033pVGFToqsGN2GAghrm7ogIbrJezsrriqiFo1IXzsfPwsrQtNV2usId8twTY8U1/UguKpQOQcgyovOUDYGcCf0azxyzneHO2OR4QL2bjcU3xmWytiPvcSki78J9SJGj7LEIA3vyM5a291135W9ujKWVZYVykmvgHJf5ViOPvjH9LFsIcm1JC53dr/ucZEbIy68FWMBt2wv4jR+TPbHlXdxVMX22pxpKJsJ3iYPA5L/i/OI7sk1xtgaaNqKsT5Wvvr1qNFO7tAA29IGMs6J5XFTu2a/CQI3Zy1fbxg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pPddtdl4daxUFEDp70k3/ECnpR6s6CfdkT+Oj5qoNQPoj2NnF5vE8AmiSMR7PzdoMEgZPgevb/1unSxI5qOFlFbhGZ9ZJu8QTF1ynWZnzvc18TirPwEExr6STwvQh2M50S75m7eFnNdEzts/BR/NMMNmojDqkT3b0M9bu4GfZLcgY2vxWT8zeU+zVyPE91VIHpR3V03A9ueFWROolu/dRRZu0fwv2o58XcHMD8iZC6C6aGZXqwyViDpbE0A003ZL1gWozK/5DBdVb0pOvf4NcCImMNPsf82CnPwFeve698g+oavwOx+YPCYvHKE2vEnQ7aqeI+uV7yriIsl7Sybp4vl5YrH1Tpq6Q01AiS+MvlOgt14SXa5M+Y4/5v4I9DiYq8JW2GSmnS4t5784Mj70EknyebFhN0FmzQZRD38ATiz683NMkksL7nZ4knIZ/u9xQFfNk4YBH8kNccpW8+fn5KrpELONKr+o/t9ttmGJx6LTKxoZJAMVTtDQzO4kpWBiz2H/RtdB6azdWE/XolsqhofXVi8D9UOQUhhQLrOcKlWka4XWLjeRjGMCLc31sUFcZpL+vsCT50PTfSCzv71S5dMIdc8idxp5CSSDlQ29CE4YEQGTsCFdJ9Lk6G19Jfg9jQYGN8uMMILpHcKGoibmgg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:32.8910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9c5f47-cc0c-4651-adb9-08df3adcf1b0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026956.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4798
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX/QUi8FzXpBYI
 2j8v29mMf6TkbYSZE3l/XnarvvXpTFbXlJNpBNQppwf8IW8SOaWkSSgw8oYH6917kzeTF9SUwTp
 tddbIBstSu9tfbnpQMKvnPPPM4EOXr28OhNi4sarExrgLG5xeX6E
X-Proofpoint-GUID: CEQAcarf_A8mZH3YuZsAi2MZy8Ysrz6C
X-Authority-Analysis: v=2.4 cv=XuBvqlF9 c=1 sm=1 tr=0 ts=6aebdd2d cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=Nk3K2K5yrmZsCe4kseQA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX8avMRQ36qxif
 OH3K7yQUN1iquLLHwelg+C9yQPGjcTRG+4bDoLMrto2kW1h/q/7iJHLcu9ogmhdlhvMot09IcNy
 vD+gaRnheVA/nRuQV2l0iMcWUlzTrQJfIB8xdm0u8SvkZTfHFqP3SAQxZkpRkPWuN7CnU8Xk0DH
 yx3ZHAGTmDT+0uU+R4LPTNRjfCA6UW0daf+VgI1p0GiPgAP/Ue/EFPJL4EPA6IarJCpFDums0hv
 hbIhHiKaPfOCk9Dp07uFOS489FqJ98XD64wXY8GOrhBUwpmo7yC/6837MU4sctV8bZy7bE23Ol5
 IpUUh6tKlQyBgVd5n8EA4GKEOWmMo4Gn7HCCQpL8prjRtgQhBEP6K3o76Xj8KltrYK6nPhOdojC
 +EknkyFst3ugcKHjxCjDEwxWOYiSJMmLALKNtixAFNdankeMp4n8Xm0BWrOEven/Ip0VjCuXZsv
 RTUC2R2Q+G1YcMe/2nw==
X-Proofpoint-ORIG-GUID: CEQAcarf_A8mZH3YuZsAi2MZy8Ysrz6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-720697/1793842478-F3CBA2AC-46FD2151/0/0
X-purgate-type: clean
X-purgate-size: 760
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add empty definition for !CONFIG_VM_EVENT case.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/emulate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index cd2831d34b44..c441cf278614 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2925,6 +2925,11 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
 
     hvm_emulate_writeback(&ctx);
 }
+#else
+void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
+                              unsigned int errcode)
+{
+}
 #endif /* CONFIG_VM_EVENT */
 
 void hvm_emulate_init_once(
-- 
2.55.0


