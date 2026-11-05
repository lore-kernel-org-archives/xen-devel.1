Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E4606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=bAWcRP/U;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=RnmLgHO1;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=UXwl+wdE;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=GxTAL2yp
Received: from list by lists.xenproject.org with outflank-mailman.1473366.1681000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmP5-0007gM-IJ; Thu, 05 Nov 2026 01:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473366.1681000; Thu, 05 Nov 2026 01:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmP5-0007gD-EV; Thu, 05 Nov 2026 01:36:35 +0000
Received: by outflank-mailman (input) for mailman id 1473366;
 Thu, 05 Nov 2026 01:36:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmP4-0007fK-Lq
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:36:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmP4-00G6iA-2T
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:36:34 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd38-8faa-0a2a0a5109dd-0a2a4507dfb6-30
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:36:34 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdda0-b4ea-0a2a45070019-94a39217c8c8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:36:33 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mSqB2567972
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:36:29 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012033.outbound.protection.outlook.com
 [40.107.200.33])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvb8v-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:36:29 +0000 (GMT)
Received: from CH5P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::8)
 by SA0PR16MB3727.namprd16.prod.outlook.com (2603:10b6:806:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:23 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:610:1f2:cafe::13) by CH5P221CA0021.outlook.office365.com
 (2603:10b6:610:1f2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:23 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:23 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mcdX2969017
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:22 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrk5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:21 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmMtxqlyn9qreOmMuxpgwi; Thu, 05 Nov 2026 01:34:21 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=TQL
	xEbnwFJ4mjqvukAWDSTdndiTYycGzw2U2ukxH/7k=; b=bAWcRP/UKnOZM5llHR9
	r32ngBLirgs++9R0GRZKlZlggRgfRmaM0x88KjvGra0sochCyLini2zQQhgulWpE
	9IpbepDKTLdznhtnjXhPuhalY9SbGqKaha3DQ+cgSPRIITD0jws4VAeEjgcUPhIi
	qvL9Jek9qXnlhNcUZQ3BFDAuGn6lIWIimQ8M2nPXOZXXMWrc4C3D/oohyvADrCWA
	CNvQkLj02PCb0PJ4AjeV5j9Gf/uYNzus6Tuaso6kJAkSbr0eWKjziBOlBRxZbmSy
	kOSDECbyvJsalyHRkZK2aH1P7JhcM2OUHeQG1wTfNGizknn8hc6aVn1Yq8zAld/U
	zxA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHZj2nOi2aZ1KeiruirmczAjNZvzmECznFALhd8CbPYiX3rLnPdDE2UFs6kkiQvaxOoL5yDlDgr1UEZ0DqcbVuTnOEcAtEOzIKmMRfdpVMFF/qU4dx+i/gy3y8WtMoCx12OVj4menL+mbiLyQVw4AhBrXS6YraYGpvLn4WsPk6qUGjTQISqBvuBK/3/bDfOooxN4muLj13qcS0dms57qYdN1FP9SgeiHewVmhF6NgnvrEeR3I9Bm7e71S638+uBLvxMcni4hHZ+maIyqwQ01bzOJms3lrzjhsuCiQSixTeF8OdWEn+r4T8SA3Yu73OD5YPSGlU86CwbgTItCudNmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQLxEbnwFJ4mjqvukAWDSTdndiTYycGzw2U2ukxH/7k=;
 b=jp722KmxaxgmgWHa40gFVOLLeo07rkqaOVbU8ZVjVacQAUM8P5faSHhTwbUNcCOeRVPbN6F6BxtU+DVNRi7ASr0JpaWeKw/NCDAilNHzhZpoSoIbjMjZ80rlqTN9qz+7GqbavjATPrhd5aGk5l73OBQ/Lh7tsxXL67aMu9KVZ+m8n/U2uVMv6Gz3wbBueiAL7fJL+0+2WCLtpmictgv9OMrqaQjGUX25ss9gLem89hgKF6EzYW3HR468hbrsfp+mSy0X91OTLUnjDTbzoHVXhT1CJxmUAUUEztDUZkO7poF6fe8c6YcU/OTLKdrSTs7WgZlpmx85qilR88Lul/OTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQLxEbnwFJ4mjqvukAWDSTdndiTYycGzw2U2ukxH/7k=;
 b=RnmLgHO1vDwWtjIUtlvsCGHte7HG13DHw1/wkktiiwRn+gLsPdoo1mxmhjJfjNw/cAJTYolYch3iKkhE3gKckQsOtrsofAFjKzPL465AGgneBZXDyV+pbC8fZGk98EmyN2kd22v/YMRuQlWeiuMCfCtRqP1JNtNQkU0oIl9spek=
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
	ppserprodsaar; bh=TQLxEbnwFJ4mjqvukAWDSTdndiTYycGzw2U2ukxH/7k=; b=
	UXwl+wdEcY+yE7hNObG5/ZAFvEbEmGWuwGwWvRuyJzXw+VdqKXOoT8aRbWn9uzxB
	r0wHdN9m5CeomP+RjjcbUrNMt+C3ZETw/LmMOyFAvleLW49j5vNWJrbz7JQ/+4D6
	w4s24SfCidH8Hw9H6WobbaGZqWbj7TadCihgj4roGSBM+WRTsvxVnt9KjcFOzHf0
	YaVoMOYMnWtAnIPnb/KIpTmxQXqMRF0/+/fLEAi8auctLsyIsaZPgYvFCg5iCD6M
	yZcJgKBHntF/WsXICFvPxca7dMxNWqnOGQHIiOXIc7RCmlbVdUZL7gkystBeN83a
	ssxIPikg9fbnMOjrGZT5Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=TQLxEbn
	wFJ4mjqvukAWDSTdndiTYycGzw2U2ukxH/7k=; b=GxTAL2ypooPzRPwG3ulQPNH
	OpaTnEGTXPzaUXbD/yHL2FDhdQLjA0us+vAJF+/C8Iv5Stf9h1jM+Jj3V4/1dMZp
	NVSv7XagE7bcTVOXf1e6unUxIE79/LO/LrUAGlzvGU+PpEgBFeoo+ssULNE9cQUb
	nyooay/i51USsBOgXMhKF+lDNZdO+ZJdFJWzV93dNE57J1AXPVC3S3u+4r4V9VmM
	O8rX/6QNTyoUvYMPtczOSveqGCNyKmWtV+g7iTGDx9vm/TGSP7QM9OQHcM9BcNRN
	qxllSBp6fk1u7zmXggBqLo6SYo5OGIse2nbF5wljlpcG3ZBWY140rOgRhnXssDw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMtxqlyn9qreOmMuxpgwi
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 05/28] x86/hvm: cleanup svm_create_vmcb()
Date: Wed,  4 Nov 2026 17:33:22 -0800
Message-ID: <20261105013347.719392-6-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|SA0PR16MB3727:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bde41214-9d5a-459c-9e9c-08df3adcebde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|10067099003|18002099003|56012099006|11063799006|261021123027099003|261022105027099003|261028144727099003|261009223027099003|261026121527099003|261102123227099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	Iv0hugzLb1s7FQjJeV/+kTTyPWdrbiQRXPsJ5JFww6x8PKQB1UAEUR1d82rlU0iwMy7Lt2R7OpgUztgDK+3kxtjMuavwlfHh/cekkBcD5lq5egUK7QLcF9uLsGGxLQVMbLxyYvEJHMpuLUbzFFBKmN1ko7DNU3leCL2UBsau3xmWL19pd9zZA85JVvhyyF+lorCZW2WCtWP/nIoXXkGPXgSOYilhOX7jJGjTJBv7drtFO8ysL+FGOnVv1WFGyd6rDvzvkSr+B8xVoYeTxif4IbeBSUqM7b5daFAQASUowJfYWgE+T9n6InHwILnnpqm08gPGbC+EplG3mhRXpx4Yda4rn6u+iDZkdFr0KxF6YzEFiYmbe6tfWfATTcwh3veojAW+PNOw0X4BfZH2zAswDrmL04KYj6jpNAAa5EGOFoxcTHEH/72X06wD+ggFG4a1JtQbLiN3WOyaRj5LQv7kEFPPkKBvwN0GksVoEzVGXPGedUpX6H7imMEfIQoP/QvUYjPZ9z7io8DJ8A3DK2xVrpOfQ0BumOlx7mh2AK04C5L/jn0PurCt5eDBfNoIdyNAAvzCA45YorWguGqYw+eJr8swe2hpFH0+bor7iJrJMLzmc3SqzrR7LO5Xihf5Ndnzk/TWpn23ofIVLKOv2I47nme4w1WvGfP4QAM6TjXV6Jx0dg3y2wuWTrt0Zd7ufvEGKChqTLnn7sujhx+NJPDgrA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261022105027099003)(261028144727099003)(261009223027099003)(261026121527099003)(261102123227099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BfS9oxtXbhmvKjfSGj7q6eTjJSiQ5g7iPa6kv0DL6JOZ95LKIXtCqlOs7Vxw+h9QtljHORAkHGOzWKAB52hBN89NAYNgTs0W1f/bBAfGfSD7CMcJvXrALjAga0ZdS96R5lEw9gQjUCUXoTCKaqnCC72AgI0Fm40EHXt9ADO0RSoYXF7hetyTPOgjHgnFhcmDM1XLT2nTjvuDXV1Vc1iJSJmE4IjgQVFabaD24QWU2MJOcJNDrY4NK8XqRjUPHLPpEfsgw2uzk65dDpJL+zCVjwHgezuO026C8gcYAavtKEfFL3TA2O3nWDQHoSqyEVdcFxpkeEb55hPuNR351sHd9c+kljIy+Pp/7axQSfILfiy514uigW35oCzRkh4C2dU6dIctyPVW9RwYmmuHuD6nwV8G0eIikA9Fl6t8nUAZt0L165h/ih//5qljY92AA5y5
X-Exchange-RoutingPolicyChecked:
	PkhWPAK/68EDdddcooLt5BLJfJ0Wl4NAGo3XeJALJ71k+j4vPO4HPh/zce5YjDjuYHJsTWe8owWxqYzduILxtFdpA1NyDfcYvS/2oNC/jgHww5NrJG4dqPn76PW+1679TZuiRTaJAMeRUZdH09ojhita1aCljDVUpopj4khvZUTQXGO+ceEejfgSz+cLJHIfwsOb4+n+tlhgIyYm04MCJVBb6FVPcayNOFeyM9iqbsrsOVeN+EkfAUzLvCH8ZCru/wa5FxqxIJ2vCXCGaOqF38QeYqzIhtZJl2roDo01MJmWh4YdKSmMNYBsPok+NMRJmUEeBXV4fA9BF83CvTPsxg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XseIZWm/LoWxGhIbx94f84eQBMuXjE5UUY8EgoJ+0+if3TiWWbQSWAPjBC0krXzVvTR+cfDMat0w4GsTJ5s7zhFUuXqRpsgrNN/4Suqt+c74tUecqKE8PaFY99J9tmnKvNDTnc9YqwbJklx0n5gUa6gvDUJtEV396PPssHmPfN3eYfCZbPWzBHm+yI9Ido21U1+GyptfKIvnByDIDUifOS3cELuN1q7F02J721hF4KGB+cmJTBW+mJ/NUs3jcBPl7fudWWHZhnnliJirn6DBN9fhiMM5FFkHYBChpY97JEgKn9JYVJtJ++y76Asi/spLnT9SU8T8K63e+FoKCUFvwlHmCloGm4t+yRkAXZ2yPWCkPKVsKmfUymAwZSdoWU8IYOOBcUzLhvBZO5vUq3NyDqfPfX9I5U/bTYUPFpangTbGbZqq6p2Rz2PxyRkNk3xyD1tkA7Gp1zPmmjqHa09uscQ9xrXJ6CrUexPIiw4ipZiMN+s0vtcIOVs+KsuYofkDr5YcqsjWh9mA9e6ZE3isms61tuB/6XBj2inX8rqJvb3cnUvJVFrNeO6I+kBNO+s2K1tHNmOHZoYj0Uivl8j3q3juiGBRvxruXDQGFsdjEvGvzRLpHVqz8HdGk5X+3aefUKk82lrZUWmKSR6XdGl7NQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:23.1262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde41214-9d5a-459c-9e9c-08df3adcebde
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR16MB3727
X-Proofpoint-GUID: QfyAVFa7IwVjMXQ-Ln31LrFlw0E2EOGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyufE4KNGpleJ
 hzuBE4T6gTTfsLtvTm7PaokA4fUbusNar0pa1H72Q33Zlz9a6h5ufb7Dp6E/UEhtJbzQzqs0PX6
 Bs5sW/jF/Jg9S53Zodb3T53pjcpA9qotCwUzZUcgLe1YZktXBT2vPfyjDZFzakDWu7KoL3d9lVq
 4jBxYibRncSY7ScCwmwxNDomWsi1Mv+urs44GWLMMCaqOQW5Q4iF+GEeHgxEveoz2fM24HPqt0E
 2CW0X60llqZJDIvgk092EYmHGpdsFwuVwTHVt9G0KY5Bizor1s36ay7Uxwrwje7I4Pt7ZtFQrZp
 D9mDUJoK5Silgt3NODPQFBrLyP5hyXc/6P56C3CtvkqgUX5GYjB9hiFgJObWlMttXN5/CufF7kS
 GJa+lVmhmo5ZBQgYT0YwMJmAdRQx8jH1NAXpf/SkY7B87PjaHwBgt3ZTettc0VQQstI0fWJ/cjD
 yjsxLEx9x7Ra/YWulCg==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebdd9d cx=c_pps
 a=7wosIiAuCGbz/5oJp7M3oA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=Ia841Hrn3UmJ3hU7yQUA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: QfyAVFa7IwVjMXQ-Ln31LrFlw0E2EOGf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX3PkKoYW8cfiI
 pAHOKMR59G0hQLL1uT8Uk6IYcVhutyTAJY3s8J3YGn5cUQLpk1q6vw9joQXzH6tKSBT++2Aw74A
 OWpNjbiGYKbi4QBCYJSqdsQ5KFdtW67zrQOF4hJ5EISBjNh4OqrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-ef75cf/1793842594-A68D9AE4-CE1B49B9/0/0
X-purgate-type: clean
X-purgate-size: 1609
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

svm_create_vmcb() does not need to be idempotent because in case of
failure caller must call svm_destroy_vmcb().

Simplify code in svm_create_vmcb() to account for that.

Also, fix MISRA violations in double assignment to vmcb_pa and
nv_n1vmcx_pa.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/vmcb.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 33c85ea3bfc5..3ec5bdddf588 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -201,26 +201,24 @@ int svm_create_vmcb(struct vcpu *v)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct svm_vcpu *svm = &v->arch.hvm.svm;
+    paddr_t paddr;
     int rc;
 
-    if ( (nv->nv_n1vmcx == NULL) &&
-         (nv->nv_n1vmcx = alloc_vmcb()) == NULL )
-    {
-        printk("Failed to create a new VMCB\n");
+    ASSERT(nv->nv_n1vmcx == NULL);
+
+    nv->nv_n1vmcx = alloc_vmcb();
+    if ( !nv->nv_n1vmcx )
         return -ENOMEM;
-    }
 
     svm->vmcb = nv->nv_n1vmcx;
     rc = construct_vmcb(v);
-    if ( rc != 0 )
-    {
-        free_vmcb(nv->nv_n1vmcx);
-        nv->nv_n1vmcx = NULL;
-        svm->vmcb = NULL;
+    if ( rc )
         return rc;
-    }
 
-    svm->vmcb_pa = nv->nv_n1vmcx_pa = virt_to_maddr(svm->vmcb);
+    paddr = virt_to_maddr(nv->nv_n1vmcx);
+    nv->nv_n1vmcx_pa = paddr;
+    svm->vmcb_pa = paddr;
+
     return 0;
 }
 
-- 
2.55.0


