Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B7606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=ZxW0Zwr6;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=iOOywY5N;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=mt5vYDvf;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=HNSTCerG
Received: from list by lists.xenproject.org with outflank-mailman.1473385.1681054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPw-0001gF-HC; Thu, 05 Nov 2026 01:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473385.1681054; Thu, 05 Nov 2026 01:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPw-0001fv-CI; Thu, 05 Nov 2026 01:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1473385;
 Thu, 05 Nov 2026 01:37:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmPu-0001Me-67
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmPt-001xJk-Iu
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:25 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddbd-8faa-0a2a0a5109dd-0a2a4505a81e-28
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:25 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddd4-4cb1-0a2a45050019-94a38ff12f80-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:25 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nMpm2612664
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:24 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdw8rvuw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:23 +0000 (GMT)
Received: from CH5P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::20)
 by BLAPR16MB3809.namprd16.prod.outlook.com (2603:10b6:208:27d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 01:37:21 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::20) by CH5P221CA0004.outlook.office365.com
 (2603:10b6:610:1f2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:20 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:20 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mP0v3108414
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:20 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swb2g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:19 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmPkxrldyCiSDOmPlxv6yb; Thu, 05 Nov 2026 01:37:19 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=jZy
	qy7ONjIuLvt0qadiSp89ZlsXU0AWfGQO1jBxQc+Y=; b=ZxW0Zwr6rtS80cdYAax
	NYArDaXgBTP5V5Wk0o1ZLVayNZdNNBF82yo8w0wkmKuHFYGr7lYATUuTitnnnbAQ
	aYISei9g06AmLtJYajN0VMy8v06Cr/6C++dX6RPRC7mUqv+elPwYxVi0Uhrj6UC/
	pV/tm1OD90uBd2Z0XxZfTJdkrg/3Z86pUDoOszYO1HZjcMo98RlLFkJDSIgSe/bW
	wFVjQa4YdtemBs89hmSJhPGTbxSiW3tBBViG6bINj8iisxqwX7JrUMO8tBwGrdQb
	wK4busveRxuyxqbrG/9u1ftxdfTDCEn4kEudiTGuDVuBqlaPAb4fv8SzXgKh+Td4
	Spg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqHLr6ZpBxtmR4+o48Gl0VtuM1ZgIm9FazP75iA6EQ6dJLEa/2NXqg/AOg7g2pBoavO2XFl1wXptQr/CbejhXMbAdZZC7lMaM/bmgaiPo2Il7nxafZJVPBw17w4m6JUsD2TGmFrans/xdo76i4U7Qs2YvfjAldq7GigUAhOQvN6ryFbeTaUq9WSK/8CqxcbnW+IEhqTujBbm26hYJ+Kc7K4HcZ07c737CFfFW7jNmrkV4xQcCSd9Ll2MQTclpr7OGA8yKnOAO+tFyaLmdHg1IkxV6iGQdouinJ0BPNjVhvRm1J62CZkR4+sTZT/Zt/dR8z1VWUvLNRbm4beRLi3AQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZyqy7ONjIuLvt0qadiSp89ZlsXU0AWfGQO1jBxQc+Y=;
 b=hXTRrDeYxOF4t3wZih/A5YuZjg4adsBdv7Srm2ZYTuSAcT+Cm4HdHuYjPOJvMNs8yi4Lnc+kP062+cQQea/6ZHN0Eqt4lb6PEdp6t6/sJC+aopOhmmFetaBqXyhGPE7A3uksEyohJBxaoqZRZ/qcm19JX7u8P3GcDe6+43OI0VIn6xdT3Gsb+fyxzA0JVvgsm/6ceFjSG17HxOMnHmKO0k10quoRie4jGNDGeSZNrZTDAcnZkCmLJ1rf3xPgAhCAxFKtbcsUgUN8yVs1+gTG+j+BZVf9luOEZWGrSW5aME64PHab9R2SXUE9lGSInd5IQhPL2dyd/8wYJ30XOJCgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZyqy7ONjIuLvt0qadiSp89ZlsXU0AWfGQO1jBxQc+Y=;
 b=iOOywY5N+yCdlXTYmGEc2XEG13NaahCNKBnspflfUteuLqQ4eeEDOXNpIxqGeDDBzj1JHbvBuo2uIlLL4VrPry4h3W1+KeRqbaW28XPfN8MKvcnxcnyUpaK6pP+jAxOM4gJq55h8Hh+Q/QBI7sB7b3VKJ2pVVB0AnsEhMbjIWTE=
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
	ppserprodsaar; bh=jZyqy7ONjIuLvt0qadiSp89ZlsXU0AWfGQO1jBxQc+Y=; b=
	mt5vYDvfKJCFxejh3fakLgTdHUW1azTHxtB3jzTMtMhivtgzk3nTTGHSkgxjvKNV
	GWFkJfTowpZl+Nsi64GCuwZv7rFzv1AU713GmRIV/ld18OgcSDBD3PxjBKmWdh3X
	Ymkp1EecnZ0dN9Jd1Lha3m+ichLX319RhA/45nfHhyYXGkH+zS5GQojLsvBUXyLl
	YHygSksikCFTAWqvao0uAuW8a9OkBTW36ukRbDcLRh8XYGjOhMTXIICGKteaLP9h
	WshoeoSk3+CsHRvbs5S1k+QAhQu+RAWIFDqeSCv9mGF9P088bvtTPF4LYm1o/jlh
	HOP6vEqhOFOf6/NXzG0oIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=jZyqy7O
	NjIuLvt0qadiSp89ZlsXU0AWfGQO1jBxQc+Y=; b=HNSTCerGiQI5PHBqhLk28v/
	jvy6giEaB6O9+gRs1WD6FqJe7iZRSE9WTwQEVym9NbegLtekfsqLZuw7SzxRO59P
	OKh+RndumSm0ecnhdILfbJQR4C94Roq0qWIqEE/5g1Efq8ZeITQ8WnKLfKydzeMj
	58Xy370LG71NuWaFrY8acvJkW5+xgfpsGf7IwjJk/l6wx+SSBltGUgEwvVALGXZA
	k/usXo6a56m1iBM1y+069MtrrSFfoTH7DDhQwzPRoToBjsTgmiXG6uaVVoXwPsXl
	bgmLlD6eIaTsHWzODLk0SpwGxiVn+/kR+uxhczhtwhHM0GuHjjwJMuaJ+UN9hsw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPkxrldyCiSDOmPlxv6yb
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 05/13] CI: enable XTF status codes
Date: Wed,  4 Nov 2026 17:36:53 -0800
Message-ID: <20261105013701.719658-6-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|BLAPR16MB3809:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6fef1a6-975c-4948-844d-08df3add559d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|10067099003|22082099003|261102123227099003|18002099003|3023799007|56012099006|261022105027099003|261009223027099003|261021123027099003|261021121427099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	FLgbFR9twPWXet/qcluti3/j+CUHo2kYAuBrOmebGtitGKqlhHE2Rw7hmPebRVVCPkxRsW6eH6w2S1pB3GzYNsTyUTPc0G2eoAJ2SleVRtUAnpfYEF65H7cBmi/9d+XqLIhoVjT98zVodsU2OFpm5W2JDbhQtXLgCI+/XjHWcpB0amijGRqibmsdhz7x3NXa8khEmH2NrhaoxwHG8nmblOKYq8dK0BLsbs4vKG3zBdUFlgnn/LiOJsL0TZOB7Y6pjBVPs05CqfsKvAcRS5OEomMX9jZAYRdtI9se3prcx3vynM3WQ6vgqR0zUlAUi+GjGFEhtorxD7wZHrkAKZDCEKxDOhZy+or8Tmnl0mO9iuAkIkebsF2cbAp2J6xGsnKca3piDrm4LyGmmcD17gw4CI+oromhXjgywKIHTRC2cY01GppUEg8MqBTtNRWFxX8L3rHaHPs4I791I1bqAK/BDTnGR/Nl/FHUPWTmyvf+H9WamkzGrtwFLnWnXWDH3/IxtJvbrhKkVpIqXHnfIbdvYeMOIrr5mAhPL02PDxPBOcUkzrhZfeEr35jLKByYO6tn4k9IoFVWd6mXBTkNZMylhH8a6jdjYtvrAYnetqJURYnCAWzUAQJG5fEHc+VLtp52l14TUVzJYKPMPS8cT5PQWCW+z3J/TJ+sLporFjZxdZgqO1DZGQ9Loo2uJiONqWuE
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(56012099006)(261022105027099003)(261009223027099003)(261021123027099003)(261021121427099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tntugV8kr8Owu/gUI1QEniTo9hbu5FJD2xqUTgb8FZJzVHUoKH84DrnpBS1lGVdTs7DPTMrEuFtuJsonkRVYpczUCyoQT+ljvorjRMEghSk6NJSAuSQ80Ufw+pVexygruE5dnmx2OQejBZDMPbOSEf6MrJGMVk5Djrmmuv2PNM6NLg+vjdi8/Fv8PfSeRuYvfh5P20cB40SR4O8rILVU6LYKRaHLWos3edlwNmIQuwHGHxJM4M3L0Uuy2ZF5XJ+hod7gUPQXGD1zb6YcWiFeBURNBw8sqrEMRmqPZdI6Hs2UyDl3kjUQUfBKyxenphbdez+Ln+ucnOXWqf4rI6LqMtKUBfdneybF6wTV09vrqllarVSooJKN+JumSsl7UUE618bNKq31dEF6tisYtpwY5WjQpl3RC8ESQ4/ikR8OvqW90pqn8YosXPCaKEgO1at0
X-Exchange-RoutingPolicyChecked:
	H0yKHVBRp86TX2CvraLT3GL+jGlReSb6B4Eeh22t/RHVe140L/SgDuDT2lEHVSZQOTUgkc3v263uR8UbGaAcW2JVNelw/xQCJpKgRXkqwfP7vCWRh7oOm2GVUA2GWtaBt8FM3UW9Y+EJTHKMBJpaO3aRCvpji8aNGtoos27pYGG10Vk6j52hV+TQqRR6OozO3o/livA/q9sppR+6VdPPZMScMC5eCNdOLLHl0px6BgxHOLnMbuYtNKSlQcbgiLZcDhV2vN3mIx5ZkQonVGSQQsnP/EiNhGN9vsKTu2MUh+vNu7IHKkyStvJELTb+FmZJSVjKaLGDwd5XP6UvlUYWww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dXTah2JuzeCpIHvObBvOAwPQOaYBUx0ARB71hcE/uZxz3jtz3H2jMuwS+xRrg7hNx7fvuONBXZ54OCIdqq9DLONs3jvr6oRrTN8yaEx+cCwZUKVLj0dJh5aPRkDZoH9GHqebDVUHVhylZbEzNPxJv652hNzePnajlXWPTooluVqNThmsWENT8p7uBrEq6gznTTExyRi3t3jeJLCmuEKQGrpzV0xoL6Csh8fDgZ3sFvAbAyl8gj5iPi7TocB1r2CqL8qEvYiSJzU0RL0OHa3lyby8l6XHeRToz/vT3HcxzzMtPmcTZUq6VOjk39KvA8cn7Qow+frkhm6CxEuMd0NQokx2XiWjx0DCMW8dinvmgoqCktmbw9peKXJ/ICvVHowqBYc5xWIEMVOdvp93mQuxGZNTNGl5rNYZmTbdBzro6ZjCEpUwHkhLMWVXEqKSxhpWhuTMDexEnHiM74EZ8saALndUrVJpOLaOkA/ZeCzoa6aIFSGk9+VYoOfxvvecmK18+a3zQW0qEDFPT4wQRpk8mHHEg9sKSJtDpZwt1CXo4AuA/M3O9KX4nKwnMUzR21x00BnED0O0HgCqXXfMBIRZR+O7XZwVXYYD3NnHHW7Fmovh8LwxXXOJ9Pk73ZWj0ZQywUcHwmLOBD9quSncyn3+6g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:20.7048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fef1a6-975c-4948-844d-08df3add559d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3809
X-Authority-Analysis: v=2.4 cv=JPiuIMKb c=1 sm=1 tr=0 ts=6aebddd3 cx=c_pps
 a=55pr0gqEmxT9FJl44qZDsQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=Ol5xH1M5udD1RAionIcA:9 a=O8hF6Hzn-FEA:10 a=DqJYxgmhk6moR-_7_KoZ:22
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXwkq/ZqrjRSu8
 gZ7V6NTuXkCEjVxh0lEIPA23aL7Dwk2/qLLq5lJ+cwqUtNaRVDnVHBKBmHH8QSEzTruQiBbC828
 aJ+EvQtIRABurXJblzDLcRjgPcOZ+7cm0iE4zFwaoEPDW2VdEltB
X-Proofpoint-ORIG-GUID: JT4nA8rwGjvj1s7_RVhvZVdoS5PpUOdE
X-Proofpoint-GUID: JT4nA8rwGjvj1s7_RVhvZVdoS5PpUOdE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX382/s89NMGoN
 c9Fy4enXc3EiuXnWyrNv46+YZyoukY1g7GO4VpKkyiiGnGPFT/0Bc3E80iKLmLn5XA11kwWZTdq
 Wb58YALNZtPuhV571LhlxAcybjF9ckOjJBgNxRxjJ93XA+C3Z9XbPBrMwxmNthV+ujl6F/jOsoU
 wx2X3X+18WufKDEspuyz70A2cx13MEd/fcfpkI+p+XsqWIb29/qzIy2lgEtIeKSUoJ07Qv7W7Oe
 M6KhcnDcD2diRnz9SNRuzB+KMwY5s65zCGDnj7w62K1YCrqRMDkriTkAIVsvIGBa6kI4NuyPODj
 kpPP+7OBc+6vlf+Vp+RcdRT1eBGIvFlXk8v/IRkb+iqCaMHqh4BYVBNLCS70Ld8685WpFHOmg5x
 hM1203sKghK4HpQsDllmc3lcMCy6oRYEobtGeU7cu7mq3JB30uB4AjN6VBqIDH8YMO77oC5RIEj
 i6MolOvsGKFa3YwT0Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-c201ff/1793842645-F46A52A1-43B704DE/0/0
X-purgate-type: clean
X-purgate-size: 2167
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Enable XTF status code parsing detection similarly to python
'xtf-runner' script (XTF repo) to allow fine-grained test report.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/scripts/console.exp | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index e27886bbef23..55373f86e673 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -14,8 +14,9 @@
 # - WAKEUP_CMD (optional): command to execute to wakeup the system 30s after
 #   seeing SUSPEND_MSG
 # - LOG_MSG (optional): final console message to wait for
-# - PASSED: message to look for to consider test a success; if LOG_MSG is set,
+# - PASSED (optional): message to look for to consider test a success; if LOG_MSG is set,
 #   both LOG_MSG and PASSED must appear (in any order) for test to succeed
+# - TEST_XTF (optional): distinguish XTF error codes
 
 if {[info exists env(TEST_TIMEOUT_OVERRIDE)]} {
     set timeout $env(TEST_TIMEOUT_OVERRIDE)
@@ -31,12 +32,24 @@ match_max 10000
 
 eval spawn $env(TEST_CMD)
 
+if {[info exists env(TEST_XTF)]} {
+    expect_before {
+        -re {Test result: SUCCESS} { exit 0 }
+        -re {ERROR-EOF}            { exit 2 }
+        -re {Test result: SKIP}    { exit 3 }
+        -re {Neither HAP nor Shadow available} { exit 3 }
+        -re {Test result: ERROR}   { exit 4 }
+        -re {Test result: FAILURE} { exit 5 }
+        -re { crashed }            { exit 6 }
+    }
+}
+
 expect_after {
     -re "(.*)\r" {
         exp_continue -continue_timer
     }
     timeout {send_error "\nERROR-Timeout!\n"; exit 1}
-    eof {send_error "\nERROR-EOF!\n"; exit 1}
+    eof {send_error "\nERROR-EOF!\n"; exit 2}
 }
 
 if {[info exists env(UBOOT_CMD)]} {
@@ -71,9 +84,11 @@ if {[info exists env(LOG_MSG)]} {
     }
 }
 
-expect {
-    -re "$env(PASSED)" {
-        exit 0
+if {[info exists env(PASSED)]} {
+    expect {
+        -re "$env(PASSED)" {
+            exit 0
+        }
     }
 }
 
-- 
2.55.0


