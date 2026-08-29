Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94775C61DD6
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 22:01:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403188.1637673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0R78-0005TF-0Z; Sat, 29 Aug 2026 22:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403188.1637673; Sat, 29 Aug 2026 22:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0R77-0005T7-T9; Sat, 29 Aug 2026 22:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1403188;
 Sat, 29 Aug 2026 22:01:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jan.setjeeilers@oracle.com>) id 1x0R76-0005T1-EG
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 22:01:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0R75-00AduD-RK
 for xen-devel@lists.xenproject.org; Sun, 30 Aug 2026 00:01:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jan.setjeeilers@oracle.com>)
 id 6a935695-8faa-0a2a0a5109dd-0a2a4506c442-34
 for <xen-devel@lists.xenproject.org>; Sun, 30 Aug 2026 00:01:23 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jan.setjeeilers@oracle.com>)
 id 6a9356b0-195a-0a2a45060019-cddcb12099ac-3
 for <xen-devel@lists.xenproject.org>; Sun, 30 Aug 2026 00:01:23 +0200
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67TLskUj1791660; Sat, 29 Aug 2026 22:01:08 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbq1sgn0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 22:01:07 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67TM0Xh4000847; Sat, 29 Aug 2026 22:01:07 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4gbnvmycjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 29 Aug 2026 22:01:07 +0000 (GMT)
Received: from SA3PR10MB7041.namprd10.prod.outlook.com (2603:10b6:806:320::18)
 by DS4PPFE2271E76C.namprd10.prod.outlook.com (2603:10b6:f:fc00::d51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 22:01:03 +0000
Received: from SA3PR10MB7041.namprd10.prod.outlook.com
 ([fe80::e593:4c8b:434c:76d6]) by SA3PR10MB7041.namprd10.prod.outlook.com
 ([fe80::e593:4c8b:434c:76d6%3]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 22:01:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PopbFllhoJ4sOxgTXbb/ZI/SaV6B4cYpNQriYBMhY8k=; b=
	TViyIZYLPZc22sWJSym8ubavfiAPHyfQVpN28BI5elDBuVAeRG46AglVDrO4SGn3
	gJlthJMB71aFue/MhGBK/BpG6GeOJTyxAV6syEQp+bfOyTi3dcMGpwqyehS9qYaf
	tEN6+9SpmY/EKjEIEwyTLv99OcV2iJeiiEDc8lZJ4tWhZ5T9qWpvdhHZwWrirTaz
	WnEorQycjTJLuqxnwAqOOOVi7obbkT3ScAyEdfXN2uC023LTEuSFZoxpQHGUeVOi
	H7LUEw73bxbUwe8TXvh0XOd5/F7RU9/4HiLwYxBq8/raAVtRGrWLEOhQk9x0bUzo
	y7mHgDDSsNLLMMrkh6HQxA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrKzsBrk7IP1nh/ozNuSsMmg8HR3xPnXTcosFKzVYkCg2+6aGUOwP9tWdnGzJsRAwOey0UsK9zE3cQAjdFW5sRwsLD06FklCJdIii/6JbnnsYvix1nVyOm7h2NB+Q81YJlB9wPKU8hSYd+V17JfDBnatfOznIXXbJGRRNWaeNuxK2ZMP31aIPOIbtjIFsQHQoKb6F3/SzKi3XeKNtU+JLISAnvgbC+no8bQCObVkXRadF++KaVRVkA3qBCw4lvBspDjD6qweOk0J7omJ5y+OPUbBPUuDaGuNX989LwcvtStqYX7etdqoTmhmes3cmNMATUKJvtC8nQ7vRi54CXAFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1kG4myDpqbheIIqGkuoL+on0QP1GBAL358gjZKTDyo=;
 b=I7n+kALAc821Taxn3LQBcOBC5YQEOnY2RPPlaIrTsGIQ3G3616/i95nj1bZxZWOaVFli8NCx8VGADRLG+6u+2K2xB33yOqCpaKfhFlARFk4cQj4v/z7Z2Lmw5m27Gwtp9JNVzVxK/Gg/nFUx5V4VSyv3hkamu5BDKbc90DwZf+Ymp2SxqvJQozojDgDvEu8QgnjahY2orD1pLesD3mNinnkUvb4fcbSVI+EKDTyIXsi0DZu8o7oyGOUkuYnnrOARljOQ/sb2TFBLEBwm1KmjRPEIvnYMmOY+uzsGX0pxVhC+rTFpcyzXc/2wqOZghcVhqmWwjeqwvxJqbzIEDMf9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1kG4myDpqbheIIqGkuoL+on0QP1GBAL358gjZKTDyo=;
 b=LQdRaTdMeN4eq5OpeHlKMU11HpHtyYqYkcnSp1f2NTL8oYg0XldCV/BgZAdl4fOexxsvSUqo3Sa3EbbDae3ddI4Wf1oGyNk+7WYWKtK3hWFk+bLOgvQZ1lxt1E1q8zjpEQSFFetZrjsJDjcWLQqD2uTzzGXPkuD3w5DSQa01swc=
Message-ID: <e85a139e-ea5e-4630-9006-f50877533f71@oracle.com>
Date: Sat, 29 Aug 2026 15:00:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] xen/arm: smccc: preserve arguments before
 register setup
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
 <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Joao Martins <joao.m.martins@oracle.com>
References: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
 <5286d0ad-5068-43dc-b23d-e18f05ae4b64@citrix.com>
 <31e8bcf2-480c-4f32-8096-877a0fbd327e@citrix.com>
Content-Language: en-US
From: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Autocrypt: addr=Jan.SetjeEilers@oracle.com; keydata=
 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
In-Reply-To: <31e8bcf2-480c-4f32-8096-877a0fbd327e@citrix.com>
X-ClientProxiedBy: SJ0PR05CA0199.namprd05.prod.outlook.com
 (2603:10b6:a03:330::24) To SA3PR10MB7041.namprd10.prod.outlook.com
 (2603:10b6:806:320::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR10MB7041:EE_|DS4PPFE2271E76C:EE_
X-MS-Office365-Filtering-Correlation-Id: cb53058f-f59c-40d6-2bd0-08df06190465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4133799003|18002099003|22082099003|56012099006|3023799007|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sIMU8AzTjUdNQP5XBbuXtT4GEDPsWLiToYCgHKsslsSRNSMNTUsDoYZRrNtG6w5zqdnjqnUM5dHJiUzo/jwTOMQj3Rln7P2NeDzQukE/PT5f15PtidvJmjtX2BzUZAylvk9EpXYcfEEEZ23nvGIkDcvUamTar9HI3uV2rHxZJZLwcdzVDmj+aQRbcJQvFxGEufBdGxM12U6IXTJcWm2NPbHSIi7h25OTJEyl2QqYr4ZjjUZw/c03wipwcwYmDLkSBTTDWEVAepJ79YfnHxgbYMaVR3ZRzi2PhZedPC/CtW4Fcul33SKfYR5Ji6oQ6tE1QnAtiB80s/J0FBKM6w4lY6MbO23TcAzaa2b1lqTNv9qPyDlKDoMV7RHt4Xxn9VMfuLrWD2+DVk+K4N2SS4ILAdUjILlu7jBFTW+gnNiG2D4ufAYB5bXdgnHmBse5ik/75Ls17LWf3QPCpdHf/84H3UO1Jrgpg5i093n09cUErnVUC0CLURbEkdxO9F07jc+oWWvkRS50DjGXObGxVCJ6nTb4GqyCDxpWffv6FUIJ7VHE9Gi/r2PsWGc6AsPKw7JvD+V4+srP4+SKTnKqLG6wiA6N3YwTnI2+aP12NVoUcut9WgLD4NKuTaQ1o/Sp9BIfUId9hczHI7rhgnLOHDv9XufrcnSZgwbuRz8Kux8JsiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR10MB7041.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4133799003)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y01yMlBsSE5oNUlrWXh0UmZwY25IS1BMTW11Zjh4aFBsc0VlMlYrSlpMUHhj?=
 =?utf-8?B?bXRwOTVXc2RnanNPWGRtdmpnTXhwR2FQQWhCQjVjQSsyQm5yOVJaS0RiQzBG?=
 =?utf-8?B?enNlNkYyUnpyZDU0Sk9kcElCWW5HMFZDejhuREJYY0FkbGRRcWdlTEpVU2Rj?=
 =?utf-8?B?MEJ1NUdJRFowcVdXK3ZSU1Fyb2IyMFN1L3hwdEtwbXdRVitZMkpLYWVFdjJk?=
 =?utf-8?B?Z0l1OU9DQlU4SmJmUHMvdCtTYy8vRXJOVEhXaDZHOFZHN2Z6V3pCdXBSSE9F?=
 =?utf-8?B?c2x1bU5wWUZUNCtmZ0NlWDZ0bTZwY1ltOGVYT3BQcStCQ2xSRVBsU3JXZXBx?=
 =?utf-8?B?anBlOVl5VnlZZVdzQ0RScGVISWt6VWdDSytFbTQxM00wM1gwSytsV3RuZVBz?=
 =?utf-8?B?bTI2ZDhiKzNHVWJZMDc3eE5KSUl2Q0VLQlZURHo4a2lWanRDQXE4TkN4a2VO?=
 =?utf-8?B?OFRTM3Y1TWtsellRYlp1SFFjQmpEV1hZWGdmNFA2ZGlvSzJNZFNGV2cyU0Nm?=
 =?utf-8?B?S1dnZ25PUzR4VHlEa1hrc2JkVkt3UVRaM0g4bm45cVBKWllSeGRZaE9aMDBo?=
 =?utf-8?B?b1R5QjNaSjhXVDNpQnNpcisybDZ3Q1piV3BHM0ZvUTQ3Nm02aW1aUTd5YWp2?=
 =?utf-8?B?QU5ja2w4OEZUYUZ5THo5R0IrN2huSkpwdklFTzBWMDNFTjBJL3UyVHRTdGU0?=
 =?utf-8?B?dGFGbHBFZm1qVUp1WU1VeWRwYWw0V0ZaQis2dUl2MWFoaHM0eTVwVEdhSkdr?=
 =?utf-8?B?bG5sNUhvYnZ6QVloanQ4RnE3aGJmWnJ1Sm9RYStPRlREa0F0VnJtSkxhZTIw?=
 =?utf-8?B?SElHVDNFZXVWV2ZSSXJ6UjRlUUdPeXlrRWQ0M2J3S1dsT3RvMndXWW1RY0Jq?=
 =?utf-8?B?MDg5bTBVWTFaMW1ubGphaUxRZklWZXB3OUk5dGwzd0NWQWhERERqdGhsUlRD?=
 =?utf-8?B?SWJIdEphOHZHMUQ0SWhxeFo5OGNSaGxBMGR6a0szQ1EzNlRFTk1IT2ZDV0JM?=
 =?utf-8?B?b1BiWTdZYXNMSW5uMnBiMTRFcHV0SXJyVWpEaStVQkRMbFhtZ3RUa0czM2sz?=
 =?utf-8?B?djJxbW5JUmR1dExwblFZaGNIaHhuZ0NBMVp0YWxFUGNlSmwrMzFuNmUvbDB6?=
 =?utf-8?B?Uy9XNmM5dVYyTk51NGh6SU5NSTdmN09YVlExQmIrTUt2T0tVRDdKRjdkaCt0?=
 =?utf-8?B?UTF3UnBINmNjbXNGTXk4YmlHNGcwdzJFQjBkUXVQSkFUQlg4UVhmYkJkYkgw?=
 =?utf-8?B?MjFCTWhMMm1jbjhIbGVzMndmTmYzdlhiclVaY2Fadm8yeXdKZ0RDUTFoSm5r?=
 =?utf-8?B?RlBVL1RDdE1SY3J4WEFFdTNlSUlKSjduTDJuNWdYdDFPK2krT1dYRHFVeU5t?=
 =?utf-8?B?RkUzOGY4Tm1MTkhWa3Y2R1JNaWhHTlRleHRma0VNT0pnMGdqcXI1MU5WMHYy?=
 =?utf-8?B?SElCWTlnWW1tc3AvMHpKd252N2EydjdON0FvSmpZbFc5aWsvT1RBVEt3cnZO?=
 =?utf-8?B?d3dRTjE3VkFSZmo1eFhzTE0zMXZvYi8zQW11SDMvc2UxUHROSno2MjNTb3Qx?=
 =?utf-8?B?M0Zxd21SbDl4NGFsbFJOTE85eElDTkcrOVlEQ2xobWxETkgrcktEK0ZhL29a?=
 =?utf-8?B?RlZWQkE5S0VxZWRJZlJXUGpjd2RwTUFKVzdEdXNERnU1TTlqYng4WHhWSjhB?=
 =?utf-8?B?SVVBc2ZRY0ptV2JPQS9weC9HSU0vTXZYQjNzMXFqZEpiSGM1andDbUxCYTZR?=
 =?utf-8?B?R0lZK2tDRThJcDhvSm1PaVc4WUV2dk5Uck5FeWk1d1ppN1RTZHpVNkVmTEhL?=
 =?utf-8?B?VE8zTERQQmdMZGg3T1orcDFmVnY3akhEY2I5a3dQMHIxNUhSb2VRb2o4L21z?=
 =?utf-8?B?cUQ5bzFDU3VZZDh3QzJCb1N1YXo4RDVIaXVHRDF4Mmp3OWxVc3ZwOG9oNjVh?=
 =?utf-8?B?NEZaQkRTekVWRGRCcFduKzBaNCtGWUZyOGlLbGdKYnFRNzZqT0hhM0JidEhh?=
 =?utf-8?B?VENNUnV6elhyaW45ZUZqNlozUE5OR3I3KzhnamErTWwrOXU4Q3hLd1pwOVds?=
 =?utf-8?B?SE1yTFVsWW94d2FVUHVJNXBKWTcydy9iek51cHpCeklUUEpmd3dGeTlrN24x?=
 =?utf-8?B?QzZyT1dBRUQ4eUVqMFNEeVZMdi9jSjBLVHppb3J1RjZuZnRlWjh6WVlLbkFj?=
 =?utf-8?B?MWZTSk1sVXZ3T2tqREIxTE5NdTdQeitNNVNEa2hsSWdwbHVlSVkzci8zTkUv?=
 =?utf-8?B?SU1ZblhpdC9hdk9LSkpvTmtLSG5oU2J1d2JSdGx2bThoUk43YnQzMTF3TFB3?=
 =?utf-8?B?eXdsY2dUSlF4S1ZZUFd3ejlTLzQyNFlicUpiZ3RMcDlLSnNQTzNzVWhjK3g4?=
 =?utf-8?Q?rlDcmkTNl7j+Rgr0=3D?=
X-Exchange-RoutingPolicyChecked:
	g3nK+EaPQN1WxNVFDpTVx2miV6paWvmlHvfBwqMg9ZzAjnFHCW6n8BqTCNapMX/lhp3avQmwnIQcYPJ05p8E4RrCAofMJzKp0dNABWt94eWegJXY3VIznBY09YwQzB2GFvca6rUHBuU8BL6Xz+7WHU5M0Smze1n+3thTHUV1095xQNmULSFGIWOVX3qDs8hUszfXl3ZsTSTyNNiw78S63zAg5JLt1B6P2YUxC4QllTxk+A1z9I0vScOMRePnBG/DpjPOs2XMAlPjGVHusyT+LHIgKEtm9veHJ6zGhRuJl/nuDjZCWvek6eKDuEZJIBsmr+wtDAQ0fFbSp2F8EQ3kig==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vrXQUbg0yVMLk3BcSvXaVen/0F7Z0RCIcjPTZOpb8euMGv5jN2lK97gP/YPCVCxPWzqyGvcOg4co2FYNZdaUlFTVubxBlR3et66vVjmhGwxx/VP/QRQh1jqWzKS1fRRSGDOVX70O76sAi+8vXW12G1EkZcFwoec2OahPE6+Tlqh+NAXBcmIYkU4RSoCJEPbzJlDlGTXZm3T4RoLn5TL3b6x/xlnyn5afXGImgy0amyNJIU+7Xb9Hkp3OfqS3luLPMoagj0upooCRpkHNUOT2haWeQMpI8tqh7xA1cOwr8fhZ4Z6LOx71ggY4QGzOIJPF0qxRSu0m2WvY32xlhoMbsYO6EeQnGa+S6dHM35uEY1RBN6+XT6u3qxrxgcYL2462/Nr4ogEwYQ+N3dIe9Gugcp67GL91BIG1OUP5Bg8OyLiFQXRTdAvtg6Awzf+GQMQXYpioZpUKWAJILsiBE2LddcRk/P8FRNCn04QwpNOYPaTDysZr4NvVC8VEMkaA53DozCxE/MOSFj+Ysz3sDt/GstuTbS1Mm/4uvnzmRwwi617DXQuwcv29WG408T2OrOx/2CgrExOx2JrYOkl6FYOLddHbE7wiVhlzhLPq1nCrIkQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb53058f-f59c-40d6-2bd0-08df06190465
X-MS-Exchange-CrossTenant-AuthSource: SA3PR10MB7041.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 22:01:02.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPDTF7z1vlbUMZHXUminyQlEH/84e+9qVvCd0Y2PsfhUIpqRf/f5L/VNFUaZrWhDHy66s8FrWP12xbiJEv7CorOYZzyRio6ejjMU6FY6TBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE2271E76C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608290191
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vp0Txe2n c=1 sm=1 tr=0 ts=6a9356a3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=RpNjiQI2AAAA:8
 a=dEnvS2v33luOMeR2ZAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12102
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE5MSBTYWx0ZWRfX/s2IhNxXR8qC
 WumnzWlwCysFPjDxBU6FgwVUH1CWaJlibk9NJXwVvy6ZfOI+X+MTPrLwbEAMZ60RZSN++VILQhw
 7z2I8fmsoM9wMOUj+7lVt/RC7K5//E33DBKw1yzr3lYNbPrf3kHRqFn95YqSMBRVGCdKLCT9ltm
 ac4YuNkitz6gauh8o7lsVmhpYDSCXT9rBp7y+4Y9mlEt2iWAwS9/onObb78+VDFqttFS4p3NmBv
 E5k84sHV43Np01TMDfL4hyM8TEmJ7YZfyNVosAsHrOSx6HnII+JD5DvQX/a/Zwq+AQjTlL/c9yQ
 Z8kjXUXZ20n4RCOH70LwCdcltF5CYkBauL5vc2L0cRCBRjfiXs5UDky6qRuxxkRk3jQWQlmm9GC
 yG4ZWhn2bi3fBnkcrf/MU16GE281MQfir6RieKVP6nbdeJRS3Ty86mOLkFp6E2tUGSjLsqxqQYS
 YFoM3nalDDA9oA4WmyFt3zLklqgfbsH35vHDo3t8=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE5MSBTYWx0ZWRfX3dkeurIBLYuK
 +ZGV+k0v7giKzOY5gKvm2RO0t0L4OVjbjPDsP0pSvIAG0ClmvwkTJq4uovnqXQDyxeVqWNvtMBS
 F5MNbadJ6jKQdyW9FsjB7QabevFX5NoGOalJYAIMrf1/gsIGzNU8
X-Proofpoint-ORIG-GUID: XMP9tEUjQO1GAxvGiOMgWO-X9ioP4KXh
X-Proofpoint-GUID: XMP9tEUjQO1GAxvGiOMgWO-X9ioP4KXh
X-purgate-ID: tlsNG-16d1c6/1788040883-FDA0C77B-A3B96EAF/0/0
X-purgate-type: clean
X-purgate-size: 3374

On 8/29/26 11:19, Andrew Cooper wrote:
> On 29/08/2026 5:=E2=80=8A53 pm, Andrew Cooper wrote: > On 29/08/2026 3:=
=E2=80=8A12 am,
> Jan Setje-Eilers wrote: >> Hi Andrew, >> >> While investigating an SMC
> forwarding failure after updating to Xen 4.=E2=80=8A22, >> I found that f=
irmware
> could
>=20
>=20
> On 29/08/2026 5:53 pm, Andrew Cooper wrote:
>> On 29/08/2026 3:12 am, Jan Setje-Eilers wrote:
>>> Hi Andrew,
>>>
>>> While investigating an SMC forwarding failure after updating to Xen 4.2=
2,
>>> I found that firmware could receive different values from those passed =
to
>>> arm_smccc_1_1_smc().
>>>
>>> Several public Xen callers pass get_user_reg() calls directly to this
>>> helper.  This includes the SCMI, ZynqMP EEMI, and i.MX forwarding paths.
>>> The helper puts each value into its SMC argument register as the
>>> expression is evaluated.  A later get_user_reg() call can then overwrit=
e a
>>> register prepared for an earlier argument.
>>>
>>> The change in generated code appears after:
>>>
>>> 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarations")
>>>
>>> I am not sure which behavior the helper is intended to provide. Should
>>> arm_smccc_1_1_smc() continue to accept arguments such as get_user_reg()
>>> calls, or should callers save those values in local variables first?
>>>
>>> The attached patch is a candidate for the first option. It restores
>>> temporary variables inside the helper, allowing all calls to finish bef=
ore
>>> x0-x7 are prepared for the SMC instruction. I am not able to validate t=
he
>>> public SCMI and ZynqMP paths on hardware, but their generated code now
>>> finishes every get_user_reg() call before the final register setup and
>>> smc. With this change, SMCs also work as intended on the device I'm
>>> using.
>>>
>>> If the intent is not to accept function calls as arguments, we should
>>> probably fix the SCMI, ZynqMP EEMI, and i.MX callers.
>>>
>>> Given the existing use cases, this seems like a bug, but your patch loo=
ks
>>> intentional. It's very possible I'm missing the intended design. I would
>>> appreciate your view on the intended contract.
>>>
>>> Thanks for any advice or help with this.
>> Yes you're right.=C2=A0 My change was buggy.=C2=A0 =C2=A0It was actually=
 part of a
>> mutli-stage cleanup across several patches.
>>
>> I'll submit my own patch.=C2=A0 I'm afraid your AI has put in whitespace
>> errors where a straight revert would have gotten it correct, and left
>> the 0 case still buggy.

 Thank you!! Yes, a revert also makes sense.

 Heh, the bulk of my AI usage was actually to try to make sure I hit all
the project rules and formatting since I'm much less used to some of the
style here. Sigh. :)

> In fact there's another bug.=C2=A0 The SMCCC ABI states that certain
> registers are clobbered, yet these are missing from asm().
>=20
> It's also sad that this macro maze goes to the effort of making a
> function-like-call which can return 4 registers by value, just to then
> force it all to be spilled to the stack anyway.

 The other way to do this, if we're actually trying to minimize
instructions,
would actually be to create another interface that does something like
get_user_reg() as part of the invocation. Then that could be a single
assembly implementation.

-jan

