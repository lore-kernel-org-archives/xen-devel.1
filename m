Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B9C606A33B
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bQnDclKf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FlG2ypbQ
Received: from list by lists.xenproject.org with outflank-mailman.1498545.1696228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWlJ-00071x-6M; Fri, 20 Nov 2026 22:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498545.1696228; Fri, 20 Nov 2026 22:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWlJ-00071q-34; Fri, 20 Nov 2026 22:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1498545;
 Fri, 20 Nov 2026 22:07:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rick.p.edgecombe@intel.com>) id 1xUWlH-00071k-HD
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 22:07:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUWlG-00GjTl-MQ
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 23:07:14 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rick.p.edgecombe@intel.com>)
 id 6b00c47f-2eae-0a2a0a5409dd-0a2a4502ed62-12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 23:07:13 +0100
Received: from [198.175.65.20] (helo=mgamail.intel.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rick.p.edgecombe@intel.com>)
 id 6b00c48e-4900-0a2a45020019-c6af4114cf7a-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 23:07:12 +0100
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 14:07:09 -0800
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 14:07:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 14:07:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 14:07:09 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 14:07:08 -0800
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by DM4PR11MB6119.namprd11.prod.outlook.com
 (2603:10b6:8:b0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 22:06:58 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 22:06:58 +0000
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
  t=1795212432; x=1826748432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j6BW9So5iU26l3P6rzikNwUbKVw0vv5K3GCUle3XnEM=;
  b=bQnDclKfWL7rrbYhyC6aKvae/t2PoXNHlEuzSMk1cwwwTkmVfpyKqN5N
   aUv+02/eH6JfO1jjGftn+6F68ykb4trcrWO/lW+I7xhmHKNcnn/LTBU8R
   wzLHhog6P8yvJQFAKnzPKAxwMasQj++RjqjK2QhvgydvBN1b0p3nUZWCD
   LVDsjOTCGszCJqrKYTAyusIibSCqxlWcpAFWGzSSH9NYAyh1JBT+xJeWL
   U319LuII+6EL1b158wb4I8o2kXtvAmjyj7mArlePaNF4b+jFrfTX233OL
   /BK8ACsicPuKebU5hmOut80aeIl+8JR3xj86767JoynXx9yzibolQELxm
   A==;
X-CSE-ConnectionGUID: zjKzt27GQ7udCybc2WeM8A==
X-CSE-MsgGUID: rjPbO7pxTI2it1lQon3UjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4141162"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4141162"
X-CSE-ConnectionGUID: daqb9M6rQNyZ2lytkNwahg==
X-CSE-MsgGUID: Wg+U91bESCKoJfdJJMi0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11092928"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pq3JHCWONzwXCVJgKOFdgpmJD0QH7HQrVnkHU7jXyHM233h4Gaeq8En3B0rcO6y2uMJ2dfPelvi+A54eWiKI8lgt2hERu92VMAQPzl4S05lU2F5GL9O18raLQe4H9vk5v4WL7S05Yc9NSv/pjA6w08JXU1ABb0ABCzo8nT48b2kM6NNCOGGSGvJm2mBr2+ARy0pnbflpaiByctsnTzZkoHcYyhVR1mTEGxkvk1FdpBLsyroi+focuf8R+HmMpRVfZdRwV0yH8Gl+1H8IuuURhrJZXT0H/ItWnlAR93uHh9zOX2wsWdC1RmuTJdLOjoxkQ0ak3SO6iZB1FsbwDIXidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6BW9So5iU26l3P6rzikNwUbKVw0vv5K3GCUle3XnEM=;
 b=RUn9Hl0RmCbwesmiRvWH1nCchz+1Y6JG0hOHENormzXvvoVhrzIZazBQC7ry8A3RtRdcV4Odv3X5/F5ATTu2wYc60ktVctv930BXsjvHlC/frn0pBaA4tPM7gPm52upxYAVvIZd/CaR/yVvXJxcq2Vf+ds8VbAUZYkbYCbtcDPiqENt4or5XGF2ZYuW+JV0RGPl0SA0fPHCSQ35C/7QtEsd51M5pyGY06oEUNyA4Vp3uw+GWkZitPc5KlwO9LMvspYty2jaQ35mg0eyXRTjuCuOj/GEy0krmt5zk2gT47MsViz6DNOhrnem1urJWpC6oRfI/nTU0uVdxNk1SkjgpEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6BW9So5iU26l3P6rzikNwUbKVw0vv5K3GCUle3XnEM=;
 b=FlG2ypbQ8KP3D5h+4Jk6K+cM+wjBAh6i+m4vaetqBeda+Z2z+7meKEl4lnkdZXbhbv7xckW3xbuh5T6bBjmQ8XyBQTaBc2S5t5Q3C7uXCkLqc7vBfaeneN6zGvuJWqqUdShs2bBGfJZkvZk1Y+Y10D/yQlKyn23LDL3xR8DdwWQ=
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "haoxiang_li2024@163.com" <haoxiang_li2024@163.com>
CC: "Ostrovsky, Boris" <boris.ostrovsky@oracle.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "david.vrabel@citrix.com"
	<david.vrabel@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"jgross@suse.com" <jgross@suse.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
Thread-Topic: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
Thread-Index: AQHdeHw6R1wLhKDc+Uq86658gggvibc2duyAgAEPBoA=
Date: Fri, 20 Nov 2026 22:06:58 +0000
Message-ID: <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
	 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
	 <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
In-Reply-To: <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|DM4PR11MB6119:EE_
x-ms-office365-filtering-correlation-id: 1c681ce3-84ab-403f-bde5-08df47529874
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|261026121527099003|261026140227099003|261022075727099003|261028144727099003|261022113327099003|261022105027099003|261021121427099003|261102123227099003|38070700021|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: okWRixjeqZoUQ7hQNJ2FwscfGbtqJ9cCEU+jH6OfO1G8F7w6vJruqXL9zhQsOWXz8MDRRDuLmk30NhBXT960353lF88jf06gdnDx0B3rZtbTRHxtj1vahD1m7x1jQtaObYGqB4thFUduvV6R37WR4x4jZYozGq46GHIUCLr4YZNzBfykuLluJ1yDbnXI4cueewCPTaVaYZkKrNWAxFIHI9L/6spidBQr/kioOVLDnbqBGl0cthYgx2O1jghsiPzCObzhCLpx8/8d3l43kQZtGcVOvVu2NUlM2IE8B+AyCGvrIEVNsYI8BJD/3EofnRn5RXbRBv3x5EMURWSBFUjsVQm9Hj14Bb3A6L9rXrlFkOGlmFeZw8i3T2IZ+b+53Sv01fi0xN/LXFk40btnOLwSM+7Xnt3mTXG2Di1Oge1wGpJ6JpmjNV7X6qO+O6mnu7rWEoKbzB+DnMZYU+fH3Oq4p2sYUK7nIxqqb0cT1vf2OsvYmzH+JcyRpaaktHPGsyB3s8nHhnkITexAxytOK8xDORnu9uWF+/RXVQa8TEbbtsqEbEpNAlmRUy4UUlQ3hqpQ9KtYRg2utk5DgSJm1MGUF6CMWQjs/ww1SGMOdK+Tm5wRhucgAStnBXVkNE8bC00oepK06lgX0E0ntbUnJlo+AfO+hZ3aEDTl1YF9WVxdG3uAi59qVU6koc0QDX9GXHH9vet5nhOq9ITkR/4VcIkoPjXjhkwa0pSgcIIHDfwsY5k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(261026121527099003)(261026140227099003)(261022075727099003)(261028144727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261102123227099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STZMSHo3MWJDNjEvbGF5U0V6UHRVU1JMb1hPSmJaSkdaamE2ZW9qL3h5K1Ru?=
 =?utf-8?B?SExXQllycHd0UFhCakEvdGtCQnVpUVh6OGRadUp4RlhSVndsZDYzblhsOE1W?=
 =?utf-8?B?YVpvcUE1dVZ4SzJwVTVONWNEYTJZbzJLeEFuLzI1MUVQdHpFdEI1RCtaTElJ?=
 =?utf-8?B?M2YxbjBHSTRoekM4WFA3UWg2WGk0L0w3cFhkdmpwMUJORzVMQ1JaSURFQ1ZJ?=
 =?utf-8?B?b1V2QXBHV3Z5ejk5VVRnSjcwRTBzdVdBREluUmhIMVlpeXlBSkdJSUEyUWVi?=
 =?utf-8?B?emNpeVJsSzdMNlhkTitOMTRqRDBpekVLeU1HTkVlZXgzWWtoTmZXeCtVM2Vo?=
 =?utf-8?B?YnJ4TkltaG55U2kwLzliY29VTlRmL2RqL3Y3bGtHTjd3L1N2bVZGREtleUh5?=
 =?utf-8?B?Sm9hTzZ0Q3RkOE9KUHcrVmdkbDRlSWNiakZhWElJZkFnNHpsL1BGZFZYM1Vp?=
 =?utf-8?B?Ny9uazRXNG1mdG9McG5RVFFwNXJQa29pZEJxZCt2OE0zUC9OdVg2cEN6TFpO?=
 =?utf-8?B?dFdldlBVbER3eU9WMDJmbS81d1E2WmRMR1c0dU5heE1kYkx4L2JyaEltLzFM?=
 =?utf-8?B?K3JESk5CTk1sUW1vN3hJTlhnUGlFYkh6d2JwMUdaOE84VVJwUmFVRXZveDh4?=
 =?utf-8?B?MVc1UVFzUmVsZTNHZ205eFFHUG0zWDJBaGxxL0ZXTjRGeUZBdEJqRlFZZlF4?=
 =?utf-8?B?MnJReUVXc0gxM0JpVG1JSFhRbVVINzBQZW1PZ1ZtTm1hUnBjL3p6dmh5dWcy?=
 =?utf-8?B?cEhqYkZrUmdGWTlBbFVRYkc2QjNqS01oVFhtcHZEU1ZJSzlEQlJCUDhXK09i?=
 =?utf-8?B?VmZyM0JhV1FzbzgrVmVuVFBIMXh2UFluVmI3c0RHSDI5TG9oeU5aNFlHdjlW?=
 =?utf-8?B?VXUxUEZsQWltQ3V0SzlxcHhqbzQzS0FmNU1nVi9TNDJPeXhBOGhhYXpHb3h4?=
 =?utf-8?B?cFIwRkxEUFNMSFhZMWQvMk44ejl1K2t4Qm05WkVFOE5xR1ZIcUFkQ3NtMDZO?=
 =?utf-8?B?dnNrTFk1Zjc1bzUyODE4eDB5bWJLb2gzK2FFZXpBSWp0Z3g3Uk45TFlXbmw4?=
 =?utf-8?B?SDNpaVlSWlQ5OTRIWnJIcHZycHFXbnB0Ukx1c1NjUGovOFVnT2FKb2t2aUQ0?=
 =?utf-8?B?d0JzSzJ0dWNiNUdTbEJHWTl0VXc4N2pEOWozTjZ4aDNSelN2b1djeS9XMUtZ?=
 =?utf-8?B?b2dqY0pxb05CcHBsTGN3N3Z4KzFMYkkycUhKZFViV3FLemk1bzFvdW5VeG9V?=
 =?utf-8?B?VVhhbmk1bTdiTVVCSkRFZnV4cDJpSk5HTEhNQi9tNW9mMXdIZkpoc2lOTk1R?=
 =?utf-8?B?OTVhTkkyWHludmZWbXJmS3pNNStXMVlHT2dNVGJSWWNKNnlwSWVsRDJzUGlK?=
 =?utf-8?B?VHorckppRytmS0ozL2dFN0E3ais0S2NsZGYwY2N6VHQyT0tRZm8vSmdqdVNS?=
 =?utf-8?B?MytmekxOZlZmSEhsS2s5MERhVWZIRExweWg3dlVSd1lnQXZKMG5YRjRwTWFB?=
 =?utf-8?B?UXdSVEhyc1VYSklGdHZTejdMczJtUTB4OVJIUWVFemZudXB0VmpGZFVHMWto?=
 =?utf-8?B?ekJHWnFwbnZ5MjR6aFpSc29MOXBDQ3o0ZDlmejRhQkdXTjNtL29SRVRlcm14?=
 =?utf-8?B?d1VXUjUwc0V1Vm1URVhoQWs2RU1TenJnYUptQVFsZHFsLzlIUGxwNG5naURE?=
 =?utf-8?B?eWUxMjkxOXVMTWRrVkhCNVF4cERpVzVGVWhrOGtNOVVhMzBPQmlUdFVwZXFm?=
 =?utf-8?B?cmRIQmFMeEE1em03ay9yaGZnaWQ5TmxsL05Ba2pSWVdCU0grQ3dvYjYwVW96?=
 =?utf-8?B?aGtucHFhUFF2M1E2akNDNUxIbVVBUkd6elVsUGRiVGJCanRzN0hXNGRyRThM?=
 =?utf-8?B?ekloYVI4c09YUkVOL2Exb2psdlNtdWM0cVBURVd2RDU3R3VvMFk2bDVEajM3?=
 =?utf-8?B?b25pNU1kUjlCZDRWajRtTy94TXkxYVJUdkYyTnExVXJ5ZkExRmw0NG9Fbkgx?=
 =?utf-8?B?V2h1Y1MyNGw3aFpDd003K08vZTVkSnRFT0VzMmkzOGViM0FyMXlRWjlUZUdv?=
 =?utf-8?B?ZXhHZ0p2UXZBb2ppcFRiSmQ3VUZpQzFYMUYyOVVBZVhYcmtjRkRweXdjNmIz?=
 =?utf-8?B?WGRzSCtYdUlua25hVmJBSUoxYm1LeFVZU0p1bUZ1V2VYZDRNTE1NWUdvNnB3?=
 =?utf-8?B?QUI1SzViOEs4UG0zL0NURitJM3JxQ2gwODhkL2YraW1BbFM3Umx5Z0RCQU5r?=
 =?utf-8?B?RHM0Z0RYWnlwZ0o3V1Ivbi8yS2l0NnB4K0pYOW9VQW51Ykxta1A4L29qalVX?=
 =?utf-8?B?Z0lkMmFHL2tpQjhDckp2QTIzUnE1VjVxVGE0R2g4MURjcTQvZHJoWHZVS1lC?=
 =?utf-8?Q?CdfQjFnDUHIGrZwE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9A96368F55B2543AC6258FF3138556E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nyfT6lvHMFNhBzm4R+CpmtWULDIJIqR5HNBJOTpHWD5zXuUm4B6qtJTOVVLoqpEe+9czxd93ruFhAk45CRVErzS9y4T41KArjgfHdIUDbkRdvAT5jkxDeuB9GwZeC7y2+sorG5KnSJFLKAM+AVs5S5P3CnqX9O4Pln4Vjml8laz4MKHdHYKV8vUZbwhccRwWXq5smMYPwuFsl9ALac1jOhY39RbQVUw0YHwP53eSo9NBBxyY73mL6wCpT/Yq8p8smQ/k4SJbS/IFlxrg55QgfFItPJVUHFhJAk+o1ArAv48d43kID1156b0T9GAUY1WV2IO1zVExZXloyVx50kn2bg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c681ce3-84ab-403f-bde5-08df47529874
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 22:06:58.0459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tG9VYAWaoQNpoK9DbVNaURp2Bk7gXcQLY3+GotgYcmsk73UrZWZgFgdYGu6P+eXVeMKDvQW/GWn7UOn5r7k9/Gz/DFPZhFj7RMPQJM8eWS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
X-OriginatorOrg: intel.com
X-purgate-ID: tlsNG-720697/1795212433-F27956C6-5CA949B4/0/0
X-purgate-type: clean
X-purgate-size: 1864
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTExLTIwIGF0IDEzOjU2ICswODAwLCBIYW94aWFuZyBMaSB3cm90ZToNCj4g
DQo+IEF0IDIwMjYtMTEtMjAgMDc6MTg6MDMsICJFZGdlY29tYmUsIFJpY2sgUCIgPHJpY2sucC5l
ZGdlY29tYmVAaW50ZWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiBJZiB0aGUgUFYgZ3Vlc3QgaGl0
cyB0aGlzIHNjZW5hcmlvIGNhbiBpdCBzdXJ2aXZlPyBJIGRvbid0IGtub3cgeGVuIHB2IHZlcnkN
Cj4gPiB3ZWxsLiBEb2VzIHRoaXMgbWVhbnMgdGhhdCB0aGUgUFYgZ3Vlc3QgaGFzIG5vIGRpc2sg
b3IgbmV0d29yay4gSWYgc28sIHRoZSB1c2VyDQo+ID4gaXMgcHJvYmFibHkgbm90IGNvbmNlcm5l
ZCB3aXRoIGEgb25lIHRpbWUgbWVtb3J5IGxlYWsuDQo+IA0KPiBUaGFua3MgZm9yIHJhaXNpbmcg
dGhpcy4gSSB0ZXN0ZWQgYW4geDg2LTY0IFBWIERvbTAgdW5kZXIgWGVuIDQuMTcuNyBpbiBRRU1V
LA0KPiB1c2luZyBhdGFfcGlpeCBmb3Igc3RvcmFnZSBhbmQgZTEwMDAgZm9yIG5ldHdvcmtpbmcu
DQoNCkFoIG9rLCBpbiBkb20wLiAobm90IHhlbiBwZXJzb24gaGVyZSkNCg0KPiANCj4gSSBpbmpl
Y3RlZCAtRU5PTUVNIGltbWVkaWF0ZWx5IGJlZm9yZSB0aGUgaW5pdGlhbCBNRk4tYXJyYXkgYWxs
b2NhdGlvbiBpbg0KPiBnbnR0YWJfbWFwKCksIGFmdGVyIGFyY2hfZ250dGFiX2luaXQoKSBoYWQg
c3VjY2VlZGVkLiBXaXRoIGFuZCB3aXRob3V0IHRoZQ0KPiBwYXRjaCwgZ250dGFiX2luaXQoKSBy
ZXR1cm5lZCAtRU5PREVWLCBidXQgRG9tMCBzdGlsbCBib290ZWQgdG8gdXNlcnNwYWNlLg0KPiBJ
biBib3RoIGNhc2VzLCBkaXNrIEkvTyB3b3JrZWQsIGFuZCB0aGUgbmV0d29yayBpbnRlcmZhY2Ug
Y291bGQgcmVhY2ggdGhlDQo+IFFFTVUgZ2F0ZXdheS4NCj4gDQo+IEhvd2V2ZXIsIEkgYWdyZWUg
dGhhdCB0aGlzIGlzIGEgb25lLXRpbWUgbGVhayB3aXRoIGxpbWl0ZWQgaW1wYWN0LiBJIGhhdmUg
bm90DQo+IGRlbW9uc3RyYXRlZCBhbnkgZnVydGhlciB1c2VyLXZpc2libGUgY29uc2VxdWVuY2Vz
IGZyb20gdGhlIGxlYWsuDQoNCk5vdCB0aGF0IGl0J3MgaW1wb3NzaWJsZSwgYnV0IGF0IGJvb3Qg
d2UgY291bGQgZXhwZWN0IGFsbG9jYXRpb25zIHRvIGJlIGxlc3MNCmxpa2VseSB0byBmYWlsLg0K
DQpJIGd1ZXNzIHNpbmNlIHlvdSBpbmplY3RlZCB0aGUgZXJyb3IgeW91IGRpZG4ndCBoaXQgdGhp
cyBpbiBwcmFjdGljZT8gSWYgc28sIEknZA0KdGhpbmsgdGhpcyB3b3VsZCBiZSBhIHByZXR0eSBs
b3cgcHJpb3JpdHkgZml4LiBUaGUgY29tYm8gb2YgcmFyZSBzY2VuYXJpbyBhbmQNCmNsb3NlIHRv
IHplcm8gdXNlciBpbXBhY3QuIEZpbmUgdG8gYmUgY29ycmVjdGVkIHRob3VnaC4NCg==

