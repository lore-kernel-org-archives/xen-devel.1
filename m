Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69A606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=phBqSAmh;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=OdLEMq22;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Pqj0kFYW;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Z6mONGl+
Received: from list by lists.xenproject.org with outflank-mailman.1484727.1688091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJF-00005I-Ow; Wed, 11 Nov 2026 19:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484727.1688091; Wed, 11 Nov 2026 19:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJF-00004v-KY; Wed, 11 Nov 2026 19:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1484727;
 Wed, 11 Nov 2026 19:48:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJE-0008TT-8J
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJD-004SUA-LW
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:39 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c67b-8faa-0a2a0a5109dd-0a2a4506d76a-26
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:39 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c695-195a-0a2a45060019-94a39217bc10-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:39 +0100
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABIYYdd2999130
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 11:48:37 -0800
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013036.outbound.protection.outlook.com
 [40.93.196.36])
 by m0482517.ppops.net (PPS) with ESMTPS id 4hvwah0ta1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 11:48:37 -0800 (PST)
Received: from CH0PR03CA0430.namprd03.prod.outlook.com (2603:10b6:610:10e::15)
 by SA1PR16MB6134.namprd16.prod.outlook.com (2603:10b6:806:3ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:29 +0000
Received: from BL2PEPF000352CA.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::a9) by CH0PR03CA0430.outlook.office365.com
 (2603:10b6:610:10e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:29 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL2PEPF000352CA.mail.protection.outlook.com (10.167.249.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:29 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZI4U196225
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:28 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw561u-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:28 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REIzxf4DzF9Y3REJ0xz6NB; Wed, 11 Nov 2026 19:48:27 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=O+k
	EcWrlmIYGx7SGn7hxT1gMGLBqGAHzKzfGydvyEJk=; b=phBqSAmhiLbGhUJx5Wo
	bR5KjjeL2ET6Ks3/IYD6P9H9kTc1okoOYG3N55l5xeaQfa+Q4e/j9KdL/UyegK3y
	23bKR6yU9ip7ovV4v9QOZwc4Qb+vsRvmDxG078R+oCGypxzyfkJy0UGo6ZwO3kaX
	RqM3qzau9OPqe/0LcBidEcL+gW/t/ikyCr4Jp8QtCXuuPI6tM5S4gAlFGJYxAONb
	LV9opLQS8aeuGmllOG32vNlflevT80tlbczz3AQtiejH8mrIW0QWSPbAcngC5uUF
	l/Nw4DNdYmFbjjlG+JL0vC0K4iKXHXzTQxwPCehtKoWG5bh+oVAHTWKvDZeVO3P6
	mSQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B81+WlrhiF/LX3dXb1AnQAiX5O7uNM9mrGJL4Us3jWJxBseMmIBDoscBaL1xw+9d15To+zB5EDGggor05Ya6d7HDrw1Qvb0J2rocOdcNDCjc9aqHAeCf6gLuzD04lhADH85ZwH509Jbb/bsAT9JeL5n/x7Y61PiQ5ISh9kvrKRpGUg2Mx4KoLny3az7tnWdMi0M8/8noTJzK5Ksa0ntCm+FKgYTygvX3imOUV78+aeYhjejYPl9sLkfq+38HUrSGZWPa1kZC4p5Yqz4yeXBDG0d86VIQK2Mav6YYrqiLo3vpjv1REUCNpxy86Jfj6VPehF+4JjGmlewNLxPYKB/U2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+kEcWrlmIYGx7SGn7hxT1gMGLBqGAHzKzfGydvyEJk=;
 b=i230hsOWYmlhHex3cegXbqbj1FRNxrDXeun4rR/yMKIjiSUZpYcU9GE1ggcE0gFle6MB59L39JWJYQf06iagBx0IemY0cguK0j9wb413xIZ8e3wFfqN/+FV5zn8Bqll5AvN2v5NxB1BDBxZBylRMxE/xaowZ8+pxMOyls6UufMR6G00IC+t2AF5ixCDp0LjuY1tgQFcEAp3CW6xfkmN3AQEH5bL4qSmbGs0OUDL30gPg5tr2K7ECNrJp5g08d6W0MHa3jPLencnO1tT3FTQMk4zZmyd5fZ/z1DBo12FgDUPoRXflVh4kNR8OkjCpqXZpFjwy+qM56iTGdzmjPbOOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+kEcWrlmIYGx7SGn7hxT1gMGLBqGAHzKzfGydvyEJk=;
 b=OdLEMq220sn8jfnDbtN0JMobngz2tCKqkRQVmiuwSXe0FfvF293pgsPFFYsJWFQgL79GJO52W9dzvYDOSqa8qaiqd5WDiaNBvtPOw9G/NmoEpBiAhVSiESXdX7Hwofh9kfCHuceIbc2qqQh3NnlUZ++/yib0Oq541raBcv6tENA=
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
	ppserprodsaar; bh=O+kEcWrlmIYGx7SGn7hxT1gMGLBqGAHzKzfGydvyEJk=; b=
	Pqj0kFYW0BzRUbAC2UlxKQGLpS1WKHPATbn1ILUD8TsMTIvnqHNQGuCP3nRnD4hZ
	QlgJS6aig+yTxrK7nX3guMRF6wi9oV5fv41T/JsKnY3wK/lv3YMGXpElOkd6eWCc
	3DmVhUT8wYbV8mg3xhk9S8EAnpw/wKLP5MVi5XlBpk9rwpGGEgvD1Bgxj9By2ZNb
	/67bfhScMFpnpN22SqYyHVvFJ3h/MFdnyj1LTTGRCyuh+sYWn77ofwv8PmzGFoo+
	/eMln1H2ZrCzlPPGrtwUgO/pcHeQ63KzXKlIHfsma2fQJHAeL3NNO5PYfzN4QCDF
	vPP4UKnTyTjmpn/fGNUEfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=O+kEcWr
	lmIYGx7SGn7hxT1gMGLBqGAHzKzfGydvyEJk=; b=Z6mONGl+etMI7pmu+wbthdt
	fRXhLWqrxcKHsda0qTg9rge4Wht+svxoS6pk27mtX2/+vCu/BdIQY6DXXcJ18kI/
	pRfs2aJKraCnRBsQzmme1wZcyZZA2LzMkVkefpQU/7Bu9C77Bwr3Zc7Vspd51w6j
	IxWbRLPZPEu2d7OcXX3o7g7u1vnTdV2C13Zh2/ycAeMf2Xz1cQeMTYeSuc7jVRsj
	K84imKXp2cEIGQvQOqmYFGQFSiqdPDUU3oMPSVJK4rWJDf+hDkqnA2mgUO1rkQ20
	Zwo0a6B78siom6+OxwdxvCKQDjGpo5h+RAYM8IX21k2Ny3GXTOrf0/wcqxJhCLQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REIzxf4DzF9Y3REJ0xz6NB
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 07/26] emul/ns16x50: implement IER/IIR registers
Date: Wed, 11 Nov 2026 11:47:41 -0800
Message-ID: <20261111194800.1070016-8-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CA:EE_|SA1PR16MB6134:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc89022f-866e-4245-87f0-08df402cc26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|11063799006|56012099006|18002099003|22082099003|10067099003|261009223027099003|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	xVOlthTHXwCMc+yuArdXiyzRAkPAzzQ/plpeHxQ8KbSA0UW6BMteMacIXMTojiyA1P4UAl1QrBpDuoUkx3ZGMrnvWg8lsACUOK9NqMeNQUJcJNXzxwD2dZM7LS/wdJZyuf3eh2x8aMXjrCiIp72FQmZ/Zy5bUROIVQC3GgnnSzuE1mCjCveohXvXGMAARcEBF0X/I4kDJQdmfjSSidy+nRjA/mXOY6zcMZ8l9lRLLZR82DZlcbtHD5quNtMNcru05XWt5dNVky2SrFLZrUZfXVUE9mopOzSpZyj0lMZXDQahmTd+Z1ZnlZ7wxgTWyIEb3BpRe7nwTDW3s1YgofvwC98lC3jIa04QelX9icJNhqACmqml86ri11Gi+KfO2KOpFlMU1risAGeSReqOfRzLHSIo9a4eOpSUaEuWCZg2sFPMy9FuJTd+2mrdwzbNPIDwCSn7PjUTQyUnGh2sClDE9gDKft+mysotC/3t84DuYAIsSmEQUtOerMQyVpqqfnMYGbsmxAAWCKdiBK74Xk5W/ggvr4td/2e+QJ8I8PNukCz7NjMNHDDmM/2utSLB0L93j4t47FkF1Gzd+QJyn8vF4n8NB1Y4JHwhmwZQrNdOi0aV4AKYBwqqIWs4KOTGagZj19mKksDTiyc9nrAZ3jFtkqw+wS6GpeJCP6RLDN+WX00XCPO4qfmuUAb3U5etzTJSGII2Qnd0+m64lf+airPEqw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(3023799007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1wG43HIYWsI+fDOX/N3U/GMbwIFPX3AZWAlfKLoKFkmA7VPm4JXph6YCps0KG2DiazcpvKrXk6vbH/0Hlwg1EqJV/rL3CIKLRyCNoKejv15J+FG7bT+GiAY6X+YOuESLmvza4nk/UkXY9/1Ezb8aWUvKazDOAKB1zsTvenQKJbfifZwxG+ve1CLWwTY0C/Tk1yAcJ0yDfUHc+hB2FPflT/9r/7nB0TNRIRfRiu1KD89Kh0eNYKe+hrukVnNk/GSTXMPLo38mWh/L2x4sAPhIcra4JFkMaiewlNrUaw9OsJCmtYVbQvbZOwkgBmY+jBC6MmOr/hMFUW/wzBGNEO8mSOgEM8u3p9E9WK98xolQY8vyQKtmmcLSLv1iyFzO/DcDv86PiH0xl29Zh65dGH506/CqT3W3qO9ntMZtF8WMx6KYNUCodBhnpMXt7PGe9cDi
X-Exchange-RoutingPolicyChecked:
	1PbZ/cgnrio0y0r0nSJglgqJHZYSloYAT756PIkj9jaUBa+3QRz+DnLrTF6IUC3HDDFmx1Wz272OsowFCofQF2TfWWAM6FckSKYUHx2h/zBA4uNQaYOoOiy3OB0eDgifgP85W6/fuosD1B0HXLuRB7ZvQViw0ikNAm3002iDPxfgsaC3qJdM8wrm5Ezg03ijvYteOTb5MoFAjaznJa55mOvGYNl8YOCi7p/wIArXpxQjuAxfeb0IjOaSOdy4rMR2Tz8bAKHLLoraNSIT6jkwb50YcmkpcQA+wxkRqYLF5kncsB89Tf25K2aLUeZfNRgnXQhE4EMeambTrkYsD1VucQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QyvitAlqhVc3RQ8ko5fCtrPn5w5xPQYUpuTwxXadE5Y/55FpOS6PA0gd21k3SufMA3/WfQE6YtHAG80h6CYAPis+HPDA3kI712dGaYBRqY++0zx9kVc9veD3sTuzSjy44/v+apOjOXylPZzNWRlimF4jZGOCaga/MEEqC+FRpgBds19oOyFXHPx/YK3pi4tImFydQ/4cO/f3Uv1ztlA+omU0TDcrwmYCNTWazlFUtBcY78cR7vbcV6H9MMbAvO+Qxz8UkC0haujSKGng8cZaucnhCN5QpnmV8t0BciAUYC4JWxN5E2ghGa/bznnmfaN27ccB+wPNDmk8DhJrAg8TdmT9ZjUKXDV7DLtvRLZrYj9IxuJiKIspvW/hCooE/OBt3g69gAEJZR1NE63lgM0+wYo8fv6B2mZxyDB5Nt/t1alrv6TX/EuIPhqiW+2/A3dtW41UnL8OKaBSAq/su7zNu3YtWfNcoomkEITBwn4W1Ug6JS+SbpYGAw9qQe+JquBZr71h13y3ec+AR2Cfm0658h6X7CNFX5cAjllPkhbFdzW2yVIjL5GM1z15u6/K2obV5t5JILJkPx9TqN3RWgYfzoA/9jsss+8rwnHP5d+XLHos99giWORq+D/iOZRXMrQisQheuDViOIt/FZ1oglN0CA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:29.2382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc89022f-866e-4245-87f0-08df402cc26f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6134
X-Authority-Analysis: v=2.4 cv=NLdAaE6g c=1 sm=1 tr=0 ts=6af4c695 cx=c_pps
 a=vqIpJ22NDJOYTIB/W/KhXg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=Jdy8QZ6Y9ox5ECswCMUA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: Y-H4lUCej0lmomswe371cYzvBuIWKDof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX6cDrgDsuIduZ
 aZsCcQdn7TxUxAZDWEoLh2Pz8PKuc5azj4zA2h5mQtwsaQn+YNGbAZ0wgRCGQrlrLY2fvgq/iaQ
 mKj3AhuiF7W5kFysSbHWFJh3YBv8IZslNT62OZ76YIK2CHUQKuNktFnBiRdy3qqnaINQt97Okr1
 8GU0wqG6sdNPNmjSAy8UFmb25uTWz3fc44s1wL6bslHHTpuoQkz+Z4iSHvxE9XjcWLxEQczJTUF
 2LKJBuoy1rWLAHOW0RZSWzlayCqoSBZ8RxyW449mTgQTdzzXc30Q4lETbDChZzmZvSnnLRWSNuP
 yC/6SLIFT1M/A5XehJ49JLG/laSPB0Z2uKlW/dP/Sm5RKDwTvcvhltDasPkljxWlRz0DyoB15JZ
 DQyiTbcoqHRS39TqeGHuXDAXCnDnfzIXBBDx0sk0s8X+EFWmrLRxFJ8mfoC/SunG3CX9JQxcXiy
 eEcl03k64EaNk6Xdq2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX3cMfcBQnYJBB
 LJ1uslvE+GNDqsQgVCWDVCQk9u/5lO8qP2pMfoVyZjTsjzvxMe359QtBXU5AHiCig5TlLcqCTL/
 DO5iU2Ucf73Yi435LLLaCrAsjfMVZHSlefU932u0p1Pb+FMi8JdZ
X-Proofpoint-GUID: Y-H4lUCej0lmomswe371cYzvBuIWKDof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-16d1c6/1794426519-1ECC577B-34073E1F/0/0
X-purgate-type: clean
X-purgate-size: 5262
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add interrupt enable register emulation (IER) and interrupt identity
reason (IIR) register emulation to the I/O port handler.

Also add routines for asserting/deasserting the virtual ns16x50
interrupt line as a dependent on IIR code. Add vPIC handling (HVM).

Latch the interrupt line state to avoid poke ns16x50_irq_check() on
every I/O register access.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 112 ++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 2371aa32d03f..7c5cdc99cfa7 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -88,6 +88,7 @@ struct vuart_ns16x50 {
     const char *name;                   /* Device name */
     spinlock_t lock;                    /* Protection */
     struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
+    bool irq_asserted;                  /* IRQ line status */
 };
 
 static inline void ns16x50_lock_init(struct vuart_ns16x50 *vdev)
@@ -113,6 +114,101 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
     spin_unlock(&vdev->lock);
 }
 
+static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+/*
+ * Get the interrupt identity reason.
+ *
+ * IIR is re-calculated once called, because ns16x50 always reports high
+ * priority events first.
+ */
+static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
+{
+    /*
+     * Interrupt identity reasons by priority.
+     * NB: high priority are at lower indexes below.
+     */
+    static const struct {
+        bool (*check)(const struct vuart_ns16x50 *vdev);
+        uint8_t ier;
+        uint8_t iir;
+    } iir_by_prio[] = {
+        [0] = { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
+        [1] = { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
+        [2] = { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
+        [3] = { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
+    };
+    const uint8_t *regs = vdev->regs;
+    uint8_t iir = 0;
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
+    {
+        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
+             iir_by_prio[i].check(vdev) )
+            break;
+
+    }
+    if ( i == ARRAY_SIZE(iir_by_prio) )
+        iir |= UART_IIR_NOINT;
+    else
+        iir |= iir_by_prio[i].iir;
+
+    if ( regs[UART_FCR] & UART_FCR_ENABLE )
+        iir |= UART_IIR_FE;
+
+    return iir;
+}
+
+/*
+ * Assert/deassert virtual ns16x50 interrupt line.
+ */
+static void ns16x50_irq_check(struct vuart_ns16x50 *vdev)
+{
+    const struct vuart_info *info = vdev->info;
+    struct domain *d = vdev->owner;
+    uint8_t iir = ns16x50_iir_get(vdev);
+    bool asserted = !(iir & UART_IIR_NOINT);
+
+    if ( asserted == vdev->irq_asserted )
+        return;
+
+    vdev->irq_asserted = asserted;
+
+    if ( has_vpic(d) )
+    {
+        if ( asserted )
+            hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
+        else
+            hvm_isa_irq_deassert(d, info->irq);
+    }
+    else
+        ASSERT_UNREACHABLE();
+
+    ns16x50_debug(vdev, "IRQ#%d IIR %#02x %s\n",
+                  info->irq,
+                  iir,
+                  asserted ? "assert" : "deassert");
+}
+
 /*
  * Emulate 8-bit write access to ns16x50 register.
  */
@@ -143,6 +239,10 @@ static int ns16x50_io_write8(
             regs[NS16X50_REGS_NUM + UART_DLM] = val;
         }
         /* DLAB=0 */
+        else
+        {
+            regs[UART_IER] = val & UART_IER_ALL_INTR;
+        }
         break;
 
     /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
@@ -155,6 +255,8 @@ static int ns16x50_io_write8(
         break;
     }
 
+    ns16x50_irq_check(vdev);
+
     return rc;
 }
 
@@ -237,6 +339,11 @@ static int ns16x50_io_read8(
         }
 
         /* DLAB=0 */
+        val = regs[UART_IER];
+        break;
+
+    case UART_IIR: /* RO */
+        val = ns16x50_iir_get(vdev);
         break;
 
     case UART_SCR:
@@ -250,6 +357,8 @@ static int ns16x50_io_read8(
 
     *data = val;
 
+    ns16x50_irq_check(vdev);
+
     return rc;
 }
 
@@ -398,6 +507,7 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
     const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
 
     memset(vdev->regs, 0, sizeof(vdev->regs));
+    vdev->irq_asserted = false;
 
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
@@ -428,6 +538,8 @@ static int ns16x50_init(void *arg)
 
     ns16x50_reset(vdev);
 
+    ns16x50_irq_check(vdev);
+
     return 0;
 }
 
-- 
2.56.0


