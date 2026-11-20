Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE6D606A325
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=HaX1gxwy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=jxbKmmVD;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=VfEKQr7Z;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=psbKJtmt
Received: from list by lists.xenproject.org with outflank-mailman.1498402.1696182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUSt5-00045K-Mj; Fri, 20 Nov 2026 17:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498402.1696182; Fri, 20 Nov 2026 17:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUSt5-00045D-Jw; Fri, 20 Nov 2026 17:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1498402;
 Fri, 20 Nov 2026 17:59:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xUSt3-00044v-RL
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 17:59:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUSt3-00Fltd-2Z
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 18:59:01 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6b008a54-8faa-0a2a0a5109dd-0a2a4509858a-16
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 18:59:01 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6b008a63-be1a-0a2a45090019-94a39217ec3e-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 18:59:00 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AKGd6462092601
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:58:58 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4j2swsh0k3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:58:58 +0000 (GMT)
Received: from CY5PR19CA0115.namprd19.prod.outlook.com (2603:10b6:930:64::23)
 by EA2PR16MB5581.namprd16.prod.outlook.com (2603:10b6:303:24e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:58:55 +0000
Received: from EA8PEPF00000009.namprd05.prod.outlook.com
 (2603:10b6:930:64:cafe::d) by CY5PR19CA0115.outlook.office365.com
 (2603:10b6:930:64::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 17:58:55 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 EA8PEPF00000009.mail.protection.outlook.com (10.167.249.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 17:58:54 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AKH4Edg3477220
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:58:52 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hyadv85hu-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:58:52 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id USssxRwpuvYgUUSstxjHKA; Fri, 20 Nov 2026 17:58:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=Gg2
	/iT3cubrYF8n6mkhgcAWhojtcRxE+vTh6k04Mkys=; b=HaX1gxwyjK+BGUYisv3
	QDXrL5A7eKuufqZB5MzuzZz5DcceP0Pl9QsAQOjNHSAtkRts0y+C3mFUautSllu8
	re21kgAi3zi4fzeqvAdHu/jBRGS5IBN9R7thNTjy1ESJRMhY7y8Ehde/GGrWKZv2
	D/x3fCNNt3A4y9ok0LG8mqVSBgxkEsD2F/z+4+JN+rCX5wZfm3b7C7pg0Z2p4qWi
	fGnXSpwlkGtKIwpnGOyASFvHxfmyCGi2eMQSWgW6sqJGSq67If18o89PI+Wrdot5
	zfBQiyp6jVm1FTi1qfqcJ7Kn7yuIYxAuIleq/M6mC7btmAIrI3j33U1ClAzalU3+
	lag==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaYVGJ0mWr9z58CB2kXj1V3Uq6JhvE5b2AttozUKK/p2L2rUhKwuq2mMjyD+jQlFCwvNJAkrlSqjgLOPPbR8Qjcpqa5svn2ib0e9/2f+TAVuwq7zDtpfo+5DKUJZAKg6WI95bN9E4RgCz5NmJ+IUYdRde2VHqGi2buwJXFXUgn8scRdUac0f0Jy3r5hEGphQsay075ngyWCSagwU7Bm/21yLspyVG2Z2ar5ZSJIUHGB3SxLaHwQhOCsSPO8vdcZ94vl8XSzi+IzfZXo4QhBTfQw+Ynyg/wbn8hYHWB/XpJNm5M2fr0JraiXV2NR5q75QtJ9D9j/oSB9oxmIbC/kAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8Bx0qAIMfPx5r188nLnmajJ1FudkWKkNNp7feuRJGg=;
 b=ZHzQGkcuwYC9A463ILuJXsOJE0v7ZBeiPhWBXK+/AggX6grPLUcEy6P4hwzp8Gu6VnrB1FpFUE3OS95hAWPnP0JJfNTc0hLrDHM274YeYODL63fEJFYKfaQ9kDmZU7HxAQ47/FMWWc55oI7oN3B9zlRiHb0FtNkRvsAtzZXf9bCLVAnhmzET2BHPPfdyABrwPP2506JX6/rHXpiu38/973iZY/wNMDtEviqWIlaSkY8b4ANYGBMJoXbijEtF+/LkEkZKoMd3c7WMwntx7kkme5YN+8yjVF7kD3h9E8g/UCCP3uVmEtPNwLI6fANwi+ChmQScMfYxyKbT9B8Cr0A23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8Bx0qAIMfPx5r188nLnmajJ1FudkWKkNNp7feuRJGg=;
 b=jxbKmmVDrZRuDSK+RvPbG8qZLN47mv1lu7e6WC4CTvObFn22cYp6rppv8KmYPiYDW1rhNW7P+G+t9mRS81aKffIXYsfUis6Htu+P5mf2uxGIwkef9ITeJUUJIcKMBdJeSH/e+t5eox1lxmNF4ub4gzfWiOPzhz1Nd7HFrSEyz4w=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=Gg2/iT3cubrYF8n6mkhgcAWhojtcRxE
	+vTh6k04Mkys=; b=VfEKQr7Z7ZADNikZneRgXfPxaSmHw0b1O6+pZWD/Y9GyxRt
	VmUXydkoFnXlgJqmm4uSLgkeyRbXZmdQ1J69mpX1ED7v4mAk5b2HYD9BU0HUL9bD
	fp3TcYwVG8PqHVXVOnjupZsmhn/OBne1v0HxO86lDMF/AOuYy51EX2yxVQqnJGZX
	blmZCJsR4OITrtCNLQILMP7RSAHNmRpbhlGpt5lo4/fd0mlJD8thDjy8bqANdP/7
	IJr8+6OZRzjMdo/Qxgu8P5f4QoUQqiGgOlgZJ3OZ9nY96lF25ryjQioB8VPzR0S6
	xN2nVXvltj4fGea7U+f1Ka6in756P+ya+NYQWWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=Gg2/iT3cubrYF8n6mkhgcAWhojtcRxE+vTh6k04Mkys=; b=psbKJtmt1dU9
	P5bvmHeBVs0J+5QDqvH4abSyaUQT4kXtARIQePTuTHpJU8Zd92xaKrUF87f6JlBO
	KPw0e0xQOS3AFIBTVB1rpGRry26K0LGzT9NaM1URTxt/B/gj+5DAAac3QuCZDtIs
	gZb0Dfwka3xXy46cRUC7fOUcagvsdAAXxlHl5h+0SKMWCcROTyawb+fETCGv7/BS
	EYtziDc1W2p9bQ/Mhs9qv3DfRuTzil1udkfKkymvGqr611gcnpagUQtSMUZPa7wQ
	CyljXbdQhKbpuGgIKZ5LV/5eUNbRS0MhA3iAgU2I85KLkJhOO7Kwmp+EVP2Bee9s
	ZmKCgYWJEA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: USssxRwpuvYgUUSstxjHKA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 20 Nov 2026 09:58:50 -0800
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, jason.andryuk@amd.com,
        jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v1 05/28] x86/hvm: cleanup svm_create_vmcb()
Message-ID: <awCKWnL0U2UPc8YD@kraken>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-6-dmukhin@ford.com>
 <86bf2afd-45c2-46a4-b367-65c546b0af38@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86bf2afd-45c2-46a4-b367-65c546b0af38@citrix.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200071
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000009:EE_|EA2PR16MB5581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce3968b-e521-4ad8-8be5-08df472ff15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|261022105027099003|4143699003|56012099006|11063799006|261021135927099003|261021121427099003|261102123227099003|261026140227099003|261022075727099003|261028144727099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	WO+PARHua2XT+iHdCyCEMVWRjaClFjwkmacQyO9W8yNx4o/Fl48vVXsfhKAcuV44mfFsna/upTGMavg1rxWc/FPGuXK8J05xdgenvSorGHpr+QD8Ti+e6BCySh4okdpiHT4i2YNWS6yqb21J5Mgr0eQXE7S5K814z0DHg2/LawzdhZDTSKvJYZI/eNxch7Ou30KRSzRAXXgVEtYsUXs8Nb7Nn46WHwEevUFlKXSQXfe3x2gB3nZMDAjF8+mueBCEMOjfURLOnrRF2CIy0o8zuDaZL3v+/QOY1ZZvzLVCfkhmmFPQdzKUP7YL4YV1ueKN5hUHxTf/5yAmFsbO0HY1SBKebFWyc+LEfygEQgIVGfSDr2N01an1BDZYchm6VhYYRTrKhMkX7unwGzCX3yQ5xQI18MeviDllAwZ3pw51sSuPbqM5lGFaJflwjeKZAFOst7vmXH8exA6vWzdUzHFNMmey3AW7+NHjwI3zhygIQ3Urg3oq0pEfvxyHXVC3jA8FoZUK0Q6mqmMDbEu9O/5pfSQYGVmJNJ8Ya0Ix/2PBuiq9EIL+KeCu+3doQkJ/SRWychA/vN0FOMNxJ8GBli/CQDJ2LIvJNFKR5ZYixhj6yuciEVaNPo2gx42VNdx+zPgCiyTDcpbRhtNOFaNOdAYevh3Wq6qTLLp+mKK/WwEuJLEDTtdfRljXQOMKRx/AIMaidwl3i0iCLCLSdQfr4XIANg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(261022105027099003)(4143699003)(56012099006)(11063799006)(261021135927099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022075727099003)(261028144727099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9KWsJ9nBirv297+t64iBUtq4pd/vrNKPk4pPyHW+nCCL4C+D6tz74K458VWf5VbO/6fa/qP9kpAfxqudtNLXDzyNuriF+JNOzmqiOrfdohmjOScpK/dnMbeVM7Ycvmc9oug97zNy8eLww4QsYQ2Ib1qXd8xFxVkj6RKauCz2Rcd5sMgBnmVj89dDKBxtyp4KDOIKIDlsI1cRVfNi1ncHKtwJYaBeBOMZNBMRE1DSpiYej27299zFPn3HLdn0SUNbBdvMxWg2BPrhRZYAYpVFc2fbRAZWsmjQ2S9RmDFf79O8WI5EKyhZsociOtcK8LgEPCBHDWAoovmfl6orqy5REfcSXlMCqoyL3Is6iH0+8d5ymTPy0bzIsISLLUKtJO1tc0uA9hbKOZ45BjsZhHU0JfthpGmaga21Rsa0FYo8SXYHy/lZ+IMae+t8u6pXx0p8
X-Exchange-RoutingPolicyChecked:
	TFYVP3vSGghI48Cr1bD7mAA+SpJUcOZLHRuph/sAuprQOvsNwD5PyNERFz5Ff7FtnC5bDkYKb8/1qynrywj3jK0kuLLLDJVNhAOcXMtm8S6+FqsmDKCjRkep46P79Wl3taUwQfxzuFL3CRADkkNUd6+xLKMZjDOp/aqpZT4PWP2ZaO0rhAnz+7dpdqrfeHZzlNhCDytRl9GpQCs4yd20P/XAyVJKdJxXT8vxsoPivy0uRtGwhKSI1o9b0TCZMhFDhR2qnIHsFSH60ZMSkJEp8z5p7rTjJa5BcSBQjCbvtNTYAqaLPL4g9Zh0La+WZsF8vqrFc9VSP6slOZSlhkEe8Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pfhdd5LtiKrzhSJjte7jhSmP31usSXtsymL/t+v1E4ogwDvVXVPCHAWsQCHvQ7S3Lw7rnriijM+PQge4MAxw3SX7uhg3t0ELmKzhLtdIuXiS2bX0u4gNi5P32BxQpPs6v4Es4PIyHPa/6r31TZ9jClUtoTLgewdTKuulu5txhPB48lXf4qzDSsZG2xx3uDkFC6yKQoSxKSZUWOw9fkvOrabfX6aGUeOw8ymjmUtL68Rmfx1zx9LiCa8e1iTaDEuSmoFtYaDiaZ1KiqJyhyUjkcRIy9bHPxYxySRu7vkw8TwFt4rKbaEc5OLEa0VNERtmXPf2PvK9JV4aQhmXGN/xkc40w2xxsx350fVTTIenaNnqMJ+3IIe3h1SaIygkBh953gHH+NwzKqL5PbXjBadAQFjxvNOQD3moSLm09Vqz+QQX5UCZrikUy9ke2PuJlFNxcZMuPm4E49UxVHl8imlciybfitwPci12/PKOUCYy4RtNf5TW8fvDxJ184LXnKmOX+9NTvopZVwuMc4F2lhTJctNYB+T1hqnHwAsQvZ5uzhnfS0kKBjNllSKpnMvusqYBRcJUcGxt4E/wQknjK2SDmpkVZiyHH2b5oH8i5nXXHIUH7Fi4qeZxw4VetZ6tqWdNldA5UwHWkcdtgT7lZcMtMg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:58:54.5636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce3968b-e521-4ad8-8be5-08df472ff15f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	EA8PEPF00000009.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR16MB5581
X-Proofpoint-ORIG-GUID: C3m7j2DENyKIIw2H9oADauQrTsXDPFJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3MSBTYWx0ZWRfXyJ99bv/KN30S
 j76AzOebgJMRGFemnBiCWIHVmRQVC+cQjspmbW2kai18PTbx1FQFkxkXrfXQnxGcq3F8texymHw
 kNuaCJ6h3GZVbDG1QHHaDRiGgnO8IFPyVztcxkqu+JJCvL/NgXcGZzCa1wlnvLoD6RqzWY5clHf
 ALnnTB9O4pbJFAzq4Q53pcc6sy698oB6iLatT2pdfsBvzvSgCrWWrOV253vuV2WN84FR4EUohLv
 ObvRpPBRmkDthi5XVToDzOXnjpokUkNJGyoGTmv+Se6Ry6DAlJPh22mCgavuC1pYRvItNw6LD7d
 fWJhXYyhydHK7sM341gd4UkRMS0b0oKaY2w3XxwED14H5bDvZ1jLFm49a+zeMQQtxZRsxa0LjGZ
 nxk42bxUQOjmAJ4lNM9GulOBfYBgFxEKHIXnUZyoaSusxkEr+mpX8leywq7sTjdSLIl9HJUA0OU
 AQwvwZC2ymAFSS8V1Yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3MSBTYWx0ZWRfX3Zt5AF5jh+tQ
 Hyg24BWkcmsroLtr9w8FfYdKCyeSFmm26rXKQTN0j8ysE49QWtDzNfKJzCGvokDdrjQvxnb5Nw/
 PQ32pBitNovAcPZxa8AcmYhtzIklZMh1vqtoziNFn64tssvfBkiZ
X-Proofpoint-GUID: C3m7j2DENyKIIw2H9oADauQrTsXDPFJF
X-Authority-Analysis: v=2.4 cv=YaIodARf c=1 sm=1 tr=0 ts=6b008a62 cx=c_pps
 a=MMVmnpyRbxvAcRc6a9dgEg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22
 a=cbNQJ9GKAAAA:8 a=I2gG4V8NQoWs3D_sqi4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200071
X-purgate-ID: tlsNG-bad1c0/1795197541-BECDF034-2909EE4B/0/0
X-purgate-type: clean
X-purgate-size: 1982
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 06:05:18PM +0000, Andrew Cooper wrote:
> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > svm_create_vmcb() does not need to be idempotent because in case of
> > failure caller must call svm_destroy_vmcb().
> >
> > Simplify code in svm_create_vmcb() to account for that.
> 
> This is more complicated than it seems.
> 
> There are two paths which need to clean up a struct vcpu:
> 1) The domain_kill hypercall (i.e. clean destruction)
> 2) A failure within vcpu_create()
> 
> Nowadays, both vcpu and domain create() end up calling back into the
> relevant destroy paths.  This is some work I started a long time ago and
> never managed to finish.
> 
> We had a number of memory leaks because each init/create function was
> required to clean up after itself, and several did this incorrectly.  It
> was also wasteful because we had duplicated cleanup code.
> 
> At the moment, both vcpu_create() and hvm_vcpu_initialise() will call
> the relevant destruction path.
> 
> In the future, we want to remove all the create() error handling except
> from the top-level, because that removes the duplication.  However this
> is a large task and it's the common/arch boundary where it gets
> particularly hard to organise safely.
> 
> 
> Anyway.  We can take this patch with an adjusted commit message.  In
> particular, saying that the "caller must call ..." is a hope, rather
> than a clear statement that this is how the code behaves.  I suggest
> something like:
> 
> ---8<---
> svm_create_vmcb() does not need to do error handling itself because
> vcpu_create() handles this at the top level by calling vcpu_destroy().
> ---8<---

That sounds good to me!
Thanks!

> 
> But, if someone has some copious free time, it would be nicer if we
> could do this a little bit wider and make better progress towards
> removing the create() error handling.
> 
> ~Andrew
> 

