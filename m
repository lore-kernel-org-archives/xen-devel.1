Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A906606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=gSW/17vN;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=jY7V0/gP;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=V3CCesya;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=unG+b2wD
Received: from list by lists.xenproject.org with outflank-mailman.1473165.1680766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmMx-0003fg-8d; Thu, 05 Nov 2026 01:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473165.1680766; Thu, 05 Nov 2026 01:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmMx-0003fZ-5g; Thu, 05 Nov 2026 01:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1473165;
 Thu, 05 Nov 2026 01:34:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmMv-0003Sl-7t
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmMu-00E0LG-Kq
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:20 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd05-8faa-0a2a0a5109dd-0a2a4504aa82-14
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:20 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd1b-b57f-0a2a45040019-94a38ff14b48-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:20 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mb3I2611371
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:19 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012058.outbound.protection.outlook.com
 [40.93.195.58])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdw8rv8q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:18 +0000 (GMT)
Received: from BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::12)
 by PH7PR16MB6193.namprd16.prod.outlook.com (2603:10b6:510:314::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:16 +0000
Received: from MN7PEPF0000014D.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::1a) by BL1P221CA0001.outlook.office365.com
 (2603:10b6:208:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:16 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN7PEPF0000014D.mail.protection.outlook.com (10.167.254.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:15 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50o3jt3232408
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:14 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnp8d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:14 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmMlx17S0gTjoOmMmxgaMx; Thu, 05 Nov 2026 01:34:14 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=eM5
	Yf9oLT5mBcx2NrH7BE/p18L2T/go/cV8xvH+52Uo=; b=gSW/17vNOV4qWvMBmwD
	4XWr33SUM8YfBpn00Lwjwm0+4oGRJFqw7frwpuFsiQ3wclXV6a7N5NBPtUoU1m3V
	tpQmLxFLlZ0fKotX0PNYfKcDcxfDfjuXCDiABjxwqcLHxOsuxoGari6XOS7wI0X8
	FtaCyxwim1b38TsHKShFIVcZTADce9pH0xZUJ50KSd4JdLThJoJX6317Lj1RKu2H
	rRHaUVC/s3hWDTD4HLfd2AS/Awv3I17M1vBSsZb5zuqTbeh+Z4b4icL07YbVEzN7
	GlwcsXeFQvW7BDtsN2RXEtgMoQewBOEioDlsKqMY7WTvVgu5Bn35N5EUq6oulla4
	96A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAddVjx/8AWEaaRmQuZ442ob8dW3Euy5pY/pZ5YJ85xxyWjUqVGaoGhvKzjfR348ohIOVYpQF3O4Bl1wcA8gjfqgUzDxjE9GrPTJ1pXBgRIUxD2PkmjhdzQ1VRCj7SXclDw6/nUqK8fcAloSRQ9lLlCmwvmjWPWCsXNCl0Ld2g2zdYxhhEpplDKfT4Jpa/WE1UounkQEXfcgF4VZXsTREOvVHaI2GgQNB7kINpjEkmKNQKg4cLIMmgxMBmx8DyZz6X89jwcBDVN3MXaGQzg4J85k6Eo+yVRfapd/gOnGmkF0bDMlvPzNXP60FqNQT/GyI5Zld++VfbaHFwyeZ6PjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM5Yf9oLT5mBcx2NrH7BE/p18L2T/go/cV8xvH+52Uo=;
 b=dtXEjWGPrTiJ5AWhMha67blLWKQ7owtWh2w9BhMvt1xe9G0TcL2E8UV8b3Ln+ryXI5nLo+QeYEvcC4rS9icnLyAfdE6SmGL3iqdfN8TKdxeizaEG3PpGZF/nktTJGjuJAGw7K+lpyhgxSgKI7Ww2P3yZT8XcMzVJSLG0VmTjb4uRVdgREBR3gSppGNcrxjqo/KgtQfZuuEdf7RtZStR67/8MPBkgpGOsu7EuQwLRbaoQjt8+N0SeJMgnyVMFJlOWNLTiT6PEom94K2pugwJtKpe+kBn8y3m0EBYIIwN0hqr0tgTljIslTHBlZAJTvpf1ShZ2kg5y/cMtvpRAvPlnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM5Yf9oLT5mBcx2NrH7BE/p18L2T/go/cV8xvH+52Uo=;
 b=jY7V0/gP8SawPX3LT7pB6tE4UHJVAguU2vjwrlQM/Q+9PsqckvtDp2cCDNC/0wQU27a1+maaYV5hqbFbc/bWawHRsUHk1kQrGnedAMdtESifM65Ueu81eMew2oUJir0Xk6eh4uiDAKnWOodALV9/KatDMXv7xMa00zqYhSUE7t8=
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
	ppserprodsaar; bh=eM5Yf9oLT5mBcx2NrH7BE/p18L2T/go/cV8xvH+52Uo=; b=
	V3CCesyaIilPMMH6+1wyQl0JFE1RHS0yYIWVtc2dETsfnM86QrEa2KnwnrqC3awU
	y259x1aGOFPKsrigAWzehJKoRIBzN+Y6PRmgrgr93SGAomT+BEbWNAApzXT9gYVE
	vVo6As+MrX5lRvR7jXTq1cGvFpZ9VNr8lhK3CHZSSVOh6pNKDgmx3bfcZKEP7+4f
	YtnggN0iONyi7JyZt8EM5tAKXXL3UIXqPbp5e+qETg2sAGmh/AblZa0d1j6VoTEH
	oJpDYF9+em8HR2zMUak5LaEYA4xRqR0dKhh/uNyNgl8W7IHQSAlMXJ66ForWCi8/
	UiLwvIbeJfmab3QnBRZxfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=eM5Yf9o
	LT5mBcx2NrH7BE/p18L2T/go/cV8xvH+52Uo=; b=unG+b2wDYqKzZRsjjty4P8R
	o4NHm7SVVnJV5UdauWi5FD87n/rTqwWIzIJvn2x92iLGq20nZODkMSlUlflLWV40
	t08sW/MrGlAnbRrSQXf8f9LzZtmsRWx8DcIt0KbEmWsEziDzQOEdcxQ9ZTx74U34
	jS6ct0tv61QbCfKtnkyRjd7UrvpP64ZS6bQTkGAeeTCpSkzFbsjrp9NTiH1ZEmPw
	UjgloJzanyYY6pGGFxn3vSg7byHP3+oV6L1NLrvuexzDmF98ml/Z1SveLh74PW7A
	gSdvwayRYNM3+2uFWyAmK+ehdllK0droEREwpHaDmHURRbX3Jto9Sv0c5tv8y6A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMlx17S0gTjoOmMmxgaMx
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 02/28] x86/hvm: report SVM AVIC support
Date: Wed,  4 Nov 2026 17:33:19 -0800
Message-ID: <20261105013347.719392-3-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014D:EE_|PH7PR16MB6193:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 35e5080c-94d8-4d1c-960b-08df3adce758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	brWZaokiCh3ct7nvVKDIs6r+9ik8oZBigS+5JAhQ/IxWGhJ8pj01JtTRGo5iNQbbzh+neJKbkGzA60SvHN5TgmxvM+lPk6hJ494sZBGhcMLCVxOnM+yyeKxnyoMCeTrEx7T9d9WrMYWwpmhgei4EsLrQtLStTzdJWsNHWX2pyUnL/3HOXY/15TQnjBp3OLLPZlxrjobM80qoQ3zDbb27kg619h0komQhIWQ+jggt5Nyn/dXLMVyHP4zoIvHu9eLQ58sywm+RBrUz9NTU6l50kbOJKxrzPCoxrrpiGKs0Ra1lZEItomyuNrQbkA54Hb1Afq54/pRLQwksZMfR/a0w5kdxy/b0uAzUOZblrggesNQZfPL7kdPkEDIFGiDdGHR5lG8V0DtLB3n8OVC8AjRc08utybdDUmruTVuBMsiV5p5x1+ynJFQCJgwwsfMdp4AhJopvZcPWT2JQwDlbz8pveSCMSJfOFsRKVUw95siE1YQtVvDqgJAHQiHBEy5pnDgY0WJ7sWyzgI+MAqupgjsXoIYKA+RiiSfWqcJ6O0RM2mSBl02ds2l96S80sR+li0eetp56iWJehiGZAi9y0WN33LcjblWtX8j83eP3SuMS8O05TEgmC6SCC9xvvg2YMuo1ZqoIi8FrRitx7XABuaaZe3KacMr4qcIDjTTG6BAgLIogWNRWPq96gjp0dj3MAUeGinoodg82pq/Xd2mQOwLyOQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8JRb86P/lOja4cTbi07ZLyMBW9BqPB5CzIPaZdgzaWHx3PIknBPfmg2OZ5he03kQfvNmLOMmbRoFWXuo+5a/uG70EqNigIWPdRcavpT1EVhvFxKOFDJd1YSM2sa2yjMPAMlvnm4HWvZb2ZAomVgiacFuyyX1USjPRNh4ychg6X/xa9BQqpJDOwcthsgO1biFykodaPGTFpEGf5noReloGugmesedLpyacazhtqQTWw+WaiV2ZzfJUEA3FHxoRlmKKYOp70XPvVClA2oYF7wB24k+LlZ8zJaejreB/+FaIepGnZykMCP/7VocP7+90A3MfX5afIOqOXOs3znE+e/qODtwDfGG/2c/bTlA/qWjTbmGd1TFTkeAMoxp0MQbjJ4ICpXtG/HUrwv0+Mvjyry+F3jtIWCSxYzxdC60kZg85+SZW8nv3E6wKA9NdpgeTWiF
X-Exchange-RoutingPolicyChecked:
	4j56ei9FZ05oDRHcqFmFz+bpoTE6PHCT3URHKvLr91SXYyfH864KcVloCcDQ/KI13fsBE7qSUZNr6lAKVr5R11Rwoa0t4LJrq1woqdzPDReo8+2A7IEz9N5zlDKsL4BaCrLRaXSgq1Zi9Rikdu+7srk43d0PaXcPNmzHpQJIFwEow4pgCYCUDD3+UrDc1Q+jTmtQzWVIVKotjUwpC1b6pGCfeZ3hmu6bKPnULtnh4nH7zA1F8Cb7rXLigpPeVdVGur0X+79DIBODPGrdXk6T8J2idx5pa0GcaA8NQiDn43Ak8br8NvMLzbXh9DS2nF/Uz1j6x6G2WlfSGs47qxSylA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uA3W9GugIUxqeDZS78xu60TbRTbcm6EMyvnDGoAAOlUZ5Vm/d7HYai6pN8hE4yK0Zq+AKyekM6GfeUR/vhNKNwTY1k7mxagoMfvPgcCoah0EcI0o4QNqcw11wMBxXVKPvnAvVQiNSHYfF5kTIZ/SzNL5c8VcX8V6c+62SBCgQb2fbzt7Y4vpzUR4zTjVlZssZmpXkOA8L6JxnM02eATkBhB2r5u6TBHsaIw0spwezxUXYH2t2w8Nrka0UZuvurZfHBwIJu+mR37SGck325tFjvrHBTB4crcZTocQhaLxLsoI/kWIzIjP/Y4WtiCFMycXt53DaOm/f2mXz3ZsJl03Tq9y7dA/iiOsdd9z5ulMtiRIi+aC4X+4ei2E/0QiC8AQCUWLII67JrTKhhD7Up/rtb/hDEs9tL2rmcTq8jrzYLzJ99hBrKHriDS3LfiWD+zhQNAHJJJxWE8UN69AZcwCJaoj7X8ufsrAWOyrpthMlDTmYQsyV8+YlWwotjKwp4mWN/kOX4qnj8/SGL5hcUlESwhDeRKyDtqADtu6R5yKGmIehnzpbucla5vDN130G1z0JSHKvT2VVhvLmW9bDniifHQKqgKIrmnn1MV2Q2ZxDmLSSna5GIx5urPsICyB+Wgb1+vlOrKcLmiShiAWqlMGiw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:15.5316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e5080c-94d8-4d1c-960b-08df3adce758
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB6193
X-Authority-Analysis: v=2.4 cv=JPiuIMKb c=1 sm=1 tr=0 ts=6aebdd1a cx=c_pps
 a=3V5Erj4uy8rJXAE3nhxHpg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=3FUhnyOFzl1vmK9vYlIA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyXc3Fzf72iF8
 KyrHygb/Vvoqou2InRS0XeLRA8CjA3/43MJKJShwiod50fP5sR1mhjGWYGzOjTmHavIQ0wtqi43
 X/5nxeiWGkLJeMKb7B/yHxl8cNc+wRMW5GSBrkdp5ggsmp5mF6Y+
X-Proofpoint-ORIG-GUID: fPKHFTn7iX0wA9K2cdVTY04dH8P-d8t9
X-Proofpoint-GUID: fPKHFTn7iX0wA9K2cdVTY04dH8P-d8t9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX0lZXaO7skBdn
 pukfY2nclUHGKgB9AozBdzkzs7abrttsPXc8B3LCMYYLInOweKBKCY/cRRAEZTDXirrH64/RKD0
 qLeRjz18SCkdWOal1cvSbQ7aBv0XNuHBzB+99UJQOGR0G5DF/O2osn8dU9UtQvJa2t+zNFMh4VS
 o57B58V2Ewn/9Uufv7IBjRyqhxuC7aRCgKbGuI//6qVoNIJ/jLZHTAhsIFkxn+uO5P09zOn4vDC
 Inj7N1HR1rg0OOqjIfMaCxHA2KP11vx2LKEhv1XMMfhHNX0cgZcn6OAIJ2kmeRlsXPUFF+Y8j7A
 hYxrLbxG8M6fmcr4YM2DO2SYEHo9YD+0+yD18yTd4xexXY0NyCs8it9f4NltcLQe5kSrBp+7fqH
 D0V0BSwauMYKekxk0lWMJYh2S8b1i+BKbCzV5Tm4Gq8RlQyWaIhmKmcuoTgQ100uo581IPQQOQC
 0mDzg8CvKIIVJzZ4v3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-ebf023/1793842460-C12DCB50-40B851EC/0/0
X-purgate-type: clean
X-purgate-size: 2164
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Report SVM AVIC support from CPUID Fn8000000A_EDX[AVIC](bit 13).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/svm.c         | 1 +
 xen/arch/x86/include/asm/hvm/svm.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e11d5c55248d..cf008a8acdf2 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2456,6 +2456,7 @@ static void __init print_svm_features(void)
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
     P(cpu_has_svm_vnmi, "Virtual NMI");
     P(cpu_has_svm_bus_lock, "Bus Lock Filter");
+    P(cpu_has_svm_avic, "Advanced Virtual Interrupt Controller");
 #undef P
 
     if ( !printed )
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index a35a61273baa..0fc33f41b09d 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -33,6 +33,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_DECODEASSISTS  7 /* Decode assists support */
 #define SVM_FEATURE_PAUSEFILTER   10 /* Pause intercept filter support */
 #define SVM_FEATURE_PAUSETHRESH   12 /* Pause intercept filter support */
+#define SVM_FEATURE_AVIC          13 /* Advanced Virtual Interrupt Controller */
 #define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
@@ -55,6 +56,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_pause_filter  cpu_has_svm_feature(SVM_FEATURE_PAUSEFILTER)
 #define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRESH)
 #define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
+#define cpu_has_svm_avic      cpu_has_svm_feature(SVM_FEATURE_AVIC)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
-- 
2.55.0


