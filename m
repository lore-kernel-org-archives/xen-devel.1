Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E598CA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 08:27:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444072.1661095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF5wr-0006NH-N0; Fri, 09 Oct 2026 08:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444072.1661095; Fri, 09 Oct 2026 08:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF5wr-0006Mt-Jl; Fri, 09 Oct 2026 08:27:25 +0000
Received: by outflank-mailman (input) for mailman id 1444072;
 Fri, 09 Oct 2026 08:27:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xF5wq-0006Kb-VN
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 08:27:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF5wp-00FDig-MP
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 10:27:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac8a55f-2eae-0a2a0a5409dd-0a2a4507da74-32
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 10:27:23 +0200
Received: from [40.93.195.58]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac8a568-b4ea-0a2a45070019-285dc33a687c-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 10:27:22 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 08:27:17 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 08:27:17 +0000
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
 b=qJoZASVnfHiuQTvmLP7MmEhtFMgRRCiixJAZPsEP/U+apg5A9yAH6WIZAH4t4oXYoLjrVJJlmM6vqfH0rectj0qsO1yBhpgfM+m7/6Ay1cAbXkoand3P6jhP9Okxlam7ON3o3dIlMcVSdsQoHpb5QUucMAjSPQ7GSSdBcrcFJt+ujszZoAFGuULq7C53nk8+j0qIyHeYjr2HhHg7M9e++eHi6BO74QYNVaztPSjY3TMhwSAqPTCjRIp0cG5f56goKgYLomLN1uzQw8/zVG3cj8VMIKZMqvUr3oezVOElXzbRftNx+epDfCAJq8BQijI95NkVaa+64+mLjNj2X+F5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBAr+FGmNVov5kwYsJG0nmjFF6lCChS+ZKjKTew6/ME=;
 b=CJ1wacDjI2XKO7AvkA5MkmUXeX+EjKl9zwZnAw1TjCj4dQYzC3c7iq3Z6Fe0lCbiEIl6NIcCn0dkNTj/HnVqO0CLr3DfPexdNKqrJ/9J499PTSNWMU+hk6RgmKmcqNecxXQ1raYxrfVIhYRWupNrJDDr3BHmgI1vhDPUrBkcgdtUzb86rHhUClHRHCjVf/Fz625uRym4/K0w+7hAFWfT1IoOwOHhunZtIAGDOvAK7pgGg99elnOPiYWY4ZW1MaVtJZE+yzw7+8Ckqq1SGwRiS1R8OBrZg2m+L5IRr5smtl8dMPjD6oN1+6g0NJSo6aMwwE4DH7Xie41Q2wu5T0rqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBAr+FGmNVov5kwYsJG0nmjFF6lCChS+ZKjKTew6/ME=;
 b=LJZiEI5+y7z6ppGdDmOE0J3douVmmmWPYEm+l3BdeRjLBCc3ZX2l/OaUv2EjHxnN4QRgg0JX1qH9T3atbOYl/8O2d+yHzl1wJoxSXkfuH0qyr4/rbrOmJtv3j6hh9xu/jZZA9eVAD3UwdrIFStCSjZ+TviJssQO+c+/J+5kn+KU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 10:27:12 +0200
Message-Id: <DM05YCBPLKR8.4ISDKVT1L933@amd.com>
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] xen/arm: Sanity test specified domain's memory for
 being a multiple of a page size
X-Mailer: aerc 0.17.0
References: <20261007124813.177940-1-michal.orzel@amd.com>
 <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
 <45cb2679-c79e-4d67-abaf-a4fe8e5ddc51@amd.com>
 <DLYO8NTSYU10.23RIZURXYV9ME@amd.com>
 <9600e1ea-d85c-4c59-abf9-bb90b1e8cd72@amd.com>
