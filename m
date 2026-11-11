Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED422606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=QvmzCCZ4;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=hV05sb0r;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Z8/wR8Sd;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=OZcCstaW
Received: from list by lists.xenproject.org with outflank-mailman.1484872.1688253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREKJ-0008SJ-GH; Wed, 11 Nov 2026 19:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484872.1688253; Wed, 11 Nov 2026 19:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREKJ-0008Ra-B4; Wed, 11 Nov 2026 19:49:47 +0000
Received: by outflank-mailman (input) for mailman id 1484872;
 Wed, 11 Nov 2026 19:49:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREKH-0008M4-Q3
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREKH-001WGc-6p
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:45 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6d8-bab6-0a2a0a5309dd-0a2a4505ec8e-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:45 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c69b-4cb1-0a2a45050019-94a38ff17632-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:44 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYqRr3458876
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:43 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010063.outbound.protection.outlook.com
 [52.101.193.63])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvwgj8q1n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:43 +0000 (GMT)
Received: from CH2PR20CA0010.namprd20.prod.outlook.com (2603:10b6:610:58::20)
 by SA5PPFA482AF7CB.namprd16.prod.outlook.com
 (2603:10b6:80f:fc04::91b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 19:48:33 +0000
Received: from BL6PEPF0006C3DE.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::77) by CH2PR20CA0010.outlook.office365.com
 (2603:10b6:610:58::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:33 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF0006C3DE.mail.protection.outlook.com (10.167.249.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:32 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZXQO4131283
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:31 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh28uf7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:31 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJ2xFWbfVfAbREJ3xwLzM; Wed, 11 Nov 2026 19:48:31 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=v2k
	vR+Ec+T4C4PHBWYoq3PynaEwFo2mHifgK03yjxc4=; b=QvmzCCZ464AZxaATmAb
	l0gNpJbuAOWzvG3nhss+5crHc11YUuJ3Ks0NJ8hNYlMFb3FDdlVojTKaBhWPpX5V
	w9coo5XxP531mjK5CgLvew1ApF+687UcAgGGY0LkYO3Ulb02NTdnziBVvUamlwVI
	mGvUNxkavIrVwFwY3xLFlhzWbmY/FxsD553eK+paqdJsW9IIBodRT1RPQVQmVduP
	5k/OsL2Khs8sxvDs2HVHeCg0yeTeubUUa+smnuwXSzlpK2/m7E6sOxi3Ps+Gaxcl
	Q6wAaRvxjVWM0YQgAD8uHW9lFIjkz3ORNDVYbMQGyHBYLYdjVaDaTegSBawaZ0Ii
	vBg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfvV/A5cgau6pvB327dnt4A1Cqx0ZbmS8c4sUGXbnBIhfbs6EOjDDz/kAVapCveEO67k6TGiuJtTH43m68O0IpHscFFcqhuOZRW8U5fgyqC+ZoXmept1dQcYJFvAmexCpd7mbHt1jLl9Q+XURIrROjohM6Pp5yZI8ketUBa1nHNb+armEnLtPBPwrrmiTIiRPcGt6kIVlb2ja9jZUWoYu5G1UVM4HvkNgBmpAhX665zzBWAWldMk+aFSjzQytSbhbVK0CX9j9MEgQRDynrqFV2KaS4Im8v264kHNnoZXxscORDPf82b5YgiYLdvNV1kp+3d3nlDVKOvCh70KXTOWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2kvR+Ec+T4C4PHBWYoq3PynaEwFo2mHifgK03yjxc4=;
 b=pW8GQFlQNJWLWKtgSIsfwPD9hsb9kf3uMussIlZx9dgIRVuB+XZr/AcQL2kK6gK2KDqa55HOd32b73uwDLfSyZtuVXsdMOe4KX9uZp1wuuD/LW3cpwwqlOXgqfszO01OpmBg0SKchorGM8yfDmSFIjK6EIMt33Bzfqp4omolwWAsUW067oWgtdTqqhNokhWGYu9s0aSTSBTpvEqMONOm2wpBOWz8wYuoy1eDKvCJSrrqY27OeKFzZQhk/13qikM45RESt9JOdVvwlj3qu8wmc/8Yzrw4InqAI/rp6LN6iLcl3qAGq6cjBg1h1YaU+DEeDpjUaw4H6LgghqLEIyzgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2kvR+Ec+T4C4PHBWYoq3PynaEwFo2mHifgK03yjxc4=;
 b=hV05sb0rqeImgbd5aEXLLXX5HdKzgR9pmL9ml5KCPuoN4WCknnmv7xgVMPGlN8CeuPg+FGJPI4s6SmsX543Ew9u3ak+iqREbY5pBwATtZv4RlWGCcRm7ZWw6xvU48Q9gOGGtkHRJh+7aVebVeDzWuZn9bTZIMN7U2WCxVH+re+o=
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
	ppserprodsaar; bh=v2kvR+Ec+T4C4PHBWYoq3PynaEwFo2mHifgK03yjxc4=; b=
	Z8/wR8SdY4TZj2dHanLfYKE/8G0P+nJD8xBugdMumQR7kTDLb/vTnB40xtcDEKC/
	6rZ+w4ReNGCCa/PD8eAvSbnqVGvXvHavHroJbgNye5MpxbDvpGmbu+ACR6Vd59/b
	nOQZd7yv1gBs5nB86nIupEYtiZiB8RB8RPGHomgyMSbixMgwqlL0SiA3H4bjb3eu
	JvWbm7oa9uUlwDItN/HOTvL/D102RoSr5m7u3KBppdG2J6cRV4OINxfcD7GrRFUD
	Y6k4Eti41AqX2RBHN0HCz5wMBtOLkOQLh4lj+OxjkXWQA2J1fR+GP24rRYeb+5ma
	d434LBWbWqZeNQJUr9QnLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=v2kvR+E
	c+T4C4PHBWYoq3PynaEwFo2mHifgK03yjxc4=; b=OZcCstaWL1KVJ41pBueYMdC
	pldBS+HjFJafeknZqn40zVy+or+rzILVfvaGI/plifN6+P+/g0qtoACGBtmyesYL
	AtGPawQuKMZmf3tphpFUDlfRC0Tqnv9uQ2HByyAJx45rUDn7p5IdyoqMy1d4zkdY
	Nw/lFLjltAeIMzAcft2euF7NvSmCiCdqWmzhjFgrmwUiUo/ZxUvE2yuf3W5xgHiG
	AvSVz+Dwy+Xbkdcc35Y+HB99Fk2XdyDo8Es/eyGfJp4l3thd1keL9XzzyX71pkdu
	M55h3rOZWbVM23oKRH4hUghkq1eMd1zoFleEuEsxkY8FvrIOKWWYG/6zBhtJTsA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJ2xFWbfVfAbREJ3xwLzM
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 08/26] emul/ns16x50: implement LCR/LSR registers
Date: Wed, 11 Nov 2026 11:47:42 -0800
Message-ID: <20261111194800.1070016-9-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DE:EE_|SA5PPFA482AF7CB:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01e6de81-6d44-4b28-a631-08df402cc483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|261009223027099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vpHy12X93N7agmrJs3zNmCbKphzpCLqKkp29IMpB6LVJHALraXFtaWSmOWaVRbDYwOH+0xCAHMAfWkUBvps0twiv8BjDExhJYJnx+VVKdrJbT+xrjamIoY9Dj5psrBYS4JcwToK1VSskgtPu5RPrP29NyUqyZPBeHvCUeoosz6Gg1tvZcMp8ZLh7u8LaS3ylc2uyJPBUkJzXCdxicyj1HO+mw7D20oXR5EwUIPti0AjF+0xDgwX+Ugq02ct4FZVGmIy67qx3gfxNRojHwt8iNJ0flgDQUcjjiu48tWsVtdNwxlgOp3ytCMeAxpeQqq9iepESbsblPi1L/wV1ECsBus0DkKybMe+NwlrUei36SwitMoD4lKGpaKEkiXrcLn3qGsMQrLTWNu3K9FrgMpWRNnezTnAF391XlcJhHpFWQ6Ckx9ZEPZ9d29ZY9GX8g29WkC+SGplIxn8IvCPNPqtyuZEM+HNLr+UrzfWMac9YgQxPokxTE9hKSQjLD7eiz2hWmM4Iss+fYSZZZNWaemG+hD82f0akcHSyElWmZqI5pZzBSlCs8mU3M5TRsav423MvLQ2DFA0BDd/EDPlGfjW7mve9eRhVwlLnGj9iJR+PtL/o98fjRlg5NqPlT69nnMwlwvQK9fk/88RIVXe+qp4PxeceSvbfBDr1a1pwEVT3V8HlQsY7MwXYXoFRGnMu9tQ1/TI2Z4L8iiiTceV15XNYpg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(261009223027099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JN9C+KqxoPb9bNe9m1CTAqt/KJyqcruRsIcsTmE6gg796rFUn7Zc+QMQdZcGYLyef6qsOk1jgBdZs8cPvfJFJ0bbkFYObMq8bueo1GPJL3lwuY1EizEJ4a3MCoUJ0kn/sjEmvMnwa3GReRiSZkTILMO8oZjHZNvhHJDWo4rzoW2hmmxANCvunlHcNix1wND7OOnkrWfzfQ+S4ao0gRgtAjlpLPwf/eD0iHxYsXwV2NvbfnC/thEbevm4s0ZDtgKxkgriL5G3qFNcRRhMcH/D3f2TXPSV6n4tZpxZIUMQ0FX2Q46/cnAtfeF0deO9UPXSKc00bGy6w1G5i8gQ1k+d1vhztELLSEXDR5w9RugX0FvxjMvteTi879/Jk4goJZWSqTskn6uS1WmxFF5lELsXPM8gkIySR1Ws6WzOc6PnSJQ5bj44Rdf2aZvzpduMXCcj
X-Exchange-RoutingPolicyChecked:
	2lUXX2K4be+bdQNnGU2I21Pm+/tZqTmgskqMwVArYubsmQDorGnpMq+XwcX/6qoH1kaLFvDb8RiBDDdpR9ZMab4r+yP7Bvmw6FOtY9eJJ0FwA9Z74lYE6U9o3DnCPWNj4DQ54ID72rIonZLM9dZ8ZG1Jvc1xHmwuZZU44kQ6IeXbPgYSIujbXBYvmkSC0juHpGBU+ZaI9yLgYp0+/dAcMvK2aO9/LLXQlY3Lik7uH7loqX3Tm//EV+beDkbqOKjM+D9PDW0sB6wdI8uTXbfh2iNp0CsufMIVVEuvl3x8MarspppJG3QtVDOk0Fw/3sZHVlNojH6ufM1qJz9tqKLoyQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oVpZGiGOnZ8mKnOiE/DX5vAAz03/3pPhQrStJsFzWa5EN/A1OM4u+YDwqllePjwZKxgwOlaXkRHQcyIefQaYJ0JDQvkX4STLzVLzPP5bJ7g3DnSxRm0ScghGb/xzuTg6pB8Q8wPMZofQ6E0dxkGxw2jASjSgYZ5iYbZoMEASWRmgEcU4lEDPy41q+AX9NPCy0hdr/D4Il2CcyBgs1ffQOV4bLilRHtpJ3ceqmPee2IrhcOY8bjKw/qTEgDhsfn2N5pjCBFvUUFyfe5/bsPdPp32R913/6Egz6wJLUrvOPq3zLMAylApOtdNECX+BtDGSIjvjgWj9w+uzwdI6xFqaEKUd+55Yi9MHhsNsr6Nh62zcVlJn8vmdjlwYIOUwPXnhBeGArpnQVxI5UhsubaBfSw+2jZaozjtFF46r9X+0x7jzWV2HnqTM6CYCXeXVssMtOCzGlXo1ESa5KJFjUo5bLPFestLxYvxM69jwlS4vDaB8a3/XIV8tk43xGFWIZf0WvPbDtfURRG7S4fCL0yaLuBcsQd7Xdx/A9GeNegk7yG4lp2Y6RlZWwhsMo6N8p519457XPrC+YNKWj7ShTixMH6QNCn4gS870a8Q8IECvcBTqUJn4mXi6ke4SPYYNHmUZmiEY+r4R+zfDi12laQrwcg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:32.6618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e6de81-6d44-4b28-a631-08df402cc483
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA482AF7CB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX4ROiFTt+0BFA
 QTWF6bU8KO6/Gbk4p5XybrsF7q5+wexwr/SdX/lShW0/qQXZCv1iRJvHdGF2N7wUn5KDT6vbY2U
 R7ESsCRECuvOqjRoCBbLycMRj4BRPKBUJc2+XRncGRfHNlpIgC63I154BBeDnyvorf29dXweP1f
 PIZCAPblcyE6Tqmh2D2sSgDHQAy3YkI/ZDHqMMTMbgIaSdqSosGKWR71lwWXULpvDyYGd29D90M
 0csnjP3k+Zl9Be4FBj3mVtKMMkLV+JhCIi31ZTqfvpPo+PYWb2BTMwcpVUNiP1/ilaMd+Ua1w3E
 amp0K74fMGTMDkEaQJYd52W2QRrLuvPpmv2WOME9HcIr3TEJQCpHucGHaax3rdxmq8TG/xdP8hy
 M+nVe90mLI9cZR9xO19gfy8Gelc5b9mgzVVyl4NjBsKwMXnEdUyax+hLwlf/guHQAoSezWhcfiQ
 ZoupQYcdvp6YCZeboRw==
X-Authority-Analysis: v=2.4 cv=ZrZ4uN7G c=1 sm=1 tr=0 ts=6af4c69b cx=c_pps
 a=FmVrivm6CVS+kYk2MGmjxQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=IgMbF1m02leEJjbdZ8kA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX58Yea2pK4kiQ
 C9TaS4UZL2h+d3OlSIMuIh86De6enK0vUTqmBgAEv7MED0kVE+uoTdwAlLVdeX9nYhRYZzFX+Tf
 DwnOOWpDdhwg0Ees6leo8A44X2PRO06ly+lz6Ln0yPVEhPxtbLcQ
X-Proofpoint-ORIG-GUID: Gjiagf1vrQsBu97Tkk9_hzAqNdD71je9
X-Proofpoint-GUID: Gjiagf1vrQsBu97Tkk9_hzAqNdD71je9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c201ff/1794426525-F6AB72A1-7D3DD1E6/13/0
X-purgate-type: clean
X-purgate-size: 2352
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add LCR/LSR registers implementation to the I/O port handler.

Add implementation of ns16x50_dlab_get() and ns16x50_iir_check_lsi().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 7c5cdc99cfa7..e80815ccf6e2 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -64,6 +64,11 @@ do { \
 #define ns16x50_debug(vdev, fmt, args...) \
     ns16x50_log(3, XENLOG_DEBUG, vdev, fmt, ## args)
 
+/*
+ * Helper register definitions.
+ */
+#define UART_LSR_MASK           (UART_LSR_OE | UART_LSR_BI)
+
 /*
  * Number of supported registers in the UART.
  */
@@ -116,7 +121,7 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
 
 static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return vdev->regs[UART_LSR] & UART_LSR_MASK;
 }
 
 static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
@@ -245,11 +250,16 @@ static int ns16x50_io_write8(
         }
         break;
 
+    case UART_LCR:
+        regs[UART_LCR] = val;
+        break;
+
     /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
     case UART_SCR:
         regs[UART_SCR] = val;
         break;
 
+    case UART_LSR: /* RO */
     default:
         rc = -EINVAL;
         break;
@@ -346,6 +356,15 @@ static int ns16x50_io_read8(
         val = ns16x50_iir_get(vdev);
         break;
 
+    case UART_LCR:
+        val = regs[UART_LCR];
+        break;
+
+    case UART_LSR:
+        val = regs[UART_LSR];
+        regs[UART_LSR] = val & ~UART_LSR_MASK;
+        break;
+
     case UART_SCR:
         val = regs[UART_SCR];
         break;
@@ -509,6 +528,8 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
     memset(vdev->regs, 0, sizeof(vdev->regs));
     vdev->irq_asserted = false;
 
+    vdev->regs[UART_LSR] = UART_LSR_THRE | UART_LSR_TEMT;
+
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
     vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;
-- 
2.56.0


