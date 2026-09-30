Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D523CCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:56:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437121.1655893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsvA-0007Ip-1n; Wed, 30 Sep 2026 11:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437121.1655893; Wed, 30 Sep 2026 11:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsv9-0007Ii-V5; Wed, 30 Sep 2026 11:56:23 +0000
Received: by outflank-mailman (input) for mailman id 1437121;
 Wed, 30 Sep 2026 11:56:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xBsv8-0007Ic-G8
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:56:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsv6-00At8W-Ki
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:56:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6abcf8d7-8faa-0a2a0a5109dd-0a2a4505c846-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:56:20 +0200
Received: from [52.101.46.13]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6abcf8dc-4cb1-0a2a45050019-34652e0d2e5f-4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:56:14 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:56:06 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 11:56:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmWQ7dsK4r19fy9GIn029JURwWdjmS1oVo5Qi7WJsDlRaAibgVhL1F9Ixj3qo2U3TDORxIXR+iAD9RNYEe2+ibqV6eDLb4XkJw0AI3LYfbVtWna7XvRkzLFl9tHyov/xpiAIhokX7nMg32JQBNFnUIxhzKeSIM71iQKyDTsNWIIFSg7tpudENIMedJcHtXw/ud78AauFfPPZvbiCrVB5L9W+FprP1KZTA1l/p7tkvBoGh2s/YvRQncAvBNGu/9rD3SblQP2rhmAGReZeHAfKB1BqgPN3J3kShjpWbvtyMr5OwmGwPcfuJgLMFfKrXvgHaCNHE5vudpRXgIG60wfofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzQ0XJEwjp9cDkOlNoFQwBVGmLm/V1kvnOn21KI3aAY=;
 b=ZQo9BHF83hTAXbfslz2AdF15KQP5123sZHYX2fJdUiRnd/85uHxeEfXlLOlePCgVqWm83nDAgnuoinqIymux0Um1zykWmiHJVNZjSU04zw/5+nltzV8CDOAKxvHkgLAQaKQCn68qlaT5r0q50rm2bLQlwbO13jMzrNMd3icReaioVaJJiBD1XLa94HIhQJY7fP1eH+q9ESR2CGNlgrgQG6eLjU8bBNnAC+f2RKMly6FDAin4mV4RYTMpydBmC3DzBnRASIdC5f1uV6PQr7C4RPUvM2y9EmRNipwo6af5qu5IgknU0n9ZzudOvCVbF5eWAR2SroIlmkPxAHYkI81whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzQ0XJEwjp9cDkOlNoFQwBVGmLm/V1kvnOn21KI3aAY=;
 b=AyrKA8VidT3CjmL8pJl4hTCmnl+Jh975faIYOH14LoZ+uWFKLse4wJt4GKOL4f37J1F2C+kwHFlZExisf5YQ0jFltc0g1RKVvWV+qSJBknlzM0BAk/1YSBz5mgEgk0a3pEtde3/jD2nryskTAYBUTy6BPl+b9ksc+/TO4a6bZJE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 13:56:02 +0200
Message-Id: <DLSMRBW2F5P0.3NKK0ALXVXOD@amd.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, "Jan Beulich"
 <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com> <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
 <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
 <3e600ac0-3096-4cfb-967b-c6d87d8c04e6@suse.com>
 <arzDzQMP5rGz1-QJ@macbook.local>
 <3e2b41a5-5c85-4a6a-8f91-c2b979f87b86@suse.com>
 <arzfW8dQgcfISTWE@macbook.local>
