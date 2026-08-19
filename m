Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F5C5DF86
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:22:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395089.1633613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdQc-0000IX-4H; Wed, 19 Aug 2026 10:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395089.1633613; Wed, 19 Aug 2026 10:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdQc-0000IQ-11; Wed, 19 Aug 2026 10:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1395089;
 Wed, 19 Aug 2026 10:21:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwdQa-0000II-8o
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:21:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwdQZ-005FBj-IM
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:21:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8583a5-e002-0a2a0a5209dd-0a2a4506d530-40
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:21:47 +0200
Received: from [52.101.201.7]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a8583b9-195a-0a2a45060019-3465c9071ed0-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:21:47 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5932.namprd03.prod.outlook.com (2603:10b6:806:112::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:21:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:21:41 +0000
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
 b=b18fZ6NvL13GfiV++LuEFXAHeYsfQFrnW7hgoehhBWcab+vKCNWsIK6hWREz5UYcCMOX/mZ896Irb+/O8AZlFF6d34u+jNYmhUngz5iWjn0Lx6jKlYvPQre/0806vDBo8Uhn/HBTpTrt+GZMmTv7zyhbswwiYc0xtnlueb9mt2dV1Ts7/Lzy8utT5pq9tln4G1ph1VU/YYa+ijWl8BwgVM3jeZcHo1ZA7lifuYGCfytW+5bN6dNKjuEmlFyzgdS0gEW8jwwIBoaXNuzLc+EsDrW9AxSkLoRezDCHc41zM8Zvk/ynO2Pnzm/n/l0blsJXx5yREXR2gJPJUeuglp0+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAt/SvYtKyriI70B6z8ahBIYQKuGuOFtO9aN5yUVtUg=;
 b=itDni58PPp5Nv8IQOHEOBe0C62bEMFycjfQaeUt4bfMeu3P4ZigZ4ZktZqmcsoSxHzFg0PMeQHcGcW++cFsdv8DE/v+fQe+8JS8oLEaRWKNFMzdHROdkedW5DbXlZ0yU+L5yfvtGlq7F/9ILuyGSGKzpVYK4nAZShwKUgh9jaMnN8Tmd7I88mZwe2yqhatypT41kGh3BX2a6S7J+ExOjK10ZsjX/tk+v5YmFSV2sMJqnMNYSU3yc4TRx5pG934Vm05QtwvLNce3oQV52P3PNNcCDgg3gOEYY+lk2toYXYh5+atiE8upMc1gYl5B03zD34hLSEJTmwBjRcaDtF6gfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAt/SvYtKyriI70B6z8ahBIYQKuGuOFtO9aN5yUVtUg=;
 b=KaY/ThMcdXVwriURQX1FhapPMVIoV2JhQ+blX0Sx8UZQdTu+z6ZWhereFGSnhM7lDrqncWQ4WEYOXyA+NYAMUGLIpp+rCQzmJpIbm1myT68qGy2c4HCNMYZSoiaAWXu3e/2RHyWyM9eLeCQMDjwVVhVxERldSykf/7MuTYNpkT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ee86d60f-2dec-4944-89eb-f31e47930774@citrix.com>
Date: Wed, 19 Aug 2026 11:21:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Jens Wiklander <jenswi@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
 <d739485a-72cc-4518-afa9-8d2692a225ae@citrix.com>
 <7F03E2BE-44A0-41E9-850C-8480CA0C8F0D@arm.com>
 <07151e7f-3179-4432-b7fe-e70890f1ba4f@citrix.com>
 <57EE3124-D60E-485B-ACDE-4F9431BA7F3E@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <57EE3124-D60E-485B-ACDE-4F9431BA7F3E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c6bcf4-0865-419e-3b10-08defddba933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2BzYQm3+Hun69Sr7XYloNq4ch60Fd9FND2KE5DlqrshSMFQT0ob1i+H7OvF5fd1G/b3xBVVWH7hFb6MdVWljiIJJdoth2QJCi/hxKQsFkBI0sTrkojs6y6uud79FPGS2tph9oJPfI642zhxUsOVNSkiUWBctnyjlcD+89Trt8uVzbdiOPcuGYYo7SIHcQFc24ZmTB0tDH1N5Ggiba24RdPdba6Jc4bVH6uLOdJ5G9brHcaugl1QWQwJd8NgScJJRJRQ0TGBp5zeowjbAQ9OS/ZSPOUwjd8tqkGZ/OFZRHI6LaUA8IOl8im8zfMf8p/c65ShStU4cFrlhgpdoo0FGTwbQol45mv+XAbDDiFwpE4bPxhDBDUzVo9nfZfp+OaVN1Q8i8JRJWKlVkPh3buA0Onxnz294QqNg4BjvMu1jZ4B+GqtmYZIZJmhV0+xYuGFskWTOimdolXdOjFg+/lpo8NlBaY1Q7PSixKxbqbuXa+YIGJtfJDSXhpQHwFJas9LoYmzeu/GSzTFhuJBniNJiDMBv/7dB6LES2tsV12Xft6bFNtg0RdIjc2YN4jz8HH2lQLABz6Ech3fY2rXraRf1/+pyP/kSGCOn6ORzlqQFurbQVZQMvnaQbL/rz9JI/G4QuKfYdzmSr4Lm+kPPUTNqZtRf57TotLvtfSH+D6i6hM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEhYOEhaTmQvTTFPRjMyZXZYMDI5a0tGTEhjK1hHSDk3YmszNnJRNVpkd0xI?=
 =?utf-8?B?Y2U1czdLSlppM2R2Rzc1TGkvLzZRYk5yWEdmQWQ4UTVRUWFlTXFZbENkbHBs?=
 =?utf-8?B?NEFvNldsYmVyMUR0dUw2cEpDS0pkS1JDNjVQbWYvN1E4YU0zdHdyckNUTkVx?=
 =?utf-8?B?WFpPaHlBdDlxc3JOcGJXbzVTQTdVMkFvU2FjMmVBWWRINVJ1NzJydzVER3FM?=
 =?utf-8?B?V0VFUVVtN2Vac0REYVJVT3REcmJ6VHZHVTJhQXZIUFJkZUpNVVNITzJhMlFh?=
 =?utf-8?B?dWVmWWFBZzNudkkzb091VkdaNVEwTGExREFGdmpONGRUQ1AwVXh0aXBlNyt3?=
 =?utf-8?B?Qy9xOGN4a0RvVmYrVVBCNDdMcC9mbUNVdnlPd3lCRDUzQk9FTHBhdm9TTzZQ?=
 =?utf-8?B?ZTBXRnpVeHhGanJIWk9ROEhPSVZweGdlWnI3MnlWeGhzS1laeHFoOTNqVjU0?=
 =?utf-8?B?UUgvYkVXdFNkNXFkSW1GbTh0VkZ3Yjh5MVNSalF1MnRoSk1qMi81b2hGMTNG?=
 =?utf-8?B?a1lLeUcxeUNSMkNzR0xwTCswUWt6RmgwWDBhV29YczAxY1hPT2JBRkJ1VXc5?=
 =?utf-8?B?em1OVzJHV0pyN0gyaWdLVFd0MEQ2NWYzcUQ5cFU1ZkxIT0VtSmxyYmJ5WmI0?=
 =?utf-8?B?MS9oQTVnV3R6Z0hSNDAzektiRWw5amQvK1JER2pOWTJUZU1HRnlJUHpXZ2xN?=
 =?utf-8?B?Q0p5R1RlY0RkK1VmVmZuZk5qVmFxOEtMcTRmNVdEcUgwSTBBc2kwYmFEU29V?=
 =?utf-8?B?Mkpqbk1ORW9BODNqa1JqcWZHSzIwMVNCQks1aGlXdzkrTTVIS1ExY2NqbVIr?=
 =?utf-8?B?eFVEbnZmbjM3VlZjTFhONUcwZHBIUThqYloxN20yTFRJazg3TDlqdHlGK0N4?=
 =?utf-8?B?M2d4RGpyeUF5R3NiQjB5UWZuS2pxMnhMQWtjTkxUaXdtRVdyelRHZE91c0RH?=
 =?utf-8?B?dHpWU2xCd2YrcUFqK2loOXpQb2pMdmxIaW5NVnNIZ01CekFPZkdHRE1idGRT?=
 =?utf-8?B?amZnTzVKUnFBTDZyWTlKbG1WTnNLVVl3MDJFbnFuaHVRYzIvb3ZtTUVhUTVG?=
 =?utf-8?B?d2lYUDdNUGs0K0RHbXg5Wk5wVXRqSnNIV1VwM3VrL3oxOEMrVVFTZ085c1p2?=
 =?utf-8?B?WUhQSGZQc1UrV0IwZ0QyT09hOXdGQ1B0amQwb0diRWhXc2lNOXoyVWtXcjVn?=
 =?utf-8?B?UWtNSmVyME9TNW1mZ3p5UEdMNjd6by9jc2RwclVZcUEvYm9zYkZlcCtwODBN?=
 =?utf-8?B?bHRpV2Q2WEFDWVhpS28xVk1QYkNIQmVVSnFJL1huWUcwSDlWSngxeU1jRnZZ?=
 =?utf-8?B?SEk2bFBxNExoakxKWFhYd1V0amxUSlVadjIzV0puTVlMOFlYZW5ydzNRRFJv?=
 =?utf-8?B?N0ZBdmxSaXg1V0NhWm1RY3lRM2MrREtDM2xOVkZ3VW5DclYwMXdPTldzU3pM?=
 =?utf-8?B?clM3SlRaZnBQTTdiTE1KTHM0ODM3NkZpSDJWRjAxOHV1SjAzaE9GbVExU2RD?=
 =?utf-8?B?Z1RQbEZxMFBFMUNTeWZBUGlBd0srZlJ0NTYvUTFLREZGNlBTenF2bFE0bkh3?=
 =?utf-8?B?elNGci9NVUZZV0tzVXBHR2hOeTR4NCtuWWxsbXdBSy9zejFHM2JCeFJkTTB6?=
 =?utf-8?B?UE5kT2VxSmlYYTV6c3FmYmhOWWw1cmVTY1N2MWlpVUNjYXZwejFLVGtwbTdO?=
 =?utf-8?B?MmoyclFjSFZ1M1dPdHo2NmYwNlIxYU0za2NoTXhWM3lxazBVWUF1akVLWlBZ?=
 =?utf-8?B?a1I1TmFoS01QeW5wV2lGQ2hTZXN4N3JPbnRHZEFDSTdVK3gwTlVQeUdxTXB6?=
 =?utf-8?B?Zkw0WWJ4dmttTlZBNDZXbVNBMmE5YjNtLzF6SlU2d1FRb1pJR1ozU3g3ZGdT?=
 =?utf-8?B?Qzc5OGgvb2hIVytyN0tBMEE2eWRKblNIbkhhcFg0cFlVN2dNUzV3OXVUNU00?=
 =?utf-8?B?WUVrOEg1NmxNeTNnZ2lmVG93UzF5QTVZWnF4UDI1NTBEblVpeVoxa0plcnlj?=
 =?utf-8?B?Rm1Da3BjeGg4dmlXQ3BaYXhHVHZoYnpMcVF3dUpKNDUvWGZJNzJFenU1cEpU?=
 =?utf-8?B?Zm5FSDJCd2ZUTE0xN01VZTIzSFFWUUhhamFablBhWWlMK1NBc3dqcjJ5TTVs?=
 =?utf-8?B?WEM3cHE4MGlxQmtFMFNxbWtrZFFPR09oS2NlWWlFSlZpc0hKa0c4VDNSOS9y?=
 =?utf-8?B?bEE3NWVTWVlFdGkrNlFyK1pnVDM5Z2VNa2JPSVB2SHdaVHpJYWhSamp2dndX?=
 =?utf-8?B?dXhmalZ1N2NBZEJNTDNacGN2RHE3QnNTRmhoZEdkMWVoaVRMY2kvekE4SnBi?=
 =?utf-8?B?Q3lWQjZrTXZjTDBvSTNTSmV2QlNvS1dBZitNdi9DVnlQNmZ6d21XUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c6bcf4-0865-419e-3b10-08defddba933
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:21:41.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTPrnmEQa73oNzoj9BreeT9WL3quuo9QhQj6rx6uQaZLPcAzvIxukwgh0Z267IStFrufCBetel5R4O6f+WhD/EZUD/cXNhPMEaevBdsmHLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5932
X-purgate-ID: tlsNG-16d1c6/1787134907-F70C777B-508A3F64/0/0
X-purgate-type: clean
X-purgate-size: 3609

On 19/08/2026 7:39 am, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 18 Aug 2026, at 16:46, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 18/08/2026 2:28 pm, Bertrand Marquis wrote:
>>> Hi Andrew,
>>>
>>>> On 18 Aug 2026, at 14:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>
>>>> On 18/08/2026 1:16 pm, Bertrand Marquis wrote:
>>>>> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
>>>>> possible vulnerability.
>>>>>
>>>>> ffa_handle_msg_send2() copies the message header from the guest-writable
>>>>> TX buffer before validating and using its fields. A plain structure copy
>>>>> does not prevent the compiler from re-deriving later field accesses from
>>>>> the live TX mapping.
>>>>>
>>>>> For VM-to-VM messages, msg_offset and msg_size are validated against the
>>>>> source and destination buffers, then used to copy the payload. If a
>>>>> sibling vCPU changes the header and the compiler reloads either field,
>>>>> the checked and used values can differ. This can cause an out-of-bounds
>>>>> read from the sender's TX buffer or an out-of-bounds write into the
>>>>> receiver's RX buffer.
>>>>>
>>>>> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
>>>>> default. The audit ranks the likelihood of such a reload as low, but the
>>>>> C semantics do not guarantee that later accesses use the stack copy.
>>>>>
>>>>> Add a compiler barrier immediately after copying the header so that
>>>>> validation and use consume the same snapshot.
>>>>>
>>>>> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx-buffers-ffa_shmc-ffa_msgc
>>>>> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
>>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>> ---
>>>>> xen/arch/arm/tee/ffa_msg.c | 5 +++++
>>>>> 1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
>>>>> index 1eadc62870f2..39f561c8237f 100644
>>>>> --- a/xen/arch/arm/tee/ffa_msg.c
>>>>> +++ b/xen/arch/arm/tee/ffa_msg.c
>>>>> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
>>>>>
>>>>>    /* create a copy of the message header */
>>>>>    memcpy(&src_msg, tx_buf, sizeof(src_msg));
>>>>> +    /*
>>>>> +     * Make sure that "tx_buf" which is shared with the guest isn't accessed
>>>>> +     * again after this point.
>>>>> +     */
>>>>> +    barrier();
>>>>>
>>>>>    src_id = src_msg.send_recv_id >> 16;
>>>>>    dst_id = src_msg.send_recv_id & GENMASK(15,0);
>>>> This does look to be adequate to fix the potential issue, but you should
>>>> drop the ACCESS_ONCE(src_ctx->guest_vers) a little lower down.
>>>>
>>>> With a safe copy on the stack, there's no need to further inhibit
>>>> optimisations around it.  In fact, it's unclear why e040b94d0fff added
>>>> the ACCESS_ONCE() in the first place, seeing as it was already an
>>>> on-stack object at the time.
>>> the ACCESS_ONCE is protecting the access to guest_vers which is not on the stack
>>> but a value on an internal context accessed by all VMs.
>>>
>>> You probably mixed src_MSG with src_CTX ?
>> Oh, maybe.  Those really ought to have more distinct names.
> No worries. 
> Would you consider renaming them a requirement for this patch? 
> If not, I would prefer to keep this fix focused on adding the barrier and avoid unrelated churn.

This would be later cleanup.  It definitely shouldn't be part of this fix.

~Andrew

