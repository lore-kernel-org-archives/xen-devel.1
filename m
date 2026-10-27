Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B67B606A31F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OGFPmL7h
Received: from list by lists.xenproject.org with outflank-mailman.1461959.1672976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdGO-0007eK-Cr; Tue, 27 Oct 2026 09:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461959.1672976; Tue, 27 Oct 2026 09:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdGO-0007eD-AG; Tue, 27 Oct 2026 09:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1461959;
 Tue, 27 Oct 2026 09:14:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xLdGM-0007e4-Ly
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:14:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLdGL-003OBO-RZ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:14:33 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ae06b79-e002-0a2a0a5209dd-0a2a4503a574-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:14:33 +0100
Received: from [52.101.43.65]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ae06b75-fae8-0a2a45030019-34652b41aa4b-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:14:33 +0100
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:14:26 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:14:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEvmPLYn9MTdl01jn9UBgFj6GUn3vHC86wh0disLEGBS+pv/7XEvumqMnW7nV+92wDeB7HUmYh8Xr8hKvnWiWJZVYtANO0gc7fKjOVdICVg4mVyK3+0Giz/+hop7RkE/qd3bEItcRUpMJHkYYIVL3K06hMg+llKEiX7q/p/9sr2lTpC9u5eKTRM33oKG4RLvIxDnMwQR8Bh+UE7I1mv1KRxIAGeqSoukdLddS6NsS/nG8baEqSCw4GyUgW8EVoVJopBxy0aL7Su9wh78IZgncsitydt7J8KJEnKeCtC9FFIihaXUjdAQ2qgssBWoYJuVB//2h37sKBDtDNEXL5sNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eTzM7Z9E3YUeaaRAPgQs78ap9xohOPO6LchaalJcjc=;
 b=iw5/bDaWFj0tknfwt6WbnFF62QulW5+el0UVurrbFpgybtq/9CZ2otPtXaKvyOkgEjNE9sacWTrESwA2v5uvBpjawctSeRKkuH9+Ai+xwlqh/Pyr/6MHEWV9L2HAFSyTypo0YCEy5p7cIMEjmdwqFaUy9YXXtC11ZNCvhnLps5UEXO/tg3y/o8NYUfmJGJxPRMB/tgI1WHRQ0yjETWD26H+pu83ExqZfVtlA169GMreG2yEe7vVylvlGZ8Nzg/soW9WIGnHhbNHTAMl3vYXOEiAABrqH5Ort8pJw5/HnozCd0AymFtZs+f+/R7nv1l7CmOGMFn5cfi4o4C0QTljqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eTzM7Z9E3YUeaaRAPgQs78ap9xohOPO6LchaalJcjc=;
 b=OGFPmL7hf1JBSnoMFMGQjSmEMyqE93DRVCydu9FzHQnJX5783THU/oovw7KI8VqczEPqns8M1vOT9ZxxMcR4ONJcUiffQr0rgKzQl6W6tjfJEwJCo5aJvBQA0SXLf1hQGpy+gaeNoP/OErmb+BKGz/4rvSBBWCFNmGi9UceCCKc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 10:14:21 +0100
Message-Id: <DMFI88UUOAJ7.19ST79GRB5D7H@amd.com>
Cc: "Nicola Vetrini" <nicola.vetrini@bugseng.com>, "Michal Orzel"
 <michal.orzel@amd.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Anthony PERARD" <anthony.perard@vates.tech>, "Julien Grall"
 <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "Doug Goldstein" <cardoe@cardoe.com>, "Grygorii Strashko"
 <grygorii_strashko@epam.com>, "Penny Zheng" <penny.zheng@amd.com>, "Ray
 Huang" <Ray.Huang@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>
X-Mailer: aerc 0.17.0
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
 <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
 <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