In-Reply-To: <arzfW8dQgcfISTWE@macbook.local>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd918a2-a0c7-41c0-c7b2-08df1ee9cee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	GhYMAr0uTY/3pV5tCWCOvmo/tv5esFZWD0kTbkukB9Vz4kc/4AghryFAjj82jn1NdeClANw5qYA62jrP1QWm0YXHYGT5BxubAbBTFAyoIBXfEx61UhkAbZkBHTdL6C3eokmwgmMavRWSoNw3TnIbIGB1NYEFybk/2JQ2Yk2Gf2izwB1A6QmeLtucd1COuFcba+udM9wpM3EhU0+kCSEMXYIlhcGzmURYlX7zvek91/jxvB7+3sku3cvAWL28HYhKFudZ7j8qUWOcXNDyHot00eSFMTliIgqFiVtI0egckRtTo2+LWzHX613AhMaDKCPEaJaR8gxFB5ULYAuLWDm+xCPk6CL43bLU8ur+NCD0Ufz9ojbI6vj48hD+o54hwj0JuwKgMCILCh63mdIQQvQx4s6wRz05EJl7xhtHcYlu4pn5+i7UuI6RBnYmOdGNjrkFKJDVBfmk2SpPs4PquajCgxszvRWes7s1atbZp+t/mRZ7yc0KARxkSD5u9U4QvsCAIV1jqoiAS6JVuMqJAXZhw7qh76p8DFpZGH01Bc3tI0iv/zFCHyl34VHAEOKc/uzC4t0UhCiTjjlBpmjrWQic90m6C5k/313JHoLXjn45cO1lA3umQdmyMdnZ+PVT+z1I1J+aH3piLB9ewCjzbpXpJPyclNUi/WS4Ci6gnA9SPWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRQTFVyaXVwaEVjWW11emJickhmSDI2LzdTczFzSDB1N0tRTjQ4c3k5Mm12?=
 =?utf-8?B?cFBjanJBK1lLMUZHbW04OVhEenVQL3g1cWZpalE4WGVJOVF4TkhzbmppOU1S?=
 =?utf-8?B?S0tEcGx5bmpMaGtnQ1NvRDlCV0gwQmd2UnJBN1pQOGVBRkFLQTJUd0hxbW9k?=
 =?utf-8?B?OFFqV0NodjRhWTV3M2M5d0FXTDA2U09PVkhmUjZJT2gxUS9YbWRLTGlHWUZN?=
 =?utf-8?B?c01sNXpRMnBpc3AzdjM0Y1FiSjlvdjlVKzdjR3lrSXM2RUl6dkpvaU5Ka0pD?=
 =?utf-8?B?bXQxMGtSUzZod1BScDRDcThyV0ZSNzV3UTNWUFArUUxCZWRDNUQ2akxBUGRo?=
 =?utf-8?B?eVArUFVFbjY2YkZqU2d1RTMraW0rQ285N1F1OWRpZm9ldkZyYkNxWTZxd01O?=
 =?utf-8?B?NzFlYWxpZ01PZVZ4OG1EeVN5SGRpTUF5WkU2aVgxbnV6MHJSamRXK0p3Q0JW?=
 =?utf-8?B?cXFEanEvZ3c1MWpCVkZUUWZia05hV2U1eVJhakhXbmpCc0UvQ21LK1gvWTF1?=
 =?utf-8?B?dXVJY2NBbmRmeVdKVlc3NVM0b0dnUVRjMkl4UmMzV0dnb0c0SE5jUllmYTRi?=
 =?utf-8?B?REZnZWNQVVdaOUNQYlNkSTBpYlVPOUl2aTR5dGNtK3VaMDVJU2NMVzBrcnYv?=
 =?utf-8?B?QlVQT09QN0ZTL2FWbXVSbzlvbmx0K3RBWU1makpRQlFRM1czbW1kam1QcjZB?=
 =?utf-8?B?dWI3eURLOWs2QlBhQkhvaFVGT3RvQ1VML3VvSWFlZjcwdDhzMndhVnE1bDdz?=
 =?utf-8?B?NXpuVWxFQ21uTjJ0ODBWbjczZGJWamFYYVptTWxVL091NGN6YUJpMWZDQjA0?=
 =?utf-8?B?bm8rTWgrK2t4Ym5DelRWUG1lYzdERCtZWnJGUmcvL2piNlYvUXNQeVZtWmVU?=
 =?utf-8?B?SVkrYStSUEVqUXNudXlHODZyVm9zM3MxcGh5RnE0UmI4SFFVMEhFVlpyWENZ?=
 =?utf-8?B?b211dkRtLzNyK01adVJMOStmUkRxdEpJUjNIQjRMZ2NWa2ltQUR6NmNUc0ZF?=
 =?utf-8?B?TWVneDNLTk5BbzRJcy9aL2JHREZaMVlTWnNtQXNhc0NzdWJjbWs3Q3hVM1ND?=
 =?utf-8?B?b080K3NKV3Q1V0VkcC9YdVRVaGZPMEdYN2YweWtBTFBKL2tubGNmRzBQRFRz?=
 =?utf-8?B?cXRyazNjcVhMWm5QZHRReHNVazJKajcxNG9maGppZU5hajhyS1pQZHk0b0hF?=
 =?utf-8?B?WG1CWnZBdVVxSk1xU01ZdTQ0NzRxd3kreFE1T0FGN1k4UEdXUUtYYnZrZFBS?=
 =?utf-8?B?TWp6aFFCOHpVWFdpSnFXZWR4RGFrVnBPdEJFMnhjcDVZc0Q1a3gxbjBhckdQ?=
 =?utf-8?B?SU8zWmluT25XQ1F2ZElCQkdQbmJFL2ZCU0NtMVBqckJIaTJhODJNaHZkMS9C?=
 =?utf-8?B?REMyRi9aK3ROcVZlSmFXd1VTa09LaVgvSit3MDhlZHhsaFNHRkE3UitObEx1?=
 =?utf-8?B?TVZ6OWpQczQ3bHhreHJ3UStDMUZvdmpzQ1Y2Y0QzZFpsQlZqdG1UTlMxMUZ0?=
 =?utf-8?B?ZHBSTFJEblNRZjNMYmFCazBGNG11SzdrUVhkZDNYOGJ0ZUZWV0ppUlRJbk4y?=
 =?utf-8?B?bS90ZDZvU08wK2xVV3NkbTdCc29SUjRwNmpZcEhBNW9EaFMyVUhRZWhYdi9G?=
 =?utf-8?B?dkdwYkVyUFRYVnlKeE1hb1FjQ0ZZTVhRQ01Sc0I2dEVXc2syR3pYc2FNUjNK?=
 =?utf-8?B?NVh0L1FsbHUybTZrMXpSN2E5dVdRYVBseG9ZV2JBdHdHejZnakIzYU9PT2hs?=
 =?utf-8?B?K3orWnV5SDk5SWpWNjl3ZVEyQlZmZ3NSV2F6eUdLZTJSODBVUGV0MlZScGtQ?=
 =?utf-8?B?SGs1UDlrWVQ2QVNrcUJRUys3TVgwTlM5N29HVU92UnpNbmdySk1XdlA4Y2Vl?=
 =?utf-8?B?d2VLelM5WHpYYmdSMmlmNW9IUlAvdXRMQ0t1SGtwOHlEL2E2a2k1U25wUmg4?=
 =?utf-8?B?N0xGQy9sUnlOMUF0Z3piSUtFUmpSQVhWdnVtVEhBWUo3a0QwVlJ6ZUVLY0VM?=
 =?utf-8?B?WWpjdWF4ZXVIKzV5QUtKTFNMQllVMUdJQUhZYngxUExzUFliMEs4dmNrQThJ?=
 =?utf-8?B?T0ZKM05MVGlPc0MrYW9LYkJIRlQvR1dYWnhTVjZiUjRGeTlNMDFjQXFZZWxm?=
 =?utf-8?B?V3ZmODM5OFg1cnNUSmVQOE9jWUxpQ2VSazE4d3d1KzlSRSs0ZzlQYjJHYWNq?=
 =?utf-8?B?c1pEUVhLd2RrTzdNdzZidXdTOEZKUVl1TFUvQjZkNzNaV3BkVkxRQXpCclBj?=
 =?utf-8?B?bTFaY211UW5aM05MenZFaU15djlvY2psc0VDMVdKelNBM1BvMWt4OElmVk1Y?=
 =?utf-8?Q?R46n0z6gVFw2kPyR9o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd918a2-a0c7-41c0-c7b2-08df1ee9cee3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:56:05.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tdkn8uZeZKEi9HKsnk3f6V/h18++MWIouz8GzihMjpTQK+MG6YZxu1kM5uAbS+BpoaS3eKYS4Ehczjsn70/JIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847
