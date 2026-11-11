Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6D606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=JxURvFoR;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=YnDvfnjL;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=HQ1NdjQQ;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=FKkj//qG
Received: from list by lists.xenproject.org with outflank-mailman.1484790.1688163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJh-0003lz-Op; Wed, 11 Nov 2026 19:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484790.1688163; Wed, 11 Nov 2026 19:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJh-0003ld-KH; Wed, 11 Nov 2026 19:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1484790;
 Wed, 11 Nov 2026 19:49:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJg-0003ZQ-1H
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJf-00BkX7-De
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:07 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c68b-e002-0a2a0a5209dd-0a2a450191bc-30
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:07 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6b2-5984-0a2a45010019-94a38ff16120-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:07 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYaQK3992187
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:05 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013009.outbound.protection.outlook.com
 [40.93.196.9])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvrf7v2cf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:05 +0000 (GMT)
Received: from CH2PR04CA0009.namprd04.prod.outlook.com (2603:10b6:610:52::19)
 by CH3PR16MB5899.namprd16.prod.outlook.com (2603:10b6:610:1b0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:57 +0000
Received: from CH2PEPF00016D48.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::9b) by CH2PR04CA0009.outlook.office365.com
 (2603:10b6:610:52::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:48:57 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH2PEPF00016D48.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:56 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZZk54131341
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:56 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh28ufu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:55 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJQxNOCZvYgUREJRxeGAK; Wed, 11 Nov 2026 19:48:54 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=uZF
	JVSc+9B1qz4fvopj2fhW//NHQPX7TvDmsLK5mzvU=; b=JxURvFoRSUODo3vaLAS
	Rrlu8za1nul+6iMIb3eIYRlrr9KQDjZpRbddq/30LLTXXWfTQstykOZJzdtdyWKd
	v8Y/104n1SXxDZ7CKya394dOJB+HFdreBq7oV1TiT9tJbZOhQeoyLZBDo81IonNM
	tMB0zTvdCiTtGM+GC74bKrAHdCi6PL+ce8B67evsMXqqahub53Qj/8ziAbvHus+a
	j/T+ASY3gNgxbqsSgOhdowzenZTjLs5JBa5b7FCCk8KjF1VYRDYz0SkMWRJXMdpu
	PafaZXm0TX5gZ01ee0Iysz0Q0T3iICsTP7C/MNxisf2L0lPAHj1ihLQF6Gtg5qgp
	dgQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkCA35sS+yl/dUBqW9CDCQfBNpyEUqHRqWIJBGTpxyLkWzC9djfkZGddHxzAIESqubM9WCc02/YCRHxzvx2uO5rIqX1QlVCVQPfm6AUkziYph7NyXdt07cEES0Klj+44+z5+LQMpOpokGobaPu46reUfnrrmlCwoe5wx+ytJaQvBx/LXVKG0Z+EOydHrUthH/wcKk5xCwwf69hMeoKy48iB3imDGzRMUCKa52wZR1hAfbv0e1CGqxPZbClwguc02MLkdtUZOB9UOtuEFMxAYSvTxsrUxfXUznTAmEAtOKT1sR1xwdgkchgJDE5BRGPGWsApVJ/wDXq4TdgpiSVqc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZFJVSc+9B1qz4fvopj2fhW//NHQPX7TvDmsLK5mzvU=;
 b=UAOwaAlXUOHmq6VLedntyKSwUfT44uvuMdsRNt9mQDewb+IGyioDGsECy/Ug7+KcQ1zboRG9oVPQVdxPPYG1ssmZuOBOt8TqXrIdmHP8QRTgDKJQSlbsgYQ4+4vFq1oxVCYyAEs4USD3Bp3lc2US6vK+lOUy2S117eYOcWpBUpnGBi0yuAkJL85RgKsuiNXaV8X89zlY8PuJAapjdAw6oGJs2BABHukFO46YOeGXcsCZTGXKjwMTPqllRYC+4/1QDEiSeJEjLZlcHwkBckf/Zsw87NQBiPycfh30P9SJEkiEZ/22+D6la/KKzU79q++Nb3blRKrzvkLh+8cV9qqS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZFJVSc+9B1qz4fvopj2fhW//NHQPX7TvDmsLK5mzvU=;
 b=YnDvfnjL0uCj5ZmvMfGXAtKkl11pqkhC0jHxBBQ5fOMPNg0mCEAmhcP7oKZux3YDHK7eLm68xibs8B+GJ0qNg7GkxYXsLY+lbSFmugVK0PPWoOSZiwdt8bm/TeTeiqlj7Nx5ylRa2bJpkg8GhHLedInnV40odsIsowInEUZoJzM=
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
	ppserprodsaar; bh=uZFJVSc+9B1qz4fvopj2fhW//NHQPX7TvDmsLK5mzvU=; b=
	HQ1NdjQQdLUbanXxYvo1HOekQJHbiKqSbH//FCqdMARdzyhC/7nlB3s57OCooKrP
	WbSrPvmKTLA4QqzF6J1zwdxh7IQ/ZvMSs+PvHpQat/prNOyDI0aGI2Tz0Gn3F5Kk
	vIQQVUJ5c/pUJOpGWjtqRrn7tJEtV3gOkhik0aoRS4NLOcebG5m4kU8IcYrwzWHW
	OLetsGQ/yvCySLTpme5WDVLAYB93+tgRWBZB2s02UJRmG4wPkaQOu9KSjPjpggEB
	0aA+4qOz6g4I+zyT6J99tk8SyA+dn1JcJabSNtUZlqiisgQq68vdNCWr0XPTKoYR
	Xp5jcJPongzoTfSFWc+90A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=uZFJVSc
	+9B1qz4fvopj2fhW//NHQPX7TvDmsLK5mzvU=; b=FKkj//qGuejdP0aS79FwaQX
	dUnQVUxLkU+3gGyUbb1eXk5TrI+8/+3B3R6mdUJAREiDPaRYmNMsau3bcgU/vDRk
	p9jzTBtTPGJwMCx1GxCSGWIoS7UWUr6xxLcQAIOgm/egLOKykPL7tR7gUDigRyPm
	IrD35sG0b0VVAcfmLtTn8vwFUcUqgrR4EIVI/M2Y6ZnypnnHQQ3X0y5/AGyaPMKc
	tHz9x/DG4l8KzdXhF28GxD2IjTcV5GZjrd59iN7sXIxiZQgi7M/Ql9Nue7DuQVlW
	jvO/PGq7O3SZvfDEruQFTaRtAVr9BZOuuNLSyCkLCykqqafRUpKYmUZe2us4oaA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJQxNOCZvYgUREJRxeGAK
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 17/26] x86/domain: enable per-domain I/O port bitmaps
Date: Wed, 11 Nov 2026 11:47:51 -0800
Message-ID: <20261111194800.1070016-18-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D48:EE_|CH3PR16MB5899:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5420dbd7-0dfc-4a5d-ad19-08df402cd2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|3023799007|6133799003|11063799006|261026121527099003|261022115727099003|261022105027099003|261026140227099003|261022075727099003|261028144727099003|261021135927099003|261021123027099003|56012099006|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0u2vB8Urg51pQCGXpG9TtnJidgLjeaWkzpnjH80DCg5vohoBdbDftVIPB9y6JYRjr0U/SKDADNQ7a93AoG0szm3GAYQR3eLFVzfo8ObwyIx5j88Pn1xUlAc+xETzgs/FzjIjWwRNx93YzrmA0lCUXEPirATMSaISLkvd6y+q4pNTnjwo6jDT4IkOqsXmyxWdN737RPXSCGDkDZlfYBbiJOMYUsRFC7t8STAEjR+kYMM/aGigRDqfGsT9EfukxmYo/JyisMuN1f4NrnQ4QXpWE82ZQ27JSnWd6kqt3x1KB0XUUDJVOZEPKyHVHY6dyfTtXgxA2bsiJ6mTP14mtPc/WndJcRI+O7+Lx33BHmh5f6iwPiBh6kouMuqwSgP9+kVueT58Vo9KXJPFGhBBZOgnqA6jyi3FuAuxHZwt5UrYnXSvJNck/tMJig3A+FbZICwryzPKyCRvoU1Axhg70QLi+N7rUW9TZpPnVPBArrhSOGeB2BwL7oebhETjYWl16hOOjvQw/0roey1hd3NxFnX4TOVNVZzxtvfmxndCncLwVvVwkJIwkl4ig2+cLBiQeqImTdodt52XVHufkUewvHDyJ7QV9ucVsfnV2l4bJOECOm+l1jY2XWKCeIDlWgIRpghVMDi7XWeZIf1S6o8NU99BsMqpKXkkf9EXsT9yXOp47GHKDRxiIBl4o6IEZfzvu9w6qYLahIEkzQB8fQDVL7BL/A==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(3023799007)(6133799003)(11063799006)(261026121527099003)(261022115727099003)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261021135927099003)(261021123027099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hxyMi77QJyIbKEungo/ia+KVNtR0B4mXS+Pa+kWYI6jI7C+Rc1zBA2RSaymEHrHTHLQOQFEr86zjqddpEcVHaZerNRCRSp0e1hsgRSEmxMg7lohWJXAg6Fsuj3ECz2w4Y1J/NA2jPk3hLrCJcGmJNXQ/jS2nKy7hYzRq/5yabo9otRFDS+MFiM+KwNa0qdAdepg8QfTM80hbrRymLBjXZ//u240vK4WcQde36huBQFYYrA6PMe4yn28oV3jR7pgP67edOPRdy7soKyaGBqoer12b4K0QSYynZuWfTu0dbn8m2o5g7vzWAF85QlVUIXaRBSyFuqUrJVpIVJfuNN+s683zak4o8XWXFvMtuu9gccmkrYOPMJar/Tf3Y+sKv3ufjHBtGqFS/0EDYr5ir5ojTBVYNJL6jbZ3NaI/xr5NEmByzHUvyGOkiB77c78B42Yo
X-Exchange-RoutingPolicyChecked:
	yMgtzZaGFG/PiFIzbANEGSQx8O8K4LhJ1UA6E2nIosognEBv33uiMcpDR0PBwFrNrcUfj9Y1jWPEf411qqNgRI7n7HePl2Re8AiztPEpl3B7IVpl86PZonx5Sy3/F6MNzumUjiqZkr3yjPCCcLF9M0rZagPXcDhJ35pUzOK+9i0wlgYSBzcb22eTRE2R6B9eF8QJYHsyVM46eTOwH6UMexKlYWTfJrX/+WJGHiMnHSTi6nsxVpON7IdsK51eU0q2gluk/e3qAYzoOriX000msEx5f68lkYioydfww/6D0fvsKcCxOJPxTZHjuz0WYCMVUeonoKsWuPfwvkU47avKtg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TzbYQBY+yTvxyFC+W4eeWABADl1mZgZOdD4ZfDMYFreur4wddtYMTSliCA1ikLAkSYfBcRal+utZvJNmQ8lcTiisfK1QN43/3ubwxVpehIYMXyrwnuQ9jSlK3ppIjck5TZVEWqprZNX0yXGOmqcMUmDfJs3VhNm8t2v6N4eLbuNrqHVJ+15z6DdOxu/p+yPixttpFCxJHEDPFtwWVHHaWwLKfYjK6SnDpYzEbev7MKJcMmphxIr1Mhvm7U0rr7u3joSlLUdjfLqzwe7IZuz3gOujwk/sKWwz0WcVWd5gm0y7DyLEeHcLVupw/Ltoe7irRhU/2uPi5UPIBVG+S/Q8zunmCLZYNHi9yQtjZw6DJVLF7702paSQFY+SKWlfYlXWhgfhMbxioNOOElLfn0XzUPu4/3BtKDsruiPXjHMr5io7ObXxd7JDBDS8Q8nZAc4ClpAIZ0DGYv0mP53Omc0hvPNw/6nYy1iL8jYbGrp4BcCVfGZUMKA7nGPxc7WHeGkoHmmZQgj06+JoZVsYK+xHJ8Xs743+cZUavgIbAIw19Imb7a9GdBOt33XSveeYtMvv83Md5ohoxdQx/XxAZYpYFqnXolcLq/lepgbQfi5bRDfXqfoynXb6+X8+thEbBlcMUNmrS/t8FuD9NhwGNTxg6w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:56.8503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5420dbd7-0dfc-4a5d-ad19-08df402cd2e3
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D48.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB5899
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX2BdyWey8SdYM
 bc5CptSENJM7B7s+nyAGm6RibEwfWvHza3pfDqYVhgW6yMH5nnmCMZUWPoE2Ngkdxv/X1SDiDZ5
 aSVPx1APzohyCqXBh9y8Glo+NNuIbWrd9EiqemoUutqVGZ6zazlxdZlwi9c1PZJbzIR1/nGW8+z
 lSpS3Bn/XVS0ow5FjSRX4gzuURT+DdURMqDq/zAfasITXZ5OkoNSriu42lT18XJGFgrbs4EGyZo
 5OL4Y3QLYuZQt+qd3kPi618fTEsJ1WbW4MtQ2fcLq6VQU9j9TycvFzoLWjd9VPbfPNtD4szbWko
 7jetogsDNhS+0ABLdg302tVytoVJgSY3ei8Y8JL0WGgTHO/lw3JuO3RLd2j/sCAOzzT9pHV9WLa
 MDedSm4GL44OJc1ryMbCdQv5/LaON1EM77dEviFqb0s2uZlKozjW8bj+C9RFpWPFPCYkv/TsHGs
 ArREgpKD5gYZObYLs4A==
X-Proofpoint-GUID: AD6xXUw7_WHMmJTfoXJ46eKqJS_aLq1t
X-Proofpoint-ORIG-GUID: AD6xXUw7_WHMmJTfoXJ46eKqJS_aLq1t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX6XV05oVhrim7
 Vyv5jvSA8vh5TdtRotLBJ17sosVka9XnMmgwjD7m6IVLQBRdDeES20AFyeWE4R75U9Gz6GryEHI
 4usxZLArGjf4GWqgWNStIJdywqNQSJhhUuhrhv+lpvHCoqssrU+2
X-Authority-Analysis: v=2.4 cv=Ed9d0/mC c=1 sm=1 tr=0 ts=6af4c6b1 cx=c_pps
 a=bZodHm7PKOcb5V0TIM2Mhw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=YKKO-a8TvtecBdquuQ4A:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-d62444/1794426547-BC95A757-ECBEB28F/0/0
X-purgate-type: clean
X-purgate-size: 20199
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Current design enables all HVM domains share the same I/O port bitmap.

It is necessary for domains crafting its own I/O port address space
depending on the user configuration.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/Makefile                    |   1 +
 xen/arch/x86/dom0_build.c                | 111 +--------------
 xen/arch/x86/hvm/hvm.c                   |  40 ++----
 xen/arch/x86/hvm/nestedhvm.c             |   8 +-
 xen/arch/x86/hvm/quirks.c                |   3 -
 xen/arch/x86/hvm/svm/nestedsvm.c         |   2 +-
 xen/arch/x86/hvm/vmx/vvmx.c              |   4 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h |   3 +-
 xen/arch/x86/include/asm/hvm/support.h   |   2 -
 xen/arch/x86/include/asm/iocap.h         |   3 +
 xen/arch/x86/ioport.c                    | 168 +++++++++++++++++++++++
 xen/arch/x86/pv/dom0_build.c             |   4 +
 12 files changed, 198 insertions(+), 151 deletions(-)
 create mode 100644 xen/arch/x86/ioport.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2be90ea09880..749b70444bb6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -42,6 +42,7 @@ obj-y += i387.o
 obj-y += i8259.o
 obj-$(CONFIG_INDIRECT_THUNK) += indirect-thunk.o
 obj-$(CONFIG_RETURN_THUNK) += indirect-thunk.o
+obj-y += ioport.o
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += io_apic.o
 obj-y += irq.o
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 80308ca9af46..e8f783d533af 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -298,9 +298,6 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
     return 0;
 }
 