In-Reply-To: <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 03814793-c61d-4a06-2af6-08df340ab26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261009223027099003|56012099006|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261021135927099003|10067099003|261026121527099003|6133799003|22082099003|18002099003|5023799004|11063799006|4143699003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	Q01OHklSg4ODDVoLItdge6JVeAC79uBJ8hNeUZWWvHYkqKlSIhtHlhEb2RCU2ucSup9kSA90w+c3DnYNQZ7v7taqXUwHXA3RB4ZEcp0uxLQRVHmqHf6R4MglB6tdDlX1zI8JLt7vfJ+S+wyLOp4DDqw+DJM7kjPMEwWZO/vCgiYw6IcRcMi+d9TcehbpfexzyN/hzHx4GlenPXJyaqrwTODUa54SZmAPmJFuKUTJr0wMyRHnd/3UI7+dwNvAPDCAiN04sJHzsZjd/uSIErFZizPgw3KTcORZVY9YxlW5eMbiE1dKRSyTjOfL7PrQwMtOYVGXVNVNhhgBjFFz828dtdqd9+tTQ6hojCINv3rpKrDJ4oHrW6MByb08qhQgjBs8L7vUb6RwwJKBNO6H24KvPlOD/VWZ0awnMtODfOkmcokui66+nbpbVqDqBfjcCNYtnhB3Bnm2ugmcP0bSOCi9TH4fFrbGLGLwxv085OwZjgodgfh1dBdHjbRKorD4UBA+s3ACN9a8wSgmg1PUAA1VdF9YNbwggyQRn3XeRZWnGZ3zWE1NYRDIRTx/OuPuW/2ZnvEECTrgKUS2Q7xMg8erVZxOOS4BQbaaX9NV5mTMXRDTGFfuunw5BOYPZdKVFqmGzIqapCYFUxECZRkDpTT29DjRkX7R4gotTI9gy3Rsy6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261009223027099003)(56012099006)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261021135927099003)(10067099003)(261026121527099003)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtxcFdRbnM5c1R4dkk2WDAvUUNpOEdyNDNVNk9UWkJ3NmFuZ2R3bkl1UVlu?=
 =?utf-8?B?c2VocjRRS2ZKVmpGcUtvcWlIUldUeE5Gb3U2MzFkWW8vUHdZMytxcnpxSnhr?=
 =?utf-8?B?ZU9XUVdobUxtYXFRa3UwRUhYZ1ZGKy8ya0Q2RTFTUCtuZEpjNTczOXRXZHp3?=
 =?utf-8?B?YWRNNVorUGhrcURIQThoUEp4MlJlOUc5NmxCa0ZscStheUNBa0VUY1NsdmVq?=
 =?utf-8?B?WkNqbzhXMkVRSHM2bDRMSzkvbWlacU11aXhHdlF3ajNOYjdEZlNnT09qZkRx?=
 =?utf-8?B?QzVEM3BwNlJvQjBEQ1hXZGtteW0rU1pNMU04N3hMRm9oZndNKzFBSldBRC8w?=
 =?utf-8?B?Ymdqb3Bwem8xc0RBZWVSbmZDZVk0TnhrUmVHa3lDenNOVDJINDhSeHZBa3lC?=
 =?utf-8?B?ZzdLNC9kWkR0N0lqM0k3YjVCV1Y3eVZORHFNejRWNGtqTnZDU2YxRzBSVkhK?=
 =?utf-8?B?U3VqRWttcHVqTWcvVkpOT2xHaENLcEduOXRhVXlLTWc0Nm51SXJBOXowVnFu?=
 =?utf-8?B?aXVUT01hODVyWURBNkI0dVFNSW01SzJDNXJ1WVdpN1hrZE1GMVdkL280dnFM?=
 =?utf-8?B?eVNtZGFYY2J4bUtsc1VmQ3RablpQUllPVXR5RHFRK1A5dmFLZDVxYmZJdTdk?=
 =?utf-8?B?eXU3cy91cHhZMGZ2MGlHR0Q4dTMyMzFlSG8vMTMwU2E2Sm52cnhOTERHcGQ2?=
 =?utf-8?B?T0JZTDI4bUFQMERUakcyeCtRNFRUUzFKTDk2aWR6Q25RcGMrZDR6c2EybmpB?=
 =?utf-8?B?MEhPTVlaK2ZVMWlvTms5eFowMUlTR2RMOGZJcWV2YW1rdzRiWjBJK2NUaXdP?=
 =?utf-8?B?TFVTaUZ2QjY5ZTE2WG9RL2ZNa2tvMyt4TUFlM3FzOGw3SklCWEtIc1UyK3M5?=
 =?utf-8?B?SmJkVGcrYU9YUmQrNndRVXNvNFdDd3g5elM0Z2NWeXNGaFZoTHBHbkIya1NW?=
 =?utf-8?B?T3lSSDQ1OVRXK1BvcTUrL2FKV0VVcTJjVjZvSk5jWU5PeTZCcDlZc0gyWnZt?=
 =?utf-8?B?dnlFY29mZlo4N05NU3ZTUU53L2Nra2swTVNrUGdtL3ZzbXdYK3VzT0FXbSsz?=
 =?utf-8?B?Q05lY2ZMbU9ZSDJVOEhIN2czRXJESG5DSnhtbnA4Y0FMWlUvOC9lZVRPV3d2?=
 =?utf-8?B?a213SzlFWWp0Nk5yRzFDY3h3clpyb1IyTURFSnJZSnZoZ09sQ1JGZk5XTWx1?=
 =?utf-8?B?MU40bWk3T2VwTitPUVJ6WG5Odzc1RjBLUUc2dll1V1JLWGQrMzVIZDZtUHRU?=
 =?utf-8?B?MDFlRi85OW5uUTVPZURYS1dVSEE1cEQyc3VKaUkvTWMvSDMzekRIN3F0K2Ny?=
 =?utf-8?B?dVN6QzZWY0tnWjA3T2xxSTMwdllIWm9Wb2l5VGZJVE9UQjYxc2lQT00zWmcw?=
 =?utf-8?B?UWM1MHh3MlVvdERHM2dRMksxeG5KL3k1VjlsZGtnd2preFFRWVhJVGgvQTJx?=
 =?utf-8?B?SjhBVEZCc3k2eFRDdHdsSzBkR25RMUtkbmJYM0dwV2pSb1hueS96QTRNQkFs?=
 =?utf-8?B?YUFTdUZheUxyaDUxTzIwcVdVbElqdDRzN3BUREFiM1VWRjVrNVE2LzVDclhT?=
 =?utf-8?B?WkR1Q1VkZjVVaWI3aTBsNDJDa3VsejRKbkl0aERkWnl0TlNEeTlvSXpFMHFh?=
 =?utf-8?B?VWo4UzIzNCtjU29paHlyb3o0M3dOMStsbnl3SndDQXZNTTNjWE4rbUptOHlw?=
 =?utf-8?B?WG9HaXQzYjVMYXlxNUFJS1c2aTA0bUpDcmlCNysxbGRvamNZbThoSjR0UElK?=
 =?utf-8?B?VndXWDZwUWZEeEdWb3JyQ3B1NUJ0RkZhWFEyOU9MRWQ0MTRxQ1d3N1lJS0lo?=
 =?utf-8?B?N2lPaElNY3pTdmVjZHA4MG1XbTJ4WE5MaDgxQnF0aGZlRFNod1g1REJ4SHdk?=
 =?utf-8?B?SEMxdHZ3UG5ZRWlCanNGVkZxMTd2VFdPR3Rlcjc5cEdDY3hzdVhROFNpZGMv?=
 =?utf-8?B?Sm5VZFFzSzZQOXJGaW1ZVUxuZWFabmxKQm11a25WS2dRcXZVdThkQ2ZscTR2?=
 =?utf-8?B?anp4dWhIeGJEbmx4ZnJ3d29BOENyL3duR3lLMTNUdmpzdzRINXZHWm44MWNY?=
 =?utf-8?B?ckhzRGNtYXZOT2NkWEVpYnZyM3NaZm5oWVg5Q2hJWjI1UTZtUjUxY0NGeW8w?=
 =?utf-8?B?U3lVdldDYTU2K05HSys0TGNhbUEwZ0w3Z3dOUUZkQVdkZWlSRDVFNnh0aDBr?=
 =?utf-8?B?bTJhbjExa2t0dkpMV0tkSGp5QmlsNmZQNlNyNUNKRmFtU2RZU2MvWlNxRUZx?=
 =?utf-8?B?U0JqSDUrRVdDZ0dONEQ4SzYwWUptTXNZZVNKS2hrSEI5TVUybFpYbThjU0JP?=
 =?utf-8?B?RC9XMGlnc0h0bWdJTkVFWjQ4eUE1SHJQR2xiZDBBZXBWbTk4MFZZUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03814793-c61d-4a06-2af6-08df340ab26d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:14:25.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gobGKvdMHa7+7jrb5uBJeP+PVhRg1A7E3qC+ZIg4HP3CtdkF/vIXzLGEmVSb3nZsKHk3bcOK3SaxToH1Yc4CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
