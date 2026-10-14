Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C2CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:20:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448794.1664816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGx1x-0006Cb-Oa; Wed, 14 Oct 2026 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448794.1664816; Wed, 14 Oct 2026 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGx1x-0006CU-Ku; Wed, 14 Oct 2026 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 1448794;
 Wed, 14 Oct 2026 11:20:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1xGx1w-0006CO-Cf
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:20:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGx1v-004Ik5-Eb
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:20:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6acf656e-e002-0a2a0a5209dd-0a2a450aa8fe-20
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:20:18 +0200
Received: from [148.163.151.68] (helo=mx0a-002c1b01.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6acf6571-f2d2-0a2a450a0019-94a397448c2c-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:20:18 +0200
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69E8TiRw2946660; Wed, 14 Oct 2026 04:20:07 -0700
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11021093.outbound.protection.outlook.com [52.101.52.93])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 4h9nyc2u6a-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2026 04:20:07 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by SA2PR02MB7595.namprd02.prod.outlook.com (2603:10b6:806:146::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 11:20:05 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 11:20:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint20171006 header.d=nutanix.com header.i="@nutanix.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector1 header.d=nutanix.com header.i="@nutanix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint20171006; bh=9G1oHx++AsRUyAnm9JfLfQ3ACBQlv8s0MfhoGIffC
	3I=; b=zb/BUoh05e9ygC/7GzDqbl5kAgq8HeBcE8wCtMBrWfGHE35lMGGD3s1UR
	ZAWbUdtx5tfatyUC8FcDAoR/PtOpzHcmAWMRKwt6pWunSLSsJrN2rUCjIfsk3QiZ
	6tMLwAJh1dn2ldLdl5B4XkKJ2U3ZMukCO32e0vRudey/jf9uQalXb4j2kvsF+uUw
	PnQ8ibY4o1gmtD6uhnI0ug7HhZYsH8G4LjKvxY4vJphfIMFvaWO/3wzhPNTzNSOt
	sC5FTfRxvC1HIcH25NVpPhEBO8/pDvyfeUyzQG8ctNKxCABFr/6WcVKjNEN4Ks9y
	VloKhERrvGqinv7hjMNvBMfzl3N4w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZjwySkG4ekKFxP0NB5Fe5kWNZhtApcSOWAfrdJhtHa200xR5khrZu3SV0pP8Bv2YkRb3cmVd42ttqkvMJgoQYWTfVoiX5gBLGj7j3etdljgSmqFtYHC4IxvqJ2iKgcbJhaxktb41IDzjCuoQhSScL8HxCn+XIAoxG3U4odageQIFTeZXSBRGr8D3ik0Lf3T/uP6RZ7lK39aBOYWmzSm176SLOlM6AY91mufbOFn4dA+ZjmyfgLrow5pq5Q9tdvx5uXuV4HaXeEoZvcT7KzCZu5enFJC77VHoVUY82+YeSaEKSy0lOr95ARLGTETKQVhRmdaUNQ/zqZBO/gGoGlFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G1oHx++AsRUyAnm9JfLfQ3ACBQlv8s0MfhoGIffC3I=;
 b=eaKGIOSR9acKQ5J7s8jZrPoz2T8VZafyMQx3r/MKJivUx3xQpUcACQpKCaVrRd8M5/OaO0s3o9C5u2gdfSSvoqWSyg3oa0LHGfUduOnYv7A+1N9Ss2Ym36kQFKYruNWjIxI8lhVMQjzM0qpGk/LafnAiGRt5hYstDMwqwagVk/i8sDFLrnjbkRIkZ7yi2IZ0NQ8pwbd6gOMP/8pS0DTBw8wOhquUcX45TkFMU2ZZ3RuYVae/3S4wO0yL2KZ4JZbVJXWU7JQ6DDtODqbyjlsYl0vRr0jS2VQAfH8Lzo3Oxs9Upumi/2b0oqgR6Fa9PxVglqswAIw46amUGoR+0de5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G1oHx++AsRUyAnm9JfLfQ3ACBQlv8s0MfhoGIffC3I=;
 b=qQox8pQOhlPDCFwQEvaZErWcycU+EW5b6FskV4ne3IpfqLabVNfDdbLmsXsXUAsWjTzcfOK95ECKddHP6YVcNQOe0/V0D2B/Tr2J1AaVHdoLIX0Ir3y+4gtoPsYaGDWoxg/l9WQoN5DbwlK8f4iZ79PX5NCVyxcMGDszekCD3og+IePswcQPoVxDoC0odaMSJY5dGuDouyffYQhfPDBqQMa/Fz6Z+4XTqVuEwhezA3NO4gbw5h7NbArJ1T1PCvpqUClvzmKuYzSWbv9QW1B7K8Hnp7/cv3QNTEcLQtDHZlaoznZbRInr+7gvblZG5+gK8R73tXDQr2p9liEpdU+pzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nutanix.com;
Message-ID: <0148737f-834a-4e7a-8e7f-7fff2ffaa90b@nutanix.com>
Date: Wed, 14 Oct 2026 12:20:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] i8259.c: properly cascade secondary i8259 from
 primary i8259
