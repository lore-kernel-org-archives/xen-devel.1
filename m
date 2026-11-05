Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C7606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=JqJ5ROW5;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Lc6ovUsD;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=H5BgvUkp;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=OKucfrLE
Received: from list by lists.xenproject.org with outflank-mailman.1473508.1681225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRT-0003in-Ev; Thu, 05 Nov 2026 01:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473508.1681225; Thu, 05 Nov 2026 01:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRT-0003i3-9y; Thu, 05 Nov 2026 01:39:03 +0000
Received: by outflank-mailman (input) for mailman id 1473508;
 Thu, 05 Nov 2026 01:39:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRR-0003XG-6b
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:39:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRQ-001xXk-JL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:39:00 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddeb-8faa-0a2a0a5109dd-0a2a4509e25a-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:00 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde32-be1a-0a2a45090019-94a392177ebc-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:00 +0100
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50mnp31644775
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:38:58 -0800
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by m0482517.ppops.net (PPS) with ESMTPS id 4hra2g3bb8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:38:58 -0800 (PST)
Received: from CH0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:b0::24)
 by SA1PR16MB4705.namprd16.prod.outlook.com (2603:10b6:806:228::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:53 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::3e) by CH0PR03CA0019.outlook.office365.com
 (2603:10b6:610:b0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:52 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:52 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50noPk1488051
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:51 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232wj2k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:51 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmRExrnFYCiSDOmRFxv92b; Thu, 05 Nov 2026 01:38:50 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=spt
	xzYpZv34nfUv1217Kb+esMhpYGTwiPke9zMb5K9c=; b=JqJ5ROW5y/M7ye4VP6r
	Tw/nhX/1SjZrTTOmVGiJx8sKiRtAitttTmLVez+qPnp/tcbtwWGcUuIeKC1fJEt4
	0Ss/ED7lGAoZpbBYCl61bUIW60cEDOXlbI8DqlXFPpJG1jgAbFI3e34LHEdY0k9c
	/2VCPc56awC3xHROGjlW+FBVchZQ+/8eJReVrigonb/rqplSKuVTHefCZYooGYMp
	WMRnoanc/e7oUlbG/Omk5nLfWDCt2oC4IRSKNDLyWRbp4uTt5zWDmK73Pd/pem8m
	4TGMYTQdxfx5lYDhX78sLKLyIpySiz1fKsrb3Us5S9A9bd71ayzRbstsyVCe425f
	H3A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4loumtle1G96QGe+zkj6xFRGsfkRhB3qcpIRXTEJsxSac1APcR4NMBkLe09zwwMQASwFutWDt5tksbI2FDtDzxKdappIyobkAzfzXkbftkXAhojJx/jbcFAbrB/1LySwQ2TlY8Y7k8UUxAb/NqgZcPU5BDHLd3OEX7WuvhzXujKH3wC8duwzRUnazCxK5c9ztc0axAfyvOMNLjgdGp/rJEU7RAmGkxYSGADh4WEUDhIMUjgYfg7IVEeK8YGUW/sqNikRePUInnAx4iLVKGZcM5x81bsdqgEUsKdtpJa5fwQzpaNGZutwkvz1tsa3T3Iqicrm1VrYW13K73ohc68OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sptxzYpZv34nfUv1217Kb+esMhpYGTwiPke9zMb5K9c=;
 b=ezE+VHjtBgcv28HYPsdExNsl7kPJHFBXlVqPa09G1bKM0f4b2RzlMnjpFKvZK5oR1ajLIq2j4DF8jZSflWV/Ywwz2gUB/4bvrLhtMcstxEM8gzSYS8KKSyttDqLtz3Hhryk0qoGRKsCBBeEQ97YT+Upae6TGIjQlgRYk7Y3HKc+SRNem8+SZ2hKUPiWZo5l+RDdggiWPltFqmxAB9Ae0w0UOM1zhbM1isuRmd4NMS344RwR0+HRcu9nVAUNpsJjR9nK1mUGVqiW+MDhnVkFzbOVhUfa9kz/NtTXZRptNZHOSLSZ/GjFajaet4MYNMI9wls5IGZHHdvz1S56x1QrbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sptxzYpZv34nfUv1217Kb+esMhpYGTwiPke9zMb5K9c=;
 b=Lc6ovUsDYhSjW3JQszdTFFRXLF3PqK3qItLYqJJK8Hy0qdlqPu068B5vwol0LmlowjNKclVibaa2gF+vpBvHNkYqdp6EdaiyLzF5Sq8WIOCtbdxW6G2fngul6NLF75PT1fsn+yIBhTtsRKeTtx88qBiLNKrU8o/hpPDiqKi+JI0=
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
	ppserprodsaar; bh=sptxzYpZv34nfUv1217Kb+esMhpYGTwiPke9zMb5K9c=; b=
	H5BgvUkpLyfKUvVHpvPPrXVQOCcwZHvIxezyKM83+cwdd5SlCA8srzoaJIy58LbM
	wpyvGUQ2ZNOyox8SqPFFGoyEJcC/EI4qTqX6ycXqp9owAn3Dr5ESKX0nYKdG0tNn
	COJDARAUmdS3BJ5fJsclyJz6q/1ie08bublate5GFbg77iQtqZApucoiy1cd3BJx
	W6SFO4bOoh6PEU8QDvXcbbTJ1k5xtLhIiiPNIeBdsr0fexSz4AJDgRqah2Lsi+ts
	k+Q1pT1fVRZ8EQr+q+cH45XAz0kjpuQTWSPpegEX4vYb0+NQFR7an+PMn0twy6e8
	Mpfy03lKiW7XnrH6RN0Org==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=sptxzYp
	Zv34nfUv1217Kb+esMhpYGTwiPke9zMb5K9c=; b=OKucfrLEK9D6M6D1heGko/w
	DoZgOIxRqo3Fe2T5Pt3qno9O8RnGfX2Wp1AZQuyjAYHtWa9BII0v/gHyy3hVQ3pV
	d8oWMWNCfFAPnOH23zWy8F5GOmHOI9m4XlVvFl9rjqvO3OTYrCNsStbTvg5GzRYX
	SzrzWJu5+ZGUIOEINxksfFuCL9P+wIUOmj8B9kq4bBLBg6nfJAY7Ny9+ImdaVF82
	6NHNZb2OduhGGIcDx6KhETj+5a8eGaHyDilvnavMfKvVs7BtwJUACbXGcVGpfVJm
	Zv4J/kyun6gV9WFgQyECseJsKE5ZfcSX9x10nmuxnlYholEjh8s3tW98fUrwW1g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRExrnFYCiSDOmRFxv92b
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 10/15] x86: introduce simple time management
Date: Wed,  4 Nov 2026 17:38:12 -0800
Message-ID: <20261105013817.719823-11-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SA1PR16MB4705:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 165d2f1a-a064-4246-141f-08df3add8c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261022075727099003|261009223027099003|261022105027099003|261102123227099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UEL+42vpIjTmBQp9WuBmEJGgKFbBDl4k6KXXZAMlKAdiOIozkfhZZ74ylW3VKxyn9UUoyZl1WWPZQ7phy+nainRGghEVJdQtxKl6wR6FvEY4ds/GWuT+xXkwOzxFty/fN/IoVp8cNj3vt/mbrNEipV+CSMquYtIfnO0/OVlBPGPa1UNCUkU/b7M1kkPcPmmNwHddOu7cMZH7EtvHGDs7k6klpwdMNlSC75rj2mzCUmCCvy0ueEkiCoOkWVG6//OqOdHuuKBR0RugdpGfxpc72hj+5TgKHs64TCytLboYqUOTkmAyIt484NzTQ9vgMhYogbr1ifpLJJHAaB4iVHHf+yMryhv4QJIaM4MisD9KpJ7jF4ui6KeHw7xE0iPaJiVo93YSPCvmuc/d1ETb5roVR9xpM1VMShyXIh+gzhqEEHAg0jy984F8hQvs/dqHWsu4HJgUtDUCab68IPXc6B30AWqUz5gUgbWaOBd/T7C4dX2uhoJZT+Xavs6r2E+vRXtHoVCTgXvePHcsJ0/Rymem9eeG+W7AUy+5a/6yPqYX9B+3+IKehRqUkoUA+WQkXS0nC81689w6Y+jlcgwlm5acAxLG37PSNL9c+ENRa3R8jB04xCkD5NfScHJlAJJbb8p/dAqJQ6/PghqiY7GxGxZKWs/hdnpPnvW/3XPyg2j9yop3a8dlNDDLgcj9J1x6KVkERJNHE6m38Wow4dKrq3vwmg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	St+t7bb/uaUqOfB13wnwvJpqzEgIwATZHQTKAYV0Mt6bVu36+uahmBNy6mVQ2i8wWB4y/62jT3b8Q1W/tk4BdXQ1J9MgRVzyFVBMLsBXulcY8SFISBfT5LIeudMtv1GUcSyAfJP5woIbWCE0OddCpaCzVYo0wMHfKCtDn+udZHt9H+q8x1VLAxyahDOtyzrhH6rNa1tYqaZbi/8F4Sk/+v8KWjkMjx86HfhFi8B7RhBomfkFM72DuzZTlxuLwyWVKbyBKAYZzr5shpDqRB9g0qkHpkgWcfpfC/JNxrZlu6dQ+7AMJZLuR82XSNqyfEDAvdIXSQ+kDsMsMCjZAfMkAcSkS52UH6M2yLFaC6dQ8bfDQlaHtEqQJxhLh0zowbr8/G914GPMDhUOLOyGEzedA+Ug+N4JEJeZ0dJHScVfCmKTZM9cf1aO7Bb2fEjZ3p6q
X-Exchange-RoutingPolicyChecked:
	Hzjbimjo6klbhZ6/hNQrWQ+9N3oO5qK4toZTD4ZvbJv6D0AJw19R3hd7fAOixtVx6/99yWWOq+jovmY4Dp1VMzZ6DWB4HKjX5JLePuX1J2w9G6kVXPXG/aT3rczHE7KY392X+i7JEO/GCze2WoSL5uS0v0PcoQdWoWTDGD121GGSONXsJKIhlNJv0MKHdW9BXUGatt+iWw0QvV8a/hem772cy0oWCZSwpDYORNiSiIqYgPE+ghp96H3MdzYw3+Q1MCRjgvmP3ff57t+1mKTMmC9V1FQWMpfsjW7u1UPNSw5EEMDK3rZfcblPuJe4M4IcI970pU6h2rCWcZl86TbSVw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FzP94JBCT8k/+3Uv8jXVmBEUKuu171JIIT3kSpFwoZG0LjBfaTCFj0pkGSY5P/o+CYZm0Cuzo+yvgXIDBOO0Nb1F8keJcfXUZjTUvAKsHu7NUnYJtpsE9P01Wp0fyvSnw+A5gxeVSuiLaq53Db5wkFyMudbWbiizZaHHKT7Ig8ZrAkhq/7TfQo1J5CKuIK2j16xxPlPKrjwwtvEJ9Ka3eHNetTlv6FmHkrMG1UoaEIaHEZJUGEoNHNR4Trttb5/4Zq/X86OlAKrIMGxldJnI0FBFxGR3IvTOojPbZREIOeLaLBOjFTUaPI4Wdj0TgfeSiwBWFn8FwIqUNRNUi1nDGU8lQp7nAScgvFeuoGplUPBUbj85J2VmuN+47bMPjRq5USUHi0Ea/VndkwYvAxRQkhYUjlKIZIuEtrhB5l8ih3MwOzCVYnKg01zk1QeQRFX5ydmDXFMmadHu3rMFkL8KCiMRyW6+20iEWBnSaIDNeC+cM6KxYpCjTnEWNgoDNQlY29wzeftZDSZC2AAotkCMoy5pDstgBycjyZWnPE6EXzqnflXK9PsGkx1csaZJ9myrEj3y+HYRwb5DrRhLTiG82mURTvIviUZDP9ypxWQJlTrT8fr6ofXm8xdMbP7B7jF3X4IY3aTX3IH9b9FHU2Qn0A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:52.2134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 165d2f1a-a064-4246-141f-08df3add8c38
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB4705
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6aebde32 cx=c_pps
 a=UyUtkpB65yKBl9uddpDweA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=qOLhJHLYC8HWDslCEH4A:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX8ZdN0pbH1rWh
 7mFWCYeDp+WQortGa3Ilnp+KKTvj3c3mayPV3v+yuosIsg2cdVwghFZGLlELM+Gb/AvZ5pa9bpt
 hR+A4ZQ9U7pm2r41XBhykSv8SWjGHWubYyAnseF9uSWzWSuXb495HCSG/wRIqvfnDzDqA+4ipf6
 8eBvV69oPs6xDz/BQHl5Qm5pTClEg0Ch3fZbJJgssmJux0HNBs671adXKXdgSSrM8gpBfE38tgH
 xKrugYekNdHZkaTw9Q8l9el8Mlf6WGB709C7MtjNhAay+Zovwjg/n3yyEU3vZmnr4bvHbVP+Gyn
 SYNDjLsicESYEJqEtopJLLOFfuPWGfk1AAFJgi3nGwQBJM1Vw+Kr6PnWlTkDTNCvoGb8mPEz5/D
 21ySiHU9KsfN4K1WbGWuwsTBIxooFvXSXaK+pQcPWXffrf3mooLGy4hCg2B28tCbH/EL/6uW3IX
 KnsNx782DwHhCTArgKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX0SSyR/uEK3lX
 5bOu10dnlEsHbK/vFJjz2NzsSjkek01rYtonaD4jqkUwRu46EW0japMFqcbSRPgQU8VPwtt7UBr
 PINQBKr5fHpWSa3lJf3Xgyvbi7chbIfzQA0VTt1uwZ8vpMrTGERC