In-Reply-To: <9600e1ea-d85c-4c59-abf9-bb90b1e8cd72@amd.com>
X-ClientProxiedBy: MR1P264CA0212.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::20) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7c1690-ebb8-4821-efda-08df25df2148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RxTgLYuLxlj/+ghKZE8s4YwAmyCpocFQQyrsInAzi2WyV3nJheoyAYrm+Ij49sH4iOobTHZWfS1i3kHXpOmavmRY6tudsM7fHg5TfDvtwo88JzUAVBRP58mDvPhX42f0TjAtUw4l/Qqj2ywIp9SOjkk8957P7QpWQA/akdkeXdVEEMFJroHXj7adZ3dV39S6S5p1hnvcOWVeRilBdEpJ61hN7t+GYSuqJi44y/0mv3mOCsQuNQVPmPO69kLmwHBKCw7raGCclLKGUmxFGmy6uNJISuK8dGgn/7igoHmxJXo0JFyCOSNVpCsnAchJIbabIlUC42NbgGUlVSUrsZc6FNzmpcCTG5TQpNee9RXvg2zxKN17rFe1uXgHTeMlOvSm6PToyVMzvEBYTJdpT4VKFCaxhUUlc371VSD3J6KkHTky1gt5C4kvvA8NEW5xUt6X5waocHSJ8ABRGnIV4V4PoP4uAT1AoHL8Cm0n87hQdqR2+N9QcYiVlhxK6+cZgHOcGwdRzOtgN91Um01KIejc0parP75CcaB4mRNCc9farlMDmMTBZkYd+ImoZ+l37mTpuiLLi6x6tJQaIzUf3MMlDJFptm5XthfZyR3KsonEDht5u+fVrHxnc1NADD89SAKG4MR90RUA4kEyisSMVvVEkehcrYl/gJdzhcqPOQH3qmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEhvVFM5TVRZNmc5RFJCc0lFZ0pENnUzdVNLaXkwcHRzNVZVVGdsM29TYVR1?=
 =?utf-8?B?RDAxSERTOExHQVhOaVBKaFVMZG1CYXJ5anFLWURPbDUrcmVSWXU1NXRTS3dh?=
 =?utf-8?B?KzRyV2hDL0VqL2dnbTUvNDJ4VjdiMnpxekRtdG8vZk05M3BMN0RMUFIzR2lQ?=
 =?utf-8?B?clJseE9KZjVFT1BKWUNKaUdWdDZ1a3hIdVhhYjI0SGJBWXhPYXNPWjUyUzhS?=
 =?utf-8?B?NTI3KzBvdjhSUkxmbnloV25NeEoyUzBsRFdnbXRuME95bTRaN3NIVkpFeWdM?=
 =?utf-8?B?QVRsTkxIVE9vQ3BpcDJkNHFLUERrNUxzK0w1d0IrMDlFNDIvbk0yODNZN0Uv?=
 =?utf-8?B?UVhLUE1LNjljcXMyNlVuUXFib0F6d08zRHpaTnRvTHJTK0Ezc3pjV2xWenZX?=
 =?utf-8?B?MldSdGQxd1c1WTd1QmE3QjlxN2RIWENNQXZ5OGxmNVZEN3VFbnkyRkhrakVO?=
 =?utf-8?B?a0pDVjIrK1REekcyWWNNMXpwTGcyY0VpNTZUWmVBNnMzS3E1V0ZXdnU2Y2Er?=
 =?utf-8?B?MkRFS2s1SHRaa1JsazVQTnJTdGpCTkMyZEhGaFg0a0daT1gxWGszbFpOUUkr?=
 =?utf-8?B?QUREOHc4QVhmTURkUnB3NnU1WGFVQzY1NE11V2VQdmpLN05qNnNGR2FaS1or?=
 =?utf-8?B?MmtwVzZBc0RHMnNoaW5CSVppMXdMMktGWHBKWVFNSXpYYTh4T2ozS3FvQ2s4?=
 =?utf-8?B?di9hTk51bERISVlPSVUvc1FmdmdzTWhaZklmOXVpeFZIcFMyZmhEWWRFcVNU?=
 =?utf-8?B?aDNDM1ZmVUdGYk5jcERrakxJdWg4c1NmcTVPanFGMFRDN0hZSTJ3UTlLWWla?=
 =?utf-8?B?azFFV244TzFGNDU4ZDllZjBVV0U5QnQ5MkM2NXNncG0vMmVZY1lUSlhhbVFz?=
 =?utf-8?B?NEJueFNhWGU1QkJyWUhBSC9ETmNjSjVuT0JDeHVnMUlDNy9FZjR1ODBQSjV2?=
 =?utf-8?B?NFpNY0V4YjBjOVJBOXIzakszdWZ2eDlwMUJ0M0x0VWo3YWZ3QVRVTVJHa3F4?=
 =?utf-8?B?d2w4b0p3NCtLVFVKeWV2NFFqWGlDTUFkSDZDcXV0bEFUdGp0MU9WR1h2WGYz?=
 =?utf-8?B?WFJrWTEwREEzTk9JbUhHOGxxWUttVXVPM0V0eGw2NDFuZXNpVWh6QnBBcVov?=
 =?utf-8?B?L3I1Yjg3TDR5ZXg5c0hxODN0NWVYUUV0bE5QeTg3R2RuREh4bVZVSVB5RFFx?=
 =?utf-8?B?TURid0E2ak9ES1RxQXpyWFNaYjhjREtkY2NHU3pGKzRwT3J6RU9NUGYzOXJ4?=
 =?utf-8?B?L29RQWI5V0JDZElnL3pXeFF2NTM5bCs4Q0NZQVlrVEVBbWJqUkEvL0RUOUhJ?=
 =?utf-8?B?MENiQmlqN1VTQWVMWmFWdlA1Nm85MjgvNzRwWTZMVkJZZjV0QUJnL1RPb2N3?=
 =?utf-8?B?L2lDQjBnSUNSWWZrNW1qSWN5dmFQN0lJYy9qV3NDTjJvVlFyNFNxeVVob2hY?=
 =?utf-8?B?Y0N5Vml6R3FkdWxDV3NGSHNoZXpLRnRETUgySkdoSWQ2dlA0M1loaHpFUWFY?=
 =?utf-8?B?MVkrdXlYcEFVclk0SnNZNmd4YksrNXBMb3RUZTh6N0Rlb0MwajlsVUh4dnhp?=
 =?utf-8?B?Q1VVTENFc0lLeU9nRlRjQXBnYkpkTWE5eU5QMFRtTEl2cXl1M3pNcmJlVGdI?=
 =?utf-8?B?VTBYMDVYaUxEV1oybjRaZnZ5b1JxSTJtZkNvUnRsT3ErbkRKZkE3MVd5OGRp?=
 =?utf-8?B?MEUyNG5PNmg3aXpremxVVkorYitEN3ErWGkvZ0pacldnN05zMWRSV2lLMG5j?=
 =?utf-8?B?bm4zZ1ZpYUxyREk5V25Ca3lVMnF3S2JJZkcvemJhdGRjaE5PWHVTb0NTSlFt?=
 =?utf-8?B?OE5RU29FbzMvd09memxHdE0rMWpkMndXclhsT1JiQndidVl1NFkrOXpFWGJy?=
 =?utf-8?B?NTVXd3BVQjRIamFVYWVpRU5CZ2VsTlgxKzcvSUlWRWhmQlp6SmI0MlJrYkFp?=
 =?utf-8?B?SCtISURybnJKaDZDM2VxRlJqWUlUUE5zbm5qMXIxdXcybnozMENjczBxeG5x?=
 =?utf-8?B?YVptcXk4Z0pKR2kwRW1KeEkrNUtQemNlNHNtSFN4cXJuVWFqay9FYzl5Q3FQ?=
 =?utf-8?B?N2czZlkvdjhWOFFnSW9hZHR0azJMRDdJT2NjbjF0TnRxZXNCQ1BzZDVpQjEz?=
 =?utf-8?B?dTBRcTVZQm1NYnZDNEFQWmYrOVVuUmlyaUgxZllRSy9QeHE0cFA1SlRPdDVD?=
 =?utf-8?B?VmpQOFl1c3FpUFo1dksxOFByOEFuMmoyT2VCeEczNkV6UWtIbWs5NldpUjNm?=
 =?utf-8?B?clAxL3JGSkhXSTVCQWkyYVdjcFdxMkdieU5zUDRmd2tPa0lrWXM4VmVUY2Rh?=
 =?utf-8?B?dFpQN2w0RCtNd0tRQWtEbDFxcUE1MjNRRkVxT1RENWZGcjhaWnNYUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7c1690-ebb8-4821-efda-08df25df2148
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:27:17.7485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGMKS18vl9gEUi1fZcOu5ZNBEl1C8KrjfVECiKL+ISwA3+kn+aw96tTIfVB2aP0cXK0AgczYe2Mr48iLWs6iCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
X-purgate-ID: tlsNG-ef75cf/1791534443-36AD8AE4-842907B9/0/0
X-purgate-type: clean
X-purgate-size: 3770