To: Peter Maydell <peter.maydell@linaro.org>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
 <20260916104435.600211-15-mark.caveayland@nutanix.com>
 <CAFEAcA_fv66MxW4QKHjUypSwTZL=LK6YVLgNvoMH83ivn=EMbQ@mail.gmail.com>
Content-Language: en-US
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
In-Reply-To: <CAFEAcA_fv66MxW4QKHjUypSwTZL=LK6YVLgNvoMH83ivn=EMbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|SA2PR02MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f45a804-5eb5-4351-4433-08df29e5190a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1zr7SWps9KcmcjfGaLxsS8ayPjihytxRXsR2MJ8tvK6flcepdTAoM4fAX1N/i+PvbSyEwuSE4X0SxncEIXOO8zNQsZ4MSWCOK+Jjib2Tx2GVLFBj7Vg9dx676FLlk1NRpPUZeHsURO+2OmL6bv7dCP86NVU0MRXOEsTOeFdg0C0Qhpo+eICq1YfZT75CsO1Zguac7hH8s+GnzzMPaRhROErUS9mfoFDgJe//kO5CwmLI9rdU5+zsKPpteJOZtWUBwHtG0AFwZY6ZmO8W7EJLEI/wHT1FgCwAMK8o5tC+K0cuHQCW5krRsNfjrCA+wDEFKsLh6cxDFbbnI+FpHtajIWkSFdsrjLikeX7OOXvMSRAhJrdJAIOodBMoMXEiZH7sW7YCu/Gh00Hv+tVbVJr7YCI8fVv/lC+kRz9NseDsax1ZIEq0puz5YTuXJOpH0xWG7VlJeYlmyxFWyUDqiD8MwKcZOHsFgG0qQC2yr5bHQsz4ruCU7nllCY2eXgDvJRXNqZV1q2sqLno3lmesLHVwGk6p5CtQcfrtOtE/aAhXp3A5AjG+Hhf/esKltHBjmh8ehDxY/UHKwU3PKjy9sLxJcRfwwm42WpdUteAqu3uOftMEIDWZVB7jWy4DetoQxGlb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE42U0RIdGorQytaNktDOVp6VVhyNXAvdG12NFVxUFVwUzJBTjdLU1dhRDJZ?=
 =?utf-8?B?Vnp5eUFvZnQ2MjlBckI1aDlnNnJkNVlKYXNBK3l1Rmh1RlFLMXFsWngzcHhM?=
 =?utf-8?B?YWtBRnR5enhuTlRlb1cvQlZuc1BFdmZhTng2YkFvZjJQbWpOQWVJdkhZS3Bh?=
 =?utf-8?B?Vy9MYjFxSUxvOHRlSWVHN3hCQlI0d3lLK0xwNnprelE4YXVKTE9tQm1ON3o3?=
 =?utf-8?B?WGtScFUwOTljY0NQdTZ5TTcwcE5ZeldXbWNVcWY2QUtUMHVtMU5uWW9YNjM4?=
 =?utf-8?B?bjRCdG5DR3BkWE56RnRxTXg3RS81UWg0R0pMeUxyOFpiQnA2TndXQ3ExNW1P?=
 =?utf-8?B?K3Bvc3RkcmJZVHhYODBWR3JjWWI3NmlGR0ZzU2JqZTluNEkxbGFmOEpuVGQw?=
 =?utf-8?B?L2x0WjA3eTdwYUp2VWZYTkNzTi9hN1hCWjN3STk3Z2tKd3JTYVVSU0JQQXJw?=
 =?utf-8?B?alY5Wk5UWk4wbzlLMjRrc1JRSlhHS2EzalREajZYWGVyZk9SUHFaVGRHV2JG?=
 =?utf-8?B?L0JqeStncjUyNFlyMTJ5QXN5S29zUlA1ZlZydjVsWHRTS1BFa2Z6YkhjeHlr?=
 =?utf-8?B?ZXBRNkI1MlpuMDg2VnZzdk5sWFJQSjduN21VZnUwZXd4dytsMHB1WXo0VFRv?=
 =?utf-8?B?bEVKeEp1TjVvTkRoeWdnMklVaUZpcll0cnYzRTE1MVBxVkcxWDU2dkkwUHdr?=
 =?utf-8?B?UllMcG1mam1rRHJpbmRzOFZKYURaWkxPeDZpYWhaWk9KQUZzTEl2RjVFcE1q?=
 =?utf-8?B?K1psUEpZR0plcW41ajJxUzU3LzR3MFdxSmZuTDVWSWd1eW4ybVRmcCtXR3oy?=
 =?utf-8?B?cVFVSWFnY3BwQWNndWVRZTduWXliQmJsK3drblZxV3NMc2w3N1hURmRWNGpS?=
 =?utf-8?B?UVV4QkJ2OGNYM015OFNQaTRQZ0hxNk1TR2pBZk5zOTBiUFg2RDR5Ti83bWVO?=
 =?utf-8?B?S01XQysxbGt5RGxaYzhOdHNPd0FsVWU0SHp4OVRCV2RtWG5jSlJmeVhYbTk4?=
 =?utf-8?B?UGxBNE04UlhjQ2VGUGpscUYrMERPcVlhYk9zZnVBcUw1SkZHQjFESGZHb0dG?=
 =?utf-8?B?WkN6dnU5VGdEWnpyNlVxZkdkajBrL0F0UWhUMVZBWWVhN2FCb0lUWlY4R2Vh?=
 =?utf-8?B?bDZBRnFONHQwK0xZS0ltV041YjdvQitjdncybmxHUFhxcVBqd1hrbnZDOFdm?=
 =?utf-8?B?L3hUbGVsdkVVUlFoYnRWdGpmVitVVFZDbSs3QXYyMUpxNU9lMEJ5ekhEMEV0?=
 =?utf-8?B?K2k0d1BKVEZYMFdlUXVYVWU1eHVnYVhXVDhLT2ZFeHdpdWllVWltWkM3bkhQ?=
 =?utf-8?B?WEdkcnhhUVhhUjV1NXdRTEdYSUNpdDNIVEZuZ3R2NW1NNjUzYjdsUEd0dmNK?=
 =?utf-8?B?b295bEt3NGttbHlOQkdYWmVkeXdpUjAwZFJ5Qzc0dCticERtcmNUWVcrRTRD?=
 =?utf-8?B?V0tCcitRaFd2b0JTcFo0bUR1Ly9pVk5UK0JCZWNLbk45bVNwUzdYNzNnbjFl?=
 =?utf-8?B?REp5S21mOFdSNjRSVS9HVVVUR01VRiswQkhjeTI1cGlKMm1wZ0VYRjNjL3hL?=
 =?utf-8?B?aTJPWlhZN2FEbnkwSFFJcXhxSnBXTGd3eGEvaHBEaGVJeW1mamVVc0cvZXda?=
 =?utf-8?B?Mk96UW9xT2NvT3RmTDVHV2hXZWQ4M1dKVEs2czJkS3lIS3VEdWk4RktjVEt6?=
 =?utf-8?B?SWZyREthb0lqM0lyeFJveHRQdUJaZG1kRUduNDFhTHlWZElRL1I2NEdkRXdM?=
 =?utf-8?B?Qjd4a0dNaGx2RHZOempIYTA3VzBrT0pvMmxybmswTVI4TnVpWkdjd3FQbHJw?=
 =?utf-8?B?TUJZRk9QVktkYWdZR1RTQlBtNWRVQ0wxNW9BNDMvNnpXL0daT1NQTFRVMFhQ?=
 =?utf-8?B?eE5MVUwxYytKZWJvSzc0KzEvZmNhN0NOcFFFWUMzUzFpTUh0UGNZNmVWT2Y1?=
 =?utf-8?B?bFNldUxkUnZRZmg2cjkyMXZzenBKNGRWeUFKbzNXa080Rjhrb1RIdGY5Y0lq?=
 =?utf-8?B?NmRqaElEWUIwNnhja1Zna1kydStHUWNTNTBIWHdKMGR4ZGlMcFpid3FDV2xn?=
 =?utf-8?B?d250UVc5MHpCUUJ0ZU5YYlQvU0ppalpkK1Q1M2NHL1dwTlA0ZlZDd1ZOZGZa?=
 =?utf-8?B?L0U5eFdLRXZmTm9CejY5TmQvSE5KVGNMK3ZqbW93WHRybVhYeVMzTDZ5SXFl?=
 =?utf-8?B?blhyeTZuSjM4MUIzdWxOV1E0bVFmQ1E2alJhOXoraXZTT0lEMjRHK0NZektr?=
 =?utf-8?B?d09DVno4UjRWalNmWVhpQkVmVHNicWlwdUJQNGNIclJoRGYzRWg3M3Q3T3pt?=
 =?utf-8?B?SnVubEhhODVRMHZ2YjNrcUxySzdjL0FhV0tqNUVQM3hISW9WNW9ZVmxlUXJS?=
 =?utf-8?Q?Mp+6quXXDrOIjNE8=3D?=
