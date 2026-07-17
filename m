Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4042FC4451B
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 22:02:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365226.1615831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkqcm-0003mZ-9r; Fri, 17 Jul 2026 22:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365226.1615831; Fri, 17 Jul 2026 22:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkqcm-0003mS-7C; Fri, 17 Jul 2026 22:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1365226;
 Fri, 17 Jul 2026 22:01:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wkqck-0003mM-Ov
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 22:01:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkqcj-001TDg-NG
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 00:01:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5aa627-2eae-0a2a0a5409dd-0a2a4504979c-36
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 00:01:37 +0200
Received: from [40.93.195.64]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5aa63f-b57f-0a2a45040019-285dc3407cc6-4
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 00:01:37 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA3PR03MB7467.namprd03.prod.outlook.com (2603:10b6:806:3a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 22:01:31 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 22:01:31 +0000
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
 b=I4SLedBLp1H5idXtS9vEE5GJcMP0cWdIjmwzCdjvemSJLy1F3mIEw77VOR7th8ksdj8iL2W+kb87QBChfvY0QBTOD8dNRaQ6wPnww1q4ZLwwIdh9Tann1IGICCkPdNFhQckyeYoWTUza7szx0lr7yk/Xurbu/Vlsuf9MU62FBQk4pixAt99i8d3MZFxevE3r0n9yAiV/iUUxoMRrhlROOW+TKG3Ngfsfrzp1toh2T2ixgODKDMZclRi15aNv/GlyqlEnP6m5jBFe2kd+aMD4hOuRYxptZu9S3lsmWF7/OaV61iJWPBgbjombUqeYMXCIZaPa7zDP0mHgarZ9AhHi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcAGbssBhjL3QlF73376wQmBR55BgCaDBNbvcAIYbQA=;
 b=AvD49E8h0uh/E99rhdZGGlGlxOhvVnTG0gwGTQsGWmY47dCO9+HmQE38JEpVal9uLSOLyAz/gKhd0oMHkFqL7DEVQ+oKpZTN5HcqfdkiPSp7xlherD8qz8vAlQFZJ7JrFNqWVJWYexsKXdkJOJaWQJ1MkZvOkoMmHKSU97rkbNauWsz/m5ZJHZHbde8xOiLwHez3C9knGk5pRoDsyDv0aOxn0fRJ/2A6glHxontiepx+5b0Q1y0wTNRDf6R1pfR3lcqDr1uD/3FePONqXaguiXQq4dVdNB27I1PRJxF2DbpE0duqvUtwqR6tqOJ6ViwxZdhpjsu0YheQUdMS8xRQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcAGbssBhjL3QlF73376wQmBR55BgCaDBNbvcAIYbQA=;
 b=ZDxBJgPRaxLZJn5eGwfWEylkRXdieoteChRnHB4sXErWg3ApVllABRtqjd/lmhNcZSqPYr4uB/Vy6Ov+MuXnm3DVNWW6tp+8Y36nprJh9AeFpXVvJzq59MrFxQtYoH4drP9cY+ckabbsslFDLTlDfoNIWD3zcvZs3L7ceA2u8vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d8870af9-6fc1-4c5f-9858-16dad1401d2f@citrix.com>
Date: Fri, 17 Jul 2026 23:01:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, anthony.perard@vates.tech,
 jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v7 2/7] xen/console: use memcpy() in console_init_ring()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-3-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260713181619.672176-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0258.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA3PR03MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: f923356c-0931-4d61-9f30-08dee44ef559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ccFbLD/wyY9shVMwprUZTv00jfod3VUoTKfg0aUt0yGpnOz/NG9QuuqzvoX7p8ZmbX5enOxCgA2eLCcpZ7Yh5+/Tx3MjD0CY2jwRAJXXKr3uctn1zYkZgk6+Yd5pEYGXLbkuW4vHqzUP9VGY5IAFlzk0IMb+Ub/8vLWw/TWhbTDsTJG1X/dvmoBdGjvE38zfquTDHpLeTOS7W7x1we/KY8as657XGWoKn2hzoV0AbRjzpUWUOqRS8YejeuN+KDieRx5Os3HRzE8aMzAeOfk0In/8s0Lq9d7dWEUK8mk8Ddq6FBlEOITHs0y3ARGiabP4+Zp3yM3+z9uYL9yTBVS6g8iWm0UcDffGylFGJPg2e8KZpwNdxwoAJp3fxm1HG0XnQrqXjsDNLEMhOyYSqd9mchytCPXSGQhWVnauTlacjDB3ki5OAHQhTSkAtel2jw9o5kPUgVxNhjxuSYc637UlgyLh86yJNNWY3A2koyTfVaqZa2d/+ofKHG0EPAv+p2xMAQiN9FnpzlpuOMHcdjMHC2KD/8aqYCcWTm5WUPHD3rUT+4IKP+vv/oGAN8ntnQcm6rhxXS4wifjypaKgTwdSRrbESrK3DE+bIEGqQ+iDfOZY/UcoETRWxRZd5JqrA0j0f9R/gAphVoIARK75ZGs0WcrrNCJ7VU/q8hXK2nGGUIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnJ0dGJtVTIyaFFHRTVLRXJtcWtSQ1ZJYUlad3I3aGQ1STFNSDFtcnoyTkM4?=
 =?utf-8?B?bVNxRzFZeFlNWUFuOXlieU1UUkxGSElUSjZHSXoxL0JNVEVjV1pPM0tvY0ZQ?=
 =?utf-8?B?YlcrZUFEYTFhUXo5NFhCVlQyRURGK2RFZVBiU1VWV050a2VKUGoxQkxDYkhS?=
 =?utf-8?B?Zm1qOVUzNCtvSk1ZY0hQeGVDYlYyMmI5WHpaYTc3NnNTdjczaEFadlJzeWYw?=
 =?utf-8?B?T3VFaHRSYWhEeGEwWmxxcVNMUVdyZWVhL1ZUUXB5Szc5MTkwZ1hyeGRDc2xW?=
 =?utf-8?B?TVJQdzQ4cStsU3RXdExWL09aU3c4YytxdnBqYm1KajFLMGJpZVNGdTJSTjY0?=
 =?utf-8?B?VDFGdDhXV1FHb0hSSzRIOE43YUw4WTF6OUtHOTYweDlnWm1xajNqYWlENXpW?=
 =?utf-8?B?UTFrYWlSOFVFcDAvS2s4VkZFQnMrNUsxcjJUMHl3cXJkNjdYMTVwUkx4UkJ1?=
 =?utf-8?B?MlAwYnEwZ3U1UUJsQ1htbU5jcjBOUWp1b25SeTNYbUJuNk5NQnQ0OXd0Q1hm?=
 =?utf-8?B?L28zb1hEWDk3S29ZYU9KZ0REbWlEcWlkMktGcVZmcUxXOEZsNGFqNEJHSWtx?=
 =?utf-8?B?S21GOXNtYUY3ZVZUa1pVbUxBQ0w3am1TNWdYUmZIbjMvWjhFNDUwazhPUm13?=
 =?utf-8?B?UWgzMHdxNUlXelovK0JYaGs0YTJZTFViNUtjTFVjUk91YXJIeHZTY2E1ckxI?=
 =?utf-8?B?LzgvOGgwSFM1dzc5NDlnNUxXd0R4ODlydnJxb0ExTlBjYjN6Q0JFMUEvdmx0?=
 =?utf-8?B?ZGNSYUZWQmVmb3M4S013NjN5RG84MkZCazN1REwvVGNXNzhIWXVJdXJTQWlQ?=
 =?utf-8?B?NlhyaW84U3QwZ1VSeFdzN3NZZ21Kbyt5SEZNMkd4RHVCajBGeEVkS0l3Y2VD?=
 =?utf-8?B?QXZEUGlnL0xDUXI2Ym1mbFJtL2d1WDVHcGwrM3RObXcweHRHbU1SS25mSUdu?=
 =?utf-8?B?enhBb3ZtWU9QbWFiY0FPTFB5VHdySTg2ZXlyNTBPZ1gwLzA3WmRkdEg0QmRr?=
 =?utf-8?B?S3QvSDhEK0t5NnRDZ0JNaXR3UithdW8xcVhDUjA3V0JXcUVJWDBYaHQ4cFZB?=
 =?utf-8?B?VXVYYlpGSXJSQzBNRE1INEl1dUxXOEVtSTRaZDQwOGlxZEM3MGJZdmFkaDMw?=
 =?utf-8?B?QWpkajFmU3dDdHcyQkR1c1J2cTJHdTg5d3F2RzNGT05BaXd3RjloWGpCa0tp?=
 =?utf-8?B?Y09ic1NLUEdLRHdsMGRWeXZxVm9MajFNNWxoaWRkMVVZc3JISjZuRVdEMGNq?=
 =?utf-8?B?bEQ3Zk94R09qQXJ1L0gyY1JkcDFraUc0TVQ4bU1BSU5hc1hlWk1Wc01pR1p1?=
 =?utf-8?B?YUJDaDc3NElaQnpxWE9EZHBrTkxabENhNU9qbWdZMGZJUnllRldDZDVVQlRo?=
 =?utf-8?B?Q2tMM1VMdUZCYlNHQkMxNVNGc09WTlZMcm5nd3IvUU93YmxlK0UyNVdSdUYx?=
 =?utf-8?B?dDhUb0o1bFJ4cnNOd2N5VUFGTXpHZUlmUm00ZUtZZVpaQWZUVjkyR3JvZWk1?=
 =?utf-8?B?UXBnVk10ZEFuSTcrZ0RvcUo4b2N1R1ozZ1Q5VG9FbFpPRlpkWVRGZjRVaCtY?=
 =?utf-8?B?ajF6V0krMnJkNEhOQXI3VFBsRHkrU2FUWHFiWmRDdFl1NkZoa2NwVDBtaVB6?=
 =?utf-8?B?dWc4dnZNcWprRkNyS21aM1RBc1Q3MVVDeEZmT0dTM2c3WmRZNzJVSXlXY3Iw?=
 =?utf-8?B?VVBQbno4Tno5emd2MndQTHZWWlZkZXl6ZEhPSEw1WjcxblpGaTZVblRJMldZ?=
 =?utf-8?B?ZWoxNExEVGEyRUN0RDlEY1NXQkJoamJkSUZKSFFzaWtmYkZEYzNZc2VsZEY3?=
 =?utf-8?B?VEgvSXkxME8vOGU0NGdRamJRVWo5RjI2N1A4R1FmVDRTeW9PZFlMbzQ2Q3Fm?=
 =?utf-8?B?UUg2NmJOYUVpTXVJdE54eC9TRGQxckFKWmV4N2hCWFV1V0hlMGtieHQzeWdD?=
 =?utf-8?B?ak8xN0NRaHlpN21ZbDVJbTlGQWtuN3pFUE5nK3ZFNEliQzBkanJOalB4NGx4?=
 =?utf-8?B?Z2ZzUzlITXF2VmgySGxvT1lqQnRSTndSQy94ZnRBZUlHOWZsODJxVWt2Y3c2?=
 =?utf-8?B?OCt5N1NJQlhXNGJRdEN1KzhrdDdleFNHYmkxNzNJME93d0JnMTU5bGJsSG56?=
 =?utf-8?B?RkZPNmR2R0RqYmlERE9BdVJxUFAvcUlpS3pmNFl2YlRPTEZEL1NnZnBBSjZK?=
 =?utf-8?B?eGROMkQ3N24zaFBtY3JJdk9KV1FLcG9wQU80L0VrZ21yL0VBcGlZV0xKU2F1?=
 =?utf-8?B?cTBvZmhOdXpLSU9WQVdXNWIyWmdTZ3dLMXFEdG1WK3UrRnl5MUNsc3lOYUsy?=
 =?utf-8?B?WDRXeDhaZGF6NGZGVjhHYThpbWZPdUdYWnVJRkkvNDViZkZWcHhDQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f923356c-0931-4d61-9f30-08dee44ef559
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 22:01:30.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87Ep6TBt2PhheSvUlkSdcYr7B9Gbg0+cYEZLWy/Ax9p4+z159AKjw4RfgW0EzUlsUU/CbaXxMarRMk8qwOOs1BQ6h2WdcoyaY5pnJgv75vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7467
X-purgate-ID: tlsNG-ebf023/1784325697-C06DAB50-571C2F35/0/0
X-purgate-type: clean
X-purgate-size: 2111

