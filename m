Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D6AC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:12:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427139.1649762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Z7t-00046o-FS; Mon, 21 Sep 2026 08:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427139.1649762; Mon, 21 Sep 2026 08:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Z7t-00046h-CP; Mon, 21 Sep 2026 08:11:49 +0000
Received: by outflank-mailman (input) for mailman id 1427139;
 Mon, 21 Sep 2026 08:11:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x8Z7r-00046b-9y
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:11:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Z7q-000Jz5-If
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:11:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab0e6b4-e002-0a2a0a5209dd-0a2a450bdefa-34
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:11:46 +0200
Received: from [40.107.208.61]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab0e6c0-b7e8-0a2a450b0019-286bd03d48bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:11:46 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH0PR03MB989332.namprd03.prod.outlook.com (2603:10b6:510:120::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 08:09:48 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:09:48 +0000
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
 b=Tvs2/sdIvNt0bb9Wi1LkBdNcwqCteg9DHmbvTyg5TSZVhPt3FZ4zUXIU2Ug5cMacC3V1gboiRzytxFOm3L2ZwSBu7c5igz/kS9o3NJM4WiD2tPm+n6mZxeG+aE+4QJR4dH74SENB19MoiKqCwoRZNKU1el8mbfqlNJXljdA1sXVnkm8mco46FoR6c1iddT44onOi/WmuO42/M5i8HOlROoUPi4+1j2Scalr+RsMXLLJLwgxe2gtcn6shxpjKuWUyU8fPbAHxxU2pka4i94X8/ltYt4s1kaAqBETk/7ZURNpCA/pYmqdofguFHuJHm+x3CxqdXV1xmP30TCZx9RXnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU30me+7oUzPyjyBP7bGt/BtRwrgcEiRGeIVhWCmOoc=;
 b=Il6fYLt/3++NIUR3KVZ2BEwXpq51j2woLG2zYnQjKJCUewKNUabgGiPelLBwQ2FsxxKUUW+/Wj9umaP/bYDdGea6pFjBlMvZO7VJGZqCgUPsVedGBQlPF5qVFu72MQIDvK5BgiLMCmvZ1WBY+faUMOsvXS9gOn66qb3jg2LzYFYKfBCG19rgKdI0HdYRLcpwX1Ff1DWXw3Y5ZP5ZajQ7m8D2SDpmFxdJ8EfIdKZJx+Q6AX4f8mZb99ZgWpUc6jzt7ey2kgV1E2upRXZo7DQpkVBruz0SKIM18Pq/R0jyMEaxRVoTEs2gKbpv1mJ+KMhZDflRaJAytFTok93qpnYOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU30me+7oUzPyjyBP7bGt/BtRwrgcEiRGeIVhWCmOoc=;
 b=vq+jaTfpzhQ2zpzWSYlChW0DAankvMlS4cpjA6+oTUpHmWYyq1EgmR1sl23/C6qEpWFyKaQO5F+RZuEW2bvrs4KR9wyUBL+ZSCkz6X1MAmfj6T3sMYYwiUz4F/dbWof16XLUx5YFgC2P2hvubNBa74GKmyfe1FatFu+qEpsTgAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3283039d-e0cf-4d84-9fe9-ccef041fddfb@citrix.com>
Date: Mon, 21 Sep 2026 09:09:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and N_CR3
 during VMEXIT to L1
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260918125205.374168-1-ross.lagerwall@citrix.com>
 <1789931442.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1789931442.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH0PR03MB989332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8676fcd6-cb68-453b-d594-08df17b7b46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZEYOZ7rXi9rLlnEQNk4dOv8gA4bjlNwDXpq4oPpykv9G4O2vDv7rqX02RYR88ib5q3b3zrj4+HrQyjAL9k0wn0l++gR4Q3UIaqgqOi9fKvT/nmcJqhmLwh0cucEwYc+y6bBmB8RMctyECss2b4LCIaf3su/3THwO2V3rIoyOQiDTSrjv0EDPnrMA/fFTmwo0PRe4Rn3AYJ2/zpPIxgzJ1CeRf3xuQRvOeLiWr80j2veYQXdBzTbXVPGMNZG/o7bTuvwVm0/HV6YP0HjvckKi24oi7gS6oD5L2VyyWk55JKimlRGe/BWeD7Fgermkb96HiO/pF6cEY4kHZOvmLCECtPUTrKD3Gk4IT4HhVmKpWMVqvuXSxNxOwY5vW/XNLM7jciIvYBl/txlrbm/P3KghiFQfALo4KNhi0RN3UikZ9noAjtJ/HzNl0VX+wwSrkyROlKKBfZWXE4/yeL/0Hf8c6Fhou7diSHfxlOreVPTnwyaiDGOKn4f9i8NGCLtyQ+MMwpi4L4GpkIRihF4UJ8TxeGR1C3GV7WsFthDKSooZS9KuwB6V4UCsumUdAzMNYbz6zzaNh0PNtT4T+I4Sf8bAjxFUL/Y6XOGjFPzzcwxZR78s3OJiTCa/kvfi8X/4TJz4IdxJE3sJOPvyLtRbcDOjHIaVvQIWfYTq9G2TjdBKm5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzFyL3o1ditvTTNWODlZOVNLYmFsQjJRajFoWFlRTU1yVkE4UUd4a3FIOFF2?=
 =?utf-8?B?clBYeVFac2VOcTVSaGhQMXpOVHFaOW1QMVhmVTNBU002NktBS2FxamhKcC9l?=
 =?utf-8?B?dUxRVFNMYXJXbEVoQk0wNHNHbTZKVDBLaVkydGdNNW5pU1hnL2thTWZuUm5G?=
 =?utf-8?B?aEJPeG5tS1Y1dTU4SjlSVFp1ZmxkTHhCL1dOWGRpejY1RGtZNEFHeS9tZElC?=
 =?utf-8?B?c3hrQmVyZW51UGhWd2ZQaVBJa0FQNDQ3UlBLQUsyVU16VGd2TGx1bEtQZ2ZM?=
 =?utf-8?B?OWl6dkpIUXhaT1JIWVhUTnYwUzNzZmdIdUp4ejFkckhOU2VnZi9xdGxvK0FL?=
 =?utf-8?B?SExTNVYrS2ozMktTN1FJZ3pLQWU2ellkSUZNcmhKcWYrT3EvNHg0NCt5bUpZ?=
 =?utf-8?B?QnJaOXY3cWJkcHR5SkttWWtvaGVBbklJWjZyU3dIblRtRHkrZTd3ZWlSSTl3?=
 =?utf-8?B?WTcwWHpNVnIydmZub2pXNXZlcVI4aFlVWlZ6UGJEYllhNDhoNlZHVEVCUmto?=
 =?utf-8?B?eitPdTNaeG00UHpiSnEyelhFeXFZeVNLS2RIZGlhaWNWSHk4akZ2RDcyeUJw?=
 =?utf-8?B?N2J0Z1lxY3EyK2RIdm04TkczTTgrSys3UTlyZTYyTGVrWGd3a3dmaUE1Vm1L?=
 =?utf-8?B?TEc3NGhqNS9lYXNLeWdtTEI1cHF2NncwTTZKdXlzaFFkTVdEUXBHMlhjdGlJ?=
 =?utf-8?B?d3FQOGRLR3NpS2xVOHdYdWM2Z0xQcnhiaW1lQmpxd0tqRkdmeTNJalBkSWZR?=
 =?utf-8?B?SnRUVWwzZ2xtZnhlVXkxdFNaVHNJTHowM25ETDVQOWlnSTZhRStXNlIzRGRC?=
 =?utf-8?B?WktEVHhkOWlpUklLeDJoMDVxU3M5WEZiSzNtTXJLQjJMYmxWeTBTcVd1WjBv?=
 =?utf-8?B?WXlxb2lUeXBMMnNMQWhMcUt2UnJqSXNveTdWYmYvZjlwbG9Cb29FalI4Rk9R?=
 =?utf-8?B?NEIrSk5Md0c3NHNiZUdiTFB6eThGUVpQNUo5ZFpHQ2dFbTRmaVcxUDUzMlp0?=
 =?utf-8?B?RHA3UkV5dWR1dzhTRUJ2OUFxVGJBbXdpUzMrcDI4eFVSQi8yWHBrMGhMbVBH?=
 =?utf-8?B?VTlqazdnLzhXQnBDQndueUZQcDVRcndNVXhyQkNVQy9TOTlSa0UxM1Y2QUg5?=
 =?utf-8?B?UXZlaWwrc25tNm83V2Q5UjhnMEpQejVSQWszbnNBZngyL2pvM21CYmErK1lH?=
 =?utf-8?B?MGxnaE80K2c2Q0x0VjNBMkZhek40V2ZYYmxpZG01bldWRFNjMG9QQ000Z0Fk?=
 =?utf-8?B?MVMvdFpIdVc2blZseGtWQkZWWXczdDlTelpQb2ZlbGlaMXRvakRSWmE2UWg1?=
 =?utf-8?B?K1lWMDQreGJBZE1JOGZIY1NId3Z5SHJWcHJHRTJmS0wrQnBYNUduWUVpQkRa?=
 =?utf-8?B?bFlsM0hlc1pXVm9HdjQ0UGJ6bW13NGVJWWpVWDA3RlZpaXhZNGN1UnhlbFBp?=
 =?utf-8?B?WkhFT1NnY1ZEeVkzSHVFbjJCbS90aDJvOWV2ZEtaZEVha2xUR1VBNmh2ZXVE?=
 =?utf-8?B?bDltNkllc2Z4QVR5SnJoN2dpaW1oMFRDZGlkQU1DaER2Z2hyU0lrY1JQc3I3?=
 =?utf-8?B?WCtyVkNPTTl3aHhGeWJWaGRzbVZCdEcxeUpFRW5pd1ptSzFOUm5hRFhGekk2?=
 =?utf-8?B?Snh5K2lhVDMyNVVTQ1N2Ui9LdUQvNDV3NU9JWlZ0a0NsS01BYS9VcFVJQUFB?=
 =?utf-8?B?Z3VKL0Jxc29NcFVTUzNqWThjZmFrN29nUkF1cm11QXhXVkxEcy9VeTF1RVk2?=
 =?utf-8?B?d2RCejVDMG5pTHptWnNvUEVxTUlRT3RVR2ZDZzlDNjhjQXgzUFJGbmpjdGsw?=
 =?utf-8?B?WGhRT1J6TlY0QXJ1YU5QNDFKTkU5K2FmeHFncXZ0MlJDY01DU1UvcUE0bnlP?=
 =?utf-8?B?ZWZwYWlLaUxvczNsTnRldGovRThHeFNFYTlGV3hDNVIycTdFYVVPa3AwbEZF?=
 =?utf-8?B?a1paVkMrd3l6WU9OdVYvTG9mbTZBaExYSkZjYi9vOFN5K0ZUVTVMMmt2a1RM?=
 =?utf-8?B?NzI2UmZlLzFWc3hTdDI3VXRTdXNhZnlXWnVWcEhyaUhSNEdCU3MxUXQ3UnEw?=
 =?utf-8?B?OExLUGN4R1NXZVJEdGV6am56Tk14OGREVnRVSWRZOG0vMSszSDFyRUJ3OS9F?=
 =?utf-8?B?T1U0bjB0UXBTdEw3ODkrNVFnZUo1ZjB1WUZpb2g4bGJzL2s4UEpBQnFOYW1D?=
 =?utf-8?B?ODdnOThwRTd0UExmU3IrV2hrUmN5OVRocUEvNkQvOTZWNEdPeWF5eU5QQUFI?=
 =?utf-8?B?bjlIeUt5V0RwbTlLNDhVTzVqZm0vMDlPRkQxczRnb3d3cEVqcmNCV0hickpI?=
 =?utf-8?B?QnhXL3lia2xIeXVUcFBYMDlQU0tMY3I1bHlkRDFNcmVweVVYVnBtLzFpV2J3?=
 =?utf-8?Q?Jg+FpsHjTMgNs0Y0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8676fcd6-cb68-453b-d594-08df17b7b46b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:09:48.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbEskV57CFlAyeQcJoBSyvZXIM9X97VtvKoGk1aS+OLnqxHgKJyWnQ5uLwDysUqrGOjhNwdL98du7bupg6qgXWZFxDuM1Ack0R7D8rLuZOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989332
X-purgate-ID: tlsNG-42698a/1789978306-1AEDE9EA-831DEDDB/0/0
X-purgate-type: clean
X-purgate-size: 3071

On 9/20/26 8:10 PM, Teddy Astie wrote:
> Le 18/09/2026 à 14:54, Ross Lagerwall a écrit :
>> As per the VMRUN pseudocode in APM Vol 3 3.38, the VMCB's NP_ENABLE and
>> N_CR3 fields are not set during a VMEXIT so don't do this when updating
>> VMCB(1-2). At the same time, cleanup the somewhat bogus and irrelevant
>> comments. Not clearing N_CR3 does not introduce a security hole as
>> stated since L1 can set it regardless and it is never used directly when
>> running L2.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/nestedsvm.c | 32 +-------------------------------
>>   1 file changed, 1 insertion(+), 31 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index a8b15d6eae05..c62fca571d75 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -1023,37 +1023,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       ns_vmcb->event_inj.raw = 0;
>> -    /* Nested paging mode */
>> -    if ( nestedhvm_paging_mode_hap(v) )
>> -    {
>> -        /* host nested paging + guest nested paging. */
>> -        vmcb_set_np(ns_vmcb, vmcb_get_np(n2vmcb));
>> -        ns_vmcb->_cr3 = n2vmcb->_cr3;
>> -        /* The vmcb->h_cr3 is the shadowed h_cr3. The original
>> -         * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
>> -         * hence we keep the ns_vmcb->h_cr3 value. */
>> -    }
>> -    else if ( paging_mode_hap(v->domain) )
>> -    {
>> -        /* host nested paging + guest shadow paging. */
>> -        vmcb_set_np(ns_vmcb, false);
>> -        /* Throw h_cr3 away. Guest is not allowed to set it or
>> -         * it can break out, otherwise (security hole!) */
>> -        ns_vmcb->_h_cr3 = 0x0;
>> -        /* Stop intercepting #PF (already done above
>> -         * by restoring cached intercepts). */
>> -        ns_vmcb->_cr3 = n2vmcb->_cr3;
>> -    }
>> -    else
>> -    {
>> -        /* host shadow paging + guest shadow paging. */
>> -        vmcb_set_np(ns_vmcb, false);
>> -        ns_vmcb->_h_cr3 = 0x0;
>> -        /* The vmcb->_cr3 is the shadowed cr3. The original
>> -         * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
>> -         * hence we keep the ns_vmcb->_cr3 value. */
>> -    }
>> ->       /* LBR virtualization - keep lbr control as is */
>>       /* NextRIP */
>> @@ -1083,6 +1052,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       /* CRn */
>>       ns_vmcb->_cr4 = n2vmcb->_cr4;
>> +    ns_vmcb->_cr3 = n2vmcb->_cr3;
>>       ns_vmcb->_cr0 = n2vmcb->_cr0;
> 
> I would suggest to group all the CRn (the CR2 part is currently separated). That can be done separately.
> 

Indeed. The APM says...

"Upon #VMEXIT, the processor performs the following actions in order to return
to the host execution context:"

... so ideally we would rearrange this function to match the order specified
(though it shouldn't make a functional difference).

Ross

