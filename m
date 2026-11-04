Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BCC606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=j/7gxdvB
Received: from list by lists.xenproject.org with outflank-mailman.1471708.1679940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZ6i-0003wo-Pj; Wed, 04 Nov 2026 11:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471708.1679940; Wed, 04 Nov 2026 11:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZ6i-0003wh-M6; Wed, 04 Nov 2026 11:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1471708;
 Wed, 04 Nov 2026 11:24:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xOZ6h-0003wb-6k
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:24:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOZ6g-00BvRR-Je
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:24:42 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb15f4-8faa-0a2a0a5109dd-0a2a450ccec4-26
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:24:42 +0100
Received: from [52.101.57.29]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb15f9-f479-0a2a450c0019-3465391d90cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:24:41 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5556.namprd03.prod.outlook.com (2603:10b6:208:297::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:24:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 11:24:39 +0000
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
 b=ogfFkj9ieF8gl5RsBsKXLpae4Kvj4cM37rjgNSJbTOfCIhClLbQKxsBpDOGS+KdTKqaErHYeStxLLo8vm/NRiX4inbjGV4icOXqGfV3yfgtc4cEaRFwwYZbXi6faa3D4R75G1d2pzexhOTJscRzFbFAlR12ir4UgvNUi8ucA+tChmXdYg/tmYceJLHWm0TCOcr4UaoTbAVHPMNeinQRQAzz8SOYzP0RMaYlubrYggUQyJ0YdctoUv/oXgAkG8A+Gt1dJlfUTEDQOaECVGz17iJXL6YAYTQY7IFTFsFehjm2ZLE+6S0ef77v+tk+OuQyKZgNgfbcIj5itbBd/vICXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBPMcX8RjO2+i82SwiSUdTPfy6bL9PXZsbff7x7UdjY=;
 b=lyo0bo7pFjpeUgSTziW++snzuAJx7QZgYWOecxqHem0Q0GqB3sH6sALJp71n2X5HR75o5PUsGevNB/fAWD7kGV2X+Ni0qWR6R5h8jlQsRx0KQsWkZJtlA9aXqk5jV6A7c6+KzESdHmpBfuXuyurcm1RMed+Za9HbkuVAoeX3wESKfxqukC4mKbflVf0/hb+6xEV65CAclYSmp99nzoOFpCsuG6aU6K60ByhAha5HSiBid37mG6hxsc5jiM26l06Zbemd5zusRdorTVIdtlTnZcDmaZnzdo+epkkTs/PCsjsbSJN05hoYFVZTaAJhQMaOX14A3aUkp6BVelxPcSS5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBPMcX8RjO2+i82SwiSUdTPfy6bL9PXZsbff7x7UdjY=;
 b=j/7gxdvBwchMEolkg1Jb29F1ZLcGPl/ggFQwTESUFVF21Qm/gGKJ/jpQu5TF1qKVtLklmUCI9aP9EtqoBuTD+ZfZqacLYhfw8ywytKZmuGPvLxaRJqWgEHRvWUcn2MduHfM6A6Qw6InwBYZzIJC7yl46IuqpndRZXDiJlkjlwY0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com>
Date: Wed, 4 Nov 2026 11:24:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccf0975-f901-47c6-3275-08df3a663732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|261021121427099003|261026121527099003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|261102123227099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	yavHZFC2tSvFoNJiG64OfoTAc+rXeW9Xtjmai9Z4A1NTdOBo/ixl/a5KpUiWwwwNxjGueosvuMxJEmnCMeTs01BqYBJdNWOBCH8iLfS+7jwahiPgYIYloLlFkfFyXthlNEpIyAB9nktASb1Hu916sssK98eC9JZPKZeTumFVtJ0+ErNcnNUMMiK++0/2jpkc1mpr+dfnAt0eqv4m4/cWXy6KzCm123jwr8ZdreRfi7vUeMdLKoZ1mX1OcmI37QqYteEp73Ch1B9JuMgTZ2ir2KsJacoEb4kxdHvgaXSDOqZMCpF3sUnn5gYpZ9i8rCayxOMttl68FLIEl3fMI0ExrsUkoyjG28pWY55C/pOmeLbnfX8FG6y80vG5L2kGb5J54Ah3WFr59dlTtZ8qYLjqEr2KkKOk372NPNCCehsFrsFnVKQ9xYWjUNvc6QntbuO8ScgBdK+evvBkaQ+28rwqFniPx6Mmu2W5vx9kZ1MhPBMIQxiXYX/1KSLhkMVY3M+c/39KZUX0QlSYttuiO9kMy05slmZqu96dqZZbJ7f+CLv3c8zOJu/FneTaNRaN+gz+iczC8dHxMFJGFYf6A1qhhqvi1wqTfzAezN4L9lnDlF1oSMaLBhJNwjKMFFIFlDooBKJiwxvHSPI2fWqghF4ywmEpSja6rwd7jbiPXbfP1Gs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(261021121427099003)(261026121527099003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW5XampQZkdsdHRmTXNhSmxlQzNKakwrYUs4UUxUV2VvUHR5NTFZeVNiSWpq?=
 =?utf-8?B?L3c4TGV2TEhSTTNFYy9Kbm8zWGNBL1NwZGF2NkE3UXNQOVppaC9hUUw5bWxx?=
 =?utf-8?B?T0dPUWI1aXdqLzdUZ2FzeDVESzhhZys4UGxRSVMrK2RHM0dtSlE1eEE1dmo3?=
 =?utf-8?B?c3pVczBOL1RaZ0ttcmdRQWJOdVdGQWUxTG4vYjBZVnJxSWJHaHk0eENnSExW?=
 =?utf-8?B?NExIU1VISUI0TTRmcEVQVitRS2dCMTh5bWVDdlZQZ1VDaENQMStYM0RqbnFy?=
 =?utf-8?B?UjFjZjNGWlRSaE5vNXRleDFZS1U0N1hyZGwxay93WndHTURnME1kdGRnUFI2?=
 =?utf-8?B?RTY0eE0zd2o2bFp3RWFRYklNUFlwTU8xb3JVR1ZzTGN4M0wrS1ZtU0lUbFJS?=
 =?utf-8?B?SjdlbWtCSVFFSHRIVXB5dDMxNzNyWUdqV3NBM2NkdHZQcm9FYzFCTitBbS9Q?=
 =?utf-8?B?UVVzZUpySkluWW5kV0h4NlhQekRTdENIaW0wYUNrQW1BU25mQW1nOU10Wklp?=
 =?utf-8?B?cHZoQzlBbG1GelJrN0hHR3ZtQ25ISXYrWlhXQ2Z2Ym5uMnpsYWtLTW0xRHFw?=
 =?utf-8?B?RlVnWGprWkFFV2tPREtMS05DOE4rOWpVMS9ORFBIeXBvclQ1RVRRbVV2NkVk?=
 =?utf-8?B?SEJka093eG4zRkxSUGhUSXA5WWZCSlI5eU9zcXNZWU8wMUhMVnRXWk1weHpQ?=
 =?utf-8?B?QkJMTEp1RDcxVVN5aGxQdjJYUW9zd1l2NG40TkUyeHFUMEt2SW5vellNejVT?=
 =?utf-8?B?eDU5NXh4cHFNL3J4UHBZejVTRXVzeDlUazZPZytXNGtKdjFGUlpMVHJ1MEpH?=
 =?utf-8?B?cjU5L2ovVllvRSt5eGlDUnRiT01VYjhrZWFEWC9kSmhHQlREelpTWkxYZkFR?=
 =?utf-8?B?Qzh5N04rZUthNjFIZU9PaS8yNjZBVWVSZzR6Y0h5Q2xvMTAvSGFCVENEVTJM?=
 =?utf-8?B?Qm9XNmNUUjk0cDEydHhiL2NzMkwvTzRVREFBT29hMlRacTNFcENYNUZPYWtY?=
 =?utf-8?B?aHl0RTJJa0lUdHlkd2crNlBTN3ZCS3Nqb205cXdtdU5sNVNKcGI2Z3dCSkQr?=
 =?utf-8?B?ZWRFdW5URmFFTS9MV2VQNDRybnAycnl4aEpUaHorcmF5anFFUk53ZEhGSE51?=
 =?utf-8?B?TUJDK1d0WlhRM0tYQWFFaTlYNE0rN2x3OFBqdU16cHVhc1FHcTM5alIweEJR?=
 =?utf-8?B?R1RqODhMYklPU3RQR2RuMFRkcGwyb1l1SUxRWHQ1UmJuUXU0NUE2eFFIUUth?=
 =?utf-8?B?N1VzVytFS3pGSUpHTi9zMzNxT3EzNDAwN1FtVHY1eGgzQ2RFczV1TjViUXhS?=
 =?utf-8?B?b1AycHArSUJiUE1sZHkybzlYSy9NTi9YaGtvWTV3Z3JwR1ZRK1VIcTBpQUVZ?=
 =?utf-8?B?eDFsTXlNQ0VjTzRJT3E2QitUQktEUlQ3ZjZiVWNCYTJEa3BsMktNNTJyRlpC?=
 =?utf-8?B?ZUdqRjRyYzk2VEplRFY1Yjk3T1ZwaDVWeWNHSFRiNnl0RVVpT25VYndDWHdI?=
 =?utf-8?B?MVZzbnJINVNCTFFXNE9IUkhNUVhZS00vN1hZa05LRnV5S29ndVpCbU5nKzd1?=
 =?utf-8?B?dFlwaTFxYnhlNWJXbmdLQThvS05qcEdzQkpleVI4K3ViT05qbzhHTjgxRFdz?=
 =?utf-8?B?WXF6SE5URjBFTEJkWjNuR3ZSdVhWdkxoWUZGdldpeWtscEhGOS9kYURSbVdl?=
 =?utf-8?B?cVQ0UXFXMnczTUJRMEJTSkFXTjNFWlJBOXBjT2lCRDZXSEphbW9LRTI4aVBM?=
 =?utf-8?B?Zzk0VXY2ZzBndDRlVDB6Wk0zQWRNNVhOdE0rbkpDY2dLY0RhTC9QUW9lZVVz?=
 =?utf-8?B?K2JiMFppaWMwTk9OYXJrdW1VL3F6QjU1SzZDb25xallnT2FXU3VJcVR0SDJp?=
 =?utf-8?B?Zjd0Y01qb3dUMjhGRElLMm9HcTZibENTalh5RTB1Z2M5T3VxTXFtb0E4Vkd5?=
 =?utf-8?B?VG9pd09qZkM1MFpicy9MdkpzaDB4c2xsWlRTZmRmSFVSRi9JL2p3NHFaZGN2?=
 =?utf-8?B?REdmOExaSU94Z1g4bjJkWm5sTWxHNjc0cURINnF6M1QrY3hkQVZlN3NXTzkw?=
 =?utf-8?B?Q1VTOFFLaldRYXpoRkxBQ3Q2QXV3NC9DeExPd3ZPWkR1OWU4ODRPL05PMDMy?=
 =?utf-8?B?MXNWVENtUWhqc0pManh5Mjl4M2tCL3Fnbzh4eUVOZzMzUnBzU3RBblkwQ29o?=
 =?utf-8?B?UlYwQXNIcUJlRHdWKzd5QVRIT0FzTGkxd1U1WXdrWVd3aDI3VXcwZEx1RUMw?=
 =?utf-8?B?WmVsNFI3RGZqcDhjek9vdUxEV2Y1cks2NlMwWTRtTjZRVGJyNCtEa1NFOS93?=
 =?utf-8?B?TzlhYzJIVFdpMksyMlplVFBEemhFSFdYVk5Kam4wUlZyTi85d0tTdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccf0975-f901-47c6-3275-08df3a663732
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:24:39.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6p/JlRXcK3VIumCj7ppP/pAzcTTGBafvLz66MJzHHW2QonfRkqBtcrf1uRpBXP5IX/g1jSIT6NlmwyQDfyR1ICdESa5lBhCGM0MCjnEp6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5556
X-purgate-ID: tlsNG-d25034/1793791482-5290EA5B-FD4386CD/0/0
X-purgate-type: clean
X-purgate-size: 1153
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
> Livepatch passes const-qualified pointers from struct payload to xfree()
> and vfree(), which take a 'void *' argument. The cast that removes the
> const qualifier is a violation of MISRA C Rule 11.8.
>
> Such casts are safe.  The deallocation functions neither read nor write
> the content of the object being freed, and the object is not accessed
> after it has been freed.

I have a very firm objection to this.

It is impossible for any allocation from malloc()/calloc()/etc to point
to read-only memory, which is why free() takes a mutable pointer, not a
const pointer.  The same is true of any other heap implementation.

It is impossible to make an object in read-only memory undefined. 
Objects in read-only memory by definition have a global lifetime, and it
is absurd to argue that a specific heap implementation ought to permit
making such objects undefined.


The bug here is livepatch storing a heap allocation in a const pointer.

This comes from deeper problem where some contributors/reviewers want
the const keyword to mean something it doesn't.

~Andrew

