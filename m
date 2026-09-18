Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6739CC982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 20:29:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425869.1649573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7fDB-0006me-I2; Fri, 18 Sep 2026 20:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425869.1649573; Fri, 18 Sep 2026 20:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7fDB-0006mX-Ex; Fri, 18 Sep 2026 20:29:33 +0000
Received: by outflank-mailman (input) for mailman id 1425869;
 Fri, 18 Sep 2026 20:29:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1x7fD9-0006mR-Mh
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 20:29:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7fD8-00AMvM-Mp
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 22:29:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aad9ef7-8faa-0a2a0a5109dd-0a2a4508c7aa-18
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 22:29:30 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aad9f29-f659-0a2a45080019-94a38ff11326-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 22:29:30 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IKF3Fj2733445
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 20:29:29 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4gsbr9rbgj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 20:29:28 +0000 (GMT)
Received: from BN1PR14CA0026.namprd14.prod.outlook.com (2603:10b6:408:e3::31)
 by CH9PR16MB390768.namprd16.prod.outlook.com (2603:10b6:610:33a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 20:29:26 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::8d) by BN1PR14CA0026.outlook.office365.com
 (2603:10b6:408:e3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Fri,
 18 Sep 2026 20:29:25 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 20:29:25 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IKCJcP566546
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:29:25 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4gnnc7ym46-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:29:24 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id 7fD0xDPVVDCvh7fD1xIEOs; Fri, 18 Sep 2026 20:29:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=ImK
	ihgVYYeqtDgPRyVBS/ngR6EsgHV2ulJgp21CGLIs=; b=is/JIvjsyyPDLKUWLC3
	okadhYt1LFUh4EQFI3UbfVnxtvf7SKj3I9Pnqa88eT5y2ne6vufvxPmaRMOBgQ0z
	uUC2Tag6qAq2zHX7Z13J4cpXuRm6zcLNN4UuokS0pAebG+cbM1tlSQOCegjdn4vs
	hi3vRe3a3+BLGofjRlSMXzRsnG4SKQhEno05v+q8NqxFGj65UxnsmSkDZMOVW9Ot
	+gKiEh5lSa7WndfdKXc6Aborpv0ZSd8Oaie+ujY0aybf+VK1ly40xlgU42gz2ggT
	Ul/dbTlWHd+Es0ZMXRsV5Bw74RtcHTAfWEoG6SMUruycyyd1u8EDvgKyRU0LabWE
	LHQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxSB42msDky1hLm4dFIZgWzzpP9TAFQoNaEz58XnWIRWy0eOFN1ka+BL9Ctg/oSu9p2SMu+Qk28u51y15mw0NRkoHl69wfyDACUQlZgqGO6yX/ItJ88ZBtBh7Oi3L4ng3rk4Xx8F2lnzXCOGpO2fbsUs7Y7Q4dWRLmmi1LH2JQ/6q44fUxFFjUt+6juYclRjR3ONhNZjgnv2F4PXhDPf8oKm/bGC+iNIkhxJ0zwLqW9OCS/YJxDaGOoSxHMQ4ErE0GC1MuBGtNU7eKfFawbx5dNmiNAJlamUfjG4h0BpHXEf3HqPkxvKHOs3R7nkyx1SylBcPS4FNdMrzZ0hhtmx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv7kxj4BdMlu+VZ2+qb8knG7rLAwHsxaH+hgEYah3dc=;
 b=AOET3tnp2ZOPGtdT/+FisPsy88F8gcqEUPtN7YpQgc7G/Ft08Y5r7/7EGoSgd8AqwrN7TrjWl7L+C9W/jDjPMU5zHz60gy20YdLtG5B7GhXRGLXZ8uJJXQH1+w46HLhgZr2VI+hYbMvEwwvQjYu7f9t5wTd6evA6ex0BDnZCf+LM9aK4p9A5h92jZr8MG550RL0Xax49TdlaGwewxqg4PyA9EFOQ9zcYAbTTn+u7CmejawIrY1GpuNePS/sP7QS8ACnFemXYBpwHRR+9C9UYien8AD5RK85n3RNiehGPR59y/vBBKRFjtALdJOVhV/k+H8QkKo3JRSxtUArXjzw4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv7kxj4BdMlu+VZ2+qb8knG7rLAwHsxaH+hgEYah3dc=;
 b=I5kh59X5Vjxu84+kd0PhRanXcNoT5Fg8wlCvDGHpeg69DqYYKMa4OJAQFhttFGSPSNXi/Ox3PAKLsFpdyJdxAECGOAzUZ8PJM6OshMgl8TrGVXd8KwPPaVzwZDD7Tsr6mWkV6jdr6vMxYsgCgwKDjvjyj0E1+dqF8PoZEn0O7bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=ImKihgVYYeqtDgPRyVBS/ngR6EsgHV2
	ulJgp21CGLIs=; b=hfdZ/06Uxg+X1sZkUFXru9OBYNh3h1B8bPEVsQFJrdu2JG+
	vc1ICdfk/p0L67gW9/uNdo3lfmAZPSlfY/gZXnEG/vvWk/atU0todUwXkVrRfYjh
	SedIBH/u/YwSujaWPOLM2LDdrGjffk8AxXg+DsqZRZXny6QmoF4b+kSfiYXTE7DD
	VIHXL9t8M1O+t5NuRUMwaKNDUh3ZyASghtJ3MWfDwoKRZ6Li3DDwd+l3pzgvqSYh
	pUKI+9HsyHNHH3YHD+YwUBp3TdFMqfw5fadBL3/WfeGMRxLUECo+KjCozU0ekSJw
	HTbmW3d0SPPsgf3lBliDjjklF1bsUobVGqZgNxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=ImKihgVYYeqtDgPRyVBS/ngR6EsgHV2ulJgp21CGLIs=; b=S9SePF5mu2/9
	WZ14rPKO6rGW+VT14OFrDuuMIsm/7noA6m+XZHmKMMjLDroQmG0gjH6sa9/98onT
	m6DXILgAlv9MS59is0d7cVzkqTQrbNCuancTy+8fHRLhPBy3dsNEVJftktxAktUa
	373K9yXZACw+W/Jl3Dj1bFFAU5e7PMSQY49bTX4N5novXEcq/+e2OCgUh3vynLSC
	BlIpLsg8g4zvasXH4UEgQ+EY/eHteIIA9/iNL46xBEfb59a0QiurKyOp19r0WFxN
	D2KNUvqMYDtkrNTVRsHIkJYc+Ce9roJY+wyE2R/r0m26AUp9pi4YSyGpGs1+GZuA
	31gKzs7UmQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: 7fD0xDPVVDCvh7fD1xIEOs
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 18 Sep 2026 13:29:22 -0700
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Denis Mukhin <dmukhin@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Zen5 runner access
Message-ID: <aq2fIjkLvcDq0i9m@kraken>
References: <aq0nXDnJ5PX5uiW2@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aq0nXDnJ5PX5uiW2@mail-itl>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180294
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|CH9PR16MB390768:EE_
X-MS-Office365-Filtering-Correlation-Id: b417992f-3c80-4fcc-34e8-08df15c38827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|56012099006|11063799006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ROgu/QCGJYGwAo0FAwSyhqVq+R/Keum0eTI1iEkRQSshzW2sP6W2f/TTf0MyP9fTbJtmehpE6zfF+jGnh5QtDICFqlap+/GQPOutAfUj81nzkCDfB+BxHTYbtmjhY6cqBRnJLYAEaPHjKEWnhxqQaSbBM+xcAwPCJZBdOTXSz9KlWs0K1V0pacxPMDOywak19A7Dd183g3sgH28khj8gAtjokGFcPNoljm2rfPBmgqTEUs5QC8pNtcBQjfzXKI1jN/yQVDlNZeVlJo5ryS7O8xQDLBs1MwXgFipy+64b4IbXNetsmUsCPEItNQ3Lr8+FrGBjN5pugD2Hw/ztgwo/66tO2sb7YHkRvUjv8lUbIc+9ocevhUjd/tB3U0exkvXkBfxdlsRPy5wU0JLVUvLwE3CrUGuzf5pWc5SUFfkbBRU73CDL2bdpw/ATnMaEvIY9yOuuLMSB9HKapHRycus2S0IHB3Om2YHg97BtKeNYIfBvtijZTv3yWoVhUYczuQ9M3eU17caiKoXyaomQd2FJD/oZ+6rBiWxXNDPlQN+fU3KMmLP1mG4hywj+c+Q29ryrG08yjIF+myhoyUBDH5E5WloLwIiaKermzBETnQ7xe81NatWSJSMFpDMG15edFNNdjDv/BhD8kuS5aZLDDirNyoNIPHRO3PnsyCHeYo2xzKtqopxzqGjGSLMlHdoAxkxlx01CV/LWzY590zDpEJHpvw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kcfkMpk9Vzcy9Uh/MO0laODw/iIP9r9IApYz7QAHoXjDDE5knnxuPCcdbdEqSD+P38VgMA6J6JVBoZFrqu2Omgygi/Svy5NxqLHXSn0wZ5h/xKSuWQtAbmQKtYup5qChCLDGrXXSqr7NJN/+j8gIinbhIH2mY0P+MjOztNtopqCZ/L9PD0zSMk3JxdT5V+M6/66RWMLu83VF4kJ13NkM/p2UFIpM5xRcZ4/e/7zBiTR9CNH0C7TyGHRYBNYkNOv0XKNNyzJG4Vo1TL0Bwxurz5/7qAjeLG6Pa6O9UzLu8Z5fB6Xw5f87Ph82nIKT9dVS6ogv01tdgTYkaisqeOQCToChxS4vBbJqY67HZ6Hcw42Jicapo6o6mHaFvS06ee9EUqvV88LIbu3HJnNorDrZuFiMqJG77aAxuf8a0x2f2rRTJkLPXgh6KArIdR1XTLfH
X-Exchange-RoutingPolicyChecked:
	iy7+Gb1TpEEzLL5fox0C4BSV/aTApMp2pR7/0/hX6XX+4PWguXhPJ7hh7FMdvgZypbtsCdUx1m1ufsxBJil77Cz3e2Vx8vxFVv9gb1LmxOBVT1i50CYQWVPC3axcKyXVF7PK+1kOgWjsMKuvB1OVTu1YrWY5+sOZxlLFIxB2X8SpVbffXV/bW7QcU0F/fWe+2j9IVu3k6BAvbN6MgcgB1vQEP/buQ7NCtYwg4WQ29u91uZ/KLxD4I8q/G5ANbXJIsBNDO6jUiBEygTafVKBSGOyvsZRddtE6bxEZN00MrlmrrDRyYv2ANx3L9yDDbu2rErNl9WNW/gPKNkuFAapMIA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L6+Ninu/VHD73gu8MUOrMsxv9PMyyb8AHxw+AZD39RSLnXxLCFRdAYgalvdNIpO3rqReri7OHUJ+8SevnnN5kMtDNSvrvozn3tIGNA4W+wepEg0GUSD1Wic/9i3HSj4HORFL4tlEddEboCdsxJeuV9NKkx2n6CyUWnN5ta9SP6juVU53+xo3raMyn6xDTjFTA99Vv3CQIniCTDxCHMN+aKZ6fPsiSQkWNXqye4wcMDjRfzNk0I5L34faprRyOQNaZkC41kt3WucVPEQDGegXzGf7I1O9baCCpKszGal4xY3LlgPTBzqjxhiURZTa/YR0L115k9GWDGR5lLFF580pvh/Ltjam8Rw5bfl+9Uf2JEpvlYwm5RJqhAEGpZ42ALLNewKXbRks0xv+RSAR455ZqNzDdJmmiVl+wRnbbWkqeaGl9Mz7cI3rehp+ZVRv/8t+U3jPQN5Wk+SxPYQA6ziylYgFA6wjUWlr5il99nh/wswCEUWJl2QkAcUQ9l2b7kt2j6m/UF3A+M6NM4C2DDGuykMfQq138PgkxyMhy7bNrpq6G+YO2UAao8UJDEcE8HSukdMPMu2i0lLRJdvQrhVIPJtbAn+8hgU23aLb3BTcnxQQqkgX8/p8aVKWKBHgRxwzqsZXlBnFTluAXd13oI3l/Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 20:29:25.6104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b417992f-3c80-4fcc-34e8-08df15c38827
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR16MB390768
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI5NCBTYWx0ZWRfXz+zwOSfKMFXm
 Ni5Rc7bjv3KEJQAnJz46D562vmVEb++Fh6h+ika1/UrEUhuGi/Oz89FVnsIguTIa1AUROR4tLwD
 meAUcqMaSD6Gli4BtybHohDgzQnHySZ4QZODvrtgW+SMG03Ofhfi
X-Proofpoint-GUID: uTDC2Wavo4i7LUIpyQfpMQFoZ9lodQYA
X-Authority-Analysis: v=2.4 cv=E5dYNqdl c=1 sm=1 tr=0 ts=6aad9f28 cx=c_pps
 a=gjcLB77VbSPYcqvaeYBpgA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22
 a=p0WdMEafAAAA:8 a=NSgd35z21Kgu57nUP4gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI5NCBTYWx0ZWRfX9DAqyHCwzO2R
 ljB/VC3ArVcj75ypZSLnCGcidxRhQ+cXI3xIkXifmsknQEqeiU3FlWy8uWWkgWBSowPMJ0HWX48
 Ghg8DFeC3CGp+WBYe3MrkTBQUcR8yWLw+QI46DDH1BQixv40+MhTqx0Go3pQcEdn4hI91LuBTYF
 M1RG0IM++amHwB6daUVBGsT1oPvY7s/zcrCegec8FL6I2iP9qjMTzKB/KQYPGVhINcq5eAsUs7M
 V7Gi/civHFirrvcxviXHmQ9X/TWATUOBvexEODROW0OAtTj1wmgzYMtS6uWGeg+F8+EJ7wirqe5
 LQR+1/fjBABkYzd+T1z1V2lbJYgP676rlGGPg1F4G4Gr09xKglscoVj0MSvuxLpDmmo0s255cER
 ipJ/xfa/o444sUgkEIQK20bW8+jlc6kBNvBJyRSi9b8gaopFu1FxJMORdBr65CFphAsA9oH1Tr7
 dvGVn5K99HA95tGsuAQ==
X-Proofpoint-ORIG-GUID: uTDC2Wavo4i7LUIpyQfpMQFoZ9lodQYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180294
X-purgate-ID: tlsNG-c1860d/1789763370-CCB7187B-0F5DA67F/0/0
X-purgate-type: clean
X-purgate-size: 1222

Hi Marek!

Thanks for help!

On Fri, Sep 18, 2026 at 01:58:20PM +0200, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> After some debugging, the AMD Zen5 gitlab runner seems to be working
> now. You can add it to your repo by going to
> https://gitlab.com/xen-project/people/dmukhin/xen/-/settings/ci_cd
> Runners -> Other available project runners and add hal9021 to your repo.
> This relies on temporary access I granted you, so you need to click it
> in the next two weeks.

I have added the runner to the project, it shows up in

  Runners -> Available project runners

> 
> Then grab top commit from
> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-hw21
> that actually defines some jobs on it - edit it to your liking to run
> tests you want there.
> 
> And then, you can also select which jobs to run while pushing stuff to
> gitlab, for example like this:
> 
> git push gitlab -o ci.variable=SELECTED_JOBS_ONLY="/zen5-.*|alpine-3.24-x86_64-gcc-debug/"

I picked up new zen5 jobs, but looks like I need some other permissions
as I cannot schedule on any hardware runner.

All jobs are deployed on qemu runners only for my gitlab account.

Thanks,
Denis



