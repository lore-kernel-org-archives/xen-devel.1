Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28093C982D8
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 21:24:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425901.1649590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7g3P-0006fh-Iy; Fri, 18 Sep 2026 21:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425901.1649590; Fri, 18 Sep 2026 21:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7g3P-0006fa-G8; Fri, 18 Sep 2026 21:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1425901;
 Fri, 18 Sep 2026 21:23:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jan.setjeeilers@oracle.com>) id 1x7g3M-0006fU-Vq
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 21:23:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7g3M-000LVx-Cb
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 23:23:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jan.setjeeilers@oracle.com>)
 id 6aadab98-8faa-0a2a0a5109dd-0a2a4509a87a-8
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 23:23:28 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jan.setjeeilers@oracle.com>)
 id 6aadabce-be1a-0a2a45090019-cddca5208dfc-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 23:23:27 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IKlCgQ166503; Fri, 18 Sep 2026 21:23:15 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmwn9ac06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2026 21:23:14 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 68ILJqMW029893; Fri, 18 Sep 2026 21:23:13 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4gmw6gu76p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2026 21:23:13 +0000 (GMT)
Received: from SA3PR10MB7041.namprd10.prod.outlook.com (2603:10b6:806:320::18)
 by DS0PR10MB6174.namprd10.prod.outlook.com (2603:10b6:8:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Fri, 18 Sep
 2026 21:23:10 +0000
Received: from SA3PR10MB7041.namprd10.prod.outlook.com
 ([fe80::e593:4c8b:434c:76d6]) by SA3PR10MB7041.namprd10.prod.outlook.com
 ([fe80::e593:4c8b:434c:76d6%6]) with mapi id 15.21.0428.004; Fri, 18 Sep 2026
 21:23:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0SM+epRE0CJpSQ6kUZJcVL3gxlMNc0Dr5pLnjM53r7c=; b=
	VpY6v+iUL/cAcLSBGlNywBS9VocbyBlLv05lnqHgxEMWdWn1DJFcAaXdbg1RFmlx
	nbLA0RtfQGm9/4nW+JZezz6XrV5JMp63ggYGWNrA/NQfi7ZqRAuMpBUdbalUmQX4
	S+E+oX3aRM8z/I8oSDBSikyt6aCTcyYLP5OsZPuTJOvrIXso24IYFtWPBT7j8Qbv
	CD16LMkb95xknOsYF86+tFsgsuLQRNDJa9AO6k1z0+0T1bBOFCl4ZTtsj0OASWGE
	wRC284C8CnwkF2qXEaiUmJLngFoeFd2PJSyfo6CJxR88twn7AIu2mw7QJaIGlOBu
	2DAA+p8iAdgvl66zLDU9Mw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZd1v+6YjK39LILPJ6yPbER9wmSkJFDo8D4wxwc8GCFTJFbbGKZIIjNrRg6KZPaPEb5JSMRJ2VRr7QXpS+wvA2d+oEarNOK8sAF02cojEUzPYAm3vQzZFAuSejn879WJV/Gvlvf0wrqrvFKFZPqthhBx+GglHmhcQSRcrFZheL+3bLxtnlzZk1eiNkr8MdUGgU1ULiK/Meqrm7iLmr3/SvIaer9RFLFSuPMdOSV2E0Uu5uNFEpE1opb6gwp9gNzf6MERInXvflmTMMIYAeWLliMDGKBJJxwHrxXu1ePytSTDnWtuhvk6K0lsPzkX5LR0CdwHxpvOIwtW0CaY2G28nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SM+epRE0CJpSQ6kUZJcVL3gxlMNc0Dr5pLnjM53r7c=;
 b=n5uAzU169Oz2oWdijDnHNuj7TReBk2RoEY6MjU49QrtTGeANInyDaUNuPcL7lkM04vaIhyRfepnq0ijujeljEGb11bJgvVuONzwfinE034BqxQLaRKbHE6Hx86RKTRvp8kO/n0/b2UUdFGk/LldLmPueBH6EdReY5Nb5msri8S0CT8JN6P2ei5VnQH9WOlqOl2fzPyxCHVLvF6ko5cG7q6G42iKLwle7ZQsgxVNFY8U34+DL373vGuRliyffIoCc14lWVmSIxQ9W4oHyUIWnNNuuh2U4HHn8TuXm+jsgSiUejb99bhitFmfMAsJiYC+9Hqj4RYQ8Vr13QwIAlTtoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SM+epRE0CJpSQ6kUZJcVL3gxlMNc0Dr5pLnjM53r7c=;
 b=BuQIY7lerBpPnA6o+ZSfVq0oHHtQ7bOKk7wGxr0zW0ARznJ9R3Pu48ysn4sK9WWkMiHdNEEItZO9Sk/4ID+rBgiPXyzr6mNoBYB4xBVMXWq5hmHsxq1yWEneUYWuXydgw70rio/Vy34jH3bLBNCBsbHDtrTLHeiF0Y2Rk6hNsfI=
Message-ID: <1da5f563-9fb3-4043-b13e-fa7a4f390911@oracle.com>
Date: Fri, 18 Sep 2026 14:23:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] static-memory: allow skipping the cache flush
To: "Grall, Julien" <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
 <d071b84a-2c92-4ef8-acde-c0419e259017@xen.org>
