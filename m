Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC76606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 04:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rrZiu1S/
Received: from list by lists.xenproject.org with outflank-mailman.1464143.1674879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMIEA-0002OH-Tx; Thu, 29 Oct 2026 04:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464143.1674879; Thu, 29 Oct 2026 04:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMIEA-0002OA-RE; Thu, 29 Oct 2026 04:59:02 +0000
Received: by outflank-mailman (input) for mailman id 1464143;
 Thu, 29 Oct 2026 04:59:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xMIE9-0002O4-4s
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 04:59:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMIE8-00D1rS-1f
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 05:59:00 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae2d22e-bab6-0a2a0a5309dd-0a2a4501962e-48
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 05:58:59 +0100
Received: from [40.107.200.12]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae2d292-5984-0a2a45010019-286bc80c7086-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 05:58:59 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 04:55:54 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 04:55:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrrEddOAundabNM5EEMCGG8x26bfMiAgdSAcVKK2hJIsjsn3sultXySypC9+Y3XyLFlHWp1Cz4mPK0L7f67j3MONZPr5D/NPM+8MVIGYafQOwBJ9Plldc5rwkxjWEvKIBTXYi5GxUGsyxhLhbL54wal7BvIUmrKNtv1znp63LzAUQKyLQvb/QpB3RxzIakXxji5qkjfhy3qYvyJRIEEqJduHoGI165slu9Q4Z3TO0RC/y0gdMJY6yYChwfQebBPAebSfjuoabIW1CRGshj/vfSntRHH9hnF3Gauf+SU8S8XXFTgV99hCudpdOPWceKmJJaxKsPhi+GUQWmpxRmda1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTMKhlUDo+SOon0xuAedhYFCaX26pCDUixJNJEEiruw=;
 b=RUeQJvAZGhVc0NsW/yN7bLSa7kxbHZt29fwecbVr7I6NwwVLPAH2froYv10+wb8uru266BQ27dk4iETdg6XIMORva0QpIco0l7mxgXCZYjsvC0ywfh5vDi/zc7OcG7dW5ss25VfT0ieMM7JWKxZfW1U4oPv66tSIuPuJBg+hNbdGaEG87FhYCkZNBt147JJD/yuEX/9cEiu8lugEWcTt6yTVWmSI3A4GL1tTBxbiDLjMOIlNMYfFI7aleI1I1D8+GePRYl374XiOqlzfUAkHUHmGXUYbO9LLLBYRHRvfFZdIxQtT5g+1XsWcgXhSSqhdT3W1dHFTxo7JJhJ3tn+nzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTMKhlUDo+SOon0xuAedhYFCaX26pCDUixJNJEEiruw=;
 b=rrZiu1S/T5yuWgSTn42c8wRRpJ/QIb+CKqe0tPPnKFUlo3859gv/6bKNmGfVbfLOqW3/FWlf+nDsyra6lSK9N9fq/YVwu+F1QOyMA2Q8wLZFjfR7dPF/dHNdikw/W8ATg9o1R6a59NO8ZZgvdzzxxjVrXJ+gsiuP+nItI3ZUuKk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8fe9ceb1-7418-44e1-ae9f-cc03b872b3a2@amd.com>