On 13/07/2026 7:16 pm, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
>
> Make console_init_ring() more efficient by using memcpy()'s, rather than
> copying the ring a byte at a time.
>
> No functional change intended.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Acked-by: Roger Pau Monne <roger.pau@citrix.com>
> ---
> Changes since v6:
> - addressed Roger's feedback
> - added Roger's A-b
> ---
>  xen/drivers/char/console.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 5ebbbf63c092..37ea84403180 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -463,7 +463,8 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
>  void __init console_init_ring(void)
>  {
>      char *ring;
> -    unsigned int i, order, memflags;
> +    XENCONS_RING_IDX done, size, n;
> +    unsigned int order, memflags;
>      unsigned long flags;
>  
>      if ( !opt_conring_size )
> @@ -479,8 +480,19 @@ void __init console_init_ring(void)
>      opt_conring_size = PAGE_SIZE << order;
>  
>      nrspin_lock_irqsave(&console_lock, flags);
> -    for ( i = conringc ; i != conringp; i++ )
> -        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
> +
> +    size = conringp - conringc;
> +    for ( done = 0; done < size; done += n )
> +    {
> +        XENCONS_RING_IDX src = (conringc + done) & (conring_size - 1);
> +        XENCONS_RING_IDX dst = (conringc + done) & (opt_conring_size - 1);

I see this has been committed, but the use of XENCONS_RING_* is wrong
here.  This ring is not a XENCONS ring, and that header is almost
straight obfuscation.

The types obscure what's going on, including the fact that this logic is
unsafe with a 4G ring.  And while that might be a legitimate
implementation restriction, it needs to be obvious in the code.

These want to move back to being unsigned int.

~Andrew

