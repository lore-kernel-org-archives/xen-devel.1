Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800A606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=AMydzGN9;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Oz8jcaRV;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=NzJcubw+;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=uj9H7Fqc
Received: from list by lists.xenproject.org with outflank-mailman.1473379.1681009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPm-0000Lf-Qh; Thu, 05 Nov 2026 01:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473379.1681009; Thu, 05 Nov 2026 01:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPm-0000LK-NI; Thu, 05 Nov 2026 01:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1473379;
 Thu, 05 Nov 2026 01:37:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmPl-0000JG-An
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmPk-000xTH-Nj
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:16 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddb9-bab6-0a2a0a5309dd-0a2a450be758-20
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:16 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddcb-b7e8-0a2a450b0019-94a38ff1d6f0-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:16 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mqJP890958
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:15 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hr99fkxjk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:14 +0000 (GMT)
Received: from CH2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:610:5b::24)
 by SA2PR16MB4202.namprd16.prod.outlook.com (2603:10b6:806:142::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:11 +0000
Received: from CH1PEPF0005BD5C.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::a5) by CH2PR07CA0050.outlook.office365.com
 (2603:10b6:610:5b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:11 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH1PEPF0005BD5C.mail.protection.outlook.com (10.167.244.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:11 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mVmb3091702
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:10 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhk2-6
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:10 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmPdxuiyDz55iOmPdxXLOt; Thu, 05 Nov 2026 01:37:10 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Gi0
	GkP+/xd+rHATXYw/FTHcTO00/b0m8RhZLAHJ7HuU=; b=AMydzGN9DEN3bt8ozZB
	aMiAKSw2UZC890tH1v3oLtGXTPr50FVFSlQ3Pr12OpS0k7+xvnhaX0yCedmlOQRl
	z5/iCeYCXy44kTtJt/C3hJgJAHZhO841YDA8BXtGPZGD7hgVrCG5JjRVjvE8hshH
	Hia2nzfcDt+NUP0OPedFPG2ki5IoyEWlRAtV+5MemZc6/qyE8e1fqsEQLaK/pFst
	B4GpKchkKO7IlwAhU0B4UxS/A2bM27czsfzHgaFUcWzBi3GaRjH+Uncj3T5ffzuV
	n2MMPX8l1LZ39svGHLTqFU775uElZAvsBfzlOuraPrS4Bb/k+y9+Um8bwAfQD7XJ
	CVg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSoAtRsq4UKXgrX7stvoIr/JQOXjfe+PfHQqTgVvt1PQjzT44oY4a9/xaJWB5RkTAu1IzML4UyZKi3aRQq1L+SOuqSQTpCx8fFD2AyzuHAHPVBvThylQq/DocRcBAJoWMITo+lM59iZJFo/1H897U/fMfx+OSFavn0//mebwSvSqB0diWIqRAFgZmiFwBCt11f9NSP/QQdNb5dRJrHzfYCFg06jMUGnrwQ32mziK0DexV92+OAl9to2/c9bat8D0sHpXcJZhTSwNdXDYHLHzRvDxBAqSS+d/hUAWPyMxqy3FsCb0FaubLHhueLiCIa9cH6ye3F6OQom5K0oQoVwDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi0GkP+/xd+rHATXYw/FTHcTO00/b0m8RhZLAHJ7HuU=;
 b=Pxi2JwqJxxfwSwkEkC6I9IlBC+urYMlANBqmwNpJ1yDH0iPMXNZdMtljJ9yrJb4igY8eyREAUKUwJpIMr0/FMnFTq8/FTnuVRAzhtHEJULNxzvoWvSSwTnzmVKc9OJ5b7Q7bfKl0uwB59MsojuvByneoLhvQnxtRSfB/vPGM34mT6v9ZpcELWus9liEvowpOFR0EpNGjQr55C1CPVAw+IRTB3KVJ1F0UT4ymzmXSxlllhw1QYQp9CQf/mjDdC0/Ki46jVtgs8CcZ6+EcJ3GBslUdIIeYNUd4f+GZMaCdtIYsPD0/nK4Zoez3LoxV7/9O6/bw8FPx/A2WTjlm2aHf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi0GkP+/xd+rHATXYw/FTHcTO00/b0m8RhZLAHJ7HuU=;
 b=Oz8jcaRVxj4nxTZHGvyZ980N1XW5zG88i4vKs/dbtkesTXwx6tywZQp+X5VL7PHAhBHoGEms+CdcAV2bWvpKlysFtRSrQJU7SpeMe1qYl7bbQVppcZPNau9Z5uCzFjMkas2bnEXS+COqRh0SCnKVkG6NTYu86flizFct8h6shdY=
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
	ppserprodsaar; bh=Gi0GkP+/xd+rHATXYw/FTHcTO00/b0m8RhZLAHJ7HuU=; b=
	NzJcubw+UR9tWQy8fmGYNOYFwzuaX8uyy+bfrqTd7cWozeAEb1H+0hHkYsHoaC2o
	tm0V2T8GBpUDcJDlbXH65fSUgWSGLnqliTJ4IpymuR3wMAXHFPYmqER2afejltEF
	OBw4UQWSCv4/R8rSxK70NWbjlFlOJ000umBIoIAopx/bhnI3ldn24vXvyIGtu1Yv
	jdSOx+zWpHyJKTWfYwbGRPU5pAvbfGELuODaEQ8nzu8o2rSH300wyfIlKvTE2iBJ
	m/1eZAMVuI6pibRwBcsCfud8tj1z1M4iX43Sqd2o5Wy3z5MD5LG67c8kP9xQ5TbI
	31FP9KGN+IsPU+WCdwaNwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Gi0GkP+
	/xd+rHATXYw/FTHcTO00/b0m8RhZLAHJ7HuU=; b=uj9H7FqcHkOBP8CUTpTwNCc
	Y4GbDe+ufuNYvEb5TizjNf0IGNMIyI9aJ8C++tXy1wdG/bP9V6p4QF/dn57NXVhn
	y1reEF5dvJKkAqD8GpRCiw9g2JQIgv9qqzVTeAq9712B9gZxxFtkdy9959LnVro/
	1QoyHeicf5uOQv5tKUclbX1bsWX6W5FvshemgB1znn1AlNbFwuy24/MTCKmvJOsc
	k6KD/1LtgOXPO7eMbCORGJsvAyOyRlL/hJMV8kcpV/dOnybBlLFuMiCIB0BRyG2l
	fnB6G2ImLRcmhBkcJFQMGft2oNmROaz3CCWObskTBKVuwYnvNkGu2UgHkoNpdhw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPdxuiyDz55iOmPdxXLOt
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 02/13] CI: unify hypervisor console parametrization
Date: Wed,  4 Nov 2026 17:36:50 -0800
Message-ID: <20261105013701.719658-3-dmukhin@ford.com>
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
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5C:EE_|SA2PR16MB4202:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ef6ffcc-5e6e-4c2f-a8ad-08df3add4ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006|261022115727099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261022075727099003|261026121527099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	FtqaJtWc9cBXvoYSwVB2lkD6qG0p0g2R3A4w21IPZ+avPbwtMHkR5bcvc4XxXlP3vkFXDutfb2RdO9Nlsbt5RvYLiUrDEbYUy4IFKKlz84TSkCbP1d3cw2qp7BzXssaiWn7pu/tt/Q7fiXS9QMCAB1GhAhLPjOgayVSSV2UDUcXIfFAJ2SYs0uQ1N+R/wHNYLGt4bc1tE8rgYn35uCTvPjfmK1IVL1QWYmCzRjUDCQ7wblTpokyb9mIFRH3F/7gHE+sQt6JIo1IcypAJQQFaNaip2dNt+TIIDIfXtGUKM9rmNi4ch5K/5gprHHyZrfM1I83ouwtTDCTHUUUJv/HGydjmc+dA5w/vAXNbUCVhq70OvoQ1SQKByJgMTm5ppol/NM5UhgV2QOLD22nE+EWvHHBEswMYvNZ3w4gVYKnO0PM892OTMRaGd51gs7LnigZECtB5ETHTB961mCxeduEAHK8vbip8qaRi9tCldU1cfRxIS6I51XOtfmuhtJnnUo80F2RX1+v1pk+A6QSrWsqvnuxlU+OdAedwn2mGU+k1f7KfG1kp5cSP57z3/zOd1uCHxylsKBt+wvL5FjIjH+TpaTV+hHDUUMnt7tHoEjmamy4YVinWWRIgxB4Xm7uye2Sa4wWnFZk+y9kKd755xaz/2GsLtmrB0/5Po16UD0rOcJSIRwSigIhlMUundeiITTQvwqKVhe5XwmHhGEALHg0/yw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006)(261022115727099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022075727099003)(261026121527099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hzgsExPivAPpQHkuMWOMMplFERa/HUSFBPBQ6ScZ7Rm10xWzM9aq8YTqVngtkjaQWfbe8Hg9CluEG+rUv6YyspFdr4grZvThN4Kbrfh7cB7bs6F7HhTHk1DlM0mZWddRKs/b5joZ2XKnTLnQdW6SB+mCdAm5xGpwdeD83o6gaF6Y2yMqXLlV/Gx/0Y3HiEyfqpH01kKPwmPx6UfdXzcLYk1DBr9JbUgpAOqXZs5z6DlQ6GDAhxuxVEHQCSsgw7yg9OclG7+Wi5es//9A+Pcy6DFy+gwAfnk+5AqTieLaS4ELlKC7CE/05/pCRXHyWhcsP9kQ8HgIpgXre/lDF96c1GEDwEEjwZpBexzPM5LvNnSrvAqWFzk3qfpfzWmnPlcbfc7r6YMX4Jqn4LYJ6IG19510Q7d3CcrR1xzK/WjfCpVOowLGdiuftVYnI4u8Q4Th
X-Exchange-RoutingPolicyChecked:
	11uWfrnGp9XJCtzFNbXaKcc8Vt20vE4ZaeiKBWdYGdOV/iwwVJJglC5ydJZYN8WT+uy6NIH4aknqwQR4fJX/9NTtQimN0WEitxhEuODxmWsnMcHU/1baLyDpX51fM5G6zAud28L023M6iyJNvk8Q9HyE5uQUmHGVaKWP3pSzKwEXTZRRWUqx2LbHSrjAVxcJvKOeFwv8Zt3SBOOvSBafvU9Tg+649KThEEgxIE7tA7oL+r2D+CxSNf2undQwfYnqd2BgaC2abezVqq05FOKWzr6WbgxB+z2Wi2EaLLtWdjS9KawOX2lvz52lFN/IX3sJNSs/vzrYQtsKCoaxybjA4Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BQOGhLT1G7XhYirHiVSDLtOBpnIn89vce07ADTFTEQWabf7+dYVFpcIrA9fAL12jKnVgvmPNe8m72/XUNcytVDIQRiQmaHJDrVxdJk+v34XEE/i92a4p+/LPDoSSJARCUlV+PRiViklAClXq7ofvsutyNT7z0ngzDDotl3s98us8A5AxYAu7+cEmKt4pzKRerT1zyaMxbN6j4r5h9GW6PIPQHQUNlGZTGCIjmzDDZOFLwIpnwjiJe/LahPY4Q1zU3YmdRt4DJZBCCBjYX1/XLfJwxnFqvwTpCjcl1sF7V6wEKvz5X6oYV2cHUtwn0+pIe3U4HDFGh1p2tTTETMgqyyxXFdvAZvK9DBoE/xxxcxTgv4CWz5LyblAua77UFAUiakDt38jxvs9fFw40jQW+0uh67KkGu8O8qHgkAwgd0X4QkTc/7kChV3mDxV7mD+MOEaSaq49Ktvj4luImeNJvrl7Z4F7FaqYPDvImK2CGQ0B+FY87qRZXbHqExinlfvDCl6eYaLlHw3QSevkkcfJwAIoSNWkBeFJRrasSWYiMtlXqBuhwWsrqYlhedT4O+JN5rI0JHXTsSBTqx+SuBzmfuFx78kgpN0m/CXdTOl70/O9j6gWtXVMJ0mwet7U5MqLBxSCZ4skKZy3lV24c69mgvg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:11.2826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef6ffcc-5e6e-4c2f-a8ad-08df3add4ffc
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0005BD5C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4202
X-Proofpoint-GUID: hOsGKOxnJOwnWcDQWmDq0s4wgAYVPEm6
X-Proofpoint-ORIG-GUID: hOsGKOxnJOwnWcDQWmDq0s4wgAYVPEm6
X-Authority-Analysis: v=2.4 cv=LcKpeTfi c=1 sm=1 tr=0 ts=6aebddca cx=c_pps
 a=U7vFK3P1qsHFYF4fogjkkw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=RNNgTiXw3qIT2INU9RwA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX6CWJ0nbHlk8p
 1GsofrzkXmpMdOox7wfKGnPck9CRnFN0ODea5PCwxUgoBkrEOiQHE12mDOQiCXnJp2TsQgXFHVA
 S2dE12FG8Ofexw6FrnBZGoqNDUhrsQbBJhQfbejYSi5uaqK+7+264aaDsE3ljojj2A3MMBMWEPy
 +MoNMbus9uwmEI8lvZGF0OBj7dEkXfY5aor9BgPGiTD1LQFXRD+kNOrcFrOE9GLMzAroriWA35O
 dlF0h/vF9oIBcgc/uHmi5pG8E3SwjN2w9tSNWaOLCkthvqGi1Y+0GXYunuTU/A1VI8hFNBNObUG
 +8HeSBSPCmKsKZ2/2wg62f05ofXQNffJhTFIFWQ6lvo/7KLMeoxBg7WJo4wRmQr5eAvGwFQfLdt
 ZwZdAY7yFGvLhm2Z88C2vNYQoJHfb1EWp7iJ4Jz68atglzNpw6CkNHxg5QGYdPQcYevFSYktkVB
 whvzAjZ2qTwW3RLxaXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX1ETofrUPTd1b
 bh/A4qDeFM4T0xH6jMxHZskazS+jdO2pszMs6RO0UnuVqTtKm/RK/sIAJztWE9wGyPIBCGLt0l8
 p7vtpybfWRtdrSt9HXYoaXtEAKa1O2KbwNN9l85VPmpchICcE121
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-42698a/1793842636-1A2C49EA-E1861193/0/0
X-purgate-type: clean
X-purgate-size: 4330
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

gitlab CI configuration uses different environment variables for
passing Xen console arguments to the test jobs.

Switch all tests uniformly to 'XEN_CONSOLE=' environment variable.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml                 | 12 ++++++------
 automation/scripts/qubes-x86_64.sh             |  4 ++--
 automation/scripts/xilinx-smoke-dom0-x86_64.sh |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 96127995d7be..f984c34a922e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -121,7 +121,7 @@
   variables:
     CONTAINER: ubuntu:xilinx-hw-runner
     LOGFILE: xilinx-smoke-x86_64.log
-    XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2F8,4"
+    XEN_CONSOLE: "console=com2 com2=57600,8n1,0x2F8,4"
     TEST_BOARD: "crater"
     TEST_TIMEOUT_OVERRIDE: 1000
   artifacts:
@@ -144,7 +144,7 @@
     LOGFILE: smoke-test.log
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
-    CONSOLE_OPTS: "console=com1 com1=115200,8n1"
+    XEN_CONSOLE: "console=com1 com1=115200,8n1"
     SUT_ADDR: test-2.testnet
   artifacts:
     paths:
@@ -165,7 +165,7 @@
   variables:
     PCIDEV: "00:1f.6"
     PCIDEV_INTR: "MSI"
-    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,0"
+    XEN_CONSOLE: "console=com1 com1=115200,8n1,pci,0"
     SUT_ADDR: test-3.testnet
   tags:
     - qubes-hw3
@@ -176,7 +176,7 @@
   variables:
     PCIDEV: "56:00.0"
     PCIDEV_INTR: "MSI-X"
-    CONSOLE_OPTS: "console=com1 com1=115200,8n1"
+    XEN_CONSOLE: "console=com1 com1=115200,8n1"
     EXTRA_XEN_OPTS: "fred"
     SUT_ADDR: test-22.testnet
   tags:
@@ -188,7 +188,7 @@
   variables:
     PCIDEV: "01:00.0"
     PCIDEV_INTR: "MSI-X"
-    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi,04:00.0"
+    XEN_CONSOLE: "console=com1 com1=115200,8n1,pci,msi,04:00.0"
     SUT_ADDR: test-1.testnet
   tags:
     - qubes-hw1
@@ -199,7 +199,7 @@
   variables:
     PCIDEV: "01:00.0"
     PCIDEV_INTR: "MSI-X"
-    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
+    XEN_CONSOLE: "console=com1 com1=115200,8n1,pci,msi"
     SUT_ADDR: test-11.testnet
   tags:
     - qubes-hw11
diff --git a/automation/scripts/qubes-x86_64.sh b/automation/scripts/qubes-x86_64.sh
index 065f03931bea..73cbdff2be72 100755
--- a/automation/scripts/qubes-x86_64.sh
+++ b/automation/scripts/qubes-x86_64.sh
@@ -260,14 +260,14 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo "
-multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts
+multiboot2 (http)/gitlab-ci/xen $XEN_CONSOLE loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
 
-kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts || reboot
+kernel /gitlab-ci/xen $XEN_CONSOLE loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts || reboot
 module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
 module /gitlab-ci/initrd-dom0 || reboot
 boot
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 5379738019a7..0fe96d62534b 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -146,7 +146,7 @@ cd ..
 
 # Load software into TFTP server directory.
 TFTP="/scratch/gitlab-runner/tftp"
-XEN_CMDLINE="${XEN_CMD_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
+XEN_CMDLINE="${XEN_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
 cp -f binaries/xen ${TFTP}/${TEST_BOARD}/xen
 cp -f binaries/bzImage ${TFTP}/${TEST_BOARD}/vmlinuz
 cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/${TEST_BOARD}/initrd-dom0
-- 
2.55.0