X-Proofpoint-ORIG-GUID: NCLEHeHwzx4U1pvT_ZBVqYFHJH6Dr2nv
X-Proofpoint-GUID: NCLEHeHwzx4U1pvT_ZBVqYFHJH6Dr2nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-bad1c0/1793842740-FC817034-6A83EF9D/0/0
X-purgate-type: clean
X-purgate-size: 5961
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Some tests needs some estimation on certain operations longevity.

On x86 systems Xen conveniently exposes TSC frequency via
CPUID[ECX] 0x40000003.

Add TSC-based primitives into XTF to allow time measurements, including
TSC to time conversion routines.

Add common xtf_init_time() so that it can be called on demand if
the test needs time management.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 arch/x86/include/arch/time.h | 48 ++++++++++++++++++++++++++++++++++++
 arch/x86/tsc.c               | 32 ++++++++++++++++++++++++
 build/files.mk               |  2 ++
 common/time.c                |  6 +++++
 include/xen/arch-x86/cpuid.h | 26 +++++++++++++++++++
 include/xtf/time.h           |  8 ++++++
 6 files changed, 122 insertions(+)
 create mode 100644 arch/x86/include/arch/time.h
 create mode 100644 arch/x86/tsc.c
 create mode 100644 common/time.c
 create mode 100644 include/xtf/time.h

