Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3B3606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=V6tnqmA2
Received: from list by lists.xenproject.org with outflank-mailman.1497634.1695830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUEaz-0000XI-4h; Fri, 20 Nov 2026 02:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497634.1695830; Fri, 20 Nov 2026 02:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUEaz-0000XB-23; Fri, 20 Nov 2026 02:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1497634;
 Fri, 20 Nov 2026 02:43:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xUEax-0000X5-Cd
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 02:43:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUEaw-008vYa-E5
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 03:43:22 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6affb383-8faa-0a2a0a5109dd-0a2a450bd332-36
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 03:43:22 +0100
Received: from [40.93.194.59]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6affb3c8-b7e8-0a2a450b0019-285dc23bd128-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 03:43:22 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SJ0PR03MB989405.namprd03.prod.outlook.com (2603:10b6:a03:405::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 02:43:17 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 02:43:17 +0000
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
 b=wBSipkgRUEh9yn0yv9+HTz0q5DapTBH1hU7ZNnLogt84f+roqVtW8LQjqEiRs6nwHHqgN/BoTcO1Cek5IQIkfnXYhRMvxqsQojSGFNNTCMyt5LS90pdWmFU7Zo9CqVbMlYgM5luP/Fuq46jVcqzE0xEWmIMIw4ey8tQczRC38A25K/jfwC9TSBZvJb2krJAuJe5vLz0NEQiyD88i5xa1Z64vINZ+CxDyAgTMzY+wS8G67abQ2jfk9Xvj5Rb7qhAleVUeBGR0K5YeZKkpZw3WZQ888qPO2IpbCxCVPoi7mD3CwDIe5pyhaR2W9yS9QDRFZ1UHy46z06WLXWnkos/auQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBDl0q3mw7xDuXmiKpWdCtEE+JPTQbdHG1C3HMj9Ahk=;
 b=Xp21/9GfccLHt2H62LVTS2nLLkpUe0/iTj+LI5pyUL6iYczIjgCAwtaFecxWiC31ki0bw78zzK9lAIAWC+fCUEWpk0HXYd5EJiGEL/uDbQ9S3PXejoVhl3NiYdGSW7aPoP6XrlkkdXNLVwrP6n8frdEU2ifZCAvzo0T/hEA9Y147ATTJTrhilJE0gGFzI3KYrfKgTd4WuU8IFRBA7jGm/cKaI4jOTWsFJxGfnMTvGUHYGu5X5APGM+9Xig0+10yvjlE8RloZp0w2038tsAWJ7hr6RncQt8NH0/lbOYNCHAFW+3+vQJmICJroSiyJdYEr0FqgRNNvD1dJF1IJgm1Pew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBDl0q3mw7xDuXmiKpWdCtEE+JPTQbdHG1C3HMj9Ahk=;
 b=V6tnqmA2xXPLc47TP8L4U5XKkVMzqGv5o61pxt4U0i7jmNFagCK08bws1KR4X4niQ8spmNSAmta4HPRUDU/0Q9fxy+HsIPA7SMoPOr71dVegIxKgewDrh6JDQI+c8WiWop8zYegD09+fFSGDf3hBDYILKoZV64Dc5r8azF2CyzI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: abdelkareem.abdelsaamad@citrix.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	stephen.cheng@citrix.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Fri, 20 Nov 2026 10:43:06 +0800
Message-ID: <20261120024306.139976-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2881c5131f6689a01564ea5a2d6fb7884477313e.1795088176.git.abdelkareem.abdelsaamad@citrix.com>
References: <2881c5131f6689a01564ea5a2d6fb7884477313e.1795088176.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0047.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:28::19) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SJ0PR03MB989405:EE_
X-MS-Office365-Filtering-Correlation-Id: 197a642a-c816-406f-c86a-08df46b0081a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vu1+j+Q79PNkfNigfMLBhz1MUYM56PeTcbaAa/1d082eptGcSpJJvqV9nbFAvibI11kVvWE/4D8gVpnxlU6JnoZc076qTlWLBhYh4Qbti6vGKAEnJlME3GX1vEJSvvVmbGRYGK7UEf8KsgqYdDg/gELCr553x17Z2StrEHGRsJqs4Zz+zoI9GkUtr/GV9s29Sh+eXNzTqu8JnPgAPve1LDW9LvvFgGZHOYyYsmIGtDzzVc1Jd+rzwTcLAXM2TdyjXhNQKSO29YyCe6MFQObKQtNgkLvrTYBdz5LSXgC/R+vFmhNjieDUe9NJltLAmoGxW1PsLvS0Butd4GO1jh6uK7f7z8tDd60EsgDCBW/rWLxzvsUMVKhG79+92UQbo3PDIock7MiFOEUwdl0NnCXk+Jr25HKuESs+JvIU7vXNlHL4MoLk0MJOs0U1i0tKjU1wamBt1itp9haooYNR4QizenwAfvmZwh/dJNSMuM9O6P3ak8RtMXWE/Vcb/qfqYFanQHOVPKP9wOrJ9G+y3Kz4/Zoes8zzy1uiPXFPFaHzg+rHu9VQ6Kac+HZ69OGYcWfa7f1ZOyTPXnzUQx6nOFb+/mt2dwgN4f1DIcYFtzE7YgLnXFRfIQGE7JCdy7ogw20kjls2dXLOlRoNNogIaKzjjpcdaLvVr1RxC2uSOktBe2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkdhZSt1dHIzbXdMczdUbzJJK2RkNTQ2aXNSNGg0OEMraDJRUzFrMkxDNHlt?=
 =?utf-8?B?T0t6eU4wcUYzUmptWmV3QnJWSmR6N1JvK3VYMUFLc2VocWgyQkpiZjIzaENv?=
 =?utf-8?B?bTAxempQQVRBVFM3ZW9KUWpJblRISFFvbU9waDd3Rm5zWEExcHhGTEZOZVNP?=
 =?utf-8?B?NG1pQmd3aUdvR1RnWlpJR0pqRFE2V1g4MGVWeVlUUGpPbjUrT2NMbXRVeXZl?=
 =?utf-8?B?Ync3aG81WEt3UVUvT09jZ2hWelNnbGE2UWd3c1UxOXZOVEJoVWxrZXNHZFBD?=
 =?utf-8?B?ODFQbjFjTVk5RExzTlk3cVhUdDZwaVdXNUF5aEs2dTJZYXNNMG1QVC9ibnBV?=
 =?utf-8?B?VUdFZ3dDazRPa3kzS3IvbHIzWktmZzFpdFBIWWFTaG9xZUUvZkRWOGVESklJ?=
 =?utf-8?B?ZVYyQUZpQ1BaSVl3My9QcHNGQnRob0hLbDlFWVJDNzhzcVlTdU45elphYVJx?=
 =?utf-8?B?STFuUGpHRkpNbXpqWGtRNXVidEdGQUdxYWVhMlB0dk42SHVwejRNMk41U0di?=
 =?utf-8?B?Z2RncnEwWmtVRFIvRmVpbS9JQURqc3BBSDduTkwrMDRueHQvTi9IUjF5cTBW?=
 =?utf-8?B?MitMSXltQmRiM3JSWHNuSlN0ZHQ5emlJQmlydVhiNzdTR2daL2ljdkI2V01H?=
 =?utf-8?B?WTRUNXVWMXpvUmREeXhud2M5TGFnSzFNOUFIZWtWN1ovaWV5OVpJWGMwWUk4?=
 =?utf-8?B?OVlGMmxQSTN1TktLMHk2YWtpSGMxanZIdHh0WXB5bUUyR3JZdTNPZkdNUzh2?=
 =?utf-8?B?RzE5alZEb0p6LzJ0dE43VDZhN0ZqWjVwTU5DTVl2SWxRaGlJWEFreHhYayto?=
 =?utf-8?B?cHZCNWxnc0RzTVdEaE01eFJqRFFVaEpGVFM1eGExblNMVjdhY2VBUGlIZzNY?=
 =?utf-8?B?b01xY21ldnhiNzFNYnlCWG1GYVZyai96djhLZkF6ZWdaMWxPbVdjTUJGakl5?=
 =?utf-8?B?eVR6ZnZMYk1HWjF5YmUrL0Z1MjRMNlBtYkJxdW1LTThKaERqRUZQaExFZGV6?=
 =?utf-8?B?U05FYkwyalFESkZtc2QraG1Ccm4zUkZNcGFDVllRM29KalRqZWZhbXYxdSt6?=
 =?utf-8?B?ODNUVVpRUVJWZWkzM2cvV1dhZHNoejlqZ2c2U1RyaUN5N1Q2N1pQd0diNWhL?=
 =?utf-8?B?ajBnaHkrZ1M3VHpHeWFGbzhnZnQ5cjBOMHROS1B4bUNGQjh0eUN5cHBncDd6?=
 =?utf-8?B?aDNva1J4YlJCZ2V1WTduU1lWWDdkZ0tHdkVkTVVwR2lrTjN1STNUS0VNdU91?=
 =?utf-8?B?eE9Cbk9US1NXN21ucEhZa0VSLy9KNWhhVFlNWUVkbmQ1eFVlaC80OGlqS2xr?=
 =?utf-8?B?UWlNMFY1U3V2cXFTRVFJbXEyN2Rpa0xaVWVaRVFIM2VROTkra0VOU3Q0ZTl2?=
 =?utf-8?B?bXYwVGRsTWpQRWphSzNTeXVJTDc0aWJCMXEreFpUY1FqOVBGU3Vqb1JxUjdo?=
 =?utf-8?B?dXJXeTFYZUEwdWExbDdzOEhVdldVYXQ5b2JjNkVNVDFaS2JzWW5KeTQzTmNx?=
 =?utf-8?B?Q1ZzVXU3V2hqYXQ1WVY3aXdENVI4em5Id0NZNWdseW5INU9ucitiMlJWL0lE?=
 =?utf-8?B?aTlhV0tpNjN4K1dUUlJDelE2bXNmQUxYNnpVVUxiR0hXbmdUY0FHRFFncS8z?=
 =?utf-8?B?Y1J3NG9OdXVuTEpGNVV4OHJ4dXVvYjRtOS9UZ2RaRWg4UnNXdE9xLzdFR01Q?=
 =?utf-8?B?WTVEVk01ZjFrVFdUQmJsUUlRV2krSlJ0aC9RYmZ3a0NEUHdMNFltNEdTaG9F?=
 =?utf-8?B?M0x0Y3ZPVmIya0UySjBsQmw0cGppVFVBbzcxT1gwckh6NzIvaGFRcXdIWDgv?=
 =?utf-8?B?aFBkczU0eWJmb25FTEFKL1c3Mzl4d2kvZ2c0ME4rUWxhM3FJeGhjQWRiZFVZ?=
 =?utf-8?B?d09GY1h4R2F5Nk9TZ1VLUXlxeHRtVjhwbk5rTG9idjZkTE9QaWZ2dW5HSlFT?=
 =?utf-8?B?OHhiaklZaEd4RU9LdWJ0R242aWdBdzlBVkJhT000Um4wclVvVjU3SjBHZTBx?=
 =?utf-8?B?b0IxUHhLZUtid05sbThKRGdUTkl1K050dDhMU2ZrL1JJT0ZRRWo4Vjg0TUUv?=
 =?utf-8?B?WFBmN1JsNDU1MktQUVdNaHRtNlp0cHVvN2I2Vjl3TzZkUEtIYnNQTi9CRTM1?=
 =?utf-8?B?ajk4eUdjcW5tbHF0K1lzRnVFQkMydE8wVFRuMzdmOGFRS1Mrdkdwb2ptTWRD?=
 =?utf-8?B?cWpVamhlNGQyTWdZbVVISGkyWkNFVVNtVksrbCtpUVFCdGVjcFMwTjBhTnJ2?=
 =?utf-8?B?b2VFMmxETzFpUm9lNUlsV2VIdDBHWExEbXNvejRxR1RkcG5UUkV0V2V3dGow?=
 =?utf-8?B?UkxpSnpzOG5rZEJyMmYzNlgvSS9SeUVDcEFmMk10dEIvSGtiSVlqQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197a642a-c816-406f-c86a-08df46b0081a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 02:43:17.6316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk6GaoUCRzY1x5xx1dWkqnwBP5MpEhCXzy8OEsIIh1qyRzQ7CfFofiFC4pN1Phx28LUBFBtkT3vk3c3mTKufPfkV3cvIroEs8rCAAq4VQtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989405
X-purgate-ID: tlsNG-42698a/1795142602-AB2DC9EA-B93B0571/0/0
X-purgate-type: clean
X-purgate-size: 470
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 11:46, Abdelkareem Abdelsaamad wrote:
> When nesting SVM, if the L1 hypervisor has not requested a virtual interrupt
> (VINTR) intercept for L2 while enabling the V_INTR_MASKING for the L2, Xen
> should not force one.

The change looks good to me. The V_INTR_MASKING clear case keeps the
old behaviour, so it is not made worse by this patch, and it can be
handled in a follow-up.

Reviewed-by: Stephen Cheng <stephen.cheng@citrix.com>

Stephen

