Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921560A260B
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xh2jM6Cw
Received: from list by lists.xenproject.org with outflank-mailman.1496057.1694684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTzaI-0007EW-PQ; Thu, 19 Nov 2026 10:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496057.1694684; Thu, 19 Nov 2026 10:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTzaI-0007EP-Mn; Thu, 19 Nov 2026 10:41:42 +0000
Received: by outflank-mailman (input) for mailman id 1496057;
 Thu, 19 Nov 2026 10:41:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTzaH-0007EI-HK
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 10:41:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTzaG-000DQR-2E
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:41:40 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afed25c-bab6-0a2a0a5309dd-0a2a450ac0b4-32
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:41:39 +0100
Received: from [52.101.193.60]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afed262-f2d2-0a2a450a0019-3465c13c3a43-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:41:39 +0100
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 10:41:34 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 10:41:34 +0000
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
 b=X1xgKdWe3gdIgwV8BaFWJzKH8H11BB8NYaveafvIF86nEjH08X/20B8/pd8GQ8WE/6XZ5iD65X2+aEhgcmNfGbmYPIcZJRdcofYLVHCcumCoAAIwFYUP6r50kdO7HNXH+8GB5AkN4U4/+Yy7Y3KVIYe5F0UL+dMLZAkvm3eWvkq5FKLuBfg68nvOj+XYUg3YTRnUuKzpQHwyoKSxMx0+5AOwaHqrx1WE3J7DDkC0OugYgVVIm4nJ+2VOqHMBwRMuWmDib4SspU1vqNMUzWeqUyfDtD4XqbCsqWuZBFtnphN5tXsdlxVmOYP6okWXywWhygeX+QdcAZo0dwfkC1tnvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm6Oh4v6DG+YiGSIhcmyzAjH3yLMzspRb48laXpxcdA=;
 b=eIvY4FsZ3yN4cEEEs1RkMvvTZZClfUs4X+LTGfvKVrw0vZeegxMB4X8Yx8GqaWuTiB3PswWtaFDSbWv08oa07hBu08CzUM70ywi+k+xJsSWn+OqT4HuHbqFjMRa4CzIRF2L6uIoXuKzxdSn7KFoVBW/7cU0KlHgzyHg+qLY6wH4jRecAlNpLYFUorki6cjxVDgqxqE7V4fG57Y/ARHtU7+UmE9nBMOLhUKknKQu9+gc/0BVft9l3CoH/J0BkHOS5QMI/OnuOZu2ZtIJ66P5V2CQoSA/jy4U6D6ELU59ijDjnCWiKb0L99t3Rr/RNNy9PiVYn8iMfKwrKPlbj+UbEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm6Oh4v6DG+YiGSIhcmyzAjH3yLMzspRb48laXpxcdA=;
 b=xh2jM6CwagXgTLRVYmduLeoN/eNFz27HITdqGCHL64d3/xJDTe37XGRhbK0fGx/lNI+M7zpKzEXgQan1wz6e0cdmmAfusrFS7AIa6ZUWGAGjEB/KJq31pJ/j76U2IYRQsRIWx68vUqChqsKgUWBoWB7v6oUUKOgJviH5k8AJB94=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 11:41:30 +0100
Message-Id: <DMZ4HIDEKZHW.2CAS68YCFHBZ0@amd.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, "Teddy Astie" <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/5] x86/amd: Make cpu_has_amd_erratum() non-variadic
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
 <20261118171758.1125066-5-alejandro.garciavallejo@amd.com>
 <6fd2fff3-d470-430e-a567-3f06b88ac79c@citrix.com>
