Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8584FCA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 22:14:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436774.1655453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBg5l-0002Xq-Ed; Tue, 29 Sep 2026 22:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436774.1655453; Tue, 29 Sep 2026 22:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBg5l-0002Xi-9L; Tue, 29 Sep 2026 22:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1436774;
 Tue, 29 Sep 2026 22:14:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xBg5j-0002Xc-Ff
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 22:14:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBg5i-00AFC6-E0
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 00:14:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6abc37d8-e002-0a2a0a5209dd-0a2a450b9a10-40
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 00:14:25 +0200
Received: from [52.101.201.63]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6abc383e-b7e8-0a2a450b0019-3465c93fcfea-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 00:14:25 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 22:14:20 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 22:14:20 +0000
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
 b=mDFOTFmUOIy0xOY+ahCEyBwEvfAqji5OlijloHGaKBRYQ4+0ehvXwW/u6isz5WyLgeF0JI1M+YnMoCIRNglhF1uKD08y08qIOGNUZHU63QRvxc0qXaLQlJ+nj/o2LmxfBPq6OP0Q14qSai5ieSvn3VYobENiDa56LtMers5sZ1SN3Djl8MXoo48HEUW88g2BUv6gg82/XqecQIgKUfohOPJDNl13Kj6je8bAP/OYoaGaLtSwmt4zXsGP6YYzN6XCi8PnmGcRcWXdSUnsiuUdZvgh3JNUnKXBMki73A8hK2uhW8vCibqUi+gt6r/zrGVTyc+tNizj31n5nIzzBXoQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DTCeiRWe7YnxT7GQqI5PQoIwd621Q5QNZWtF+VCMWw=;
 b=CsUh+A9dButLn7KjMva8oZonBlx8qZ8aJyfz52A5RSu9bBBVe+tu7laUe1+2UXMkJ5c6VOjchagJvb4Gx3Tw6pL6FwvCz8ScLY1IZ6pO9uJpTCxsmtUjMWy5xhbREmzUzc3nYP+puGidmUDvFv6hqkxA9qXEZ1XU8GbvPDg0qzncHvJF9c/ieKfFO6XuQ6Un5mfw3TjEtI4nh76ZWRP/rKHJsJhsFukjX8fxmPGyr3X1t3ctu47JtggxENCsePmrLeSLOYFkt3zKLfR7Emfmx3qecTlUJjDWCqU6csq0wpuLkSmfwYTB8tPjugt9KJrW2E4RErQAnQdFJ9Hq8y1P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DTCeiRWe7YnxT7GQqI5PQoIwd621Q5QNZWtF+VCMWw=;
 b=l9KBvjqLp/U2Z4LZ8qZccy0tcLXC7hxCCV7kNQZFDQKhAH4gYr4zLN7qpeI7aWp8fzFZiaOaiFtqhvVBbnSTPczhfc8nES/7ZvoSJgQhmdtwDNWoB4PA0glU58canHDuawaxPD1LgeNsMTmnWRYfF322XextZu3nG12aykOofa0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 00:14:15 +0200
