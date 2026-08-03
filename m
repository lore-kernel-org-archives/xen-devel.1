Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C9C55175
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:01:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381173.1624728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmfV-00033O-Fp; Mon, 03 Aug 2026 07:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381173.1624728; Mon, 03 Aug 2026 07:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmfV-00033H-AH; Mon, 03 Aug 2026 07:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1381173;
 Mon, 03 Aug 2026 07:01:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wqmfT-00033B-UE
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmfS-00Dx1a-QZ
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:00:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a703caa-2eae-0a2a0a5409dd-0a2a450adc84-0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:00:58 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a703ca9-f2d2-0a2a450a0019-94a38ff133c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:00:58 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6733QXrI149205
 for <xen-devel@lists.xenproject.org>; Mon, 3 Aug 2026 07:00:57 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011054.outbound.protection.outlook.com
 [40.93.194.54])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ftk39s1kx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:00:56 +0000 (GMT)
Received: from SJ0PR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:332::33)
 by BLAPR16MB3841.namprd16.prod.outlook.com (2603:10b6:208:273::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Mon, 3 Aug
 2026 07:00:53 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::1c) by SJ0PR05CA0088.outlook.office365.com
 (2603:10b6:a03:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Mon, 3
 Aug 2026 07:00:52 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 07:00:52 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6736LXdY2591096
 for <xen-devel@lists.xenproject.org>; Mon, 3 Aug 2026 03:00:52 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4ft1nxh7qg-32
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:00:51 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id qmfJwsqcfRF75qmfKwf87h; Mon, 03 Aug 2026 07:00:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=637qawqkKAH9vcNugWaXYQ4sA
	GQBt8YEUgWFoGQ/vj0=; b=qMnSivLpmkhYDuJeVtC3MCiryoFEoDpkmcUUJ5Pb8
	X+lYoE80E5albeoEcF1qBrTwtNAQLypYK9g15oqa6XxKu2r0Xbgnn6h+XpibwHBl
	4hYgZ1lejTbFETQPQ+zqlHnqMRlm5C/zlIiHS3+DMeE/13zlfpfKuAns2Uzs/3SZ
	iKullN9I+Mt2zeRRhURZ6Zpt5im/cQkqTTRjWj8rJyv65PTazjYIcKJFQjq6Oovk
	NQ0aOCpspD7F/xRvOO05eBUu8eTuGDCiFQl34RsW5ZghhetVUeF4Bgr8Ae85Tb7h
	C4e/NPN37BQYVFTOMeI43h5Q1pBD154hGn640e1YxXiww==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWz2JGHfO8Ch4PUezlPkNu8kcyAj7DiwwSFA5zDRQdVtHPOdo7q9RhCZ4h2keAwU/HgFQiBG0aqwPobBa/zW3tsfYutHy2Nbz8vdeVL8o62WaVKWyJ2vgduCDHsSt9X0eaLxzlsbLYuhWgj/9jFAN+uGkTCo2Sn8ewruVLDmL8aA1EYqI5KRCuWJ9hr0Nu57faDMPArfMb2yvsGmyOyY6TohCGc4TkqCZM3hAdBObn2LA4lZmCSq020g06vg8aHCAkeSUIg+KIVYDe12H5FNJagEuoDCHEqfpdbHPHpvH4J4jomtuLBQflmDo/JuKmMa8Y9BjuNW4BXRkpPl+wkZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=637qawqkKAH9vcNugWaXYQ4sAGQBt8YEUgWFoGQ/vj0=;
 b=VTr64Or6ziZvxdfHLdiAuro/t15yEAH/yexB5cu9OfBO9lc1xK3a/aDQBEb5aSDT7L6XfbFIx81gtwYqNcRxzvjurm1W1jS7MMP5je5JFsFFEZy+qfJ68BfMznNccA1QC8A+JLTmwinLVR5RmdyJLYJhPrVPx7UOWnsm1Ds7mHB/KIB+1jMTnwEFbV4cLXBLOv94rEGY8eTYw1m6mc3l8Hs6dcmLUEpEu9FEVS9nbU/Cvxny/ECKQfPvI4YOvj8l5DBgg2FKU5X7mVBxVlJ9jcr91JT9U99OV1UwhozvWY0t5A13ohlSAyCUVu67TNcmsMndGo3Ttsuf+0nuyNsdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=637qawqkKAH9vcNugWaXYQ4sAGQBt8YEUgWFoGQ/vj0=;
 b=VKgg6OQZ0FepEyu0Wmy0yD9Lnn8Mv5HnEJ7Ggnh13cuXynTJX76IoLKJy37jIyaGglWWCw951p7H9Ky90uk1BrIkJgO/B1y9pux/Xyr/34qoKdIdIrLt76UW98LbJeZT3iwZV3ZgdAhGdrCL1cDMkwLAdRqJC3Blta0atiChPRs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=637qawq
	kKAH9vcNugWaXYQ4sAGQBt8YEUgWFoGQ/vj0=; b=QEb/6HrS3F/91wV1tyGLW7z
	kxGwSUq2LYtN4ozp8tTpRRJ4aycbRTjPQkntHN6ht7POhLA7NiEQkErDovJ6v2iV
	MejAOobu9GC2CARydr6Q67edVS9wxvD717HA9aMwUGSRgxB9nqJtgk5OOw5Nq8Ab
	XqV91BgJVusHonmENFYyY2UrhME/VO2vqmwpWVWpZWaiYmjnFLqEQjzBjfKzc9bH
	O7LPnL5+CTKLj5vxzNzZm4EPQQAuy8ml6QwHDJuyrJsPVgb4OZ4mdenW66NGcwZq
	JxT7Qbw72ZKlpCvRrD5W/4WehGAWP5ECkZ0lwUViQ+ehJRX/JuTGFfqUJqjftJg=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=637qawqkKAH9vcNugWaXYQ4sAGQBt8Y
	EUgWFoGQ/vj0=; b=MH/V7hm1Zpwy6YelsOGX0bznw8yN54ZqYTUcq+KwVxR93k8
	cqIVMZnxrmNJgKCYHqYCvyEQKAnJCRhDAYA5y1pS2eGZhWQCz2K0n61juVeG8R/r
	gGVCarTSum9ill0rUWQLe/1dSvSyctyo8jzbxueapO8TB781tkqBL50cF5k//RRY
	8lkcP55Lxaj1sTqt+cv1x0O3d+i2FwjtmzITD7X7LKWRb+X/hAdjrJLo1dAHHTBn
	Oqu4Fb5vpAW5y5dSLPS3tUqU3FLxTUIjmfOPiElhmpiy49s3bd5r2moAefua3GTB
	7OKre2CVKsH6TtKLqMfulHDzU83NwCMu756sOFA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qmfJwsqcfRF75qmfKwf87h
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/2] keyhandler to show Xen command line
Date: Mon,  3 Aug 2026 00:00:45 -0700
Message-ID: <20260803070047.3097846-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|BLAPR16MB3841:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 54a73456-2eab-4627-333d-08def12cf4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sU0HEe6X2AcWxJgu2JgvLTZKpfyrhBmbsfmLj34c/W6NVBSpW44PlfuQkP2dYeKbFXJ8KhYqWPB3D+Em04rEsn84XvFWSK3KWRAB3+JZyiYNDSe07BEy1SRB4jWUF9d+a4Sbjb0Ztm/JR/xSUXWRD6a2nMOhtCYNW/iTVCoFCW5RwGBma7A1M/dGQijhbHahWn8dVij10M/MQgEWxh/urXzH0vDZs+30roZMR+Ej7dtoRKcVzJZXrfR3Y9dSu/zrVQoVdCX3RSYaaTP/Ka/J9yTCigOQWbXRsjvNiPMAvX0Va7j3WOx59Uy9+Lbu12ZKXCGTehM/9Xk1Dpi8l0HHWXOwjFyj0rIImTDfa0B+bU5V9bG+BuKUIAMMElWCoSeat1mQGqQtWPK2UScZJrdmeoenU/cXYV0CzNcCV6FkjDqNK/ODNokAc6xU2OD98XG0PGOPRyQJQKn/F+85YyXvL9/QLEBWQtkiOtc0hKor3oESLPVfy8fp/SN35JrIe3E9xsVuwsn7tFr86jNIZ+4VhB17D/njK4SUTUs/omYvxl3dQ27QyGGL34oOV72hLu1W7z62K4aJdKxegmOfsrxkhvB9bshGRarNppG03bcni+/0XaqUaJfObLd+9yqID71eilUcAwQPtvfjhELzd8yME71qv1zaiBr0gPkCEO8ymlTfJoETENEEP8NHj7uuZ2VzvjjHzrhxBUUSRMzJpXW8DQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kG0WTJ1Kbk+sHDq+xXUFc7Eyqj8LddjDgg487DMaqgJTmalkyTPhwnKta2CQrRbaEwRYXx13JfBxj9JsJ8OiN/O+DGJ9Lul5hDyjTqd6T+Q+iJn594A/RdPT7dO3wMXlAisE0YnzTYERUJZxA6w8Y0Gg0xIepvuCgoYwiCuGEqv1M/5faC/mmbYSMLUSZq4fuEuZOkOz2GYaAoJSAM9bq/NSONa63CQMftN+q4yw6YUZDDgpKYttLulhq8R/LWPXZP6kVhsrK/98QYCdgrY71J76ACKncw/ifXdb/MApkDOscrjLcPyF3VCRL+FgSBbNNdiH9BBpYgM76cczvFs/NL51xruiHOUOYEMx2bBgkTQi2tuDDasz603yFEfJGH0y65HvEecKatX2cYU5b1lplNNHwFni7Q6ZC/+I3+DkVKcLsUtnOs69lRAY0ZCjLPvy
X-Exchange-RoutingPolicyChecked:
	d7YCDhtlYw58/DBF8AvJ9H5GxXUVKvU9G2e0mD/JB0wfbnuk+yPXxziTAxkq9qSB+jZKFFANe750TGvzJS8rIkOpllCrgSTw5ojbr7cG1COpotiBalCk8byG55w3BssWlGZjvawjKmdWN+TqXY5PUQGYDpHSvGnMkuupU9NHwXEYpwLCSu0ZVvRaZv4/pIwHxrqgGOTftRqB2M151epclYlQFn6Dca7DBzYM7O+qgQwtgaRBux8syG5PdXApVZs+JM+VJtcOXck/yJZ0szp+bwur2kcWd/84Wz/Un/ZYdZ/I54mIvftq9uZtm3QyLjDAKcFgC6U/VlVK2nwAzvPiaQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z1SFw6rNL/S/uQ2IjjYv4d3xL5U90U9eZv/LdKf9H3cR+NNiOsb2SOrZa7n2Ap5xnRXgbJEkD/krlURBRjiBsyT3tQXEP7+xtAx+O0aIcR4vR8npPEEryWPdprh9TfF2c1IYCUYIUiz9JhUtjaSUH2MzsugxkdKL9X8Njoszbf2opLm+BwNQvW7Xs/VwBAt3hKcBo0Hpfj9JQyuxs5tLd9YEbk4e7c8bhbjSKsI5yDSOUxgRdtR67Rk6Mal5n24W1GqZMD7Is6yzj9t9FfJkuAeoioswoApr5V+44jhLx1MKqwr6vOVEbuuo1/w/MIx1IdkBl69rpJnCxih7lIYcsPTYCjhzreZ9mS9LCkDfBqtQGX3y7YeScdn87C6tNYUCBXVcm81oBOnoknGBNKMk4UkAPJO6h5A/ad8zGWeK+OcKookY5/flfDV2SdiTogD8qcpKi60I3BdRO1G4pkJefoSJ0I02op3TuLAwLvEeRmsCb66Da0nvGK53oDvmUeX2nbKUIh1KoDRAjgGqp5s1zlDUlhfZy6rwAlbQhabqV1xW45JSDn3w//y9oQs5IUCXPimFeVK8lgLhobZYwV3B6iu2fuqtw1a9szSBdEWAuWzCifb9fuMuqFkPDYTudxel
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:00:52.2902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a73456-2eab-4627-333d-08def12cf4f6
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3841
X-Proofpoint-GUID: MJKzfB-LFmGf4YebNhJXxBzE8pdONy7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2MCBTYWx0ZWRfX2YAVF98R3+s0
 TUSHxVZsuMCAfKHW6jNkRwofe5NnDjkDAlXLf/Z6ufFn5Ck0ri+0laY/BqtF27iJ3Rw5C+XR/yK
 LgfLd0ykOpD7eTV3rQcgYrEDjdP+UBWSNbduuNRveodDiuH5tVwUPkLAqjGmTPxU6siwlmHinzc
 S9lLEvVkidjmywH1xnVHI5fVBj6qZK3W+VkwWbOLFTON2WmAQrGiBSHWNDxr76fRuDihXtzJBTm
 57sdW86PZEe2IxX01CocymsqGiTu68vbvfRsQE/QKwD0PkZis2mlmbjJ8qqIn+z5elLO8WcqtGX
 +sVYdFBEyGCb+AEH7ieOqd80OF4q3DJJFnP1njtr53sQqQJCVBIpzj7IdySCmx29Sm0tNrLW0Ff
 RPd3PEqM+pyIpXsoVaLj+vcBtImTzaBJ4SdIG7V1NwmjKZm/mfDpK9j0StcFhm/yH1vW6F/6tZL
 cP0gmOWp4kQAhMiye8Q==
X-Proofpoint-ORIG-GUID: MJKzfB-LFmGf4YebNhJXxBzE8pdONy7D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2MCBTYWx0ZWRfX158QcP5YM1Zq
 62lZdoM8UVyzklKqXrqL/0cMympt531OeGeGMD0MIfPYHzHgN+InD7kRek6W/B190m+WnOLfHea
 H07xRLr7I5qVfDsfYzKmQMLdL9ad00yN8ubmcRjzNVVP45zst6yO
X-Authority-Analysis: v=2.4 cv=doPrzVg4 c=1 sm=1 tr=0 ts=6a703ca8 cx=c_pps
 a=cVuenkWoTzwZy9czxFkdkA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=p0WdMEafAAAA:8
 a=Xf6Qf7mQbR-3ao5nFTAA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030060
X-purgate-ID: tlsNG-4011c0/1785740458-518C5CFC-B72DB72C/0/0
X-purgate-type: clean
X-purgate-size: 429

Tiny series which adds new 'X' keyhandler to show Xen command
line to help debugging the system.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2723312941

Denis Mukhin (2):
  xen/common: annotate saved_cmdline with __ro_after_init
  xen/common: add keyhandler to show Xen command line

 xen/common/kernel.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
2.54.0


