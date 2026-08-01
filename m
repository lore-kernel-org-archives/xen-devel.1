Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE8EC55171
	for <xen-devel@archiver.kernel.org>; Sat,  1 Aug 2026 03:22:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379799.1624211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wq0I5-00054d-EL; Sat, 01 Aug 2026 03:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379799.1624211; Sat, 01 Aug 2026 03:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wq0I5-00054W-Aq; Sat, 01 Aug 2026 03:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1379799;
 Sat, 01 Aug 2026 03:21:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wq0I3-00054Q-9y
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 03:21:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wq0I0-000uL9-3s
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 05:21:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6d65b6-5cb7-0a2a0a5109dd-0a2a4503b7d6-30
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 05:21:32 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a6d6637-fae8-0a2a45030019-94a38ff1754c-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 05:21:28 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66VLw8RS2091199
 for <xen-devel@lists.xenproject.org>; Sat, 1 Aug 2026 03:21:27 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fs2jn9yfv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 03:21:26 +0000 (GMT)
Received: from SJ0PR03CA0275.namprd03.prod.outlook.com (2603:10b6:a03:39e::10)
 by PH0PR16MB4782.namprd16.prod.outlook.com (2603:10b6:510:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Sat, 1 Aug
 2026 03:21:20 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::67) by SJ0PR03CA0275.outlook.office365.com
 (2603:10b6:a03:39e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Sat, 1
 Aug 2026 03:21:20 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Sat, 1 Aug 2026 03:21:19 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6713C6XZ3235982
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 23:21:18 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fs8pg80bv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 23:21:18 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id q0HkwQP2q1Fglq0Hlw8Pe8; Sat, 01 Aug 2026 03:21:18 +0000
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
	:mime-version:subject:to; s=ppford; bh=nrHVQBAOvOe4C0Nray242Rigc
	P7NARuM6TjGSPzA8es=; b=uABiRfb9JIwVr1pAabS0UeLxee6O2exoGE48yprwl
	HnRl1QoKhtYFym6V/rQy5zLtbPR2RdGalujEfAc25j/SuQdsAJs5VZq1u/Qdgopk
	qWC1/xkdHtEp0fc/0u+4RNf7ZNbi4zqAQjQlY8Cwp6L0CXFDJf3Vot3Ao0LIbtJi
	+MvyilWS7GO3rRogHu9WeHbpYlx24/5LrDR7QxAe9IS8o4VT+eZkjr/XGu74rktq
	P5XfguTjQgmR0Fx4+7nGt7CL2Yn+90VtXIr55WlKgggRPs9awPVhbDOeWveTRezX
	smChVQZyG/uXiGIbtFkwcRNMVW03bVJMp3ojJQ6ca7FbQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKNrmUDWnHWZWY1i0KjLBXn7dAZpWbL815JlQaaAWjU2Bphph7GgqNvyk/PhE5ranw3Mdae+ouvvSuURwDaBlY6XgBd+HWfE0wkA8j6KiIElxmHBqNS0IkdhSCvsZel1Lk+H36NgPo503vNn9g/zuN53R1uYp4+8+L4snbbc3s/oEaMQDs4JOPM4bkCs5Dfzap0AwWrzvz+CudbIaR/ZC83a0YXFl2y6bR09ADvXh/Db2I0wDNBCpPBLkzocwonSNUAISw21ZUtoMgdKUkL36xb4uTtLLKA6iojd0bpoLuZPIleKlxudtv1/SqgfX4Hkq+5h/BsmiIriYzxyzekDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrHVQBAOvOe4C0Nray242RigcP7NARuM6TjGSPzA8es=;
 b=oHPXv3Az1goPHoM8LrJizYDOOobRa6XT7AruZ106zkSbk0CRp9nH68piXBO+p0RTzwaDBCwxmc5maeLiUFu/fa7CgFHUJxKvxBhbieKj4+VvJcec+hW7hc9jPCYiJs4XBzM0K9d/Xx+FsQ3IMCAM720z+0ZGxuMrxaiqF7iQVeGkahB3soR9+5WQAfllLlef2HYvKglSejUZSeCatVqK81Z72zG3vbzvGENGPuxCmQXk7m8i/TgX38BMflbDjzo2UC1MWt0t5rrbWmZvtXYrJ0NZi86hb0IPZcPHci4qTr00I5IyRLA3MuJegdnzYU1vHeDMJeaMYx0WuvywcX7U/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrHVQBAOvOe4C0Nray242RigcP7NARuM6TjGSPzA8es=;
 b=fKQb1gWqG2S9r+wsv8swqaBMOL/dHOA/Tcy2Fgm12+GOK0zqYW0YM4mR1Xkh52GI6f2F/sHX/FAj0/PdMNeV3ZZ0RerrJhAqHEJc4oQZbqdNGogm3hswf7iK+Vn2EApXzCTi0pmmFTzGfL0rE9mhDhNnVuq17jEYCxqH/rcbnTI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=nrHVQBA
	OvOe4C0Nray242RigcP7NARuM6TjGSPzA8es=; b=QXa/gMgulDaXr4eEI75f+ym
	cSxjQN2MhBM3RQ4y9ZBmzpKweOCX+4459FKvoCCrG1MQtbO98sEVJVKCdpXQg/tn
	m1B+uqEbGcTV3R0c9QwpZRh6GKp3pGLLhaOtkLUlWFzn8g2kwf2Q/q6TqHoVWM9h
	oxjno9aHfA/XHoKBqsEHcHYMAovNyEEJlY273zyfV+fnErJmP36DQcu7u0lWAjJN
	9YTducqBnPZOF6unOk7vKxuiSkKVpMyjxzwIDXLQsFbOWSWj8uw9iowsTMRASA65
	kKHhap1llF3Wj6Jufduw4XjdCXd/5lDveRTKH7vba9t3LD4oDEpHXe59hhtlO1g=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=nrHVQBAOvOe4C0Nray242RigcP7NARu
	M6TjGSPzA8es=; b=NQgAzBjKWopmvc8JxNdwdtbC+ZSaYrw2aju79mcVh4nuNg4
	oHsKUy0zHP9KHant0JnxRjL+gdHIR7/Aiwg5JbskBNA/xuMn/o7pxwO6kZMBmmnn
	HxwL0iheVFMPoeQUlO9xl7J5mvJbBqbpEHPxdDjYm325WLyVM6VzEphOb6F6SIZy
	L325SdabhttyEpXcu+9zv9JzUvutui/ygHROEb0XvLGreGNH6KF4eqFQjmsa/yA2
	BJ1g4eV90QCyfDYYq26ggM3JO25CqTejknrz1yusWM5nXZJAnnFylO2ckZJS2GVk
	2gkaShuQs6Ur3bM87NjSeUI6eMWkE+sIvfDWIzA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: q0HkwQP2q1Fglq0Hlw8Pe8
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] acpi: reboot: log reset parameters
Date: Fri, 31 Jul 2026 20:17:39 -0700
Message-ID: <20260801031737.344756-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010018
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|PH0PR16MB4782:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33f6b6e5-277b-471a-8af7-08deef7bf49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	qvu/pqhS2hy2e4uK3sTgFYnuHcN0WuE/iUoFY7wnLjtHV7lds8kuK7Bvzz7C62LLNtqD9+egSBMnVAoHynoAIN5TXq4Muq3Lv3N7QNqDUH66xKiiOW6G1U1TEIQTP+65asGOoOo9QgRnBdPVplebEFt1Y1s+lRu+AyntcXW6KSiW211RlQHeNpazJz1q70e+NNn/z5/uA7bS8iBjVlamaTIsOGH+UX9733jD2tbqCQleRKhnWUJ9GoY/tqyCWETRldELVNVlzLgXEBPoHotjsM41wEj6+3KMgdxP72e1+WndwviNYrCiuGsOF4cp2EPKlgS1wvqzkGNg29PVQaF0g2izIDqMcAZ8KwFSuRO86M1Bu+ROeyLKN829o8D/n2Hoikp/BcqGHAvsj06JAtK7TfCeX/EpkbNMJMLjq/dmANrOa2v46eVgccgUj1UrpbNj6XVSQdZ84z3A746CiGV7JT3/hrNBbQe5D99f/rS/ouOjQlGS80KZclHmkFloPE3N88Ra4DsfMVf09BixmSM+NdV8ZrRlLybEtMxrmPAZRJHV8tSrAm3F8E53xdkPKq/QZv+WJ1PJ3i7rxfmAI4hp6E9GKgATX8flDgnhwWXRWuXlyt9qxsNJL93+k9mZsVAZvSEVUSF5MMOPpI6i7y+32lc/69Yr/owaP1+iKMNcprXksbgmtUIjKk+g7usEkYRQrnTyOuIBnLd529JAAuutMQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/sQyepu2/mDB9xWS/B/6Fj/Cep1DZS5IKomMSnUJbc6SOvYC6de3fu8esqafp3z5xN4SRhuCdDn0SjjFhdkgLbo/VyDnTlw4gYJkpwS3F0JmPLrrP7IVcZYVGgxKqzch0SrT99kf2TUeRasyDDpyce9LVe9v4rYQCVoAkaWSg6X0KadwxZlHm52QAv5sGrTf7G/ns2B2s2m6zrR9Omr5aja8ivz4ajoJ+d1Gm+F/hrbznFCXzQ4RU3CpyY76KpiZHsbbVwYpY2s9HBKoDVUkfdE8+Y+vRTdzMBPHaRBoD94q7XVgW5bQ2HR4TUBC8x+dAUu2sxlPRlwTC/sEQUKeR3uz2QuPhJ6hlUIiS25Kg0uCaBsI54uyqq3syypgF7Wz/s/rl4Wk4IN8PctZE8YBsSTdPBEQ7Xd+s7zrmeCWe5rJa4ysL65kd4UauUU06tGP
X-Exchange-RoutingPolicyChecked:
	DNiIyGVjEqRPhVA9RQaBYILh7s4oufPpsmc86GUjybemmsKUUEDnXhPH8u3U3WhFxrXJ7TShgoFNlALQho/Ek2XsqoRG/sAux9QiixsySp9pCc8j6ZaRgw3MS9IlerPxuSzrRz8+rANBZuULt1NvMtcdm0C9TfXGBIMNP1WsldjRi7U4KClfnzhsT7+04F8DPTHWdr1jin5noWY1bNd+bhzyHIwXiSnm+qq0t/pjwz1Mdoce5WyS0mj+V5pIx8f9tY0sNwzrK62jsM1kOZBKfoLzz+8msblv9sb5Sc7VkuRc4yQyB1+eU05UqzHkySRDP7nIpvDo5XgeK2PeJ0JQUA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LPE6jDTwxRcWrqX9PavanlZWmCQB1gHgnMQUENITdTipweBo0a+UzEF/ZPYTHwOsb6tyNGUrnKDACwsQFenGYL8869cQu1sjZnQt9hCoJEAe1v06Qky2gZ69ViWFsiCBwnSmPf85/uOWErlTWqYifmDBVSkaDDdh2TCrZgoipnbzVYMEv6vlUMULkHKeNgCrJxzXoiqTVOIWWzap4R8J/8RMD79mY33jWV+PAXfSR81FkU9QuEIMsdVOUUHjmpihDvg60n/LPjpXF9RGOeT7/hVAQT2V+pohhl4H6QCNUruH0y3+qF2JKik98X45CItLmKyU7VX+PUR1GkMLdfO1Fxw9azGLMbvUzWP5TlHyDgMP3TbsnOQ8MSsBnkqCE7MoILnQAfU+JcwDQJUDjp3Sz0UHBSOASTHeGl7kQSDuFdnHijEyHi6cANJiPOGSbXmgPViypqfzZLDxPqBioSolZe9upfmmeffQVri7638bpBIOgnXHIe83iA3j6eviGirsotTfWoubCcNw7hd/ZHW+LRUfPi/EafQd5DeIjRcB7mA9FBBAoo7DuzTSGSoSEaEZnWFGUGs5cQWUTGP3/GgvnVU0E24v1zA2n/benHj81Ygcu++sCt3MsdnBnjd/LMcI
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 03:21:19.4573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f6b6e5-277b-471a-8af7-08deef7bf49e
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4782
X-Authority-Analysis: v=2.4 cv=JKELdcKb c=1 sm=1 tr=0 ts=6a6d6636 cx=c_pps
 a=AgKHDJP192gAOy1PpHj/Qg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=g95BRj5zbggsEhE0B_YA:9
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAxOCBTYWx0ZWRfXy3WZPTpyA8e4
 j2uy1w2Wtuw1UsVDMePp4gSNiJfUjXdT3ZW73Txw2EdkXt+XGXxq1soymtEBFXcrZ/t9FasS2Wr
 0Spw2YYqD1Z5pxTKUsPt57L+RMSLUPQHA7jzECtZKa4rdPIqFl/T