X-purgate-ID: tlsNG-33051d/1793092473-774F44E9-B440E92A/0/0
X-purgate-type: clean
X-purgate-size: 5715
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Oct 27, 2026 at 9:18 AM CET, Chen, Shuaidong wrote:
>
> On 10/26/2026 9:14 PM, Jan Beulich wrote:
> > On 26.10.2026 04:03, Shuaidong Chen wrote:
> >> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
> >> deviated by two separate entries.  One covers 'if' statements and
> >> conditional operators and places no restriction on where the invariant
> >> condition comes from.  The other covers 'switch' statements, but only
> >> when the controlling expression is a 'sizeof' operator.
> >>
> >> The rationale recorded for the two is the same: the condition is
> >> deliberate.  Nothing about a 'switch' makes an invariant condition les=
s
> >> deliberate than the same condition in an 'if', so the 'sizeof'
> >> restriction reads as an artefact of that entry having been added for
> >> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
> >> as a considered limit.
> > Well,
> >
> >      if ( 1 )
> >
> > can make sense, especially when 1 is the expansion of e.g. IS_ENABLED()=
.
> > Otoh
> >
> >      switch ( 1 )
> >
> > doesn't make a lot of sense, even when it's as a result of the expandin=
g
> > IS_ENABLED(). I agree that limiting to just sizeof() is unnecessarily
> > strict; alignof(), for example, should about always be usable where
> > sizeof() is. Yet making if() and switch() equal is imo going too far. I
> > realize though that it may be difficult to find a suitable boundary.
> > Stefano - do you possibly still have notes from the discussions long ag=
o?
> >
> >> Fold switch_stmt into the general entry and drop the 'sizeof'-restrict=
ed
> >> one, which the general predicate now subsumes.  Invariant 'switch'
> >> conditions that are not a 'sizeof' become deliberate as a result; that
> >> is the intent.
> >>
> >> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
> > What you don't say at all: Does this help with any remaining violations=
?
> >
> > Jan
> Yes, and let me give the full context, since the motivation comes from
> downstream safety work rather than from the upstream analysis.
>
> On safety branch one of the techniques we rely on there is to pin build-t=
ime
> configuration to compile-time constants, so that the code which the
> intended configuration can never reach is removed by the compiler
> rather than merely left untested.=C2=A0 That matters for us in two ways:
> code eliminated at compile time does not enter the coverage
> denominator, and - more importantly - it is not in the binary at all,
> so it does not have to be carried through the whole qualification
> chain.
>
> Two examples:
>
> https://gitlab.com/amd-xen-safety/xen/-/commit/160dac43f554733a68d83c38cc=
1d0e73b3b7bff0
> https://gitlab.com/amd-xen-safety/xen/-/commit/e0eccfa7184b7acee23916cd5c=
b2a3b5afa101f2
>
> A side effect of this is that some of those constants end up as the
> controlling expression of an switch statement, which then
> trips R14.3.
>
>  > Otoh switch ( 1 ) doesn't make a lot of sense
>
> Agreed in the abstract, and I would push back on anyone writing that
> by hand.=C2=A0 But that is not what happens here.=C2=A0 The sources still=
 read