Content-Language: en-US
From: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Autocrypt: addr=Jan.SetjeEilers@oracle.com; keydata=
 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
In-Reply-To: <d071b84a-2c92-4ef8-acde-c0419e259017@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::13) To SA3PR10MB7041.namprd10.prod.outlook.com
 (2603:10b6:806:320::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR10MB7041:EE_|DS0PR10MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: e3025e6f-ae2d-4cdb-3e69-08df15cb0a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|376014|10067099003|4143699003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	uPFudcZS88ljvDzZFHhA99ucJ/i2mC4OFUoTpGG0+gGajRX/ABToSfWYMLGyWy2hzzjgiGYfa4cOaWldnyB+YZpOoSjUgMAciC+7MYlC2gRnQGuE4QtwV072PAWVImbDH/W8AkSNGp9XlYCXEDelVz/X/edIfhYIPX++lB1uHZo14TIK/aWRc3ecjY96V6yvaEFCgDACoK9WLdKG7y6Y0yX4RId7ChLo/xcZuXKR/G1XKHpWXz6erMyPp8utyijo1KeJwqL3L3fJ53CJSEV59P0WpYuI7Q5ei1FCz6MMcMewylhs5gM9e3bUfp/4NHoGBjGe9wzlMUs/qiK6CHDW10bj4ldh6MrbP+BgnhNakNpNSrEzfiN4pHcxiB9/Gqc8D/2PK5ntz73hf6CUjFGReqcW9bj//ewa6H8358ozozH4ykd4VcEhcStP36m2xQrqFclVh3oadWNMmo7DyotYsUnP1FAHbgQrN/zXMIYf6DKlnAg3wQFfe7MDDCxsdLA801i7vQVOr42d6b+X9x3ebU200aK6K2eNvfhWZPx6vxz5fQzgEdO0rdZhR11o4x2mD+asY81JK/tG8MW0Pm+rGbSaCSIZkdu1icxPVh0LJG1J/uitmaBmgVuqYiczz+lq/6Ln8pUI8ScBaGtoiYRzqiuSJq5wa9Uee5UaosW+kug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR10MB7041.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(376014)(10067099003)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU9La2laSUdCemx4YlBMV3lNOXNKcjViblFWM1c4UlZKckRWYkpybTA0a1hO?=
 =?utf-8?B?cGRyaTBWOGp5QWRydWdQUlZPYXZCWjlMazFNeE40RGZsc2lPcWhwTW5naG1j?=
 =?utf-8?B?TDNrbjdXUnoxUDZqbUlUZ0ZFQmQ1RTUrVVNzSlgrUkNwdFdLT3JPcjllOENY?=
 =?utf-8?B?YlpiaWNaR0daV083VmxQRk1NVFZtUWdLc0MzUDE0LzFkNlRlM2RsWDZSdENa?=
 =?utf-8?B?MlFZVHpmK2M4OERQSk41dXVXVXdIUnJNYWpJclJrSks4TGY3NHllSDk1ZFZI?=
 =?utf-8?B?S1UrSGM4K3NxWlh3YVdVZUhBUUJzSFY2c1FlNlFKU2tqazJqckpFMnA4L1gw?=
 =?utf-8?B?d1dUZk5oRjJ2eEp1aTN4d2pLMm9vMkNxU1kyRjUwMDdod3ZZVXN5c2lObC9q?=
 =?utf-8?B?dzhzVHVOVnRRRHEzRmozTkFzaEFraU1DNXRuMVE4a3Uva1ZrbHl6amVtUUlT?=
 =?utf-8?B?N2hpSm1RbDRwV3V6Um1kN2NQMDRMOWlJYUxnc0EwL0Z5UFJIK2preGhkOFlx?=
 =?utf-8?B?Q3RJNUVkdkN6MUtaSEVVUURMVDJqMTRSbCttbGQ1U3lSZ1gzZFkrbzEvb1hv?=
 =?utf-8?B?Q0xETisvN1dBZ2tsbVB1UHNLMThNV0FqSnZBVkM2QXhtUHp1SGRxenhub2pC?=
 =?utf-8?B?eENXQlJGVW83RkcyWURVZ1JhcHl5N3VkRGl4bmxMWGVFaDlWUi9tbUVzTDVn?=
 =?utf-8?B?NjBUQjhTVmhvazd2MkJKMFV4bUN6c1VQREJ5TEZPZVpoZitaMDYyazRUVlNU?=
 =?utf-8?B?Q1hEZ3dlSSszMFBsU1BpR3JOcCtGY05xSmEvM0RvakZNeHQ0bjI4UGprenFp?=
 =?utf-8?B?R3JJTWZqbUgzbE5sL3R1U204VWhkeGNVYkYxMDhSTStWZWdrRUlnWmJNWElJ?=
 =?utf-8?B?S1c3Y044Z1FjNWx4bHRxMUp4RzBtT0NsbEJvZXQwTzFiR1FqdnZQRnJiZUZq?=
 =?utf-8?B?UlFMMVlHcUp3QXlHTEM2dW9Fb1hyMGcvbEdiZFROT2hFZGNqN0Z6RWVOWlRP?=
 =?utf-8?B?c3d1VjB0bWxnOXF2RzRLRDkxUS9HMDk5TTNvUEM0bU01STNhTnM3emFXQ3Vy?=
 =?utf-8?B?Mll4OHA5bWpQNjJmMHpwMlpaa0U0TThtbGE5SHF0UTdxZHlKY2FWc1BxcTVC?=
 =?utf-8?B?aW9xMjhSS3YvcnNna2s1NVZMaS95eFNKdGlwNlBuc2N3N2RuSVNsS1lOZkRz?=
 =?utf-8?B?cEkvQ2orR21TOHd5MFlGSzhJd0hOc2crRklQd2NWMVBoU2puRGxVOUtKM1BK?=
 =?utf-8?B?K1JZNjlPUGNXK0VXeGdpQWdhcDMyOE5iOXE1RXZyOFIwSXExL3ZyZEE5VkRF?=
 =?utf-8?B?VlpvV3BaYXNOMjZNelZKNmJ3Z0VMV2ZUSWNYVkdPdy9ZZWxERU1aRUxNSHd2?=
 =?utf-8?B?WC9lNXhrY1VxRDh5V3dBRit1TU5KdnpoV3Z4RUdTWHVHeCt4ZWplM2RrOG4r?=
 =?utf-8?B?dTZmcDN0Qnh5aXcrTHhrVCtMRGtIT3FNQThnR3p2eS9kaEFZVjFIUVlkeXkz?=
 =?utf-8?B?SkxteHJGNmI0azFHemNhOEl5ZXRHaTMwK3lNS3pTSnV3MGlCVWVkU0VjSEFL?=
 =?utf-8?B?V0ttOWRBMy9GL1pqSVAycGhGaGhTR1IxS1NlR1k4VDQ1Y0RjbEM0L0htS1l2?=
 =?utf-8?B?S3RDa3NtcGxsMXJCQThvL09CSDhac2dlUlJ6STUyRSt3SThna1c2V3pKc3pM?=
 =?utf-8?B?bWVNajBDM2Q5aDlubjJORzQvbmlsVWRjRlJDNGRwR2Z6dWtOWHdZKzR2NkhO?=
 =?utf-8?B?RWd2TEF6NG51UlFyU2JjL2F6NW8wSm5YY1UvUWNiVXhneWlXMHVLWEZkbHYv?=
 =?utf-8?B?WDZaNFFOTEdST2RPdEptS2w2eFFlcVhjbnJTc1dsMUFSVXI3ZXh1Rm5BUW9P?=
 =?utf-8?B?dEw2MUxNR3JQb2VoR1BvOW1lRmFBUmE0T3ZBNG5aMWpubGhrbmFhUnMzangw?=
 =?utf-8?B?dUR4YnVzSHIwZXZYYm1Zd281K3ZmNFMra2xIeTA5MFlHL2tnMEYzNXZNREZs?=
 =?utf-8?B?Y2lZL05pZHlISENWTUNjTmU2SGg0czYxcEVEZ2wzdGxhWERlRmQ5dVN2NVpn?=
 =?utf-8?B?MkxJMm9ObE40NEE3cldCYjFVMmpWaStrd0FMM0ZGQ092UGxIcFV3cEpsWmo1?=
 =?utf-8?B?RDJNbXByVnRKN2FpLzh0RzhjZTJRLy8wYW1zYzdEa0VIVnRyeFRHWExsUFZv?=
 =?utf-8?B?YVFYaUtXMlh6NG5ma1NVNmVJa2lKdW9VOWlLRXRLM21zTmd4RmkzMVB0bEdk?=
 =?utf-8?B?blhUUFVuay83d1dCQjJKMUNqK0VmcklWQUptZTMvTkJycWhVVnQxZnZsdVVY?=
 =?utf-8?B?VHhJOEJ6VEtRWjgwTW81dWtYYVcvcXc0WDA3U3BtbUhQUjR3OFVBZ0MyUXBT?=
 =?utf-8?Q?AB3BO+Hhg9GunwRw=3D?=
X-Exchange-RoutingPolicyChecked:
	Z2Ungg1phSQoHopf8sFqFEkY6q4KpR9axQ86f/l7K1+y2G3JOX9s/p6LKDVLL2N+c/OEhxes8lqlF4epSqQlCSxk3WXJPfEFxwED4gMAGVsDx+c1Se7b6izRLESM1s+89x0TONubGMEFE/MaoXTzYyR6qw5nXBGwI8oaieLWnd2B3MgtO1UBBu87enL7R3IKg3JMFI4KCRSAqaNLlu9Hdzk9+gDmGvTPWLIunPzyYHzNoTlotLg1+jb1xzPBVbQEzJTB/I7R6wJB/1Mfc6t3oi8LTx3ii9G19emmCOo9VWMQGR0jLPonnCDDDC/2DgcZgp/io5IMcqq8HEzWHtSF6g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8Wa7mDNmjqCsymT+sRgByk+P+SqpQLswoUCfTDs7hsM5N2VfVgkZyE5ukbF30XM3F+Yfh3Pdes/xo6dzirpSY+jj5ALcSkqZvVVRNm5kp8dQ6boSSjSJyO+UsXs4qISaiH+dpGu1kJ3dqS9dgxtyOT/m9U2LiYiq/8alJiFVNXLMBjVuArHjQ3ZBrXdvCpLgovYmNjdgW2yXK3CraH9jtewcTEsDZHkjQB4Cw1bclHVpKclSgKZNXcdQhoZgli63RQgFsbWUDxKyxREsKL3/uIS1bBju8E52uZC4+8X9mK3cWtooIV8CY1dmt4xEgAsGB3a9hiitHQiDJbrsW73z9ynLIhdBVgsoBe6SrXV+H0Nngx3+D5MRur4Rj6FWN2hSLP7rZc8YUSG8g/FLjzgagCASk7/B7jC6Ltzu51aiG3CD9ibV/NxUDntd5mt1KhHJ+idUodV0xATZzrkfOua1lz2Y4dttPQEsSZwv8Qsnh/KuAfYtjVsA6JE6fU+8aI35gGYB8G/DIFv6XEy8XK5ufMvnSmkvr2LaNof9w4hjj5TRsK6uxXfhoL10RJwX5+yG05Qjr+3n7t1p/I32xGD1yh9QjhvW4aRw7mcgbs5QUt8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3025e6f-ae2d-4cdb-3e69-08df15cb0a42
X-MS-Exchange-CrossTenant-AuthSource: SA3PR10MB7041.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:23:10.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tf4GmYMJI7thgYIHOUYXZVvNl2rniQsyBshj6NAZFxIY2ofNguo9oq8EV6mh4MGr0dp2rrD7IlvOmAcSi09uPUu4VEOYv1ANCTjL1nf4seg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6174
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609180308
X-Proofpoint-GUID: x2AGS0BwpT7c39hw1dZJ4Qh49EtUGwUn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDMwOCBTYWx0ZWRfX1VW/WojzhTbL
 qv03GmFm6nMjAAo0b5xXxUhGWZrbNC2HMDH9qONcJgo/zgAxmdbR2qhYxIC9oMs0xxZFBAbOGou
 D7hLE3m0QZDTmbhx5rsAkpWL2d+CgYPtXIKKDHEnY9L2aAeicREL
X-Proofpoint-ORIG-GUID: x2AGS0BwpT7c39hw1dZJ4Qh49EtUGwUn
X-Authority-Analysis: v=2.4 cv=c9k+0h9l c=1 sm=1 tr=0 ts=6aadabc2 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=ZYxcR6NyhFUkZoqTm-MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDMwOCBTYWx0ZWRfX209Dk0fpVunO
 fFgxpljj4zjLNX21ohkrmP+vrEbv2spkrA7mUJMWY7gaMdfMqt/ex8vbB0pSokCbQQbTSADnAru
 /RP65QIU/LzQH93N4xhfYHzHjhLVWFUZCCahydF8RICdzrGv7H6ifM8SESVBkMU/IztRLsTc6Nc
 jHnbAOJn5e7jqIG5ISz1yelaqNWoqEJRhOJKqJDqXuGxZNs8XXTz1lMZHzrPsYpDAbJeXnpPTVT
 +VUMUHIGQm56uL7oC32COzG0twII1TOwfKk432TgwaQKCdtrTvXjOgDYo97wHP3gVPZq/JRIXDI
 cijdCvgcLCDwqERMMMpqo46HlowDIWUyAV8dAyCJuPNFNlM0O3d10SQtT2X19Nw/kzhzqSIEG2o
 7vXCEafqOjkKFZCt85Wsrl1wy3qGIWL+DgH7T6SJYO6ZrXgzdKFbIDwcFtF5BmuVPHPNAakedxw
 rQ4gYMd7iutO4EkY0zw==
X-purgate-ID: tlsNG-bad1c0/1789766608-BD6C2034-47E9F844/0/0
X-purgate-type: clean
X-purgate-size: 3508

On 9/17/26 04:06, Grall, Julien wrote:

Hi!

> Sorry for the late answer. The topic is a bit tricky.

Thanks for replying regardless. FWIW I tried to get some feedback
internally as well, and it seemed like no one wanted to get involved. :)


