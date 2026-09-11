Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C717AC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:51:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417319.1646198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52aO-000516-QL; Fri, 11 Sep 2026 14:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417319.1646198; Fri, 11 Sep 2026 14:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52aO-00050z-Mv; Fri, 11 Sep 2026 14:50:40 +0000
Received: by outflank-mailman (input) for mailman id 1417319;
 Fri, 11 Sep 2026 14:50:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x52aO-00050t-3R
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:50:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52aN-00EFQt-Ge
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:50:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa41527-e002-0a2a0a5209dd-0a2a450484d2-26
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:50:39 +0200
Received: from [52.101.85.28]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa4153d-b57f-0a2a45040019-3465551c389a-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:50:39 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DSVPR03MB989243.namprd03.prod.outlook.com (2603:10b6:8:3ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Fri, 11 Sep
 2026 14:50:35 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:50:35 +0000
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
 b=QXVxVMDDbqX9KqMKKhaog6sWsoSjiGCyhegcCvOGQMzTJGCSI/TjTWk14PxhxUOvhsu3fMG94Tr1fvhZpiCQscxRuvigWV2843ot1keMbaxXy5CMxQ1fyyNW8rZBo0r8uW4MqUrSIB1Qvyhw1wp7xu24uSNJ6FjeG5lz1SfgEWwFKRc0kdcqRJo32ynkis26xp1jD0ilAmlrD8FfkhGPsLY64nn68/0W90fYlNmqh6/WamLJa4cO5ZP9vLa4MtdzHPgCGNL19MoEWU0Ay2nxgP8//fVp8L/hXzNGdCaI8Wd8GLZjck50RSFElWQmExQlANkPEPcVplam02CSKjibqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jpyJrm+Y4hPYLcisIDwSz+P8gThpnV6HSgDuGY4RPY=;
 b=nMbpu8aZP9VlGe2CgcWBgwYxO8LLpDM6QBMn88m8wWxqD0z/emSjjhAAHAT5HFlaaWPa2mvwbTH3NuaknHe0mC4dc0RLoidB3lAAWIn6MVVfcAc3EiKUV3xSiu0QBqxZaIaw8j3YL1tcN8Tjc87EOfDvxeoIZlgO5Hx287GUKaq+9BWibOgiDfvFEMv00oWetpFCF6ehv3IeNeA5qjl0gOu9y1N/Qcr9tgtnR9nR1TBNVVG5LLK/VZA5epehikjwCTJWWPYzuoxLhUz4d8xaBUDmL3g7zqSYinvGgbdajMwJG2nMN8WSBNgfaYh/OKhDjaeeoNTBDBXnmNjAJdCVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jpyJrm+Y4hPYLcisIDwSz+P8gThpnV6HSgDuGY4RPY=;
 b=HQpkF699L5NGEhzg3WeVMf2+N3jne3FHI/mmTP9CKJkkTPiI+sXJvGaksq5RhS0eMkvWpcHgvlDt/GKxkZ6XOqqpSpibE6oUb60Pp+uWu1toZAurdxmB17zX9gHleCaLy/V2jaLuC/jWHardjV5XCwKnhr+P5AI2ZpGOHQpO4FM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <52b94314-5291-4cf6-87fc-be3a54618b39@citrix.com>
Date: Fri, 11 Sep 2026 15:50:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nestedsvm: Fix multi-byte IO port intercept check
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260911132315.1209497-1-ross.lagerwall@citrix.com>
 <10df3c15-990e-43db-8cc7-578f44a2bbfe@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <10df3c15-990e-43db-8cc7-578f44a2bbfe@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::24) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DSVPR03MB989243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cde4eb1-3f2b-4d49-20b6-08df1014095c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nRwcGuYpSK3CBVjEHbRmDUS0Pub1wYJcqzXs06C1wesV4WJQbMITZO8i2yGgiVoXbg3u/Tk9LVE6y9AEh0+6laLXxAToxj5Ewhf2J2yla774tJ3+DUWZ42gHEf5KhtJEbUxmaXzEiaW+KW6O8j6X+A06/BwtvNOTqjn2la15zN/LhM7lHj4xTzoYzS953kJ9gJOlKt7aZymZwD10p4eViL8p+ptwhGzOuMAAV1pXJ4ZLwRtYpw93RTSpcYJ43k8f7Dx+k6EBhh5UJnrR35L2EQrZr+ebjVquZhnZDAeaaevu2QVbtSO0BsB7h1YYrGGOBphezjTLLvr4FC9pPnrLfrLEg5igHhh2ZXD4rYWSthmGSPbkHWem0MLgTHSjqYvxH55qntQB2E0mVyd+OyUEVaruSrSNgxF/RpXwTB7/6E0LmiTPjwyonJ+sNSaK3td/96q1VCa68p+21oZMYzXwBcHdhj9wvxOdwYAR4CXmkKdckEJAaHHqjcam/XBoTSyNT/ue46oC6virLZMa6QF9RtfXF7yPvZ56JVrKUNOegPC4AkXp9zfZYVBIuA9XHb0x6BRIQp1UbALbvCrR8LIVbTuaddj2fcTT4xLtFwf2RYQr0s9SOH3By9zF1XqYAuCWefHEMomFxiHHCfNLqNVpgYVo6H1g4YniQlXtHJrmsIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXd3aFhRNmtlZFRLcnRXdnNBeEZLeC9QaWZEZiszREpSR29ZNU81ZGU4NlB0?=
 =?utf-8?B?WkFablZ1ZzNDUmZCQTFHalFydFpLSmNjVkp3dDZuSTNLbk1rQmFRaW1OOVZY?=
 =?utf-8?B?Mm5MQXRxclZaUzlIekY5Mms4V2hKbDlFWUp0OFVOZWlSNE1RNlRIWW5XcVhx?=
 =?utf-8?B?K1RyVmRoQVNEQlExSkxkU1BaZXpaY1VDbndsVGdObW4vTkZzNE1vdmU3clJa?=
 =?utf-8?B?anR6M3V3L2VuQ2U4OWRkSVVtblVueStDT0xwakJwUW1PMEttTStCTFRIOTB2?=
 =?utf-8?B?TDEvSzhGcStDVDZESjB0MEFOK2hMSXE4TnRwY29sUDJiTldseWRyaGplRzRv?=
 =?utf-8?B?Y2gyRENMM3NxQS9SSU9iOFNFNHZEZndSQ1dMZExKNTg5cEIwdDFqMzlUVkdF?=
 =?utf-8?B?WU5jRlY1YVpxOWMwYXhwT2tDZHF1NzBOTXU4ZTBqbVQ0WG1CeUtQSUxPOTZ1?=
 =?utf-8?B?eTlHcEZ3UElVdzV2T0ZkcFJhekNsNjVwWEVhaFlKTys5R3FaZ2lzZ2lPaTlV?=
 =?utf-8?B?S3dnR2gzaVk5clpScDZDME8yVUFNMGYrd0o2ejR4ZlJYenJ1U05DM1RlREtG?=
 =?utf-8?B?SFpwOEd4MDJvSU5pc2xiWktwZTNlNFh4K3NqWnd0SnFYcHIyWmlsNGRIcTRD?=
 =?utf-8?B?WE5CR3VYUCtCZGswbDI0RUZKQ1VFams1YzllckxXcHdqMDFGeUtYZVg3MSt6?=
 =?utf-8?B?UVBJK2c4VytwWTRidmxYYzViK3BYZFR0UFd5K3lXNHlORkJ0TFVDRnFtUldX?=
 =?utf-8?B?YTB1WGVlQmw0dzdQQTgzTzdTeHN0UVZCTDkxUGlScnlIS1NlcHpOUEFPcWxE?=
 =?utf-8?B?TkVXK1J5UHBzVHRvTWtXT3NKeGVSZTg0Zk1mUkxqeFFKaU9mR1pPTThpOFNZ?=
 =?utf-8?B?RSsxOE5OeXBTY0dIVlpDWjk1VkNaZ1Vjbm1WU3kzNXZ1aml6cDlqekkwa25v?=
 =?utf-8?B?bDRGQnlLa09PL0xBZ3gwRkFTMldpSitJTktxTFRXMXlHeE5NTkZRaC91Wmxy?=
 =?utf-8?B?ZnBqOFBjNXVzSFBQL0FrQy9abjVXWFoxUmFES2VITldEOGdFMytWRzNrTkhX?=
 =?utf-8?B?UE1LMG1KWHViSHE0dmR2dEFvV2ZSbmlrU29zczU0eGtaL0s2N0lHLzlFTVFY?=
 =?utf-8?B?WFYxekQ4N2FnSlQ4UElOd2hGS2JrMXZKazlmaUhQR21WSnlxSFp0UkRrdlNu?=
 =?utf-8?B?VVlWc0hiUGlaazlHV0lldzdmQVkyWlVBckg2MklQRFgwb0plMllFT0pOa09C?=
 =?utf-8?B?V1FXTk1acjJFQVB1STdTbEJERUJ4YXdiZHMwQTl2ZEpnVzlxd1NIeVFmQjNK?=
 =?utf-8?B?WFYvck1WNE9YTUJCTkpEMHJXcTM0T3cyd1Z1akRXTE80bS80U3RUcHErejVy?=
 =?utf-8?B?ZmdnWWt3aFh4VFZvaURtbk5laEVxUlVwU05Za2NCSmtkQUNXT2MrcEcvc3RM?=
 =?utf-8?B?cTBzVUFDdEFlMkphd0ZlMWdEblJqQ3RucGFFMGhVUHhtQVltZFQ0VTYxdHFZ?=
 =?utf-8?B?RlVyeW9xa2dGZS9ycWYydDNFUU9WSjAvNmNvbHA2ZGtwc3Rsa1lHb3AzNzdL?=
 =?utf-8?B?dTk3THpmUTljUCt2b1l5VTFIMW0xRFhkMzlXdmpHeU5lQzlUUmZMcjNZVHBL?=
 =?utf-8?B?L1FpaVdIRWtvL0pRU2hWT3RGQkY4MDBoMmNicmd5U0VVanNuNENHNkRLSFdS?=
 =?utf-8?B?Wk92d0d3WjNLOVJPKytLenpKdk54RkNoQ1FDbDIyNEdWZXF3QWJUTnM5R2s0?=
 =?utf-8?B?SWVvYTlkN256UGxBS1J5cXBRczdudEcwUnJVa25Xc0traTk2dHduTHBZaVVH?=
 =?utf-8?B?alNxQXJIUG9SZFFYU1ZUdU5DdXFvcXVRajZsZHA1Yk5ETGJrOG1zSlo5TTQ2?=
 =?utf-8?B?cGZvNU80SE5HWkxWR0lIMEZ0VWdJTHdueGlkeEd6dGpJaE5kVVltVXVIOGh1?=
 =?utf-8?B?bG03UHF3VllmY3pSRXVxcFB3Y2NyY3AxZy9iMk1rMmVDa00vdXlXcnVqUE1O?=
 =?utf-8?B?RUN5bWFxZ1hRT1J3OGRZRjZDL0VJdFEyY3p1bkNsRXl5bXU3aGZuWWJyZWo1?=
 =?utf-8?B?Z2x3d2ZERzRRajdkVktBcTR6YkVueGo2OWNDTWwzUmUwcjl5REJDRGhXaGtL?=
 =?utf-8?B?ZTMwNHNMcEE4eklVNXJkT0U4OExHWGgvdlRJQ3R3R01MbEx3U0h6bzJWNGdI?=
 =?utf-8?B?K1ludDNMNG1HcGRZNURrSGE4RENiWHUxMnIrbHIzeldCbVZtc1c5TUVsNTNQ?=
 =?utf-8?B?L2loaWNzWkFhOTBLY0Jxai9ZbWhtekNYMGwrbjdOazlxdDZnYnYvaXk3Nktq?=
 =?utf-8?B?bUE4ZnhtSVRiR0FHTGZ3SVVTYzdRZGJRTlI3UTNWVTZiMkJsbWFkaGZtV2pp?=
 =?utf-8?Q?YzBgLscwKfIKEBT0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cde4eb1-3f2b-4d49-20b6-08df1014095c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:50:35.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ppz7fqy8XYfvAbyPDNEcEoB1RAj8/SnfgfjjNWyQUg76qfew2LvbZWYnvN7JYBftmWOYJRJif6w9xx5puBTG4bp1SKG7Uh4Axsy3bhw8L3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989243