Message-Id: <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com> <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
In-Reply-To: <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
X-ClientProxiedBy: MA3P292CA0043.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::17) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 237c613f-022b-48b5-b838-08df1e770236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6mF3AOuVJg+vKBvWmC5hBoh4ZY9oqiqUcc+Rfd3hRisG0NJtiVBmra49gdTEtPM+scXbUTtKv57WOa3yMVEAHgLH2NewybLvjGCOb0t2gjrme80ya4183XtcTTG8q6bj90xU4xPGlyk6wlVDahHdauxlcJLY84/B9/vz4HN1AWfa8IGotjpLy5y5joZaBOUPbyA944sDePxKLisbZn1xelbqKuGAp2mjHemFOkeLbh4sHFvy/PS1TZTso/J2nBpPyj0BzLpKibvjpc7eTOkR+HW89VuPRc0/cJVbQmE8lLNOnEwmtD3sopsn4AMizVT3OvdXET8XA5v3KHs1zFWV8oRehPVtbRiQ6GMMkeAZBs5EWZaraJSNGT0GKcyd9E9tI5eErklZssFpoVqzT37+ybB2SQWq2Znan1ZdUMVzENtj1nyapGR6E5zipXvR/cS/zweP1nPzTQ+AsC/AdWzfL/MiZpmpN6DGPzi8TBS/4JTQJ59lmgeM1LFtyDYqUZ7nu2trerKq5rQBxb+siNfZ34n67Zj0ZLnk3d7IIvsct8VY204vN08/5Zr4aTFZgBxS7in9z08hvoIRqUU1rTk3Z7qxRdDa57vamFF0EzkvlPsPAYqKc8TCNtVtYa9MAHBVfG0Kalu28ycFN0gF8ZpdEHEMzmhAfF6gHsEqX6GDnN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2J4NDNReEtCMXRKa1VZQXl3MXh6UUo1ZnFaQ0dJcGJaOHFTWFYvd1FHclJ2?=
 =?utf-8?B?OFByKzVObUxDOHlpaDFNZE9ycWgzNzE2cTZxK1VPMHlwVlZYL1VzelFjTG5p?=
 =?utf-8?B?eXBLRi9ESEprZUdJZ1RKVnptd2JTaE80aExGd3cvMjErZktuQzF2SzU4SnQx?=
 =?utf-8?B?TW5IMW1yYUErNFkvNGcvL0J0aGtMcms2Q0FqOUw5YmZaeUhWSFZrTUhDaXY4?=
 =?utf-8?B?RlNRSExrSWRudnFqR3ZFUnFCZDAyS0RudkN3ZXA5ZXk5VFNaazN3c0pjemxk?=
 =?utf-8?B?bVhjMG9LUjRsY01iUDVaaGdoSHNOeXUycDVWS2daVERNclFJeEZMb1Z1YkpH?=
 =?utf-8?B?WTlIUk5RajNVMWF4eFV6UnUvMHV1VUswMTNZWmIvTHNOSk5TeWlKQzJ0WDRO?=
 =?utf-8?B?Q0IxQThTeUdqcU9Lajlua1kyczVTRlNjbXRsZUZCQitYOWJjYzNiSDlPUFhL?=
 =?utf-8?B?dEpjZjRhN2MxclJiZ1BiZEJxMmZBM0FvZGwyaEt4M0l1MWdKT0h5OUVwMDlm?=
 =?utf-8?B?bm9vY28rcEs1c2VoelBkd1JoSmhqU1hzRld1VkdsdTdzRjBubWliVDNSTllC?=
 =?utf-8?B?djN5QUMyZXE1T0w2QVEwUzgrak9CQVkvdC9OV0F1b2d1RHNuanlVaUtWL0U3?=
 =?utf-8?B?WFdXRU1kSk5INXdJYlVaL3kvTjQwZ1dPejZlNGk4RUlQN1pKU2RORWFrbWRO?=
 =?utf-8?B?SUhxOU8yVHE4YkNhbGY0czlrZWZNQWxhQ0tBZEhxLzFtTlp5S1I2anV0UG5S?=
 =?utf-8?B?bDBYSzlFTS9KRXlnNDVSS3praEl6MDVRSEkwNWZvSGo2QzZIQTYrN1djUE9O?=
 =?utf-8?B?N3Q4NVhQeUNWQ0taakFNMWdUOFFpclQ3QkxKS0dEWnd6dS81ZHc2cFkxMVJk?=
 =?utf-8?B?dmlCK2dDNjlwaUN2c1ByZktoMDVvZzJrVlRYOUtVRkU4VkZ3ZUxTV2dManlD?=
 =?utf-8?B?dUNDMjdIRWRpbmdQRGJPMkZpV0xrdnZaMG5wdlVYYjRQNm04SHN1dFp0dU9W?=
 =?utf-8?B?N0tyVy9hYU5Tekh3Y1N4REpkMFRiRXYzSFRJZHIrVDBtNC9OUm5XOU9xVFBI?=
 =?utf-8?B?U2pmL1BzUUJhTjJNVGNoWDRQblhrSXNvTmdUMGNwZDNSMkxSZlN3WHZZUVpp?=
 =?utf-8?B?aFZQSVdMR3kwUGNwR3loUG5RZWlRaEdsSEtkaVNzMDlLTjV4SkhSbUxza0dE?=
 =?utf-8?B?a2xYQ0JKUnMxbGp4UzJNVGFCYmZNcmRsTy8vZDFSOFkwYlRxb0tWemViS1Uw?=
 =?utf-8?B?OWVHVWRxeHMzL1ROekFDYUoyTklIVHFrRnErVzBxZnZubXFFdUN2dE1DM2tF?=
 =?utf-8?B?RVVMVkhNRjJSNkVQU2lOS2JMNnRXakZtNW91R3pFUThyVVc1YW9oNDNvVU1X?=
 =?utf-8?B?eHlVbHdkUG8waU5BaHFBREVuSHduKys3b2RCQW55UzVYVERHUXVyMDMvbzdD?=
 =?utf-8?B?amI0R2ZHdDlVS2puUURGQmRRQktwWjRJZUZmbzlRcUNuVC9XTEE5TXBMYXFk?=
 =?utf-8?B?QVZRRTFiOXg4NEdpQ2ducGhCU1hDZzBXSllZK3E0aVVNYlJGOHNkVEVOOGVq?=
 =?utf-8?B?SGNUYTZ2QmF1RWRENzE3SHpEOVN2MmVueHVYU2dNY1RtUktWTG1ZTWJrTWll?=
 =?utf-8?B?RUlkOFJUL1pkeTQrOFovMU9uVk9GK2cxc0RsV3Q3SFpVUGcvR3pGQUNqa3Z4?=
 =?utf-8?B?Y1JWK0t0ZWRwVWkrNktZaTBVVWE5eTUzUlNiaVIrbWtMb0trTisrV3A2R1BX?=
 =?utf-8?B?Um9USkFOWXFZTVZCUEVsUXNZemlkUFNuSVR2T2hXOEsxcTBWcUdlWHV3ZEhV?=
 =?utf-8?B?M1I0TE83c2JiVTIwOGwxVGNyaHpXNHRXdUkzVnR5a0RRUWI5YUs0b0xiaERs?=
 =?utf-8?B?aFpMVHFEdnJjSW8yQlZuTzU0RWdlZytRQkJHWUNlRmpEMVV0TWxMSFZNb0Fq?=
 =?utf-8?B?WVd3blZUN0YvcENDZGVyRUt6c3lBejhzcDAvck5VeHBjaXhUbUp5ZFpRb1Br?=
 =?utf-8?B?anRoMWxPdzYxcUNMUDF4RVFPb0xhaGhRYVhXaFJicU81d09kQkJOM25JM1Vs?=
 =?utf-8?B?SmxxQ1h5Qi9LeEpGQmh0cGZRbUliR25RWkxyNHczWUNXeWhCNnhNa1VuQk9w?=
 =?utf-8?B?NlNtN25FS1pSWGN6K0VSZXFGUGZRUTVuQmdLdUg1MkVXbEhkTDFVM0JMRW56?=
 =?utf-8?B?SzU3d2JUQ3FqVE95d0Q1bnVZelVPaHpzTjBwVW93NmFvK0dQRk4xK3ZSZ2xE?=
 =?utf-8?B?dzZQTGVRQ2ZuTWNjTjh3WFNnN3l5Y1hVZ1hxeExrUmhpV3NuS1RGMjZ0aXk0?=
 =?utf-8?Q?6etMzQ49qUEt6iZo9x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237c613f-022b-48b5-b838-08df1e770236
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 22:14:19.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHipge1XEe0Shat3YABwSAdnaTqs70ndhUfpHimTJu8OHciP6RPIeFTd3xysaCdoFu2oIRMxS1/pPFDyhpjYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798
X-purgate-ID: tlsNG-42698a/1790720065-19EC69EA-03A7A788/0/0
X-purgate-type: clean
X-purgate-size: 3049