-static char __initdata opt_dom0_ioports_disable[200] = "";
-string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
-
 static bool __initdata ro_hpet = true;
 boolean_param("ro-hpet", ro_hpet);
 
@@ -445,122 +442,20 @@ unsigned long __init dom0_compute_nr_pages(
     return nr_pages;
 }
 
-static void __init process_dom0_ioports_disable(struct domain *dom0)
-{
-    unsigned long io_from, io_to;
-    char *t, *s = opt_dom0_ioports_disable;
-    const char *u;
-
-    if ( *s == '\0' )
-        return;
-
-    while ( (t = strsep(&s, ",")) != NULL )
-    {
-        io_from = simple_strtoul(t, &u, 16);
-        if ( u == t )
-        {
-        parse_error:
-            printk("Invalid ioport range <%s> "
-                   "in dom0_ioports_disable, skipping\n", t);
-            continue;
-        }
-
-        if ( *u == '\0' )
-            io_to = io_from;
-        else if ( *u == '-' )
-            io_to = simple_strtoul(u + 1, &u, 16);
-        else
-            goto parse_error;
-
-        if ( (*u != '\0') || (io_to < io_from) || (io_to >= 65536) )
-            goto parse_error;
-
-        printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
-            io_from, io_to);
-
-        if ( ioports_deny_access(dom0, io_from, io_to) != 0 )
-            BUG();
-    }
-}
-
+/* Modify I/O memory access permissions. */
 int __init dom0_setup_permissions(struct domain *d)
 {
     unsigned long mfn;
-    unsigned int i, offs;
-    int rc;
+    unsigned int i;
+    int rc = 0;
 
     if ( pv_shim )
         return 0;
 
-    /* The hardware domain is initially permitted full I/O capabilities. */
-    rc = ioports_permit_access(d, 0, 0xFFFF);
     rc |= iomem_permit_access(d, 0UL,
                               PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
     rc |= irqs_permit_access(d, 1, nr_irqs_gsi - 1);
 
-    /* Modify I/O port access permissions. */
-
-    for ( offs = 0, i = ISOLATE_LSB(i8259A_alias_mask) ?: 2;
-          offs <= i8259A_alias_mask; offs += i )
-    {
-        if ( offs & ~i8259A_alias_mask )
-            continue;
-        /* Master Interrupt Controller (PIC). */
-        rc |= ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
-        /* Slave Interrupt Controller (PIC). */
-        rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
-    }
-
-    /* ELCR of both PICs. */
-    rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
-
-    /* Interval Timer (PIT). */
-    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
-          offs <= pit_alias_mask; offs += i )
-        if ( !(offs & ~pit_alias_mask) )
-            rc |= ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + offs);
-
-    /* PIT Channel 2 / PC Speaker Control. */
-    rc |= ioports_deny_access(d, 0x61, 0x61);
-
-    /* INIT# and alternative A20M# control. */
-    rc |= ioports_deny_access(d, 0x92, 0x92);
-
-    /* IGNNE# control. */
-    rc |= ioports_deny_access(d, 0xF0, 0xF0);
-
-    /* ACPI PM Timer. */
-    if ( pmtmr_ioport )
-        rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
-
-    /* Reset control. */
-    rc |= ioports_deny_access(d, 0xCF9, 0xCF9);
-
-    /* PCI configuration space (NB. 0xCF8 has special treatment). */
-    rc |= ioports_deny_access(d, 0xCFC, 0xCFF);
-
-#ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) )
-    {
-        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
-        rc |= ioports_deny_access(d, 0x00, 0x1F);
-        /* ISA DMA controller, page registers (incl various reserved ones). */
-        rc |= ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F);
-        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
-        rc |= ioports_deny_access(d, 0xC0, 0xDF);
-
-        /* HVM debug console IO port. */
-        rc |= ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
-                                  XEN_HVM_DEBUGCONS_IOPORT);
-        if ( amd_acpi_c1e_quirk )
-            rc |= ioports_deny_access(d, acpi_smi_cmd, acpi_smi_cmd);
-    }
-#endif
-    /* Command-line I/O ranges. */
-    process_dom0_ioports_disable(d);
-
-    /* Modify I/O memory access permissions. */
-
     /* Local APIC. */
     if ( mp_lapic_addr != 0 )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f4d2fbe75fc6..9f0e0f6d8c3d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -51,6 +51,7 @@
 #include <asm/hvm/vm_event.h>
 #include <asm/hvm/vpt.h>
 #include <asm/i387.h>
