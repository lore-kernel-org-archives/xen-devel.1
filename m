Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FE3606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hYEQ3dFX
Received: from list by lists.xenproject.org with outflank-mailman.1479819.1683712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNI4-0003Mu-8S; Mon, 09 Nov 2026 11:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479819.1683712; Mon, 09 Nov 2026 11:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNI4-0003Mn-5X; Mon, 09 Nov 2026 11:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1479819;
 Mon, 09 Nov 2026 10:56:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <adrian.hunter@intel.com>) id 1xQN3J-0000TZ-8O
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:56:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQN3H-00AubP-VV
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:56:40 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <adrian.hunter@intel.com>)
 id 6af1a6dc-bab6-0a2a0a5309dd-0a2a4509848c-20
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:56:38 +0100
Received: from [192.198.163.19] (helo=mgamail.intel.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <adrian.hunter@intel.com>)
 id 6af1a6e4-be1a-0a2a45090019-c0c6a3134dd1-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:56:37 +0100
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 02:56:35 -0800
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 02:56:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 02:56:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 02:56:33 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 02:56:33 -0800
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA3PR11MB808482.namprd11.prod.outlook.com (2603:10b6:806:531::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 10:56:30 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 10:56:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:Content-Transfer-Encoding:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794221798; x=1825757798;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6VBrqZQpBQIXXvy3A/LPC7a0K2IqQpWQF65E3C6VhnQ=;
  b=hYEQ3dFXXEYvk7J4gDIaj3xuOEmVUoNgCsrgiRtkfeKSAZZ3d9vnJr4V
   G8fhscKdcbtMXxI+wH8w5CJhExp7ub970Y4gprIU26yZIaFRpDEoQYc71
   InswIqmjjHIZl5CrG2PTPfj4/3Chy19crKt7uIq/uLMB3dVhIWG01Cd+P
   tpWGDR0+bVYdLTfsdMZMzOqeZwhZnTq5g2sJ4bB+Tl20gEXk8jaP/aKYs
   qrLVggVJVBvqJ0RNk1D74OEqY2ISEdkWHZCnmHERycsNnHsJ9XJ5cnvo9
   hzwRBr33aNWnrNIX5gqHg73M7+b/4cu+eFowffyuDFmNh0E419LNz4c4e
   w==;
X-CSE-ConnectionGUID: dJQ3ZKuYQr+3Fcb74ZFcng==
X-CSE-MsgGUID: tJ2ZcM5SSKODA0ZTaiZ/cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3041210"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3041210"
X-CSE-ConnectionGUID: WjVLyzxjTCK45oof/cLhrA==
X-CSE-MsgGUID: t8IFhQY3SO21ZKQzG1OO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7965064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRTDbiqSC8sF1oVwksSD+KVKU6Tn7BhEhaKpHC/zUJhyLSEnD46MnqWZDh3yKPUgEghUKgg3UKjaWsT8b8hudqYpUUNV/bmK1MFYvWHNcWzzyxOLLJP4vTGoaQKc3CtWAtttxFJFEoHcvC3sqsMgRj9yPLu95U/o/beijsDALIf4bm6JpMTuc0rlBUlVqxmKDo/YaKlYKWO8socM29qjniEC61X0Hx1BHuvO+pISWXVtBCnh5oZcKPrXAwanAgNmSf7i/B9avAGuKZzEOrjFpViiSV+n1zvjk3FmLLNVMAY80FE2Vsx9e+cUln/LJPyPFgKTgLL+q1Csv1RDCQ60eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLjh2ebqVRecYq4ErdEQJ/8VN9902OXgFX9pKINPgG4=;
 b=fEYj7X0tVf45VzHCalQUah41sINPECtva1a8rAKv24w9xXdkrI13t/5/xGj2r+5PdhvnvHsWIoUi0HI5kubDxUCH3zKT7X1PQ1nEetIy4WOVXCIBd5oRnFRtq15UzwNqE64J7p36yk+bmhD+Tk0zFrSHg+cFySYdN8ES9tbRNizSTMrnM3iwFfU5EVHjOL3saY8HN4R/l5qIOKnGpVr0wjQI0IJ9KAdXcH7lgmvxJ6Z6pSlm2+1EQzFn1rK1xlnTht69OGXrEha7UimbV+CGbg+Fq3e2bwgcwhsAnk1DoSXmw/zOtY51miwdhYV2Ga05LaLoUumBxP2eIseLQ/ptVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <d52e1070-be5d-4367-b9d2-d79bbe9a4c8e@intel.com>
Date: Mon, 9 Nov 2026 12:56:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
To: Julian Vetter <julian@outer-limits.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Vineeth Pillai (Google)"
	<vineeth@bitbyteword.org>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
 <20261106153647.F7ld02De@linutronix.de>
 <1fb98f79-183c-4144-aaac-45a437ff2d32@outer-limits.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <1fb98f79-183c-4144-aaac-45a437ff2d32@outer-limits.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::30) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA3PR11MB808482:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ec45d8-34a3-4bc1-697e-08df3e501be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|5023799004|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UKS6TwpZ6dC/Qh4uA8kCBF4hN5JWHQ+OXbulc6rJYje1EsPHGG945GhPUzIFcBx5QXF3Pr7H3wbFyiltLf1G+rtGofEFNdh5j5LMbfkguH5+++c1HVfAFUy2f+lvBcnFQPUGja/+WU8/uqQWtErV2AGkiQMZuZ8ISGrh7JwpfNlBXBYgd53kva2WzKrjjfZ3WIgnNBCRVfCzfuJCuzWoZlxG/4SzD5mG1RPxXBgKBVYLjyPLVDHk9E0OT5T6ejYvYCn6p0M4ybvAug4OfeQJx+i6Vo1Zia6ApAHQDmxEZHj2BbCdlm8dTExw9ln4EJ90RAV6O3ODMFWe4vLDTdNhvae/74l+pwWdVaiVTM789bucSqBbmHehQ2+JBuIW/u9rh/DiShWiFQqmitLWwAZeD0mha0nNvRJ8lLUXKQynxOqzUthLNd/Qcl4uFbtI6ezjzLG/aP+aFw7Gt+hVXX/n7ZU/zS2mwxmpLT6myw2g2rvLHE74buAXLv+HNtVbfPCGJITmaYsc8KE+aMjb5nYjzuuZlUY6PJEndy11Wft8nUlRLdDK3o6w27G/CPN1JSXcdHsAuONLDYpaEU8MBoZ4zQ57myKaNnqi4Jxia0tdsAAfG49iZ/DrKPoEZUXjE+n+p71pN+phP7nNo4NYQ9NYy0rbhjvd5er7FVDxEjlhTHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBteHdrd1BoRTkwN2szaXBxaXJmQnN0WlUvL0k5bFl0OWJ2MnVvSHcySDFD?=
 =?utf-8?B?Q0hINmQwL0F0OHdxSDIrWkdRaEdHamFaTDlSazd4anBndTF4clozYUQ3MjBr?=
 =?utf-8?B?V0dMT3A5Mk5uaUwyOU5lTFVQZ3FpZXp1NThvVFhZeGJVeGpabUxxcmtBaUFG?=
 =?utf-8?B?TFZjTDduQ09LZ0NOWVR0LzFoUVYwdno4NVlJYXRHNXl1SmVpMXZ1WDcxcGdm?=
 =?utf-8?B?OFdKZmxtVTlmY01rT1MyZWJLVjUyMkFHQ0xIbEtOeVlmRkQzRkhGWWRuSWtM?=
 =?utf-8?B?NVJNczA2cWdONXhSMXE0UUhHYUlUdGtiN0E3cTNaRUM4ZUZoTVAwSzg1VGdH?=
 =?utf-8?B?S3ZoNDYrSEUyOXRlLzRhbGhwQk9WM0JnRmJGaHhFcnRUVHdYUGZwMnNka0VR?=
 =?utf-8?B?ZEtvaUNCUlpJWG5jVUpqeUx6K3Q0Z1dMdXY5T1lmK2FzMnQva2w2TEZ0Yld4?=
 =?utf-8?B?cnVoOWdZVHVRR3VBMXM3UHZCdDZsRUJTazVHUFJuNm12VGN1UjlpVlBxQ1hK?=
 =?utf-8?B?VDhCSkVIbkErV29SQTVjVlBudnJoenZaL0xaTFlrODFyZEZqVlhkb1ovZWJI?=
 =?utf-8?B?dDcrY2t4SXpwYmhBNVhrU3gzMER4RTdwRFFaZC9UZHZMQ2xUcWxlTWVRSW91?=
 =?utf-8?B?SEJVbVJVNSs4d2dpamwyem1ldUNUMmEzMUpSb0FPK1RsV1UyWkF5T3prOHJB?=
 =?utf-8?B?RHE3Rlpxd1o0YWJNeExIZW0rUkUyWkNBTDRKUUtBODRTdEdWY2VHcE1FeTNZ?=
 =?utf-8?B?NkZ6WXVWbGxsZ2NRQ3VNT3dCNWpONWxVNDdwUEswU1FIN0wvdGV1MnQwY3lk?=
 =?utf-8?B?N2NLblBpL3dzVkwwMWNkYjhYYTNJTVIrN1NBZVpRS0JaT0wrZmdaczVReVdK?=
 =?utf-8?B?OXhvYVRCUmM2WS9yQTVBUElrblNZUkpZZ0dSZjZJZ1JUVHJHcUFYdlNFK1A4?=
 =?utf-8?B?ZnhKM3FXbVZiVTd3Qm5nRm9rK3F6akxydHJ2WVhMNVBSUUs2VGpLMmF1VXlK?=
 =?utf-8?B?WHRzSlNESHlhczUrSHM5djB0UzltcUJ2blZidlFZL2twNDB3Y0pHckVVbnhC?=
 =?utf-8?B?Mm5HcC9QM0REcTdSYVlBNVZhZjNjQWZQdXdKRmVFdFRYdnk3c3lyV0lDU3RI?=
 =?utf-8?B?V1huTEV1THVaWnFoOE1KcklFSEJ6YnIydXB5YWtINXhNS2dDbXZSeUNCUCs3?=
 =?utf-8?B?cmpxK3B2eGNEaE0xTFNjWVlGdGtmbkVrTGJjdmkvNkxmQlNYcVRyUHNBcVRO?=
 =?utf-8?B?KytFRXFyUzAxd0hXR2RXb3hqMVU4TVZTZlZ6ZENneVp2YXB0VFI0QzRPNkd5?=
 =?utf-8?B?MDh4SDFyalVIVkNPalRDSWJHK2s3T0JzdEJvUGtkcGVMVlZNTVNhV1BKdzJB?=
 =?utf-8?B?STdkSEx6eFhiYllibXJzRWhIY3VDT2ZtNmkrQkNuUDY5aWNHNEhzaFUxMnZU?=
 =?utf-8?B?QTdzRFdzRE1HSWVua29Kc2puRE9lTDE5elFQYTJ6ZlRmVU8yZmQyNkJ2ZWpw?=
 =?utf-8?B?TGQzUHNQYzA1VFYzeFdST3M0bnJpVzRvUWJ0Q2szdGRPMXJtYTIyRnFDU3VU?=
 =?utf-8?B?TVRuZ0FKMTluVUZXTzV2dFdteG9kbllDMmhqUnFiL3QxUnAvTUFKZC8weDZL?=
 =?utf-8?B?emp0L0pXOEh2NXBRVW53NFhUVnZkUmpmSUJVajJPMk1jWFNZZnRNOWc4ZjR0?=
 =?utf-8?B?ckFlOFM5S2ZuYlFBS1c3MTg2Q2JiK3kreXVnTEtSdUtBVkEvaHh1SlFWRUtq?=
 =?utf-8?B?SUxjRUQ5MUhhdWFnRFozMENQOU1aMExVYzhEaWdHdmViNmtZR1lUZW9mUnZ5?=
 =?utf-8?B?eWZOYmtlTUM3aDdGeXlDeWd0WFZFN1lLcXp1Y2xuc0lrN0xVbVhwNUJnMmJV?=
 =?utf-8?B?WjhMNXBhWHlrMUF5emdYSHdIa3ZTTG4wbm5hbVlVdUVVSnNucmJNc25KSGFh?=
 =?utf-8?B?djNySjI3eDN1bE43N2JEc1YyRXJDZDBzU0p6bHMvc3B6NkhlS3hrMFVmdmJN?=
 =?utf-8?B?WlpOV2xwdG1Cb3lsaXlNWWtuNUttdTEzNHZUZDB0dlZISjdqdTdYeDlwWFZl?=
 =?utf-8?B?enVwOERrRmdsT2FQNDZzQmNOVUxSK0F4QTF4V0VyazdaYWdIZzhFOTUxRCtl?=
 =?utf-8?B?UlMvSHYyUjFtRUdTcHplT3ZqcTZlV1cyclo2NjVQeTNGaFBMNDNNL2NuN1Bn?=
 =?utf-8?B?eXZKWVMyR3h6T2ZMSWMyQk9TZWMwWFN4cE5GRytDVGRKaTNqTVRob1VsYjc5?=
 =?utf-8?B?anFkNWxWWUlwTGU3cW5nKzFIdlY4bFpqS2dad1lSTUNzbUtNL05BR3N5TnJB?=
 =?utf-8?B?YlJHdFdPRk1zdy8yZlZKaWxyT1NPa3NyeTFGN3lxVXVsWUwrOWdPUEJxd0xJ?=
 =?utf-8?Q?oAMXvfBNusIkJfHk=3D?=