On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
> On 29.09.2026 16:20, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
> >> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> >>>  static inline void rcu_quiesce_disable(void)
> >>>  {
> >>> +    unsigned int cpu =3D smp_processor_id();
> >>> +
> >>>      preempt_disable();
> >>> -    this_cpu(rcu_lock_cnt)++;
> >>> -    barrier();
> >>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> >>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) =3D ACCESS_ONCE(rc=
u_epoch);
> >>
> >> I'm not terribly convinced about using ACCESS_ONCE() for atomic
> >> accesses. In particular...
> >>
> >>> +    smp_mb();
> >>>  }
> >>> =20
> >>>  static inline void rcu_quiesce_enable(void)
> >>>  {
> >>> -    barrier();
> >>> -    this_cpu(rcu_lock_cnt)--;
> >>> +
> >>> +    smp_mb();
> >>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
> >>
> >> ... this variable is to be read by remote CPUs and autodecrement seems
> >> like the wrong tool for an atomic decrement.
> >=20
> > I can use {read,write}_atomic() instead, but there's been a tendency
> > to phase out the usage of those functions.  On x86 this should be a
> > plain `addl` or `subl` instruction (the non-locked version of
> > atomic_{inc,dec}()).

I don't think the compiler can merge volatile reads and writes. It can
shatter them (thus my fear), but they are meant to be distinct because
each might have different side effects. Jan already mentioned this in
other words.

You don't need an atomic decrement though, just an atomic write. Note
IRQs restore it on exit and other CPUs don't write to it.

  unsigned int *lock_cnt =3D &this_cpu(rcu_lock_cnt);
  write_atomic(lock_cnt, *lock_cnt - 1);

and this yields a plain mov, through a static inline stub (plus the
mov from the read access + dec)

The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
atomic.

>
> If remote CPUs are to access the variable, is a non-locked access okay
> in the first place?

You use locked access when you need sequential consistency or an atomic
RMW, and that's not it here. There's a single writer (currrent CPU) and
IRQs don't play a part because the restore the previous value before
returning. So it's race-free. All we need to ensure is that remote CPUs
never see a partial write.

Another take would be to subsume the prior smp_mb() into the decrement.
Something like:

  arch_fetch_add(&this_cpu(rcu_lock_cnt), RCU_LOCK_CNT_MAX);

This would make the decrement itself atomic (through a locked insn), but
ensure sequential consistency as well, thus removing the need for the
prior barrier. It's trickery through twos complement to behave like a unit
decrement.

My point isn't so much the "how" (should be obvious by now there's many
ways), but to not use ACCESS_ONCE() where an atomic read or write was
meant. Not necessarily a locked instruction. Just atomic.

Cheers,
Alejandro

