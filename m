Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9845606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=jlRekNG3;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=G2xgtuSO;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=NEuXivry;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=SXMBUAHY
Received: from list by lists.xenproject.org with outflank-mailman.1473485.1681171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRC-00016d-5m; Thu, 05 Nov 2026 01:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473485.1681171; Thu, 05 Nov 2026 01:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRC-00016V-1o; Thu, 05 Nov 2026 01:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1473485;
 Thu, 05 Nov 2026 01:38:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRA-0000sJ-8y
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmR9-00CQpG-Lr
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:43 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde11-bab6-0a2a0a5309dd-0a2a450a8416-16
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:43 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdde6-f2d2-0a2a450a0019-94a38ff1da14-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:43 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n9mx227512
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:42 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurcdp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:41 +0000 (GMT)
Received: from SJ0PR03CA0233.namprd03.prod.outlook.com (2603:10b6:a03:39f::28)
 by SA1PR16MB6389.namprd16.prod.outlook.com (2603:10b6:806:3ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:38 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::5e) by SJ0PR03CA0233.outlook.office365.com
 (2603:10b6:a03:39f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:38 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:38 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mNuo3091285
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:37 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhm1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:37 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmQ3xwn7xDnFpOmQ4x5oTg; Thu, 05 Nov 2026 01:37:37 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=aGn
	WhuaGCwq0xHnXisD59MwxXEWdfjgkFUiaprDKxqI=; b=jlRekNG32+/ceZCoUMG
	86HW8aeaBU0NV2zL1Hnm3AwADHikAxb7Jw1QX0v489aWnn5NziyuKZ9BT2HRpb4/
	b0UtAxKtBeqUIALSCGG2QcLwZZSy3QhsJFTENnx7VJpqw927hGwaQS8xZFVNDJ7h
	z4YThSnjPszQ0hb1xO7Dr0ckiQnKu1BjPpDicxowdEoSaaGpkezGDfRLjhC2TbRh
	gsS/26eu67gZanjOgRxGHz4hyM2m9KmCN672xUVIPcRxDket/IJ9n/YpTNR9qrJj
	DuSlChW3VPp6ocIlqLsRnkMBdWrMA/obvNmDiu71nEuBcvs6+ZmHihnksfX99Rkf
	sbg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYPrr4gB8R0Bcw+GhGeH6MVl10jpLdUrPvUlQ37Y4ISZBI0FfohIeIGVRFaGMAGh6mq34Wf70rtW4R/Z/bSP9M29VgChNm1NYEkq3ZPoHFQHn2EqQhLwBtp264xCFNHZ6XqzuZjkWyETuQp4AWO5iWuQwq7ojf5y5AVdGcOECY90R4veN4QVeRAOgBlX5ix+3+xdFHWLa2wq7u0maItMLd9JDeH35KCSunBFLOohGZo8/p6vzXzbAvDqDfd7JjKWidU4sTPMJx0MmHpfJ3KnfgAJNOQuBtYVB052yzshgL1yvaW9q2/KU1Do2GbHrlRcJhWbCbhcAGodxjaWZfrWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGnWhuaGCwq0xHnXisD59MwxXEWdfjgkFUiaprDKxqI=;
 b=pA9XGgMPCmYTt/m5ypvCIC/pA1GqBA72fKwnxyMab9oGCLDbVPYHUprhTTmJNtgHnifJ5AHMSPoUfn4dC90/DWYqpjYD5dGx1hemGWK6r2PWx9E8uf6Dyp56n6khFCf3rOkEMunC2qs73ymGjJSFFOHL3xspoSBZvYt5R7yxVm+FSMovfL3y170fgPPSsKmaNMB73L9mWZqxmWEmt1WARDkL9+TNny83WUZjVzFrl23vlTmgCp6qDiCswadth/fb+u1a3DDaTK1a1oiYl9UlgupOsUXz5H9N9j4HT2sm3V8Hdqe1A+k5RINaq9MlyH4HzeN5dXQ6Sat7DEapqTumHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGnWhuaGCwq0xHnXisD59MwxXEWdfjgkFUiaprDKxqI=;
 b=G2xgtuSOquqaQvF6xp9oofcEog1+b+TZwosZLbF0B0l2loLB8UINkzhje9wL6MFhHAWgIGbo8Tbq1Suwtvkhb+uOoUcLvDCtLqggoB8ZBUP+giyLsMzkZMkTDOs96aUVF/xRUv9NziREUeIbNenhAcWz3NEPjOLBhRMswmPpAUU=
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
	ppserprodsaar; bh=aGnWhuaGCwq0xHnXisD59MwxXEWdfjgkFUiaprDKxqI=; b=
	NEuXivryXu3i8Yxjna5BlW04gsBYbrr//Lqr4GSNyV/myQmjxsmwJDc3xo4kZioZ
	yzTfwZDf/rHZjUDXAHwK333UGKcRj1RoiYNhdGbkWQoZZPJeldogar+Y0Y+4iiyF
	Jy6LVthCaY0G1FDAvLQ50a+auifIm5lqHgDSqO+W8w7F2pEpL/QC4uWOvQP6w+zp
	Us/YkwFbjwnUTl7dAEJFvHN/E2PHCZPX94CNNDBXWdDFAPBbpdVyrhY7Q4zjMTaq
	bb2EcXV0eFtVw630cIYsLwPRC2gGuEMFHfDGu7pD9rsyp+bbcF561hLF5T2QGjvL
	g+YDYO2oyrB437U69ZhcUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=aGnWhua
	GCwq0xHnXisD59MwxXEWdfjgkFUiaprDKxqI=; b=SXMBUAHY2he9FAsdysc5mA2
	MJkQNzbkT08oSt3h2LKOoqs3K0Go8BRucg5srQWlaB4z35FDTDpiveFAczH7ympB
	pieMIEXQTSTwk8RbOcQIKjF61DbGRyevBd7eF6Nqj7oveOt7Cnqf6FzXkU5p9iwz
	j+jbIxRpsTBhcCWJVVPm8RDLSId0TZ/GnXX1NQkt/eeMOH2ikgUdt/hFUmbsnynY
	0UcQJLRZhyW0CpjOVQvI6atiSHXxwuukDRrl11pqVHujn5pi0phLyW026lsX46e5
	v6BH4N16bFhNPFTvk5W4rfqhXracKKu/KxjOIO7FiWQs0MAI170EbjfS5+DFtUA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQ3xwn7xDnFpOmQ4x5oTg
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 12/13] CI: add on-demand XTF test jobs on AMD Zen5
Date: Wed,  4 Nov 2026 17:37:00 -0800
Message-ID: <20261105013701.719658-13-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SA1PR16MB6389:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4c40deab-0666-4a08-fc67-08df3add6023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261022113327099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JBWoeEEjOb1SyZPG/OszIXMp+lP30KbY0C4NxxAwUGAb4W/2K5l4cAxOTiYZ2DzQ7kjIWDJnQuEJzyi1OUI6Y4g4vEptE/NwlMeyxdyp3lVIl3hoxW3D9QvDuXyR6xJM2rorG5lgVNnbgX6ZqTs4UBLYR+XNvdhjOoLlXWJ5mZUi2E0itq48hBfAxxPztcJy5Yyt1LcYsBEP722yeu4AO+p4tsbP9BtW99pboD/0smZj7JoXR6per7J39EoPfL856PeiDzsAMBYYWxEz0qBrik/jrIZf9lAqgMQl/uyogaTsiIEkj7WYZTMOJXw4faTJDYMffpkdXRFtPVEK3EkXyIMZI9Xjku/h6/kZPQ4HVcWsZiWbzirDMNymPMxBZiNg++O3DhsRfDl9d31RJ4zK8am9BA/s+RKM2WEskwlHPV2VUll8jVLDUIBlQbNt3g84U28JtMcvHBzLPPidlV5bc7PsS2CauApqCk34tbzmSxabab1bM561IM6o44mVk2URnZntQ6l+9h4ggL1YyVm7TjeV55yiFW2h8qwTtYELnpmkCNKYAXEs9VZ5oG0m5yiBm4e5TvnhzOZ/gUUvC3nY+fvkQCfwVUteX4TYAzO+XWqkwSfA7LJ+XEOjTOzY3pl/hYczwhSrx7SK8/3/MDRVdrc4k6PNhsp2+NTsvwTMIxRipCWVK2/qxvcj7dhCG6/bPyN7HJy61Re8/ZMxjMMBBw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261022113327099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OFEwv81f5Pkcz+arACc09iuKu7eu0fBty0hk2d/TwvxkoEaixw0wIkXuPJjD61PhuwQ4XtCdJG+6py/EF8MknIcILjTA3ildjn9HT1tHK+UzjCjvTdYoecVaFuvTR0HA5inWF0OUdXnHkfF4db7u2yE8AibfP/wzBMD1hYzsYYQQeUMsZZwmBYUqMgdRaK+pZi1XodnfSyjjpgJMGQgOJ0Q8ri9oIosMoZ1XYwqWwwEL1dUy3nScvr2Rw32WBi3LwJfxTPnBEu6AAfl2fmKwF22j62sGZFVmdWfJEOY4ve6WIo5qCYI5gRH45KE9sFnH2hhe/I27TbEi0BWUDhrxvjp/Ba0Ct6jfl31lZAUqS3/jX8uMz+aHx1M6Wn2FUR/2bNE/85siTlqEYjEHJlwwWTr4Zow1mpN/kFZPXsiggG4KqYQeGk/yZzoet9ZagL26
X-Exchange-RoutingPolicyChecked:
	H6Qz31pb5k3XMFvVJaun7GnNAsdo4e6IE6n5pB2F1QUs6S4Z/18fxTzOgKzxHxEm8etVu7M77QUmkwvv1Ky1ukHjZ4TW5/mWesSvCszVigwbvw4hU3Marw9/BGfCGhy+ktJvnGsAQhu8N1K0Du38PfwOBGl7n2WEHou/Ba/wllJUKph3AGqwOjpOIjUBZQ+BAHpzg2/4YD5WY0cuYMPawnEbDHsEjBZypqVR7RNZ5aH26aqtOhiTujXxGcXXcNaPfNUHDxRO5IaSpN06oNoNhb1Px0bb05BI9y41/V1X7zKB7473UUvfO0/JZh18b4RmsThkwTnv9ed5eCkYO3qgbw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vfvGtonreTOSX/yM0kIVl2ya0dgzfu9Gx7Web88BVJj+w18MAgk3NW/Drug1G745Wrjxz4LQRhGr8MYBrO2H51PiM+ZBjTsYI8g5OVVfEa9kz7qrHJz9rgmFfsJM4uMbVHUNgRTUbjCjILZC0M4LJuGWdjd5fJvpJxyH8kz2ROlcqReUzZMaKys38wgLW0cr8x04QRmGbGt8AwwNWj7vTwwtQOgNg6HaZ3I1qlYN/iS/mHk+/uueUkeocMS3xI3a2hLDBEj6yeqoovjQPns4fFk3Fqa7o+q1DminFUHSKOhq54iyxxqYPmIoZKrZLGcKsZxErEHGCir+sT3ZKSWvLzBU/3rFA+yKNlhWD6R2LbXLJCIu2f1U9sdAHLodRTa7gn6nL1pxw12wNU52xiqdnWz6CM6AnUie55sR/jmlVBQrqByqGz75muLnZz5TLr9GujFRyJoSQb2ZnkoIP/68VQnboTVqQS6TC/YnJFquucyWUnPjejBFK66agOcdkz9tfv8hskPpEHfBXusnpupgHkibqyAbSJNCnWi0TuHVBCR2fNAT1aEXMj5xSQhK/vm5y4kDKmrSR2CWTz1FsHLBiZEQRcyG28yicJijmVMIcsoX8FJlSZ/J4XFVbLoBCzZjVwV+STmXVLWX9+79A2M7PQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:38.2403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c40deab-0666-4a08-fc67-08df3add6023
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6389
X-Proofpoint-GUID: -7ZVy3MIUtDPOewcpzq1BkdlsxrUPNoo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX2TisGYBVXdwG
 bl44eXw2nPIIlZaio/kRPAyX5Io8CfNzJgVsdXkqE5DSC/UREiFJh0Pz+nH2/0JoN3NaoZqO84P
 Mb5e0e5IsQV+A6l955j5twEU/JmX8ELwBF+6wcfcg2Vr9IJ8rsqS