X-Exchange-RoutingPolicyChecked: qaI61NWoDPuVCF/xyq9w3Ob2HXK5+rfc3MFD45R9I3HVu1T/53hrLWgZpxXbw93DXZTlKD/EMCQtWYozNyWNouQyJdYmwb1FAHTS+KkKsMwFpv73M86l4JPEplfdUYkJ4Mt6TM/SyvloB0x8/8f+Sx1RTxOQ3dkrbRmuevAUuqdqa7qRflvFQXsQE7hQfFc7yetfeHKGQKufV/nRHt4Z+jxgsE/Nayjqeqz+aGchNjcluHFDBqn/MXk9N5bJME9UJ/5er1sNlmpp6V0rNiR8tvu0/gFHA/EPjAjhzvMOpOCZOuCXLf81SyQYm9xT/GBFLbq3SLn/w0/8hnYxhdA4Tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ec45d8-34a3-4bc1-697e-08df3e501be9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 10:56:29.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j4lxZYqMb84wAtdKyqxUPAKqtXREe9VVDNsOZx2XV9hHZ+JaCYJgtNn3PG5vSpEUdotiOFVGxVaUqkqhZBYtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB808482
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-bad1c0/1794221798-FC212034-6531F55E/0/0
X-purgate-type: clean
X-purgate-size: 1159
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 12:16, Julian Vetter wrote:
> On 11/6/26 4:39 PM, Sebastian Andrzej Siewior wrote:
>>
>> Looking at #1, you could probably limit it to a nop on
>> !arch_irq_work_has_interrupt(). The tick should not be disabled if
>> irq_work_needs_cpu() returns true (you don't add anything).
>>
> 
> Yes, right, the lazy part is pointless.
> 
>> And lazy items get handled via irq_work_tick() anyway. This make me
>> think if it gets any easier if we handle both in irq_work_tick(). On x86
>> raised_list is evaluated anyway so by dropping
>> arch_irq_work_has_interrupt() we would avoid the APIC check and handle
>> list in this rare case. If the IRQ-work is working then the list remains
>> empty.
>>
> 
> This is maybe a cleaner solution, it needs no APIC access and no call site in the suspend paths. But irq_work_needs_cpu() would need the same change, otherwise in a CONFIG_NOHZ=y setting an idle CPU would still sit on the work until it leaves idle and re-enables the timer tick, no? I will test this.

A fix for stable is needed, so need to check that there is no
irq_work that would have a problem running in the tick context.


