Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C493CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:22:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442406.1659956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESWn-00041c-IF; Wed, 07 Oct 2026 14:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442406.1659956; Wed, 07 Oct 2026 14:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESWn-00041V-EV; Wed, 07 Oct 2026 14:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1442406;
 Wed, 07 Oct 2026 14:21:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xESWm-00041P-9Z
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:21:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESWl-001qkw-Mf
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:21:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac65576-e002-0a2a0a5209dd-0a2a4509991a-20
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:21:51 +0200
Received: from [40.107.209.65]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac6557d-be1a-0a2a45090019-286bd14112b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:21:51 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by SA3PR12MB9129.namprd12.prod.outlook.com (2603:10b6:806:397::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:21:45 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 14:21:45 +0000
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
 b=rRVF7fKZPbLJRETL74AuKcXmrZxng7IsSL3eyrD6Eqkvd3j0IMYYwsHOuHZOlctZ0jr0Of7kVfPeH7utDwy6/M7goVDvNUvRdxhEofNhzwXx+gpi0siXGecuFDwLqnMfF3Rb3bWdtKfCkddkgGckkaWy4ATolyjY8beVcyyAKGwodKzhPs+HlLovha8zBYDu1QPUzKAbd6OtiMh+m5EbnpTV1ID0iuKgGFQnnulDIz9cMRJ21GLHJLi4oAH6kJaRzTm4Je2VmCasvWU5mNl5eWFgmYBtzWH87O7VignFqnFhNG7qTspPtZfZAfa4EF66/Cu2xVhN4/6K+6EmBjWfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psoKytfEhEGV1HfE4md0GFtZSUeMLgTFdljFFncIOG4=;
 b=V2U3ViW6vlshZms2Bfcr4/n358S0g9GxE1vJ2QUBZtq1Lrot5cUc84afVWMBDJQPKkW/ZxMtfJ7JrlC86KBh4cbSBbr9msQwRg3o8sotfrsviFl7wVGzcYyAJ4ROPQXPlb0HycBf9bpOKAQTZbFMXqDNlTVBPb8FAG78dxl7cd6J9XoAJUpbqEwdOMWk8ZvWJoEJWOi+GoFDsm8dmLtNAS142hdpw11zb3MJeHSTcwF5itwu9/F2HM72d5SJSj7GwVN7Krl5iOoodkV0bantlLB/BQzcL38k59UEJG0jao/QLL27TrZPCx7nb6m+Jz7eaVa17qqbkEKVpZGT/00tEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psoKytfEhEGV1HfE4md0GFtZSUeMLgTFdljFFncIOG4=;
 b=B6j9J+qJtbDIQS6Vy/DHQ7vwIX91K+7s2GCFdolIbVQrk78syfQf6eaeJYo6sYqQ6EYCh3fLlZc0zfbtoJs+LadKcRmyJ4bM1c+bcet3nzL0NZilgIVb6xpxAsiAamvsZHxeMQdHh153s2N5zVgb+VItVu0hTeX47sY8Gzj5PT0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 16:21:41 +0200
Message-Id: <DLYO8NTSYU10.23RIZURXYV9ME@amd.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] xen/arm: Sanity test specified domain's memory for
 being a multiple of a page size
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261007124813.177940-1-michal.orzel@amd.com>
 <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
 <45cb2679-c79e-4d67-abaf-a4fe8e5ddc51@amd.com>