X-Proofpoint-GUID: HBOzySsYY6Ko4OLg-HpNQ99jWO0CiZ6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAxOCBTYWx0ZWRfX2xf5fNI4rdu3
 8NNTu0b3BOofrFJorjh7c1Y+5jaBJm7EMgI0xaSXQWdv5QuVauQOOqoSnG6AX/HRKicc8Xs+J12
 ZNktjbci6F05Q1XrFtwiMSmlsv2i/nVU4ixCnXSzHBPaDD0IFQNcvu8adKmobq6HfPk4MBHiiJm
 aUXB4I4R8OUE+poH8oaabnpqa7a5ASw73yWyei2uRTH71JtvsqvZG4s2K4nE9AEfsFheliQdxiU
 tLwmnX+yjHKi5+JC3bX7qJndtU8Ybcpc2srw77ILTrZuSlkNH4otgsMbGcLPAAXVWXoYWNhFioF
 uHE7hfxA7G/8DvF6pxTssW8iqVxOmMeM+Cmk20Gv56083iytIfvblC3Ed7DdyOzL82/RuGk+vPI
 1WsRqYxailJNw0/9axn5MyntrMYAwtkrMw9dONFdfS8to80Ij5I1PzIhYOzrxlSmZSBB5xDDiO/
 xzcZO31w2gXv/k9bsqA==