X-Proofpoint-ORIG-GUID: -7ZVy3MIUtDPOewcpzq1BkdlsxrUPNoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX3rX0UOw7e/cf
 dl4d5mXb0Qm29PlVpaAZOU2Ld4rWpQXxnxRITPNj956UtXGVzPB16dAs0TIBUWDkAgRWaMaLJjr
 tNYCKG8neCl4GdtbHBq0jzT6eyedsCl82agwHbsZ+h4TwJUQZNfydZgmvdLEJsU3e8TFWKQboI6
 0C5anFRBYDN53aAlHBQCcLXLpTwsyuer8shSB5opVx09/CHM1RhsYRlKROF6BGcJoO17Dyt8EJP
 U8ee6zxDGo89ZfZiTr4sxLY+OBIcoPDkDwG301myXvxSmBoWbWFveQdSHTSh0G6zgo9aqKj9u+5
 oyesf0bLk2CU+gbC/A39iPEi2gbnC6pHW5dXKRJXOaqGauiX/xr2Bfc87cH4l74HZD6VlHF/NPo
 tLeXz23BRx65J/KvvWcoI8ChgGZ0Gwo+yD8Oh4DJqKQSAqbyIFMwR31YyGN1bmThOPSkUQ1YgF7
 ph6cmjpQdp5m+oMj57Q==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebdde5 cx=c_pps
 a=iByqbumfC+QZNsSPXlDUmw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=b0jTZZKeQAALQPtHgsYA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-4011c0/1793842663-583CCCFC-698BBBD6/13/0
