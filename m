Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5405ECD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:07:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326444.1591883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmFn-0003Vv-CI; Wed, 03 Jun 2026 14:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326444.1591883; Wed, 03 Jun 2026 14:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmFn-0003V3-7I; Wed, 03 Jun 2026 14:07:31 +0000
Received: by outflank-mailman (input) for mailman id 1326444;
 Wed, 03 Jun 2026 14:07:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUmFm-0003UY-Ji
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:07:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmFl-0017nw-T6
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:07:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a203511-bab6-0a2a0a5309dd-0a2a450c834e-26
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:07:29 +0200
Received: from [40.107.200.8]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a20351d-62f1-0a2a450c0019-286bc808c716-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:07:26 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6347.namprd03.prod.outlook.com (2603:10b6:303:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 3 Jun 2026
 14:07:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:07:23 +0000
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
 b=rX+W1x+sb9j9PLI0qUyORYarnSDFrKXVNVLHUHuPOAljcUx/uFo8mBOnCwI6+zSl234XJupSK2AKi8lb4h3CDit89f/0rjMevQx1ScSVK4+ycmF6P0whafIWC30b0WR65eQj0nx3h7NboYpk7qeBKktk51ftJEH7rhTBbNxkptn8bDprfQE0vVCBlHTZeYMh5bMn0c2RreXpNs1/13RzS1suGcc+/sdEEGd2sNjryLT4VJWDZ/8B7h5IDXGhAfSWtmXvUM7bdp1Epr8lSHH0YS1X3l2AiY3juuY4RFBv6Ogd84s0zsJMENH9/69TOxYVEApbZTBwlMW6sB1Jh15FLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKr6ru4MsD0YxQZPKp1WKVyPj7BVm0CrpkmzwdT7r94=;
 b=Fw3XOrdKm34uw+MQ8Zi87wMwBlj75y8S2CvZ+GT9cupXzE7Xvyq3TiBboh9pPXe88TzdpqXOjVWcXvoWjLSQsApG3chKz5239LOaZN9C7GQZF7KZUCVIshSxDnHK9DpzOIwklle2k4GZsCR8skZea8LGulsZgd0jNS4eHx4mv2yX5SWr4SEJaffx/4cNc0UqKYtLFpUVw16h+tG5ZsIKjU4yqtsx7pujeZGl2L7AluZ+8dcOucDL7/+OSPrSdWQtSkVMm0sUdS6v3Y3rfmkMYXrzZoAv+FdnvhrHqPobnq2ORPb8LbYRmTUFZhltPfStxVVJnPOTfEyiIutKQm7PmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKr6ru4MsD0YxQZPKp1WKVyPj7BVm0CrpkmzwdT7r94=;
 b=taBoFk4JkkQShiMCfFhFMKrfhMjYSHdTGn8XZbkDCas40Ct3g8i+xpxpoXggoPlgVjCqrWnnE0d7fikmdeWUnw3YbDBoutYbMaofnlLpL9LU7FKsuw5aOvZzhM37MGd1qzhFwsDfViERegEFfV0YqGUDJF2qFWJiW3KcGdLFVT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 3 Jun 2026 16:07:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 4/5] tests/numa: add unit tests for NUMA setup
 logic
Message-ID: <aiA1F9cBbzqVUQpR@macbook.local>
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-5-roger.pau@citrix.com>
 <2b1df2c6-ccbb-402c-b65a-7f3beefdeb0d@suse.com>
 <aiAwDo3EWi1oghm2@macbook.local>
 <75ee595a-6443-4b3f-827d-2dc4ac60866f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75ee595a-6443-4b3f-827d-2dc4ac60866f@suse.com>
