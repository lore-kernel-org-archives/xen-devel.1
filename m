Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DA8C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 07:25:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375211.1622433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyfZ-0006S5-Qt; Wed, 29 Jul 2026 07:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375211.1622433; Wed, 29 Jul 2026 07:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyfZ-0006Ry-LK; Wed, 29 Jul 2026 07:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1375211;
 Wed, 29 Jul 2026 07:25:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1woyfX-0006P4-NM
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 07:25:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woyfW-001hkJ-Ob
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 09:25:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a69aadc-bab6-0a2a0a5309dd-0a2a4506b784-44
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:25:34 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a69aaed-195a-0a2a45060019-94a38ff1431e-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:25:34 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66T73jv8462649
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 00:25:33 -0700
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
 by m0482515.ppops.net (PPS) with ESMTPS id 4fq9f29aqb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 00:25:32 -0700 (PDT)
Received: from MW4PR04CA0296.namprd04.prod.outlook.com (2603:10b6:303:89::31)
 by MW5PR16MB5023.namprd16.prod.outlook.com (2603:10b6:303:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 07:25:27 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::64) by MW4PR04CA0296.outlook.office365.com
 (2603:10b6:303:89::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 07:25:27 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 07:25:26 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66T4bvtj1788472
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:25:25 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbs745jh-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:25:25 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id oyfKwmWOMqFVloyfLwVWQw; Wed, 29 Jul 2026 07:25:24 +0000
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
	:mime-version:subject:to; s=ppford; bh=t2W5sIMaxk/pBbaI9lLz8Efhk
	skOt8vZrsY/0uL7SB8=; b=H0f9Xjm6FbDECeV7g4qkj5VZfCFo2o2i9erC9l8If
	LgluF2DWsWX0pEYfyhm8B3oa1+XjXhM3WUGeNPuxwkE2sRDh1AwPrkBQMuOThTwm
	xhNDMccOYtO8g++/1O9FeLuBojSNmzkg8RenFuzeGGGly8Sz1lEHYkGp/j5qw+jm
	L2Q01HtyLANxLqG7Y/0qUXCBwJVIR/NoGRXwTX/9rZCVXqcs6nQf8QLVk/nYmdNz
	r+l9wIFkOK/Q/LfJvMpDL6LAu62MhpLu4bPyNhcu10JVEZcPZSjvqzJ23QpPxCU1
	S3nHM9FHPLh5t8qbKJRYTPmkJki3rO+PboHNQNnz/Hurg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFGhqWrwnao5qMRUPCqSZRWNVuazIR4P7c2G6ZuU5qm7zX00w2tvVNmd9QHtYaiJvRI5Uanv3ZASBlHw8Qc7VroHzQp87XBF3g3Kwv0BOkiWd15yXHrFlwCjR5NvBFuri/eXVzdcqjB78TeouUlzrEVxORt1U3Ewfl2WmcyPHiQtx3cewDUxz7G9gsVNpM8jyVS0N3BjeYpAgo//9FDL+egs2NQnUH9SuVtPhxlGG3pFvtE7p53sSD8ciRvHeCffRd7igI2d9qcSbg9/TPGWvR0dHO6TY7KQQtsKwx19ZILyFG+5uLKfZjV/1rPA4wFBRDvvQtpzU/PCyxqRuScRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2W5sIMaxk/pBbaI9lLz8EfhkskOt8vZrsY/0uL7SB8=;
 b=bxJFP7xZUD/e+McP6O9YFSFi5hQPMBUgt1ErpQhEDX6ZfvVgwOuQtAcpIHf7RLpbKTNX1rkiDukivOVDlbYJKjsvdDmAicj8gUEAJOW7epjziUMPPCAF3WOWJEx1OYm/hFRdEcCbyEFai2brwIVcwlTvbMkAiIulvCoNwww6owNWJkhGpKLWHug9zl9LJi50OhRK2g1zUHn2vC8O5QMlKRF4kxKPaiZSIHZkZ67C0fOYzIHQK90b3XFXDiwpm34Aqqwc24IEmAPnC8OT3UY0k3AA0h93QkzHVvDTepICsFVOYW+ikM/TtYshLham5/Dn/GTq6tpROwy/oM1xqRh6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2W5sIMaxk/pBbaI9lLz8EfhkskOt8vZrsY/0uL7SB8=;
 b=jd9gVeSxmYfPwzEyNx83ysE1BoZwuwBdaU1tHeREpjNXtlYHVnkd+sxidCg6GQYzBDLL+c7HT13GeoFUPxdKTssTjBX9AkJygp9aUzD8evKiXaFsDrminRL+XZsGgvDUnxIt5by8m168/JeAwIFPskDkyYEg0iB5RDyaACo/3p0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=t2W5sIM
	axk/pBbaI9lLz8EfhkskOt8vZrsY/0uL7SB8=; b=i6+4t4sKcit/cyzXlMaTw4J
	2k+2DAGw7Byp42qqXFJ7iT9iKLRiRFCrRTVp+QbnFclCEJin3yh9J22hzt979sbf
	Acb1rn733XyRby4yR7SX/Xq9T8GbupF1jJLVoDzKuv/Iw16eTUzXIpWWOK0s3jzC
	qfkCAQCyJOZ1SdAgUWPw2406c2lHLYStdxCkAgL4WxkY5tfWuDKS4JLn5y7ZMvWM
	7MsgGh4Jr/m0fAG13zUpbVENLgfb/zKz/fXc00AjzsTXXKRkFpOSYl2Oq26+/jF/
	+S2ubI98hgxVr3Rseje7XLvfMB3RskqBmti9YeYf1Oqp138eLesSuvj2PUYUIsQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=t2W5sIMaxk/pBbaI9lLz8EfhkskOt8v
	ZrsY/0uL7SB8=; b=G7MaovZ/xkAA+8K6oamoYqIsDuT09P5hIBbqXD3RMD8wO1m
	fOfrZWK5nkxllR5lYyGmHvHkN8E6EYzlL9T0vJiGTLNXQXbydZ9Fm0UYjDOi6tJu
	j2OOwp1mXevTidBDUsCX4jDfme/busl//Ylx1GkXiWPmoP1m2Nn3ghDkHiaMhDMh
	doSAFgBuniTtrUyVogFFOd0Q6Klp/zxE77S9Rnr8yV3CAI8au3+JX1bOH1zjAUR1
	sCIzzUwRj4pGdtoPYLqldkiGa0s/6kW8OTTMivpQkmKJrQR1QpeYiJC+SzjcV4GL
	jrqvP5VWweerKv3Gf2ut+dK6m1C56axMeqg5RwA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oyfKwmWOMqFVloyfLwVWQw
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 0/2] xen/console: updates to rate-limiting
Date: Wed, 29 Jul 2026 00:25:18 -0700
Message-ID: <20260729072520.1556970-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290058
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|MW5PR16MB5023:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b1166b83-80d6-43eb-f029-08deed428f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|13003099007|6133799003|11063799006|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	bAt0g1cdwxDCTjZdNGy/hRg301bVM4by2FrTsqpvxKCQeYfMdq9itGARMRXS9OJlYHwkLy87aUUNO/Afd2WSoASwzcBC6qi8I3PsqQgAeKmWQMjnd1mFnzR02lTZTg2H/4FZH/BWE1/k13p8BSFvCtW7SYkvSuwekDj2qZZ3JySdteoUVgf6VAyg/TxVeev6jNkgysF2dMMwL/5OtUy90kXt2ye+0xjna9a6Cwz0+GfxH6U68IaFdr5p8N6ukvRWxIBy1h3a7biDD666KdgpUrJB1hffW9MHDhgvEEMp4zQaKi6UweQo9rPFCVngqg0jPZQkRMnnqwBd2uId01ov1ltJ3dUglQ38RMOT00oxhsfUJUETuMThQuPDL65VeHHbB5zW0EJdGf0ATvqpPF2eFNzJ21Y3w/EVQH6VE6mWmBQEJJbRxb9V1bBQaXU0I4tTUyyjuG3If79GI8PhzYpjIp4KbpbiTnGyRM+cOiwQhEHWZ2HXJkYH9jtwcZCZN6h17jlG10WjDGoo7NWuoUZdt99NzjnNLWLVTB4xcsDKphSTsH2R2+75s2PW/59k63rNTvjbZZdRipL4Mf29y/8pFGCoaZYTocoeTcG0YDyQt3ELpS/jPlxrHJjXZJ7r+SBDwpUT0Hd5jdb8t7eKJITiif8e1s0tH6scfwsVqzjFJ/5n3m5xkt6c0f1zLvgUDA0dhuxie6gDU7oOii0rUSUQ1w==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(13003099007)(6133799003)(11063799006)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/yr7bwhiO27m0jAhAqUh9ryqJ0oTQxFQgrAg5olpC3uB9jeOajTSmX9RmB7ZJbNbgOQE/n5XysmlfVvzUj1cBGBpNZILlOSRF/Johifs141MAv6fYODb+PYzHAu7JR2OBW/DqhzCu/ath9NScqcyP0XLF4lts3xXW7o3YjFrwovlBaRCbel0hwPjd95tPbwxJP8k1Cx+B1cPBg0+eotY7/WCKiIMwP17aj/oeZLNYHpQNZunTzMwWxzNjbVeXvHsiCMWXm5f9D4PN+SOXdFbHSLQ71nQyWd8jZAt0arUDcS/Om2jeNbLkZP0J7uS2b+BrxwmwuT5kkcIlz6bl/mAK+SOiJW7rvZwXRvRxJYNwIEMY6JM6kYspdV1JBC6N0q3piUpCtVRDLSrQqU38v/q5ShyLf0aoFbJdOLG37S24mej0p9fdxFj4C0qGcIygzhS
X-Exchange-RoutingPolicyChecked:
	jifWr4MqqwCFuIam0uVN402bFV5IHNYvgpBIVfhDSoTQyMByMMpPsCXdpLZPWrCEkaiN8LvZDjRA9zLr7Gv/OaCQr73lYNfcQpfrMPxw5DrLtvcp/1/MMuXBbyNzGfl3sE46krT6FMVJBGUwJxPX2K4bjvO41lVFCvKUcptDT+MRvAy/AEfjDKVEYz+w4ITrK5bGzH9PqFPy4sg0ECP15iO2/cXzmDI4xxMk+RufRNpj7VZtNBUieJxTBvkmVBCkUa2HibLaryv34VVWMMXkUuc090cqO8yKa5BjXU8q7umWw5udsK93419HQIx8/+4VlKe8rinxjM0sbepTXFQinw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OkaS6lbD1mc4dWMd6WvlIRmCZNXl8ZbuHCnYcJwRAe9O2HWrckB2poZc5s+z32VgCK94l7whAtCZB8bfSKeKD24U2PBqhn+Z43JnVBXEGA3nMvh9jtxnzmn8/L0HI/UeP3g2auTueMaJmVXPt7xP73QYGlBNrlw9eYeHEFkvPEWeDGp6xZEfBwj4iR4Cqhrcg81O8yauUYTuk/kCYtyD0DmhrSx7M4G7kJKRT9jkxULgR9WNTaPTKv36+r4sMAiwgXM37W1v5FHwl0JCisZyPxzES6wZe8yXt+PD8T5etAs3NFPdgazPXghc+9o/N7q1ZTYqN9IUZPQT9F/5GIRlTlDEBvRkwkMRHS2VPUWCKOZBAo3h95LxBxph3wsWNIBNXHYtIxGyWl7NPYgFlt+M89X3UUUpvgxVFGmXqC/TOrGdAX0JcLtlT1xwq1U0ohkeO/YN0+WDbixVMsO3k7xYmJFYg/fxyKqoGPOB9jcZCRVeqSzAoEZv5hZZ3GQBYcBuN0GYYFftlRJavqdNDc1GuE/FC3zyrL3SF17ZVVUbQdQs8OPdib5rJOCWE8/d2GDYtkj8MflOWHAm9QzjlZXnwdrIGskQge0si0NW4iTQ1jSfq74zHy5cPibJwezoCtMgGtGsf3xtaBd2RTNrgEN3sQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:25:26.1300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1166b83-80d6-43eb-f029-08deed428f79
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR16MB5023
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OSBTYWx0ZWRfX11hIHsP7SmM9
 JXq9vUoc/52abTHiEqkZNqFL7jtLn8GMNRQmAExmOoDQ8yPbonNLvGCgwNGQ/HwwWAC0tf72w8I
 iZ9Gj3bCjq+wIWuBTVrCq3X74Dty4wYvXEfLi3rvmTCozejcrSpk