+#include <asm/iocap.h>
 #include <asm/mc146818rtc.h>
 #include <asm/mce.h>
 #include <asm/mem_access.h>
@@ -82,14 +83,6 @@ integer_param("hvm_debug", opt_hvm_debug_level);
 
 struct hvm_function_table __ro_after_init hvm_funcs;
 
-/*
- * The I/O permission bitmap is globally shared by all HVM guests except
- * the hardware domain which needs a more permissive one.
- */
-#define HVM_IOBITMAP_SIZE (3 * PAGE_SIZE)
-unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
-
 /* Xen command-line option to enable HAP */
 static bool __initdata opt_hap_enabled = true;
 boolean_param("hap", opt_hap_enabled);
@@ -206,15 +199,6 @@ static int __init cf_check hvm_enable(void)
     if ( opt_hvm_fep )
         warning_add(warning_hvm_fep);
 
-    /*
-     * Allow direct access to the PC debug ports 0x80 and 0xed (they are
-     * often used for I/O delays, but the vmexits simply slow things down).
-     */
-    memset(hvm_io_bitmap, ~0, sizeof(hvm_io_bitmap));
-    if ( hvm_port80_allowed )
-        __clear_bit(0x80, hvm_io_bitmap);
-    __clear_bit(0xed, hvm_io_bitmap);
-
     register_cpu_notifier(&cpu_nfb);
 
     return 0;
