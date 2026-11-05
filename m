Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C7606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=p0IQi0Sr;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=TDarcvo1;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=nZOeKhAg;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=oAwJMFYF
Received: from list by lists.xenproject.org with outflank-mailman.1473187.1680846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNM-0006CF-L7; Thu, 05 Nov 2026 01:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473187.1680846; Thu, 05 Nov 2026 01:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNM-0006BP-GC; Thu, 05 Nov 2026 01:34:48 +0000
Received: by outflank-mailman (input) for mailman id 1473187;
 Thu, 05 Nov 2026 01:34:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNK-0005lP-Sw
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNK-000xGY-9k
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:46 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd17-bab6-0a2a0a5309dd-0a2a4508a5ec-10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:46 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd34-f659-0a2a45080019-94a38ff13686-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:46 +0100
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50mpY51195364
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:34:44 -0800
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012062.outbound.protection.outlook.com
 [40.93.195.62])
 by m0482515.ppops.net (PPS) with ESMTPS id 4hra4eu9ta-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:34:44 -0800 (PST)
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by IA4PR16MB945187.namprd16.prod.outlook.com (2603:10b6:207:12d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:42 +0000
Received: from BN3PEPF00022BD1.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::53) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 5
 Nov 2026 01:34:42 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF00022BD1.mail.protection.outlook.com (10.167.248.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:42 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nN3n1487541
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:41 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232whwa-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:41 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmNCxjS8Lf5COOmNDxlMUu; Thu, 05 Nov 2026 01:34:40 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=ZZQ
	M5nCB0fo0vhti3rWWFAY2uJEHZznhmJpZdSoQNFA=; b=p0IQi0Srx7xZCpE2+rZ
	JL6laTlero/FdZ+alqBwfL3x6k4eMkZSzhJ3SZ2pASJ8ac0vxprrBMWoj/aua40V
	cOSxd7QWR57na4eSnmf9/mHue6UaRVjzbDmxjcx88/5Sh7uch4dW/AkQ+VxoNpkt
	70I9lQX5kNQmOnLFLWe35J4UAC0Bcm118CmNCcJ7ApLbAqkYO17Zyv92eZ1FnD44
	hA6I55LTMludum3F1le+BovWiPPMvEQnATADN//Lcmyj/Yo/GOVhksIBzYILqLXy
	j9pbYWiOAPDx1FTpzONO7s9qp446VTyxVkXKi+Elx1ZPnl7scQdJq6ib57FwH/96
	iIw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOjtx6BCzJsg8IjrH2jF1xXUrC8wNnKm/e7T42cguGnYEozq/DEGV8kwIf2n71xPLdPsDakpF2ICieVq5xjUyR9vgLQKGKAvXMehqNYZX+PvBaLSI2x6kpJppam6rpXrahul3jRB5Jqn8yKOvAst35oXk4yANV7SMpgQ5Jid4/R5tpECmt0kaCVyQwHtgCLvxr0btyHu9ppm6pqqMO/SvSgrYqlTVnRUPjdovHQONNbfeqnOGDrOky3D/UiZ89bvPZdV//EKeYY5RzdnO/XWTDDukzzkthV4WNv+OXN1Mtd1HqaBFsvkOGs6Y32euRsxCSuHgV3fsrPycwnSEf+DXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZQM5nCB0fo0vhti3rWWFAY2uJEHZznhmJpZdSoQNFA=;
 b=llrCSSrszrTuNDl2ZeEGQc15yojB+mm3U/wAgBlBMiNBwgF20wgle1LPMOiGGZGSiXl3zodMKYAAchpftSB7V61Oc59uV0wEQhEAg5+jODq88IN/DFVO+z430AA1FnfB41zgR+67ByMVwAMPRn5itfLPGVlgNzV5WmH37oj7G6yLg3L4WaJCnoA3ZTetR8hGcZSLaGQ28PKjFC4Vwti4jLV9Qmg/pGml+r1YFt3d7e6TZCxcKAJzbV6hnzTxwVnykCYbSBrMD4OMDZxaYecLWAssFOY34CxQv5OtLf6tlc3sDzvPXVrP7LDu2mOdNXJzF8NjG8KnmuITDOf/900l/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZQM5nCB0fo0vhti3rWWFAY2uJEHZznhmJpZdSoQNFA=;
 b=TDarcvo1Ur5C8IQq3/a5lyzfR8uRMSFsfptgz1xBtswFJpln5UIEMJY1cLcETPbN5OqbpHxO4S0eVg5Dte2f+aBxazb02zDpA4JLaCciAFO1X1wjuPMHv9JTcFuCKHDP8Q/AS/x3DD/+MUnsgTGfE/0KIOkr1mtjjTt/rW2YYdc=
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
	ppserprodsaar; bh=ZZQM5nCB0fo0vhti3rWWFAY2uJEHZznhmJpZdSoQNFA=; b=
	nZOeKhAgWAyTT18G3GDHvsbFFBFUDncgEv4iecblqA8h7C/Eaj24l83JfYXgqKY9
	oZvbZCt0Q7gLl+q6ymsZKWW8NyMI1aET7uVjbmjwec/Enmr4cpygscE3e5lGT1su
	vSPcQ/0P1sJiTndRLOJ3PA+pXJn9izT4gfg3j5KhKMdm4Wv+EntNrP0yW/6S2oJT
	mr1LerG0CAQ0OISzyu5uSybJlWTCvMwN5vc7BtXXaKdsrtBe5PGvYaT9A9HT+BiL
	S/Cz5wZWUjVlEq5oySoBNZR/Fb4L7OC+l5AgXwsG0QJQG8GNKKp04ticjLEf+ZeY
	mVls5N1iNv4FphNUB+ywew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ZZQM5nC
	B0fo0vhti3rWWFAY2uJEHZznhmJpZdSoQNFA=; b=oAwJMFYFojjm2weSusjacCA
	AF+ZmhEwyOJGkAmA35UJmkWu9KtMia81mQFec256i6CnynxLVXuRVmrJ48Pohevt
	CsHO72b+Xx+3G6nv3gA6jywpARDjerrlvN7Vmn4r4hW3Z5h/cQo7TS/yJDLBCC/X
	Npp5PcQ+U6TBVsUh/PsJxTAqxUxTHw4vFFvw6RBx+BqTSpJi27+9/RsaF1Tk3rvG
	aE+ERo40j0VN0FnfLJARLn41KQI7/D5IbydfZmJPBgP8xrBp++susom7mU6rUIXo
	uF5fvNWz0KDMiQCc2UqWS8f8qBSTZzxKMiQuAMnFjyMhsrlj8taGWK/q7F0lecw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNCxjS8Lf5COOmNDxlMUu
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 13/28] x86/time: fix typo s/interruopt/interrupt/
Date: Wed,  4 Nov 2026 17:33:30 -0800
Message-ID: <20261105013347.719392-14-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD1:EE_|IA4PR16MB945187:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 050e26d8-74d6-4f22-3022-08df3adcf752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|261021123027099003|56012099006|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CHRcDVsQz6NAj781Ojf3bB9YvUU3s3PoL/LCNUhLjF6Q6Zu78nsA++At4d1D1QPiPNxAZvR4yCFud8+6sLd52dtO6q32uz283bfwcQuoL+PFiCqza0RO+E6GsGDhSnOfrXphZkHE/C55jtFg8fEX+Rs02N78GmdUpsMc+WSNDshglqAeoVi3uItoOoHm2j3NTH7wkma4AEJZyscUwH4er3o6xv447W3JHgJLLqtg6D4li1RRLsLQP3JR3xPFpSir2ffGG1ouhFxMgrlZMMYYGjnsAN0JT/GJdNHNradJUr9llCPUNk0V2mG/6+KmzmclGsDGoXYG8WRnLIz8RtirRdPUkieZiuMsOPVXz0Dkkmg25EEsa+mSknY2e4utnsEEGtjvbrL8xcwiAFKNJG0Iv3gMavm7e2lEo6Hf1IDRT4XtX/E+4WVeW3F2WBUzt9HqVM7WMzAHuSbY0Q+47tKJIk5DTpp5oaKfChHKv9lSFWSJEhWdS+3xFkKrqg9Oz1rW4nkkDeHcjtgYwCo+a3fwkyPwbi6tifD+cjL7hQTaZf6KnSr2sFQSbwnKWs0jaxGfA2GT/EzTt6y1HAjaatzDbHWn2TcA23kEPMtQyS/3kr0SeFAkkPAPboZDUQCUxkri3+C7PvR2hydrNJhTTNncetqk5rqluIh211Q9vKXirtjNIukbMlLgbqe9gPMfNtUF3dfDCZRssbx6X+QBoW00Pg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(261021123027099003)(56012099006)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JYZ4Igpo/jPt7MROqGrZVdP5gfpuYpEUY8oW6kIZtMOeeJcrj3KMtPqnLIQsUrCcqp/fAW7uJYuQOYEBWkKZixGfg7BsvZ3KgQHlWHwiqxOmTEEsffpryYVAwpoW+/t1RB9PQJwt7QbiImWtiZYGjNSIZd6Rif9WOVBSWEhD8PuDigvjrSRnDVW6ZZXKwF5SHMQn6OM8iE7sIUqaUfPmmy5aXi4V+tGHntKd9VoW9VVl2hCQT3+hQSNhgErYA7IHwzF1zGsSQvHumDoptTOvWkrm3YXWuBNrQg1AjhivtprT8QJC7NA6SvJver7oaphy1PrXsvhV4mk2egqprZU2FUokFCzcpcXEwtdyr4Yb4ldsefKSipfOjBLI/wstBrnB7UpTWU/p0IIHzIM7rHRwcM8mi97AWZCcfa/MRHg/5rRs2VemGmCWL0QQuHeCLJLi
X-Exchange-RoutingPolicyChecked:
	Z/MxnTnVZEiXGiXEH2hJPdt6cQ8i91bHo79oQNCjtFLljyJsRrZg2dw031Fm4ZZQV5GD/NQ0iRWMGnd3fSlGcho5Tx/CzzyEZ05/xdGTbG2K02dXYqCAv5jPfhgkV2rh41sOtI3RO3Eu4UFTyY5s7AeQ2SPCxye2JEqnxk3hF6FOE4pRuPuhoy/NYNLd4MJu2Qa8xMGgN/B55pzDEuenZLW618yr0jK+xUT4oV0wYq+yXPRwuIn4FU9jeSloqappsekDVTsDvN5bcj2IEohrA9E9J+d4AJFOHAojAr11wd6viNMmRnRvs63Xrx21hy3LFqFz1ZwbZIPIpbZU7irBwg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t6WbleZnfv8Wrby2nKeMHU8PkIfh9GLuuMlKu0wAzbHeJuTRdHe1QBxsr/wZgYEZ/KaPq5XEQDYdP2hq1HQQtWoYE2UAx1eHILyttzCy+SLUMrqwoToN8nTkt88uB8sA2P7Jd1AH8rJuv05Q2K9Y+2KPAt0xMHEu2Rx5T+GmNXu095DFBBbRYXFSUXeD6tj/8V66q4zxpZf5Ja5i0HQ+2C78aOLixpV5N/3ylOwUfneXHy9mQy8STUpIeJ50S9/M4CZJcneYRPn0f0r2KI5brXJzcolDpia8p7r1704v+gfBmhRWv6lWY8UjFMNFJXtBTzwE1j6d6tXXCsSTE3wFW7H4njjjVgb6NoAnpRXMzGNCFLyCGdh+kbNixrnODkmw2QNudm2qkztQVGqs6T+wHrYoBAbjpufiddBY90F8OHNyd8vtx5SIKTii7ytUPYaFT6zyaBYWTKgtt6U5Nk1MNuaVwWFH7kRlaFNp9U4fPceworKhaajMvvxxsK2DUTXqLPIJp9apbFk4BJ45+PT2sluTmOrkGC6pQ0QRF0AQSlJFGfYiWj4j9zbHaMbnkqKjJWeQ4KWz6ZFI0YRSyOgqNC76us9zW75gXkkbj5rKmv7Ay80HTHyV8G9s5jsEvZrYHLuCx2lt4TWEvHe28ZbhOw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:42.2842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050e26d8-74d6-4f22-3022-08df3adcf752
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR16MB945187
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyRdnlUIsozA+
 kzLSvCiSLDLIf+mHklNs+fupn5ZFANq7m9uhgXAoVs6+hU9S4qUojNt/8MBs+tdOuqo5Uj/h+2d
 7Ui5QHvekg9h9dJXpx9EWc6/3gdv4J1UM8XwchI/PfXh/IzLbq03dTTh+Et+og7l8Vm8ySPWXOm
 fIGF+KjrGqw+5ldhTBTAAtYHLc6XfyG+k8AhQajddp1B1/oV2qnpnH+12pjaHCJWLcmSfXrZ52H
 yQo+v8VwJ3M7WqJHRklw1jUzCRgSLUYWdE4jv3wKMrwUZk+l2rnBHxGZG/o1JU9gcDQ2EK8RPvf
 LZLRsAoEVBcHiPnb4ALQ12207nlDzo9nQdiWdA1Fao0p8zaB4GIbUvDcun9i/8pH4dhIaP7JOq8
 naZU4mHt2lTfjr9jk6a4XWwDiT4X4lU1yxld45Du1Y9gUEUWXjgyH/RUxTINZ8hq0VImL1RMtWI
 E//UQ9PP7gRcEjbQ92A==
