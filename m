Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF70C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 06:34:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382842.1626117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVCl-0007Xk-6z; Wed, 05 Aug 2026 06:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382842.1626117; Wed, 05 Aug 2026 06:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVCl-0007Xd-3s; Wed, 05 Aug 2026 06:34:19 +0000
Received: by outflank-mailman (input) for mailman id 1382842;
 Wed, 05 Aug 2026 06:34:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrVCj-0007XE-HE
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:34:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrVCi-00Gy9x-5H
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:34:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72d95b-e002-0a2a0a5209dd-0a2a4509e9e4-30
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:34:16 +0200
Received: from [40.107.208.18]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72d964-be1a-0a2a45090019-286bd0120776-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:34:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5390.namprd03.prod.outlook.com (2603:10b6:a03:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 06:34:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 06:34:10 +0000
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
 b=lTVC3FtCvy+VigUE4FqzJ62CA+rpBXz039+lraKmhc1s29p/jQz3Ftj8XGNTVaFX2amJFNEuCk0e0SArgENnl9STmUZzUx1Gugk2UNtxBSBwyCW+APthsOP5JmWv5/e6bvGlsQeswgcCsPY16l4s2sG/INW1hVJPBmf1LdhCYjYRmg+bmwtieGhxT+7yRGqcIWiWm7uHkRBDoMhCOxoY+/Bg7teNSLuU45tLXqxJjtF38agDh0rYrJ7Y140eiV/goJ33TwRMTGhV6x07XbaXEplp3IC7ZJK+2MdNRJKfFwUfMjPQXQlyMNv/BG3fPL0p03Jr7Wfmtt+xkf65NGeciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLC7heUy9BDy1rqMYEtuJeVL80ZKUo5HkS3gzicNHuc=;
 b=QM6JLM09VXeMnfOnnKXBYi0mnrmDfhExdoDs9xCBFA60XXZcH8KfV1Q01r7MgtPhMp3bdxs28XPSgeg40hOtByZLjggNmJr28uux+mQQBsmOUW/RBtKQdRJmHwOPOgcpAB8cRQiftaJFWO50H2fSNAbxMwZxMcF6RN0bIaqVYGVebti07MMxZvyLAsKtHgBwgJ4K0B2oYIma8qgDUYtZpTeZPs4bhkcjHx7WEu36WWQFk7w9LKsK2+CYw40ltxq1nSyogxRb09M71poufoHv1aJQ3PX013sXbb3BZIal3FKmaX52b6OaNfuG0Y7EAodnhPeK+IBn0lUSGDUE6w099Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLC7heUy9BDy1rqMYEtuJeVL80ZKUo5HkS3gzicNHuc=;
 b=0ncq+SGxjDYfBQuE17MDuQaFshKpO7Lk2fMqyco+rcVATt7zQy0mGZbm3oywDGj3yKxgklkYbUI1vcyHiom1CGv8VEOb44mTVdR+KABfvwIvtOH14t4d6Tx3VfE5bYDLHKAEkLiSuoHpKFDhTgNt3xaYqQg+lAmQTYzLXsNSzt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5d62cfe6-3d97-44f4-9a5f-94b77514b6a3@citrix.com>
Date: Wed, 5 Aug 2026 07:34:07 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/alternatives: Rework get_ideal_nops()
To: Jan Beulich <jbeulich@suse.com>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-3-andrew.cooper3@citrix.com>
 <99a39800-dbba-4d37-afcb-ae041af648f4@suse.com>
 <f15222a9-1d61-4d9c-b923-8e6ad4994af3@citrix.com>
 <cd877869-3d53-41e4-88b3-df629e4dcbbd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cd877869-3d53-41e4-88b3-df629e4dcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0349.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: f169db0f-e7c0-4ff6-a43b-08def2bb8ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	UfjzMX1qQVDhLtkP6UitkOyfB46TynpEaxj1ORrxUb0L38i+IPytyCY4glh1y2nA8B9P0BUhYvz8yh0MjFtV9EFZff+zCN5+/j4AgTaWEjSkguxFMdJxT4B2IEGYkx/YlIYwR7lQy987o2kem5kibOrTky3SQGtyjOoHoQhL2VpV1Eoj8X9OAZ+ZErscCfmIYMs8LBU+mYEyYjXnNakbO3mkF6vhTISZunnDJ3458asZiXOPABYKD6Zuor81yZpJXTiMjHAuVvhyYlADr2/yFuG+jMzJkN1cBmxHytaD+yYfcrsYvUgMCrRrODYAgf1ZKEqyzFZToTUTPR3+E/zE/1BG5AHL8eNifx2IEnmcKbEJ0q28iIZwGZWrAKD3Sb7KlyNLrPwOsKhsMcvCwrheZCDtWuqRrvy8Eb+Xx1IKVTTXybW8Wo5b389/4T4D5V7qF7AK78CH8R6hAwgblRc9TXJN/WurUJ5ZhbY44FJkpVOVBOMgpXUFbupfm1SbmaYlcXhxUOGfQCtww9UUdIlF4uOr61Dk6HjG/nxQlB7vF0yxMgJrI18sqbFuh395k21fYOX1b5dGbZxGppWBtig9mifhhxObs3KkVotMObZjFQId+9e1HY03ymUgPLWIQFsmot2l+HDNKSxnupqXLEPV0N6afa6ZXlmuTxymTac5j08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3pyakJHeEE2V2QyU2ZvUzF0cXVYSzREOEpNc1FFcWJRNHhpb3hNdGdQVjAx?=
 =?utf-8?B?NTEwdnNBWE5NbXNWemRud1J5N1ZOb1VmMmhVVEtqdytUaTFlTGFYM1UzdTBJ?=
 =?utf-8?B?ZjIzeHJhaGFUaVlMT3pZSEZUMC9sWm1SWWtkSDFYY2puNFlKcUtBSEtkK3VC?=
 =?utf-8?B?ZE1RZXlXUUZVNFBUSWJWQ0s2K29vN21KeFJGQVROYk5kOHNISnNUQ2IrMXBx?=
 =?utf-8?B?clo1c1g2TmhDdHNkN2tsbnJEZEZKOTZOb213VEdubDlrQWlINmUzOTZwYVVL?=
 =?utf-8?B?TjZYZGRRS2daMEw0K2dFZTU2eWdFWnZWdkJ4RHQ0STNyVVUybEtub3doZmFB?=
 =?utf-8?B?cjZaREVEWHQ4TDhjL1FzR3J2UEpzK2Z1cXdYMGRyK212Z1Y2V01FWjdueVFK?=
 =?utf-8?B?TFVxaVpSaHE2Sk1SY2pURVBOTzhtVGlXQStlZXdTVVMweHhCTnBjcnE4ZVIx?=
 =?utf-8?B?NUlsNm5uTU5uVWJZSllyVG9sWlYwSC91Ym5MN3ZGd2NjTGVSNXAzQkUxL1Rr?=
 =?utf-8?B?dUlGY3NrdzNPVmJ2VDFJUzlNcVkzUnF6OU9tTjh4S0duYW5TRDJZUzFzaXZ4?=
 =?utf-8?B?YlU3TytLZmNKWXpsNGVHRGVVMWYraUFXcDJuR1BvZ3Y4RXNuUmZ4UXZpSnJm?=
 =?utf-8?B?SkpvajZiMWdaRThhREhFd1MyTHQrdlJRRFBBVG5TMU9aRzRoVndWek1IVTdL?=
 =?utf-8?B?Y0lEamw4M3hweUFRWFFPZm5yZnQweURLYnpic3E5b0U1Uzc2MXg2TkZmVXBF?=
 =?utf-8?B?QmNYN2tndDlqb2ZaczdkSld6MGpDa29VSVBuR2x2WWljbGlxYllrOWtjbFFj?=
 =?utf-8?B?dHhYSEFwRFBlZnpPNnlOV0JNRzd3OXpYWVRDZGprWWZNVUVsZms0SENvYU4z?=
 =?utf-8?B?SzVtNTYrUHpuOGlPTkQ3Nm11bGFRNGUvTytRU0tWc0xvVlM2c1BqakJwYity?=
 =?utf-8?B?bWFQUUh3YTRSUnd4V2RFcnFQeVFIcU81R0xOVGZUL1BMM0dCSDVGWkdLL003?=
 =?utf-8?B?aFBkeXNFWFFPOFk2TUYxN2NtV3EycVI4SVF1Vi8zamFmSmd2SVZEeUMwbHJ4?=
 =?utf-8?B?UEdPNnVQZ2Z2UWZSanNsQm9OTks5V0phR0Nuc3V3cVA5ei9hVytMYUd1WVRK?=
 =?utf-8?B?TTBGaGRTdUMwQStxUDlvUllCMmNLbWVLbzNFdDBpUnd6ZUhYWTdVOGwrWm9i?=
 =?utf-8?B?M0l2VVdraHNJSlRWL1JOakFTQXdQdDF5U2RBRG5ORjZkanhzZXZrRU8zMGVn?=
 =?utf-8?B?N09yVk9kaEpsMUFzNmNFTitjbzQ4RmhLUTI3KzJZODd4SjF3eXVDMVRNU2Jo?=
 =?utf-8?B?eW5aLzNDaE9WNThKbnlzck4vNnFlZHI1bFNtSVB0a3BiZ002UUl2bG45aVRu?=
 =?utf-8?B?eFY5bk1laFhZUGFGV2EydmVIZTBQY0E4Tnlpa2VnMndzbFB6TUlvL1RVUW9q?=
 =?utf-8?B?akI3WkY4SUxKMmk0TUplUkFXSjB0RXNjRDdPeHdLSk1zMDFGMW1PNjFneSt5?=
 =?utf-8?B?RCsrMXBnclVrN0dLS2cvZW5TUE5TbU5WKzd5amNGVzFSUE93T2wvOHdHeVpV?=
 =?utf-8?B?eUhMNWEzUEtIc0ZBc2pqRk9CZ2d0NzRQbXFCMFdFVEE0WEw1VTUram5xd1JG?=
 =?utf-8?B?eEszKzUzSmR0K2xqNk5uNUlTL3E4bWhRcUFFemsrWUk1b3U0Z3Z5WFJPdUU4?=
 =?utf-8?B?SzV0VGZkRWlFMC9UYU1aYnVLTjk0OXBLWWw5NHZOYjUvU1BjNElXZlRhYk96?=
 =?utf-8?B?aFA5U1hJVmhHQWEvRElrem5OVXZhNU53cGxObGE0ZzRrNVZub25CTFpubE5L?=
 =?utf-8?B?cnZBcTAvaU56ekEzY2gxVmM2MkZsYWtDUyt4TGpmb1hrQzJmdEZNV3l6NlhE?=
 =?utf-8?B?VmtRWDM1N0pVQlVVNGlVemhuWGRnUmxoYUI3ZktkSFBUekZWNlYyaWVnbE1Y?=
 =?utf-8?B?eElLazhOdnZpVGZxMi84ZEsrN2g4UDhFUlBCMm5PRDFKUlcyZ0EwcjRWN3Nq?=
 =?utf-8?B?d0xGMnJJRHdsK1dYaEdGWTgva25TRmY2RUhUTSs0RCt4V2lpYmx4MURyelAv?=
 =?utf-8?B?NE9KeTdnM3NvVW5mTXdEMlRxd1pwT2RZcUIxSHRDNHhQcVJQb2Z1RnFZbXNQ?=
 =?utf-8?B?VXh1NW0vQ3E4TUZvVTN4RlBkSlRQV0Q2RGdCdkFXeVU3UWNPb0dnbW5RaUpo?=
 =?utf-8?B?RS9FTW94UnpsV2FrNzVURklNaUZXNXBLZVhta3k2Q1NhenZCLzhLVko4Rllk?=
 =?utf-8?B?S0pheUE1YjY4R04wcDQyUk9EVEEyZ2hibnVCcVpUV0d5OTFKMTY0ODRlWW53?=
 =?utf-8?B?ak9Zbk9FK1ZoeE8zbVUvKzRPNldOemVhM0xyVXNZNnNnYStkSkkyYktHKzU3?=
 =?utf-8?Q?Wn3xmJXuw2vPXprI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f169db0f-e7c0-4ff6-a43b-08def2bb8ecc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 06:34:10.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX3taPssTcnlDsPKLVJpkD5s3NR7FrdXicefjtY4w9Q0he22/nS5r5pb+72k/yFgGovU4rl0DWZMG0Ys2Q5rSB0WPn2RrsbASJ3XDJAFjEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5390
X-purgate-ID: tlsNG-bad1c0/1785911654-BEEDE034-37D86F9B/0/0
X-purgate-type: clean
X-purgate-size: 1622

On 05/08/2026 7:04 am, Jan Beulich wrote:
> On 04.08.2026 19:13, Andrew Cooper wrote:
>> On 02/06/2025 10:57 am, Jan Beulich wrote:
>>> On 22.05.2025 17:00, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/alternative.c
>>>> +++ b/xen/arch/x86/alternative.c
>>>> @@ -20,7 +20,7 @@
>>>>  #define MAX_PATCH_LEN (255-1)
>>>>  
>>>>  #ifdef K8_NOP1
>>>> -static const unsigned char k8nops[] init_or_livepatch_const = {
>>>> +static const unsigned char k8_nops[] init_or_livepatch_const = {
>>>>      K8_NOP1,
>>>>      K8_NOP2,
>>>>      K8_NOP3,
>>>> @@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
>>>>      K8_NOP8,
>>>>      K8_NOP9,
>>>>  };
>>>> -static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
>>> ... the (at least visual) connection to ASM_NOP_MAX. Could I talk you into
>>> adding build time array-size checks for both arrays, to restore the
>>> connection?
>> Sorry, but I have no idea what you're asking for here.
>     BUILD_BUG_ON(ARRAY_SIZE(k8_nops) != ASM_NOP_MAX);
>     BUILD_BUG_ON(ARRAY_SIZE(p6_nops) != ASM_NOP_MAX);

The arrays are 45 bytes (and elements) long.  ASM_NOP_MAX is 9.

>
>> The use of ASM_NOP_MAX was latently buggy before; it was easy to create
>> a NULL deference if the initialiser wasn't filled in when ASM_NOP_MAX
>> changed.
> Partly, yes. But why make it worse when it can be made at least somewhat
> better?

On the contrary, I've removed an incorrect (and ineffective) attempt to
tie to ASM_NOP_MAX, and consider this form better than what was there
before.

~Andrew