X-ClientProxiedBy: MA4P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: d924804e-8e26-4561-7e4a-08dec1796ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|6133799003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ClhX9lRvRsuTLmnGwFf7/fNGJslzQ7cUilmv7qU9t6a+cA4kVaGNOR2I/psW15RFn9KdEeaGSIDJBqVhDCCHzm0DuqberpVWvu5l35RgMR3E6tFdAS83EqeRXQXeHy5xXK74QYDN2og40KZiq+XcOG5Tt4Ndq5gq4Z4XRiC7/obpR2ZmUzdwGY/yr2xx6mTxWV+JMaPuzJ7Fo/4BM2OCEESGBY5FK8u2rZ2Zj2ST6djXIRWLuwp6rHRFvLtDJrxuxXChQyfbEUU2aYqUBuXEgeiMtMxzUt0CEVvx22USws5TwS+h3H5kZtI9GqGRcGg/wtpYvaEnKIHlVGEz9paDXPgtUv9eSWpljMJrf/p7Akzqh/alsxYZD6xVMIdZekzIzlUBkw6S3ticZdw+xGrgjmdlKwgrZzeXyIR/TSv5Q3MjjQiTQb79QKRzDgODNNLCaOU4mW5z19X7z+xuT3WAn8XNBHMmEB4Mco8P3jEF2EOsEilOs97FAivM0oZRXoNO+IUgTiayF6LBq5utniRm/Y7SmV8nkmQxp9wdPDBt+k4RQCXHGIDq70thX8H/HAn1MSXKo32BA6sxy07aumQfJ1G7zMQePItP0uAJuTIvAog8fJU+8Pyx7HReO+uZyBCZ1jcR1ud/mYl2zO6C0ybFfaYFWNBCINmf4DJRJ1UFVPLlLdggFVfTPf3SMiXBwInp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXhsYXNMb3ZLQTQ3ZE9tUEFVVSs3OTIrVGdrQnc1RDZmbkxZY3Z1aGk3enho?=
 =?utf-8?B?SzVmZnczeS9rUHF5dTRPMFBnRC84RDZBbkZZUmkzZFFLaTNtRFhkbXh3M0dI?=
 =?utf-8?B?bnExbFp0M2pTcW5admRmVHQxaFdLK1hPa0dwWmQxdXVYQmZOSm05QkxjMWJs?=
 =?utf-8?B?NXdjdWd5SlE4MlkvV2hKUmF2SzMraHJYRGRSdXFTMGRMQUhMdTFJMXk3ZHNP?=
 =?utf-8?B?Qk5sdWR6KzlnYUpBY21tME1mdSt0aElHR0FVb2JiTWVZcUdtcy81cUJyekFz?=
 =?utf-8?B?TUl6TVViVXFPaVVBUVdrTG42TEttUStQSmJDY0ZtSXpCVHJOTzd4U2ozZ3lk?=
 =?utf-8?B?VlVldG4vbmNhVEFldTYrTm8rY3o3QXozaEdVR3VaSEl0bExHNTVCd1JqeWQ0?=
 =?utf-8?B?Qzl2ZWdlQ3FJZU1mRG1scjY1dEFqWEp4SnZ1Y3hlVXpCaitqSHZQZ29wM2g2?=
 =?utf-8?B?eThFZExsRThKaGdPeXMvQzBIY2M4QTRwdm9PT1dpZmhVREkwOHo3WWI4azRC?=
 =?utf-8?B?YmFHUW4wUmVIOC85cEROdHdud3ZQbGc5OTltK0lrb0I1M3lGa2JwNWNqcEtq?=
 =?utf-8?B?V1AzckxNaVBnL1hubU8zcmFLYnFPdGVndDNmMnZnVnA0MUdud05LakJqMExQ?=
 =?utf-8?B?ZWJEZnJYYlBVRVJwdzB0dDJpa1AyR1RPb0hBMkpscVh3aTZYWlNnRWpuUW9z?=
 =?utf-8?B?QWxvTGtlWk9VazlVVzM3THVObWFMN2FnRHZuNFJqR0RkTjAwVkE0azBvQnR3?=
 =?utf-8?B?Zjk2Vit6UWVRUkpuOXE3QlJtbElmb08vUXoxcHRsazNGVlhqc3l0SFIyTnc5?=
 =?utf-8?B?aVBDYVpWTmpkNFhETEQ0ajhmeDVFR0tWSU5tTEFFTlpmazlyYUVxSmZQc1FN?=
 =?utf-8?B?QlMvRElxblpUYTZ1UmNHMHBBdE1xSDdoWk1xLy9OTFQ1RXBtR2oza3Y3d0N5?=
 =?utf-8?B?OHVhSlBiRmxDYkNyVkVrVHRyTU52R0txRXdtZ3pXeW55RmxtaGZVOHJLSGtO?=
 =?utf-8?B?WkVTUWk3aXhhcGZhZENvNE96Y2FmT1BkblplUmJIS1EreDdKL0ExZzlVZ2FK?=
 =?utf-8?B?ZjRWN1V6eFF3UGhva2dOaldwU1FyQWhNTEkwRkN0T2E4aERnWnNaMDVLTWFI?=
 =?utf-8?B?dlVBTWw0T3NCeWJTOG1oYWFVOWl2UXhrUjFFUHoxNXhFRjYwVS9WZHYxZ1Zn?=
 =?utf-8?B?VWJ3NlBYeENJMkxBUlgyeVVmRmgxU0JwZXpGUkhQU3FtV1NobjJIdXE1RFI4?=
 =?utf-8?B?OERGZ1ErbVRwNi9PMTJoVTMvZk5CK0JJWVdiMUE3cEVPSU5GbmpTeDloREJB?=
 =?utf-8?B?TFJUVUptVHVJUzZxaHgzSVpZMGxJTGpFV3dmVVVSZnBDVWY0NjA3OVF4YVhx?=
 =?utf-8?B?d3RRWlhCZkp0ZlZ1K0pSZFVvRzRqaW91c2FWMDZPMFBoRG9NaXY5Uks1aUxx?=
 =?utf-8?B?VUNiSzM0SWNZNWZ5NHUzODJnTURJMVBaOC9GRFFjbGMvSWF0elR2RVJiUDV0?=
 =?utf-8?B?RlJwUExaZUptOFNtZmdYejNPQnRqZEJjVE8xeHhXSW13Uk41VjFSWUpjUnB6?=
 =?utf-8?B?MG9CNzNCekU2ZTdVa3VCN3VWeW1xQ2pmUm12NVlMcXBnNDA1cmpZYjJQYnRj?=
 =?utf-8?B?Z0MvcGR4TFNBYk96MDVQcG5Oa1FzUjcvSVNGVm5ZTU81aTJIT01hRFJPNjNk?=
 =?utf-8?B?a2w3eUl5QzhBZ2ZUUFJsQ0VWNTFCSFBRNHp5U0ZvZndoelQ0TDNhM29NcEU1?=
 =?utf-8?B?dE42NnozZCs3cXZYTTByTDNSMEo0WHlxZ0o5aDhydDlLUnlTeWlBM2hWMWlR?=
 =?utf-8?B?Mk95dkJzZnJOOWtjZmRtQzlHdFVTQUlEZkFpazVlazZXSUNER3crSjd6QndX?=
 =?utf-8?B?V0RXVnB5WkRXWUtsT1RPRGE2QS93cE5sQWpGS0pYM1NhT0t2ZnVLZVZBbGpx?=
 =?utf-8?B?a1dkK0hraDF2SXhhOUdIeEY5Um9hK2ZzTi9iYUd4Rm9tRXpBeTcvY295Uk93?=
 =?utf-8?B?WDBaLzdRYUQ1NkRydnJxY0lJMVR1enMwMG9ueFFFOW5sNCtPZlIvdnVVejda?=
 =?utf-8?B?d2pEalMyNjArNjlBWEhSTEhMUk5qVjNIWEtqZm9iWlczMElqajdoNjM3S2N3?=
 =?utf-8?B?KzdISzlZZzVoTytGVVhqMzBKdUp6NFhISTdhYVJMZXJBWW1vS2NRTkRKNE5n?=
 =?utf-8?B?YUNLVXRkbTNyUWEwSFFWNkMrM3o4TzU1TkhxK0JHc1NQeWVkZE8yL2NSRllZ?=
 =?utf-8?B?V2o3ZVBVMkRpWWxQSHVMUkpaVGd5RUZtdXMrNm1TMXZ0K1NTVVZDS25HYVFu?=
 =?utf-8?B?Ti9kaUJqQWh3QWVVenlkMExDenNCamN5ZExDL01vUHVUTEEzWENQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d924804e-8e26-4561-7e4a-08dec1796ee2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:07:23.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P93Zhx4D7VJshAtvSWoT5GOC+i3czIydPXFvuVTUfpQ4xMPFAbuiaU5CqMrv9jVv5bJH0i8BmA+WZyxvf++oYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6347