In-Reply-To: <6fd2fff3-d470-430e-a567-3f06b88ac79c@citrix.com>
X-ClientProxiedBy: MR1P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::21) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ccc2ff-decd-4fea-76d8-08df4629ae71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|5023799004|261026140227099003|4143699003|11063799006|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261026121527099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	p3GWblqQSlMLXtZ2D4evOwA52C3YJFo6DYCdMS12K5LhuAl5hPVFgMJKFkKyoVSirtx6CTUgKVJ3S+AM07PmgDk1vhwJenT/dNd69tqq3on5fGkfrqsz+o6tJbF2xe4aPt7H2S+efWnStg6568SXdjiBsxQ6xpZQtCQLg6inK+FV3kw06LjruR1DtwinI6f27EaoM1iyUpmAPmCjbNcnaF8pb+o34q8T4Dsidn12Xp/MpSmvs8j59fBJPuslFYfeLAvv57Qrahyyts5K4BoYJrVTND11iFvduhCrFzTVT+m6342LPgt1t7r10H9LmVgVe1FezVfpYhBWWWSITkjWuGLMn3L9/jYAjky2KKTWAsCVJ5ta/+W06Iupnekq7WRxukGB2YRb8fnY+ln5GkvadtJhfDEDDEMUm2UQn5Tib6cU38bu3dc3fbM2Dn6B+zZL4nXFi4UhkjyY9yLT6aQGO3E4iaLR9zORBPH2K3f70EDlR4y4biT5da8lEgNw9wDDDct4c0bhGC4l98MtIrzZrLeink3HnP6PvALnDTm8msTTtTSp9P3ngw6MtwdIbJ/1KO+9qYFwtkVoBfDk2F6aMf/Dz2b8neaJLaDvfGM1tZ7o+xRZGdKwTZ8fb9hOjpIa6DVNG1DRWwefw2kSQCpoRDaJmEbP7Uq/Q9Z7mZBRKl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(5023799004)(261026140227099003)(4143699003)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTl4eXlhWWdpQVBFVk4zL0hYNFk3NFdFaThIVUN0MDdwdHRvTTRnaGZNKzQ3?=
 =?utf-8?B?czBTbm9DbkxwTG1VWjMwWmp5UDYzV1F4dkZTMDhGUk5vdVZINUh1bVhab3Ro?=
 =?utf-8?B?YzFOTVNsZEV1ck5oTktwLytGSEp1OE9neVp5dnIxMVRmNlRUQk1ReWJEZTc5?=
 =?utf-8?B?NlFMcjErZ2VvK1FUUHZlbDJzYklXTmhNN3hFYjBmQjc1Nkp1TkRWeDZqTHFp?=
 =?utf-8?B?VE90YXl6K2Q0ZmJXUDN6WXMwQ1ptK1RURHVUL1RsYkNLNkI1Y1k1bmpvdnhU?=
 =?utf-8?B?SVhDaE14VHY3dElxb0dhWWRKdXRhYkp2aDlyWTFuejNML3FsMWoxc1NPRnNQ?=
 =?utf-8?B?dWd2RmU5WHJXcmNTK2RnSFVlZ2ROM1N0VDdDQm9NdW5HMUJ5Y2YzdzRsQWZj?=
 =?utf-8?B?cjNySWtycXFzVTJodDJHdW5pSGszRVpYOHdtMVJ2UGkwQUZtTWM5a0lFdWVJ?=
 =?utf-8?B?L256OTBTNG1od28rTDR5RE5qNzBrSVU3UE5VYXcydVdRSGpCTjBIUkRRejBL?=
 =?utf-8?B?aldSakhGVVhad2t5RHNUamZqN3p0Y1o1WDdxeXBuTFg5a2NGbjdZanFSMy81?=
 =?utf-8?B?Q29tUVZQazZYQ1RqVzc3YzVzMzdYUUdKWnBYL0NZMC9qQlFYMFFoVkI4bEhR?=
 =?utf-8?B?OUFCMkR3cVZ4emlaTzIxaktERlJEQy9ucGhKMHB1UlpXbGR6aUF4cWQ0N0I3?=
 =?utf-8?B?aHI4OXdpa2FudGdsL0VUZjh0SkNBaG5PbFhuNE1ubzA1NG93OWJaRWZiWlVl?=
 =?utf-8?B?eEJwTThjVVAvMWszUng0N0x6U2drZFFqcnYvNkRockptVnhHYnh0VytOVndD?=
 =?utf-8?B?a3VnNnVSR1J0SzlldG5VdS9YNmpxcnc3OUV2amxZVm84RkNJYndrWDJZYnlU?=
 =?utf-8?B?ZTdmWkpXY3dvRExhaWVmT1lkdm13RVlXTjd0TXNJbUNKbzIrZlRkSXRKdjU1?=
 =?utf-8?B?Y0twNmlTSklTekxBUytzQnlxWWJKVk5kc2t6ajhIRERTOG9TWG5WNWdNTWVW?=
 =?utf-8?B?U0UvanBVQ3Z4SHNKNmY2Wi83ZFBoTVY3dVNqTERJSUV4cW13cmJyYmxPQytr?=
 =?utf-8?B?cy9Pb2lQZWtoQkZBQTlZdzhMWkMyMXdrYzFYV1BlOWMzbm5rU0t1bDRiLzFI?=
 =?utf-8?B?VGNISE0rYUJ2bG1BRnFydTRjK0NNUlYrTmdiK3JOckNuZFpScjVhQzJaZXF3?=
 =?utf-8?B?d1dlckFBSFRtWVg4bGJsT1BtOW1PYXRoOVpMYzNBTG82OS9NaXdKV3p3R2lV?=
 =?utf-8?B?RlhnTTJwc2RqUXh1S2V6YTgyaWYvNDduZllXZzlyUk8yQXQzeVZRQXpwbVoy?=
 =?utf-8?B?dzlsTGpOTDhtUjFpdzFudnRIUnR6UlZ1YTdFM1o4UGg4SU14aklDWlBHSVNl?=
 =?utf-8?B?RDdST1QwT1EwNUl5alJ2WWhBZEFQZDdSU3BMNmoxMXloUGdPSk9XVEl0T0VO?=
 =?utf-8?B?VGd0YVFURXVjUnV2SWdQUlBGbU5RQW1NU2I0VWFVMitjTGNCZVpMalpkNlBx?=
 =?utf-8?B?MCt6UDZKbWFod1JRSzhnK2p5VktoZ0txR2ZVcC9tcFpqYkJjRkRaS2lBWlp5?=
 =?utf-8?B?cHliVk9HWXNoSWlVWHZoMTBBU2YyYTUwNWFxRnFHa05aczJkQ1poRnIrZTBy?=
 =?utf-8?B?S2JjWTJ3Y2RpZHgwV3ZLQWFMbnN6Y3FPUzNGTzBsZ0QrdWJyYnprRWphdDgz?=
 =?utf-8?B?REFnNWZMbjVFcHB2NnROSzFPOTcxeEQ0cWF6b2VFMlZPNlNFUnVqRktpS0k5?=
 =?utf-8?B?M1dGT1BJbW9UVm53OFI3R1lNaGNLTEdMT2twTGZ6OW9DMHBGYm5QWlVlc0FB?=
 =?utf-8?B?cmFNSkQ0S1FBZkxrd2dEbmxTc2ZkT2dBbnduOUc1dXR0Vk0wcW1yQUlIL1Ux?=
 =?utf-8?B?TGV3Z1pRcVdXUXZSelRGU2ZaOGJQNjZtNFB0ZnlIY1dpVXFNZmNnNnBaSGVB?=
 =?utf-8?B?QUhvV1BFTTRtalp1Kzg4NUZFZVVwQ2I0Mi9iSVNCZzBrRzZydVNaNFVvMExY?=
 =?utf-8?B?OVZ2VG5aSXJtNStTTU9WZkVWWjcweG5PcWUwaTBDSjg1MUhiZndlRTF0Y0lB?=
 =?utf-8?B?dC9oOHZraU16dG90VkhSYWZKbDJPNFQyM2JtTXl3ZTBlU2JsOEZxdHlyR2dm?=
 =?utf-8?B?U3BpMjZpeUo4K1ByQ01NYXRHUnlvem9UYlZoRXB1NDMvaFd0eEg2UFlVY0Z4?=
 =?utf-8?B?WWNmaG1DR2ZRWDY1WXRXdmxYZ2Fpdzl2QjBOU0NjUDJ1bkgveDBUZHlyNFhV?=
 =?utf-8?B?dmpnSHlGSFdSZ1Bwb0xaZjV6Q0FPekVYQzJiNFZ5b2NlWkZEZC9zUFdMTExB?=
 =?utf-8?Q?r+mvIgLYydcb10mq5d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ccc2ff-decd-4fea-76d8-08df4629ae71
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:41:34.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB3BLMaH9alqlXErt9MyaEVXPAaNuRS6EdU+W+vXw9R9vIYuoyk855mR3Z7P1cMelE+OLTSEwTzSAOCPjb6ECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
X-purgate-ID: tlsNG-4011c0/1795084899-506CECFC-81AC814B/0/0
X-purgate-type: clean
X-purgate-size: 6502
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Nov 18, 2026 at 8:06 PM CET, Andrew Cooper wrote:
> On 18/11/2026 5:17 pm, Alejandro Vallejo wrote:
> > cpu_has_amd_erratum() takes the OSVW id and the family-model-stepping
> > ranges of an erratum as variadic arguments, which MISRA C Rule 17.1
> > forbids.
> >
> > Have AMD_LEGACY_ERRATUM() and AMD_OSVW_ERRATUM() expand to a
> > zero-terminated array instead, and have cpu_has_amd_erratum() walk it.
> > Callers pass the AMD_ERRATUM_* macros, so they are unaffected.
> >
> > No functional change.
> >
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> > ---
> >  xen/arch/x86/cpu/amd.c         | 14 ++++++--------
> >  xen/arch/x86/include/asm/amd.h | 11 +++++++----
> >  2 files changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > index fbbba0005c..5e22fff81c 100644
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -321,10 +321,10 @@ void amd_set_cpuid_user_dis(bool enable)
> >   * Check for the presence of an AMD erratum. Arguments are defined in =
amd.h=20
> >   * for each known erratum. Return 1 if erratum is found.
> >   */
> > -int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ..=
.)
> > +int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, const int *erra=
tum)
> >  {
> > -	va_list ap;
> > -	u32 range;
> > +	int osvw_id =3D erratum[0];
> > +	const int *p;
> >  	u32 ms;
> >  =09
> >  	if (cpu->vendor !=3D X86_VENDOR_AMD)
> > @@ -346,19 +346,17 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 =
*cpu, int osvw_id, ...)
> >  	}
> > =20
> >  	/* OSVW unavailable or ID unknown, match family-model-stepping range =
*/
> > -	va_start(ap, osvw_id);
> > -
> >  	ms =3D (cpu->model << 4) | cpu->stepping;
> > -	while ((range =3D va_arg(ap, int))) {
> > +	for (p =3D &erratum[1]; *p; p++) {
> > +		u32 range =3D *p;
> > +
> >  		if ((cpu->family =3D=3D AMD_MODEL_RANGE_FAMILY(range)) &&
> >  		    (ms >=3D AMD_MODEL_RANGE_START(range)) &&
> >  		    (ms <=3D AMD_MODEL_RANGE_END(range))) {
> > -			va_end(ap);
> >  			return 1;
> >  		}
> >  	}
> > =20
> > -	va_end(ap);
> >  	return 0;
> >  }
> > =20
> > diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/=
amd.h
> > index d21df0741a..d897943210 100644
> > --- a/xen/arch/x86/include/asm/amd.h
> > +++ b/xen/arch/x86/include/asm/amd.h
> > @@ -12,7 +12,8 @@
> >   * Errata are defined using the AMD_LEGACY_ERRATUM() or AMD_OSVW_ERRAT=
UM()
> >   * macros. The latter is intended for newer errata that have an OSVW i=
d
> >   * assigned, which it takes as first argument. Both take a variable nu=
mber
> > - * of family-specific model-stepping ranges created by AMD_MODEL_RANGE=
().
> > + * of family-specific model-stepping ranges created by AMD_MODEL_RANGE=
(),
> > + * and yield a zero-terminated array to pass to cpu_has_amd_erratum().
> >   *
> >   * Example 1:
> >   * #define AMD_ERRATUM_319                                            =
  \