X-Authority-Analysis: v=2.4 cv=IJwyzAvG c=1 sm=1 tr=0 ts=6a69aaec cx=c_pps
 a=vcXwJhCbSog8BousImPcCw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=zy00MwZ_ieCBTVMzpBcA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: uyqlXCRuK_rvpiDsr21uDrnISckGQtTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OSBTYWx0ZWRfX08K/5o07IqH/
 jxsbfO2Ua20pRaIitmF/zyUcDjpoKxihJvcDlNUhgJcV0AvcEyj3IQTbOJbHqnWDJKqRglEQZKY
 Q1VILYC/atR9Nbb9/YsQDyZtM/CChMnMh/Sw+/qrhRmi6sWswELJMBG4R0casTIaIrf0BZDQfXZ
 zFwLuJSfA5oK8XmKMgV6oJmBzMZd6FX6cA9ASwb45FIhwiQKJfBwZOCQfAIzC2bLDicEm+PD45n
 CvaOtKArAz6dXiG0ZnnT5j7eb0YvAa9ydwfnetGQVDIKQ1TeoBV4ViV22ctpxu8pAySouoTeQ6t
 V0pte0KwdLDn3C+7691m9cMxIbj5Q1P/T6LekFbrrK5jInE6iJzR0bFisWjoXm+XmhpJmQ3fEEI
 e3BvdXXyVEVPlFDNhNRy0VimSWEl0nhKPRsEt6A+wrOMaap5b7Keo4MlHZQVTJo/ncX//gDfUD4
 rGt1yrAhPDJ1kenT7bQ==
X-Proofpoint-ORIG-GUID: uyqlXCRuK_rvpiDsr21uDrnISckGQtTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290059
X-purgate-ID: tlsNG-16d1c6/1785309934-F70C777B-79C54F1A/0/0
X-purgate-type: clean
X-purgate-size: 745

The series introduces compile-configuration for diagnostic
messages rate-limiting.

Patch 1 is a fixup for the rate-limiter to adjust to user-defined
rate-limiting parameters.

Patch 2 introduces compile-time rate-limiting controls.

[1] v3: https://lore.kernel.org/xen-devel/20260715201902.2984407-1-dmukhin@ford.com/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2714300378

Denis Mukhin (2):
  xen/console: correct leaky-bucket rate limiter
  xen/console: add build-time rate-limiting controls

 xen/common/Kconfig         | 36 +++++++++++++++++++++++++++++++
 xen/drivers/char/console.c | 43 ++++++++++++++++++++++++++++++--------
 2 files changed, 70 insertions(+), 9 deletions(-)

-- 
2.54.0


