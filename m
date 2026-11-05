Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C99606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=M8utuVrm;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=gF+lL4Hk;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Ubay+O0M;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=F4fWo+d2
Received: from list by lists.xenproject.org with outflank-mailman.1473514.1681240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRV-0004JE-TS; Thu, 05 Nov 2026 01:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473514.1681240; Thu, 05 Nov 2026 01:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRV-0004IF-Mx; Thu, 05 Nov 2026 01:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1473514;
 Thu, 05 Nov 2026 01:39:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRU-0003qo-5A
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:39:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRT-001xXk-He
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:39:03 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde2e-8faa-0a2a0a5109dd-0a2a4501aed0-16
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:03 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde36-5984-0a2a45010019-94a38ff10ea8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:03 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mlwB226521
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:39:01 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurcr2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:39:01 +0000 (GMT)
Received: from PH0PR07CA0065.namprd07.prod.outlook.com (2603:10b6:510:f::10)
 by CO6PR16MB4179.namprd16.prod.outlook.com (2603:10b6:303:a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:58 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::87) by PH0PR07CA0065.outlook.office365.com
 (2603:10b6:510:f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:58 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:57 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n9203230812
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:57 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnpdp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:57 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmRKxkNQ07GL1OmRLxfFqS; Thu, 05 Nov 2026 01:38:56 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=xYm
	b4BtcVfetBTbh+LvIz+mcd8Dino49KtqJpL9zxw4=; b=M8utuVrmLPQMr5HXc8C
	0/BzgGpLfaClId1nqmi6okW9d6u6gB6lznEvXPywdW2tQqqOhXgW+MDLXn2oGZle
	YA5tioI/5kzQNgCPlor1/gGR1ivBPytB9UDLY7hCzkKHemz2WaGEJN15FdDIPO7x
	2kvzj7bpxqKLoalbY2dhbVGmQ/oy5AtrSlMR89G7FHI2O0aUedlAXoWfpSaZ5cvO
	GnizgVAx3gY5uMuWKD/UVT2fS8QqfAaVgjkwWd/kSyh64FWO2B+ZzXD+3tfQGANl
	ce5qrat4tJpfzV4z3APF4o65jrWWXWr+3nJf+HIv/1Yv72qLi3RYvFspSTSmV0iv
	Sgg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhilKR5HZD9M4sMjVerxM6YwqJmyvbhp+rwjrS20Lb25TxhYUsEA4uE7RrTtZM6wYPERahL7hGY57XXa96wEtq8NfeuXwaB2Q40sKZ4Z0QxIM7aYDzSSvpNIy/EBKmetHapkADmyIgi2WyNSFwmPbj/HqZuVnJxpErPqfqY/82h8m//SORMgmOATz5P1PTILVuZIE4/Ks+Ok/LvxWQBdurPS9KGXJiqjLanUTGw3TICbiVOGSNIaNQufTH3ML2n/xKj/YjyERkfkUErutKNDV2VwTsBGglMRXMo35JM2dmVcsmTsDoqu2cOqLhIA6NSYa2gTDIxa65dy7Uz0tqMqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYmb4BtcVfetBTbh+LvIz+mcd8Dino49KtqJpL9zxw4=;
 b=U1HbKLjuLJg1/i4xqdops6YuXLh/3nDbmsowG1fGKeMyFP7FGd1D49l0OWWpmiHy8n07iA14fg4aqFdkWeasPhaR7Zd9OMyge/F6czUFq1mxPyf8dw9+JSgSHx64VynYEIwtVelS5jvPCIgXX+znNCccC9pm5M7Pp/MOReYaf0XUlLJ+u9tQQJecTGeC/nIpxaSzH9NULBn5tIOst+Od06q6x4N4i02y+LVbpnNtDfqcSRGlWKcXlMhV7OmuPCKhMcSpMId6PEDN6tdM4rZZG5xVvZIpdyvi1pymP9+uXZn+r7AiTKWzEY3EG67+vHlq1M408SgcVJJ5WFrnbZ/1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYmb4BtcVfetBTbh+LvIz+mcd8Dino49KtqJpL9zxw4=;
 b=gF+lL4Hk65qff5vxDi6IwFDkia+Cx5hUhOvhaSJMWyWHbGGrSY4PMMXXWQAqMpHm8dF7Fxr6y95mpPeMyyuWj+hzFvfxdS1owbgj2uAQQHovDtE5KhuY/8FyG117MqqguRttU/sZ7JExwuh1BVSiJFs0PY2PxujO0ypiPXA6ViY=
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
	ppserprodsaar; bh=xYmb4BtcVfetBTbh+LvIz+mcd8Dino49KtqJpL9zxw4=; b=
	Ubay+O0MF96IGSh/adrHOn3+cLFJnYlDJPEvVnv8Yr++JJxImGp+KcqeGg3O0+5u
	sxu57BslhXKC4uTWxQHvrfomsgJxKjbkkFnoN3GkE51bv8QobyiBE4ZceNCw2FpX
	WWsyW3UdqzGsdtnTN+CPM7KhBj1WD9BJe1dUCRIZstyqNahnkOV0yZlgMXwf4yXe
	vhoyRlcA2JavFCGY+sEr+XaOXWaU+wfDUTstQtHRVefDTZmNQjH6uiOCioOzUlAc
	+k3eVljp2mRmwShsVaooVhJOUDadOWODtdXMBSj29R5JpjckaLPFCl0fMe/vkl4i
	xPseTVlo5sgWVKH3mU2Alg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=xYmb4Bt
	cVfetBTbh+LvIz+mcd8Dino49KtqJpL9zxw4=; b=F4fWo+d264MahD6VFhVX783
	+tgGs+0oEcCFeuGCKfoADa4/xensk1oWY09Md/rBZA85ICo1iX8zzrY2gLMxzjVj
	fkvvNLQOV00u9OYmHuFHHe/vpJM8NrNL1Ajgmn8RM0sSaWGEyB6XYGnZ7FLN/1j6
	YTpcOPTOBZUtBkopIOdWYbgZLWx3gGEs9gjDYigQ+5hdRJmqVmz6cjc2ccyURteB
	qosDHwG6F7nzGGYX6EPgJQ445qaKyBvBj18EPrwFLGloOMUag0sC8p2dBaHHufBE
	utkkNEWheHUE9SaaI3NfElrMk8sk0jRkZq1S6y0K0lG4pUEGZ59Q4YOIxgzwUSw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRKxkNQ07GL1OmRLxfFqS
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 12/15] x86: isolate FEP in setup_fep()
Date: Wed,  4 Nov 2026 17:38:14 -0800
Message-ID: <20261105013817.719823-13-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013817.719823-1-dmukhin@ford.com>
References: <20261105013817.719823-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|CO6PR16MB4179:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b7b8a888-5067-4bdb-045d-08df3add8f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261009223027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MDWnP8gbLKUUkEFfscdmQGOeLp5rBtKnBvRmy7E7G62Mbil2AG3CK4l68uj8wCRaKGyWx+EgIFQc4rxcfDaMVBMQ96ZAOCTDC5ivlBjliRHmCURfvt68mriEguQHXbjEUalWk9TgL15+kRhLidV7cRqqNKWOLB41HZ4y6D7Pe/GFXlaSKHEdRSRUphrLTCGTpn8N6+umrmRy4mc3NeSYHF/0hvHKGXqzkHUdEziFD7IaQ5QLxMGIV2mwY4QPpAktZDmdxwhe4XZ/AYhAPlQ1p3l7C35WOUoBFjGtCWFVimLKk1vR9911CEInQq6muIJtY5BieM/annhYVKsFQZOzDXmhi0QyPJfB+0M/Q0bKLFEsrMQuudaC0u3MD/Bn8CxOuh2e3iOMU56v8X0RCAObUnBMf7yuyA1e8mijT6x4ZTbqdYGxMGY3zVyQnZHX5eIH7vEZOke3ABq8BcYDn7B4pKvnuoYDSrcxDBARBJkrVnXvKvMMdWmf4jJZ4Bf3wbBVHANc0Zdxunf6fNNoVQIOt/YgtMx7UzeQPI3rQbrqGEMaVODx1ewRC8FncHP5cNNCCKSZRwGg50SQxoaGLSlglqZqxA7bgHTUOek8IxNaypJm+YeEt8NgBfbvAT1oz2iQYH3Oa3dcwq5paql8ncpvUEuc0VdVy5up4AA/+1uo6MiImBGent0hFoVLXl95ePQhbTcaHQ+TmiDZNeipezFbcw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PaVLpixfAPOiKCquGs/676puofZzrsJ+W/7BqWpaXQc5AWcQUgfhi/hfUH8eR0/t4e+55s3ea4fBkhtQp+DzuJb0CmFWmScSEVwZOIIxVdhAT9hM77ZdBeznNYOpg90cN6IxzuXHc7wdW2rOz5YmxDcey6upNUATPgCDvrjkPrH7oWlgC1+F6lis+UWs06sadaYaFxG71xsz44zMtPikGFGXZSKTbD0xWzZpHdnPhLJV3UxQs5rwSP8qY8xnam37Z2vQE86MyIKjOa3Kca0u+puzu0LSZjRY38EAlvecOd9n8vpLHAN7fr/hVMd2q8IKd5yFkka/vcf1JSW9fKU7hTZY7rlkgTTBMvr/mEI9k3uHxQdpnSe7VpUqo1PwGKwN7CWlmJD9nJN/mvFvuSVELKx+7Buo7Tvym8JQIHzT35tFY6p5CMop1XfaLpwGsEte
X-Exchange-RoutingPolicyChecked:
	cHWJ3sL3pvy2muu3xvqNopuADZvvqsBOTjOwEv1noyinLU81e5Ir1JgE0xJgDvsOlOULkZotUpl21PeWdxQjdl7ATHW3c71UL5q3fk4+k6KQ6UNBqfM5DcfggcAHvUTTxCjE+4xW68Ek2q0zq/5q1tldJWlPYmZ46kZTD4ZymhqYiLcer58Dd4gRPUTqpl6h7UozVc5AtEcVxtnJD7G6zUUpktPZIRETnVUhm3zlFt5sICeO2aL22L8x/vyvfNINheOPCvOV73/WShUYhe8HoyYO7olukD3JM6Z3ZcGv3aXvCRKcPGh+y51HE0yuaBSO35AkdE8F8hFJfctOx+epQA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HlkWUbYbxD7/lGh5yU/v7h4acnuDlNkNPdnupTrF31r/I3SQU/JubZjbTzviLtSM7S1pbz4C0G/2vxMzWj8Qw3VCM6Rt5lY5zatCyf2Iikyo5AaAZ7PvdzTWBBa86zwJE+u/Mh+w4gyjFgzXvlsNlSBBDQwJR4+yT1Ull4jXb2kC8nY80vnw7AppdUo905qNx857In6fhUReHdqX30oNi1R4NguPN7+kWHTc4qcX6MQ+xivkYg1aduv3Cky8R01HcRijloBwHzcDCalDHjQb02U69yLoQfG3p3OC7P5W82nlX5pv3WLLhmnSYizTqtTSSmQL55d0ODV/Yb+Ln5GVKMXPe21zjMspyj4codrllyGso6QZK9FQK44rz4h5rl/FBNFkVz064u/4VSlffXnD1jBLsNXO89ASQgyGwkOVmJmI+dGfS2ygLERk94kmmP+VDYBwNU/7bas02k0PQld+ZouB14SgShfPj/lpwKs/H93q5wEjl1ZcliIOnHOQajgqZ1btIsnUWnfM6RT/7qat2V6Tzp+aN3Lph/AIf0n8ooNLx82Vep2SYGCTCpWZl1YEmUuYNt3IWAwVqv9+K6wEgbZU+ZJrVSiWbCHOcb4wMTcnWSesrKbszWAJY13BGhOxaWwIUeXV8y/AhlXgjWBy4A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:57.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b8a888-5067-4bdb-045d-08df3add8f77
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4179
X-Proofpoint-GUID: QcXdEoiILrRYDuxwHa6JbvdXhF0Cqwlz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX5fH4M3n6oFHY
 W4WHRQ1To+GH8BgxMJHex83vxIOxVkn45XDrmbBuOqI8JrDl11kgg0bvaHHtxn7r20k6nNhmx7F
 pG9NC+wCoqEhj572XvhHA4lLxV9BJ3RGVAOsG2nzno6jXKYdvDJw