X-Proofpoint-ORIG-GUID: HBOzySsYY6Ko4OLg-HpNQ99jWO0CiZ6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010018
X-purgate-ID: tlsNG-33051d/1785554488-6D4D74E9-B2CCC98C/0/0
X-purgate-type: clean
X-purgate-size: 2418

From: Denis Mukhin <dmukhin@ford.com> 

Xen does not provide much details for system reset debugging in case
system reset happens via ACPI subsystem.

Log reset I/O address and reset value.

While here, add the missing default case, add breaks between case
statements and drop full stops in the loglines.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
- v1: https://lore.kernel.org/xen-devel/20260730001854.905354-2-dmukhin@ford.com/ 
- CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2723268852

Changes since v1:
- removed wrong ASSERT_UNREACHABLE()
- switched formatting to %#x
- fixed indentation
---
 xen/drivers/acpi/reboot.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/acpi/reboot.c b/xen/drivers/acpi/reboot.c
index f6345be8749f..dc5671f9b42a 100644
--- a/xen/drivers/acpi/reboot.c
+++ b/xen/drivers/acpi/reboot.c
@@ -6,6 +6,7 @@ void acpi_reboot(void)
 {
 	struct acpi_generic_address *rr;
 	u8 reset_value;
+	pci_sbdf_t sbdf;
 
 	rr = &acpi_gbl_FADT.reset_register;
 
@@ -21,17 +22,30 @@ void acpi_reboot(void)
 	 * on a device on bus 0. */
 	switch (rr->space_id) {
 	case ACPI_ADR_SPACE_PCI_CONFIG:
-		printk("Resetting with ACPI PCI RESET_REG.\n");
+		sbdf = PCI_SBDF(0, 0, rr->address >> 32, rr->address >> 16);
+		printk("Resetting with ACPI PCI %pp RESET_REG at %#lx (%#x)\n",
+		       &sbdf, rr->address & 0xff, reset_value);
 		/* Write the value that resets us. */
-		pci_conf_write8(PCI_SBDF(0, 0, rr->address >> 32,
-					 rr->address >> 16),
-				(rr->address & 255),
-				reset_value);
+		pci_conf_write8(sbdf, rr->address & 0xff, reset_value);
 		break;
+
 	case ACPI_ADR_SPACE_SYSTEM_MEMORY:
-	case ACPI_ADR_SPACE_SYSTEM_IO:
-		printk("Resetting with ACPI MEMORY or I/O RESET_REG.\n");
+		printk("Resetting with ACPI MEMORY at %#lx (%#x)\n",
+		       rr->address, reset_value);
 		acpi_hw_low_level_write(8, reset_value, rr);
 		break;
+
+	case ACPI_ADR_SPACE_SYSTEM_IO:
+		printk("Resetting with I/O RESET_REG at %#lx (%#x)\n",
+		       rr->address, reset_value);
+		acpi_hw_low_level_write(8, reset_value, rr);
+		break;
+
+	default:
+		/* Fallback to alternative reboot methods */
+		printk(XENLOG_WARNING
+		       "Resetting with ACPI method failed: bad ADR %#x\n",
+		       rr->space_id);
+		break;
 	}
 }
-- 
2.54.0