X-purgate-type: bulk
X-purgate-size: 1366
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add on-demand XTF test jobs: complete run of all tests and
a standalone interrupt latency test (AVIC).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml            | 14 ++++++++++++++
 automation/scripts/include/xtf/qubes-hw21 |  1 +
 2 files changed, 15 insertions(+)
 create mode 120000 automation/scripts/include/xtf/qubes-hw21

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 05dbd0d3e07c..f65758cf3b96 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -276,6 +276,20 @@
   tags:
     - qubes-hw21
 
+zen5-xtf-x86_64-gcc-debug:
+  extends:
+    - .zen5-x86_64
+    - .xtf-x86_64-gcc-debug
+    - .test-jobs-hardware-xtf
+
+zen5-hvm64-interrupt-latency:
+  extends:
+    - zen5-xtf-x86_64-gcc-debug
+    - .test-jobs-perf
+  variables:
+    SELECTED_XTF_ONLY: test-hvm64-interrupt-latency
+    TEST_TIMEOUT_OVERRIDE: 600
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
diff --git a/automation/scripts/include/xtf/qubes-hw21 b/automation/scripts/include/xtf/qubes-hw21
new file mode 120000
index 000000000000..c6b7de7308b6
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-hw21
@@ -0,0 +1 @@
+qubes-x86_64
\ No newline at end of file
-- 
2.55.0


