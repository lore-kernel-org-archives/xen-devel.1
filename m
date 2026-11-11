Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F7606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=XRXTwEU1;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=BqgMNSUZ;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=o42YIRC8;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Is4P7mNz
Received: from list by lists.xenproject.org with outflank-mailman.1484811.1688181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJp-0004ly-Pc; Wed, 11 Nov 2026 19:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484811.1688181; Wed, 11 Nov 2026 19:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJp-0004lm-M8; Wed, 11 Nov 2026 19:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1484811;
 Wed, 11 Nov 2026 19:49:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJo-0004ek-Sa
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJo-004SZD-8x
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:16 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6bc-8faa-0a2a0a5109dd-0a2a4506e502-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:16 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6ba-195a-0a2a45060019-94a392174e14-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:15 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYOfw3902278
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:14 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvtpxthws-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:13 +0000 (GMT)
Received: from CH5P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::18)
 by BL3PR16MB4324.namprd16.prod.outlook.com (2603:10b6:208:33f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:49:04 +0000
Received: from CH01EPF000BE947.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::a4) by CH5P223CA0007.outlook.office365.com
 (2603:10b6:610:1f3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:49:04 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH01EPF000BE947.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:04 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXafo080712
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:03 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htprw4x1p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:03 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJYxf38fQVyyREJYxG2hd; Wed, 11 Nov 2026 19:49:02 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=KZ4
	kuiQbR7ytGDa/ITuwsTW63qYCKcHw+T/lUr/s4eM=; b=XRXTwEU13Qp4PqoHFRB
	cty4Hy3TCb1EzXuZA43Pe89FO3WQ4TwFj/8/j89/I5UMujDNUiwDm/rKg1hbIZUT
	saj9fyHgX/Jh0R6H67lRnD2VmHFfnNoqbBabjNQYgy+zLlmJcoWfAaIt5X4eXdYc
	cLE22GH3IRjaK3hQWKSGnuyJ8pBF80eQnfOjthCsXJNGp3QtSOjxQB/LEsAhLLR1
	FiT0ENPfEgc1+ut3gei9P8aHhXu8r60Qkjw5WEDg+5rHH4fZq1+nAUH5/wcG0wnz
	KD99+BIg8OXcdHPq+txe4uAWpZQcgJAsio6R+u7yKtRshwVwsarOd73RVNQbW7uI
	SHQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSR2g3OO8KVc8SONIPPKk0ggzcY5god7ZZhwWnoUNJgwBgJjkxDBEfMq+Wmw3gx+WI9pzgFOAw07MuCvj5WOGHGw6IAz1u95kTSMxOzpZQ9Me/zqR5MXg0h8dRYx9rUXtMMd+Ar8D8t6HSgR1Dy5yflle/W+7JjZQfMpFQNdC5LmmvA/NHGAkVPR2zKIl6740B7HRvnJRHtc9WcZ745rxnY5fAnSG/FlkO3oOkKZNLfgtRKiYOlPaTGk2lcLmJcBaZVhLbiMb9tyKwmCLI///1CbSyZCOOwweK/WRea6hZDNh7YwjkZha7pa26Kx489eI92lQYcL1AvnbJoXLQZNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ4kuiQbR7ytGDa/ITuwsTW63qYCKcHw+T/lUr/s4eM=;
 b=pIMN0WxYJq0taPrzftMx57PMZSfWlm9wcGhr30c7LKjLpjccdAgurSayXVPT2bGKll9dkShxM9s0MdKStmFz9TS/qkeBcyzPIjEM2F7UVo2+1pbohrOhhiZAaHznscLTYK/UG2Uq9V2dXDPeaKaZxlF5jdodihworWi9umn3jXh0Cey75fUOkLu39gIfib6HrS5fGQBDA+EllcGwmlR8Ja+N+CKfA7lTbA8qpWjpG9rLBb9R58swvBUkikE3rhJA2Cd2iSUcapDlet3Ps0hVYenZdHqPXFH7aU1/TGUXH5fWLpEWcJiIbLbA+xdYT67DMhGwpXP0sCeZJoifQeU6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ4kuiQbR7ytGDa/ITuwsTW63qYCKcHw+T/lUr/s4eM=;
 b=BqgMNSUZVs4/FA7Ms7Chgcw/dRge3w7G9VZvlN/6cEAXkU32mlJzaAc2fKqTLxSXQ6ZavuZNpECXC8Kp/+sYS5PvDH8r/RD9cymXpPUiUu6u/l745jVAOFdelhNchgOgL2XXmv2obDRzAchSqw2elDCAehu1d9Y/SyfRCA+b1RQ=
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
	ppserprodsaar; bh=KZ4kuiQbR7ytGDa/ITuwsTW63qYCKcHw+T/lUr/s4eM=; b=
	o42YIRC8T2TVz59DI7I3PA5C7WlNzHssv8yohC0ziKywQANeUmMmpa0vzWh0bi8t
	oLgVMFlLvaZ3WyU7e4deva5HXeO4mXrQbPbTKd1c0iC0tr0uff+f8M80SRKcoBwk
	GGHUQrRDcIo9pPa+FJbKuzzVyj+0OEvnTJcDQQTTw2PdJhM8gBIWe2g8yGsZJuCs
	2Bkj3M49K330nx9PRnBklC4RgiMDBwujObayzoW3snZ0fK+i80zfZ7m+YMLKYz8W
	offpW5qliFTdxVbZ0ThuGGlRLo4lO1XvjV5Hi9RHbcCBMvmB/0YpCUTIpaN/fin4
	7vBU/vpiqqWjqZl0fviTTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=KZ4kuiQ
	bR7ytGDa/ITuwsTW63qYCKcHw+T/lUr/s4eM=; b=Is4P7mNz/hTfms10G5PRHBT
	tqB4Fqa5BWfY4rNUDCuwUtNsVRz2Ap3CZYKtkksZuIYMeNFa1Id/HFynjg3A4ypv
	LgxGA3Spg3D4WGrQhL8NYeFNWp16g6PAVd6IexOBCgq22YNv8Zt3ofDNxZMptlq0
	Mt1Byy7fLoPqjUNdQoUToubRldtLOhpMeHj2iPQH4IckeGFjupet6/3DSGeR7S37
	Fr8rTwWSZZXXG/u8icCCTx4ULosxlhvs8h6/0Su+hb49RvSJiE+NO6EVteNY7jW3
	nSahJV0pB9d1NH7bkO0h8Ny0SrFbO560SWt89hOiI+BX7DRZzB164T8mSaJ13Vg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJYxf38fQVyyREJYxG2hd
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 20/26] emul/ns16x50: resolve physical IRQ sharing
Date: Wed, 11 Nov 2026 11:47:54 -0800
Message-ID: <20261111194800.1070016-21-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE947:EE_|BL3PR16MB4324:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b65491b6-73ed-4d89-de0f-08df402cd720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	TJD5zl7VaPn/LCqFXu7ADKHRawXtZAjl5kQuH1XtzJRnPiPOqlSpJhXLHcHoHBqSFVHgvWvejXHT0tWrWVr86Zf/3Pjxd2tVUBeMQ+TQ8Ks2Mr/niHFcLg+z1jC8eqXPqSvZEymukbW72XpctgwSp6LSXS4sZQ8K/3zSyy2WwbgqKxPuIZqHwSnxoRGtwfwQZDvxT7viy6BDfRJqhamqoM6064Qpwk9Jv9uOW2A4rX3CEA/hguWveOuYVPMxnMcM6R9p1AdF9MFM2svAV+CHWIfUmcBTikqZi/rfANoo/b9rTMGAqd6zM6LUwf/DHBe4P/QA7duDFkHsrWJW1m9KCcei0+xwWCBm91TN9dnT1QJXrs1mrGDI7kwz+lDvDcHEXhwourvKoQoGc+N5FMnk5VzsQQv/J3Dknlm5cm4XFTtISLuEkrEFgOp8qLgKaoXMs+ORkh2qacEVgiEgZYZ27awam2JVmX9NbIjzCaKQ+7WJ4t1Mb4CtzmAHi4YW7rXdgB7EmU2YJN66yrwel7x9dAZNSz6ao54mugXJJYpnjgAGI6pbDSUC1dUVKFw5tYrGNISIrbEzJInp0m9ryqZlXfPntMcZAq/fGudEKVc0lzhvtnP6WSOrAIoQ/KEHiqQv3NH7Akdv5GTz2oApa5M6iIlk1/p+NHEXXsScjhCcybCWVrA7kqb0ny/ue6jTget09XXuh8E9ItpW9loGwDUoyA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eltd9tr8rd/NZcUTVgSYIdzOERrExCW3z5CgiMZb4/cKpPCRtCPMmt6Mbh5ZTnY4GgMEh7H/D+yIberY5E9U79HjSUExU9w2eBSXEmZgz/NiAtimkDJ8zycp6CEKQ/g0Iq2sc9A+Cut8Dggt2JnEkpVVfyXYQ4JzP7cIH/yQQN5AK1SbCNvrKCVg0pr3yO8MBRwihpAg3+If4nP7s84Ke8bMChCuIetaU4eKozremQs0u3F5KouS32XjgvAQ0wLYe1iZp1QeDFIyC8WCXM+ghR5IARu7ntT6r/AtRamjshbaUs68hiTleTztA+fMtOkkSi/5/wYOPzIeHajU4z5Ns+r2yp6nq7gEhbo1Ezt6C7T19td7+I7owaAUsUgfH+pW49QrtcCWtl22MBRxyjfBYQYht8/bLJmpHUl2EIb0jqvSSHDOG7yNpqbIjt3OB/+i
X-Exchange-RoutingPolicyChecked:
	u0mHx5FsXoW6n7rodjh8VfjftxdTJIU48y2beC9SeVLmko/pL2u+hf/niNDqPY1rRJqPjpyyqYL/EpTqCVrjwnf76yh3xTn3KBA59C/xbYJrBKfBzsnEJK8/f/fFCykL9uR/LhoOhY6rOjpYVbP6bUlmwTSe/zdO48lpwEaJiZfnnXOuGgxlp68rWE+TyyI490AdxA8haeRBkeLNzU/qsy6UceySTLvRWZWwXcV5Cwp/C49DDQN18yAxYQu+57eGUmbbb/SGoD2L+Po9s0NJt63FLPmrYZigTHhVmF8kB/h75efvic81TyFG26KKlo33iCd6p+AyNHNgaL01tK3uuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ez5zoHpsLnvscniOjYy32u7R0eWQZUXjXoRAZ0gf0LTVSNr+BhqBJ69VkbhmXZwS1I6Y36L2tGEH13J1R1RsvPxmDYHTXOT3sp9Xed5bJBB3s/DVwi3yzSnYSENAsVUi8CneClmn08mhqqS8yjWVjYrTt4i4/wV3tnmMaSKXfLnBxJjYI48h8wbtNlcz4xXZmFWDJdomTwC2X8kC+5XcHmjZ1QMsL2r62VmKpfFlLyfajUdC31HEcFnRCmFWR3OQ8U/WOV66Lg1/etky4RFjg45B0al5wo6ylxR80mNrm1LVjXkaN/5JftE2NlVOeqxHe2zR84u84e5LvcYOt/zRivbr4vixf4SDPPLiGInbKkRBOk4am7quXa3fw8KNpMqJiDpFeYuBwcMB5J7nFp3Ash2OgPJmSJqbyvH7alqX1Bm08DP34hDtwP7nr5o+fySgZGvL8GNbi8heMCGrrkRH6ZKZLMKArgN70heimXn0ZTozIENSGDdiz2jZzYy5WGVvshLjD0NSFuxu5cufyxOhJ4QaEHhrqycUYjcqJLiK0QorA9iSzYsdHYXiGluxhukXuwDamM+mgePXM7HnV19Pktd8X1CCG+howUUQF7cuREWsy3MMkXUA+QsS+/YDme6GJvnc3L7uHY2gLTpbZbpq+g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:04.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b65491b6-73ed-4d89-de0f-08df402cd720
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE947.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR16MB4324
X-Authority-Analysis: v=2.4 cv=V6XoQuni c=1 sm=1 tr=0 ts=6af4c6ba cx=c_pps
 a=4hG4CnY/eg4LDOVkUp5rMg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=acu7kb7cyLXGldajIxcA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX1aMpFeHXow2f
 WXAGqBbCzI03/MWnKAefrOjHIt/bc96LySkUbrOl/e9w7O00RdFuaJBwxo+b5Gj8BgIZ5nyJ8SH
 3gZKqqR93ZoT4n88hF/LsGhlm7MaagMqi5YOzRSkDChqTBwRpXGG