X-purgate-ID: tlsNG-ebf023/1789138239-520D5B50-9CD7A948/0/0
X-purgate-type: clean
X-purgate-size: 2627

On 9/11/26 2:36 PM, Andrew Cooper wrote:
> On 11/09/2026 2:23 pm, Ross Lagerwall wrote:
>> For multi-byte IO port accesses, the APM says that SVM should intercept
>> if any of the corresponding permission bits are set. However, the code
>> has this backwards and only intercepts if all the permission bits are
>> set. Fix this and at the same time, make things safer by handling
>> mapping failures as intercepted. Also rename the 'enabled' variable to
>> make it clearer what it does.
>>
>> This affects Hyper-V since it does not generally set all the permission
>> bits of the multi-byte ports it allows its root partition to access.
>> This results in an L2 root partition that cannot do PCI config space
>> accesses and therefore cannot access its NVMe disk to continue booting.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> The reason I asked about 0xcf9 is because it's the one-byte PCH reset
> register, which hides fully inside the normal 4 bytes at 0xcf8 for CFG
> accesses.
> 
> Despite outward appearances, the x86 IO space is not one uniform space.
> It's 3 orthogonal space (1,2 and 4-byte accesses) where the target
> device gets to choose whether muti-byte values alias in the spaces, or
> are entirely disjoint.
> 
> For the HyperV root partition specifically, I'd expect 0xcf9 to be
> unintercepted so as not to interfere with the final steps of
> shutdown/reboot from the main kernel.
> 
> The patch looks ok, but I think the second paragraph needs a bit more
> explaining.  Are we saying that because 0xcf9 was permitted, we allowed
> 4b@0xcf8 to be permitted, changing L1's CFG index rather than changing
> L2's CFG index, causing the subsequent 0xcfc access to produce garbage?
> 

Yes. The incorrect trace shows:

L2 write 4b@0xcf8, permitted so it updates the L1 CFG index
L2 read  2b@0xcfc, VMEXITs to L1
L1 write 4b@0xcf8, updates the L1 CFG index to the wrong value (since it didn't
see the first L2 write)
L1 read  2b@0xcf8, reads the incorrect value from the device model in L0

How about this for the second paragraph?

This affects Hyper-V which for the root partition intercepts 0xcf8 and
0xcfc-0xcff. L2 issues 4 byte CFG index writes to 0xcf8 which are incorrectly
permitted and update the L1 CFG index. The subsequent L2 CFG data read at 0xcfc
is intercepted by L1, then resubmitted as a CFG index write followed by CFG
data read to L0. Since L1 doesn't see the CFG index write by L2, it uses the
wrong index and gets garbage back, ultimately leading to a failure to boot
since it cannot access its NVMe disk.

Ross