X-Exchange-RoutingPolicyChecked:
	twpkzLsb8MeZ+0gi84GmlT5z94lG9wku9yR9b4B55b4MxPGRFMkG/XBm16oOQ/28TmtOgE5fVaOlkLc1BWavIfHHnekklGgGYi3fipwZfSXktxMNUvY5Tv5o6FDShh2Trr1MIvwpmi4Mhk02p5aLxtiXmCdxGftnOzmbJtJKJRuREhKanvfr+j6038K6GOPBaNWWv50IfeB8PSMn83W1nI12IrvKbtauPfs1+YCVtUExPoPJasn8ALvgVHptq/kUh6Vw9/3pZQ0o54Hhjjv0iE/VT4utcWCTe7BMFj/Fnmhpk25/aNPK1Lw6scQxy6DoBM8TePk9x2YhzKDpaXFcBA==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f45a804-5eb5-4351-4433-08df29e5190a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:20:05.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh3CFQeXIOHHupXpgV3g4KhEVchaDUuGDdksrI1k0jndx4VR1DQNpVFOvrGTvyMyH2efEmc/O2wloi6PFtDruesFk+EUYSTPbK9WVkgwA8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7595
X-Proofpoint-ORIG-GUID: ewlGalHfs7RKopyvwJPNgPQ5G3j585PM
X-Proofpoint-GUID: ewlGalHfs7RKopyvwJPNgPQ5G3j585PM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX0G37NHKgZiow
 De1K1D8e7+N2HJGC9Ql/DCLWhubFLXS9ETEduv8x2fM39wiOQzSwH10S1DK9mPgPz/QvlW1RgH+
 zBkoyoxQOO94IwilxNW8XMg1UlPi9KqNaK/+3LtTphwnn1UOYYjcOFdutZeLzvZ5q/OhxMgGFfC
 5stONwVn1FE6L017WZDqZw4XhKL7sDmHSjqaplv2uKnJHxlaYuLVqQPKeIDHfgVOe27oFhpC0kx
 o1lfldh30Y3rHvsUa4nzyc7KlsibrptiIuQYJJxHWPD7nekxSjd82EBM++vfVOyCluAKx53+k/M
 5iED0yy5Gg6bFtu8j1eOaQrtrGrQBLIqbGV8CuaDcFIfmN5XuQffwKX3TNrzu0SFoduvx9ZtjYl
 LLs/ScyFyamRuytY796wjHSx4vIUwRvucGXVxyrrH5bN/Nletiwba4ybs1jNaHSvaEF3I+YirQu
 5uJQpMymm/DKjm+nEkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX23W66UiiWhn0
 LrFXSxPnTV2lf1kNWocZflV22RooMkCQakm1AW2uuhwolK4C8tYJHl9bdKyRALO3mRrCcRIkw6Y
 vEFqy/pv+F6lO2zrL3zAAcJT9Ia97Kw=
