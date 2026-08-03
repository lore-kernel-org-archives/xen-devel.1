Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9509FC55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 15:06:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381571.1625117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wquEg-0004Xm-Ty; Mon, 03 Aug 2026 15:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381571.1625117; Mon, 03 Aug 2026 15:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wquEg-0004Xf-R0; Mon, 03 Aug 2026 15:05:50 +0000
Received: by outflank-mailman (input) for mailman id 1381571;
 Mon, 03 Aug 2026 15:05:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wquEf-0004XG-9r
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 15:05:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wquEe-00C4tH-58
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 17:05:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a70ae3b-bab6-0a2a0a5309dd-0a2a4509e122-22
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:05:48 +0200
Received: from [40.93.196.34]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a70ae46-be1a-0a2a45090019-285dc4226f70-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:05:43 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH2PR03MB5237.namprd03.prod.outlook.com (2603:10b6:610:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Mon, 3 Aug
 2026 15:05:39 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 15:05:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E95kQb54/Up4zQNpaK2mkQPBjjPUTJKxWMfkPGvedy5hkuh4ZaEM79QZsq1e0xojCTuHDQuc2+CE1cgSVN914XR4hNvFL3j2NhSj1GqGqdP8Z8PKLP7+zVL5a1m44ba+azxb38Ceei9ITGeDOJh5eixA2muBWOlsz8RxLc+S7WF93BydMtKwZV+4ZTuJgZLV5OTeOkxak9utxnTmJUev9pqFwcMlVna1Zcpr9CZhDIrfw6K6732BZqeJOiFn0WkCXS0LgxrELdEN1kdT7njQxCw+ZsUzk6AWBtuVdXxUu8oOn/1og+fKlLY6jL863SPs1pCFKRLSxdBX9DLRCmjleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQhPrpdiWnaSoeNcNnfROBr+QPpTBnQIhAoLCjbz3l4=;
 b=R8Qlc3CZbKbCUWeHtkmzJue6ngci5xUrkSN20Km0BT/1YnQRYUPF8pxM/jfFnLAaYovCgxv4eqd0GbhSuNmRFNIL+I2ARRw0l3Km7p7e7DhQhWCekJfRm5njS/j2fMDCg6/4YSBMU4WzkMUdwLqkFsRhp6BSJQsTXsuwwWVL7EfS+49c7ZmfQoHevwqHKitvLbp/w+TFT9eW96Udfkvjhqd8OxyyMOj6G50PVC+If+XE2jXzjrDpK9KNIbOH1r+MN+YMHqJFthr6Agu6FQFbprBOTS2ghe34czD32SwRQ7WCGS84kDckjMZyxV31yw7sH+bfSAIABiOyWRisoEN7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQhPrpdiWnaSoeNcNnfROBr+QPpTBnQIhAoLCjbz3l4=;
 b=OgknMIp4lqkzxUxDuwHMe2cJvErdytH8BcEkxsqBrJP7Yj76RSX1Pu1xyurgyGhhMJqJiptWqRsWM5YYme4pSPpT4IEfjJBUOXVYQiHrLTI/iOQch/n5dJZ7DTkn4jutUg56RaTp956XNk9ijr+0KBR3a1pmECPXqdQo1uhqZM4=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 2/3] xen/livepatch: Fix include hierarchy
Thread-Topic: [PATCH v3 2/3] xen/livepatch: Fix include hierarchy
Thread-Index: AQHdIQOIBBx6uSDlKEqW+113k5excraMcI6S
Date: Mon, 3 Aug 2026 15:05:38 +0000
Message-ID:
 <CH8PR03MB82743C6A6E8BA056E17D4BC1F0D52@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20250509163212.2948359-3-andrew.cooper3@citrix.com>
 <20260731154447.436019-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260731154447.436019-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|CH2PR03MB5237:EE_
