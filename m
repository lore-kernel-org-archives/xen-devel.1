Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44532C53200
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 00:20:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376855.1623322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpEUm-0000Sh-TZ; Thu, 30 Jul 2026 00:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376855.1623322; Thu, 30 Jul 2026 00:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpEUm-0000SZ-Or; Thu, 30 Jul 2026 00:19:32 +0000
Received: by outflank-mailman (input) for mailman id 1376855;
 Thu, 30 Jul 2026 00:19:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wpEUj-0000ST-HS
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 00:19:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpEUh-00BiD8-8n
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 02:19:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6a984e-5cb7-0a2a0a5109dd-0a2a4506948a-30
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 02:19:26 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6a988b-195a-0a2a45060019-94a38ff12cf0-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 02:19:24 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66TMgx1M3008687
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:19:23 -0700
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012045.outbound.protection.outlook.com
 [40.93.195.45])
 by m0482515.ppops.net (PPS) with ESMTPS id 4fqtjc8j8s-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:19:22 -0700 (PDT)
Received: from MW4PR04CA0363.namprd04.prod.outlook.com (2603:10b6:303:81::8)
 by BL3PR16MB4322.namprd16.prod.outlook.com (2603:10b6:208:33d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 00:19:20 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::19) by MW4PR04CA0363.outlook.office365.com
 (2603:10b6:303:81::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Thu,
 30 Jul 2026 00:19:19 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 00:19:18 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66TL7OIh1027609
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:19:18 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbk4nbfr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:19:17 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id pEUUw8TZGERZKpEUVwOsSj; Thu, 30 Jul 2026 00:19:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=sIEHNcXzFwhxwKUbaYsNjyDEF
	klQxVKPHFW+JOEsbd4=; b=YNEuuFZ4IiVpTk6RAidWQdCKMRXlDS5qBF0Izhh8q
	XeBw/k+St0CA2z17Jj2o/vXE0VGTcmx2wFMigbAFklnu0R+9eKRvhaYA036fYqVQ
	QFj2yBXlWh2KSudfshgpnhcNIf7gvxzXImOPTU6DLCcIdnaaGLVkrm+CI3o1m9I5
	ZsEemAaNQj7nKPKKRgH3G2U9yZdCHLHYo6V+RPhmaAXXWdDuctvP+BA+FH1ta7BR
	cMs2HOafi9xETxIWDZPuk+NuUkO4+g7OpEgAtdow0nBiMNCkzkTASqUvlr17Yx4I
	s8KfUyEyajuzSC3Yn4ttkZNOXoW07ZFqVIYnN5QVE/Bnw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2a1ExEmkt+MPP5dDVq4J1ZkPQtPANE8XO5Y4FrVQjaZxZ14X52uVuF4U2Jf8Roq03HVrOABSPpPq0J1kcSb7H39eCByCGo3hh3KRIB05jdqFrxDVezuQOpz2Q0gm8bVu3x6qRAugIiP4xBNKrYkejA1wAZNmQx9IAY/Komqzifs11RTXWOcBil6bLWq65sKLEoOqcAyrTPqtDPOuvaB3ZizxqUvAabWPI8mY3IYal+UvBhpiaJXCeSn2s2/j+G9o/Bx6VsKcfF3Drv+7BX6OWAM/MMmi5tu6nkHsoD73PIh1Kh7+VimEDgGMQd4fJWeOLmKDPLnni5YRhMmtRLUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIEHNcXzFwhxwKUbaYsNjyDEFklQxVKPHFW+JOEsbd4=;
 b=Wd7qLNoeuzfmkRI932coAzZY1QLBBjTVWhIQMefqJ4MHpH263FFWDZiLWHYBrQOomYepRMOFm7DSsKay7ULxM+zqdz1h2iwkogV0WVGypoCOWEaLtbaHVlwEJkc38JDkHKkqu4W1LonV6Lqx/5W91lLn9Dkbxs2vjAsWJ6qaPCAv7bgj4cLsDfBjOKcwqagFi3bHW9+ky2IdC7fyakNjPMJAb+zuOHreG57xg32lVzvXxL8MKW0TO/nq7B+a+yqv9Bf+Pl4hhAPJ43WJF3BnMldlAiKUo/OoEZGWUX4X7YRRApcuNNq7noC+9CMDcA2fPJFKTRS4N0j47puJCyNwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIEHNcXzFwhxwKUbaYsNjyDEFklQxVKPHFW+JOEsbd4=;
 b=dV/qa2VhxYpRxaj+Hsw+eJ/qO7iqTf499n7aVibe+YEGK9BCog03rMNchehKd/5/EeZpV7rIoU8foDv8YPP4QsSJI9o4Sd5wvW8R/BzYNvNSj8CTnG2mdVB8iLeIlfD5KZduZYxbOYTXsL94gFlf7SKjSvijhuU95e9TF4+OGB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=sIEHNcX
	zFwhxwKUbaYsNjyDEFklQxVKPHFW+JOEsbd4=; b=bMa0vfoeJYcCI6ipPZQpet7
	eC82xyAJkb+jnqxNq6dn7kfrkJvrhYzVpqQI1+P9QKQCcN168XUgR25Dboj59Bu+
	rYp1J+1QVmqrxmuTmdD1+fOB4yHphprCy+OLcBgPeH5XGAahXORXfDDWuuVfKhfX
	5OVMPNWILBg3gyWoPgTQwrawnvabgLH8aEbfFNXqScncLpBsSjJdEH6r9hUBhA52
	Vi4SegUecVAFFYTX9NMl4J88w6nbUbu8zv1m4JFcRGXWwZjB0qAwNZqvNKSQHaw5
	a62edBemfMBgtTOb+wppJRG00rmi2k5l+npjpF0LgM8oXzxtDrQijX107o4nKEw=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=sIEHNcXzFwhxwKUbaYsNjyDEFklQxVK
	PHFW+JOEsbd4=; b=CBwBwdGDm8QPHVwuTrI23+XgM6iSgStEL42kb5GBgv1kd+O
	TRqFlwcxwu5g0PFTyxMlSCAEYRGi1WYsyc6g/LmHxH69VwnoTIkIYbzqOlurWgqI
	5tXgdDuFH25K/XnOze4Xp3rPoA7ga1k44jST2n3mvD/U3xfb4piLYus1PM/CaZFM
	AR/mOGiNzywJwSyIsQpJMlNH6p3H2pQb5bhxRvpVNIWjocFbunOZDAmuidpdMXon
	jsns0lbqS1JboFMaop0d3wdi9GTGgtiDIrJD0X1uA4z6ABVdzTtQazOomUziIOdv
	UgXE1ajdcgoh7EhoFLlYZM5ySVlTLzIoXasfZ1Q==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: pEUUw8TZGERZKpEUVwOsSj
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] acpi: reboot: log reset parameters
Date: Wed, 29 Jul 2026 17:18:55 -0700
Message-ID: <20260730001854.905354-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300001
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|BL3PR16MB4322:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d43fad1e-4aba-455d-ffd3-08deedd0324d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|56012099006|11063799006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	sZSjB3kgJgAyeihzeVN9xlDXRluuM0do7WKvPQalAqiUyXlgiqIEjRfzaAZtBKGcFg93WkSkcdE+HHCzQcjekVRPceCPZ7fOKQ/SfAapDwWvNrrOjBnVODETKvGfLL11TC7tcQGeqqQVZFY44p/MQ7Xo5YSxH2BXUgtMnW9hYZaqWbQOsSikwpAHcGrjg4BEyThevirgcFuz1ZlgV3lSjZJR8h9MB/qexWRJQrOgPVldpUdIsBqLFWxnByQ1z3MSWfsUQCOgvP6bZYy/BjmuHRFL/Q52Hp6EDAz5hCe/a3ebQITpWFBTjj9MCWKAS2xZDk8N6alod2/Wn4LJn9TEBGXb4AkU920MYqA9obt3HO6/04/eA8Zh6qzVPDuk2YR3eD+KZe9Kgyv6kGXXpTx2V7Ddau34+AVs5XYQKiV7ut5K78lKeoqKuXYJrCZhrHrxXrJp3VR2EqJANXoN/9gUonEVE/q0e3cHrcg4cRGxSgfNLv3LvoaSUXc066nV6ko1rhgsOSF717xNPBw5dkk7s3gpsfqmL65F2fdqxRhXp/yPsCT9rgnYRUmZxmX8bIWsGWf6JqD2wywxBpCR+Ih58MQKrbFdq7lMhUELNEaKp4QK7QutmK2EyZuR2tQYBHQfvSUm8GtsrToZmedhm/V05Oyg/UY6t+8bvv2QNsPEPbcw8pYywU8fX+rNJSc3xCXDEI+YCVRdF9+BUBGtPV8SoA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pXE+WOXH1/MKJXcSHN5SVjKKraLNtQPQr4vF+aKoDV82TH/6ToO8DZFKDd1IjEvCOoqN5baaehl1JDJnXViude5QJl4Rws05lJOx1h+ymJJfZDH1ZNCQPmoSvV4lZUIq5fsz0KynEOa/xCJEqVncLtmfiVEKvJuqWxZhPPL1wRjA67ER5gR4eCg3NEoCxZp8vTWDjNkvYM+ZkfhtiLN051701ckQYVzkYYoi9lD1KESECcXgA4V3+Kvog4rNvynWFozwKI17wJhIdekJLSGBc8pODalWIh3U5o8e34HCy3eiYUJ1UMCM/gAexSrPyk+ucEMVkWu53l3l33HqIfbxJLX2S6W2/LQg87nzZwiJkPtIUDKUOK+Mp1fSIwcqAdNzYYC6dhGx7h3AnyW176nkxEjYZzVChjdTOQ3BUpgfoiD4LWRRHjfrVneByy9NzBZ9
X-Exchange-RoutingPolicyChecked:
	lj008iIqe7Yvv8e3yhVPh/o1PiTzWu0u6FRr0TrG3wsLqO2IGI4jqvdsVG6808jJFAO4srynztqCne52dB9kpMl96BGn5XU4Tzr7bGRGvTq3livwxxxG2O4NXj0b9oNPjpSnR1XrFRFFAL9XQ6FQ+HMwBHguhzuLYM31DkD9VHGsGUG9RyKsnqBvrvy2h2lug2Txc7SUuTqUYIof+vZWeeJ3ITrLTW4tGVqwJnNV85yNLfoFVOonEafwpl77w8fVL+O0utAj7s2QWOrYkkEiVM4gET+6XT9f6OggjBbZwgeqaTh05WYwLIRBTGptTu7Vm6RUglNoeS7gmN4WL2+5pQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/DTA/um0lT0cFD84KW3MFR+jNtEe8swHnyDnf3fQnrK833w8VSMZxbW1fcYKm5AyoPL4LJ6aB6Y15Y2DfxoqXXbz5USUstgJX7TAxf+eMxxXZBo5wDe/YKjTJmCUT3mCYiMPKvj5NRd1nPHNyKNoXjaer0tmIt5cSAKdLQorpHwOFOcA9y9duaxqZU9raISqIXQxmnvkro/wbkFAO9kDzY7mhhb/NoVynHuNcHnP/rUKpnWyYtTe+25EthEtmVgfF7JWCklHIUwUH8YUztaRgp/YPHMfeFVqd4gy75ajpRVYG96GbS5SnGgIIL32DuYTwSB0TqmsptGo1ZvcXGwo9/NnWi5bAfCoJ/0fg0WOmlu9RqwRvYb3kVuhn5wDx8EYcMSefDvTCFurpWh7edpS3+aBAV1Ox/vN6mWPQ7EeDkjskf8ckQffH7Xzk0PqHO82PuvPnzZ+cM/sZ8PCeQ7FNeT2AnImgML0hTDPw1/shERFS8Ldx3MiRi6Z2IipPul/tHJqBQogmpOOWGK9oqZeA1RGRt5/3Bdb9zRRGyFWX0T8Jw9QXF1rHF2R7V5qoGlpUkddQhUViVzQcyex8CHYxwsj4oM12v/kbKB9GG8WFK7wE2Nj0GdmxbxV+D+vzuvur+gzvT4bEd4cl4rb/SWyVg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 00:19:18.4819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43fad1e-4aba-455d-ffd3-08deedd0324d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR16MB4322
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwMCBTYWx0ZWRfX5DdMwe1bGScn
 YE8wkiu6e13jL1TQ42odtO8LomBTPV+6YsJEGgahe7o6dW9y+sI+pqlE7d1I58SkNGXtpJnZy7A
 6L+75nyiM5y6uyDq+KG7vrVF91lquwi8xqUaPbRq6LPbO6z0zoUTn91cL4FmkTXaVF2I/bzTgLm
 mZl0sAoyCUUhXoQC8uS8s6VD7Xm5TnwjGpuvyKriNQAohm3fj+JO5NvHmCiFIPhLPxGl8SCfe6z
 j3+GO8czzbSusPk7mIr3oqszBKKzeXthjwlFt8qjayoCEZ3GVXDJR98pkKt5AVN+/cr0q/dk9ZU
 RSrbKK+4tNUYMdFIiMVoX6MMv+r9Q3I2Wx4mHTKNguTF365IctdhI6hFWZ/f8KCRmGTIH7rHiGZ
 GtNDyi/DkS2QaYb38vMX0RHQ6DwcUZYQ1xvjmSZYdHOGB7VYPzbEjmEfl3aUEKYdhOM/yx/+uOi
 0JOwJ8PAhKUXtuD7LKg==