X-Authority-Analysis: v=2.4 cv=UfzE26SN c=1 sm=1 tr=0 ts=6aebdd34 cx=c_pps
 a=KmUIp0grITFNz0c0ipdWMg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX2GcUnDcdlG6D
 8n/S2NrlKvb+7q2B3PrEsXZRCrIpps2f1Qhz+K/kiJHFbxI2jzRAnqtydUCF2NOMUKqn+BbAfMx
 Z8Z9ENU0A+uOxbraxEKEmVSYhhJtYeOfETieCjznb4OPVIdrFRPo
X-Proofpoint-GUID: YKZHHk6r_pzn22p8R3tJDo0M9rivIB-a
X-Proofpoint-ORIG-GUID: YKZHHk6r_pzn22p8R3tJDo0M9rivIB-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-c1860d/1793842486-D674387B-5FFC1A70/0/0
X-purgate-type: clean
X-purgate-size: 707
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index f37fddc61e47..0e5d06a9a879 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -207,7 +207,7 @@ static void cf_check timer_interrupt(int irq, void *dev_id)
     if ( hpet_legacy_irq_tick() )
         return;
 
-    /* Only for start-of-day interruopt tests in io_apic.c. */
+    /* Only for start-of-day interrupt tests in io_apic.c. */
     pit0_ticks++;
 
     /* Rough hack to allow accurate timers to sort-of-work with no APIC. */
-- 
2.55.0