@@ -655,19 +639,12 @@ int hvm_domain_initialise(struct domain *d,
 
     rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
 
-    /* Set the default IO Bitmap. */
-    if ( is_hardware_domain(d) )
+    rc = ioports_setup_access(d);
+    if ( rc )
     {
-        d->arch.hvm.io_bitmap = _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE);
-        if ( d->arch.hvm.io_bitmap == NULL )
-        {
-            rc = -ENOMEM;
-            goto fail1;
-        }
-        memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
+        printk("%pd failed to setup I/O bitmap: %d\n", d, rc);
+        goto fail1;
     }
-    else
-        d->arch.hvm.io_bitmap = hvm_io_bitmap;
 
     register_g2m_portio_handler(d);
     register_vpci_portio_handler(d);
@@ -694,6 +671,8 @@ int hvm_domain_initialise(struct domain *d,
         break;
     }
 
+    BUG_ON(!d->arch.ioport_caps);
+
     vpic_init(d);
 
     rc = vioapic_init(d);
@@ -731,8 +710,7 @@ int hvm_domain_initialise(struct domain *d,
  out_vioapic_deinit:
     vioapic_deinit(d);
  fail1:
-    if ( is_hardware_domain(d) )
-        xfree(d->arch.hvm.io_bitmap);
+    ioports_release_access(d);
     XFREE(d->arch.hvm.params);
     XFREE(d->arch.hvm.irq);
  fail0:
@@ -806,6 +784,8 @@ void hvm_domain_destroy(struct domain *d)
     }
 
     destroy_vpci_mmcfg(d);