In-Reply-To: <45cb2679-c79e-4d67-abaf-a4fe8e5ddc51@amd.com>
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|SA3PR12MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 305fa81b-648a-48d4-c2a4-08df247e50ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5LIrcL5jnVWll3Lg1rl/NM43aApM2blUv+fFVEMY9Z4IVX23BkzfTm8FEl8BMpmLwmfkyJrXQFe/T06FxErfK6qqylijvbJxoouyrAzjBlA/O84qKnrGF+a3/RxGy94RKvyOf7zwUDsys1lYPIXaarF1NH4+gDVDgF3yAn28984nL/tJ7g0DS1Be3nHwO/4CPrB9tTQMPsTdkGckudw0nJOVCuuI1LptdD2tJeEWycF8+x/znHtlQqUOBfJhSYz2CNpd38ncNTUr1xgQZwjzmVjLKR0AJiFTt+8Y5CldXnRB2UZ8ZhPOIEW+bmJSyCfcJeslaR8A08yIpoxYSTjcPrtlS5li22RYSxOojjYkw4atba+EhhHFjmbdHB24tRfFdvrM+u7uhgwEcUxo6PVwNg+yhRIJ6MP7Q/+3d8SxoNZA2K6dJtBQ08egJLot0YLgRVNZEQdyOyyvKTP+wVFUfZblMexxFddsqPLtjm6MmqaPqQ31sukK5ZpTQnlwVfxB0f7RBJvHzFhHLihk934eg9V3pN+fDuYRAVrFppHW7Jtb/x9C4fuRF6eZal0MckXBn/hcJ141Gyd0Lqksq/88qCURUoYlmDBDUOscy9Nbn2k6uYqYu+KXb2oYcxmIEdF59uTZAhWqlajJNwMSZ6hbYLcaxIjW4xvGNZTCkY6iVVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ZnbVhCcXF5MFY1ekpYbmMvdFJBdXJ5dGh5VVVtaVdHNmNrMnFyNStkb24r?=
 =?utf-8?B?K2VtZHlCTExNYUEvSE1CTmZEUjY1anEwUEFOV0RvaVRFanlCTHF5K2xTRjlB?=
 =?utf-8?B?OFR0c2drbi9sMkx0bUl5RXRZTGNWakVrbnUxQVN4c2JTeERIcVVrRWtEMndj?=
 =?utf-8?B?V2pLMDRxSmRyeTNkZnNXSkhVMVEvWUhvZU1ORy9pV2VzRFZvUytOOHMwQm5Q?=
 =?utf-8?B?RDVNVkpjUXlkQnJ5T2ljVWJ2ZDZEODMySWhmV1RDekxxd3NuaDJaM1hhQ0RJ?=
 =?utf-8?B?ZVN6YU42UFgrQno4MnZQUHRSN0JidU5mZ01UNXNwVklKR1JnMGZzZFpmc0Rs?=
 =?utf-8?B?amduYXFZaS9KQ29lNjBCb3hTbHZ4eHdhUGZDbCtMd1lURWFSZWFWb01TUE1s?=
 =?utf-8?B?Q1FzMXNnR2pqRzRoTFpCY3NBd2ZkbnY0Q0NvSjZhSGNZWnl6Q0E1Y2pTcUJS?=
 =?utf-8?B?QStPb05KZmVJa2hkTEgxM0FDYmxaTVhPZWRHODJ0RHFqQm9lUGxNRWIyVytk?=
 =?utf-8?B?U2NpdkVNZWQ0bkdNMEtXSWoyNXRsNi9zbGVJZkdmSnFPdE00dkdCbFJLVnlC?=
 =?utf-8?B?Wk5ydGtlajJNTlpvek5oczU4eFB5U0tJV1V5V3c4dlUzdDlzaXpjNlpMUW04?=
 =?utf-8?B?ZExjTGdNbGczWGlaWDFmeFlVemY4YTgzMHdaN2ZDYjlZa1dHd3l0TllKR0wy?=
 =?utf-8?B?TERwcE9HLzJjVGhFdnJOQnFsaVMxVnU3NkNKbVJjd3dkUVZBcHJneHR0Tjh1?=
 =?utf-8?B?a0FzSWlRMmZ1OVplSmc3bGpsMUtqTmtKYzdjck9nRmVqYWdYaGlBM20wRTNx?=
 =?utf-8?B?N0EzMElCRTdHMmZoQ2hjSGFvdTFjUVg4b1NtcXQwTmtUdmYyaEJDZ2xHcWJD?=
 =?utf-8?B?aElLWU5tNGYzN1NpUE9hMzY4YnNubVV2eHJpL0ZXR3lhT2ZldVZhblFOcXFz?=
 =?utf-8?B?R2VxeXcrM21oSFpvM0prZmxadERwcmk3ekFZZHZrZ3VXSmVoTkt1S0FjU0FN?=
 =?utf-8?B?ZWNVSHR0RkozWGJRNTBKaFJxTWs0U0pvSThkZXpQclE2cWRySzMvc0VnR3Z2?=
 =?utf-8?B?aHZpK1NPQmsvV1JBNTlEOTh3Q2ZqN0lJUnRoeTYzZUdkSmRLelhRV2c3aDk5?=
 =?utf-8?B?cWpkckh0UHRiejF3aFBzN2tiTVBxWjVYMDl2WGVXRndhRVFRZVJaV1AvaWlO?=
 =?utf-8?B?ODZHUlZhaGVOV01KRWxhb0FvWGpyci9lbk83czdwNkNEdDQwZmV2RnE1YWdl?=
 =?utf-8?B?cGpGRzhuWkZvUXdCWXh1cENCdys4YlpCWElvOEN4YzhPWEhCbmhmaGZEeU1i?=
 =?utf-8?B?UWwxN3B5dVRxeUxIamljRXk4bFEzbDRYQXZvbkQ1Q1U3RFZySFAyRjJwZFpp?=
 =?utf-8?B?eW5wV3FRMTBTanVRYnlUWmcxaUJhT1NVdDRFU3Voa1czbjhmeFBHYlpZYXE1?=
 =?utf-8?B?bHA0WVhBNTlkd0p1eldZU1pBNlZpVGJJMVFnOVB3UFNTdERXTnZYUW1DRUtY?=
 =?utf-8?B?Z1dsNW5wdFBnQnpOdXI1K1FkbjNCRWhKRTRNTFQvazB5aHE3OUZGY05PWjhn?=
 =?utf-8?B?ZGM0UGJUYVExYUdzRE8xTW1Ed2R6QTdnTmVDTHlsM0pycWhDdWRWeDJaRWwz?=
 =?utf-8?B?YjdHdCtKc1ErL0RFenk4L01EOUVGN09wTVFTOG85WXdjZWZJQys3eC9lUGx4?=
 =?utf-8?B?bGduV0NCeW9xeWNzclQvYzdPdk5MVHpqZFFaV3VmQWdQaTFCNUp6bFBJVzNz?=
 =?utf-8?B?OGJYMjh4SVNHMGxUTFNKWWl0ZW9FRWJWbnNUVVE4WjkreUpzV1NFeDFuMCtU?=
 =?utf-8?B?MEtiaUpIZm5UbzlWVU9BMDdSMFIzNnF6Mm9lVm5RanNlb3I2UVg3RmVEVjFk?=
 =?utf-8?B?SlY1T0dqNlFqbkprWUJ3VXd6Nm8rMlJlUk9lSGl5RjlsblJGWWhzVGZueHMr?=
 =?utf-8?B?SnkwTTNnRENYSjN2KzFvUDRNcDRBa2lJalJadjFzR1BRZ2gxbzVndHcrVVA2?=
 =?utf-8?B?NWJSNFphWStPbUJFSUo5RTN1NXFNRXJQMVQ3WnRKeDZmbFlMRkVqV1Y4amhL?=
 =?utf-8?B?eGNiZVVGOU5SVTFxOW5NSldYeUFaaWpONXlGVmxEamJuSGJIVzZCeElHYVBM?=
 =?utf-8?B?RUcrNG92dmVsU05YNmcyM3lna2dTMVRyR2MyZEhZbmFVZkl0dWRMRk5UUzZq?=
 =?utf-8?B?M1pVK2ZLdkpVeHh0TWYzQ3lQdjV3eHhSNW5pa2dBbVY1VEkveVBic042LzVL?=
 =?utf-8?B?RDZnVDFhK05TOHUvUjFWZFB5VU1MUUJRR2tQZ0FvVEgvNmhha2xvbFVoSFc1?=
 =?utf-8?B?REwvK2dsV1hFWTJIQUs0N2doZTdIdkhkcEZUbmJxU2JMYW5VSnFjZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305fa81b-648a-48d4-c2a4-08df247e50ba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:21:45.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIeC/lsy/keFohGURjRHtixKk/rNJ5N1oobg23UuLub+9mo8k4G7QAaN6geVE92UFBkkM5nrjy7FSxTODvo72g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9129