diff --git a/arch/x86/include/arch/time.h b/arch/x86/include/arch/time.h
new file mode 100644
index 000000000000..3a244a2a6eda
--- /dev/null
+++ b/arch/x86/include/arch/time.h
@@ -0,0 +1,48 @@
+#ifndef __X86_TIME_H_
+#define __X86_TIME_H_
+
+#include <stdint.h>
+
+extern uint32_t tsc_khz;
+
+void arch_init_time(void);
+
+static inline uint64_t rdtsc_ordered(void)
+{
+    uint32_t lo, hi;
+
+    asm volatile (
+        "lfence;"
+        "rdtsc;"
+        : "=a" (lo), "=d" (hi)
+        :
+        : "memory"
+    );
+
+    return ((uint64_t)hi << 32) | lo;
+}
+
+static inline uint64_t cycles_to_time_units(uint64_t cycles, uint64_t mult)
+{
+    if ( !tsc_khz )
+        return 0;
+
+    return cycles * mult / tsc_khz;
+}
+
+static inline uint64_t cycles_to_ns(uint64_t cycles)
+{
+    return cycles_to_time_units(cycles, 1000000ULL);
+}
+
+static inline uint64_t cycles_to_us(uint64_t cycles)
+{
+    return cycles_to_time_units(cycles, 1000ULL);
+}
+
+static inline uint64_t cycles_to_ms(uint64_t cycles)
+{
+    return cycles_to_time_units(cycles, 1ULL);
+}
+
+#endif /* __X86_TIME_H_ */
diff --git a/arch/x86/tsc.c b/arch/x86/tsc.c
new file mode 100644
index 000000000000..93c4de197984
--- /dev/null
+++ b/arch/x86/tsc.c
@@ -0,0 +1,32 @@
+#include <arch/cpuid.h>
+#include <arch/time.h>
+
+#include <xtf.h>
+
+uint32_t tsc_khz;
+
+void arch_init_time(void)
+{
+    uint32_t eax, ebx, ecx, edx;
+    bool emulated, reliable;
+
+    cpuid_count(XEN_CPUID_LEAF(3), 0, &eax, &ebx, &ecx, &edx);
+
+    tsc_khz = ecx;
+    emulated = !!(eax & XEN_CPUID_TSC_EMULATED);
+    reliable = !!(eax & XEN_CPUID_HOST_TSC_RELIABLE);
+
+    printk("Xen TSC: emulated=%u reliable=%u mode=%u "
+           "guest=%u kHz incarnation=%u\n",
+           emulated, reliable,
+           ebx, ecx, edx);
+
+    cpuid_count(XEN_CPUID_LEAF(3), 2,
+                &eax, &ebx, &ecx, &edx);
+
+    printk("Xen TSC: host=%u kHz\n", eax);
+
+    if ( emulated || !reliable )
+        xtf_warning("Xen TSC: time measurements are not reliable\n");
+}
+
diff --git a/build/files.mk b/build/files.mk
index 8a7d6f8d588f..ad39c00751b7 100644
--- a/build/files.mk
+++ b/build/files.mk
@@ -14,6 +14,7 @@ obj-perbits += $(ROOT)/common/libc/string.o
 obj-perbits += $(ROOT)/common/libc/vsnprintf.o
 obj-perbits += $(ROOT)/common/report.o
 obj-perbits += $(ROOT)/common/setup.o