>
>  =C2=A0 switch ( gt->gt_version )
>  =C2=A0 switch ( opt_bootscrub )
>
> exactly as upstream wrote them, against what upstream intends as a
> runtime-variable value.=C2=A0 The constant only appears after a build
> configuration specialises that value.=C2=A0 So the construct is not a
> pointless switch on a literal; it is ordinary upstream code that a
> particular configuration has made invariant - which is precisely the
> situation the existing 'deliberate' deviation for if statements and
>
> conditional operators already covers.
>
> Of course the other alternative: rewrite those switches as
> if/else chains, which the existing deviation would already cover it, and=
=20
> the violations gone. Technically that works.
>
> The reason I would rather not is that it is churn in common code for no=20
> functional
> reason, carried indefinitely as a delta against upstream, and it makes
> every subsequent rebase of the safety branch more expensive.
>
> Having seen that a deviation for switch already exists - restricted to
> sizeof - extending it to switch in general seemed the smaller and more
> honest change: it states that an invariant switch condition is
> deliberate, just as the project already states for if and for the
> conditional operators.
>
> -Shuaidong

To build further on this. add_sized() is one such case (already covered
by the disappearing exception. There are existing cases in the upstream
tree where this is or will be the case, but due to their being inside
macros become invisible to Eclair.

Or my (still not resent) cpu_vendor() series, I rely on placing
X86_VENDOR_X constants as invariant expressions in switch statements.
Even if nothing does it today, MISRA would be prohibiting constification
of any global that happens to go in a switch for no particular benefit.

IOW: This isn't about hardcoded values, it's about IS_ENABLED() gating
and DCE.

On the specifics of the patch, it's not exclusive to switches. I'd much
rather see it extended to for loops as well.

    for ( unsigned int i =3D 0; i < NR_MAX_FOOS; i++ )
        ...

Where having NR_MAX_FOOS be zero is effectively a guard on the whole
loop. Today we need explicit early IS_ENABLED()-gated exits to keep
Eclair happy on some such statements, and that's just strictly worse.

Shuaidong had to recently fix these violations in our tree because the
spirit of the existing exception is needlessly exclusive to "if"
statements.

Cheers,
Alejandro

