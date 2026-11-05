Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D8606A32D
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=IEckR1BV
Received: from list by lists.xenproject.org with outflank-mailman.1474110.1681313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsNh-0003Z7-Ax; Thu, 05 Nov 2026 07:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474110.1681313; Thu, 05 Nov 2026 07:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsNh-0003Z0-8B; Thu, 05 Nov 2026 07:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1474110;
 Thu, 05 Nov 2026 07:59:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xOsNf-0003XX-S7
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 07:59:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsNe-008l2e-SI
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:59:30 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6aec375c-bab6-0a2a0a5309dd-0a2a4502e546-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 08:59:30 +0100
Received: from [52.101.52.22]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6aec3761-6ca4-0a2a45020019-34653416a66f-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 08:59:30 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SN7PR03MB7183.namprd03.prod.outlook.com (2603:10b6:806:2e5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 07:59:27 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 07:59:26 +0000
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
 b=w5PwtNzueYgA3+8iTqhn8wRls1LOCKMd5YE+7Wr+rgRQGslWfbmgSPvbVyoOe1N13VwmUVmZ9a1xizJwNs8Y5JoAlkafkhVOVwioR2HMRTuTunUR7J9t3FokfCwWxZdVPkCn0//NcX9k1fdbvz9bWshqL8jctjb1agZVriAz3oJYFj6q4SE1gXSFSGc+OXhGWapeL8i+CDBFkHLXO0Z0/Vw1RtN7xLreuxqW3m0a0cNnieHaS8ZQ5FHZn10VGzW+La9VHTxFpHeSLarTb/5CiLbuntwcrpvtFyb6A5KzdZcwIr85yEyRMXSxLuaHIQdIfMNq0v3GUtZwT5OH/8FWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW80s8L8CvcHBg2AaqGBVnt0IpXL7pjGySKAFcXDAzw=;
 b=KDv95UVJNepnEV82JaBSD9F5PDI/UB44xwZNlaydLhCNgANfq16SCU905ZNCT14IcFKWuufyND0KnoBpQp/XVZS6Naej0FDQbPyUHwBQBoIwlHnclMwY8PIRDVzuBmxQeQTL0MysI5tdPrJ2dvNGoXUpJAi58/9MkyH0HtOjCuOehUumTjLCeqSJHvkPXcbXquiRzL/cYxjA4ptnHyJP/hOhJvscYEHL6Bw4kdIQ0emRKUHzqbDZtWj7p6s6W+YHOlAFVKzhjln48rh05Z3U1lOISmMamrjSUm1uKlhm/nriSuI+2g1D+xMkedQhln8b67A4PO8CzrnU73i3W+/8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW80s8L8CvcHBg2AaqGBVnt0IpXL7pjGySKAFcXDAzw=;
 b=IEckR1BVBS7w0nfU0koXR4HGKu1kF0NRVfshJU21yW6SwOIlgCAKnzvbH4eNeStpwPfY7Py7kZ8oQ3p0uWkQKSRdsoNroJ5nd2TedoCkHbPapmUJGRKkd9iPTuVw/hbWceHUqfLVoGVn22opaFOKaOSdYchrfGI7OTQJVgBt+yc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: abdelkareem.abdelsaamad@citrix.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Thu,  5 Nov 2026 15:59:15 +0800
Message-ID: <20261105075915.1016497-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <93437f7cd832790b61c520332cbfa432c75ad8fb.1793723920.git.abdelkareem.abdelsaamad@citrix.com>
References: <93437f7cd832790b61c520332cbfa432c75ad8fb.1793723920.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::14) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SN7PR03MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: b65a17ec-835c-4731-7787-08df3b12b5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006|261021123027099003|261026121527099003|10067099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	CvFVKKEH7ZuqKGsm12ArNx8x3qw4wmlU7Ka+BbWL6mCCl6qAnpwOYfueEwvak/AZk8rXgXkDHsYxi9NrdTAzvakqee/jXQb8ptUrcuwvtB7CuLU1Z1kWqtogiivvgk33GvMxYSP0DZQmAgiHEJP3n96orATmbNv7FxHGiiYbRRz3rflhE5QSR2xSjWTK1C47ZYlrhRLfArRo7oOYxi/KSn28KrirfRxINvNdTfjonPAZ/4gxYa3gc2CoU01OTXAcHY6oUUfCAAfSZuCTH6C52rmWqINHw5FakZUgNk5EyoCGGOsUj7BRwCTEFK+qysXGfm4GugaEYZs6XPKhFsGP7nP0QPcUXYTX93iY3nK4NsXq49B0Ez1OuZt6mk/Io96m9Z7jKH/NoJUqgKnlDouY8W9M7Xq0kNNnJ6xMnzuQPtUnoR3gJw9FD7QvbB8xeylzSXnpD0L1+j9qNez1K7PyNOL5hpZk1uPYfCisxBTcmOujW+qrzEKJbq38YWa/1yiVnLI217FqBkniEB4mqy5BxUJlbs/LVRiahR9RtbBHyWhvha+SuGu2MPfq4RbAFmdYYTDFkLzfDGYVmoujzY1pfWkzAaAp5gh6xgQy8Oo0ysNmj336yAR42CkS6Q+5eNz1+U6Hr4LksQK5qhejp2t+QidSn6mgyWxFpw8kUlxKxEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261026121527099003)(10067099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVQzMEJ6VkJqbTRRWXRzRklhOEwzWjBGK2czVk9VanNWcFpXWFRZcThjcXRO?=
 =?utf-8?B?RTVhT2lOdEJCWWJ0Qks2UGlISXpWUUFQUzNac1loZGJqVXppSG5SSURSYlgr?=
 =?utf-8?B?SmN6R3N0ajBCellvSjA3akJLKzlKQTYrOTAwRGtrTWl4bWk2NW01R3pEZHBo?=
 =?utf-8?B?L0t1Nnh2MWJHTHpMQ1o3N294WEtOZWhqZlVaT2I1N0tZUWIrZThEY2FUQ1d2?=
 =?utf-8?B?dFAxcDA1bW1CTDhZd21CQm9SL2NZdkpsT3RacVBCK05WWkVSdFdCRVhVeXky?=
 =?utf-8?B?bmlPREVGbHlqY3ZRenN0SFVjL2NkMnJyN2dSdHo5UWw3K0UrcFJRdk5tZnVZ?=
 =?utf-8?B?OEFCSU04ZHVrV0l2dkZhbmNOcW5Nd1ZUZzBqUUVHVms3VG0yenJSWmVJYUJw?=
 =?utf-8?B?SXErSWtBYkwvZ0JDWllnRlRxRUhhbVc2TXEvaktZbnpUY1dTSDBDcXJzMFlV?=
 =?utf-8?B?VUdVWit3eWNrYkhnWlpMd2tTVUlSUzJjS08yRE1tTWg5RCtEaDd3WVVCdUh3?=
 =?utf-8?B?bzdaWE94ZStNd29JZU91dHpLanhvQTdTNkx1U0dkMWtESmJBUTR0ZFdKYVlF?=
 =?utf-8?B?QVdoWXpTQmZ3SFFobDhNSW1OQXQ1VGZQRUFJY0ovV3dtVCs5WTdmbXMyZEkw?=
 =?utf-8?B?d0FlZkpBekpkZ25wODdWV3BiUWNidUVjWVEzZVJ5ZjFiQjIzS05QODZ6NFV4?=
 =?utf-8?B?VzVHdUxjeXVkdFRId1hCbmpaMjRzaXZaREpiR0NlUWl1SWQ0VHN2Rk4rQlFI?=
 =?utf-8?B?bThMWSswMXBtU1Zmdm0rQTl1YjFaUFUvQi9TSHJOakFuLysreWdFNmRiejFv?=
 =?utf-8?B?c3BlS2VtajQvQURFa3FISEd0dTFRc2E4SDBMRXp0MkVKeDlGVnIrWlMyMytL?=
 =?utf-8?B?bTM0Y25JTi9lOURaM3d5dlZUMjh3NjlmR0c3QTl4QUlIb3oyamdFbHJmQ3ZF?=
 =?utf-8?B?NU1VRHlZb081NFpnc201NVBCbXRaSGhIL01iYzhSQnliblB1TFRvemZtKzhu?=
 =?utf-8?B?R1lzVDk3V01hd0QxUE5nc1BlMVJMUzkxM05mRG9lRHlheEJHWSt1dXFOZHkw?=
 =?utf-8?B?alVpTmkwSnYrTzNRTFpGOGxHZUlLSFlxNkZFSmNNTXIxYmQyRTJlL3Vma3VO?=
 =?utf-8?B?Vi94TFlqUGE3Rk1uSXpKSnVIRXdOTTQ5c0xGUHF6Rm5OWW9rdm52cHlCdkc0?=
 =?utf-8?B?dEZKRDdkQWRQdldHaVN1MDNDSDNRV2tOYXEwYmVCZlcrZUpEN1MxcGhoUlJx?=
 =?utf-8?B?bVYxMkhTRWc5ZUNEa2J4WEpjWElJcU84RXJsc0ZlcTZqSTZJWWFNUE10eUh4?=
 =?utf-8?B?WWlmN1RsVDBOcHlNeGFLRWx3WSs0UE5zZ1Jxam1LQmRtRlpCRE8ydmFnRlF3?=
 =?utf-8?B?MThucXpXNnY5NVY5YkVxanZtTnl1TXhVVGI2S25WVGdzUVJ0M3hjMzN2OGli?=
 =?utf-8?B?UU1pbi9nZ2M0NUxnK2poSE90akFuNlR4d0hkNktLdWNTOTMvS3lQRG91YWdl?=
 =?utf-8?B?UC9Fck1mbmlTeGRvTFg4NHRiNXZ5ZFAxWjFWMFNEdlNVODlBNjFBd0orUGNS?=
 =?utf-8?B?dnVDb2FNbGVhN3ZUZG1lREMwbGxqWjhWWmd0anozN0htNVcra21NWVkxS0lT?=
 =?utf-8?B?K1NJK3Y3cFArKzF5RVZReDE5R2hlVGRPdGRKYkx0OFc0OVYrUXNaU2JBRUFD?=
 =?utf-8?B?bHY0cm5JdkgzanRVQ1cwUXBBTkRNVW15UDRpVkFGMDU1amYvckN5amNEUkZB?=
 =?utf-8?B?bUt1Y1pvd2FhdEh0cWNlSmMxcEFHZjREU2lFaHRsMkJDeVRSOWVvNnJFMklC?=
 =?utf-8?B?ZitnYnR5OXdFbGw2RDJWUFhwdmJaU0ZEejhaTnBUajlsTjFDbit4Snl0SUVw?=
 =?utf-8?B?ZjkxVkhNWVhQRFVzRWdWcXkwTThacHlWdnRDWlorOTh3Z0dLY3RsVDhRVXdD?=
 =?utf-8?B?R2NBdXQ3REI3VVdueVhMNVMycmRhUmdyRTFWV2RNc2RQUlBSazFtWFlPdkNT?=
 =?utf-8?B?MXl5QzdGZWZiRmtwWjNsTncvVUxqb2NXL3VONkpIbDNQZlZoNFhheG91SUx2?=
 =?utf-8?B?KzRBZ1M2T1FFM1ZySFZPTDR2Ym5rZFcvRWZrTDRudlp0emFFMXZvNXlacmFm?=
 =?utf-8?B?bnZFb2QvWFhZNStEeDY5ZTJRZGw3bVJPdnpxYVBlMUdYSnZUcVd2RHo4M245?=
 =?utf-8?B?aDZMUDhOT3pwd1ZwNWVCWG80bzNyS0htSy80bVZGNlkzR2IrVTVjdURWQjFj?=
 =?utf-8?B?Z2JjZ3VmZnpZbkplS05RQWIxRGVvYjNjTzQvbnYyanVhdUtmZlpGaVVhQjhP?=
 =?utf-8?B?cFhxY214amhzR3VJdmhOQ0I1VE90bkFmcGFFMHpqT1F2QnMzemdyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65a17ec-835c-4731-7787-08df3b12b5cf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 07:59:25.8819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0aH74uNSVlMOfx3q2hxl9VRm1DlVMzknrOAySmKIcm6jSRiZNhVBNYE0AKCN0WGKl9/GHzH8gZueMLGjWhXHIhymXJwDsUxJ6tFuwZqDjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7183
X-purgate-ID: tlsNG-720697/1793865570-F3EBB2AC-EDFB3B01/0/0
X-purgate-type: clean
X-purgate-size: 1473
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 16:59, Abdelkareem Abdelsaamad wrote:
> When nesting SVM, if the L1 hypervisor has not requested a virtual interrupt
> (VINTR) intercept for L2, Xen should not force one.

I agree with the change itself, but I think the description needs
reworking.

The real bug is that Xen's interrupt window is the VINTR intercept plus a
dummy V_IRQ, both set in n1vmcb, but only the intercept is merged into
n2vmcb.  The V_IRQ in n2vmcb is L1's own interrupt for L2.  So the
intercept fires on L1's V_IRQ, and the host VMEXIT_VINTR handler clears
it as if it were Xen's dummy.  L1's interrupt for L2 is lost, and L1 is
told V_IRQ=0 as if L2 had taken it.

> Furthermore, handling this forced VMEXIT_VINTR can cause a pending L1 virtual
> interrupt to be incorrectly delivered to L2. This occurs because when the
> intercept is determined to be requested solely by the host
> (returning NESTEDHVM_VMEXIT_HOST), svm_vmexit_handler does not switch to the
> correct VMCB context before evaluating the interrupt injection.

I don't think this paragraph is accurate.  Staying in L2's context is
correct: L1 didn't ask for this exit, so L2 should simply keep running
on n2vmcb.  Switching to L1 here would be an emulated #VMEXIT that L1
never requested.  Also, svm_vmexit_handler() doesn't evaluate injection;
svm_intr_assist() does, on the way back in.

With the description reworked:
Reviewed-by: Stephen Cheng <stephen.cheng@citrix.com>

Stephen