+obj-perbits += $(ROOT)/common/time.o
 obj-perbits += $(ROOT)/common/xenbus.o
 obj-perbits += $(ROOT)/common/weak-defaults.o
 
@@ -25,6 +26,7 @@ obj-perenv += $(ROOT)/arch/x86/hypercall_page.o
 obj-perenv += $(ROOT)/arch/x86/msr.o
 obj-perenv += $(ROOT)/arch/x86/setup.o
 obj-perenv += $(ROOT)/arch/x86/traps.o
+obj-perenv += $(ROOT)/arch/x86/tsc.o
 
 
 # HVM specific objects
diff --git a/common/time.c b/common/time.c
new file mode 100644
index 000000000000..c6e5136a1567
--- /dev/null
+++ b/common/time.c
@@ -0,0 +1,6 @@
+#include <xtf/time.h>
+
+void xtf_init_time(void)
+{
+    arch_init_time();
+}
diff --git a/include/xen/arch-x86/cpuid.h b/include/xen/arch-x86/cpuid.h
index 2fbc8eb656a0..9e1e7e6ac51b 100644
--- a/include/xen/arch-x86/cpuid.h
+++ b/include/xen/arch-x86/cpuid.h
@@ -15,6 +15,7 @@
  */
 
 #define XEN_CPUID_FIRST_LEAF 0x40000000