x-ms-office365-filtering-correlation-id: 5de7c475-6062-4b3a-5f55-08def170aded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|38070700021|56012099006|4143699003|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 qXEQmdSh8d1NRfnJEZ3a3PfDWNJ42M/Xjs6z2hiymcLT2PGzzmulK441LqcCBPZXLHkzAXcKgi4i022z7l9DCBV7WPgOKXYTLhFd+GaRkJ2YdKxFIzdxBaga/63v7OEow97pPFFMegha3yXwwVp/YhhuoojCGywuF3c5vU58vEBi1QRvqAiWl2K6sd3Vmb7Wa5F4V1Tn9JswO/hxnkxbGk1gGvGBQIi60NlhOITmb4vVsaSg+XAZiTtVAJuP4gsQ+rlmdtoVkc7wbVOFAtdT8BaxjpdZLRGWcwNCy3hqUUrJy9WcXWSyOgWlIlpFhYpClNVXVB7Se4yaG4lZtSTSDvJ7L4shM5wTbyklas4e21wNd64sPLgHEcJCHf09zq729TRf4/A74Okz6C9ZOJ3XAgR6t3EXutjHV5FXr1FycW0CWpSIRIP7pwuK5sEB4PPbvEbngYyBlq6G9oaw4RXYj2fVPo1t1fY35vlOX9RxQmyWs9bT/wJzv4wuJDEwu9VkYZchxfV3byIJksou+aIGuT9e1TvnqcpWO8OY12bDf+SHr+xWvVe7/U1fmtYApIG8cd/ftCFavpwlEv3fjKdSC60vqtNJTJkP5YyAbKh3mH0WErTsPnYsXZZlSo+8ytxds0zOIrfewYjlc2X5YjdwLTGJms9rWMl4fT0TS8daAsQovwHk+nkpXhZdc16lzR7Pg2Y+vCnbSDN/tamGqfFzMTT50P2dfNPmuFm9I6a0Cmw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ADouJoRp4rHWRrRdvY6mwBF3NQqcDvds3/9lMmltsL+03BGLsFtlgeEuyT?=
 =?iso-8859-1?Q?hRO4NVwuUOQ3HweveH2ELcOWIQdfJB7++Vv/mIXmy3D8Wfl7Df8r/fGfU+?=
 =?iso-8859-1?Q?L4MKaNk36DR7R9FK4NeCLGhpO13iY0V/Q7F1sjQhFthCt9tXgyNlc+Oe4B?=
 =?iso-8859-1?Q?m+EDri7iwo/WhqxcjNYYQlVqTfnQ7ni+iOQw0CED40wbGmbl3Wfuri9UCy?=
 =?iso-8859-1?Q?kunlp4wuTWFSgLES7qaSeITVDfjuzgglVx7zWJUcD/4yaY1Z3ZWdIEYZKH?=
 =?iso-8859-1?Q?IXFHcVgq8dpzCtD4CC1PUQ8NolzoDoSdnKZnfc2trcyyFvVFCyUzuEfzNu?=
 =?iso-8859-1?Q?Kfj2WTNgkmyV09v8A0S4JIUpNySSBp8zsJJ7nsV6/wsMtEgsNWwYMxp5uB?=
 =?iso-8859-1?Q?hu5MVVlHvAb8DwvHNyDuR+YLRa8SVAX65f+0r5Zplmt71jmGpqQstRDtjB?=
 =?iso-8859-1?Q?7RQb6uYG75Nan1Py/98EhXXb/cAZbxz0uTlHC4Oz8y8AzN/4eR6zZeAxGY?=
 =?iso-8859-1?Q?6wq97bG0n2XKqy/tmencgoWOWaGUZlDauGV+wZsf9yXFMPIn/MlXQYpmyh?=
 =?iso-8859-1?Q?xzqFMWnmCGLt8q5fjdpxj8lmcEXSl67dJso9+OO2V2kB/CkCXhfIBSJJug?=
 =?iso-8859-1?Q?fQXgJoe8fhZekHV6XtzkGO35XlEFR7Fnr3YAe6LUdvP/FK/tSYgE2JFY6b?=
 =?iso-8859-1?Q?fNHpo7P122r6TshYCTT3/4ITNvG+WcqYqwpJrisO6AJfdEKxS0KDcBt0+f?=
 =?iso-8859-1?Q?klnTH5a9Ghwzdt6jDXm5hRF8a1awifTW3ZYOmh0h5itzFBO0c/8XDHLpMQ?=
 =?iso-8859-1?Q?jj57/Z8PlNhAyrgAbOSpjBr0IE9ci2hIExKYBE+XEzb5BIKGw6Wtguqrem?=
 =?iso-8859-1?Q?8CL7M5iGzg++BdWyEiROaIIannFnmMGVHLChEctQmRevwW8zHttsWaDzxo?=
 =?iso-8859-1?Q?eTpI0snQhT/fcrPhkpYRnecjxQRoiUUwb3St/twthn+4VePa4QbHUPoyGY?=
 =?iso-8859-1?Q?os0WyYri8Wn9hRQhFVBpYpKamX+KaHSJ3oFfa/PhmersF/iVIUm+9cyCYh?=
 =?iso-8859-1?Q?Iudnr3FpHOhhg8kU11X1+bPpyjWOp1Dq/IxGNU/1Ao9SEC+POCK7juZ+4+?=
 =?iso-8859-1?Q?AQYS9DpfRdxPgJvXFgWjUWDZrn0Jsv8V+woNCrGst2Ybq41tAqfvRe5qWU?=
 =?iso-8859-1?Q?ORCxev2GiAIz5fPQ3CfImSTDXxO5C9LwTGOlVTE5CVcKVlqdW9iPqnRD+4?=
 =?iso-8859-1?Q?d06il8Cg00KN91v02kLnYG4BMIvKXWF0aTnRS8A1bRPoJ9krfySs0t5dsu?=
 =?iso-8859-1?Q?ESag7/Rx1MCKEMu1WqgNnt0BSRJrquWOjRYSBHSHls66nasVPmLrYCtA+i?=
 =?iso-8859-1?Q?fNswKPzgp0NjJhYgNYtNGhPgejyx5LeyPeKk3wd8R3HN1WvAweci+/vQ2V?=
 =?iso-8859-1?Q?bKlm0qslnQEafCM1GzVIpf2jBoyJoQ4BZ0Qn32s//NczCP8+9WDpl7yXFF?=
 =?iso-8859-1?Q?XdYPYMsF6jO4S4VLZc4NyZN30pUMIf79pzw3dYi4z/l/gfQEG2HvYXOxKr?=
 =?iso-8859-1?Q?sD/BLZ0V9NLiXh6YyaGHRnyttxxP08VI5IjTpyR5nSbKeQpAjEJ1baDWio?=
 =?iso-8859-1?Q?J9PJdT2vsgoaffgWK4k0kQ4kWOSRc8bBHkQeXECzCoFnhDMjXG9w2a9F1F?=
 =?iso-8859-1?Q?+M66UlVmRSH0IYsDqBtp7GgtBlFYise0S+qUIiyfPEh3BtRyq0a8NNtnUK?=
 =?iso-8859-1?Q?5PZx470mU2fhS4zixlFMMXDtBZkaWtlAmGsb/P2OGbyGJiSCBOVL2wDf2q?=
 =?iso-8859-1?Q?i/etsI5+hQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de7c475-6062-4b3a-5f55-08def170aded
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 15:05:38.9750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rgO7HR7Lx9DwX9eRF35xCNin+Pc3FYVmQC3lpd7f2EwsW9npgwtddVUFoMUQcZBM/4ZyepAl73wwkf3cvEdTZ9tlDB7bOxaQWpSnxCzm9kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237
X-purgate-ID: tlsNG-bad1c0/1785769544-39AC0034-D83E6303/0/0
X-purgate-type: clean
X-purgate-size: 808

> From: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Friday, July 31, 2026 4:44 PM=0A=
> To: Xen-devel=0A=
> Cc: Andrew Cooper; Anthony PERARD; Michal Orzel; Jan Beulich; Julien Gral=
l; Roger Pau Monn=E9; Stefano Stabellini; Volodymyr Babchuk; Bertrand Marqu=
is; Oleksii Kurochko; Ross Lagerwall=0A=
> Subject: [PATCH v3 2/3] xen/livepatch: Fix include hierarchy=0A=
> =0A=
> xen/livepatch.h includes public/sysctl.h twice, which can be deduplicated=
, and=0A=
> includes asm/livepatch.h meaning that each livepatch.c does not need to=
=0A=
> include both.=0A=
> =0A=
> Comment the #else and #endif cases to aid legibility.=0A=
> =0A=
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
=0A=
Thanks=

