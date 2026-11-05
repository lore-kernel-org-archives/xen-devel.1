Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D97606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=ctAhcZOY;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=fajFF0Mr;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=hqEIAjoo;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=BRyHlSBO
Received: from list by lists.xenproject.org with outflank-mailman.1473179.1680820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNJ-0005RS-AF; Thu, 05 Nov 2026 01:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473179.1680820; Thu, 05 Nov 2026 01:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNJ-0005RL-2z; Thu, 05 Nov 2026 01:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1473179;
 Thu, 05 Nov 2026 01:34:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNH-0005LO-FJ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNG-00CQOL-SL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:42 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd2a-e002-0a2a0a5209dd-0a2a450bc7a6-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:42 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd31-b7e8-0a2a450b0019-94a39217998c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:42 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mXoF2568296
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:40 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvb0c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:40 +0000 (GMT)
Received: from BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::20)
 by CH4PR16MB485681.namprd16.prod.outlook.com (2603:10b6:610:518::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:36 +0000
Received: from BN3PEPF00022BCA.namprd03.prod.outlook.com
 (2603:10b6:408:10b:cafe::73) by BN9P223CA0015.outlook.office365.com
 (2603:10b6:408:10b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Thu, 5
 Nov 2026 01:34:36 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF00022BCA.mail.protection.outlook.com (10.167.248.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:35 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50o3k63232408
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:35 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnp8u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:34 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmN5xkVxeqQa1OmN6xYkaz; Thu, 05 Nov 2026 01:34:33 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=tWe
	58/kB3r5LGv0urdMemSBr2xgv7ruuQtdgdFz87js=; b=ctAhcZOYTvXcXNmiScu
	zbGU9cM8KirWMMwG5d9Oa62mkbVKkmCtRjLTnwnAzvp3FJjLG1PaFNUUvJ0KXI+J
	2Lt8eZpq5fGbKvad1lEPVTTMwsxa37AS4CPKAGO/81Xrf+aAiWNyC1DnWYwRmtCS
	FxZqPEnKh+bu5w8dHb/NiqgTt8bMQL5A2aSNJ7S+Mh8GOuLYwSu4WXMIwTi8IxkG
	hSWfDA6dXt71UcN+9jNXsj5FfvOesAnT5JuQRCkRNlJ6yQwD1yzzUL4iSKzD+yM8
	+mcAkjqb6vqhVR83VoDEuXg/4SVadearmhY1EclSP1DYLrNZcFdoklaqgeJlSqxO
	ryg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk7GL4ofILC6ag79GQxumrbG7aG5bBfytuY2zir9BrjdwjzeEyHbl9ukzMJmeIsfuN+yU/eM8D2EzVB8qCEfJ9O7k/Jc/3/1CpzLh58PYfGmkqdiKLxf5Qpey1rArGzNJ2rb1+QF+dvUIElU136ObLPnsjeHD9UF4ib26j0bav+DsgQ8MssRU6uPuKjjGWSCV70gzAWK/M8vWTdD01PCtPwsDj8k01CEjrY5KTKmVTsgSGA9pnklIVCWkHH9v62tgidqFw3aV9+WsXwAAGbtrXZz/WOoSuwJCdOCOZ2mlIQDFqAC9vOZQQudTLXIWVgm/l8/LlMnqCNm4f1/R/gJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWe58/kB3r5LGv0urdMemSBr2xgv7ruuQtdgdFz87js=;
 b=t0MR4LlVblecawtwNqDPGzX6+cSTkAvkbcHBAIovfIkxVfEyZW7eaVFBKvp+TrpR243YYrlJ8l5r5Yjkpjm2/kV44LAhlL+5DdN2DL1PRlIweNM9IyBJXVJTXVcZikAQSKAb1cvdQ8msQT31Aj7CYpgMpG0ZA888w2BhT7a2cyoE/xG4VO7D0QQ8Ad9dTJ227RF+Kei66MXCHNOqAXAHVlFGw23+CMIy4kja4BsURG3ai1n2+UBQQ/JPxOjscZxNU2RH/ZwmAZ136NXGOQYew9siuQL/pBETRb+YB9WxrahqYlCC02uamsFz5On0B2ZOamyF5Cfz7M4y3hkj1x1C1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWe58/kB3r5LGv0urdMemSBr2xgv7ruuQtdgdFz87js=;
 b=fajFF0MrR0OhMyPFOj/7HH8bTttFtiXMkf9ImiZNSEMbjPz+yL+zEW93LTFtw+ydvE8L4/7wcVbJrwCOB50fDs5UNwkVhsTFsUzXrI01tKoJ3KvxkqxoHZ2e+8fbUHr2fGAnbSDKgUaPOqf1VyiBsUCG0rmnrVoqAXO71g+tT3E=
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
	ppserprodsaar; bh=tWe58/kB3r5LGv0urdMemSBr2xgv7ruuQtdgdFz87js=; b=
	hqEIAjooQoov1/ZZxczNdmyD0Bsj39gy/tY2OztyAah8Nvfe7VR3ucDpmp3r4t9s
	ruERfJm/BzLulBcpzOpjYlAYZ9VTzMIPdv8rbpPsniskJeQTpqzuQs0Tu1L6ih0e
	IYTLMGVAzn6G8J7PdrYaol6UHMMw8LREy0H5Sa5uk9Esh3Q0OeAhVqHpyClsUi9e
	ONAwxUPzW/Fk4GDq4cO1mcPvikIKSmtnUGxyMnYz3uMD1G+hk3D4LU+8iGJ7ZVL2
	s59E1pi2iwrGz3CvDuoHzMQixfcshkMDcQbv4DuEk7J+Hb3a5qIH5xwnHGt1mgJh
	9RMsP4ExNtQStyggy4vDyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=tWe58/k
	B3r5LGv0urdMemSBr2xgv7ruuQtdgdFz87js=; b=BRyHlSBOnDfYVyqcKsFE4+c
	y0rhAB18ck5lWBmROW08l/E2jwhdbkOHPeok3DLkRFKAd1nYtTsj5o47LsOEuPl5
	m+pEFEjg+cWsar0OxTbfTY75j7JbjqRBon5qD2rn8M812D1qJ8xc9aQ78fGu/lDI
	jSoHRbMAQF+m98dJFtIE31X8Aw0K8Mk16Jqj0EOkta4C7iW3CMrc7beu7x8uqaB1
	WDscDrSNytz8Tzfkvgxw3G21BMo0bpmYdb9l4ph2g3VEQVJ0qbl9kqKBXfEjWk+o
	3q/e6VqwDmH/UBnK2q341stf6HacNXu9johZKRAGPvgRPxMf0wFSZZBEXoKf03Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmN5xkVxeqQa1OmN6xYkaz
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 10/28] x86/hvm: avic: add AVIC_NOACCEL VMEXIT handler
Date: Wed,  4 Nov 2026 17:33:27 -0800
Message-ID: <20261105013347.719392-11-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCA:EE_|CH4PR16MB485681:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3afd2530-2326-495a-d307-08df3adcf369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lsx3Gaztf7bxSZaCWhXsQ1rw2F99X6VEk40vR752pWC3VSJp+hUC9VCgtF4YM5yh63XbDbEpEPPI2bEL80v2HRZNZwMTUdmSiHKiDzSVsLFZNIZ5OswepR945c34VliVve/xBkPkLVY+u5UzGwJeXABE0hHBBrNrDT1r2J1x6vl2WZGXN5wyAKUD0lBKHlDzjnYf8/msd562+1UMclnJAHHzYXeS6fqbGTODeCNMrCIfYKqqxg+gec7cM7UCyE46Etbxl3JhZrbQjDlBicopjG3ZXjEVO9ybo+5kjme7/BuntDLWzSvyb9rT3StX+9+q7WpzBElLsRBohPZm5n9/R3LBTu+J45oxXJoLDcEeLusNMH4Cd6mVLNGvBX9T/syXBrWMXjDA1WI0+MZWFJFuW5cEOb5s3Nrk4SJaRCx8KiCGwalOMOajvuP2yRnXQw4XEzHijkqqL7RZqqTEqU/iXywM8+3pFFV7KOaGJ4sgRX/v0UoUsUa8nSXn9XAf2cqYIitp478NA++c2arjm293C8ihfLQgzznLKCkSjR/Q05FSXD/DCuixrVOQtj896bcQWuMU2ev5fvV5GmD/X0D2buIwlC2+tHvcYeWcUVqjaeaXaYIZktt9qyvcgI4dkW9+VLmusYIO3oJVOWrCwXooJKpAtVdOnnnMIoeWkctUBGbIxBz+9eo9WfuYC9WqF+pmYq/N4hXFi6bIkUlvg45jdQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZyNyfK5ioTX0kHSCnwZZx0Yr8EuiXkbFq6pxE7O6yhsoV4snxSZp7ZJlaYhR6cdSyw9MM/ZS6jHuJ1ItSjVVAHNid4n3y8kR4UE474hoejNzyUXqVmINVNzBMvI6U6CSrxIikEJEg6gmsSFxvfaZPpeZN7h1wx+As0i04b8jkOlm/RxFfqdJhrKo/0nm+wOt+cDXIOAW0hFH/DupZ+GDz66uAXAoa6IcJ8RXgVV2u20Ffv0iGPmNhX4nZBShruvClCtDIrZxxheU+4j1gbDxt04HAJYg4YW1+j3+x/oPPeQacvMRxuSYKznRp5wRz7AKN1CKRQO3MSYpGFwU9BIV4SIs6NO+HUq8TXJfsQcwZ8fnUkRP1XjPFug6DXWg3xDb8OwYKc3s2ovC27izAFrlBc9kat74pFPzTFY/KrDBjzf0nodXuHq7B+2rY6Xng/rR
X-Exchange-RoutingPolicyChecked:
	D/WAYVFkcsODyPMf1BXK4WFHIr7s/ULKISNqEpvOIukmH1cUc8M+Ox+wGjcbCEUG7Bs0aFVhfMXkdDNzh2nvc6gS6Gy+/4o78b3DQTzfnmROaD6rrjLz6xcGoS7ZYdu1K/bx6rbTXBU96rDXOyWv3Sy/9WjBqDxMoWiv7dGaiHqBAruLjY5vlHonyPGDDHPP3vjdvi2qbfCfOGvgKsW1ms8zmmcPJLjK+jzGogAvtBJvYPV2oYxrRZIJAYhVZLD1LUdfAl+R8LBCfAuctI/Gf0wqw3yLQfUHJtBGqlLkpK6p+iNQQzsRd2UZwrwxCoY7Dq5QMg4L+2Pt5FXaciadaQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wbzbvU8C2cgTWUEfOAaXpP6DnIzJOZdFooun4Mif6rQ0R/HccVvYP89tiyVclxpUoVzNQbi0RIxUQmpSx+iUfkusQAmeCFFGnoO0FWW7DnpumGEirNr4jcxJmFq6E1MH6wO8BzEfHNjrAXus3PBms9CSzlhcmzZVukoip1G6eHfGtGQJlnyl7PWcLt/+DwR7VZk7PXc6aZoZBIvQnJ9b5L7MIbXvYMj8lS7Kc/ATa8m523qpZ9n/1niZsXnZ8VrMfSsEmY45NTx3JgpbIPzQBZ8wgADbyfQlWmSQmmq+uu0vAVjPenT2bgy2HtM5OGMnZNSX7z4aSmBA4OX8m0BFnPLJxMCPELue8hp2fPxFAO+4pPyBy9ti0BxU0uBjIR61bSVkPICIEn3fWKkJCbZ8oA0thpZ7+Xloqt47OznRFF4ZvfsydpxngahTgubuqxPcTACxAiEyRsOdwQpmJGdGf8+ISEn9EPbc+i98YLHuOlpZEdhhH8dBHcy074O9S5zMnVai7LWoxGHf7Ik1YBUnIh5SZYhIm78i1wSER0Oj0XBzz/FL+Gb7rtUdvmvubsQmFDP38mEhyI66030Ze8KfV6pqJo4iHuVv21M6pcZ6XeqcLJEVBbodwcL7Ar1vDikuzip15756aFRCGd568y6Urg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:35.7964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afd2530-2326-495a-d307-08df3adcf369
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR16MB485681
X-Proofpoint-GUID: o3BbgxQLKNzUpGJ4Gf7ebypfVRsSa4VK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX6LKu/U15RMUx
 UKUBDrpV+JjPBbFAd5ZJAzCe8OxEDBhznvVCJbd1HH6/7yQ1dPdlbpAmGBADmVCwMy7iQWWITlD
 lHBtUNK0l+iRCIWFuML2yVRG+xvs0fRwTN84IOVxgHbkqMOI8oU8zDjqC9nqJyiV6hf3iGwKdg4
 guP8pmgi+F+4EM5yacqeRbwrHT5nYUnFo071mZo78c1537dCfQILQQhBoqtrPNmghpGarre5JyU
 /Dvu+9g+hreF/sOnLalSiEiuipKxQ0kGPOsNDZizD9dE1NCvjw6X0iE169nfw+k8Nc2OJqMBmjy
 qN+C1rHfLPwpzm9sG8xug8z0V4yA1wFIpzvr2d350RGJvXXiycehhkfV/i7RmgwbpE4B4BXPzgq
 Pnw0zRu5jBezSHWuOWvYMSVfJjbgOW4Ajx9Hap3AsjjyMEUnUs1vl9tq2twc1AW8EQpNW4u8JJ+
 uk8Z5tKXl7UZsJJwhQQ==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebdd30 cx=c_pps
 a=9ZCHOKVckkl3mlSiZqIMSA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=sanJ8Y4dvTXCnbUUTQYA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: o3BbgxQLKNzUpGJ4Gf7ebypfVRsSa4VK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyPByiB8AgStu
 1VIYYd859UhE+2EInGaBhS4Jj+/BiPurK/3pXflNgdJanJNFBTfXSxpKpe8idpGmqPUZ+CaztU9
 jgCI+okH1z0iduUlIj6sm5X5KL2SXLHAzf5VBcDatCP0yac6/ZuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-42698a/1793842482-AA8D99EA-CD3C9EDE/0/0
X-purgate-type: clean
X-purgate-size: 9939
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Normally, TPR, ICR and EOI guest accesses to vLAPIC are accelerated.

Introduce new VMEXIT reason 0x402 [1] to handle the case when a when a
guest access to an vLAPIC register that cannot be accelerated by AVIC.
In this case, emulate register access, specifically, LDR and DFR.

Also, generate fault if an EOI is attempted when the highest priority
in-service interrupt is set for level-triggered mode.

[1] AMD64 APM Volume 2, Table 15-22 "Guest vAPIC Register Access Behavior"
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c              | 196 +++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h              |   1 +
 xen/arch/x86/hvm/svm/svm.c               |   4 +
 xen/arch/x86/hvm/svm/vmcb.h              |   1 +
 xen/arch/x86/include/asm/hvm/svm-types.h |   6 +
 5 files changed, 208 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index 0cfb21cb8e3f..18a814871133 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -12,9 +12,20 @@
 #include "svm.h"
 #include "vmcb.h"
 
+#define AVIC_PHYSICAL_ID_ENTRY_VALID_MASK               BIT(63, ULL)
+#define AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK          BIT(62, ULL)
 #define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK        GENMASK_ULL(51, 12U)
+/* Width of Host Physical APIC ID in the AVIC physical table. */
+#define AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK    GENMASK_ULL(11, 0U)
 #define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK                (0xFFULL)
 
+#define AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK    (0xFFU)
+#define AVIC_LOGICAL_ID_ENTRY_VALID_BIT                 (31U)
+#define AVIC_LOGICAL_ID_ENTRY_VALID_MASK                BIT(31, U)
+
+#define AVIC_UNACCEL_ACCESS_WRITE_MASK                  (0x1U)
+#define AVIC_UNACCEL_ACCESS_OFFSET_MASK                 (0xFF0U)
+
 /*
  * For AVIC, the max index allowed for physical APIC ID table is 0xfe (254), as
  * 0xff is a broadcast to all CPUs, i.e. can't be targeted individually.
@@ -211,6 +222,7 @@ int svm_avic_vmcb_create(struct vcpu *v)
     id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
 
     sv->avic_physical_id = &sd->avic_physical_id_table[id];
+    sv->avic_dfr = APIC_DFR_FLAT;
 
     entry = vmcb->avic_backing_page & AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK;
     entry |= AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
@@ -350,6 +362,190 @@ void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs)
     }
 }
 
+static uint32_t *
+avic_get_logical_id_entry(const struct svm_domain *sd, uint32_t ldr, bool flat)
+{
+    unsigned int dest_id = GET_xAPIC_LOGICAL_ID(ldr);
+    unsigned int cluster;
+    unsigned int index;
+
+    if (flat)
+    {
+        cluster = 0;
+    }
+    else
+    {
+        cluster = dest_id >> 4;
+
+        if ( cluster >= 0xF )
+            return NULL;
+
+        dest_id &= 0x0F;
+    }
+
+    if ( !dest_id || (dest_id & (dest_id - 1)) )
+        return NULL;
+
+    index = ffs(dest_id) - 1;
+    if ( index > 7 )
+        return NULL;
+
+    index += cluster << 2;
+
+    return &sd->avic_logical_id_table[index];
+}
+
+static void avic_invalidate_logical_id_entry(struct vcpu *v)
+{
+    const struct svm_domain *sd = &v->domain->arch.hvm.svm;
+    const struct svm_vcpu *sv = &v->arch.hvm.svm;
+    uint32_t *entry;
+    uint32_t ldr = sv->avic_ldr;
+    bool flat = (sv->avic_dfr == APIC_DFR_FLAT);
+
+    entry = avic_get_logical_id_entry(sd, ldr, flat);
+    if ( !entry )
+        return;
+
+    clear_bit(AVIC_LOGICAL_ID_ENTRY_VALID_BIT, entry);
+}
+
+static void avic_ldr_write(struct vcpu *v, uint8_t id, uint32_t ldr)
+{
+    struct svm_domain *sd = &v->domain->arch.hvm.svm;
+    uint32_t *entry, new_entry;
+    uint32_t dfr = vlapic_reg_read(v, APIC_DFR);
+    bool flat = (dfr == APIC_DFR_FLAT);
+
+    entry = avic_get_logical_id_entry(sd, ldr, flat);
+    if ( !entry )
+        return;
+
+    new_entry = ACCESS_ONCE(*entry);
+    new_entry &= ~AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK;
+    new_entry |= (id & AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK);
+    new_entry |= AVIC_LOGICAL_ID_ENTRY_VALID_MASK;
+    ACCESS_ONCE(*entry) = new_entry;
+}
+
+static void avic_noaccel_ldr_update(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    uint32_t ldr = vlapic_reg_read(v, APIC_LDR);
+    uint32_t id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
+
+    if ( ldr == sv->avic_ldr )
+        return;
+
+    avic_invalidate_logical_id_entry(v);
+
+    sv->avic_ldr = ldr;
+
+    avic_ldr_write(v, id, ldr);
+}
+
+static void avic_noaccel_dfr_update(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    uint32_t dfr = vlapic_reg_read(v, APIC_DFR);
+
+    if ( dfr == sv->avic_dfr )
+        return;
+
+    avic_invalidate_logical_id_entry(v);
+
+    sv->avic_dfr = dfr;
+}
+
+static int avic_noaccel_trap_write(struct vcpu *v)
+{
+    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    uint32_t offset = vmcb->exitinfo1 & AVIC_UNACCEL_ACCESS_OFFSET_MASK;
+    uint32_t reg = vlapic_reg_read(v, offset);
+
+    switch ( offset )
+    {
+    case APIC_ID:
+        /*
+         * Currently, we do not support APIC_ID update while the vCPUs are
+         * running, which might require updating AVIC max APIC ID in all
+         * VMCBs. This would require synchronize update on all running VCPUs.
+         */
+        return X86EMUL_UNHANDLEABLE;
+
+    case APIC_LDR:
+        avic_noaccel_ldr_update(v);
+        break;
+
+    case APIC_DFR:
+        avic_noaccel_dfr_update(v);
+        break;
+
+    default:
+        break;
+    }
+
+    vlapic_reg_write(v, offset, reg);
+
+    return X86EMUL_OKAY;
+}
+
+static inline bool is_svm_avic_vmexit_noaccel_trap(uint32_t offset)
+{
+    static const unsigned long avic_trap[] = {
+#define REG(x) (1UL << (APIC_ ## x >> 4))
+        REG(ID)   | REG(EOI)     | REG(RRR)   | REG(LDR)  |
+        REG(DFR)  | REG(SPIV)    | REG(ESR)   | REG(ICR)  |
+        REG(LVTT) | REG(LVTTHMR) | REG(LVTPC) | REG(LVT0) |
+        REG(LVT1) | REG(LVTERR)  | REG(TMICT) | REG(TDCR)
+#undef REG
+    };
+    uint32_t pos = offset >> 4;
+
+    return pos < (sizeof(avic_trap) * 8) && test_bit(pos, avic_trap);
+}
+
+/*
+ * Handle VMEXIT_AVIC_NOACCEL when AVIC is enabled.
+ *
+ * The hardware generates this fault when:
+ * - A guest access to an APIC register that is not accelerated by AVIC
+ *   hardware.
+ * - EOI is attempted when the highest priority in-service interrupt is
+ *   level-triggered.
+ */
+void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs)
+{
+    struct vcpu *v = current;
+    struct domain *d = v->domain;
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    const struct vmcb_struct *vmcb = sv->vmcb;
+    uint32_t offset = vmcb->exitinfo1 & AVIC_UNACCEL_ACCESS_OFFSET_MASK;
+    uint32_t rw = (vmcb->exitinfo1 >> 32) & AVIC_UNACCEL_ACCESS_WRITE_MASK;
+
+    if ( is_svm_avic_vmexit_noaccel_trap(offset) )
+    {
+        /* Handle AVIC Trap (intercept right after the access). */
+
+        if ( !rw )
+            /*
+             * If a read trap happens, the CPU microcode does not implement
+             * the spec.
+             */
+            domain_crash(
+                d, "%pv: AVIC: Invalid #VMEXIT due to trap read (%#x)\n",
+                v, offset);
+
+        if ( avic_noaccel_trap_write(v) != X86EMUL_OKAY )
+            domain_crash(
+                d, "%pv: AVIC: Failed to handle trap write (%#x)\n",
+                v, offset);
+    }
+    else
+        /* Handle AVIC Fault (intercept before the access). */
+        hvm_emulate_one_vm_event(EMUL_KIND_NORMAL, X86_EXC_UD, X86_EVENT_NO_EC);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index 2668d4481425..f9ff3ffc9346 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -15,5 +15,6 @@ int svm_avic_vmcb_create(struct vcpu *v);
 void svm_avic_vmcb_destroy(struct vcpu *v);
 
 void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs);
+void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs);
 
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 693b5c29287a..673c818a0039 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3082,6 +3082,10 @@ void asmlinkage svm_vmexit_handler(void)
         svm_avic_vmexit_incomp_ipi(regs);
         break;
 
+    case VMEXIT_AVIC_NOACCEL:
+        svm_avic_vmexit_noaccel(regs);
+        break;
+
     default:
     unexpected_exit_type:
         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 532382bd02f3..db3f2689d7f5 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -297,6 +297,7 @@ enum VMEXIT_EXITCODE
      * Table 15-22. Guest vAPIC Register Access Behavior
      */
     VMEXIT_AVIC_INCOMP_IPI  = 1025, /* 0x401 */
+    VMEXIT_AVIC_NOACCEL     = 1026, /* 0x402 */
 
     /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
     VMEXIT_INVALID          =  -1
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 93629418c225..377ad2494e7c 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -45,6 +45,12 @@ struct svm_vcpu {
 
     /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
     uint8_t cached_insn_len; /* Zero if no cached instruction. */
+
+    /*
+     * vCPU AVIC state.
+     */
+    uint32_t avic_ldr;
+    uint32_t avic_dfr;
 };
 
 struct nestedsvm {
-- 
2.55.0