+#define XEN_CPUID_LEAF(i)    (XEN_CPUID_FIRST_LEAF + (i))
 
 /*
  * Leaf 1 (0x40000x00)
@@ -36,6 +37,31 @@
  * EDX: Features 2. Unused bits are set to zero.
  */
 
+/*
+ * Leaf 4 (0x40000x03)
+ * Sub-leaf 0: EAX: bit 0: emulated tsc
+ *                  bit 1: host tsc is known to be reliable
+ *                  bit 2: RDTSCP instruction available
+ *             EBX: tsc_mode: 0=default (emulate if necessary), 1=emulate,
+ *                            2=no emulation, 3=no emulation + TSC_AUX support
+ *             ECX: guest tsc frequency in kHz
+ *             EDX: guest tsc incarnation (migration count)
+ * Sub-leaf 1: EAX: tsc offset low part
+ *             EBX: tsc offset high part
+ *             ECX: multiplicator for tsc->ns conversion
+ *             EDX: shift amount for tsc->ns conversion
+ * Sub-leaf 2: EAX: host tsc frequency in kHz
+ */
+
+#define XEN_CPUID_TSC_EMULATED               (1u << 0)
+#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
+#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
+
+#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
+#define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE    (1u)
+#define XEN_CPUID_TSC_MODE_NEVER_EMULATE     (2u)
+#define XEN_CPUID_TSC_MODE_PVRDTSCP          (3u)
+
 /*
  * Leaf 5 (0x40000x04)
  * HVM-specific features
diff --git a/include/xtf/time.h b/include/xtf/time.h
new file mode 100644
index 000000000000..1e5895122a34
--- /dev/null
+++ b/include/xtf/time.h
@@ -0,0 +1,8 @@
+#ifndef __XTF_TIME_H_
+#define __XTF_TIME_H_
+
+#include <arch/time.h>
+
+void xtf_init_time(void);
+
+#endif /* __XTF_TIME_H_ */
-- 
2.55.0