X-Proofpoint-ORIG-GUID: QcXdEoiILrRYDuxwHa6JbvdXhF0Cqwlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX/w5426rJtp6S
 iQjNBe0XsO3iKbi0ChonPb5yWyxsJbyGrUvKccZQLk0YhpXHkos6bA9LeHFoHdN4Cn0RzRjq+oV
 Nywp9jpv/VH6Xl0mVWVV4K25LgOsOhbp+aWc8jxj7CDejqLADCB/M9ukcdEhKUN2YaZIsvpg0mO
 fjtZA+vKx/3VwQKf0IxqpQqtspmm6CstqPXsxJ90xnJhxT16xbMASVn/390J4zqsd9WZ6yQrJRa
 OhkZPMkSKexlaeUQGF4dGG5DwWJmoSJhXQeME4zXDIxTvvtqCTynrsEskQ4+uyvXNKQPJsoAe/f
 mUS4cyW9SAQakBoQ6A3u18kzbu+Q4LYxhcXiMrZdYviGE9/RNWwuuvBvz6jnRE1E08h0QkK1a9g
 J8411Pc7d/pt3RY2MXfjjHB86GkLoDhEmymVojlavZrw2HbaY0DAm8AENbBSngopUiqUtOBvrx7
 QRymv4wHxvLfFd2PtlA==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebde35 cx=c_pps
 a=iByqbumfC+QZNsSPXlDUmw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=ObMOV3ej4XRLPq6fSaIA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-d62444/1793842743-BC558757-96FF4147/0/0