X-Proofpoint-GUID: yYYiySk05OdWqPFRlENa0VPBXAescp0d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwMCBTYWx0ZWRfX+2yl/1OJz4ud
 unFffaip0xpN/kxiegfzOsp7aP1aRpJdyeOx3dSQvl66W0NANzrXRQIiZsNwcN4nWcGstM6W3+B
 G5fPaj2k7ZGVeOUNKggTJ8YXiF6416RUPfgmE4jdHoADwiT2j204
X-Proofpoint-ORIG-GUID: yYYiySk05OdWqPFRlENa0VPBXAescp0d
X-Authority-Analysis: v=2.4 cv=CMAamxrD c=1 sm=1 tr=0 ts=6a6a988a cx=c_pps
 a=E0//De2tebslxPhFmdrqCw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=qFihuJ6Vptisz9_4wjwA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300000
X-purgate-ID: tlsNG-16d1c6/1785370766-F5C0F77B-FE54BF16/0/0
X-purgate-type: clean
X-purgate-size: 2078

From: Denis Mukhin <dmukhin@ford.com> 

Xen does not provide much details for system reset debugging in case
system reset happens via ACPI subsystem.

Log reset I/O address and reset value.

While here, fix the missing default case, guard it with
ASSERT_UNREACHABLE() and drop full stops in the loglines.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2716843348 
---
 xen/drivers/acpi/reboot.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/acpi/reboot.c b/xen/drivers/acpi/reboot.c
