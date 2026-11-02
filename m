Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0A606A32D
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=KHTxBQgZ
Received: from list by lists.xenproject.org with outflank-mailman.1468244.1677338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsUT-0003s6-MZ; Mon, 02 Nov 2026 13:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468244.1677338; Mon, 02 Nov 2026 13:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsUT-0003rz-J0; Mon, 02 Nov 2026 13:54:25 +0000
Received: by outflank-mailman (input) for mailman id 1468244;
 Mon, 02 Nov 2026 13:54:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNsUS-0003rt-5V
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:54:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsUR-00H1cq-Ac
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:54:23 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8960c-2eae-0a2a0a5409dd-0a2a4503b800-2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:54:23 +0100
Received: from [40.93.196.49]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8960d-fae8-0a2a45030019-285dc431ac38-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:54:22 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6106.namprd03.prod.outlook.com (2603:10b6:408:11b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:54:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:54:19 +0000
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
 b=gWb3PcCGU3QEzCJW1zvaC1bj0r0EC4y2+diPcO44vYXhQTIVnazHxf9/WZCs+AiW+U4E7jeQdCS0OLwBPJNVtIkiy6KT/IS7/A5pxUcdHtH0fejUX3Zvf7cL7Y8a/WJrWFZFP1LJtqsUmn0nfrZ7zwRHdXM4hmVR2o1XMS4R1cK+C5+Sa+c2rx3h5mF0DUeWgDf2u6lBFK7kXxcfCdaeG65F5rpUdc1oDalwNZdtwV4u/7f6h+yL9TVt9mapSJxF74+9wu5yopPqzpcDuxk5g2VsmWjpqs37oyiO77zXKxGHpQtegIk2c2Ax/Fm0dkacdnAG0LFjUYWJ0NivDBFYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1rpYZ1UPcWyNKWyjXudOxlq658O+Fnrr2AjKxE5WfQ=;
 b=kNvmUDGwhKs+6EQxuwexgDTZsZ5ZDFYm4+dUN07L8HtZr7sD1tJiPf9NoyT0JeEKeHBqf3Kiiu2E15qSGuZNJD0d6JIQPeWSJHIR5IyEI2l17zfseaXZoW9ntzZvbKymxfeEwWKyS0xeZsFPgGEyxBVwWGEG9LqDeXdqFhiuWCGHajelLaVcsIh8JzpNRfMSJQl5GdH71MSubTQ5m7cLoJTHgtbeXOX9uWCotmyMO3GLCJ5OW6kmex4rH+YIj+a/lqS+TjHDVzcSTSgd6xsfmi4YF6/yYmb4SQmQ3BCQnMzy+w3QKxXqfiT4/xeYRB27GXtkMt9kjUuZrnxj50L2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1rpYZ1UPcWyNKWyjXudOxlq658O+Fnrr2AjKxE5WfQ=;
 b=KHTxBQgZzwkX862dW7Cy8RlOrI1O5jEUYouENdY2TFK8AddyflDmQDJ188GfZaYt9q44xw0o9cAgXftjanazsBYCjguP+UAqfvWbyXfj+r9Pi9FmxbEfRvNKPIzQMxYJcVBLrZVWpNHQpwbIzRMx1/l1BV3ogvjpV93E23hy3Os=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0c81f171-7ffc-4a59-8f9e-69ad27371b96@citrix.com>
Date: Mon, 2 Nov 2026 13:54:16 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: a50d207d-7fae-43a5-3bef-08df38e8caba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006|5023799004|11063799006|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	0AO5P/jYuXEq3TFLsdQR8Rn3P8wchzQbSkYOrymbkvSCOfMZ9LEAQy8ZsL8hXOHI5+8PzfX1y0M5CzVfD/BNsaRt7M/aFkFZ6UcXypGsW6GztGcZTPxU0LxPwhAZ7f3ygK+qPUn/46+ZEyHTSoMy23++iZLZS5elomzxLAuSoDFJ74Q/Vo4QZk6Vls6t1JTsLYOz7TIQcvGHV5QY8JZyDe5SRyBintCfrhNRvNidXDbj/Q7rBHhVgGp1pI+ABJxiabI71xSbfUoMtuavglStQnm1pLs47kNDmWIjaJ1yREEphb3yJ8NHCuN/rNx9wNeu5f3FhGcliNCM0lxP8rSHGDM7LJd9SCoViXvqVOWhNhDdHDn/m3fupxH3ahn2SM/YHj/oL478M/MZkHK0K2iBMDxnMV8KaanVFv5um4/mQ/ysQXPHn0qCtxNRn9KgCZVn1kky9TgxlNiCa+82I0OHoTVSyaIvasKcIUZ0TZTliq+7KxXngKaOREtXmJHkAgc6TEiHySr6ICkjOFo/QuHOmxhEmeBGy2FiiTAkZG88GybUSQ6F+z/1AIQNswkPdxRxGJHweaTJigGTj0PwS44FiYo1tY/ggk0h3RwXvAqXOryXDiAR0Bg+JWERhUQswEvwehQP4UFonvFtmO8tgPpcT5JMZIiTfwG56jWPcrhzKc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDJPTFNLTlpraWJNQ2lRZ05XOGVyUjc5TUtuNnRtdWs1VENVOFp5emRlbzBP?=
 =?utf-8?B?M1VPYU9SM2p1QlpGTEorNDBxN2hBelFxdS9aa1dzeFlQT3F3UmVraVhwazQx?=
 =?utf-8?B?V2YyOGxjR0dBQW1iYUV3SFBaZkZWNmI1cldIK2tsbXI1UWthR1lmWmlPSXN4?=
 =?utf-8?B?TjFhVktkRUVwQ25mVWh5OGcybXBQMGF5OFlBVVVEdVJvZ2JkL2NGUWxqaDl6?=
 =?utf-8?B?NW81VnlwZW1xR0tUWHR2aS9RaGIrZGxtSGZ3NXV2ZllTUytJK0ZBeUlHRXdx?=
 =?utf-8?B?Rm5UenEvU24ycXN5NXl5by9HWFB4TnViOUZXa2hiVWxQRUo5Y1JlTnVDQlRi?=
 =?utf-8?B?OHpEM1lzVjNjaGhYd3BiQytHQjJKR29SMGdlS3VVU0p5RTNCZCtyYVM5QVpI?=
 =?utf-8?B?TDcySHNRbHFrOGQ0Sm5kQmFQREIvaVdWNlp6Wk1PcWQwNk81RnI5TlVMOTBK?=
 =?utf-8?B?VVVxMnhCRGs3blpHVjRyRzQwcXJoTkVSUU9zTGVhcGRwTy9nWWRjT1lZNktN?=
 =?utf-8?B?SzAvaldNNHNrSGphWnl4cVA1UnphQzl4cUt5RXJ4blkzRHR0dmg1cFJMTzlt?=
 =?utf-8?B?UVJZWlViOHJ1YmVFd2dmTFJ0Rm9DbDZJVHBteFlWQnFiVTdTUWJiVEIvcW5D?=
 =?utf-8?B?U0dJUmV4T3Q5SmNmd3RwZU9oYWZiYkd6VEJ4SmkwWXZsbnZBdEg3S3phNmNE?=
 =?utf-8?B?U3g2aWV0MFpuMkpoZ216VlV0L3BiZXgzVkpQb3lZSjVpSDR3WmpMZkpwcVFO?=
 =?utf-8?B?STVnbGd4d3RCVFBCQy81YTN3dmIzWGVjcDdxbjFJVjFVa2lrZGdHSUVKSjFY?=
 =?utf-8?B?bkp4dWVVdW9pVmZ3ZEFFTDJtY3lhTi83Y04xRnJna1VqV0haemo1S3JmNDVt?=
 =?utf-8?B?TFJYNDYyVS8yOFd3OXdxM2RZUVg0ZllETjYwcENlVXJWcUtLY3ZFRlRJb2FI?=
 =?utf-8?B?eXBxYXB3NDRyb0kvamdPNEdDOFQ2UnZrZTJTdHZQWG5RcDFaMTAvRXRQVlZk?=
 =?utf-8?B?L3NCeThOejdoaVpYMzRRblk2c1YvS2JpSHVyL0VaNS93RlVRaTg4NEpqZlhK?=
 =?utf-8?B?TkN4elRaaGxuVlRpU3FFZXZhMmc5aHJHc0V4UWRFM0FRcHZCcmRzaEFkdjIy?=
 =?utf-8?B?ZVRMSSsyMnpmSitMcngyaGlPQnB4ZENSZjFwWVQ2VEltRkVRVnhCRW9xQVdY?=
 =?utf-8?B?NmdLNURUMHlaelQzQ2IzTjR2cWQrT1RkNFF4eHY1THhRdXlPQ3FtMU1NQWhh?=
 =?utf-8?B?SXEwY3plOTRHYmNCc2g5NGZDdXFpc0ZiaWR0U3BMeW5oZ3FaTVoxS2RqVXps?=
 =?utf-8?B?RERvQWFvbmdLZnc5ZHMwSnZmNjQ2NklXOXJQMmhQeXVXSHRFVlFkNG8xaFlX?=
 =?utf-8?B?SkVQdHFobTZjWDlaeWNJTXdISjdlOUg2alVQN3Vkd3hnZGwrMzhMNC9OUEVE?=
 =?utf-8?B?ZG1TTTRrbnUzMGxPa0svSDVSS21kKyt5alBFSVNhTlFDYkxUbDYrOFF6WnMy?=
 =?utf-8?B?eGRXcDk2WHoycHluNnM0UDdKVjVlUGZLdnJhQkNMcUJpZ0dkdHBad2s4dEJL?=
 =?utf-8?B?UVJaK215YTJ2amRhRDB3M2xheEF4YmdlRWZjK3VMYnlwVXpldGZrSlNQbGVa?=
 =?utf-8?B?OHg1WnlXRUxOdlN2V2JhS1hrN2M4RW4vcWtBYW9WMjQ5OUZWeEpSc25KaUUx?=
 =?utf-8?B?OTk4d29Eeis3VFMzRGZNWU5UQmNlRnkxem1BT3F5QVpnTlR5ZnlOQk5zYTZN?=
 =?utf-8?B?YXVFQjJXWXBiVzVXK2Q2MzZ2T3dUZ1VkNUtvV2xkQTUvblRHMmlEWEtHMHJN?=
 =?utf-8?B?bHFybjMvNG5DcVhXMGc5MzNheExiUTZ3QmM1dUN1ck5jTllPOVBIdjQyMXFN?=
 =?utf-8?B?SkZTU20rL1RxOUxQM05MSURFVVJCcWFtZmtiNkdkaUk0QTdQTkhxVlNnSDVI?=
 =?utf-8?B?a0V3OGh0WHM5S2l5U3J4cDJOcFhJWHFOMHg2bHJERTZHUkxIRTRnREZLZHVt?=
 =?utf-8?B?c001OXJrakVUWnAram5teWswK3lJMEk2Uk9PWGUzMm1zZFJyVDl4WXhqMzNR?=
 =?utf-8?B?eVJKbllzbmxmUFF5SzR1Y2xTTmVCbjRmZUsyeFhmVW1oV21EQ0Rva3A3ckNh?=
 =?utf-8?B?UlNxTExVNjNjVFRGZWxNVGhleWM3WUxMSzJEK3YyRmdPcTVGUVN0MFpNcEs5?=
 =?utf-8?B?V3hUa05OT2lYZXJ6akRnbHpycVIvMjNHYXRpTUk3U0gxQWE4N0p0dVJKL3Rq?=
 =?utf-8?B?d2VLcUhXQkRSY0VNdkYzMitsZlJKT0V3MnhWck5zQjhVeElVZGlSTkdxeFNB?=
 =?utf-8?B?V1FKZVF5Q2VrMTdSUEFWMnVyeG9mY0dtellua0FlY3lDY2JqaGM1Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50d207d-7fae-43a5-3bef-08df38e8caba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:54:19.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipeiw2g9OXiEvgB4qVKrGCNHezR+sinYldFGGC6b+Cq6asF+hgnADU70ObzGXhr9PrLHwyTtK/g8DqNzfFKSWAZ7/J3aNfeZMUaNVk9zLXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6106
X-purgate-ID: tlsNG-33051d/1793627663-76AF94E9-4CB56117/10/78276251493
X-purgate-type: spam
X-purgate-size: 1604
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 1:46 pm, Andrew Cooper wrote:
> Despite prior information to the contrary, APM Vol2 revision 3.46 October 2026
> has been adjusted to state that the vNMI fields in vINTR are covered by the
> TPR cleanbit.
>
> Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_vintr()
> rather than writing into the VMCB directly.
>
> In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.  Move
> the reading of vmcb_get_general1_intercepts() to the point at which it is
> used; tt does not need reading on the case that vNMIs are enabled.
>
> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Jason Andryuk <jason.andryuk@amd.com>

I forgot the extra comment.  This bug is hidden by:

    /* The exit may have updated the TPR: reflect this in the hardware
vtpr */
    intr = vmcb_get_vintr(vmcb);
    intr.fields.tpr =
        (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
    vmcb_set_vintr(vmcb, intr);
}

at the very end of the vmexit handler which unconditionally writes vINTR
and hits the cleanbit.

This is an absurd codepath.  SVM has virtualised CR8 since the very
beginning, and put in CR8_LEGACY for Windows to use even in 32bit mode,
so the only path modifying TPR is a non-accelerated write to APIC_TPR. 
 That path can be updated to modify vINTR, and this logic dropped.

~Andrew