X-purgate-type: clean
X-purgate-size: 3345
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Keep weak symbol test_setup() for per-test definition.

Isolate FEP into a new setup_fep() call which is executed on a common x86
path.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 arch/x86/setup.c | 80 +++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index ba6f9c320843..8fea6495de1c 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -253,6 +253,45 @@ static void xen_console_write(const char *buf, size_t len)
     hypercall_console_write(buf, len);
 }
 
+/*
+ * Common test setup:
+ *
+ * xtf_has_* indicates the availabiliy of options which require runtime
+ * detection.
+ */
+bool xtf_has_fep = false;
+
+/*
+ * Default weak settings.
+ *
+ * test_wants_* indicates default settings for the framework, which may be
+ * overridden by individual tests by providing non-weak variables.
+ *
+ * test_needs_* indicates options required by the test, without which the test
+ * isn't worth running.
+ */
+bool __weak test_needs_fep = false;
+
+static void setup_fep(void)
+{
+    /*
+     * Attempt to use the forced emulation prefix to set the value of
+     * xtf_has_fep to the value of 1.  Use the exception table to compensate
+     * for the #UD exception if FEP is not available.
+     */
+    asm volatile ("1:" _ASM_XEN_FEP "mov $1, %[fep];"
+                  "2:"
+                  _ASM_EXTABLE(1b, 2b)
+                  : [fep] "=q" (xtf_has_fep)
+                  : "0" (false));
+
+    if ( test_needs_fep && !xtf_has_fep )
+    {
+        printk("FEP unavailable, but needed by test. (Is Xen support\n");
+        return xtf_skip("compiled in, and booted with 'hvm_fep'?)\n");
+    }
+}
+
 void arch_setup(void)
 {
     if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
@@ -275,6 +314,8 @@ void arch_setup(void)
     }
 
     map_shared_info();