index f6345be8749f..3b0437395674 100644
--- a/xen/drivers/acpi/reboot.c
+++ b/xen/drivers/acpi/reboot.c
@@ -6,6 +6,7 @@ void acpi_reboot(void)
 {
 	struct acpi_generic_address *rr;
 	u8 reset_value;
+	pci_sbdf_t sbdf;
 
 	rr = &acpi_gbl_FADT.reset_register;
 
@@ -21,17 +22,24 @@ void acpi_reboot(void)
 	 * on a device on bus 0. */
 	switch (rr->space_id) {
 	case ACPI_ADR_SPACE_PCI_CONFIG:
-		printk("Resetting with ACPI PCI RESET_REG.\n");
+		sbdf = PCI_SBDF(0, 0, rr->address >> 32, rr->address >> 16);
+		printk("Resetting with ACPI PCI %pp RESET_REG at 0x%"PRIx64" (0x%x)\n",
+			&sbdf, rr->address & 0xffu, reset_value);
 		/* Write the value that resets us. */
-		pci_conf_write8(PCI_SBDF(0, 0, rr->address >> 32,
-					 rr->address >> 16),
-				(rr->address & 255),
-				reset_value);
+		pci_conf_write8(sbdf, rr->address & 0xffu, reset_value);
 		break;
 	case ACPI_ADR_SPACE_SYSTEM_MEMORY:
-	case ACPI_ADR_SPACE_SYSTEM_IO:
-		printk("Resetting with ACPI MEMORY or I/O RESET_REG.\n");
+		printk("Resetting with ACPI MEMORY at 0x%"PRIx64" (0x%x)\n",
+			rr->address, reset_value);
 		acpi_hw_low_level_write(8, reset_value, rr);
 		break;
+	case ACPI_ADR_SPACE_SYSTEM_IO:
+		printk("Resetting with I/O RESET_REG at 0x%"PRIx64" (0x%x)\n",
+			rr->address, reset_value);
+		acpi_hw_low_level_write(8, reset_value, rr);
+		break;
+	default:
+		ASSERT_UNREACHABLE();
+		break;
 	}
 }
-- 
2.54.0