Date: Thu, 29 Oct 2026 12:55:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/typesafe: don't brace-initialize a scalar
 TYPE_SAFE value
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261028050336.2549325-1-shuaidong.chen@amd.com>
 <0af0a00b-4f9a-4584-ac5b-554ae00e692e@suse.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <0af0a00b-4f9a-4584-ac5b-554ae00e692e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|SN7PR12MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dccb8b0-26d5-4bd9-0054-08df3578e8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|7416014|261026140227099003|5023799004|261028144727099003|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261009223027099003|10067099003|261022075727099003|261022105027099003|3023799007|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	flgdc227IGD/wJ+c3WNAI7W7nppGCttpqapNde48VsvcGo7Ldq7B6M3HL8ZHP8NgCKVxdyDqMtjUnag4BR+o65wcCcRpE5V3z9R6qy9XrXZDXvmyd/TA/kUcVGn77P8/F49wVChMlCFhcFqD/URh1PKYsMTJfSd+sDGjdyVWLRWkBt+l1k5PKU9/z7nPTZuH2q2vu8XwyKskY3cZvw7lPORNmLlJvBRNoK+BHs5DfpSJP207vmAL5DntwcrZO284hshym6PZNfF1ceI2HKqnr8G796OU30pKJaGulmpnra1h/FsVHhakE5hiUCR8htxaQb/ZkuWnNuvJWJeOxmees/BI6VNbq4PyXTn6CJF6TVz3IFiYNATVZdWjydH9NFVwYR3vo3fiEubw4oq8xBnKZiEOwOQcarEHEA8brgurZ2y6iBpLJCzPJti7msB0GwZUNA31xeMJ5ESOh+HYFGxoJx8ywEhk2oumbax9k2xhOnEOOFXMnoM2D71y/KosX8zkEWod5sGIdpRyNdpptA22w/mRgo8zNiJVSYqTToJyhlclTlaRc/YoZWVVfXVGyx+TZUCIZM1/Z9IJXGV6CDTZEVHh8/9A5UZKL1N8wiJ+W536R6QeqB/CzJk6RuNebsGX5gEoAMXEIMLmkYPPX4cECaqQIAzVnNBOBpDnx6IkpzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(7416014)(261026140227099003)(5023799004)(261028144727099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261009223027099003)(10067099003)(261022075727099003)(261022105027099003)(3023799007)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVF2cWZJMldMRTdhWWduc01GYWxoa0FWeHB1NEFpZDVhRU41b21DclRCTFIr?=
 =?utf-8?B?OTg3Y20xaUkwME92NENXSXp6cGZhZGcwMitkTThqaEVZQ2RRNnlBZmdJRGxJ?=
 =?utf-8?B?UlNSV3ZrWDB4Y1g2OGZhZTYrVjVkeGJHQytSVm9YTnNneFlTOW84QWk1RHhL?=
 =?utf-8?B?MWxyeWdSbXdaRndJcnpvdDVtL0VEaThPUVhiWGljUWM5a0ZINU9Kb3EvTFo4?=
 =?utf-8?B?bzNhaE1GbUZZdUswNG9HZGZlSjdiYklCWlVyOVVJTHZreDZkT0ZmclhkZGxZ?=
 =?utf-8?B?OGp3VGRMWm9hYVlYUlprZ2gwQ2F5Q0tQSm5GbVYxSXA4ejZFV0lvTW1LYmps?=
 =?utf-8?B?WDhXRDRHbGdoT0FVd241RWUvSlNlbXZBRUVHRktHMStZQmVxQ0dDaW9YQ1JK?=
 =?utf-8?B?dk5QblBOcFcxZlFSamJKZ3NpZDRKakhIc1hDVGVZV2Z6M0c5Nml2Y0tGQ2I2?=
 =?utf-8?B?SVN2SlowNmdkSmN5ZnlmVlB5VlFYdlhqOC9LR25MNURUVnF4Wm56SjNoeDZS?=
 =?utf-8?B?SGJKT2g1dks5bkdEQzZGYkFvd29TRVhNdjFSRnkzVWRpeXdCT1h1SlhPWTVu?=
 =?utf-8?B?T2M1ZGVaTlRmTHpLV2Q5ZVdhOHZPRlNxdHZRcE0rWVJud05lc0l3UGorS1Nk?=
 =?utf-8?B?Zm9aSXZYSy91VGozL2pEQnRUd0I3TnFEV3Yxem5Fd2Y3NnhHVjdwbnljdmdC?=
 =?utf-8?B?TWhCbUR0MUhmTVpQTFFxb2NidEJEL0pNaDJOaVZKcVd3VWhwdnBKQWhLQlMz?=
 =?utf-8?B?SUExZ0RtajJWb1dnZCtKMndpOFFBMTE4S1Ywb3VlbEMyUHlXVExIS0tOUVd4?=
 =?utf-8?B?NFppdUM0bjhGcnlCK0c2dEp1YW5uTzJCb2NBbnZRUW1OaTNIU09McmxpSnpV?=
 =?utf-8?B?b2hpVXpZWUFxMFN6R1FxcFpUZGcyclM2bWpLVGVucFI2S1hqT09vMTVIeDZU?=
 =?utf-8?B?Z0dBQm5oc2VzSWgvRGpGRWRkYjVwdUJnM1g3Tmc2aXRoR2xQMXF0a2Z5a3RG?=
 =?utf-8?B?ZXB3UG1LREMxQ0xSUHYxOUFDMXVLc1lzMWZNcFcrL3ZyV0FFQXNBa0QxZXlJ?=
 =?utf-8?B?ZHNOU2tVRnBNSWpEaWt3MWxBTWdPMGplNmFBMmhMMG9USmgvNUxQUXdmcnZM?=
 =?utf-8?B?c05ZNGE4WVZOaFhTZGxvbUJvRlhaZVpMdndrMjlnZHE0cmZYUkNJWG12dlNP?=
 =?utf-8?B?ZTZTL1BEQ3g3V2cvajZYOWJzdzh4WjhIWU4xWHgwRThlUURGRTgraElTWGpM?=
 =?utf-8?B?Rit5bEtoQXFBbGZLRG16ZDVueko5b0Mrak9HM01oSTVQRGdiRXQzQitHZW1w?=
 =?utf-8?B?ODFiUSttY1RFcFQ2OGliaytJZXVsbXpiMXZqak5OaUFyUnNpak5tdFdOOU43?=
 =?utf-8?B?NU1LOWNaWENGcEJ1Z1RuT1VCMnl3UWs2UnhXM20ySUp0a3ZtNUZaRU9GZUVx?=
 =?utf-8?B?VDZuMTA5Q1RwRFJ1SnRKSjkyWHBaNVpRY1ZTa21xQ1EzNnM0UFZIdzJaMlQx?=
 =?utf-8?B?Rm5xd0pCdVdZZGxDMGhVdFNMMnMrVGNmRVk2cG1qZ3VUdjNIVm5lN1BVQVc5?=
 =?utf-8?B?a0REQmNiaTlZKzY2WTgydHRhUmtYcUhkNTVPVDFqOTB3V09vbGtiY0VEVHlp?=
 =?utf-8?B?SVdEYVozN2wySzM0UGVVMEtKSncyZ05UVGpKYW00Y2Z4NGRIRUFsQ2dWamY3?=
 =?utf-8?B?RVNpWGFvS2JRT1NOTjRWcGVHTmRiZldkOXQ4V0wwUzhFVU9WN3Uvb0F2ZmdS?=
 =?utf-8?B?SjdHT2ltRkltRkdRWGlNbmNEQXBTcjF5RElmRkdYbkpBb1ROelJuZ2w0R2FU?=
 =?utf-8?B?cDIxY1M3M2xXUGp3aXV3Y0JzVVpZbnltenVRZEpCUmdBRTNUOWQ1Q3dvNW82?=
 =?utf-8?B?NndPNFQ4VzRjTE95cEFoS25KQjRHMXRUU1hQNENOVE9LTVFDcXZVaExObElB?=
 =?utf-8?B?d0FMTmU4ZHZxUG9YcnVRREY0ZTFrV3E4UHI2SFgxT3ZjQnJPeXVocnR3bXVV?=
 =?utf-8?B?dk9wVFdNZGNzWGdNOU1ZL1cySWhuVGRRVUM5eXptV2NxV3dlQndtWkRXR0FI?=
 =?utf-8?B?Q1ZJN29Mc1V1dVJqQ1B0UGtqMmc1eGROTUFISnlxWDR5Wm5UekkwbW9aNmM3?=
 =?utf-8?B?RlB0WnFEdDgvQmZmNG5VVEFnVmZrWTREaEo3SGZvTGYzRVdJenAwVjlpcFBw?=
 =?utf-8?B?ZHNuaG83WGtvN01WRU9RUHpWWVdFczhyS0xNTUQ0NkRaelY0ZTdjOVlDbGxk?=
 =?utf-8?B?SzBmVC9yUnlaeGw2TW1PRmJsR3NTTjN3bFJLczBpL3R1NkFrdmt0cmZmdkhE?=
 =?utf-8?Q?u+Hyt3n0hMyAwkX0Uk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dccb8b0-26d5-4bd9-0054-08df3578e8ba
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:55:53.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ow/TVsDXArGUZnMgG1jGpzwXVNKNbujZ0zAVEj0QeXGG+X67CC2bO84P6hD+qiKK1F/LoGwBfwK68nBYEXMrHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026
X-purgate-ID: tlsNG-d62444/1793249939-1D272757-CB7E13DE/0/0
X-purgate-type: clean
X-purgate-size: 3438
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/28/2026 3:42 PM, Jan Beulich wrote:
> On 28.10.2026 06:03, Shuaidong Chen wrote:
>> TYPE_SAFE() degrades to a plain typedef in non-debug builds (NDEBUG), so
>> mfn_t is then `unsigned long' rather than a one-member struct.
>> INVALID_MFN_INITIALIZER and INVALID_GFN_INITIALIZER, however, always
>> expand to `{ ... }', which leaves
>>
>>      mfn_t first_valid_mfn = { ~0UL };
>>
>> initializing a scalar from a braced list.  That is valid C, but MISRA
>> C:2012 Rule 9.2 (required) - "The initializer for an aggregate or union
>> shall be enclosed in braces" - is reported against it, twice in the
>> x86_64 build: common/page_alloc.c and arch/x86/efi/runtime.h.
> Wait - the rule says the opposite; it says nothing about initializers of
> scalars. The rule is clean in all analysis jobs we do. On staging we only
> ever have debug builds analyzed, but on release branches *-allcode have
> DEBUG=n. No 9.2 violation shows up there. You also don't point at Eclair
> output supporting your claim, so I wonder what is going on here.
I came across this while working through MISRA violations on our safety
tree.  As the code is not something the safety work introduced, I sent
the fix here rather than keeping it downstream.