> > @@ -26,8 +27,10 @@
> >   *  =20
> >   */
> > =20
> > -#define AMD_LEGACY_ERRATUM(...)         -1 /* legacy */, __VA_ARGS__, =
0
> > -#define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
> > +#define AMD_LEGACY_ERRATUM(...) \
> > +    ((const int[]){ -1 /* legacy */, __VA_ARGS__, 0 })
> > +#define AMD_OSVW_ERRATUM(osvw_id, ...) \
> > +    ((const int[]){ osvw_id, __VA_ARGS__, 0 })
> >  #define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)            =
  \
> >      (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
> >       ((m_end) << 4) | (s_end))
> > @@ -72,7 +75,7 @@
> >  #define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
> > =20
> >  struct cpuinfo_x86;
> > -int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ..=
.);
> > +int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, const int *erra=
tum);
> > =20
> >  extern int8_t opt_allow_unsafe;
> > =20
>
> This whole infrastructure is garbage.=C2=A0 I believe Linux dropped it a =
long
> time back.

I agree. I can only describe it as an overcomplicated mess.

>
> If you see, we only ever encode LEGACY errata with it, meaning the
> osvw_id is always -1, meaning the OSVW MSR accesses is
> cpu_has_amd_erratum() are truly unreachable even in safety builds.

