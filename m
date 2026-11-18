Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981860A261A
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 19:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=zPuqXSsk
Received: from list by lists.xenproject.org with outflank-mailman.1495077.1694252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkzk-0007V7-3u; Wed, 18 Nov 2026 19:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495077.1694252; Wed, 18 Nov 2026 19:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkzk-0007V0-1D; Wed, 18 Nov 2026 19:07:00 +0000
Received: by outflank-mailman (input) for mailman id 1495077;
 Wed, 18 Nov 2026 19:06:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTkzi-0007Uu-Kv
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 19:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTkzh-005dPu-Py
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 20:06:57 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf724-2eae-0a2a0a5409dd-0a2a4508cf96-32
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 20:06:57 +0100
Received: from [52.101.52.19]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf750-f659-0a2a45080019-34653413ed16-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 20:06:57 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5455.namprd03.prod.outlook.com (2603:10b6:a03:27b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 19:06:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 19:06:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONyYPMK1kW2T14KQD4fK9flfjpjbO5V/qOP/hT7dFGjH/uiuRG2TXHpNfxH/CFqeVArnsSSZwoTfBlVa4VF1vYFSc8CNDnmE4Qk1KUdKrCW8y39AT1LzkBx6bQhR5h1Efqcv/0v6DpuiUlvw+wV71wV05WPk4y7tEjcGVIs0QbyJT7JTCTIfmW+bpc1SGfrM6T25t0AF4aMn6Z2Hecqq4NSq/v668dgMi0sMQUGQMwQbIGBKunF5qG6w58rt0OJNXLJ6gVM1Hm43XyaZnu5/DczzE5ezizMbIJ8nrCI0p/A3jXliGkJucM5xKUmlyJpln7DusyqLAYIYsGIToq9CHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c66O73/2WiZ06hCEBvA1+fnMqxrf5Ta0KUpNouuiz8M=;
 b=wD0Z/EX6TELaKQxduGG1/WSRZ5Sn3thS90u4z2yZ7O6MIfzde480FOoObiJ1cQ4YAeHjDOEv4wF2R9pbN+TGqizBHwDj4uSHXv3jkPS7uaWObGjBQvGUxfTLuH94B8J/qalxXUJXWbG4LtprbSlHTTrRIxgCc869Bah3x0PmwQYk3llAlH96O4k4UzsAdiKGQUIz/iuqd5jAFkc6PPBrQvunK1pA8KK6kyNwkhJTMmkrD2n/jTY4xCJDlXChShjOrFs2Dv3/lhcvf97/wnERVviWDsRwkmjfL0VhWk9DfjdJ+MABDRYhbBZNsWmGpq50PF04O0idP9kcGYJZxIT0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c66O73/2WiZ06hCEBvA1+fnMqxrf5Ta0KUpNouuiz8M=;
 b=zPuqXSskz+VWVTPpybjBw2arHXYhoU2Ijmv4ru4oB/mhHqP3NF8QohR9Na0wr4xC1ZdhE/jDL0Cbm5FqT0V79VyPVAgPaTo+6wnL6JYr9zSpm0B2P7CKpwh8KynLCG9sLLTx20sLU7llvS0TfiIUfBF5/wlkJf9znBWUgpgfUuw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6fd2fff3-d470-430e-a567-3f06b88ac79c@citrix.com>
Date: Wed, 18 Nov 2026 19:06:50 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/5] x86/amd: Make cpu_has_amd_erratum() non-variadic
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
 <20261118171758.1125066-5-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261118171758.1125066-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: f07a63f7-27bd-4125-f7a2-08df45a71bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|5023799004|261021123027099003|4143699003|11063799006|56012099006|261026140227099003|10067099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vkBsZgVt/r4G5wHBCQ18Dsxz8x7VTmGcEQsHn8bLKE1dlII7dkZgq/bZ96mW4xrZLJ10qGFGy47yN3QNB8Kz4GA4MSuqkuPVf4sPRGd995fZ0ISWI0FuTHeFyhnYhl5k+9dPPw7NI/fHPG+GzXS8+L/aJHdhyUw2OAuSptVBYHBDrhpQgN4cNr4w8IyfO9tCKXHlMGEn5OW2YLAdbT01DvG3lgVyCy+cCLfLpwVbw0w6pFzZTIwyECB/7zHNCQS70hGOErmA5qexIfz5Cew4UlKhmAJhAHk63lV1ZoBl7gm7mIo142d/b2YvK99AYcY9OXPDCQCS3RSUmbWp4HEwNtCtpMkBF6RFSNBctPn8+kNSpf2PXxkT4G+7SDpVDdxWj/U8dlViCeTo/CQA3RHKDtjl/beTkmPb6v4fPMs9Gj568PUGJR57DjFM98/6O2udWEXJYPWRXfb96i129q/JuUOmbEBXLk5Ul4T3qH7IHAb8jgOh4aLEClmPPAhfvGuiZWnv4wwrHUbeXlE6Rb3yfZFbqeF3fwovLdVasC/CkHLRVTZQ3htqQ9CduXMQjvBJC+2WCJ50VlU5x1EZOf4uk+pX4EsMegPaNbdcanmEDY3kb0I8JRXBiT03mrG0pCT4KYPrBKfaIazSerQEIu1F0x+HgcjfmFO0naAgL7EqWj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(5023799004)(261021123027099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(10067099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFAydk5NWnFNVzd5Q1JvOGM5bStCYUJtUUhCY3NpVEU4Sjh1ZVhCelNMTDBo?=
 =?utf-8?B?bTNrV2wwTzZYUEtWank4U0JudzRSSHNiV3F3S1NOb3VwNnAveGRZbk53TFZX?=
 =?utf-8?B?b0x4eVplaUlVZ2dNNVd4SzlpejUzS2pwYzRHcGhyWE1BcXlUc1FMYjF1YmRp?=
 =?utf-8?B?MW5HZlNFM1BWdUpyL2lqSE5naitlZ285a1pwb0djR1BUQlB2SEtlK1FteGV4?=
 =?utf-8?B?Wmx2QXl3RnI1YTF5K0RMUHlQb1Q3UU1aNkpIRk1ZcEFqQ21tZy90UmNDcHMz?=
 =?utf-8?B?U3J4VkhoUjlBWldBc1pNTWc4MlNINDZSSW5zOC9DL1F1K0JBdUV0OSt3cEdo?=
 =?utf-8?B?R2JOalg3eTl1aDFzbjJ5M1g4aElXdnJQWU9SWGFyS0hKbDZsWVp0d1cyOUpt?=
 =?utf-8?B?RCtqV05YeVREUC9lSG1DZ3o4bTRkUjErOXVidkdVbVhMM0VrMmpWUWoyMFgz?=
 =?utf-8?B?dEFoUkI3QTM1L1dpQVY0RVRQaktNSm5UUExNRSs1eWF4WWFVZEJBWTh2dWpV?=
 =?utf-8?B?bmx3NmhGckY1a3F5RlFWejNKbGtIbllWWG9wdDBFdU03WGV6SGRHb3NvdjRl?=
 =?utf-8?B?ZENmVUJiS25Mb3NVc2dSaEFzQzhQSVoyczE3L0thellyNno4clA1RGtzQ0JR?=
 =?utf-8?B?NUlDVnpmM0xidk1POXNJcS91T0NyMHB2bjZnSGU2bDJzd3hTNnVjWFhEMUpT?=
 =?utf-8?B?ZGswTmVUM3E4OHZJbGJaeUpNTWpxVkR6NlFzTEFpaUVERkpNYW5HWmxXcXdt?=
 =?utf-8?B?SHI3a3VkSXRHYUtIWFBxOTRsN2xQakxndmNBcHJIU3Zyajc5dEVCcDJ1WDNF?=
 =?utf-8?B?bnJDMlFUdkc1Vi9nVVRpTlp0Zk5DbW1LN3JlbHVaNVlBSVh1bkZXTUVQWmZ6?=
 =?utf-8?B?YnJQbWJqZ0xKeUtiMU5sRWxWUDZtMmJ3ZFB5bUUzcmtSTFRNWlVwSHhHdTVN?=
 =?utf-8?B?aGwwRVlRNVZLWFd4VFpxY2p1WVZFeWdmZmUrSzJnTFB5eE9FclcwcUROSmMz?=
 =?utf-8?B?SzFET0N3bGZuTmtydWh3UHdpL0ZJYWNxSWFZWStnQzFHbno0cWhNQisxeTEy?=
 =?utf-8?B?UlQ3SDdFMmpDZ1E3eVJyQTJhem1xRmlyK00rQnJrTS9sUGN0VGVaMWRXVERD?=
 =?utf-8?B?MnJCcGduQnAzcFpOOGZYRk9Cb0h5Rk9QUmh0N0JEd3hzSmlnR1M5NU5xMk5p?=
 =?utf-8?B?K1E0YWduT3BUakZEb0xRRUdweW96bnRtRFMySENFdEsyVU1XOEh6Y2FtdWM0?=
 =?utf-8?B?V2M2d3ZoMlQ3TWZBdjMyenMyVm03bGlxcEd1VmZqdnVYSEdaMHZwb05kQy82?=
 =?utf-8?B?T1U0MjdZdmU3UzFkYzd5SjI4SU1xcERubFVOdklOSVUzeXJEcmI0eE9BVXJJ?=
 =?utf-8?B?VnRJUlBpbi8xakIyUFZzRllsUnNnTlc0NFZWTzI0STc0QVdCSE9hd21nZ3VM?=
 =?utf-8?B?dUtsUllhcGgzNXNYVzFzYmZSdVc4QUxsdjJXVWtDa3RmRVg4Tm9TY1dSNkJS?=
 =?utf-8?B?TnE5b01Pd3VoWk9QWW1KY2JUeXR6VW13L0JYV0ZTbjVKWWM0aTBGQkpNWGFk?=
 =?utf-8?B?cmRBeEdhcUU2Yys1S21yKy9Ta2NrMVNHL1dVdk51U1NKQWFic0hBWHRIc2R1?=
 =?utf-8?B?UE04aFJZN0hzaXFvR2VBRDJtNXV3alQvTzkwK00yRU4rS0RpTXVZWnMzbndQ?=
 =?utf-8?B?bmlrWWxGU2ZpaTNmUGFvdmd5T0xxdzJjd1NNV3dIdllUWDRwdDVKeElQQito?=
 =?utf-8?B?QmFGRVNHbzVGNWlHeTMzVDBVYlJ4NzZ4RWJDZmpYTi9MZUF4UXJXQkxodVg4?=
 =?utf-8?B?U3RTQWltZU1waXZlTkhMUnI1SXM4NlBmbGRSVE9yV3ZOTU51Nk9HQXpPc0sy?=
 =?utf-8?B?SmUrT054OU1YSno5T0hZZUpIbloycUF4SXpuZGpqdXM2Z3p3ZUNua1Iwb3NL?=
 =?utf-8?B?MjByakVIcFNXNkdRckZLQkJ5ZlJwQlA3ZlJUYTEwQ0cyY1BNNjdPdENDZm5D?=
 =?utf-8?B?NTRGOC8ydFVLc1EzMUc4emFqRnZBYkl0aTYvTFN3Q0J6TzNmL09qV05UWWw0?=
 =?utf-8?B?SEZnWU12TU9NWng1WmtRUGF1Sis5a3NzUTE2SEsrZ0g5RU5tK3B1SkM2MzJy?=
 =?utf-8?B?elZKQ29RZmc3b1FQaVFqV2o0dVpPZWVjaVkxZWlQM0lpcDNSTEhxVktnWmRv?=
 =?utf-8?B?ZVZjaGduVGgwM2NaeDB5cTg1d0dNSHNhU2JqcFhsNDk5VzVCYXptMGVQOC9V?=
 =?utf-8?B?cEwxRHhkMDJVUEI0T1EzMmgvMW9ZTDI2T2NaVmZYR0h3NWR0ZGN1aUUwOE9V?=
 =?utf-8?B?cU9pOXNuT3VuQVpBbDJ3NEFvYis5MkttYzg4YkFERWJEYkdvUENtOGcxYUo1?=
 =?utf-8?Q?ZubltsaE8hip2Te4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07a63f7-27bd-4125-f7a2-08df45a71bd7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 19:06:53.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIqk5DRsWAGhU12cs9F5vEzMYllE9Nc5wyvqThCFfkL+HdvQ76KlqH2ypAg93owtnIxMaA/a8cG9lAHV7SEFZY2+zHuHQwCSK5bxuw5ZC6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5455
X-purgate-ID: tlsNG-c1860d/1795028817-D457487B-0D3EEA26/0/0
X-purgate-type: clean
X-purgate-size: 4713
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 5:17 pm, Alejandro Vallejo wrote:
> cpu_has_amd_erratum() takes the OSVW id and the family-model-stepping
> ranges of an erratum as variadic arguments, which MISRA C Rule 17.1
> forbids.
>
> Have AMD_LEGACY_ERRATUM() and AMD_OSVW_ERRATUM() expand to a
> zero-terminated array instead, and have cpu_has_amd_erratum() walk it.
> Callers pass the AMD_ERRATUM_* macros, so they are unaffected.
>
> No functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/cpu/amd.c         | 14 ++++++--------
>  xen/arch/x86/include/asm/amd.h | 11 +++++++----
>  2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index fbbba0005c..5e22fff81c 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -321,10 +321,10 @@ void amd_set_cpuid_user_dis(bool enable)
>   * Check for the presence of an AMD erratum. Arguments are defined in amd.h 
>   * for each known erratum. Return 1 if erratum is found.
>   */
> -int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
> +int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, const int *erratum)
>  {
> -	va_list ap;
> -	u32 range;
> +	int osvw_id = erratum[0];
> +	const int *p;
>  	u32 ms;
>  	
>  	if (cpu->vendor != X86_VENDOR_AMD)
> @@ -346,19 +346,17 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
>  	}
>  
>  	/* OSVW unavailable or ID unknown, match family-model-stepping range */
> -	va_start(ap, osvw_id);
> -
>  	ms = (cpu->model << 4) | cpu->stepping;
> -	while ((range = va_arg(ap, int))) {
> +	for (p = &erratum[1]; *p; p++) {
> +		u32 range = *p;
> +
>  		if ((cpu->family == AMD_MODEL_RANGE_FAMILY(range)) &&
>  		    (ms >= AMD_MODEL_RANGE_START(range)) &&
>  		    (ms <= AMD_MODEL_RANGE_END(range))) {
> -			va_end(ap);
>  			return 1;
>  		}
>  	}
>  
> -	va_end(ap);
>  	return 0;
>  }
>  
> diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> index d21df0741a..d897943210 100644
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -12,7 +12,8 @@
>   * Errata are defined using the AMD_LEGACY_ERRATUM() or AMD_OSVW_ERRATUM()
>   * macros. The latter is intended for newer errata that have an OSVW id
>   * assigned, which it takes as first argument. Both take a variable number
> - * of family-specific model-stepping ranges created by AMD_MODEL_RANGE().
> + * of family-specific model-stepping ranges created by AMD_MODEL_RANGE(),
> + * and yield a zero-terminated array to pass to cpu_has_amd_erratum().
>   *
>   * Example 1:
>   * #define AMD_ERRATUM_319                                              \
> @@ -26,8 +27,10 @@
>   *   
>   */
>  
> -#define AMD_LEGACY_ERRATUM(...)         -1 /* legacy */, __VA_ARGS__, 0
> -#define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
> +#define AMD_LEGACY_ERRATUM(...) \
> +    ((const int[]){ -1 /* legacy */, __VA_ARGS__, 0 })
> +#define AMD_OSVW_ERRATUM(osvw_id, ...) \
> +    ((const int[]){ osvw_id, __VA_ARGS__, 0 })
>  #define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
>      (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
>       ((m_end) << 4) | (s_end))
> @@ -72,7 +75,7 @@
>  #define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
>  
>  struct cpuinfo_x86;
> -int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
> +int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, const int *erratum);
>  
>  extern int8_t opt_allow_unsafe;
>  

This whole infrastructure is garbage.  I believe Linux dropped it a long
time back.

If you see, we only ever encode LEGACY errata with it, meaning the
osvw_id is always -1, meaning the OSVW MSR accesses is
cpu_has_amd_erratum() are truly unreachable even in safety builds.

Next, have you seen what a disaster of code generation this actually
causes at callers?  It's an anonymous array on the stack, which means
it's (re)initialised every time it's called.  One of these is even in
domain_create().

OSVW was a short-sighted and now abandoned idea of AMDs.  There are
something like 4(?) bits defined, but there's no index of what they are
so you have to search all the revision guides to find them.

Could I at least talk you into dropping the osvw_id part?  Xen does
nothing with OSVW at all, and if we ever feel the need to gain some use,
it will not be like this.

But, if you were to see about moving the arrays out to being static
objects too, I think the result would be a whole lot less unpalatable.

~Andrew