> On 29/08/2026 07:06, Jan Setje-Eilers wrote:
>> Hi all,
>> 
>> I would like feedback on whether Xen needs to flush every page in a
>> dom0less xen,static-mem bank before assigning it to a guest.
>> 
>> Static-memory support is currently enabled only on Arm, where I am using
>> and testing this change. Its implementation and acquisition path are in
>> common code, so this RFC is about the generic static-memory path.
>> 
>> The current code cleans and invalidates every page in the bank. This is a
>> safe default, but walking a large bank can add several seconds to boot even
>> though Xen only writes the pages used for the guest kernel, initrd, and
>> device tree.
>> 
>> Here, cleaning refers to cache maintenance, not boot scrubbing. With
>> bootscrub=1 or the default bootscrub=idle, Xen assigns dom0less static
>> banks before boot scrubbing starts. The pages are no longer free, so boot
>> scrubbing does not clear them.
>> 
>> My starting point is that if a platform permits the untouched pages to be
>> cleared before guest start, the guest cannot depend on their initial
>> contents. This is a platform policy assumption, not something Xen's boot
>> scrubbing establishes. Xen already cleans each page it writes during
>> domain construction.
>> 
>> Would it therefore be reasonable to let a platform skip the full-bank
>> flush, provided it can also guarantee that the untouched pages are absent
>> from all caches and that firmware, DMA, EL3 services, and other CPUs do not
>> write them before guest start?
> 
> IIUC, the cache flush was mainly added to prevent memory leaking between 
> two guests if they are the MMU off (see XSA-364). I think what you wrote 
> makes sense, but I would prefer Arm to confirm this is fine. For Xen ...

 Yes, I think in a world where guests are coming and going, and smaller,
this flush seems relatively sensible.

>> I am using no-staticmem-cache-flush with bootscrub=0 on a 64-bit Arm
>> system with two dom0less guests. Both guests boot normally. Skipping the
>> flush reduced Xen startup from about five seconds to about one second.
> 
> ... I think the slow down you describe could also happen when a dynamic 
> VM is created (e.g. via xl).
> 
> A few years ago, Arm introduced FEAT_FWB to rework how stage-2 + stage-1 
> memory attributes works. Currently in Xen, we are using the "old" 
> approach where the used attributes is the strongest of the two. For 
> instance, the guest has the MMU off, then the access will bypass the 
> cache. With FEAT_FWB, you can force the memory attributes to be 
> cacheable even when the MMU is off.
> 
> I believe FEAT_FWB should solve the problem you have (assume your HW 
> supports it). In term of effort, it is mostly updating the stage-2 
> memory attributes and then getting rid of some cache operations (include 
> set/way emulation) when the feature is enabled.
 I found that as well, but at least some of my hardware is from just
before that shows up.


> BTW, how much memory do you give to the domain? 4 seconds difference 
> seems quite a lot.

 This is two domains: 15 1/4 G to one and 4 1/4 G to the other.

 It really stood out when we did a boot time reduction exercise.
-jan