X-purgate-ID: tlsNG-c201ff/1790769380-71EA92A1-C38E5222/0/0
X-purgate-type: clean
X-purgate-size: 4799

On Wed Sep 30, 2026 at 12:07 PM CEST, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 30, 2026 at 10:34:02AM +0200, Jan Beulich wrote:
> > On 30.09.2026 10:09, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Sep 30, 2026 at 07:58:55AM +0200, Jan Beulich wrote:
> > >> On 30.09.2026 00:14, Alejandro Vallejo wrote:
> > >>> On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
> > >>>> On 29.09.2026 16:20, Roger Pau Monn=C3=A9 wrote:
> > >>>>> On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote=
:
> > >>>>>> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> > >>>>>>>  static inline void rcu_quiesce_disable(void)
> > >>>>>>>  {
> > >>>>>>> +    unsigned int cpu =3D smp_processor_id();
> > >>>>>>> +
> > >>>>>>>      preempt_disable();
> > >>>>>>> -    this_cpu(rcu_lock_cnt)++;
> > >>>>>>> -    barrier();
> > >>>>>>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> > >>>>>>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) =3D ACCESS_O=
NCE(rcu_epoch);
> > >>>>>>
> > >>>>>> I'm not terribly convinced about using ACCESS_ONCE() for atomic
> > >>>>>> accesses. In particular...
> > >>>>>>
> > >>>>>>> +    smp_mb();
> > >>>>>>>  }
> > >>>>>>> =20
> > >>>>>>>  static inline void rcu_quiesce_enable(void)
> > >>>>>>>  {
> > >>>>>>> -    barrier();
> > >>>>>>> -    this_cpu(rcu_lock_cnt)--;
> > >>>>>>> +
>
> Just noticed there's an unwanted newline being added here.
>
> > >>>>>>> +    smp_mb();
> > >>>>>>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
> > >>>>>>
> > >>>>>> ... this variable is to be read by remote CPUs and autodecrement=
 seems
> > >>>>>> like the wrong tool for an atomic decrement.
> > >>>>>
> > >>>>> I can use {read,write}_atomic() instead, but there's been a tende=
ncy
> > >>>>> to phase out the usage of those functions.  On x86 this should be=
 a
> > >>>>> plain `addl` or `subl` instruction (the non-locked version of
> > >>>>> atomic_{inc,dec}()).
> > >>>
> > >>> I don't think the compiler can merge volatile reads and writes. It =
can
> > >>> shatter them (thus my fear), but they are meant to be distinct beca=
use
> > >>> each might have different side effects. Jan already mentioned this =
in
> > >>> other words.
> > >>>
> > >>> You don't need an atomic decrement though, just an atomic write. No=
te
> > >>> IRQs restore it on exit and other CPUs don't write to it.
> > >>>
> > >>>   unsigned int *lock_cnt =3D &this_cpu(rcu_lock_cnt);
> > >>>   write_atomic(lock_cnt, *lock_cnt - 1);
> > >>>
> > >>> and this yields a plain mov, through a static inline stub (plus the
> > >>> mov from the read access + dec)
> > >>>
> > >>> The problem with ACCESS_ONCE() is that the write isn't guaranteed t=
o be
> > >>> atomic.
> > >>
> > >> It may not be properly written down anywhere, but at least the compi=
lers
> > >> we use are known to not tear aligned accesses up to a machine word i=
n
> > >> width.
> > >=20
> > > Then I possibly don't need the ACCESS_ONCE() at all, as I was using i=
t
> > > to guarantee unshattered accesses.  However this should be written
> > > somewhere, maybe in docs/process/coding-best-practices.pandoc?
> >=20
> > To write it down in any of our docs, we'd first need a proper reference
> > to somewhere. "Known to" isn't quite sufficient imo to actually nail
> > things down.
>
> Fair enough, I also assume compilers would never like to write
> this down anywhere in the documentation.
>
> > There's still the possibility of compiler bugs,
>
> Compiler bugs could apply to anything that a compiler generates, and
> hence is not likely relevant to mention for each compiler feature or
> behavior we rely upon.
>
> > and there's
> > also the possibility that volatile accesses have better guarantees than
> > non-volatile ones. (Recall that in prior discussions it was actually sa=
id
> > that we may need to make far more use of ACCESS_ONCE(), which wouldn't =
be
> > warranted if collectively we were certain aligned accesses cannot be
> > torn.)
>
> OK, so are we in agreement that ACCESS_ONCE(this_cpu(rcu_lock_cnt))--
> ensures accesses to the variable are always non-torn?  Splitting
> the access as a RMW is fine, as long as the accesses are not torn.

... so long as the variable is no wider than the machine word size. It
(may) shatter should rcu_lock_cnt be 64bits and this be run in arm32.
Which, granted, is not the case today so long as unsigned int is 32bits,
but we're using unsigned int because there's an assumption that width
doesn't matter for it.

I still think ACCESS_ONCE() is the wrong tool when atomic operations are
needed, but I will push no further on it for now. I do think this will
compile fine on current targets.

Cheers,
Alejandro

>
> Thanks, Roger.


