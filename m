Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5F606A326
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 23:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C8j8Om9R;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kDKcjzSV
Received: from list by lists.xenproject.org with outflank-mailman.1497542.1695813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUBOS-0008Ip-G7; Thu, 19 Nov 2026 23:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497542.1695813; Thu, 19 Nov 2026 23:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUBOS-0008Ii-DR; Thu, 19 Nov 2026 23:18:16 +0000
Received: by outflank-mailman (input) for mailman id 1497542;
 Thu, 19 Nov 2026 23:18:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rick.p.edgecombe@intel.com>) id 1xUBOQ-0008Ic-EY
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 23:18:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUBOP-00AscR-C8
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 00:18:13 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rick.p.edgecombe@intel.com>)
 id 6aff8379-bab6-0a2a0a5309dd-0a2a4508cc54-28
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 00:18:13 +0100
Received: from [192.198.163.13] (helo=mgamail.intel.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rick.p.edgecombe@intel.com>)
 id 6aff83b2-f659-0a2a45080019-c0c6a30ddc26-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 00:18:11 +0100
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 15:18:09 -0800
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 15:18:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:18:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 15:18:08 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:18:08 -0800
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CY8PR11MB7171.namprd11.prod.outlook.com
 (2603:10b6:930:92::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 23:18:04 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 23:18:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:Content-ID:Content-Transfer-Encoding:MIME-Version"; dkim=pass header.s=selector1 header.d=intel.com header.i="@intel.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130292; x=1826666292;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YKZNjksr+gQLmbQ8RqiWYDejVUTRGF8MbDFWLPGAhow=;
  b=C8j8Om9RW0jAj0ybH+dem/7p5Zh3Hnt/HkmEihmggAoCRuN1Wv/nJwdl
   gsVyw96CpdnJPXs0eIF1wJLl4OJ26AvCFlgXRcvNCdfY+8iy7n+4J5F6G
   7wjLEhQOI/xP3LfDSotaTjVhmOtvrM0pIj2Vu5b58lcoRTnp7+LDMLEU6
   cwrGLkljpkqZJ5t1zB8Kx7VjxP0XEcfECEk4QGnJxpfAOiqerh0ZU5PUF
   0dDvA/wMEUGTQxQM0ovPQwkUV6m6g6Sa7v3bYL9wqs3JedE/BqeXk6XpQ
   M3nWJR317yaGj+VBC7PNSpuyRPLvxqNyX3wtGeX6LjcYcs69yOzFj+7j9
   w==;
X-CSE-ConnectionGUID: txDzcrZjT0ikh/qcXiNfiw==
X-CSE-MsgGUID: bTHIiXFtR8iw2f3CdWZUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3994801"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3994801"
X-CSE-ConnectionGUID: trHfm4DiQ4KNFPYfqRMGEQ==
X-CSE-MsgGUID: jq2RRXp+SVeTLZAcEyAeJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10548553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aw6bXtt4MoEAHbXRwX8XWbbKGnW+KuVVvBy7xg7A5sVWotVdOVhDmPfhg7UEO2foACFjDww4D/kFG+TPkz4v19ao/qzJs+L+JfAsd9dAxdTe7r90sxhG6ZfSxtWO29ONlcQRY6GPh0m2h1QO1DH+rdHFOnZloyJ6iQNjjsDAH+NPiwmqNpIZnoUFBJ65ZWMnJmlkKCu9VD1GfbszwWlPeXzEiNpfWhl7MEGnUgXDJTmrDrbhdsJtCADpzyy8ZdvAukV0ou8xTFrcKgs7fEU7+KXCQl7SjUV5UQgG7Yo/OQWnH/gM3VC/UGhWz+aV4dS0XMVHyaz8ahV0xoOixqmSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKZNjksr+gQLmbQ8RqiWYDejVUTRGF8MbDFWLPGAhow=;
 b=CgbLWCU+4kkrFTYufgZ1Djia8SVq82LB+dykOsgEx76C5ENWlGUn9VKkJ5CHvkZdViCzUmK35w00xt1/oT67aGaoGA8YRPBWoHNezSsxFbem7BjzEHpzQ9ENvvDHMW21touWUQh913jXYp4SnHDjr+91P60XuwdGEuUfXETnhJZhgezjgWqhfbY0HNYjKyjTooxj1P8kMj/59XmUukt+OZ1Itgv3nxCfa7oK+cAwSKymKHgFXcnMcAS7bFSqrFX/pK5vpR6OMHfF4S7SlPUcOLliPmZ8g3HN8iLheUerCaFi8oDhQeDp+vxKt9+3Fy3ISm4an+yW+Rk4W8FOBkRj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKZNjksr+gQLmbQ8RqiWYDejVUTRGF8MbDFWLPGAhow=;
 b=kDKcjzSVMPNsSTEe92SOBNBW/6IosEfT1WFj7O7+dNlGLnYXSFZzCcsfe84Pb1Fq/kI8Icvz4ZpArQ9tU8fFqG8WOzqoiE3c8N2wGljFTbvCVuR/0dMUlT3zpEM2ekAog0J1Gr9E80CW1W6BF7BV8QhD1F6FvvoFmlDRUGBFAp0=
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "jgross@suse.com" <jgross@suse.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "bp@alien8.de" <bp@alien8.de>,
	"haoxiang_li2024@163.com" <haoxiang_li2024@163.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
Thread-Topic: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
Thread-Index: AQHdeHw6R1wLhKDc+Uq86658gggviQ==
Date: Thu, 19 Nov 2026 23:18:03 +0000
Message-ID: <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
In-Reply-To: <20261117084325.1241735-1-haoxiang_li2024@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CY8PR11MB7171:EE_
x-ms-office365-filtering-correlation-id: 80d30ece-43b6-45c1-c9f4-08df46935cc9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|38070700021|10067099003|261026121527099003|261026140227099003|56012099006|11063799006|261022105027099003|261021121427099003|261102123227099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 4mgXARrOFfQHW9WalOIY7NzABe+SkwO2sxECT8x3HS6riJvWnLxweT5irakNq4rSWyA9wsKX7+pe8s03apO6iGZq7YFtLq/MTBAKnF1y1eIPQmCKQ43Z2Cv+jsUl/r7NnyfhreBCGdYX68V/DiR6iBmqPLSIj9rRawPAjkxO9HQtkKU6AZ0Ylxsm7NU7hTS6auhhaacVs+G1jUVdl8KnxBp0Oc3ZrXmlVl8N2pa/CvUcjlervGPtZ9nvP7sJVR+p5kTeGD1Bl4/C0mDl4H8ZbIKJ26OuIvvi/q6K9Y0W6wPQUcF06lZq7u2d/f7OQHS/6Vj6yyVNVcWUfIuRNMyKzbpttWG8WiLg2BwUHK22mIMffu21rcRFKRJ8lD2V50U7K+Cc9tW1tqarQapRrXWGVc4WcqskQ0t9rooeIgTQUhrGQmQwvyz5YfvbpuLPrPtQC5OCUKqmZU4i5au3WMS53BDGFiOxP4YPuxxyYNAKFQXl1yoxKfUy3UNRzLeB4vEwmLVOQqAgcXopd5E6uiKwUrfpEUAbq/7nHnLre81MlO+BFnrR5HMW4mCEt2QpuT/WCN/w84PFRUDelIc2bD9M3RNDur80UIDx4LgO5HqHCSNbbD2IrFHzKYJb424KyqnaigW1nRqiaHfDYy2/ACljTIZU/3zbjdqmB5YDJDyGjBd+S2zu1f8q7/NrOqQQaDGjwZDZcenQ/CRsJRhts1lohMhWr5r4nWDXZz35gZPW/7w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(38070700021)(10067099003)(261026121527099003)(261026140227099003)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXdjZ0hkMHR3R3dtQzBCa2ZxUnUya3J5RGlaUkU0M1o4QTJaZkFiK0FrcWRI?=
 =?utf-8?B?QjNNM3hPR1Ftck83MjJWSDZxTHdEaVVURFN0Ylp6bkZxY3drSEZaYXpJU2hp?=
 =?utf-8?B?ZUx2Unl0Zi9MM1A0Ly85amZtMEZrZmlMbUJ2NE83bzByK0FyM1BjalBlR3kv?=
 =?utf-8?B?MzQwZGJTSFk4QUxMVzVTQUd5OTJXZUd2UG5EUmdjWlhBWmNpUWh4VWxCYnJo?=
 =?utf-8?B?NmV0UHRpa1BidWVtMmVHMHF2L2t2QllWb2hINGhXYWM1QTkrN3BKejB1eVdh?=
 =?utf-8?B?bEcwQmUxSWl0Sjg0eWhiOFQ3T2xJZzcxanhXNFdQb1lRSHlOaHRKK1ZUQ2c3?=
 =?utf-8?B?cWpZYjhjK3B1aUdQVzhKOFdhbUF5UGpWbjVHbGc2ZzFQNndLVnBERHZKdmI2?=
 =?utf-8?B?bnZqd08zL1dBVEV4NFFVYlh2T1d1Ky83dnJlMkFVaDhOc2U4RnN2ZFJnZkl1?=
 =?utf-8?B?ZU5iNVVlU1ZqcVBuVHh2TE9kTW5jUGtMM3FwdSs4UzNIVVE0NmRmdXVoVytn?=
 =?utf-8?B?bUdRdkV4b0s0YTNhNjY1NTV1S3NHU2F0U0JrelJDMjhEMFBzWVpMdjVvSjJW?=
 =?utf-8?B?Ynd6cldsRXc2ZU1QYTdsOUhKalpsYWFuL3dpVXU0bDVKMGFyZjIvTnhSeUV6?=
 =?utf-8?B?aEpMeHR2bElKSE9vRmgvZUlXYkYwejJWSzNBeCtObUt1ZkZZOUYzcENiK3dD?=
 =?utf-8?B?bkxLTHZob2Y0SUxGOXNId0ZIK0x3SFo0UXpZSVpYL3lhcWhSUWRjYjN1S0ZO?=
 =?utf-8?B?by9lSkVtczVNZVZjWjZRNDhkaE5uVjRkNFFJWFlRRDh0RFhQR3ZpZEZUcjly?=
 =?utf-8?B?SmgrTzlPL3BZbG5NeUgyNVEwSGVzQXdUWElCMXczcEVqaG8wbWoyUndQZ1BC?=
 =?utf-8?B?MHFVa0N0VGJUOG5jaElNak8wMVQ1OGlrQ2doczVZOWd5dnE3S0RWdXppUG1u?=
 =?utf-8?B?Nm9mU1FkQlF0TWxZUnFhWjdGSGpGYU5BNWNwVWNaSi81T3JwUVhiK09Id1Ry?=
 =?utf-8?B?QkRuWjJrZU43YXVjZFdON2tieHFZQ1VkYit3WXFpakJ3ZGVmTlZ5NEM0eTFq?=
 =?utf-8?B?aGZ0RUdLamE5Rmk2WENkYU1oVUNuaXVGcjJieHhpWFRPbUMxbVgyS2FBcjA3?=
 =?utf-8?B?b1BiWXBsaFdnenlWZkZQQXJ4MFdvdDJDbzR5Yk9wejk5SVNoK1F0cDN4elE5?=
 =?utf-8?B?NGo2VVFrRFc2dWhhcGI5Z04zT3JZRjZxZ1ZiQ1dZejFTbWlBeTRhL01FckRF?=
 =?utf-8?B?VmZGdTRQQWoreEZpSm8xSC9ITjdKeTlmSk95ak5sSExLZU1tMTBWNjNYSEpx?=
 =?utf-8?B?QS9jRmRrTUZHSDRiSjRMRWlCeTVaQ2FQM21QbUVOcGlwVkplYTA0ZHc2NDNO?=
 =?utf-8?B?emo2QlZxQnVyRit2eS9yTkVXRUYxRkRJNXdkdnl4S0U2OVVnYzBWZTh4OHlI?=
 =?utf-8?B?ME5SYlJSelFVRUt0cWpvam42L09oeG5wZ0laZ24xeXVqYzFRbXVWZnlBamlP?=
 =?utf-8?B?Ni9sbFZadmw5TDBOZjF4RkJVelZZQXB1RW9qMjIyNnNONWxQaCsrOWtBR0lP?=
 =?utf-8?B?N042Z3VuRWtIUW9wZFJ4L2dqNk1UZ2hxbXZKWVNXSjFISHcySGdES3plWnJw?=
 =?utf-8?B?Zm1TRm1jUmZtbHhzWnl5Ky80WHNRc0I5THE3aWRuSGRIUGVCMkQvRWVPbUta?=
 =?utf-8?B?dVloYVZZY1k3L2V2RmdGRG9LVSsvdUFYa2Q2eFBtbys2Tkd2QUUzbkNOOHEr?=
 =?utf-8?B?NkJ6bFpBbXhXV2tNZW40TFBQajZOUERyMDc5dEgrcWY1eEdEVUh1Qnc1bUpD?=
 =?utf-8?B?RkpPUjEvYTVhSDdZci83SmEwcjZvMzRpbVhzeG15ZFZpNGZXYll4djJsbDNB?=
 =?utf-8?B?aHhXVGFBcXUwRjVnUWdnSmVpcjMwRVNmKzNnVCs3WElmL0RvMEpBTHc3QXpT?=
 =?utf-8?B?LzU0SFJMYlhpWEFITEhFOTFKeDI5MlpLOXhTMXovN2RJQUx2WE1KR2NBUUpu?=
 =?utf-8?B?VFY2TWI4YXVEWFNoMGtMLzB4Y0h2VFE4YjhsL2hpMUpYeTdnQkNrMUZoMWxK?=
 =?utf-8?B?NU9Sby90aDlESHIrTzRqS0xXcmxmcm94Mmt1Zk5uR002bWFPOXRxamtIblNM?=
 =?utf-8?B?Rzk5RmU5ZFFkaVZnQVJLdUJtRVpWKy9IUDI5QjREMWFsN3FhZGJnaFdUa2VX?=
 =?utf-8?B?Q2hQeGpxWTF4TllZOTFuUm5kS1k0QUU4UXFCTUM2eXBhQnpmRU1zVEdKZTk0?=
 =?utf-8?B?Ui9PRGRaUUttdi9qejA0L1I0bmxNeFRVODhjTEQ5WFRacEhOSDVqK3B4ZWxK?=
 =?utf-8?B?TUc2dy9wVDZ0dXpNcmVHbkwyczRRZStoOFZIRGM4VzFpclpHcVhsbkV6eDhZ?=
 =?utf-8?Q?UDQkqAbjprTUrHu4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCB053130467F440997950F296E22EDE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GswR2cqEqhKhXwz431ogJT2CZ8YzFgK91kNGw1L6jAngbyuFFCNGzhrQWDpGHxL0gzSmCoej1pffBfGgsvIbhDyEpKpQsZR8UjJbeBskKMVJxjOEiX3tJSI1Vq7AY2KBQii7/R8qDbrWPXmfOqPK0HV/GlL/mF2ZXwXlCD7LRNrXmoArd1vg/1L1DieCFCEfqtEtinnjoNsbmcyB0a+uOBfrspD5VfyQ7DAQQCdOrl5XcWYDxE4DaUZ4FqhqBFM+SEdGwlNmQfyisYZd/PcxyymnN38DNYtkHQW8Fh4EaFjMPoSBE4ds9BIPg5EW1dF/41oEx64Hf4CbCsswFzmMkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d30ece-43b6-45c1-c9f4-08df46935cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:18:04.0024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ib6/aMPrkLkrMUE2EtjPHNbSiCPV7rSG5b+U/EF6eFYn+e5ROYdIsxVzHxGcFMwnNbDOq5kD09U8E0KpHuY6QgOI6lr4smlaxEvHJrNJJps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-c1860d/1795130293-D694287B-0DDF3D7D/0/0
X-purgate-type: clean
X-purgate-size: 1114
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAyMDI2LTExLTE3IGF0IDE2OjQzICswODAwLCBIYW94aWFuZyBMaSB3cm90ZToNCj4g
Rm9yIHg4NiBQViBndWVzdHMsIGFyY2hfZ250dGFiX2luaXQoKSBhbGxvY2F0ZXMgdmlydHVhbCBh
ZGRyZXNzIGFyZWFzDQo+IGFuZCBQVEUgcG9pbnRlciBhcnJheXMgZm9yIHRoZSBzaGFyZWQgYW5k
IHN0YXR1cyBmcmFtZXMuIFRoZXNlDQo+IHJlc291cmNlcyBhcmUgbm90IHJlbGVhc2VkIGlmIHRo
ZSBzdWJzZXF1ZW50IGdudHRhYl9zZXR1cCgpIGNhbGwgZmFpbHMuDQo+IA0KPiBBZGQgYXJjaF9n
bnR0YWJfZnJlZSgpIGFuZCBjYWxsIGl0IG9uIHRoaXMgZmFpbHVyZSBwYXRoIGJlZm9yZSB0aGUN
Cj4gZXhpc3RpbmcgY2xlYW51cC4gUHJvdmlkZSBhbiBlbXB0eSBpbXBsZW1lbnRhdGlvbiBmb3Ig
QVJNLCB3aGljaA0KPiBpcyBhbHNvIHVzZWQgYnkgQVJNNjQuDQo+IA0KPiBGaXhlczogMTYyZTM3
MTcxMjc2ICgieDg2L3hlbjogc2FmZWx5IG1hcCBhbmQgdW5tYXAgZ3JhbnQgZnJhbWVzIHdoZW4g
aW4gYXRvbWljIGNvbnRleHQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBIYW94aWFuZyBMaSA8aGFveGlh
bmdfbGkyMDI0QDE2My5jb20+DQo+IC0tLQ0KDQpJZiB0aGUgUFYgZ3Vlc3QgaGl0cyB0aGlzIHNj
ZW5hcmlvIGNhbiBpdCBzdXJ2aXZlPyBJIGRvbid0IGtub3cgeGVuIHB2IHZlcnkNCndlbGwuIERv
ZXMgdGhpcyBtZWFucyB0aGF0IHRoZSBQViBndWVzdCBoYXMgbm8gZGlzayBvciBuZXR3b3JrLiBJ
ZiBzbywgdGhlIHVzZXINCmlzIHByb2JhYmx5IG5vdCBjb25jZXJuZWQgd2l0aCBhIG9uZSB0aW1l
IG1lbW9yeSBsZWFrLg0K