+
+    setup_fep();
 }
 
 int arch_get_domid(void)
@@ -293,45 +334,6 @@ int arch_get_domid(void)
     return -1;
 }
 
-/*
- * Common test setup:
- *
- * xtf_has_* indicates the availabiliy of options which require runtime
- * detection.
- */
-bool xtf_has_fep = false;
-
-/*
- * Default weak settings.
- *
- * test_wants_* indicates default settings for the framework, which may be
- * overridden by individual tests by providing non-weak variables.
- *
- * test_needs_* indicates options required by the test, without which the test
- * isn't worth running.
- */
-bool __weak test_needs_fep = false;
-
-void test_setup(void)
-{
-    /*
-     * Attempt to use the forced emulation prefix to set the value of
-     * xtf_has_fep to the value of 1.  Use the exception table to compensate
-     * for the #UD exception if FEP is not available.
-     */
-    asm volatile ("1:" _ASM_XEN_FEP "mov $1, %[fep];"
-                  "2:"
-                  _ASM_EXTABLE(1b, 2b)
-                  : [fep] "=q" (xtf_has_fep)
-                  : "0" (false));
-
-    if ( test_needs_fep && !xtf_has_fep )
-    {
-        printk("FEP unavailable, but needed by test. (Is Xen support\n");
-        return xtf_skip("compiled in, and booted with 'hvm_fep'?)\n");
-    }
-}
-
 /*
  * Local variables:
  * mode: C
-- 
2.55.0