+
+    ioports_release_access(d);
 }
 
 static int cf_check hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 3205277e815b..5278b7223b5f 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -100,7 +100,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
  * The users of the bitmap patterns are in SVM/VMX specific code.
  *
  * bitmap        port 0x80  port 0xed
- * hvm_io_bitmap cleared    cleared
+ * hvm.io_bitmap cleared    cleared
  * iomap[0]      cleared    set
  * iomap[1]      set        cleared
  * iomap[2]      set        set
@@ -108,7 +108,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
 
 static int __init cf_check nestedhvm_setup(void)
 {
-    /* Same format and size as hvm_io_bitmap (Intel needs only 2 pages). */
+    /* Same format and size as hvm.io_bitmap (Intel needs only 2 pages). */
     unsigned nr = cpu_has_vmx ? 2 : 3;
     unsigned int i, order = get_order_from_pages(nr);
 
@@ -158,7 +158,7 @@ static int __init cf_check nestedhvm_setup(void)
 __initcall(nestedhvm_setup);
 
 unsigned long *
-nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed)
+nestedhvm_vcpu_iomap_get(struct vcpu *v, bool ioport_80, bool ioport_ed)
 {
     int i;
 
@@ -167,7 +167,7 @@ nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed)
 
     if (ioport_80 == 0) {
         if (ioport_ed == 0)
-            return hvm_io_bitmap;
+            return v->domain->arch.hvm.io_bitmap;
         i = 0;
     } else {
         if (ioport_ed == 0)
diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index 9202f5a47fe9..f4d95441fcff 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -73,9 +73,6 @@ static int __init cf_check check_port80(void)
 
     dmi_check_system(hvm_no_port80_dmi_table);
 
-    if ( !hvm_port80_allowed )
-        __set_bit(0x80, hvm_io_bitmap);
-
     return 0;
 }
 __initcall(check_port80);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index d970869cfd96..4fff8e65242e 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -315,7 +315,7 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v)
         hvm_unmap_guest_frame(ns_viomap, 0);
     }
 