On Wed Oct 7, 2026 at 4:31 PM CEST, Orzel, Michal wrote:
>
>
> On 07-Oct-26 16:21, Alejandro Vallejo wrote:
> > On Wed Oct 7, 2026 at 4:11 PM CEST, Orzel, Michal wrote:
> >>
> >>
> >> On 07-Oct-26 15:40, Alejandro Vallejo wrote:
> >>> On Wed Oct 7, 2026 at 2:48 PM CEST, Michal Orzel wrote:
> >>>> We require memory to allocate for a domain as RAM to be a multiple o=
f a
> >>>> page size. However, we neither document this nor sanity test. Specif=
ying
> >>>> memory size that does not conform to this requirement fails the doma=
in
> >>>> memory allocation in the non-obvious way that is difficult to parse =
for
> >>>> the user (printing over-allocation messages followed by the panic th=
at Xen
> >>>> could not allocate the requested amount of memory).
> >>>>
> >>>> While there, fix indentation from tabs to spaces for "memory" parame=
ter in
> >>>> booting.txt.
> >>>>
> >>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >>>> ---
> >>>>  docs/misc/arm/device-tree/booting.txt   | 4 ++--
> >>>>  docs/misc/xen-command-line.pandoc       | 5 +++--
> >>>>  xen/arch/arm/domain_build.c             | 6 ++++++
> >>>>  xen/common/device-tree/dom0less-build.c | 7 +++++++
> >>>>  4 files changed, 18 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/d=
evice-tree/booting.txt
> >>>> index bcb06bc796bf..7dfac2062a37 100644
> >>>> --- a/docs/misc/arm/device-tree/booting.txt
> >>>> +++ b/docs/misc/arm/device-tree/booting.txt
> >>>> @@ -155,8 +155,8 @@ with the following properties:
> >>>> =20
> >>>>  - memory
> >>>> =20
> >>>> -	A 64-bit integer specifying the amount of kilobytes of RAM to
> >>>> -    allocate to the guest.
> >>>> +    A 64-bit integer specifying the amount of kilobytes of RAM to
> >>>> +    allocate to the guest. Must be a multiple of 4KB (the page size=
).
> >>>
> >>> nit: s/KB/KiB
> >> Is it? I don't think it matters at all seeing the number of occurrence=
s in the code.
> >>
> >>>
> >>> But page size isn't always 4KiB on all ports. PowerPC has 64KiB pages=
.
> >>> IMO, 4KB shouldn't be here or elsewhere in documentation.
> >> This is Arm doc and on Arm we only support 4KB at the moment. User sho=
uld not
> >> need to dig into the code to check what is the page size. It's better =
imo to
> >> give this information right away and change in the future when we add =
support
> >> for 16 and 64KB pages on Arm.
> >=20
> > This is already the only reference the other ports have for dom0less.
> > The document shouldn't be here since the movement of dom0less to common
> > code, but the side effect of it is that this no longer an arm-only refe=
rence.
> >=20
> > I won't be annoying about moving the doc on this patch because that's a
> > separate matter, but not adding more easily avoidable debt seems
> > warranted.
> I don't quite understand your reasoning. If you worry about dom0less !=3D=
 Arm,
> then on that basis HAS_DOM0LESS is selected only for Arm and RISCV where
> PAGE_SIZE is 4KB. I don't think I'm introducing any doubt here. I can rem=
ove the
> 4KB mentioning from the docs if you really insist but at least for me it'=
s
> clearer for the user to know right away what's the requirement for the si=
ze.

It's a small adjustment to make the documentation truly generic. And
prevents the pgsz =3D=3D 4KiB assumption from spreading further. Many docs
are spawned from copying other docs.

If you're so strongly against, that's fine; it's not incorrect today.
I still think the 4K should be gone, but if don't want to block the
patch on such silly things.

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

>
> ~Michal