errata 383 (out of context) matches on OSVW before attempting the
fam/model match.

>
> Next, have you seen what a disaster of code generation this actually
> causes at callers?=C2=A0 It's an anonymous array on the stack, which mean=
s
> it's (re)initialised every time it's called.=C2=A0 One of these is even i=
n
> domain_create().

Not to say any of this is GOOD. But it is very definitely not worse.
A variadic function is... pretty much that. They are largely equivalent.

Debug builds are slightly bigger with the anonymous arrays due to
optimisation quirks, but release builds are slightly smaller (See
bloat-o-meter):

add/remove: 0/0 grow/shrink: 4/2 up/down: 61/-113 (-52)
Function                                     old     new   delta
svm_asid_init                                 39      60     +21
init_amd                                    2419    2435     +16
arch_domain_create                          1043    1059     +16
_svm_cpu_up                                  444     452      +8
x86emul_fpu                                 7369    7321     -48
cpu_has_amd_erratum                          260     195     -65
Total: Before=3D3607126, After=3D3607074, chg -0.00%

>
> OSVW was a short-sighted and now abandoned idea of AMDs.=C2=A0 There are
> something like 4(?) bits defined, but there's no index of what they are
> so you have to search all the revision guides to find them.
>
> Could I at least talk you into dropping the osvw_id part?=C2=A0 Xen does
> nothing with OSVW at all, and if we ever feel the need to gain some use,
> it will not be like this.
>
> But, if you were to see about moving the arrays out to being static
> objects too, I think the result would be a whole lot less unpalatable.

I don't mind refactoring this mess a bit more. I may try removing the
arrays altogether and integrating them into the function itself.

Note cpu_has_amd_erratum() does perform the OSVW lookup for errata 383.
Did you _really_ mean to drop that? It's not immediately obvious to me
whether the fam/models listed cover everything OSVW does.

Cheers,
Alejandro

