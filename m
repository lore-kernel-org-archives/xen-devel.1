Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C9DC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 10:57:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416345.1645414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ywP-0007yJ-G4; Fri, 11 Sep 2026 10:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416345.1645414; Fri, 11 Sep 2026 10:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ywP-0007yC-D2; Fri, 11 Sep 2026 10:57:09 +0000
Received: by outflank-mailman (input) for mailman id 1416345;
 Fri, 11 Sep 2026 10:57:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4ywN-0007y6-Sr
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:57:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4ywN-008BeG-4U
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:57:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3de7c-2eae-0a2a0a5409dd-0a2a4502857c-36
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:57:06 +0200
Received: from [40.107.208.28]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3de81-6ca4-0a2a45020019-286bd01c7e09-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:57:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSVPR03MB989240.namprd03.prod.outlook.com (2603:10b6:8:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Fri, 11 Sep
 2026 10:57:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 10:57:03 +0000
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
 b=bQ6jLbeF8MNyBrW/bsvqauCr1W1CDC/Gn9TEYw5a8/Ehm6ZGRLMi3EmtN+0KqveV8VbyFBfsVZpK5G45Bjpc1XHJQxS/Jnz8tI4O1j/wNw6YmcYvwJzUpX8z/TFZYn5nREHj79LLM6DojF9wVjktdWg2Djq4gBFzYsvp80mbbnMlYmdzX4mMAMhCXEGb5qCmyfHzfdp4qy3Kug1AdTbnf/g73L+9JEJM6osMU5r4/G0jxrjNKkzIAP2H8mI6BA/g8C/3/SVBdlmCiNd/fWeCFkL866MNm75Sk1IluRs9PNS0XMOEwdTaOqT4MqQmChiV1ckEMLxxk+mwGH1gjbbELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nljzzvqJPfRDHGVDkaJ1LYB8iAC199hjhwim6D3fWf0=;
 b=nryx0qu/bW1R/abONW8njdgiuPdMSk9M0M0/x2MP6ckUDZt7tdUJoRDsgkCrmxGBg9fXzyctWMR9anYi95Yi3Tl0kg5ZiBxnAXb04EEPHjPM6Lc9Z10MEGfWibt0U6K+LYjjZSNurAYNHZ3E2iKT+mES7WxmFrB2kf8TwNATnRHg+4azxtn/+ON66XyuBwaQxkotE/aXa37/Hp/YFMJkYr9g3mxfzWHvwLuu5ubpA+qG+SvKMbZd2YovY5CCDzk6CbonrMl7CjSrKEyDe4zkODTA/IJOnOkgMsUPiDWbrTdg9DvZPm3Ru+FcTdcqMpOz4HyR+ikNLLckljkbTAuIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nljzzvqJPfRDHGVDkaJ1LYB8iAC199hjhwim6D3fWf0=;
 b=KbrYMBZd/aoCEcQx+slqPY+sIOJ5e3dkFeHy5EFPa2axecLP1M6yit27FzM12AfbC+iySoZk/CxzVNapjiImWw38KHVd48SjDtH2ppg967d2DoKKSvj8RbgnUbGBljMZSwXCDtVleSx9zjLD+5EizbSgOW9EOvIgVs+XUCX17P8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d064ccbc-c414-4be7-af1e-e8b0c39b136e@citrix.com>
Date: Fri, 11 Sep 2026 11:56:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v1 5/6] nestedsvm: Fix deferred event injection
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-6-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260526124027.573412-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0622.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSVPR03MB989240:EE_
X-MS-Office365-Filtering-Correlation-Id: 12555fc8-b981-4804-e577-08df0ff3697e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gqduyZYcqV6WYFNGv2GYNR2KcncSZFGbBqOSysegX1TM+U/YpUI4bu7PRv4h2/A4umpHdWyq4Pt2kwH2MQ9V7IQILb1WULgKJCIvgJXVrMl0I/EVo/bJYE3bdxTkPaVzhwXeaXxDiTf/AKASube6EqsArmHwC9td0SUNTs3R5WlAV0cgRQK+oTqN7DbK1ORwpPjxVmxGkZo5Gy5jYYsH37MHl3D3wK1yCWx2PqVH1P3tVoFJGnSE1Uqt9Q1GdBPnROUmKCUqMGw1k/OZtVA3MeNyBynJoPfsvVwA5qaUP2bBCSBQTjKiqwTigFrfGqDbtH77Y+xd+h8Z71hnxcBDURKUmj7GJSHFUwn2ubDBHfopX6z5AvkyzyINp3zNGMz4AAstfuatyIt1oc6/eiy2sPjiPXMP765dSRmYA9ExvDzDKF3a3vl4U/8x4jeJvF2tqxDg1w3LX0QjgJvQWGZC/QPCODvIWune+o7JGwKsd30qm2+GmrSKQ+UkwcM/UvfCUQh04Y2f8INEpw3D7g8bUqCGxj900wVW4ulgbs2fm/FWUNsCUOMDxxnj3Exfr/WsdZHjY1UzkTQF2Joau+aP3LMyYTDIpCPGRGsxlLS6q/fE4aFxbcx0ae/dVhg5kenjg41BlsyxqGW4aM/ZBjc3pv4zff83LEHm1olsPdjGthk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3l3K3lxR09mK2NrWXJ5SXk0RmtDc1BnaWFqbFZZSFJVRDRJdERncnBRRkNL?=
 =?utf-8?B?UDd3K1krR25sRTVYdjdQeUtGMVYrbjJYYTNuNW12NFUxVnpPMnhiSFJmK3VY?=
 =?utf-8?B?MlFZOHdrK1BRT3lIaXdyZnk1emd5Q0NaL2w5U09ReDZSOUEzVWs2UGFNcmlF?=
 =?utf-8?B?MTJINzhGSWl0d2I3SVZ3aEp2Vmk5d1hWWDFiZU5OSGZPS0hWQTRpRXpxbEk5?=
 =?utf-8?B?UldUc09QK1grdlhjbHoxd1dEU05sM29ROFBIQlZvei9oUUxVVEVrdXhKamEr?=
 =?utf-8?B?QkpUVTdTV0JuYWMvQWRXaGNkU1B0UkpSWGpNQ2FNMFlvYzBheVlXTGdiL0xJ?=
 =?utf-8?B?UGdsSFVNRVZhOHZOUzE3aGNIRHZWY0VSREpTdXhlWVFvTFRTNFA2TDk2c1dK?=
 =?utf-8?B?c0U5TE9UaTVpL2t5cnFNeGxkMUJjZHUwRzRMeTlvbnNGc0o3a3hwejJNQW4x?=
 =?utf-8?B?d05ReHJkYTBQeXZaR1J0eGdoaTJQbDZTbGM4SFRPTytoUjRVV09tZVl4RlIw?=
 =?utf-8?B?dE9nVUtmNWRMNDBPWTFhYWRjcnJFdG1TcDRuSTkyZnVScGNEYTR6L3VSOStZ?=
 =?utf-8?B?dndnRXpBNU91RGVUTWN1b2tYVTh3elJJMUx5L0x6UEJ4cHVKeGtUU0J3Q0s0?=
 =?utf-8?B?UHB0NmMxeVk2dGpSS3UrTDBnZGxFem9oRjVYVHR1aTNoU01SUjVFWVd2eTdD?=
 =?utf-8?B?bllCVDlWODR2QkM1VVZncTJqdW53VGNNaVVMZ09HQXBIdFhFQVdkOHZkNHFh?=
 =?utf-8?B?NVJKcHNESXllNFE5VHRyYkpJMFhreVg4anJvWE8zQmVVRXBERXBITFdjbUI1?=
 =?utf-8?B?bVcydm0wOGlDOTFoVnJrMXRaZGR5SFdiNjZZdUxZNDFFSnBUaDFBekx0Titx?=
 =?utf-8?B?WHloZlhLdE9GRklxRDRuSlNrb011R1BwTGNmZzdrN0RBWThZNVgzbk5aeDg1?=
 =?utf-8?B?VE5lcVhpbG91OW1tczJwSnFSNU8vWWp0NWZNTytRTFIxVk1iTTJKc0RXb2VS?=
 =?utf-8?B?eElweTNqRnY0L1d3ME1ndnhJenJ4amRLWGJsOEFIRkJDc3IrbG1GWE5BMlZK?=
 =?utf-8?B?T20xOWI3MVU5TVRBS0IycHZ4NzRLa0szM3pnSHdGQUpXQ1ZHb2dpSHpHQmxO?=
 =?utf-8?B?SjlKSS9PQ1ZNeWFXaGkvQldiQ3VlemZWVVFUemZLQkxXdTZCSDhBVCtheXIy?=
 =?utf-8?B?ZmRWU3FqbkxMVU00dGljbmZpbExTYS8vcExvN3FkT1lHYmVmbVpxOFRwNmJj?=
 =?utf-8?B?U1FPbURyOHpWSGV3cW9BZ09tTUJLRUdiaXUzU0c4ak84dkZBbUtwa3hFenNH?=
 =?utf-8?B?WTNCTEVUK0JnZWwya1pUZlh0Q3BRVTNibGxrbUV3dUhKUEd0aFMzZTJaQzlK?=
 =?utf-8?B?T2VmMVNxTFZhWnJRblZMTUlZQXJrQjNvMXhkeHVxVUV0YnE3MGRRMGVRelNF?=
 =?utf-8?B?UUprL3FpQjRIL0g1ci9VdEdidmlMVFozR2J2RS9zaHo3djNYcWRvbVpjLzFE?=
 =?utf-8?B?RVoyK3IzWmhtelNRVlE3RkJxWWgyUGprK1M1c0M0VTdxLzFiZDVmb3lUQnNy?=
 =?utf-8?B?TFk5NjMyWXJuVHQ1NG5teVIvcVlUVElFUUJiVk9GZU5LQ2xkRWlOVHFNY013?=
 =?utf-8?B?aWRiTE55ODY5UStWdUlPSGVhOENlM2k5OWpXNk56bjVMQlJIV08rM0RkNWls?=
 =?utf-8?B?bWRXc3hCTFVSNWhzWU94SDJmdDhURnMycVBZMUF6R25hWkpTWXdIcU9wdkIx?=
 =?utf-8?B?U2wyNXprbGZCNUhESFdsSzlqaTJTN1VHZmZxaXBVWERBdWFjSzRkbFEwdmtp?=
 =?utf-8?B?MkQyaWFqUklsMmxZODZUVmZYQzAweFIvYW81WDl5aGw0aGVCejFKRTJURjRt?=
 =?utf-8?B?ZGJ5RHhVSXRKVThpU3h6RTBxT1E1a1dUdDVHOXp1VExsaGRwNWJNZlNIWEdu?=
 =?utf-8?B?SHppNlhTWEtPRWE5QmxTVlhrSjlTa1ZlM1dJRmhtSERySVBsOERCdHBEMmhD?=
 =?utf-8?B?WFJIcmlrc3ZvUFRJeHlraWtIN3pJcm9zaGRuQlV3d1ZtV29EU3dwam50MUxG?=
 =?utf-8?B?SEJHN2pXMnh0cU9YeUdpU1hhZTNsM0dMY2RhZDdJMThtNkhmWGlDa05GdEZW?=
 =?utf-8?B?SkRZWGxtdEl0bVdYM2dZTWozS01kcStPTU1TNGpRM2YySEdBQ3EvZ1FiWG5P?=
 =?utf-8?B?aUJuZlV5cEZnUkhOUVY3N2xoSU0rbUk0UUV2NUNJU1pDd005b3hFWThhZ2Qr?=
 =?utf-8?B?YnZGdFp2SmZxcFdYUTJXSHdvMldCLzBJODhxNkZ2anlNdWRHb0l4Q2xweXJU?=
 =?utf-8?B?dWtzeTM0VS9MQlhpbzc3dThEcGlKbVp2amJjQTBZYys5VGdiNVJFQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12555fc8-b981-4804-e577-08df0ff3697e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 10:57:03.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmXFk5/FI3+Y2LOeDBx/1V5y+/RbIX3UKzZ7Dtn/7q5VOasjAADLuN2ljCoDUrr8nMjP1kCwXuZP24aeUcWHO/LTH6MMRiIQOwE37bML5wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989240
X-purgate-ID: tlsNG-720697/1789124226-F0EA32AC-B8711640/0/0
X-purgate-type: clean
X-purgate-size: 875

On 26/05/2026 1:40 pm, Ross Lagerwall wrote:
> If an event for L1 occurs while L2 is running, Xen should inject
> VMEXIT_INTR and the event into L1.
>
> nestedsvm_vcpu_interrupt() and nestedsvm_vmexit_defer() set this up to
> be handled later by nsvm_vcpu_vmexit_inject() after the switch back to
> L1. However, the code there appears to be bogus and completely ignores
> the source/vector set up in the first place. Fix this by using the
> values to properly inject the event.
>
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

I'm reasonably sure this will be unnecessary when we fix the underlying
problem of deferred entry/exit.

In the meantime, while reviewing this I found a systematic naming error
in the code.  I've submitted a fix separately.

~Andrew

