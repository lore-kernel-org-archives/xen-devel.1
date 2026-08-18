Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65050C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 14:47:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394254.1633090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwL5Y-0003qU-DO; Tue, 18 Aug 2026 14:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394254.1633090; Tue, 18 Aug 2026 14:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwL5Y-0003qN-9R; Tue, 18 Aug 2026 14:46:52 +0000
Received: by outflank-mailman (input) for mailman id 1394254;
 Tue, 18 Aug 2026 14:46:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwL5X-0003q8-BK
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:46:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwL5W-0034dU-OJ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:46:50 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a847048-bab6-0a2a0a5309dd-0a2a45089ee6-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:46:50 +0200
Received: from [52.101.62.61]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a847059-f659-0a2a45080019-34653e3dda21-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:46:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA5PR03MB989630.namprd03.prod.outlook.com (2603:10b6:208:609::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 14:46:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 14:46:47 +0000
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
 b=uD9Xt7RlGqU8GFU79Fm3Hrg8JE5RbTbd4qGdOLP2ahG17gidM/nxJVjBcbGKjXyo/cXHSBS/riWE+BMYYQgs+hCVE77dmeLbJCOmhLdXxZ8RF9EYZDUKLB/xbR5YuXoXL2yEFexD6AlScM28SvXFghf7/cwM4FRetVPBVEBOngOmCwLfe4DMfve82oJyJZTuq5Au7yd7OyTanH4Z9AMahzaVP9KyEVLN7jqxW/oCH6hgOLocxDkOd9CdEFyvn87gKEz0Sj6Ez/e7AmIE4fxsnAZF5lIeRqsN9lSXTModNc4IedZdCb1q4Y3o4ERrm/NX50l1WPZuWSxsbFL19BhVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUudSj6anH+iJ8NvmFFxyu2/+1c5djuuya9xz5CiJN8=;
 b=iJjpoTOHWlv6MXMBMimN9ZH0PILVMdei4gAxK0ESwrDBaDOiHj9tZDgpzbjSRkwMffalRfWfiWHzZxfJjL8O65wr3XjbOpvvwj9sBs1M5vwssgKxoozSnVJQsGv2VJAZ/ht5QBCdUW4xCn5rxmYLOiMdZXmt4HczXs7duc8Y6WjuxNea4JXw81sPbwouP8cqc5ieqsvU/S64ALz9NrG0teZWAOZoGXfgFhYM+clXM7cVY3xlPIWsbxBWT6bXsY30pphxjOF8SXO9xL8KB1QfKA9cPPTtlYAs8WTjttGzj+aikwZIKX0OwI1hWHqYDuwmB123Io7fzcC3eaMsN/G30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUudSj6anH+iJ8NvmFFxyu2/+1c5djuuya9xz5CiJN8=;
 b=BDlEP3WOwUM7kD0dPxZ4wdpNOClB+B0U87NitgiscXVpWCFzTUhq8z+4ZqHK8mYwIpHKMnObYA2RbZuqPPOeXrk7gkVDr9Iaw+tpJQfXmbIBVggiQFwQHxnfm1j94n6qB2QH9kzV5mjOy9m+X24HLJ7qZgpp1qv7RvvKvy3I0tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <07151e7f-3179-4432-b7fe-e70890f1ba4f@citrix.com>
Date: Tue, 18 Aug 2026 15:46:41 +0100
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7F03E2BE-44A0-41E9-850C-8480CA0C8F0D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA5PR03MB989630:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bb7a56-a21c-4cc3-d620-08defd378751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iUp/UtTXJWkPASoapwdMFRrZw85rM37nzgWsGJv+YXMGe2MiUhhmRMuJ/pONIuvT90IF6TeT4D/2coWZP9cuHYLooEodm9BmnuG7gGr4sdm1jcr6aVyCNlMVv2X/gG4ULOw9OWaZ9K4dXUuE7jQzw/ldJSPrvW9HbELcME8z45v07oWRitQvvTyW565WJV/p0PwHRte1+V29x+D5WnR/J0QiC7AI+XEVKM82b7jk9wbCaUKboNnlzf+uwrmbawj1WjUlJrauaTdG5tXrwbHvSLxwKFeqpBPoYs1jBP2Gb/u49oSTYVDauaaXmTtiDynSbAnzvQnolb4kPMZeOHR2y0WiDXxQWGuNUsCI403pbl3azebXZYfFs3FaCEb1iKUQvOVNKqFY2ZjtPiTdq6eAxP/5auw25LHWa1QKztg8Qi/p7kuFy0sREYuqcbLRy6arwz3Xpbk9LKkWrgAC+ok+AXVpAwaDmn7SU4IY1uS4yHNciykJ5gI31DiWqjkBVUEFgqK8VgNPqDXKh+cK8xxt3m1FVkZu+bYQppUKcaQIQGzRPZ8HT1zVvmME1cFzQscN0twU5L2x35q8Blk8pA/Josg3mZX7Vav6LOR13JuDdEj1fzKliqErSMQXCZ407gBZuumQwdW1OaaKQzP+ZmuglwM91rMFq9aSuXizDjIu7ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjNzL1hlU3RudERlZTFsVkpIK1NFRUg2TEQvR05tT2U1VnBoRW9NNDZ2Snlt?=
 =?utf-8?B?V0p3TURReEhPNjJrVjhRZVVjS0M4ajBnZjBHTStNeS8weGwxTDl1a0FBYWwr?=
 =?utf-8?B?WTA0Sk1HOXJ0d0ZEN3Y4TzNXZTFpWWRzNThQd0dMa0MwUHBnYm5ISDlLWDYz?=
 =?utf-8?B?YWVzYnBhZGdBQVpvUzZUbFFpSEZ1d0l2bi9NM1ZQUUg3cHBhcTBJVnlYTC9v?=
 =?utf-8?B?SlVkRXFRM1ZON1Jnem42V0ZKWVc1by96L0hTZVRIYm80OU9RSnFBeHpMeDU2?=
 =?utf-8?B?N0JMTlpaSW8vSVRkUmswSmRIcFcxTnI2c1pBdUZTOGZINVQrYk1wSkUrYzdL?=
 =?utf-8?B?eE5TdWZsbStKOHV2b0JrRC9PU1BEM1F1OGFUVGt1bXpkWTZGSWNRZ2xGYS9V?=
 =?utf-8?B?OU5ST1l6N1kwalJ1c0FQMFlxN1I2R0JjMGNzclpSc25xNE5HOWRWWk5DYm5w?=
 =?utf-8?B?OUUxelRpSFNzYXd4WW5ZTlhNcXlSZjVIRWp1Z1krR29vL3BkNzhtWVlHSXZn?=
 =?utf-8?B?cVNBMGwvRDJiNVp4ZytOb1A3QWFGblBLbExGRUhjREtxZ25QSnlsZDBrQklO?=
 =?utf-8?B?T0pGc3ZYaWZKcFNzVDlkemx1QTZFUHJ1ZEc2OWY5MjdIdnFHaHdPdTQxVEYv?=
 =?utf-8?B?ZVp0UXVMUkIySnBBd1dWaCtlVDIvVkpNcFFBemRXVXZBM2NOV3p5cS9SQzdV?=
 =?utf-8?B?VW9IdXExNkxVT0x2eGNSMDlnOTZXZURKNlhsMEIzaFRQNFhuUjBMbEhjM1NE?=
 =?utf-8?B?L0xsU01jaEliaHFETUNnWmdRaFR4OHZQTVo2anc0U3FBUFR4R0JCOGY1RUM3?=
 =?utf-8?B?RTB6dWZuWXhadlBQZllmc2pQVXpjUEdwdkE3Uk1vNVJvbjRhV0tyWDNpUzEz?=
 =?utf-8?B?ZW9tWU1xZVQ2UmpCV0JVSnRqd0JXMHFPemZqNVBZaUV2eThSNEpteGN2Snpi?=
 =?utf-8?B?dTZNbnVDVGpEb0IvUDVrbXRMZjI0VlRzbE9XeXBQRjI0MFJkbVMrcjZRQXdz?=
 =?utf-8?B?V3Nab0hGL0xsbE5sUXhTeVh5R2ROdVE3UGJUbU5rOHdCUzlpQWZWaTRBdzl3?=
 =?utf-8?B?dG9DTi9kMFFValZGU2NsVTNtcWZ2UUNDaTFOK01nYjBqUzFhdFBxY0NtZlha?=
 =?utf-8?B?Q0lLTS80dzFWZXEyVUN4aDNCbk15YXF4QXBZUmJ2WENjRGwvU0g3WmdjbU84?=
 =?utf-8?B?UW9jNlRLTEdXYzIwVTQxdUVlclpUNXBMMTVYU2VpalFJSzB2UGtxQmc4SEt3?=
 =?utf-8?B?S0srSVJ1T29sNUpEV05ISGJZUE0rTzZsbW1DNTRXV3BpVXZTNlBFMncrampM?=
 =?utf-8?B?VlJXaC9lNHJPV1VqemdmYU9vWVVoSFVFWW1TWjBwQVc4L2ZPNVZicUJCZjY0?=
 =?utf-8?B?c0NDRmpRWkVDU05xRXB5Zi9pRWJ0enlsT0tMOFhaYmtRUHJPYWNyWDVqbEdh?=
 =?utf-8?B?VEhqRVZWc2d6V2NZK0E2U2c4dHJOMHNDVW5GWlV6VW43TTluMng1eWNObjY3?=
 =?utf-8?B?alJpaUNzd0t4dWZmK3JEVGorOWxldDVkWTRlTE1vRWgyY0twa0ViVFpxMFNa?=
 =?utf-8?B?THhCRmU2NGJJYUVZWmlVM0YzSzBKR1ZzQk4zU01YY1BXZjRoZlZKYXk2UEdV?=
 =?utf-8?B?bGhnYkJuU090ZWZ4RFhWZDE2Z2tNbGNoamprYlVkZWlnS2VSbzlhU1M1NVZu?=
 =?utf-8?B?SEZTVXBvclNaYzFRUGtmalYrcFdpWnBuaHN5ajdZT3FvYkJQOUNnNVRnYjJz?=
 =?utf-8?B?TzVqbTBDY3R5ZXRQMHZDWk0zdXdEeTFzOFNZak5jVDIwa084K3RkZnU4U29Q?=
 =?utf-8?B?Y3NmRUFabTFVeGd3RmJGWGkrOFA1VzFzWno5SXBNOGpvdWhNRzVpd3pRY1Fk?=
 =?utf-8?B?NC8reVUzSXFTYlFpNGtKLy9GRVJEUFYrZUh2bGZHckxpQzMyUGJYSytQRWpC?=
 =?utf-8?B?dWxJZnBmdEJKUmovd1JxdGp5UnMwS2UxNWNEQ1ozbXQxazR1QW5YcUxGYXZF?=
 =?utf-8?B?Yk9NNjE5ZHhUSkIrR1Njd1RiRkl2aWxraUUrelYwT3liRHRwUW5QWXQvUm1m?=
 =?utf-8?B?YkY0OW1iRFpoSjkyTW5GdDlkd1ZlRGgwTkkyQ3FLcExJOGE3ckVqaVF1S2xK?=
 =?utf-8?B?RXlEazJoczZPMjdnazhtOXdHZnNzbVB0VCtSSWxyMHJLU1UwaW1mNVV2bUo0?=
 =?utf-8?B?VDlpL25NaVUwR2huNXBubmpHYzU2VE8zWC9pVXg4RnlxdS8zUkhhd2RPSmxI?=
 =?utf-8?B?c3QyLy9sSStlS0hyejV0QmtLNkdCQ0FJamZLaSswM3BoN2d4UEdlOXVxSHdl?=
 =?utf-8?B?bURTMDU1ZzJIaXJBc3BwN1BnaXRXeXhHZ0krcU85RGhDbjhQc3pTZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bb7a56-a21c-4cc3-d620-08defd378751
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:46:47.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wBA25HXjbVVtOlmro0hs5gbYbH/M9FQ2qE/YbgxE2cIxCLxwG1N47GGvLRyivF5DPRw5y18LVzPGR2Rgl4W9q/FnErQGMvYOGokptrH/Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989630
X-purgate-ID: tlsNG-c1860d/1787064410-D715E87B-8EA4ADF3/0/0
X-purgate-type: clean
X-purgate-size: 3078

On 18/08/2026 2:28 pm, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 18 Aug 2026, at 14:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 18/08/2026 1:16 pm, Bertrand Marquis wrote:
>>> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
>>> possible vulnerability.
>>>
>>> ffa_handle_msg_send2() copies the message header from the guest-writable
>>> TX buffer before validating and using its fields. A plain structure copy
>>> does not prevent the compiler from re-deriving later field accesses from
>>> the live TX mapping.
>>>
>>> For VM-to-VM messages, msg_offset and msg_size are validated against the
>>> source and destination buffers, then used to copy the payload. If a
>>> sibling vCPU changes the header and the compiler reloads either field,
>>> the checked and used values can differ. This can cause an out-of-bounds
>>> read from the sender's TX buffer or an out-of-bounds write into the
>>> receiver's RX buffer.
>>>
>>> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
>>> default. The audit ranks the likelihood of such a reload as low, but the
>>> C semantics do not guarantee that later accesses use the stack copy.
>>>
>>> Add a compiler barrier immediately after copying the header so that
>>> validation and use consume the same snapshot.
>>>
>>> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx-buffers-ffa_shmc-ffa_msgc
>>> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> xen/arch/arm/tee/ffa_msg.c | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
>>> index 1eadc62870f2..39f561c8237f 100644
>>> --- a/xen/arch/arm/tee/ffa_msg.c
>>> +++ b/xen/arch/arm/tee/ffa_msg.c
>>> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
>>>
>>>     /* create a copy of the message header */
>>>     memcpy(&src_msg, tx_buf, sizeof(src_msg));
>>> +    /*
>>> +     * Make sure that "tx_buf" which is shared with the guest isn't accessed
>>> +     * again after this point.
>>> +     */
>>> +    barrier();
>>>
>>>     src_id = src_msg.send_recv_id >> 16;
>>>     dst_id = src_msg.send_recv_id & GENMASK(15,0);
>> This does look to be adequate to fix the potential issue, but you should
>> drop the ACCESS_ONCE(src_ctx->guest_vers) a little lower down.
>>
>> With a safe copy on the stack, there's no need to further inhibit
>> optimisations around it.  In fact, it's unclear why e040b94d0fff added
>> the ACCESS_ONCE() in the first place, seeing as it was already an
>> on-stack object at the time.
> the ACCESS_ONCE is protecting the access to guest_vers which is not on the stack
> but a value on an internal context accessed by all VMs.
>
> You probably mixed src_MSG with src_CTX ?

Oh, maybe.  Those really ought to have more distinct names.

~Andrew

