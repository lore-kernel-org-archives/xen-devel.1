Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D02C531FC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 14:07:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371706.1619181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woLyu-0004Lc-82; Mon, 27 Jul 2026 14:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371706.1619181; Mon, 27 Jul 2026 14:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woLyu-0004LV-4p; Mon, 27 Jul 2026 14:07:00 +0000
Received: by outflank-mailman (input) for mailman id 1371706;
 Mon, 27 Jul 2026 14:06:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1woLys-0004LP-AI
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 14:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woLyr-0041Z3-5w
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 16:06:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6765ef-e002-0a2a0a5209dd-0a2a45099a30-46
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 16:06:57 +0200
Received: from [52.101.57.48]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6765ff-be1a-0a2a45090019-346539300faf-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 16:06:56 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by DS0PR03MB7583.namprd03.prod.outlook.com (2603:10b6:8:200::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:06:51 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Mon, 27 Jul 2026
 14:06:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjM5Kbjkrnr2imfjDXHfo+iG9/W9vkDeN/wFIotr4teJ3kipcGsTnYfMIXi/023DWEP0owqjZRXf75hle0nq98wXd5j8PzUAyBBTVE1MzJySH2lWj5cfInQAJjt8hrcJ9TReR+2AhA2rwi+cXfZ7Ufz/RaAeTq4qUad+C8bbbb/a3fMLz0XfAEufywDUochw2LqgaMYB9ewDHgyd2mjmoW0drod0ODWk//KZdZNEPNkAeLom3zTGmVDmD9VEzfCeSsuvFmGMyEwZNTETnqKw/HACY9AsMbrdSa4rI6ZH4mit96JI08G12iUcYrLk+gmm2TPcgX22xbNH1pMyIuh88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHe3OjmUHbKwc+JoWeAjgb/Q1QMx2yuZVjt8duooN4Y=;
 b=NOPHwQYe6W/Y15wmJzK/x67BT/CnF7/xIdQjvYPCOKbGeWO2eOyDQi/OYkZ+EBfmUl4aZbQDE+W+anXTVC4BiYwqU6q4nX0WePzc/doqpe44K8XiYwVeQw5NL4T8QjUenuA9jKza54zWsUjpaA/6bayz9znP7s6Ftx2fJdF46T/Mn32OKxzUtY/CuaBtCNCB482EJwZt9Vyd/rqJskm7n4/vnEOx9MN5BiHn/Ea4NTCkc+hM+r1xobzZ6bk7/TtM70FqVgNyEiBSadfI1wZU5pOexEr0bmmwYMC81Ik4d9M3G8uRFj+muImMlQmM3BYrkfVoiiRD91pM2TwfiQkX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHe3OjmUHbKwc+JoWeAjgb/Q1QMx2yuZVjt8duooN4Y=;
 b=YUaoT+2UO8Og43kojIET2vlS1U/Ojy1JCiTOlpCf/xnQPmx83RDuXuypHtDsUG+wCipNrt+lgKKsovYtUcASudXabZA/WsAXT8ATPNBOfJQWkYHdQ7DHllhWPk17RDEylo/ylObbVPJ/sUlqNa6LtPDNnYYfaDnPBS8ipO4a6Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e4391c82-3d46-496b-abd3-0b787680ab9b@citrix.com>
Date: Mon, 27 Jul 2026 15:06:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 08/10] x86emul: support non-SIMD MOVRS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <9fdf318d-b838-40bb-8778-86f791902a4a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9fdf318d-b838-40bb-8778-86f791902a4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::18) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|DS0PR03MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 9328ed1a-6b6c-451c-6e00-08deebe84e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4tJeawDlA/D58ecNfSzmyBG77je0s7H6ocB1IZyKwBc5b6/q49SBM9CBEORwTiJE/5zZ0sOnUx6oC+/6jSvJKxejFoVG3e4q8zwbjEgiD4BnsC0a/LD2xqf+KarxHuX/zgDbNDPjwE7h50VO6wBN4q4SsjIriVqKYPH0NskWVNPMjPpFap0clq1GDjzwBaa2askqYPo1ybDnOfREEGHbQj3G2Wg77q1upfOyuoo+kfyJRAqDdj5ZmQ4wkD/4YrIoJeU8QJ9fEvkndcE26cl5CLcVcILJqnSn++vDIEcIoapjEqbGYnOpicCtZWeGhN9oCi9gEnbzhaZdlJ4FeiqV3xRYso+0tHxA3s85OHNL3Tup2B9b4LpdIoTa1Lf4JvNoEGfxDMzvqJNfkimd6LqqEmPp/xmA0YkmdPKTNX3BZEkmL1N6XXQpzVmCAkdY5W9pL7SArI9uZX70NWwN0WeYEaQALo3ATX07elYs6s+kFxTrAoOPjvpiPcxhuo+bVYDTgajHH9Yf8gEZnSnMNDu8+ccfAdHzsWoUCykpDlcECiJYDzuLjS2lnd8Ds1zbOT4pWZ8RC/7EQKoaAu9q5qwGb2q/suChM9kpCnIN8Jm4f67EM3o9BQL7Dx9Z5TJpfhwVT/pjkWlcU1lC86JApqvJoSUIIhBnvMix1kZHlKkBSCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0hjWWN4RVQ1Znd1Vm1hTUNtbnpqQytVSHJyMi8wbzVRQllhZ0FWMm9XMWtN?=
 =?utf-8?B?WE1ud0tUc0ZSVDZWditHYWR1VHJRVTNVa2M1TGd0TUJMazh5Mlc0RCthWER0?=
 =?utf-8?B?Zk5sejZSdEFnbnVESXZ4Z3VvdEc3aHI3Sm9xbWNqUFhZRkY4QUQzRjNibG1P?=
 =?utf-8?B?c0JMWUdYVmNTb0dLdmhLVHd6b2lJYUlzb2lYUG9KWm9ITFBTZE4yNHVib1ZR?=
 =?utf-8?B?Zzc1c0lTUituVytqTTdZcHVCclgzbmYvMi9jSG5vVFBQS3pobldDUEdwa1Ni?=
 =?utf-8?B?Y3p3SGRQMUV1eWlYei9Ga0Y4M3BLRTJrTE1xaGZKVEszNmtTcE5KU3dvcXVt?=
 =?utf-8?B?cXRxOUtHaHhYdmZsVGRMU3lLTUl3Y3Q1L2hrdFNMdmI1RTlLTDNzd3Z2NHYz?=
 =?utf-8?B?QUpHNC9Ud3lJZ0VXY3h2Snd6MVliekRoUjhmVjlKeDdLTFExWWNITG9lWndU?=
 =?utf-8?B?QjQyM21kcGo0VENDN21hZWFTblk5Zzk2eWRudFpYNCtvTXRRc1VQRk1GcS9r?=
 =?utf-8?B?ZVZ2V0lYY1hiaVpvMmU3cVRUamtocHVKak1VL1BpR2IyZmpIdlRRMHpWQWds?=
 =?utf-8?B?R0dxSGYvOWNFbUVUbXhzVE9CdEcwWEhEd3J2b2krMVB1VUZhVHcrdFNQRVFB?=
 =?utf-8?B?VEFoVDRielB3dnVkVDhwbzBkUzdJQVYxVFZqaEhlK29PeTg5dUJBSlI5Mmtv?=
 =?utf-8?B?MHdjWW4rZ0VTU3lPZHRheldKbE5RZmFXei9mOFBoVmdPbktMR1NQMXAwTXhK?=
 =?utf-8?B?WGpkcGFlM0ozc3graEd2dGx5bExHd3drTTRyNVlDUHhnSnFrVDE3c2dSbXpN?=
 =?utf-8?B?d1QrbndReTcwNlF4T0MrWWZRR2RHVE5zVkRFRzA5L1pLZlBtenpHNXpiNWt2?=
 =?utf-8?B?NjFka1ZsRkYxam5qL3E3cC8zZWVQMzZXa0JJQW5kbnZ5UHAvWWdGSzJ4Q2Fl?=
 =?utf-8?B?cFM2VkZpV1o2VDZPeWUxZ0VXRnRNelQ1YU4zNzB2akZZOFNacHFiSmpkL2Rp?=
 =?utf-8?B?VDFrb0plMlBUdUdkL1VWaHMxaGVtVGZLaDFabmVUMnI2by82TWVRd3ZhclEv?=
 =?utf-8?B?eDJUVnFWSFptcUtUVmVPSXdydTRNSXVSalBtdUV6NzNvS3dBcGZjZVlKSW4z?=
 =?utf-8?B?RGc0cWFMeDRQQ0NMUTh2azNxQWl2U2w1TDlPOGlEcllUZElDMldKYy9hOGM5?=
 =?utf-8?B?V285THltUGd6RElTbE8yOThrMFp3NmRxb3owU3JuUDY1Vk0vaHRCZjVlbHNq?=
 =?utf-8?B?VkJJQlMwNDl0QXhPeTI4YmZvK0JjNVlReGIwUWwxbjUzSDhwYkpUN3duaXpT?=
 =?utf-8?B?SWpjSmVjcWoxNE5OVUFrQUJGcGpOejRyNHJNckorVlRHZUhZOFU3Sk9CVEYx?=
 =?utf-8?B?Ni9QejVBSmNhcGN2Q1Y5TnlqOHozai9yU1R5OFZ0VFVPU3FsMmYvamRwZ0ZT?=
 =?utf-8?B?RzZWSHN4T01pMjFRTmhzU1FFVzh0Y0VzNGxKVEVwWlNwWVlIZldIVUVrYnJi?=
 =?utf-8?B?dHJhbjg3L2hzUGpLZ3NBemo1Mjc4VHBQK0NrTkE2akJ5TXovMUhKMTZac0Zz?=
 =?utf-8?B?S1ZPMXJ3ckFaWFNWYjNIUGlUOWhhR1ZJNjlleUhPekJrTnlGL09YaXRSaW9q?=
 =?utf-8?B?SldYYnpPZW5mTmg3MlBXVWc2dzAxdFBuR2gxYnVFRmowWVJoWDFGZXZFN3Nw?=
 =?utf-8?B?S005UWg3N3N6VkVJYnNPZ3FCQzd3REdPc28zN0tGS3hKWmNSczBBdHphZStC?=
 =?utf-8?B?bk5VTHRwRUQ0M0ZoMDhsMHN5VnRtT045TTk1bW5IS280cFFQUGhxRzZOdG5h?=
 =?utf-8?B?MGdhNjk3aStENFpvRXVlVElSZTFKKzdoMXRVeVIrVU94S0l4WllGSU1iYlpu?=
 =?utf-8?B?cHlzbW9kNFRnMk8yeUNlMXhESU5ReDRZNERBOHFvSVBJUjVhV3dGdFVwNG1M?=
 =?utf-8?B?U1NvZnFHS0xOKzByWkJ5TmsrZHM4dW94d2hWL0MxTmgva0JURXU4M1d2V0o5?=
 =?utf-8?B?UHVPQTZGdU5hczRJY0twWnNZM3NvS0p6UXczZnZFcVRwdmdWNi9OMnRVUW1t?=
 =?utf-8?B?akZmS2RwTjd2cUlEeWlwWXZJN0xXVHVCaVBzeDZhMzc4TEtDbUZWVFdkUkxq?=
 =?utf-8?B?aHMvQzJZSUN0UjJjK1ZZd0k1T2ZWSUgzTDltWEl5OTdlalZNSlRQR1RNalVS?=
 =?utf-8?B?Q2VNRnpJQlZYR3VoSHZHcUlpdmVaQ2VaWGh0R2JDSkN1TlVFcE14eUNTYXFs?=
 =?utf-8?B?Y3dsNng2aVIrbUphSTE4QTQ5Q3Y3allxaHovaExlblpHY2krUHRaVFl0Qkh1?=
 =?utf-8?B?ckU0NXlRd2syalhGcnlObEc4aTdwR3lvQWk5U2FndGVhVGlLRjNOZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9328ed1a-6b6c-451c-6e00-08deebe84e6e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:06:51.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfFPTABflUN/SpULjh8HDWjDM3pr/MFUcMRGi2G6gpgQVQsEi5V4IWRn7FXNsmt8Dn+CL6RFRSrI5R4QgKKBZPyygrmXyiEcXvCpfAC1NRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7583
X-purgate-ID: tlsNG-bad1c0/1785161217-3AAD8034-D351DE0C/0/0
X-purgate-type: clean
X-purgate-size: 238

On 24/11/2025 3:01 pm, Jan Beulich wrote:
> As we ignore cachability aspects of insns, they're treated like simple
> MOVs.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>