X-purgate-ID: tlsNG-bad1c0/1791382911-BC4CB034-A16240B3/0/0
X-purgate-type: clean
X-purgate-size: 6392

On Wed Oct 7, 2026 at 4:11 PM CEST, Orzel, Michal wrote:
>
>
> On 07-Oct-26 15:40, Alejandro Vallejo wrote:
> > On Wed Oct 7, 2026 at 2:48 PM CEST, Michal Orzel wrote:
> >> We require memory to allocate for a domain as RAM to be a multiple of =
a
> >> page size. However, we neither document this nor sanity test. Specifyi=
ng
> >> memory size that does not conform to this requirement fails the domain
> >> memory allocation in the non-obvious way that is difficult to parse fo=
r
> >> the user (printing over-allocation messages followed by the panic that=
 Xen
> >> could not allocate the requested amount of memory).
> >>
> >> While there, fix indentation from tabs to spaces for "memory" paramete=
r in
> >> booting.txt.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  docs/misc/arm/device-tree/booting.txt   | 4 ++--
> >>  docs/misc/xen-command-line.pandoc       | 5 +++--
> >>  xen/arch/arm/domain_build.c             | 6 ++++++
> >>  xen/common/device-tree/dom0less-build.c | 7 +++++++
> >>  4 files changed, 18 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/dev=
ice-tree/booting.txt
> >> index bcb06bc796bf..7dfac2062a37 100644
> >> --- a/docs/misc/arm/device-tree/booting.txt
> >> +++ b/docs/misc/arm/device-tree/booting.txt
> >> @@ -155,8 +155,8 @@ with the following properties:
> >> =20
> >>  - memory
> >> =20
> >> -	A 64-bit integer specifying the amount of kilobytes of RAM to
> >> -    allocate to the guest.
> >> +    A 64-bit integer specifying the amount of kilobytes of RAM to
> >> +    allocate to the guest. Must be a multiple of 4KB (the page size).
> >=20
> > nit: s/KB/KiB
> Is it? I don't think it matters at all seeing the number of occurrences i=
n the code.
>
> >=20
> > But page size isn't always 4KiB on all ports. PowerPC has 64KiB pages.
> > IMO, 4KB shouldn't be here or elsewhere in documentation.
> This is Arm doc and on Arm we only support 4KB at the moment. User should=
 not