I have now found that upstream already dealt with these two macros, in
e6b68789d42c ("xen/mm: Remove INVALID_{MFN,GFN}_INITIALIZER").  So you
are right that there is no violation upstream - our tree simply predates
that commit and still has INVALID_{MFN,GFN}_INITIALIZER.  What we need
is to backport it, not this patch.

Please drop this one.  Sorry for the noise.
>
> Further, "That is valid C" contradicts ...
>
>> --- a/xen/include/xen/typesafe.h
>> +++ b/xen/include/xen/typesafe.h
>> @@ -9,12 +9,17 @@
>>    *  * _$FOO()  which boxes a $TYPE as a $FOO_t
>>    *  * $FOO_x() which unboxes a $FOO_t to $TYPE
>>    *
>> + * TYPE_SAFE_INIT($VAL) spells a constant initializer for a $FOO_t, for use
>> + * where _$FOO() cannot be (an object of static storage duration).
>> + *
>>    * This makes a $FOO_t and a $BAR_t incompatible even when the box the same
>>    * $TYPE.
>>    *
>>    * It does have some performance cost because the types now have a different
>>    * storage attribute, so type safety is only enforced in a debug build.
>> - * Non-debug builds degrade to a simple typedef and noops for the functions.
>> + * Non-debug builds degrade to a simple typedef and noops for the functions,
>> + * and with it TYPE_SAFE_INIT() loses its braces: a scalar must not be
>> + * brace-initialized.
>>    */
> ... the new wording used here.
>
> Also, in the earlier insertion above, isn't there "used" missing? Possibly, to
> avoid the double use of "use", with the earlier "use" replaced by "cases"? Yet
> maybe this is legal grammar anyway, and it merely feels odd to me as a non-
> native speaker. A native speaker may want consulting.
>
> I also wonder why you CC-ed Roger with his old Citrix address.
>
> Jan
On your other points, briefly: you are right that "That is valid C"
contradicted the comment I added - C11 6.7.9p11 permits the braces, so
"must not" was wrong; and "for cases where _$FOO() cannot be used" does
read better.  The stale Citrix address for Roger was a hand-maintained

CC list on my side; I will use scripts/get_maintainer.pl in future.

Thanks for the review.

-- 
Thx and BRs,
Shuaidong Chen