X-purgate-ID: tlsNG-d25034/1780495647-E1360CF5-60712529/0/0
X-purgate-type: clean
X-purgate-size: 1385

On Wed, Jun 03, 2026 at 03:54:39PM +0200, Jan Beulich wrote:
> On 03.06.2026 15:45, Roger Pau Monné wrote:
> > On Wed, Jun 03, 2026 at 10:38:52AM +0200, Jan Beulich wrote:
> >> On 01.06.2026 17:43, Roger Pau Monne wrote:
> >>> --- /dev/null
> >>> +++ b/tools/tests/numa/.gitignore
> >>> @@ -0,0 +1,2 @@
> >>> +/numa.h
> >>> +/test-numa
> >>
> >> Why the leading slashes?
> > 
> > This is the format of the .gitignore that we use in the pdx, numa and
> > rengeset testing.  The slashes denote that the pattern is relative to
> > the particular .gitignore itself, but won't match any level below the
> > .gitignore.
> 
> Hmm, before replying I checked a few other .gitignore files under tests/,
> and none had leading slashes. For the purposes here either way is likely
> fine, but really we'd better be consistent overall. (Which isn't a request
> for you to change or do anything, merely a remark.)

% cat tools/tests/*/.gitignore
test-cpu-policy
generated
test-domid
test-mem-claim
/numa.h
/test-numa
test-paging-mempool
/pdx.h
/test-pdx-mask
/test-pdx-offset
/list.h
/rangeset.c
/rangeset.h
/test-rangeset
test-resource
test-tsx
test-xenstore

Some have, some doesn't.  Using the slash is IMO more accurate
matching, but I'm not going to adjust the others either unless I have
to modify them for other reasons possibly.

Thanks, Roger.

