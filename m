Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012BDCC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:02:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448716.1665742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHK9o-0002Hl-ED; Thu, 15 Oct 2026 12:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448716.1665742; Thu, 15 Oct 2026 12:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHK9o-0002HN-9j; Thu, 15 Oct 2026 12:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1448716;
 Wed, 14 Oct 2026 10:45:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <aleksandr.loktionov@intel.com>) id 1xGwTv-0004qF-11
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 10:45:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGwTu-004CKk-Dn
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:45:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <aleksandr.loktionov@intel.com>)
 id 6acf5d2d-bab6-0a2a0a5309dd-0a2a450aba28-44
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 12:45:09 +0200
Received: from [198.175.65.10] (helo=mgamail.intel.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <aleksandr.loktionov@intel.com>)
 id 6acf5d33-f2d2-0a2a450a0019-c6af410a14be-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 12:45:09 +0200
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:45:07 -0700
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:45:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:45:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:45:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:45:06 -0700
Received: from DS4PPF7551E6552.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::31) by CY8PR11MB7363.namprd11.prod.outlook.com
 (2603:10b6:930:86::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 14 Oct
 2026 10:45:03 +0000
Received: from DS4PPF7551E6552.namprd11.prod.outlook.com
 ([fe80::ac6c:1d96:c766:799f]) by DS4PPF7551E6552.namprd11.prod.outlook.com
 ([fe80::ac6c:1d96:c766:799f%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 10:45:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791974709; x=1823510709;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2jUlPy8n+UBtePTlv1PTFS+OS1Qdz8HFuyrami2eGQg=;
  b=mYsxt83dFgjZ1aBgdrYFi6rTDYtS8QOhAf4tT3P5g9fnLhHoI5So6beM
   vQjMBLWCicdcmDUOp+ql6PiCAiRZPh4C1gWDFoDce0e2rwKanJjww7Bfi
   xk2dKjAsTfBQ813qBNGyg/2Gbn1i6gi4y8sNSUIkZjFRy4yV3/6F8ufwx
   +W2bpTKNsQqTRsO9WxCFudMEPPErGiymGvPRF96nRx4wCpXt+bQKN6fng
   YiWuZwTxTmA/uk4FBKPLwWGc9saD7VdC5OFHSDFd0qp7zX0naVC59uDud
   xiomojU03ZXuWJRioLLEXak2hjxqXiedna5I/k5v96NGUmimliWq0sJUQ
   Q==;
X-CSE-ConnectionGUID: NGhyrSI/TpC2n6Uz3cc1MQ==
X-CSE-MsgGUID: OSEsU9f+QuakCGrpZq0mCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="608286"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="608286"
X-CSE-ConnectionGUID: QLvdgYIVQzybmeMBVgBORg==
X-CSE-MsgGUID: i8wSYyYNSDGrjnyV0Mr3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1740254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BboCTyoPhQcpRRuxEwoLYSkt3I/RzFuN5Mq5HBf4rE/pfMQdcxp06QIR4TTniLD/Va9h9g05wk/BkKQgjJksZHgBY3+W2S9HAWQZjEfaaXUAmn2evIiD7wnX0IAJ0ugdVrTvJ7EtW3pX+arKH0YsVKD6U9HY6tmthzdkBjwO9eM5x0nmiXQUOOahBMMjzyTlKkUG4KL1/ggD3He9+/CWKWVT3C7OMO4liqlpk1kna7ApEY8lxaVJXVSiLvTNws65IhcolVXOf8P6ABgjoZSqCe+rLSbQB2DBwLjQcyj/WXGdz3b0SXT6lkC4aA+p7XMtvGEDQgtZjP8pUdbxnGPW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jUlPy8n+UBtePTlv1PTFS+OS1Qdz8HFuyrami2eGQg=;
 b=kN10kmt80wwWalmdR4ee2ulKe8DyJKWfnEphxqyoh6wWO3AiMr3zmf/IMzVdkWwh9Mr66AuQJUzXsN8Z0bY6owHH1iSSOEMNn6eZB84Z7QNp5fW798jMsf7sGCHnRxk9AGs+8ALN5F52cvRM/NUB+6Ft9UeGBhMhrEgXEDokOeIBi5ydwJ+hTs0an3Y+lStpOW8bPyWOsjPdNB0OWp1ngppGZiu5REqcorjk+e3ZRO1FQZHTbefSTa4Vot1kkfscIRmpLWQGCN3SgpzW6knjjkALoKDOOsXySeeBpEG3VrUAFJeMABtb8g4/ejtm7TeV7ln5EzzvDRRiaBJkxmt2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Josef Bacik <josef@toxicpanda.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>
CC: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Mark
 Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "Juergen Gross"
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, "Nguyen, Anthony L"
	<anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, Manish Chopra <manishc@marvell.com>, "Rahul
 Verma" <rahulv@marvell.com>, "GR-Linux-NIC-Dev@marvell.com"
	<GR-Linux-NIC-Dev@marvell.com>, Shahed Shaikh <shshaikh@marvell.com>, "Simon
 Horman" <horms@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "intel-wired-lan@lists.osuosl.org"
	<intel-wired-lan@lists.osuosl.org>
Subject: RE: [PATCH net-next v2 07/10] e1000e: use pskb_may_pull() in the
 82571/2/3 TSO workaround
Thread-Topic: [PATCH net-next v2 07/10] e1000e: use pskb_may_pull() in the
 82571/2/3 TSO workaround
Thread-Index: AQHdV2iNuC8nz2/mq0etBQaKFjGAjLb840rg
Date: Wed, 14 Oct 2026 10:45:03 +0000
Message-ID: <DS4PPF7551E6552E756533C890EF83BA250E59D2@DS4PPF7551E6552.namprd11.prod.outlook.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
 <20261008-b4-pskb-pull-tail-drivers-v2-7-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-7-8f2bd9bee138@toxicpanda.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF7551E6552:EE_|CY8PR11MB7363:EE_
x-ms-office365-filtering-correlation-id: 3ebcb8ce-d7db-44f1-d4ff-08df29e03409
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|22082099003|10067099003|38070700021|56012099006|18002099003|261009223027099003|11063799006|4143699003;
x-microsoft-antispam-message-info: M5JB9lQq9e4AGL0Wyc8qCFp4qOSYsD/7VtZ/H0i49w3F5v90UFcdEcMq854yflxvOPkhY65khXSWbgVvN7aBDku7H6wzdBokakjCHAbNHPVwSLWrWW4k8Et0G6St1Ik7iU2AJdYLHG0hflvDZzs6mBunBkX4eKqfS6O3p1LkA35JbmxY6xga0MDZrG4CYY9kc88/UUuxi7HfApbqU+Qz6/prZDVvfytLKYNcleJlICRpky7fmOF40W3nRJp6ftRqfjFywSomrhgGLzKDTwAY0x8uZBYatgnRc/uuwzdYgK8kHmbp1iC/TpReLCHw+Bn3bum/28mqUWX9PH2a4PXX7fOSwM+2rJK+1ULXkmqW/ZfLJY+KxQxBoMiJ9pYDmL83/3lcCl7G9BuC3Uphi4eRBfWJVRI2nwTDFnYw60GdB4iLbAJuiRl1g0WrWwsOoS4a+ikrZ+sKnwqztlHpHXOGfEVc11cqvOFxPEnTjnN0h9Vc3d0k1eeHcxLW0iaCK0ghZRolHcCj9uIlr+1nn/Kak7qQ7qS8bSLh/1HFWArlQppBeOdv8ItoWaO7NGevq57JH3vH4da8Q+xj4wOb9/ohE+Pu94j0hGEuNeV4QEAnPKU79cXcKkUiaAkcCIvWJBXPNf4aCFLIU4ekf6XIKVhBIF9PGm1C1jqo0pTLlc7RMCb858XHV1HHx0MwmddXTkWl1+2knYUetmJnPTNi7Y+b9HOyPuPDWSuzWCRLsDzIBhU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF7551E6552.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(22082099003)(10067099003)(38070700021)(56012099006)(18002099003)(261009223027099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU93bE4yTWRQeDREdVczTStZN0gwbWxlV0VWZjZxWmNrM1lpUC83WGNCaXdv?=
 =?utf-8?B?aXdFR0ExYjVmd3BkZVVXZTNmODB2Tnk5V1VmNzVFdzVVdzFWYnZ0NUVsVENT?=
 =?utf-8?B?NWUxcU1yL1NKK3Nlb1JyaGwrTlpJNGJWU3BYdkJzWVM1TXBnTnVTTDRXWnNF?=
 =?utf-8?B?N0RZcm9FWXVJeG0ya25qRXU0YkRJNjZOWU1SVmxKaS9GeHA1aW9CNXVXUDlV?=
 =?utf-8?B?bTB4Qnh1RVd2QndqQzRtVURiU0pCeWk1ZmJYbHUvdVBpeEJKNlViTktxVkxl?=
 =?utf-8?B?dGk5SVVocXZINEhQZzRoQkN0UG5ZZGlNUlVudU83eEVQNDVYMFNzUHpkN3py?=
 =?utf-8?B?ZHBGdWZtczNXaDNCYU5ReFB3MnZnZUYrWGFlbWZTekVWM0pLMFdXU0FZWHNX?=
 =?utf-8?B?VnNMQ3BQMEhKS2l4dlY0a3F1QkZZbUJUbjNvWFA4MzlhRnZ6U3c1cnhyZ3Vz?=
 =?utf-8?B?WUNZM1dJVEZEaktMbWR0ZzBTZkhCWGZuRHJUR1lMZGR1UFBCbzJCYjI1UXFX?=
 =?utf-8?B?YVNZbWpaODNDVFUvWTVNazQxY1JVK2o1QW01YTJub1hGalppeFFBQzRGcWZl?=
 =?utf-8?B?UW5kaXhBNlBsYWN6dG1mSVhCZnY5ODk4dFdWOEpQTXVackhWZ1RvTDdqb29S?=
 =?utf-8?B?d1lOQ0d1WWpXMnRYcTRwTVZFZjFvMEovY29lV3cvbmVtbXJnNFluZEtWWW9h?=
 =?utf-8?B?ZDR4YzF6ekpnS1ZvcWQwWjZWRDgvL3g3K3dJVHNxak53S0IvWXNDQzlzUStu?=
 =?utf-8?B?amxSOHBQYjVhQk1pYXpDck15Y2F0dFg4TUZpeHZKUlVWQkhzcU9hTGxWVGg1?=
 =?utf-8?B?SkZ5a0lKRkx4M0hPM1dhQ1BQRmU0NW0wZ091cHNlQnEzcm0vOVFXei9nUk1M?=
 =?utf-8?B?azRrazdMN1JMajc4RjdRekpSYWszZml5NGhvWm1EZ0ZHd2J3OUw3aG9BUkZP?=
 =?utf-8?B?UVdmQkd5SklBU0djQ2JsNk82YlcwaDZwODVWSlFjbWd4U2twakdCc3doRlBL?=
 =?utf-8?B?THVHZTBtMjVIV0VoN2VXSGJsZGhiOTNxKzdpcGVKOTlsTUhTc1Q0VzErQ0NO?=
 =?utf-8?B?L3BiSHFFUlQ1RGdWV09oamVQRlRTVmVZN3NYRmgxYklsSlR5N2VPMHVSd2Yv?=
 =?utf-8?B?eWltcC9Dc2ZjcDgwMllDYzFDcFA4L2ZVR0FXdTR0TkR6RGhod1cyQjFjUXZM?=
 =?utf-8?B?MUdRTEJPbDJteHVEb3pyOGd3MDVLQTlNRFZpZjRPaG1UcGdvSU5KcVBPMWtF?=
 =?utf-8?B?Vy9tZzJNeHlsSzRQVktpYTdXU1d2S0ZNaVNyVWZvMGg3MmRkclU2dG9PZ083?=
 =?utf-8?B?QlZ3R1kzc3JiQjJETk1waDlrQndmZXpVdEw1Nmx2MEZlU2Q4aXk5ZHIwQmwr?=
 =?utf-8?B?TjVVbEFXbkFIenhQYnMweis3ZXVRZ3MrVjRUSk9IaGs3SkZXdEhQSldvWDdO?=
 =?utf-8?B?a21LSVdBMXBsS05rTldMSWVldm1nMGdrS3M4VFpIY0FKMXJyUWdIS3UzWFZ6?=
 =?utf-8?B?OTViRkJueW04RmhsSk5JUEtZd2pMY2R3ZWR3QWFjYys5RFRBcFJRdVRubkN2?=
 =?utf-8?B?YThkVmpOY1MrRHY1Q0JiTU9hd3VCangydGRxbXkwK2JGUnQwTGhSWGpzTHA1?=
 =?utf-8?B?TjU5b3V3NUFLQW45ZGZ2dzZtWDYxQ1diQitPUE44Tm5hdXBCeXJYNTZSUlBN?=
 =?utf-8?B?d0RwY3JyaUUydjk2QStiODVvWGo1SDE3YzhHTmpIM2Jpcm9qNjFSMFZmcXRP?=
 =?utf-8?B?eUdKNkllNFJPekdFL1pnUHhpajlRSTZMYityWDJkMGVwWXdDVE96SGNPamhD?=
 =?utf-8?B?UDJYNk1KRmJqS1dRZVBmcXNwaU5taTYyM3lCbmVLQ2dTMnJWYUIxOTQ0UTMz?=
 =?utf-8?B?dS9TQy8zRjZGd2tRR0tyc0Zrb2RKZ0JWWTN5TmltK0FxMlB3TGg5dExnSGFH?=
 =?utf-8?B?NHpYMitWZkkrWmVWWlRocmhIN25wMGo3TnVETFE0SmpyM1ViSHI3bFMwcEl1?=
 =?utf-8?B?UEtxYkVJblBITnhRNjZ0d1liOEtTZG5ZeU93UVhsdENOMU1USHNoVlkwaUto?=
 =?utf-8?B?VmJjWnNUT0JJY1FsMW56Umo0TEh6YnJCTGRubW03K0t2dHI4Ym4xWkw2cDVx?=
 =?utf-8?B?VklEZ2UxRHNvYnlDK2FwVytaM2RwazNDOUJiU1F6WDFoeE9tQVdHZ29abVNL?=
 =?utf-8?B?QTVyWE9JWWUxR3ozZzZYL3drbktXek1VQmhXcWhHajBvYW9Jd2QxTXFnOUo5?=
 =?utf-8?B?ZGtLLzJtU3VFMmE2ZzVPR1lsVkg5TXEwRlAzYnhoTnhsUzdrOXp5cHIyOWdI?=
 =?utf-8?B?VjBSMXRjSjY1K1YySXlhbStVclZ5SlFoa250ZEU5RkE3bFNCVGdPT1pyeXF1?=
 =?utf-8?Q?gsVgkhviw3rsC5BQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ULV2HH+oSmiDEhv73HJT9UIzN0BfCdVSWxMnyiJHd6QJPTX8Yqzqcm9O1Agaicp5CoQPKZgtgLXm0jYOqHJj16hN5OyonaomeP5diNmDXL7wqmEnTvs2fke1Ek7UGLXGC74uTPYgPkdniy28ZsAoYRFrCCxC5itGBsIz/gd3TPslgYlmjrLT1U/eCQDjU42s6tIEsgj+/BOS/aSr20WVkFmHabx2r9NTUsf/PS2Xdp8dUNjsIYCe0HLEJKMuxZ7IG23J8szyRHav1I+fKfM9woLxu73wRVodGfmYEoczfHFMdz/8xF5A2hsXLFuQ5FeGdHUm8FsMWUmJXeGRIZab4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF7551E6552.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebcb8ce-d7db-44f1-d4ff-08df29e03409
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 10:45:03.2063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RLoSuEMjENZvnsrNizM4HhhfF4Yahb0B9JEGYHHVAWZXM/78nQ3BbEsVPw7UDs+fFxoLH7mJJU/um3Pd0MBRsenFJfDdHtnZATDJQ1GEIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-4011c0/1791974709-4AEDACFC-49299A5B/0/0
X-purgate-type: clean
X-purgate-size: 3428

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zZWYgQmFjaWsgPGpv
c2VmQHRveGljcGFuZGEuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciA4LCAyMDI2IDEx
OjAzIFBNDQo+IFRvOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPjsgUGFvbG8gQWJl
bmkgPHBhYmVuaUByZWRoYXQuY29tPjsNCj4gRXJpYyBEdW1hemV0IDxlZHVtYXpldEBrZXJuZWwu
b3JnPjsgRGF2aWQgUy4gTWlsbGVyDQo+IDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgQW5kcmV3IEx1
bm4gPGFuZHJldytuZXRkZXZAbHVubi5jaD4NCj4gQ2M6IFNhZWVkIE1haGFtZWVkIDxzYWVlZG1A
bnZpZGlhLmNvbT47IFRhcmlxIFRvdWthbg0KPiA8dGFyaXF0QG52aWRpYS5jb20+OyBNYXJrIEJs
b2NoIDxtYmxvY2hAbnZpZGlhLmNvbT47IExlb24gUm9tYW5vdnNreQ0KPiA8bGVvbkBrZXJuZWwu
b3JnPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5p
DQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgT2xla3NhbmRyIFR5c2hjaGVua28NCj4gPG9s
ZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPjsgTmd1eWVuLCBBbnRob255IEwNCj4gPGFudGhv
bnkubC5uZ3V5ZW5AaW50ZWwuY29tPjsgS2l0c3plbCwgUHJ6ZW15c2xhdw0KPiA8cHJ6ZW15c2xh
dy5raXRzemVsQGludGVsLmNvbT47IE1hbmlzaCBDaG9wcmEgPG1hbmlzaGNAbWFydmVsbC5jb20+
Ow0KPiBSYWh1bCBWZXJtYSA8cmFodWx2QG1hcnZlbGwuY29tPjsgR1ItTGludXgtTklDLURldkBt
YXJ2ZWxsLmNvbTsgU2hhaGVkDQo+IFNoYWlraCA8c2hzaGFpa2hAbWFydmVsbC5jb20+OyBTaW1v
biBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+Ow0KPiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmRtYUB2Z2VyLmtlcm5lbC5v
cmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgaW50ZWwtd2lyZWQtDQo+IGxhbkBs
aXN0cy5vc3Vvc2wub3JnOyBKb3NlZiBCYWNpayA8am9zZWZAdG94aWNwYW5kYS5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCBuZXQtbmV4dCB2MiAwNy8xMF0gZTEwMDBlOiB1c2UgcHNrYl9tYXlfcHVs
bCgpIGluIHRoZQ0KPiA4MjU3MS8yLzMgVFNPIHdvcmthcm91bmQNCj4gDQo+IGUxMDAwX3htaXRf
ZnJhbWUoKSB1c2VzIF9fcHNrYl9wdWxsX3RhaWwoKSB0byBwdWxsIHVwIHRvIDQgYnl0ZXMgb2YN
Cj4gcGF5bG9hZCBpbnRvIHRoZSBoZWFkIHdoZW4gdGhlIGhlYWQgaG9sZHMgb25seSB0aGUgVFNP
IGhlYWRlcnMuICBJdA0KPiBhbHJlYWR5IGNoZWNrcyB0aGUgcmVzdWx0LiAgU3dpdGNoIHRvIHBz
a2JfbWF5X3B1bGwoKSwgd2hpY2ggdGFrZXMgdGhlDQo+IGxlbmd0aCB0aGUgaGVhZCBzaG91bGQg
ZW5kIHVwIHdpdGggYW5kIGNoZWNrcyBpdCBhZ2FpbnN0IHRoZSBza2IsIHNvDQo+IHRoaXMgZHJp
dmVyIG5vIGxvbmdlciBjYWxscyBfX3Bza2JfcHVsbF90YWlsKCkgZGlyZWN0bHkuDQo+IA0KPiBB
c3Npc3RlZC1ieTogTExNDQo+IFNpZ25lZC1vZmYtYnk6IEpvc2VmIEJhY2lrIDxqb3NlZkB0b3hp
Y3BhbmRhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUv
bmV0ZGV2LmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50
ZWwvZTEwMDBlL25ldGRldi5jDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvZTEwMDBl
L25ldGRldi5jDQo+IGluZGV4IDg0NGYzMWFiMzdhZC4uZTIxNjg2OGUxNWNiIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUvbmV0ZGV2LmMNCj4gKysrIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvZTEwMDBlL25ldGRldi5jDQo+IEBAIC01ODU5LDgg
KzU4NTksOCBAQCBzdGF0aWMgbmV0ZGV2X3R4X3QgZTEwMDBfeG1pdF9mcmFtZShzdHJ1Y3Qgc2tf
YnVmZg0KPiAqc2tiLA0KPiAgCQkJdW5zaWduZWQgaW50IHB1bGxfc2l6ZTsNCj4gDQo+ICAJCQlw
dWxsX3NpemUgPSBtaW5fdCh1bnNpZ25lZCBpbnQsIDQsIHNrYi0+ZGF0YV9sZW4pOw0KPiAtCQkJ
aWYgKCFfX3Bza2JfcHVsbF90YWlsKHNrYiwgcHVsbF9zaXplKSkgew0KPiAtCQkJCWVfZXJyKCJf
X3Bza2JfcHVsbF90YWlsIGZhaWxlZC5cbiIpOw0KPiArCQkJaWYgKCFwc2tiX21heV9wdWxsKHNr
YiwgbGVuICsgcHVsbF9zaXplKSkgew0KPiArCQkJCWVfZXJyKCJwc2tiX21heV9wdWxsIGZhaWxl
ZC5cbiIpOw0KPiAgCQkJCWRldl9rZnJlZV9za2JfYW55KHNrYik7DQo+ICAJCQkJcmV0dXJuIE5F
VERFVl9UWF9PSzsNCj4gIAkJCX0NCj4gDQo+IC0tDQo+IDIuNTUuMA0KDQpSZXZpZXdlZC1ieTog
QWxla3NhbmRyIExva3Rpb25vdiA8YWxla3NhbmRyLmxva3Rpb25vdkBpbnRlbC5jb20+DQo=

