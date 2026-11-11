Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74794606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=XLE9r5LG;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=frh5up1N;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=iMdLJ/17;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=VI1NCiVD
Received: from list by lists.xenproject.org with outflank-mailman.1484759.1688127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJV-0001uI-9x; Wed, 11 Nov 2026 19:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484759.1688127; Wed, 11 Nov 2026 19:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJV-0001uA-5z; Wed, 11 Nov 2026 19:48:57 +0000
Received: by outflank-mailman (input) for mailman id 1484759;
 Wed, 11 Nov 2026 19:48:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJT-0001pP-Ua
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJT-00H7yO-B8
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:55 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c679-2eae-0a2a0a5409dd-0a2a4509c124-40
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:55 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6a5-be1a-0a2a45090019-94a38ff1e1ac-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:55 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYWDk3458003
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:53 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013014.outbound.protection.outlook.com
 [40.107.201.14])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvwgj8q2q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:53 +0000 (GMT)
Received: from PH7PR10CA0002.namprd10.prod.outlook.com (2603:10b6:510:23d::28)
 by SJ0PR16MB4029.namprd16.prod.outlook.com (2603:10b6:a03:31b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:48:48 +0000
Received: from PH3PEPF0005961C.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::2) by PH7PR10CA0002.outlook.office365.com
 (2603:10b6:510:23d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:48 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 PH3PEPF0005961C.mail.protection.outlook.com (10.167.243.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:48 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZH9f196220
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:48 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw562c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:47 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJJx9a9URja9REJJxrD2m; Wed, 11 Nov 2026 19:48:46 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=QTL
	0Gq7NGlThw4MrMreZB972O4g5p08C5Lc0JymCAq8=; b=XLE9r5LGIhdfBiasV54
	UIYVI9yBqQoHjnql3bEWKMvl4mGljj/lOPPl+edGQRnG2jRlm6pYn2iB9dww0alr
	ZFljrGMxN2QebEdEyAY+p1wk9VyQ1yumnj8KLakXug8+5HlZtTE9XYEvRxdKIBdI
	CFt8Ls6ip5h20hYkZwc7o8dchqTkFoELytj+BdEtSXPhq2QFtTxiS4cLpJWfRIjf
	YAnMhTzKzaMrrjEKDT1U7O1TwSgJBia1RDg0eYSZzurY86Eb6dVnfSw7RZ4qbKJC
	mDxYPDwVTopeXTQrs2hWXMF5TFnwSBKRWsQ1RcQ2fTM1dNC4y1HKDU6qbVFe68jY
	FcA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7iF1ks2PWe/YX0ZPgW3yCv3GXnDzQjHvuYqR07/4lFv8XpEeZ1VxBg7+EkhurlHzlcf1VrUJTaxF1xuB6S7lnpVxAuPnm3WYeC5b28yDJQ5qstj0AgmvRoVqfd9AcNph1tF3K8QIE6KGOH+IW0ZcOFs7Hmyga53JD2+5cYW2MnUxSOcY1vNsKVK1fdrI5B8hptnoh1gSYrAhZUP2GttgI4VDw5+qdoXmanE5iUR7cMb5eh1mceh8XDceBQVQqasCSAlvDeZX2929sTklHFSMd/tB3r7voMVZZ6p8Xo6EdC/OEtwstsl5QsvMHnpnzUxr8nOBg80NndctKOU4k4fbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTL0Gq7NGlThw4MrMreZB972O4g5p08C5Lc0JymCAq8=;
 b=dq/gsQieqIpWtWVs+f/zpnjBVwRVbR39+zgkgSwdjt8fvd2sDy22Ue8ziDgHnrV/wYZeeE7UxXzBlHScE8KSIMi6kA2va4MwFU/nb63CAxs9XSBpK8ZaGbSFlM9ipPjxr4/Lk0QuZ4l4k6J2MDUhbR/CnYf/AJ3EvBua4H9+fw5LHnfw95MABcEO2sVTPUKThlWfaEXehe6UxN0oDsMSkFljGG6eDBM/85UspNIVrdhmxYfDchFwCDAXxO7LYYQsxxFkYwpeGhsDjuBFxfnk8TVnmMB9oEECfv5UF9YSt6bj7BzFPdp1PO+yPUMKpAn/FiUlXmFr47Xl4sDgO5gWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTL0Gq7NGlThw4MrMreZB972O4g5p08C5Lc0JymCAq8=;
 b=frh5up1NzLV7Q+OxfsjEnJxKAU1pBtffuqcux2aePoQ/Mz/8kanxZ3yqFA6oE9JFGkk6A7XT+uIMUR6j9RRvnBabOnn1NScT7Zd7feA9wp/z17rbiwYU+/isaP6o/+WNbuS8A2d+GdQskJf77Og0AWXuq3Y+w2P1DGOGSzQ5E8M=
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
	ppserprodsaar; bh=QTL0Gq7NGlThw4MrMreZB972O4g5p08C5Lc0JymCAq8=; b=
	iMdLJ/17K3q/ZlHRs2WFfMyGdE/vAeMb6H+cNH9CKPJZb71faP8repTD8HpRjqNj
	gSJCx1YTiOTBz5x3+79Lb4HVo4jz7ZZH52bqSPB0QQB2dx6XzUq6WQyCYde60JUy
	HWZLzXpsW5swKD6+puIG6XoRxbKo33z7Ciyhz5E9z9SIbrTTDIChH7Uuuro6bYM8
	N80UKNt4OURXymxPcAxjyh9U9dNd6HeVorPqxi0m/3Fw4CjcqjEQiiuWwxG2+juH
	/0yQ/UfGNlHzWWGAgAzhdBQr96BWMa8DDtL8qkKK58MfR1dm1RjdQbTEMYUOGUiL
	MV6ApEE5/sC5+lg8P5Fh2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=QTL0Gq7
	NGlThw4MrMreZB972O4g5p08C5Lc0JymCAq8=; b=VI1NCiVDWBMLPgN+TiPwktF
	I/sSOSm6NcfDfb6bq9v0MQ1DW4wmYpaJ5C009eZA4YxQimJx3A79zBZiRZVbbBWV
	sYhSYvoS4AqX5rTS4QTr66pKPuExEwg5r/VLCYO0zMu/nrgtJbHB8joQOCFky+TA
	d4cNJON2JHPLEofyedjcT8rnOLJXNdwIq3T1+zaJ5YIunj9HRSj9jEIn34RT0A81
	OuJfAvniU0FvhHn1pjarG8obiyHen/N8o6P+7ubU3fdoUYqcrxMZjCGOJTNJ2/jR
	0/YQynUuP9DHeLz+/jSZapHzhBxlkDhrmDsuPGA58jlTzyt3HNeHERwcEnLBLUA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJJx9a9URja9REJJxrD2m
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 14/26] emul/vuart: add global UART emulator configuration knob
Date: Wed, 11 Nov 2026 11:47:48 -0800
Message-ID: <20261111194800.1070016-15-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961C:EE_|SJ0PR16MB4029:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d98fdfd5-4bc6-4cf4-8a5b-08df402ccdcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gdFux9Lt8x6yT0KFd+keAujY8lUTtHcRss8j50HrzP5PV2ugC7GlT/AOz6mxdJtKzrzQTWnkVhdd6Ax50KPCXdCzilpfs4N2BG47R4ygmhYuqKPceMeJr0Z2wnec0MUFajc442BRdPHeSmzxDsEANR1OSDFu6BJ6WH1n0/P6HgsDYSQ+7MoxOnL1mWMeWEknefu0IpjKEd4r6kv8XNAQC6T/r5vrz47b1N5su7ZwjDHRIUWmYBxTiOlK2NIHUeF+9QrHIlvlYTXUyL+NDVYwH+1z5sqtmQXT3Z9J3QhcZkU1VTGNz7j0lWiIaCLU+xitaa8897pZrgEKhE7qRCcKwWMuCBMmXno67g0SgTE9AO3Y32UEMSfnorag+g6YvGExHh6fk7UTe7dsghHUrUSH23K2+bNMnFnEwj1NV6zPLr1xVvw33vKd2IcysE+ZXTdwRduIql8zEPF1APTZjfVboeqMWQgxIZrfiKlfB9YeOLNfiYthv9/2BRjtgJvzAr9P+YMf+xBWkpovarlfkjhGUo74wAnEyE6vbMTOuTs8SPTkDMwW6XkuV6yXZkuD+NJQG2vGbcbKR7oTruYwhjlZEKsMgrernxsVmDyI4r5OEgY8A5oLcj0fIfbGJw58JLdcv/XBL3iot0hpo/LQS04UT2B5zMaTKkr+edfokhLHDPuoleGSTYbCoYAo1LkWUX3mPGeW30NQpMltV7D33g/DLQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KSlALJj4mIwg6jjQBiG2Umbtt0i422C8n5TR7WTcB3Z09QGkP8cLzw9VvzrK0KqcMkC0DfS8yh7bxGC8miqpuL0Nh1LtL1og5zx5Zd5sYm+FH28rhWu7QbkcCc5mx62dWIbB8wAP4rHUachF+dJVCCmGbBF+w5qqMbM/8jbT/h2V8rojUep7tIMYcKpGBl9rGV8r800KApTIRH2DLbSLX5+34mIJK1V0DG699DhIV8rEHDZ/B3fp4161CceWa/cHdPVsscXtbCa72HECvMDgGdiqQV4UvUQeniwpDvFY1kqBrbftfottq2b+QBVp/fXVAd1nGTNtEuqYUSNEU8VRh9AvfrbukH3vVN3fWXyFjz7BwmmANwyn35rZe2W9vRkqdI49294GTj5qd8icEf/wcqqxR/GznzZWIps2ApH6rOSSO+bUi462Lt/42he3QXdV
X-Exchange-RoutingPolicyChecked:
	J2bRj3FpXWKGW/idsjuq5KlduS0jOsuTd/aZyI1vBxzPBwbUyoax94EBY94+bA0dSLjrKR3IrW1r5D4XZmufjYMMOLX0/rHVooXHqVU+fRbXswUcXpFJt1Zr0GQONngvAD1Jh0d0Xi3xlo/uwjm+8nalr6+gyCn9iVWTAx87R1I8e8tCYiIId6O7XTpS5VuqL+3WfCp1GLP+xUE+qdK5ClAStzsuvDLqIeySRT8y/zzli2Iuy1Q8th5K2WHXMMlfSKb8uXSsWC7fS0N7TgaiUmjJkyUUsrE5o6OpY+LmSCJV8vQ//Rh31jZg4CQxNSiORnahlOj8cfRkijfO9Lk72A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jBxlGbLvf2e8xFW8i998A81eIu/WGLyAAJapLYeT9X3Nw57QQrqyakimHhLu3eXAzLo8/7fbhrKFAJqta/xEL52NiBmTxztpbLd9jiGTTjnf5Roob/qY1tFruOrsE+j0X5e+nVp1Zc7ZSSb/6fnz1FqeUzo58iRpQhLGcbMtREg+X6kNzouYF3bJXCGlBIFs8O/B5X3j7p26t3h99+WwJgcFHiDkc82eE0pizR0QDM0C6XyNH9m7KWJglBW3CAbiqKEf/Cub0jCW28gApK/EzAPalYedtNV6BZAU8tb/EkpxryLBk6q9Crs9YqHhHfW+Z19YCf3okpx/gxrkzaGwnICPe+7OskA9UZuXoS4gIUnk8DdxdzVIv5NTCxM7sqJ5Oa78M24Bx0cyLcIrQJzznv+maITl0hs+uPMZFwJBWTid2n2JmQa7DuKOkXNLuLx73TmHKibTTmSP+0aM6WMkV6dFpKKFn4KTi4TcJz7cd+A0EnjwhQ8jJywHs9jlfLRiU9lxAVTh2UB/DpclEIw4iW4nK84IpDcSboqTX3k0T/lVLCq/FKqPdH/IpM3Z4CSilUDTwPlaQK9OCtT5bz/VldFsVztESC5r4aPaA4VFDoUKvNsrhgF45ZBbhpQ6C+rDCG9SpO/gmzfPpMbSv3nB/g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:48.4198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98fdfd5-4bc6-4cf4-8a5b-08df402ccdcb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX3aQ+aPWGTlkS
 3lWauPEKbKyVt9i0z9P0MnT4XBw2u+F8pLGDzsGRmWZa2zPiJldvUGZ4Gbz/QS+DGcP7jAlq2QJ
 EC0IceKjTU23+qF3JmDrmKju+9UOGRjukMaVBXZW8SjvuUo1hkxiXLmEBy0+GMhCzXtPQNebGJz
 TyxKY3N+GmGPBFu10xA+avqKRPmAUmyWIJtkOxdVjncNH/hynFTXi95WqgUmy/UnX8adUjw3Z/J
 J5XoQVqRV7HoOzVybNo+YxgkEcJdkuIsBAM0Hrsj3OuKp9yKPUdl+uGHIx9FwXnEUlvE/jcs4pE
 tJDD5zkLPwVvpsA3RneXr6IR8a6T64lmfde0uSZGoyzyPJri+3z1tsu0XMINpIBLl31RGTGezD8
 Cb/BtqgQmznSkhula7HyKukAEMwjXquo+HyTFyRa/5MqapMoDkFGkdktKyijBFhfYpkk/lVVLHM
 FonFv68GFg9BC1FCZ6g==
X-Authority-Analysis: v=2.4 cv=ZrZ4uN7G c=1 sm=1 tr=0 ts=6af4c6a5 cx=c_pps
 a=qO1H+kaF9sbjJIkK6g+tnw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=I8m94nRhFgdOhMwwb5IA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX9nLQybtxabQB
 6sHiGbiWwdgahJF3NthNwveJ441nN+YoqQNj3xmZEjDS4+JkzpT718nPoLD7LZzgvuUVhT6KxWx
 Xr4FGoUA41MElLiLZSfLGXMvsuJJ/WIbMnVwLPxr0FRUhNFpjcB3
X-Proofpoint-ORIG-GUID: g9vKUXePlVQypS7b1alieZGnyuvtgcnC
X-Proofpoint-GUID: g9vKUXePlVQypS7b1alieZGnyuvtgcnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-bad1c0/1794426535-BCECE034-5EAEF341/0/0
X-purgate-type: clean
X-purgate-size: 3774
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce new command line setting `vuart=domid[:compatible,name]` for
configuring UART emulator per given domain.

Only one domain is supported for now.

Format:
  domid      - vUART owner domain ID
  compatible - vUART compatible string, must match with one of the
               registered emulators
  name       - vUART user-friendly name used for searching for one of
               the pre-defined guest I/O resources

compatible string and name are optional, if skipped, platform default
values will be chosen.

Note, documentation update is not covered in this patch.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/vuart.c | 85 +++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
index bd3b756fb4d6..0df29540b1b6 100644
--- a/xen/common/emul/vuart/vuart.c
+++ b/xen/common/emul/vuart/vuart.c
@@ -6,8 +6,10 @@
 
 #include <asm/types.h>
 
+#include <xen/ctype.h>
 #include <xen/err.h>
 #include <xen/resource.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/vuart.h>
 #include <xen/xvmalloc.h>
@@ -18,6 +20,89 @@
 extern const struct vuart_emulator vuart_array_start[];
 extern const struct vuart_emulator vuart_array_end[];
 
+static domid_t __read_mostly opt_vuart_domid = DOMID_INVALID;
+static const struct vuart_info * __read_mostly opt_vuart_info;
+
+static const struct vuart_info vuart_supported[] = {
+#define VUART(c,n,t,a,s,i) { \
+    .compatible = c, \
+    .name = n, \
+    .flags = VUART_CONSOLE_INPUT, \
+    .base_type = t, \
+    .base_addr = a, \
+    .size = s, \
+    .irq = i, \
+}
+#ifdef CONFIG_VUART_NS16X50
+        VUART("ns16550", "com1", IORESOURCE_IO, 0x3f8u, 8u, 4u),
+        VUART("ns16550", "com2", IORESOURCE_IO, 0x2f8u, 8u, 3u),
+        VUART("ns16550", "com3", IORESOURCE_IO, 0x3feu, 8u, 4u),
+        VUART("ns16550", "com4", IORESOURCE_IO, 0x2feu, 8u, 3u),
+#endif /* CONFIG_VUART_NS16X50 */
+#undef VUART
+};
+
+static int __init cf_check vuart_parse_cmdline(const char *s)
+{
+    const char *compat = "ns16550";
+    size_t compat_len = strlen(compat);
+    const char *name = "com1";
+    size_t name_len = strlen(name);
+    const char *end;
+    domid_t domid;
+    unsigned int i;
+
+    /* vuart=domid:compatible,name */
+    if ( !isdigit(*s) )
+        return -EINVAL;
+
+    domid = simple_strtoul(s, &end, 0);
+    if ( domid >= DOMID_FIRST_RESERVED )
+        return -EINVAL;
+
+    if ( *end == '\0' )
+        goto match_defaults;
+
+    if ( *end != ':' )
+        return -EINVAL;
+
+    compat = end + 1;
+
+    while ( *end && *end != ',' )
+        end++;
+    if ( *end != ',' )
+        return -EINVAL;
+
+    compat_len = end - compat;
+    if ( !compat_len )
+        return -EINVAL;
+
+    name = end + 1;
+    name_len = strlen(name);
+    if ( !name_len )
+        return -EINVAL;
+
+ match_defaults:
+    for ( i = 0; i < ARRAY_SIZE(vuart_supported); i++ )
+    {
+        if ( compat_len != strlen(vuart_supported[i].compatible) ||
+             strncmp(compat, vuart_supported[i].compatible, compat_len) )
+            continue;
+
+        if ( name_len != strlen(vuart_supported[i].name) ||
+             strncmp(name, vuart_supported[i].name, name_len) )
+            continue;
+
+        opt_vuart_info = &vuart_supported[i];
+        opt_vuart_domid = domid;
+
+        return 0;
+    }
+
+    return -EINVAL;
+}
+custom_param("vuart", vuart_parse_cmdline);
+
 static const struct vuart_emulator *
 vuart_match_by_compatible(const struct domain *d, const char *compat)
 {
-- 
2.56.0


