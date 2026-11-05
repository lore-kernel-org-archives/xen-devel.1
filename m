Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88995606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=JWQIGfQS;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ID3lDvex;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ZzobaZWh;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=KawqF345
Received: from list by lists.xenproject.org with outflank-mailman.1473480.1681143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmR5-0000Cp-4I; Thu, 05 Nov 2026 01:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473480.1681143; Thu, 05 Nov 2026 01:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmR5-0000Cc-1U; Thu, 05 Nov 2026 01:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1473480;
 Thu, 05 Nov 2026 01:38:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmR3-00007y-8W
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmR2-00E0eP-LW
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:36 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde1c-2eae-0a2a0a5409dd-0a2a450b9526-0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:36 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde1a-b7e8-0a2a450b0019-94a39217891c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:36 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mW5o1469725
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:34 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012042.outbound.protection.outlook.com
 [40.93.195.42])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk51285-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:34 +0000 (GMT)
Received: from PH7PR13CA0013.namprd13.prod.outlook.com (2603:10b6:510:174::11)
 by PH0PR16MB4296.namprd16.prod.outlook.com (2603:10b6:510:54::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:31 +0000
Received: from MW3PEPF00001654.namprd21.prod.outlook.com
 (2603:10b6:510:174:cafe::27) by PH7PR13CA0013.outlook.office365.com
 (2603:10b6:510:174::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 01:38:30 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MW3PEPF00001654.mail.protection.outlook.com (10.167.249.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Thu, 5 Nov 2026 01:38:30 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mZU43108458
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:29 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swb3b-13
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:29 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmQsxdLMvmeVDOmQtxZq0N; Thu, 05 Nov 2026 01:38:29 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=WQw
	UsoGgprLH4OGDgy2XzFRPDedseFXNxlnsn+UVQxo=; b=JWQIGfQS8qJKoqTDGcw
	Uk8xafFhO1ikql7obixfUIEjO5MSwg3ynGu787fGdjlRHTcZ35LtW1nJ/O7oA9xq
	AHa2mAVah6ZvbtKY1htTQ0NDjSQ88RDTZGjvdFxmZUXyygU9Bznlq+uWEP49aYCz
	htUvRAg+NfPY21n2n6dIu0PWSZHVrh3T2OZS2ne0BrEl6aQibbWMr+Dk2TT9XgfF
	KadWjPEjdD9Yq4oYKJMJe5AytYfB0JZWStHlwtv3jKzf2J6TtRmo2FFqZf76DukO
	N4D3zP4xQ+fAgJEi0j0g6nioI1cSHh7UEhDMLOyi8O3/Hi/KECE/M0HYtkqzkDKa
	1vw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVZphTNTGSK/IR2XcueTZxjqmtY5V9hI/ltXf5r1KAhf/B1VkywS0z3vDUFbved5Pe1EKXW88UVfbA+Gj0q0PaNAuahZ3KoBmNZ2v+LLrDVSaXA1Nn0VFj3o88HrKMdK+A1LmvGyaD7rYlYdliXQjMKz0lD7mJ1JPVQ2AsS+yRxbTPy3lAfcBhld0QnWOEmUTRXgs7mZk5zlZfmEoHtX/OaDTio7TO+2QSJWFM1JgW2+LT0XY9R9ZYCoov4ams0FQxgzczvFeR8hmJrFi6Ts3fdBkCV/ihxxmrS1wHoSRbBkLaQv4lbAXVTPXusWxHnwCIGwixMJKa9h6Ux8fArCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQwUsoGgprLH4OGDgy2XzFRPDedseFXNxlnsn+UVQxo=;
 b=JSXv6DAV4al1kggbqwgnFPGDc+LYoy3SIdYt7sUeJ1qVxlTDdTKFh2Df605/tD6SKQ/Tdc8GkEMufHbHeR0husurl0f7I25aRS6NBhRGlbvoX7Pm40I+X3j/9zygVwG19HvxivTeo7MpJia2o/fqjIHkpClOxzPw9s1+nHKnZ1YGU6p3mTIAK52CCjth3jsMkgCJ7Fwf6SBOwibq4Fw9u5jfOK/SSTwaNfLw8UORGFmT6jOBbNbCL3O1F/0V0BVwuldaBVNN7p0uqyiQnXIWdVC8DOMFYwUXYoUXfj5+an4CuQi6xmf9rKCJfAIKURxblna0AivC8ooi01ap5D9Zjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQwUsoGgprLH4OGDgy2XzFRPDedseFXNxlnsn+UVQxo=;
 b=ID3lDvextgV847XCnB5FfIJC7Hgzly59Ec2J6gbgOf3gWlEOL6ep2abLUsuCdNPneuW55VTE0GD7jgZ2tcCCY+2JLvIVa/N0+mbcsd+U7V3TLGF2Y99+os5jnNdwYvZme7wRIFiFQ/kmD36sFegyoOpcc/BOHO5U4wrXh9VGFK0=
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
	ppserprodsaar; bh=WQwUsoGgprLH4OGDgy2XzFRPDedseFXNxlnsn+UVQxo=; b=
	ZzobaZWhGc1AKOodifzTw4g5GGb/giUKnjVOKtrBgsdkM2YIH57QVRU4JGJdSvE2
	eULLEHJ7LABjxUwLovHPX3Yh/v66Mtkv3K2/ONqJ82ug4d46tHpjZxxltZq4TKNK
	Yn08OVEXN/Qci1jUzRNgimiaLciNyo9ZssXjDw/yp7cdPHt3dt/lb5TlC2HxV7Yo
	kwMJJ5Q0FS5ZX/uPznmeOGFGIXeBMaJobu9tqyXPSPtVWhneE3Exy++VvEJ5YHz1
	P2XW7Jq6nMLEsNT1Di08bSihV3aP/24JV3VouzIiy2GRR2F1SwiZX5NGuABiakty
	vSL+j/fTopXLAwFXu5RN/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=WQwUsoG
	gprLH4OGDgy2XzFRPDedseFXNxlnsn+UVQxo=; b=KawqF345Mpk6L6510Dc3Q8w
	VtIjjJiPkcF9IcJZQgIbEOrlwX/5sKWlHrMzpB7v0XGxyN/+SDpq+qLNJotIl4G8
	2wrzwYjOfRhuxsT0jc2H4+iyoc8NjbE57AWjVKOgqQrxWkNSgCnZHh0+WvpjLQ3O
	fKOrvWLKUllecFK92gNeHEdguqL+jekm/+uFrNHs6yKwl1r1Ho/5z7U1INNvlLxr
	mHIVgShoerbTNO7+lcZuENf/z+EyC3ST9Ubq1D1htgMbUlL4VkqjG2ud2Lt5IwRU
	rsfKyEsoeMP9CgJ9cKex5GEJnO2yFmaZAlZ2ZhP2ky+6DBPkCArPOwFw1gul53w=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQsxdLMvmeVDOmQtxZq0N
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 02/15] common: add per-test Xen bootargs file
Date: Wed,  4 Nov 2026 17:38:04 -0800
Message-ID: <20261105013817.719823-3-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001654:EE_|PH0PR16MB4296:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 875878dd-4ef9-4547-a9e0-08df3add7f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|261022075727099003|261021123027099003|261021121427099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	JUhEOd2s1m+bpsttxFTqPnsDW1KYHPiJejsgUQrj3syOYD5DijiKHxUHEkC+tR9XmkYSa/Mpg89VJ8lBJIqjkMQD+r6KhJJLSFKwI4Ksidg0hTNuEDRBQq1ElbJFU09EGfynmMVvFyhG/4PY94JCOl8ii8NNgaR2ENZdfjGdBubQe3G+u48nsDXLHh/Xy+SiC7J5v2Np5+SEa6L3Qf742agY6VwxCvt8YSOkMEoMdIuJE3cIGbwsFAnYun/r5GRcjTMAQEkY8wQvgH8tSABTCoYG9LwGfcGg7i09idKDWALSunydgrVR8Cvd0RD2qs1NaV6swOMCtQSvaFEsdbU21jdSH9CjgZtlu3+lka9MOyXROgp1luLHWTAqdqnMAuR2k2xFKzFoslSWwr172EnhVqlwpi1iy84pqjT8rK4eRXKMtx1WRAEb6S3w9mqIIRrK9ZhQwobwu1mPKKY0fr8ZlsMoGGoQMPmkflUEayiIwKlhODjkCJ/OuJXDGcfZYAWZYECmXvLAxGSdx4e7xmYny8W7NUL+G0LxMfFI25Rti9qVxuLLm9iZ/2LrFbdsvi9/Bkqp5DAVD97cnGCEXJ25JSgrmqa5+7fGkayKSXT+WgsygL0pfFL+y7bxIIUMkKAnzj9VYRB+AMPXoQQs4xUXs9bUeLQpLGzp6niknhb6pfzTXVeg2F+u6X768Mecd8CftIlqfNXxvfY6eIASxtVuIw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ol3w9s+t8WG5nWyQIEbGZ70qyKFKoSG4fmk0ngRzEXvrEOfi85YOK8Gk20OeKRUynA4mXHwGoz/2HtOcqbN+rI3gVopn/X/sn4z2RwX33VfuEtN7pL/tOgdSU58RBrJu82FXyryol+n8Z/m43eF7ADMaQwxxzdUyPQ1AFtgAphfhjgbiGFaVeQ0XW7k6VD9fD358F7kii8GB4Zn1YygAXHFu+oexXR1x9zh/KI44N/1fg9XfGgwWnEe/rrooHJhCMFrv2kI+B8SFxaV6mNE7w0Z3zkypDXao90zOab3f6tFJBTDL2u34vdp6BoIjzSnjaAyRDcdTekXwytnOJBppgCmPRky02AVXR1tgFt8eg1p7yU32c06s4kUqNhite6sWyBs12FxIiSCTW8rD89BNeCXzJRjv5L960aYfQlERyoY0axELJOBkP8baoTOEkvbE
X-Exchange-RoutingPolicyChecked:
	WxB/QvRc0vB9mz+fs08M+FGvsVJNi6jM1T7Xh77i3hYgre7OTPPwoa4Cx7bTcQBc4dPh8AVFLjrn9cmIKqmi5Q0KzPiAvGdVqxr60pO5nbGBR4PpsovqPi2sOyS3blvt4GIvX6UiBZSPr+70vejIIQWhsTB2S0448P+e/QdQFO8YKMnlWP6H6PTPs9PUjO0tF8PK09MhEWxws9S2JFZWi0utOWZtypfdjGBIO2kb18/4ydCvYYovnPnEebugyKMi3WxejE32Wzibmkm4j1CFdghKJGqznzfw1zhYQPaHvau15PN0k7McBOd3HtF1Iump5+lZ8Bqe0/sOJvUGyni4Sg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ddJbrKw/LFxQF24KdrgCZQitfXoZtE+KmXrgPD3Ntr2fvCihaGiQW+kFCfSkc0GhBF9/rxZNrDeukeQEEeINy8sbEXRYgbaorxsxgLI+ADL1L5ERqOKf65y5Xx3zMToPRAxTrPPtE8HhkkE+lGRH2i4w3E7xHPBEmy6DsCDEiWhTwU2Tp/ftTvRqclavjDhNiefUaHVaGbHjusYglpuLr3YaMnbjl5dIo2pL0BH4Wd7Pd1f3rBNgRHB+eHd2sx/fuofEvsSpd22xN7HH/DxSHEymB1lHWtLxqng0E258jKhyBPI+qMWspIakixt0461s/DJnhSjDV+AFGrB9UbxPbhd0JqqywpFH1NrqNeLKdUzLsnEKuRMccFk7yUzkyKvShCrmvG+zM2G1NPDOX6yC24oZI4dklgAdQdgRSakbfpK5ybed0dltGPma0lHmWlXgufEXVxTOkmStA/+n+PBfz2OCsI/9PhfAubSX1C2cLVBJhSRfl1/LC+XmwIomaLHI++ZIkrDsEPydizfow8GxjbtjzebbH4rn0/yUTJJ+TmRYcWKQsiYoXeny3124GuIE/imbc+QkY3/axXXsm3MVxrWojhCxylcNBRGECredeL8K76uaKyOF32FKm8IIPiYWluB/Uj5uIFuFy78QUxd71w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:30.5280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 875878dd-4ef9-4547-a9e0-08df3add7f51
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001654.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4296
X-Proofpoint-GUID: FQd21s2VIJfsWvBx10bpD-HmDFWDA1Vw
X-Proofpoint-ORIG-GUID: FQd21s2VIJfsWvBx10bpD-HmDFWDA1Vw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXxonOpWPAyjE1
 DSpB4Fz07DMKNGVL0NjgwGbZT82Fc8uPZrYLs988Z4lmeYLyeIYRwjdRwOq5RCEUut+JdVQjZw+
 Yj2G3Iv3e3Lht3ASfSSCu5y6DaXOTWkagfm0BtLaA5AiPRhKr3lk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX3H6AmtpJlavI
 o8OobDQwuE7dyGlU/EfMpgpeP5pmylT1/PRC2oI4UFP+q6pi1BYUKqxyZp9Agug5bkKwQBfyiuA
 mXM400er+onCXZMmTLha0+GEo0At02KD+ttlDT+qsQqrHGpDxB55z+IFYXHmKqjToiRK+ukrzyd
 A2vqNKhvY7hkZW7L5Tgdgmzs9tOBK28HBB+6vMAo6qIzqlUqzixkmKzWAcIrdmKBq6AqGH0mt95
 92HZicYJFe/ClrFn6d3X8XNAWnsU3TvRuMcefN33jX6yo2J3lGztNDu+y2UYsOvcXdVNV/nxncL
 DnGSEnfRTSH5BZNQYa4f8vNhXltB1nXDX/7CczD0Njv7ODyRS6wZcxK5mNBAvjvCCxdoJnaSewn
 5dcKGi7VyW8hzBuSLr4hGfRP37OswjjhUoZ5xGjIeGMvVdPlO4Z2d7bGcuXp7Y75W8XOrgJPWUS
 OyaNLPKH4lCkG9NAqwQ==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebde1a cx=c_pps
 a=WIVU+UPliRI2+OFOdf1Qsw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=X1Y2loGY_Tf15Hl3f4EA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-42698a/1793842716-AA6DA9EA-FCAAD760/0/0
X-purgate-type: clean
X-purgate-size: 1622
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Some tests (e.g. Argo) need special Xen configuration to run
the test. Add support for test boot arguments to mkinfo.py.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 build/gen.mk    | 2 +-
 build/mkinfo.py | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/build/gen.mk b/build/gen.mk
index 8c400e6595e9..999c2e0dddc6 100644
--- a/build/gen.mk
+++ b/build/gen.mk
@@ -36,7 +36,7 @@ build: $(foreach env,$(TEST-ENVS),test-$(env)-$(NAME)) $(TEST-CFGS)
 build: info.json
 
 info.json: $(ROOT)/build/mkinfo.py Makefile
-	$(PYTHON) $< $@ "$(NAME)" "$(CATEGORY)" "$(TEST-ENVS)" "$(VARY-CFG)"
+	$(PYTHON) $< $@ "$(NAME)" "$(CATEGORY)" "$(TEST-ENVS)" "$(VARY-CFG)" "$(firstword $(wildcard $(1).bootargs.in bootargs.in))"
 
 .PHONY: install install-each-env
 install: install-each-env info.json
diff --git a/build/mkinfo.py b/build/mkinfo.py
index 30f99832711f..f1c70f3c444a 100755
--- a/build/mkinfo.py
+++ b/build/mkinfo.py
@@ -2,15 +2,17 @@
 # -*- coding: utf-8 -*-
 import json
 import sys
+import os
 
 # Usage: mkcfg.py $OUT $NAME $CATEGORY $ENVS $VARIATIONS
-_, out, name, cat, envs, variations = sys.argv
+_, out, name, cat, envs, variations, bootargs = sys.argv
 
 template = {
     "name": name,
     "category": cat,
-    "environments": [],
-    "variations": [],
+    "environments": envs.replace('"', '').split(),
+    "variations": variations.replace('"', '').split(),
+    "xen,xen-bootargs": open(bootargs).read().strip() if os.path.exists(bootargs) else "",
     }
 
 if envs:
-- 
2.55.0