> need to dig into the code to check what is the page size. It's better imo=
 to
> give this information right away and change in the future when we add sup=
port
> for 16 and 64KB pages on Arm.

This is already the only reference the other ports have for dom0less.
The document shouldn't be here since the movement of dom0less to common
code, but the side effect of it is that this no longer an arm-only referenc=
e.

I won't be annoying about moving the doc on this patch because that's a
separate matter, but not adding more easily avoidable debt seems
warranted.

>
> >=20
> >> =20
> >>  - cpus
> >> =20
> >> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command=
-line.pandoc
> >> index ea0e3368b1d6..d49db353d8a8 100644
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -1020,8 +1020,9 @@ and architecture-specific domain limits.
> >>  > `=3D <size>`
> >> =20
> >>  Set the amount of memory for the initial domain (dom0). It must be
> >> -greater than zero. This parameter is required (and only used) when th=
e initial
> >> -domain is not described in the Device-Tree.
> >> +greater than zero and a multiple of the page size (4KB). This paramet=
er is
> >> +required (and only used) when the initial domain is not described in =
the
> >> +Device-Tree.
> >=20
> > Same 4KB remark.
> Still Arm only section and see my reasoning above.
>
> >=20
> >> =20
> >>  ### dom0_mem (x86)
> >>  > `=3D List of ( min:<sz> | max:<sz> | <sz> )`
> >> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >> index 72d531618045..bc3d1ebad1c4 100644
> >> --- a/xen/arch/arm/domain_build.c
> >> +++ b/xen/arch/arm/domain_build.c
> >> @@ -1881,6 +1881,12 @@ static int __init construct_dom0(struct domain =
*d)
> >>          warning_add("PLEASE SPECIFY dom0_mem PARAMETER - USING 512M F=
OR NOW\n");
> >>          dom0_mem =3D MB(512);
> >>      }
> >> +    else if ( dom0_mem % PAGE_SIZE )
> >> +    {
> >> +        printk("%pd: specified dom0_mem (%"PRIu64"B) is not a multipl=
e of a page size\n",
> >> +               d, dom0_mem);
> >> +        return -EINVAL;
> >> +    }
> >=20
> > nit: XENLOG_WARNING?
> I can use XENLOG_ERR.
>
> >=20
> > Also, is this is meant to be self-healing? If so the return should just=
 be:
> >=20
> >     dom0_mem =3D round_pgdown(dom0_mem);
> >=20
> > and continue. And if it isn't meant to be self-healing, why not just pa=
nic()?
> 1. It should not be self-healing. On Arm and in DT subsystem in general w=
e chose
> to follow the contract to bail out on unsatisfied user requests rather th=
an
> silently adjusting them.
> 2. I think it's always better to propagate the error to the caller if pos=
sible.
> Sometimes you don't know where this function end up being used in the fut=
ure. In
> general if the function returns non-void I tend to leave the decision (he=
re
> panic will be executed anyway) to the caller. Printk explains why and the=
 panic
> follow. This also matches the existing paths nearby this code.

Fair enough.

>
> >=20
> >> =20
> >>      d->max_pages =3D dom0_mem >> PAGE_SHIFT;
> >> =20
> >> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/devi=
ce-tree/dom0less-build.c
> >> index fcbeb8adbd73..b3f24e5d555f 100644
> >> --- a/xen/common/device-tree/dom0less-build.c
> >> +++ b/xen/common/device-tree/dom0less-build.c
> >> @@ -789,6 +789,13 @@ static int __init construct_domU(struct kernel_in=
fo *kinfo,
> >>      }
> >>      kinfo->unassigned_mem =3D (paddr_t)mem * SZ_1K;
> >> =20
> >> +    if ( kinfo->unassigned_mem % PAGE_SIZE )
> >> +    {
> >> +        printk("%pd: specified \"memory\" (%"PRIu64"KB) is not a mult=
iple of a page size\n",
> >=20
> > Seeing how PowerPC has 64KiB it might be prudent to print PAGE_SIZE to
> > avoid surprises later.
> Yes, I can print page size here.
>
> >=20
> > Same remark about panic() vs self-healing (either is fine. It's this
> > middle ground that looks off).
> >=20
> >> +               d, mem);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >>      rc =3D domain_p2m_set_allocation(d, mem, node);
> >>      if ( rc !=3D 0 )
> >>          return rc;
> >=20
> > Cheers,
> > Alejandro
>
> ~Michal


