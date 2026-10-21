Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DE606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=SowU99M3
Received: from list by lists.xenproject.org with outflank-mailman.1457480.1670249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJZdI-00088e-7y; Wed, 21 Oct 2026 16:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457480.1670249; Wed, 21 Oct 2026 16:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJZdI-00088X-2y; Wed, 21 Oct 2026 16:57:44 +0000
Received: by outflank-mailman (input) for mailman id 1457480;
 Wed, 21 Oct 2026 16:57:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xJZdG-00088R-G6
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 16:57:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJZdF-004AO0-IV
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 18:57:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad8eefc-8faa-0a2a0a5109dd-0a2a45058d0a-20
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 18:57:41 +0200
Received: from [52.101.201.43]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad8ef03-4cb1-0a2a45050019-3465c92b9998-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 18:57:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH6PR03MB997196.namprd03.prod.outlook.com (2603:10b6:510:3dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 16:57:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:57:36 +0000
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
 b=Pc3Mzx1ZwlkbO/f2zJWJ6k3kwhq0lqPeMVvnLTTOTMW5JwUYlSte9Fp3LFK/NZSLXL3TzcMIFX9h4bSKMvLvRFk5l72jPWI2y5kiF9JQ5fyg/zEXQQBlX17lo2eYre6bMOoY8tDqqzljDogdHDdPd8MsRik7XluKae3CAbaSD4G+0D5q8kflCE+sPkt8KXb9A6HrQUmTRzEjlUvNrwQPAupi1j6qh8Riqlv1fBeIUV9xBP56UqsTcy6pvhkTQeF4uCvrnn10hnG4w53YwIbOHGipVTckcl00d45vfxRe9hc+9F1WS+SuL5S6KAdEDOhxRlOYCLrETzZqJgQpDmGCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSdRuYQevsR9txi9ntwH53BkqPEjU13DFaNpYuthTNw=;
 b=YZyQTwZjnxq8ydCEeCB+1J0/DxuilufD/cPVdA8vXrrXjGajC3nefu+SGs9Svo2B6T9YR9G8Zp3iBg89vwwt7NzED/DsBogyL9Piqz9pUa8AaTjxEaNykKRUGFbQKkXJNf4verXgdLnbEufb3PuzVt3/MZokP/xvF9K6XOfsfWAGwLCMuTrr2kctp3l1xFjV4rmMu8buY3075Iz6YkHknYV4nCP+ezpD+g9mibzUNs+v+DdiEPMz/m78af9Au1dmNnv7pTpoPMnjo+rndY0Co1BTVMWV4swsh7Qvb6fbxenBtcXRG3RA3617qgO4C+kCYYi74lEnTCtp40y/y96YxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSdRuYQevsR9txi9ntwH53BkqPEjU13DFaNpYuthTNw=;
 b=SowU99M3RXxDhUEd3f95Rt1+Tq8QlW3wPUyWK72h+Q5bEIht5zJ8fLY7+FRtlLJgdJKInXK+qMvzTk856Ir6bzGSbL20DN2W3FL4Vi7cC9BZfCG3W0NZkhkEU77EY8iL1uNOmRb5c6/Ix3wjzsWpKvDgOAMljayigat4QKrz5iU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <02d1a710-fdb4-479e-af2b-41755aa97d92@citrix.com>
Date: Wed, 21 Oct 2026 17:57:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 26/30] x86/svm: clear the VMCB clean bits in
 svm_ctxt_switch_from()
To: George Dunlap <gwd@xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-26-b68b66652266@xenproject.org>
 <44c485d8-1d57-4c59-9484-7c52303fbe2c@citrix.com>
 <CAFLBxZbVgmpRp+dTZYRqw4aCjeURpb2=k0-fmMfycFRnWPx99g@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAFLBxZbVgmpRp+dTZYRqw4aCjeURpb2=k0-fmMfycFRnWPx99g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0656.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH6PR03MB997196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aac804d-613d-454a-4ce3-08df2f9468a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|10067099003|18002099003|261021121427099002|22082099003;
