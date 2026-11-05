Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F825606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=XCymjOXn;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=a4Bv+hLW;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=b1dYqH2L;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=RaylWV0e
Received: from list by lists.xenproject.org with outflank-mailman.1473167.1680783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmN0-00046G-RS; Thu, 05 Nov 2026 01:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473167.1680783; Thu, 05 Nov 2026 01:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmN0-000467-OV; Thu, 05 Nov 2026 01:34:26 +0000
Received: by outflank-mailman (input) for mailman id 1473167;
 Thu, 05 Nov 2026 01:34:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmMz-0003vB-Sb
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmMz-000x9s-9K
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:25 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd1d-e002-0a2a0a5209dd-0a2a450acf66-4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:25 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd1f-f2d2-0a2a450a0019-94a39217f36e-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:24 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50ntOX3733991
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:23 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013042.outbound.protection.outlook.com
 [40.107.201.42])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr983v0m4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:22 +0000 (GMT)
Received: from BY3PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:39a::13)
 by LV3PR16MB6319.namprd16.prod.outlook.com (2603:10b6:408:1d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:20 +0000
Received: from MW2PEPF00014673.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::98) by BY3PR03CA0008.outlook.office365.com
 (2603:10b6:a03:39a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 01:34:19 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MW2PEPF00014673.mail.protection.outlook.com (10.167.249.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:18 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mupB060090
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:17 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxy7wh45-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:17 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmMoxdH5ImeVDOmMpxZk7V; Thu, 05 Nov 2026 01:34:16 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=aR9
	l/0zpCxaOUzt7iatNB4TFWCmkHiKvjdLyt05m9Ps=; b=XCymjOXnzE2rKMGS8By
	r1Ji7u0VzGKCqrCcIlWB14kPab9XKjzrUPiF347x0D7o/6df+X17CV3IEfQaLa0H
	iPLtmmVdeQ05lCsvJwbVGnpv/W2zCf4twAwi8r0wHibmDoi2pKInOBUWJG/sFdYN
	qNQdWugXy1K0Qv9Cmm0g9DamlBmKdv6HZ+ItNpUtpoGX6kTekhAqR/smbuXrpTfg
	kALZb1JDXs03v+egVAyNpEqVPoI9A10WUcLq7v/iKFMK4q6Ev3zMyHXmeh2Jnk9t
	QC33KHnFUPntgxpZULLkXOmhEDwMJwO6zJzlw0dvhoib9lCFYWOFzFjw+mDWomkf
	S+Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuQv8Aqh14BtRnI6aqpiIwOOM+w4VGitEn7Xxb8+WgL2DsB8n6w+kZUvCnSYyoIh6iwgtIuzTTmdzlM0TowS8fHt08eq+EhlM6hQkSYml4dS95UIQvWXm/YvFRZ+06AZnkzvpJidjvV9zb2VFPQG4zS7071XBpvFuZ/YLc1pzIZPS/TdJyfSfDCSdAAj/mac7Q9taoMPCe6x8czxZq2ZQCxjOVy+6kCwu6HLgPyTjDCpn42VVpRi4R/Jw2z3R8rArENdluXOyWJO1i5mJTYHArs0hvncjkmKpASp9/Z12VKxSzllLY+QEVKdYmpduAh4pxQTrZnPbR+J48u9Ha9t4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR9l/0zpCxaOUzt7iatNB4TFWCmkHiKvjdLyt05m9Ps=;
 b=uHA1OmQsmc9qWf7ONGkpCw9XDKsa3ZrD/xXh837XZu2xJ+fdwKyuc+i3SoPN2Q0CbA+SkoYndMLGZ6CY3XG0idv3WEx1jYkjE4dglZ/CYvq6Qzet2UV50Jg0j+/ZDAAPc7fB14goe7cBAdcuGWjDIzVqrf6FBQaJtPFMSxeczwkYVT045uLAnGWjOPnYYJrHuYGIdrRRx96vxOGRsiDvPjqh02K/Q/EMoH8FgJBz62OqM+7f1jyYnaFU3Lg07NLzlB0nc4ys75hXLgjrz/kqXZU9O+eRsMnkCejwAqLXfE8HxNo6/F9iwhTZchYqfqNI6nG+qw451XMTHzQEhOPELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR9l/0zpCxaOUzt7iatNB4TFWCmkHiKvjdLyt05m9Ps=;
 b=a4Bv+hLWPLlP3rzWKKJZkbMLOZdQEpnZH1U1ptLpd5Po8wIHchBG+PQrnujhZuOQvDTu06Tupm4gPWKtBUMviM777SZAhCzopOT3YXB5JAwNDDQu+3suqGJU9ug9Qb87J4k5KFNdSMO0OFlpB+yTM91d9rbimUm4FAHAQqDe7Zc=
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
	ppserprodsaar; bh=aR9l/0zpCxaOUzt7iatNB4TFWCmkHiKvjdLyt05m9Ps=; b=
	b1dYqH2LIEUj1ZHPuvoaKM9aBaXFycTnilvQTaQecrf2O8RX0AHbOSHL5lhZJ4TK
	sF0Ck3FBlK/bHWUyBWRftKg1qVtqgP5SGDavkArQQVox3ht50sLuV5B2P8ltfVqj
	bxLt76FrrDo8WllAZ7ZcRq2kzGpXJR1Qw8Oz0JocqZWaTfP37Byzm5391CcZQiR3
	QGO93MCbiBHzxRtZbR8C/62E7IE9e1xEqgp+tK6yc/smKLUzNoYFKjd5jJ2prvAi
	M6exYJaqH0HlHPxQw4m1ODZH76/ruKOUUBq4uyZe2/Fx8iGKtuyJDqd0l2cAwFSf
	FKXfGDgHeQ5blEEIpNIiKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=aR9l/0z
	pCxaOUzt7iatNB4TFWCmkHiKvjdLyt05m9Ps=; b=RaylWV0eku5koOE3eu+lxC0
	baKn0bR9SDqv/hJujfKZFUof4z2ryLVDNgvSV+/tpw//UIzFK8eqlurgVo2i01kN
	1vn/ndjZx088MfCAaENy/ew8XR5huS2fGKFLZHc5YbK/Ta3ZF4YVZ1GPMtw8M0mW
	QYWHl6GrkL+sC1UkGHDVxQdLnq047ywsunxl/griOi7/jg8oGFGISllJqcKMwDbe
	rq8rIWzcaOtSV9QBnazyAamGjOrFYiDZCzXE0ertTrd86X0q7ufAR//WynnAAs1o
	Gp18MSJW0v9Q9kMFjIld7Iw2eek2/QuKTIaU6RThvoegkWN3vmAO1pEe89eh16Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMoxdH5ImeVDOmMpxZk7V
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 03/28] x86/hvm: report SVM x2AVIC support
Date: Wed,  4 Nov 2026 17:33:20 -0800
Message-ID: <20261105013347.719392-4-dmukhin@ford.com>
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
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014673:EE_|LV3PR16MB6319:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f328773a-ee3f-4572-e484-08df3adce92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|18002099003|22082099003|261009223027099003|261021121427099003|261026121527099003|11063799006|56012099006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	/vytHFj2Q7rWFRDMjSeP9VDVY/TqTMFp7qwZdJpK+xhLfEi/xcFFbRltibc4HJnk89w7c8lySd8uLIThagTnjjZfDeWxc2S1j1S1Fyra7EMw6Bj1smcLOItAByRqorbnxWPDOb/hs/k9u5NASnTusSWOCPv5XLOmcVKdG9xmdj+Ejk5A/C1EHGLdXxydGIFvc1NyFAht/FmKAuqY7p5T99Xf2BwOYBgiOwR63Ny9DnmpTzB83ADiqAvYRUVrW0iHk/AH8M/9bNJvAwmATMnVNoCJa/QSJE2W+LZ3aU6QDUiUL8lMsbg00b6eNaeZ+lH9XfdslRh393Q1A7HmhtH2qC60f6uZY6cRuV0yZIPnylfErpLt/aS6VlrCfsAGaWiHAwiL0Pb4/2b/Evimg0g4fqiPf5lz1tP823MBDTOANh/FHRH6zJ1xEM93j09hKudHO/YRldCQPOkJoidkbnH3ZWzb4lhYYSsnCF8YoTl0JkMStNwNlPwyHAbFoSWb8TFkXFMVx92xGPAhxR3Gl+Ezo1KKV1hsP51N22ggwX8+iwAnlbXdkZHwxeqIZ5wWCktH5pyRC/bTon64l+qwyK1g5ow6hrLs2Yp5HEcFEUl5ITn9etqoe2MJ34Lvh822n3iYFAXUGCVXTidpAxR0u1uftYv9Sxb2I8iQHl2KeAywdBZXpUFAdx18qTu9nPiu/rDSW2QfhAXOBYwaWhKmBNAv3w==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261026121527099003)(11063799006)(56012099006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dDkk6lyeECFHriMZyg+4ItIfWtYL2vlaKFxADVBHRUrZKfMWuGhqoSx45qBy3V712SIH3raWcoEBRFMe9wCVTSOCkKGv1U5bSZ+9s6YANiXewDZVfH/caBoCJxQbz96fsaAXqelsvQj9d/Y26HlIrDA13lbdUz3EsVJV3m9gKTBQBTYJS58jE8Rks7BSVfthJtWSBDPO5rgAKITw4dcvZuioy9iXf0nT23HaMDO4a99W0xRk44Ymr7X8IexZomxie8N+f6JrKkoBh+kvkp1k8t57GJJU+fjIpmWcVAipAN4Wffjgp9DmMR7feBtEOSld/SwHMhOb8waxiwPhTOmuPdXq02JnJowwXOqiKSKr7Il6AmVjjGHrsAxQ+Dm+LX4iX9iFI0rWuvuAs4q1pTma6VFqaNKGc0xTcFDBbQ/P/tt0Yoi/lAnrA1mcrY3ppXpP
X-Exchange-RoutingPolicyChecked:
	Oth/pAmil6PujGxxpkQZ08pknE5AY6Y9Cmkxc6LNSNOYvfsVghgoVIcrVfiLNnBkTMlALUpnPNPqfcwKx8/MJ6G28aWZ/AxTViwB9xNROBNzfV8+tqEPY+ySAf+mEhqWHCUC+pqPTtwCqKWnFHcBrx1zdzZ9eTe2Wd+IijJa676fyOz3zPRVlSRQYqpiMMofn3BEvs7QJZA7rZ4vcRSt82s6tEV1YlmDPrfVv6gW5RfISGLfBKkVb9L+7gSiisikJlrMazquY704WT5SGVd9uGcO+K+xnAQc7XFQxN7bFGDumkbJWk4Q6HpeOF9SYkZLykmAfZJ7smeJCStfj5JELw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iNT09a0pCaJv4wt0/aUTfeySW8NmxAn7QUJ67Zm0JooLwTkZAH71566K3qbZDYIGDkDXCzV1Faj5jzgSKvN1dhghCNN4RYRdq1MTq0W4LKFifJJ6gdWssdTFFz2CRILNFo3rjVbTw3UfizsLcsJgFU9HMJ01JsUDQ0nL5XQDblHMQVM05Hg1ITSGMqBbUoUVbh7Jxd06LKWk1MyI+CrJczSon6a1IzL0qEbr2qrLLWqqVLB64HVnrb50x6m96DZ7c+C309Bh9Yt6lppkrXjFmuE9Bhb08PIGI8blnFwDR8BB4310wtOeKngxbWTQpLEjDR9ytu8igl/meo8Uu4AxrWIVa9YRJOBiake+SZ2N3Ic2f1dU1qTmNjNxKK+koeWbu2VTnVAKFlujaz4SIeisrSYQidEDqyfZhITY3P//GNssdu1XN5x7B3eJOet2vQLt5F2tKMMC+cm8b+m+MOYDuTgQsi0xF2Tw1FUH+TvsM9sim5s+FDu3Gh4QOZmWKpdamtARSNC6WHiGqDcM0XVhvIIykGy7ZkBxmAROHOTe4XjdnD7+b6hHq820QV+g0lxwxKUjDgnD2b/B5RxFkWBGEG8l4mlBDh+sHEJxIhPgihqeP/VvMssQuouq+40e2gn/ZJfa9+0qDJ3cVpz41K8hnQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:18.6392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f328773a-ee3f-4572-e484-08df3adce92e
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014673.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6319
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyR+EDEA4YuMk
 UAkbXtN6HZ/GpKLtPKoxA+FOn2MkKqyBEKteEVjr47166LC7UvkrFoQUM+1fmv+ROwIf/nIC3sF
 q0ld2/yYlMuuTHyHkRKEPtSouK3odnBrGyS55dnHF2+y1X35xUFYOV2B8HTCUrFT4FZrXhUMCjD
 dSLy7a+k3PT95YhikKGSkI0qTfZYRUineQGoNcy+4gtb1KKfI7iGb1Uco5uPQ9aAmBowyh96K1W
 1DzBNHdKHVEtC/ItgD+Ow2tM7nCr6mWNowlHHXn2D4a/4xXYUjw0cCdUnBgnKxKwuZkU62PY/Zi
 eZ+hJtV0TNky6PPUp7xa3OefuKrwH5rEB5s7q6RH7RoSRlp7NVSaC8207HQkKZYkZP89+JYAh56
 wSUvZlckP1M3zFSNzKYjNU9CJtz9X+QvShrcM6Dpkr7XRu2nCpMh4mw07jhCe0fiJyyaevWf4Uf
 RL8GcBQns2IzgocsYbw==
X-Authority-Analysis: v=2.4 cv=AYYkjHXG c=1 sm=1 tr=0 ts=6aebdd1e cx=c_pps
 a=MKhdtnkEmnO/r5iZxkZDBQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=3FUhnyOFzl1vmK9vYlIA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: QtEeslBpNyBJQ2trS_eZjq_pXTVP2Uqp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX/Lv8t+BCHmBS
 kmwh6bBpbFl7HL/QBZuvyFTwGpCeaRejO888b5NVAc55MMsI7XQkULaELgErWHzOvR4pTGGwco+
 truIiJL4se4vUT9Cdmvs2LwoE5Zlkdkg5KNdnwhLjPVeD8C07CV0
X-Proofpoint-ORIG-GUID: QtEeslBpNyBJQ2trS_eZjq_pXTVP2Uqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-4011c0/1793842465-591C5CFC-D8318DE5/0/0
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

Report SVM AVIC support from CPUID Fn8000000A_EDX[X2AVIC](bit 18).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/svm.c         | 1 +
 xen/arch/x86/include/asm/hvm/svm.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index cf008a8acdf2..db81dad4b681 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2457,6 +2457,7 @@ static void __init print_svm_features(void)
     P(cpu_has_svm_vnmi, "Virtual NMI");
     P(cpu_has_svm_bus_lock, "Bus Lock Filter");
     P(cpu_has_svm_avic, "Advanced Virtual Interrupt Controller");
+    P(cpu_has_svm_x2avic, "x2 Advanced Virtual Interrupt Controller");
 #undef P
 
     if ( !printed )
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index 0fc33f41b09d..292a9ee19b11 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -36,6 +36,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_AVIC          13 /* Advanced Virtual Interrupt Controller */
 #define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
+#define SVM_FEATURE_X2AVIC        18 /* x2 Advanced Virtual Interrupt Controller */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
 #define SVM_FEATURE_VNMI          25 /* Virtual NMI */
@@ -57,6 +58,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRESH)
 #define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
 #define cpu_has_svm_avic      cpu_has_svm_feature(SVM_FEATURE_AVIC)
+#define cpu_has_svm_x2avic    cpu_has_svm_feature(SVM_FEATURE_X2AVIC)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
-- 
2.55.0