X-Authority-Analysis: v=2.4 cv=Uq/2pOwB c=1 sm=1 tr=0 ts=6acf6567 cx=c_pps
 a=0scnO40TN6uu9waSdQKTQg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=_-M8LpHI31CeLmyZm6wg:22
 a=H7MLjYanAAAA:8 a=64Cc0HZtAAAA:8 a=_J14Gd7pdz6F-6QAQxIA:9 a=QEXdDO2ut3YA:10
 a=bgSlMGY6Cwri7Y-TTqhu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-4011c0/1791976818-510C9CFC-BC8DBDED/0/0
X-purgate-type: clean
X-purgate-size: 1650

On 13/10/2026 17:18, Peter Maydell wrote:

> On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
> <mark.caveayland@nutanix.com> wrote:
>>
>> Currently the cascaded output from the secondary i8259 is returned directly in
>> the pass_irqs[] array, instead of being connected to the relevant input of the
>> primary i8259.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
>> ---
>>   hw/intc/i8259.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>> index fcc94e12f8..964ceb04b2 100644
>> --- a/hw/intc/i8259.c
>> +++ b/hw/intc/i8259.c
>> @@ -501,7 +501,8 @@ static void i8259_pic_realize(DeviceState *dev, Error **errp)
>>       }
>>
>>       /* Wire up secondary cascade */
>> -    qdev_connect_gpio_out(sec_dev, 0, s->pass_irqs[2]);
>> +    qdev_connect_gpio_out(sec_dev, 0,
>> +                          qdev_get_gpio_in(pri_dev, 2));
> 
> We just added this line in the previous patch, so we might as well
> squash this change into the previous one I think.
The reason for having this in a separate commit is because it is 
technically a behaviour change. Before this commit, an interrupt from 
the secondary PIC would *always* raise the passed interrupt, whereas on 
real hardware it is possible to disable interrupts from the secondary 
PIC by masking the relevant input on the primary PIC [1].

Since real hardware works this way then I would argue that this is 
fixing an existing bug, but I thought it was worth having as a separate 
commit just to be sure.


ATB,

Mark.

[1] https://wiki.osdev.org/8259_PIC#Masking