X-Microsoft-Antispam-Message-Info:
	ldufVY6w6xtWSwe4U490JD2eOIJDCZcD5wMHpFweq9BOkqEPzA/cvcWqIUWCEG3tnF7+UnserngoI0pDYF4g+yEzQncSDGGITFYl2zzdb31PdtTYnPICLwhsUbERuAjmgFWsKL4KtidJAbXbhjPQBkg0dbM8uRQKJccW3N/mLys8gpmJ5PYifUhl9gAUfNrRwTVpmJWufvnMBX6kYl/8hzaP9pL7o5cklBRjrLz/8fueS3VFi4exos/USTZ7T5xnn/8g/NCcpOG11e8Dml/tpK7dqqeVu10fL2DbaLRNCioM4+pD+maeAXJdMd4OK7oyptdOh+mA0nPd7jH+O+2AnGDA+1rY5TNnpyOUMPMAQwuzYFxczdMRn5Ykpl0OWprVaD7g8Yo3gbQPGCrZIkXGzWxjC135rzcuqepbmqRKDHU3rK7Q9y4ZScRHRNjSfwzernCVlDWsWdoAWelttdx4N2Ur9ZoaRRic5kybOGFqXLxsnb20cyMLXd8EJEqlkcnPExan0QoTwybsY+DOkzuPOOVgMVdPd8+nj8SeCFaXqZJpBJkoEWu1H4+D04NOnKrHQMcZNlLcDj99ItslJnZYMsyzODFwHxmU3MgOSOLNrb5FuTN0o5kRKF2u2ckcWO0toUwXZEJGFJHTxbE+qA150hIld68DSKKCdMH9w6doaPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(261021121427099002)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVlqanBXUm1hblhEUzFYTzhuVkUrT2wra1NWdXBFQ21hN3FwUlZYcjRUMXh3?=
 =?utf-8?B?ZWlwTmZNRFRxQjFjVjllYm5Gems5Y2lhRFg1VWE2SUZUSGgyUWt6aEQ2dlgr?=
 =?utf-8?B?VkdaVE9wZHFqdGsrRzl4bXhlcUJBUmRsT0ZyQzRWNVM5dk14MWpDSnJjajhq?=
 =?utf-8?B?ZFFOR1phQUpieHA1a0FDR1BKOFJqTDIyOGhSM09Ma3hYMUVIQjQzZ2xNWlZS?=
 =?utf-8?B?MWU4L3JRNzZxOVFQaUtva2NNM1JUVnJhNC9TbUsxVmhDd0VGZFpodmhNWFln?=
 =?utf-8?B?bWxXaXFhZWp3MlNkc2xNZjd6cVA1WVRjZVA0TGh6dmxvUkprd29BR21ublVp?=
 =?utf-8?B?Q1VkbHo0aG9ySmo1dzN3b21VS0VRK0xkNnhLTWRKRGl0TEFGK1YxZ3BEdTdy?=
 =?utf-8?B?NU9QMXJaRWNFdVRPeHJYV1NXOGh4em1vNTAvdEhLZExRZkZEWWlXaFFuTG5t?=
 =?utf-8?B?OVg5S0o4Y2ZhVzJoTjJ1eTZleDFrajR3eGU2V3AwckNoVHFrbmlFVTluNXZ3?=
 =?utf-8?B?aUw2aVVPQjE1WHkzMUVESmx0dWl5WFUrRk1ISWxTeVMwSnlSb0xCY1AyZE92?=
 =?utf-8?B?YUlZN3A1dWJTU2pGdW1FVU52Mkh2cG1sakpqZC9nMnExK2pxZzZCcExiQUxU?=
 =?utf-8?B?UG5mS29LenNJRWhsaTlQdVZ4aitpNXNRWFFOeU5rWlMxbExPY05oeFFtZFh2?=
 =?utf-8?B?eDNSR251QVRzRERFc0dpODA5bUM5dW5venJlMUtQa3JjNFhSOWljZ2FaUnBy?=
 =?utf-8?B?ZXBVMGdBQ09jd3pobWVrWnZHZC8reHdzZUFlMjRNU214eVZCdFFnS1B6ZEdY?=
 =?utf-8?B?ZVNmZFNzc0kyV09jOU1OMlY5RHFUbUhxbmt4di81WmFkemg4VHhaTVR1VkVm?=
 =?utf-8?B?bCtIcWhtQ0lYNmo5MHJYOEJjL2lpQ0pSdm0rVkdmN0xEU25aWmtLUzJieERB?=
 =?utf-8?B?b1lNVjg5TSsvczBHN0FzbEFyQTlVSW5wZDRqa1RKMkFmSGVkVjQrbElHYTNE?=
 =?utf-8?B?ckcyNW9ONVorc0RxYkliU2JDdnZaWTlSTS9aL2w4R1V5SVZhM3ZKZkduUkNH?=
 =?utf-8?B?eGpjemdyWlNndEZOOXFhVFJiZkhaS1hXZG9GTUZLRi9jOHo3YW9WQjgwVTl6?=
 =?utf-8?B?ZUtaU3puY0RrVnQ4MzFaZjJCN0d2SXZTUmYrajRGOGwvWU14VEhXbTFEQnJX?=
 =?utf-8?B?L1JiM0RWSzJDaC9NTng4UWlRcTNrdVg5Y213TUFPTEdEM3NhU3o3WkJlSVh4?=
 =?utf-8?B?YUtuOUJTbnpERDhTbUtNem9CakR6OVR4ekxnT0VzdnA2MXBWT2dCRFN0YXEy?=
 =?utf-8?B?K0FnYjl1YmdZSWZsZTNsT1hXWHplcjFlYTVtR1BlVE1MeHJQbXo0Z0xnZEpY?=
 =?utf-8?B?Zm1XWmRnMnFBcWZYMWhqOXdDNmVweDcrVHhyb0tqWmFmdHpTdERRWXBLSjNJ?=
 =?utf-8?B?c3Erdi9SZFQ1TG9ZbDZKMWU1c1JVV3VPSnlKNHltaUlvRkFJc1NNV3VVNFdR?=
 =?utf-8?B?Unp1SkRhQVlCVzF0OUVKT25IU3NsQVE1QzFBV2w2Um91cThsSEZVNE1NaVlF?=
 =?utf-8?B?VmtMbW0xQXFNaWpEVnpOOHJ3Rzg2MG8xV1VndzVKcnFRMXdMUm5MMERWQzFy?=
 =?utf-8?B?RDI1eHZkc1UvdWc3K1VFb0tCRUdtdzdCNUlDYWxXZHRwQ3FraUlIcnF3RUNL?=
 =?utf-8?B?RFFmM1VxdG1vMWZhVUdxZWF1RnBRNDkyYWdjL1NJbmEyNDR2SlVzbnpOU1U5?=
 =?utf-8?B?b1lFMUJwV3hyc3R6ekgrbk4yOTF3bmJRRWp1SXhkZXR0cHBxWjlWY2dYY2Rj?=
 =?utf-8?B?MDVEQ3lvUHR1NHZ5ZE9mL2hIUmhnbVNtR0NXUVB1eWo0T3ZMTk5xbzRCTEdI?=
 =?utf-8?B?aDFzdlV4OUF5VUVYZDdRNkxOalBXc1JxVHlrcWg0WS9kMFVMNTByTjhDNHJB?=
 =?utf-8?B?UDhmMWFFcWF2Rm85Mi9FeWl0WEZvRjZ0TlpjNXZmTm5zQ0JxMXJNYXdGQmNL?=
 =?utf-8?B?TEZFd1c4RldIZ2VRaWdkbnZMcHNxY1ZpN1ZCWS9aSERvT1dqWGtjZjkzM0dw?=
 =?utf-8?B?bnVxNVJyNU9tR2xKWjZvV1RkQUh2YXhhbWFyNVUvck94Q1BzckEyb1VDelVp?=
 =?utf-8?B?ODFyQnBPOVVUUlp0MjZiMmpTRDVmRzYzU0lsT0FRM2NZYlIxOTYrNVpGeStj?=
 =?utf-8?B?Zld5TVgrMHBjRUFUMUdSVVl1YUNVT2pLSFk0WnNEWjN5R2lyT1ZKK3NxTEJ6?=
 =?utf-8?B?TVhwazk2RVgzQ0c1YXpSWHZHOWlEKzQrMzZCaVdoYjg5ZU4wRmpVejh0cEhv?=
 =?utf-8?B?TjV6RDQ4c3pEblJzL3UySi9sWGZZWFArNnFjRllRZUwrUVZ2WU00UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aac804d-613d-454a-4ce3-08df2f9468a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:57:36.7986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/vja361F2qPN/UhQ8In7yIEmLQ2+JKubWixPQ41sPkp0FvBDmtVq6qsBMgwz16eF/pUPLBSq+H9THMeqFsmy24g4AFiH435YEikS9nrhBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR03MB997196
X-purgate-ID: tlsNG-c201ff/1792601861-F76BD2A1-DFD56D57/0/0
X-purgate-type: clean
X-purgate-size: 550
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 5:02 pm, George Dunlap wrote:
> On Wed, Oct 21, 2026 at 10:22 AM Ross Lagerwall
> <ross.lagerwall@citrix.com> wrote:
>> FYI I posted "x86/svm: Don't clear clean bits on every context switch" a few
>> weeks ago which moves it into svm_do_resume(). I think that is preferable for
>> the reasons mentioned in the patch and IIUC would still be after the vCPU's
>> VMCB is mapped.
>
> OK; since yours is a single patch with two acks, I'll rebase onto yours.

I thought I'd already committed it...   Apparently not.

~Andrew