X-Proofpoint-GUID: YKuqkxaczA--FU4JaR6H7NQQzq32v9Jz
X-Proofpoint-ORIG-GUID: YKuqkxaczA--FU4JaR6H7NQQzq32v9Jz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXxWZ8CjPkefUv
 fYYq3KbSDJAPIrr5PEY3WxeyfrvdKyqjgxTaTK8PT/w9uWQ3L+bvj9owK8FgLiX+mXeB9+KczVY
 ibUThC+ZCS1Y33c4KlsIOwzB9US7H/85du2cIcqUt9qzbKBpZ2GMm8E7FrxbtVqKFvx4vfQ9Nds
 kKGwiRXdwaHf7v8xekjCNM4HbxN91KDDDpMawKXSDsUSose9RO7nxCd09k1frET552VJCPob51H
 f7FNIJSxcivv9q3pV4veb0bHz/WFYT5mK/8FA4WAJgfiTdpQS+AP+T1nRhxroJPkaHfN3/5Qr2P
 XQLX7wSawSBY4kTocZAvqyEYiXYHa1TcMA+Ahdp485xM8yYUYov2eJXnk4DMZeewvMGrdblkdLr
 HylSRdWhX6FEIokJkfKpy6J10adRK5VXQGaFdJi6glMXAeJqnJSNrr5HoW1vR1BDn37KfGefbIb
 WS8eI4PlEBchwz4blvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-16d1c6/1794426556-FDA0C77B-CC7ABEFC/0/0
X-purgate-type: clean
X-purgate-size: 994
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Make sure that NS16550 emulator does not share virtual device IRQ with
the physical one. This is needed for enabling NS16550 emulator for PVH
hwdom (dom0).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 97e12a99368a..389c58f94198 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -931,6 +931,17 @@ static int ns16x50_init(void *arg)
     else
         ASSERT_UNREACHABLE();
 
+    /*
+     * Disallow sharing physical IRQ.
+     */
+    rc = irq_deny_access(d, info->irq);
+    if ( rc )
+    {
+        ns16x50_err(info, "virtual IRQ#%d: conflict w/ physical IRQ: %d\n",
+                    info->irq, rc);
+        return rc;
+    }
+
     ns16x50_reset(vdev);
 
     ns16x50_irq_check(vdev);
-- 
2.56.0