-    svm->ns_iomap = nestedhvm_vcpu_iomap_get(ioport_80, ioport_ed);
+    svm->ns_iomap = nestedhvm_vcpu_iomap_get(v, ioport_80, ioport_ed);
 
     nv->nv_ioport80 = ioport_80;
     nv->nv_ioportED = ioport_ed;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a110..ef40d28ee874 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -555,7 +555,7 @@ unsigned long *_shadow_io_bitmap(struct vcpu *v)
     port80 = bitmap[0x80 >> 3] & (1 << (0x80 & 0x7)) ? 1 : 0;
     portED = bitmap[0xed >> 3] & (1 << (0xed & 0x7)) ? 1 : 0;
 
-    return nestedhvm_vcpu_iomap_get(port80, portED);
+    return nestedhvm_vcpu_iomap_get(v, port80, portED);
 }
 
 static void update_msrbitmap(struct vcpu *v, uint32_t shadow_ctrl)
@@ -623,7 +623,7 @@ void nvmx_update_exec_control(struct vcpu *v, u32 host_cntrl)
              * L1 VMM doesn't intercept IO instruction.
              * Use host configuration and reset IO_BITMAP
              */
-            bitmap = hvm_io_bitmap;
+            bitmap = v->domain->arch.hvm.io_bitmap;
         }
         else {
             /* use IO bitmap */
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index 8a2a0fbb3c38..5452e9e46b76 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -53,7 +53,8 @@ int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
                                     struct npfec npfec);
 
 /* IO permission map */
-unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
+unsigned long *nestedhvm_vcpu_iomap_get(struct vcpu *v,
+                                        bool ioport_80, bool ioport_ed);
 
 /* Misc */
 #define nestedhvm_paging_mode_hap(v) (!!nhvm_vmcx_hap_enabled(v))
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 9e9fa6295567..9aae0f4012a2 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -41,8 +41,6 @@ extern unsigned int opt_hvm_debug_level;
 #define HVM_DBG_LOG(level, _f, _a...) do {} while (0)
 #endif
 
-extern unsigned long hvm_io_bitmap[];
-
 enum hvm_translation_result {
     HVMTRANS_okay,
     HVMTRANS_bad_linear_to_gfn,
diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index f948b7186e95..3328b65345fb 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -22,6 +22,9 @@
 #define cache_flush_permitted(d) \
     (has_arch_io_resources(d) || has_arch_pdevs(d))
 
+int ioports_setup_access(struct domain *d);
+void ioports_release_access(struct domain *d);
+
 static inline int ioports_permit_access(struct domain *d, unsigned long s,
                                         unsigned long e)
 {
diff --git a/xen/arch/x86/ioport.c b/xen/arch/x86/ioport.c
new file mode 100644
index 000000000000..a4d046770bed
--- /dev/null
+++ b/xen/arch/x86/ioport.c
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Guest I/O port address space configuration.
+ *
+ */
+
+#include <xen/domain.h>
+#include <xen/param.h>
+
+#include <asm/amd.h>
+#include <asm/acpi.h>
+#include <asm/io-ports.h>
+#include <asm/iocap.h>
+#include <asm/pv/shim.h>
+#include <asm/setup.h>
+
+static char __initdata opt_dom0_ioports_disable[256] = "";
+string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
+
+/*
+ * The I/O permission bitmap size.
+ * See: comment in nestedhvm_setup()
+ */
+#define HVM_IOBITMAP_SIZE (3 * PAGE_SIZE)
+
+/* Hide user-defined I/O ports from the guest OS. */
+static void process_dom0_ioports_disable(struct domain *dom0)
+{
+    unsigned long io_from, io_to;
+    char *t, *s = opt_dom0_ioports_disable;
+    const char *u;
+
+    if ( *s == '\0' )
+        return;
+
+    while ( (t = strsep(&s, ",")) != NULL )
+    {
+        io_from = simple_strtoul(t, &u, 16);
+        if ( u == t )
+        {
+        parse_error:
+            printk("Invalid ioport range <%s> "
+                   "in dom0_ioports_disable, skipping\n", t);
+            continue;
+        }
+
+        if ( *u == '\0' )
+            io_to = io_from;
+        else if ( *u == '-' )
+            io_to = simple_strtoul(u + 1, &u, 16);
+        else
+            goto parse_error;
+
+        if ( (*u != '\0') || (io_to < io_from) || (io_to >= 65536) )
+            goto parse_error;
+
+        printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
+            io_from, io_to);
+
+        if ( ioports_deny_access(dom0, io_from, io_to) != 0 )
+            BUG();
+    }
+}
+
+/* Set the default IO Bitmap. */
+int ioports_setup_access(struct domain *d)
+{
+    unsigned int i, offs;
+    int rc;
+
+    if ( pv_shim )
+        return 0;
+
+#ifdef CONFIG_HVM
+    d->arch.hvm.io_bitmap = _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE);
+    if ( d->arch.hvm.io_bitmap == NULL )
+        return -ENOMEM;
+
+    memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
+
+    if ( !is_hardware_domain(d) )
+    {
+        /*
+         * Allow direct access to the PC debug ports 0x80 and 0xed (they are
+         * often used for I/O delays, but the vmexits simply slow things down).
+         */
+        if ( hvm_port80_allowed )
+            __clear_bit(0x80, d->arch.hvm.io_bitmap);
+
+        __clear_bit(0xed, d->arch.hvm.io_bitmap);
+
+        return 0;
+    }
+#endif
+
+    /* The hardware domain is initially permitted full I/O capabilities. */
+    rc = ioports_permit_access(d, 0, 0xFFFF);
+
+    /* Modify I/O port access permissions. */
+
+    for ( offs = 0, i = ISOLATE_LSB(i8259A_alias_mask) ?: 2;
+          offs <= i8259A_alias_mask; offs += i )
+    {
+        if ( offs & ~i8259A_alias_mask )
+            continue;
+        /* Master Interrupt Controller (PIC). */
+        rc |= ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
+        /* Slave Interrupt Controller (PIC). */
+        rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
+    }
+
+    /* ELCR of both PICs. */
+    rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
+
+    /* Interval Timer (PIT). */
+    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
+          offs <= pit_alias_mask; offs += i )
+        if ( !(offs & ~pit_alias_mask) )
+            rc |= ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + offs);
+
+    /* PIT Channel 2 / PC Speaker Control. */
+    rc |= ioports_deny_access(d, 0x61, 0x61);
+
+    /* INIT# and alternative A20M# control. */
+    rc |= ioports_deny_access(d, 0x92, 0x92);
+
+    /* IGNNE# control. */
+    rc |= ioports_deny_access(d, 0xF0, 0xF0);
+
+    /* ACPI PM Timer. */
+    if ( pmtmr_ioport )
+        rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
+
+    /* Reset control. */
+    rc |= ioports_deny_access(d, 0xCF9, 0xCF9);
+
+    /* PCI configuration space (NB. 0xCF8 has special treatment). */
+    rc |= ioports_deny_access(d, 0xCFC, 0xCFF);
+
+#ifdef CONFIG_HVM
+    if ( is_hvm_domain(d) )
+    {
+        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
+        rc |= ioports_deny_access(d, 0x00, 0x1F);
+        /* ISA DMA controller, page registers (incl various reserved ones). */
+        rc |= ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F);
+        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
+        rc |= ioports_deny_access(d, 0xC0, 0xDF);
+
+        /* HVM debug console IO port. */
+        rc |= ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
+                                  XEN_HVM_DEBUGCONS_IOPORT);
+        if ( amd_acpi_c1e_quirk )
+            rc |= ioports_deny_access(d, acpi_smi_cmd, acpi_smi_cmd);
+    }
+#endif
+
+    /* Command-line I/O ranges. */
+    process_dom0_ioports_disable(d);
+
+    return rc;
+}
+
+void ioports_release_access(struct domain *d)
+{
+    if ( !pv_shim )
+        XFREE(d->arch.hvm.io_bitmap);
+}
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 24f2fa0b7f63..385802c65abc 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -17,6 +17,7 @@
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
+#include <asm/iocap.h>
 #include <asm/guest.h>
 #include <asm/page.h>
 #include <asm/pv/mm.h>
@@ -1025,6 +1026,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
     if ( test_bit(XENFEAT_supervisor_mode_kernel, parms.f_required) )
         panic("Dom0 requires supervisor-mode execution\n");
 
+    rc = ioports_setup_access(d);
+    BUG_ON(rc != 0);
+
     rc = dom0_setup_permissions(d);
     BUG_ON(rc != 0);
 
-- 
2.56.0


