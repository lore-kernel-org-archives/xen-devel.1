Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12988606A327
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=JNs1867q
Received: from list by lists.xenproject.org with outflank-mailman.1486190.1689044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRXn2-0006l7-8M; Thu, 12 Nov 2026 16:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486190.1689044; Thu, 12 Nov 2026 16:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRXn2-0006kz-5Y; Thu, 12 Nov 2026 16:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1486190;
 Thu, 12 Nov 2026 16:36:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRXn0-0006kr-Ii
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:36:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRXmz-002TRj-Vp
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 17:36:41 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5eb03-2eae-0a2a0a5409dd-0a2a4503c748-46
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 17:36:41 +0100
Received: from [40.107.208.55]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5eb18-fae8-0a2a45030019-286bd037a0db-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 17:36:41 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6236.namprd03.prod.outlook.com (2603:10b6:510:d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 16:36:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 16:36:38 +0000
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
 b=XLnFIfy83oPb02dtZcybZSu5vK1ovMiFRTsu3wWL7Xq4Ygspj5KBKswA80VZaCd1wd7GJIM32TpYTGA1W4y5VtfX6ktxZJHQE6b/oHxfjuhkOLwxfgaSgp9fO7dwKfPYTspFea/ccPaFFlfP1mt7CmouNBI+uod11f0fcmKHo4xLfnebqaqFUoxQT7e3xBkUUKiYtbCUBQiFyoz0x/69RqqTOSLaUKGgiW6mNyfxGrPlZf5IAdnHOy3xoN0gyxyvGQr6pN697tWeJ86h0qeLondjdw9BNA0Y1aev1EUvWhDozJTCWUgzZr9Ab24d8zLMfpzS+TQFR63JS4QU5g/uLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaAUyiv03wVPSBp9Zq0VZKKHilk6QYmWc7EN9b4sYew=;
 b=MsB+o+SDEmsFYJYWa3XnE1KlY+wPGUjPzYnLC4+jg82tWiRm0thoV9K1Aotm8yMh4fJOTpOpuWVuFhEkk4DR4nDaKsv9c/0LC+I7kYiscNgFUj1Cbl951o8x69QatkNiyUmRlTTZtpPybNPGRb6OaKulMxHNQCnFm3InoxMzUSDY/80xiZRpeu6/FYV3f5iqrTdjD+e2ba3dqTTnBdExSeX4Vl1tUMxheqvz7A17XWg1aPPmmrvvpeONsVbJLPSiUjoMZZbN97LcXfujNcVoszMdDazQV8Otm0junUsm9RBdjlnOX3QGC4SyYyN5tn0kOvOfYu5JxuLdSvrOicLJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaAUyiv03wVPSBp9Zq0VZKKHilk6QYmWc7EN9b4sYew=;
 b=JNs1867qXiHb6uMyDqVPhUxS8lEEAf3xYjHgX989ilEMXKqE6YDz9hO4aiqpZC012rRqqw1RTxUZfPHyf5i8xvutBrG8ERwj4rephF0BYb5P/TxiF2sbJOmTp1jELA8xzajbPnqbTtPn9CrBx0tZppE3OorwhfTDEMoqRlSh1nk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <49d3b334-4d7d-4f74-ab00-09cc90dbaa5f@citrix.com>
Date: Thu, 12 Nov 2026 16:36:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/6] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-4-kevin.lampis@citrix.com>
 <20aa34c2-a1c1-4068-9e72-5b7b2c27b075@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20aa34c2-a1c1-4068-9e72-5b7b2c27b075@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: c9522747-5e32-436b-dca7-08df40db1f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|4143699003|11063799006|261102123227099003|261026140227099003|56012099006|261028144727099003|10067099003|261022105027099003|261021135927099003|261021121427099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	UourORcEAhBimdvC+vlVxeJK2DMRkM+YLJ98D8j08EJqWree3wmnEAfVrxrIzO3xrw7w4KEMJGLHWbyx7nN/6f5D/v8oIcwhlBAPvCpnOazr6eFd/HZwLTcrc4zf3LcRMbTKqHiXWGWi5Hd3kP+MlzTb6OZVZkqxQXX6Tcj/H6GovYoqBp3dXUYhdDJiEPZxpVa6JTgvXaA4GBBg75jcYrnzPqiKNCdcuNZ8C/ZkDepfxQOgpcbnkBThw2f9K6Ec4cZ18+8sQSZwl+dWi7hNI6TNyVJlEU8H+UWFv+aiPa3ib1P+1aoNxaTazhiB+gYovaidmWYTMYrF9JV6KA6yv2A8G/VKbTH79w8Xag4BQbq2XgpVRM9o06PnUquJr1ydSrsQM/VGfzbvBZh52cNPJrhvUrE3TePeRwCrkrGrU55e8TUVVP2b49zLPL4XYQzRKTu/xys///NJhFa1M1fy2DjMETLM9lZ5l8KXvHhqPLF8n0pWxbTNHlbghH6DwHJ1tTmA6ISRSu0fb0vVLrlfpkcYh6Y72NFN3rLOe9ejWhp2OSrHVkxHannh4CAYVgcV5Jw8iBHx+YYc9aGHqYGlZeON2dvOHq0GSsB1k67eZwDWMKvSMWpqhgGP79+1Wh5TxW2zKzc8Q5MigVYeQaHyxoZxulJXW+F2HV6F8uJgPEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(261102123227099003)(261026140227099003)(56012099006)(261028144727099003)(10067099003)(261022105027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnJDSUdGVHdkUkZUY2xob2dqNEhRUFpVZmg1NStINkFNVkdZY1ZwQ1Q1Z1pD?=
 =?utf-8?B?VWlrdUt3WG90Q25mSzN2ZVFaVWU4M1hBODJOY0dmZG95U0tJUENkWnRFa3Aw?=
 =?utf-8?B?N1VkU1JNdlljRWp2NkdHbGlFMFdQTHlQR241MU02d2NNdU9EU054VjU4SVpi?=
 =?utf-8?B?UU1kZmM0ODhMdWlrZ3UyZXRCdU5PU2pWQ1E2TGxmUWpVM2Fvakh0REtzeFg3?=
 =?utf-8?B?eTRvYkwxQlN4YVBsSGttM2h0TitlaCtiQkJjQkJQbDkrSndYclQ5eDFkVlRR?=
 =?utf-8?B?WW9TbkVUWDc2aUNDUFZ6NDUzZUxDWnhJbWNqaEdyckw5OUhyMTI5b0lEeDRL?=
 =?utf-8?B?ZUF2MkV6WVpiUlVaZ0E2UVUvVDYrSDVqTTErbjRNczZLQ2RUald3My9sbjNj?=
 =?utf-8?B?Wjh1ME9hbDRCa0ZyUVdnUkMrQndCUjFuMU1TaWNuYnlSTTZ5Ym84UEh2K2ZR?=
 =?utf-8?B?clZnVFE1eW1lSU1zYnBrUWMzNjd1dmdCOHR1TlJxcHlGUjZTd1hiVm9SY1Vn?=
 =?utf-8?B?TW1Rd0JDYjByd0VYM0MvalFZd0VocmJyeGord1NoVFBTV2lIWVpua0diTU5C?=
 =?utf-8?B?YVl0RXFWK1NQaVFLT2Z6VU9iWWxzN0xTWFNob1pWb25TWVcxTUVCWU9nRmpT?=
 =?utf-8?B?NnZKWlhzaHdxYmJGZWN1RnVRanZ3Z0U4Z3J1VmVqOC9QS2QwMkF0enpheHMv?=
 =?utf-8?B?cUlrTjRxSkVlKzZoNjRwT1Q5RWt3R1V2cXV3TmF4SGZMK0FpYVFnb2h2NlpR?=
 =?utf-8?B?WnR4NSt2YnVnaFZOMUt4VHR4REExZy9RaUdSY3YzMTM0Ti9hai92ODRBTzAv?=
 =?utf-8?B?WWlCTUhMdGhxUkkvQkpmTTFmSC9QM0R6aTcwSXhIVXgvcGltZC8xbUZSaHVY?=
 =?utf-8?B?a3dyVmdRMnRyVG9jY013NGZTQnhzTUhlUFcvdjAvOHFVUEpsNE1WVE0wNmdF?=
 =?utf-8?B?Wmd3TFh1OGdGbGdKSDNCTFZwV2FDS2JLdHZYNWg1ZERTUU11c0wzSkkwNEh3?=
 =?utf-8?B?TnV5TG51T3pnck94UVc5UGprdVE5Mmh0RXAzRlpWczhHek1BN1ZNN3VwbHV5?=
 =?utf-8?B?WlFOdEttWkw2enFxL2F4K1lCeVdGUlBNV3NzNXFHSTRaS0pMY2hjRVk4WnB2?=
 =?utf-8?B?ZzF3Q0dHSjJwVmcwaHY0RWo2c0xOUm9jTHgwM2tTZElzNzF1SENSajZpbjF6?=
 =?utf-8?B?ckFUbE9kdTZpaG5kRDJibTE4Q21QckxIeVBEYjJzMlU4VGdBUkFrVHQySzMw?=
 =?utf-8?B?SGJiUm9FbHFPZVgyY2s3ZTJaZ01IZXN3a2ZwY1BjelBaVHNQMjRKRGsySEFl?=
 =?utf-8?B?RWNFTDZ5QkZLYVltZlFjVGMxbFdSVUp6SHo2Vy9qNnpOakVSTkJYZHpVWTl2?=
 =?utf-8?B?bTNZOCtqeDlZaDdNMjl4U2xlYUUxR1I1SzNWT2NyT09GVnFEa2JqSlVOTHNo?=
 =?utf-8?B?dmRHdG92YmhBZFk2UmtKNnBFdG91YnY2bGJMZmhhRm1yN2RMalhkdmpVUHlw?=
 =?utf-8?B?aEkzUUNNY0R4UmJXdFBMWGJZaXJmVDFheDVaNmlLZ2NnYTlobFBZa3ZpQWxS?=
 =?utf-8?B?eEUvK0lsOStvSm4vZnV1U25Wc2owbUN2KytmcHU4clJqOHE4THRQYVNMcngy?=
 =?utf-8?B?NlloYzRFU21EeWUyS2E3UWNrVGlHWmsxMzVtMG1GYThGdUVRZCtIZXF5STdY?=
 =?utf-8?B?SVRvS2VLSjJRUk5lWFUxTGtrQjg3OVBwN2tiMXJua0lrRnMwY21jQnVkUFlP?=
 =?utf-8?B?bUloZU5rYXh4bFR6QWJwYzcvUEhjWEhsN2tDaFVmT29jUEZySFRYVW9CTHZJ?=
 =?utf-8?B?cld6b29sM1QwMFVkTFByVWgyMmVteHBMNGhaQUp2SjNyQ3RJZ1BYRitWMjVq?=
 =?utf-8?B?VVdIUkNCVXYzd1FSR2JqeGE4VGV2YSs5QmtaQlV2SDlsa1IwcElSd0RCWDJX?=
 =?utf-8?B?YnNpeXMvdlhhcWJlN3M2K3NIY0Y5bU0vUUFqUFMwczNKY2diYXZ2VnF0RFNp?=
 =?utf-8?B?Z3BmQks0NFpWUXg4eTFvOHFvemd5dFVqZGVKczZKTDdRVG5xaWIyZzV2TGtu?=
 =?utf-8?B?d3Zkb3VWZHViVHp4ZzhaN1U5dlllWGdKKytZNmVsQzZJSy9ieU82OEF3dFkr?=
 =?utf-8?B?SEw5NHBnZGpXdk93QW45Wk5CbUZZTzhRWisvS2pIbGZZRHlqS3pPRzd4MkNV?=
 =?utf-8?B?SUsrNWJpRjl6dHpFQ091U3pTRXZuemwxNmlYaHp2QmF1QWsySDFLZ1FrMnha?=
 =?utf-8?B?TEJ6NGlxamFrb29xVWdRaG84QVV4WEhwUU1NdldWQmZoTnNRNUZBOEpVQU9P?=
 =?utf-8?B?VUg4OXJHZEszNGR4elFSbmVBc2kzZFR6MEZrSVhYNExLT3p4YVd4UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9522747-5e32-436b-dca7-08df40db1f84
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 16:36:38.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7CSK+R0gm+HIguO0bPYbCqkop+80F8JJmbVrIlpSvRIf8KusQKVy9r2hOqypvbxvzKAFygBd83FxpFn2TR/I9hQLjETEC8sWE4CvHtPD9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6236
X-purgate-ID: tlsNG-33051d/1794501401-6D8D54E9-6EC8B357/0/0
X-purgate-type: clean
X-purgate-size: 2667
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 1:50 pm, Jan Beulich wrote:
> On 12.11.2026 11:00, Kevin Lampis wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
>>  /* Update the L1 entry at pl1e to new value nl1e. */
>>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>                          mfn_t gl1mfn, unsigned int update_flags,
>> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
>> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
>> +                        l1_pgentry_t *ol1e_out)
>>  {
>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>      struct domain *pt_dom = pt_vcpu->domain;
>> @@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>          /* Fast path for sufficiently-similar mappings. */
>>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>>          {
>> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>> +            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
>> +                                        update_flags);
>> +            if ( ol1e_out )
>> +                *ol1e_out = l1e_from_intpte(old);
>> +
>>              if ( page )
>>                  put_page(page);
>>              return 0;
>> @@ -2280,7 +2285,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>      else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
>>          return -ERESTART;
>>  
>> -    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>> +    {
>> +        intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
>> +                                    update_flags);
>> +        if ( ol1e_out )
>> +            *ol1e_out = l1e_from_intpte(old);
>> +    }
>>  
>>      put_page_from_l1e(ol1e, pt_dom);
>>      return 0;
> This (recurring) pattern still adds quite a bit of redundancy. Was it ruled out
> in an earlier version to pass ol1e_out into UPDATE_ENTRY() (and perhaps through
> to update_intpte()), to have the updating done there? If so, why?

I can't spot a nice way of doing this.

The pattern is quite nasty at all levels.  We have pl?e which is the
live PTE in guest memory.  We read that (once) to get ol?e, then pass it
down to a CMPXCHG which can return it modified by A/D.

The issue is it's modify_l?_entry() which reads pl?e into ol?e, not the
caller, so you can't just plumb mod_l1_entry()'s parameter all the way down.

Also, mod_l?_entry() wants to be typesafe, whereas UPDATE_ENTRY() wants
to be not.

~Andrew

