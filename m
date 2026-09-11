Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4339C79FA1
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 08:15:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415941.1645142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wPQ-0002jx-4T; Fri, 11 Sep 2026 08:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415941.1645142; Fri, 11 Sep 2026 08:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4wPQ-0002jq-1N; Fri, 11 Sep 2026 08:14:56 +0000
Received: by outflank-mailman (input) for mailman id 1415941;
 Fri, 11 Sep 2026 08:14:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1x4wPN-0002jd-OD
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 08:14:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4wPL-001TpH-AE
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:14:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa3b877-8faa-0a2a0a5109dd-0a2a4505bb5a-22
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:14:50 +0200
Received: from [52.101.228.130]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa3b878-4cb1-0a2a45050019-3465e4828361-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 10:14:50 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by TY4P286MB6426.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:14:45 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:14:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m89xnvwaSFmj/ZIKPZYPv4fWfhR236ZqAyg9xR3aDXn24LmOMTbyP1Qt0nNHXLz3M/NIqZmXxs6yW1TuOVJq2Va7rCBBBFk68aPWkFkiHQjDOx5i9ZsKjDdkqaavcsPvfAGgN07os2E+hkZO/MmP/Swkk1AOtEevL1XZGiuUkHBWB6OhjrPDdXVFsz3E0DTk0RQN+yDM0t0VpQt2IufPZRZ4hWlvddY8iDqo3S0oDBj1yUWg1oSDQ8Cdyw0comrTjWavPR9Z3oTJ8iOvb83fDi4qKlyjlI5WKcoLyPerxPOm24GN+gJCOavM6F3gBtM2rt1ITi4D5juMvqVFgVCkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/RdIz3FwChimoBZoyKFPw9Aj/VFpl/IZC7XOrK7vow=;
 b=nlvb8YcGoo9505vn3oGiLuAeMsOCJM5GAGgOItB9zBQl74RLwcek6e5IXPU6FA07PBp7RRdWqGjWVD+ijCXjHSmab0VfKLNFWMl4d4gBz/+jKzVGtABEOOwXZzMnU/vrIjm7w04peqom54hl9r4BkB86Jtdngif9HegKOOzT67YZiQkAEuwhENDZA7AVM81UiwEcaw1+JFsCNpojc6TiQkpyOh35tyovYjZi9lm6kWsiIbqkmJ0rWNAHKWMkIxmeeDu1ljCHjIrU5Vj1Lk+NUYFLlqji/GP4mGcAm05dqLJ5mSlMJtwbiVFTBdY89+L5k7CkHVrQ7meheiIUegTCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/RdIz3FwChimoBZoyKFPw9Aj/VFpl/IZC7XOrK7vow=;
 b=oOBZhKotnyLVvOfNTxZ8VeWX+DGGQrPTsZ2mOTn7C6yStZUrnGXvePIaSsqiQOAzSHNFtsfZDplwfx/YCSyOM/H39YEbl8GwTyb2t+BSJa8DqMIlKhPIMj3FAcAhsGxvzb7ByTfHuItvo2mdjZvEe+FoH1Zd7ucU2bcgzvD5MzM=
From: =?iso-2022-jp?B?GyRCMixLXBsoQiAbJEJOQ0ZzGyhC?= <okamoto@valinux.co.jp>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Hirokazu Takahashi <taka@valinux.co.jp>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on cmpxchg
 failure
Thread-Topic: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on cmpxchg
 failure
Thread-Index: AQHdQCJBEKmlsPmU00mRFpT1XSXe0LbF1F0AgAMw5Ro=
Date: Fri, 11 Sep 2026 08:14:45 +0000
Message-ID:
 <TYCP286MB105323785D7FE4C021C8B886E1BE2@TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM>
References: <20260909061253.546312-1-okamoto@valinux.co.jp>
 <a78545a9-a6e0-4591-9ead-2b11e2153d2f@xen.org>
In-Reply-To: <a78545a9-a6e0-4591-9ead-2b11e2153d2f@xen.org>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP286MB1053:EE_|TY4P286MB6426:EE_
x-ms-office365-filtering-correlation-id: 861255ed-ae05-4dae-6461-08df0fdcbd3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|23010399003|10070799003|366016|376014|6133799003|22082099003|18002099003|13003099007|8096899003|38070700021|56012099006|10067099003|4143699003;
x-microsoft-antispam-message-info:
 tx2wQF65NAUW2zpfjctv6+VN/HYwAxFmcldsmlDf7aXJkN6VPROzWEMidpwf70ayIs4o4tu7f3hC8B8HxZzii9JIYMSmgRATFTtgkf6BaXV+vUn/itTNFCn59aXSG607xAcPB5pmarxpbEasB3mx2ebVaHxrPy9ctWl9Q2fFDTQiTVJR++HDbr1qd+npdp5XfH3QnfRmCvTu4CS59FmQZV7LLvOX7EIFSz/ftOBMNGj3y0H3AwQ17WtR8E+SohXmS+eZSKbjuxgaspjXAoCLFQfZc9e2BQLFHP6B72dmRIhITpxeFeJmLUkI53km5mO7bFZuEL4fePgm1QB28dBMGaMzR30lOlU4peTFOrbUJX9pyaCjCP9CPb6ntV1Mn600bC0Ub3Vy3l6jm5Co6h9AgqLHqnm8+fqVVOzQUVOLSNReJ0hehV9QjlNQDgHd5TpwON5KVUvsbu9s+P0wQ+jKjmLIIpKxCQSSUpMsS0EuB8b8H5kGpeQWu0UMzk/gv4bZHXE3N1CUlUCoIjFBe4NNX5EPx59Omas9RT4EoTd7UnsrGKe6FJ1DH4j4QFeGiwZpyMTG23XL0SrpbrAcwZUlhaVgO1MjB+Jkeo8MicSf8LnCxmkExe7wlP/l0e4axndPzQmo68HE1CzMlEoz9xvJJ8OM2ZVUOijxVTdFjtt1jiE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(23010399003)(10070799003)(366016)(376014)(6133799003)(22082099003)(18002099003)(13003099007)(8096899003)(38070700021)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?V0JzZHJrSWM0aGV0NG1TWE4wZ09zU2dVcm9obDhheEdnN2tyUG1mUG0r?=
 =?iso-2022-jp?B?dGpBSW45OU54ZUFPaHhsK1lKWEsvMzNDT1ZwOE5seHVEY1IyNHhobjFB?=
 =?iso-2022-jp?B?ZmVhMWJzRzRidWN1NjlXTEx5eFVYTk5rNUZqNEk2YWladHBWNlBRR3lr?=
 =?iso-2022-jp?B?R3NyS2RVTWNZYVVmaFNuQkZFa1hkYTN4M3pjUEFLeTNUdmE2VkdBYU54?=
 =?iso-2022-jp?B?V24vZVBCN0Z5eUdKRDZTUVlKNStDb1JYdjFqQUdzRVBqck1Hc2ZxRlA4?=
 =?iso-2022-jp?B?ZjJJOTNPSGlkM0N2OWRONDBNWURDTng4anhUZisxTHEreG9xR3lWSk9a?=
 =?iso-2022-jp?B?SHQxNkE1MEZPZUNqKzFTYjlHZCtQNHphSjkxa1VvVGk2OW5sYTVDVUFj?=
 =?iso-2022-jp?B?dFB1QWNoeTNZaUpGeXg2Mll0NGJQbTZGa2JYNUJBTVlMd2NheEtkM0ZR?=
 =?iso-2022-jp?B?R0RUTkpyaVF3TkRsZWYvNmhuZk9mdnIweWJrUUJ6TEN5VkN3eERySUxD?=
 =?iso-2022-jp?B?NU44T3lTcFFqb0lqMDlvMnlPZkRyNExOUFJBZVVmOVc4NWZjbCswQXQr?=
 =?iso-2022-jp?B?NFQ1WmlPUGFFQ21GQXdJY1d2bUZZL0N0VXdFNzdxYmY3RXowSGZVSXpY?=
 =?iso-2022-jp?B?VVF5M1pjTXB0a0ZNa3RvanNQUU02Wlk1aHh1VlhpZEdpdFp6dVROZlFG?=
 =?iso-2022-jp?B?R0M4azU1RGtZZU8rc2VWdlM0STNmZW5uMVVBdXlnbWR2YzRrZld5enN2?=
 =?iso-2022-jp?B?QXFrcVBJK2VsS21mNWYxdjFpcUg5QzRKbW1QcnkwZldwaWU5ZWRGVHpt?=
 =?iso-2022-jp?B?bmFmS1NKY1BJMFV3UWlqNWhrWGNpS2RrL28wZTZyU0JES2krNFIvVU9o?=
 =?iso-2022-jp?B?N1FLVzhHU1dnOFJYSDYwVFVWYW0rQ1VLUFBmOXdBWEI2NDJGdmtPTXh5?=
 =?iso-2022-jp?B?L2tOaDFPbzlLVkRxcnJrVERvOEwyMW9BNnk2L2NnWTVDOERXcHFPNlJw?=
 =?iso-2022-jp?B?S0dvVGd3VWlPZkpaRm42VTFBWTlxY3VPdlJYaUU0VGF6Sk1GYm1KNWtC?=
 =?iso-2022-jp?B?Ky9rTU5rMURSWStEcEJZbHArdWJLWTZYbDRKRUR5aUlvdWFpTWRXUmZ5?=
 =?iso-2022-jp?B?VVVlRjFQR2QwdURaa3h3bEFKbVRKUHNsdjllM2lIWm16SDVFZjdDc3FT?=
 =?iso-2022-jp?B?UWQ0dUhKR0xUdkZUdkFTSHdEL2N4LzVNZFg4aE1Ed1AvQkEveiszUDM2?=
 =?iso-2022-jp?B?Q2d5N2xJcVlzd0ROdVF3ZXl5bzJoMjFJT21PdlVoa2EwWDN1QTkxVXox?=
 =?iso-2022-jp?B?UW9NZnNNaFBmbVA2ZG1IdkxXRHlhajJjdS8yMDVXRDI5QUI4Z1dEV0M0?=
 =?iso-2022-jp?B?NGE1K3pGUXFJQnJVdTcyYnV5b0pWSHd5OXc3K01pdlFHR1hoWXRaTlk2?=
 =?iso-2022-jp?B?WGFpVkRoT2lHcFlSSlJZcnFOcStJRnF1clVJYUxEaW9TY0ZwOWhpV0dY?=
 =?iso-2022-jp?B?QmZxY1A5dkRUaVVReDZQN2hzZGRCSkJXL2Q3V08xZHdZa1Mva3hubm1H?=
 =?iso-2022-jp?B?bFVVN01QTGFwdm40WTMvMERMdXFLOGpCc2dFRDhVcFVWeG04QWRjK0RN?=
 =?iso-2022-jp?B?TFRLZ25kdEplZ1dzY0hVWndFRzlRZU04eU1WRkUyUmNXN01ySlBGQzlU?=
 =?iso-2022-jp?B?aTV1MW1VTDZ4cHdPNlNDbEpTS1lONUtKOW4wbE5QcW1pa1dzenZid3Nk?=
 =?iso-2022-jp?B?c01QbUZ6aW5wUjl2VGNJYlc4WDBiR0liZWJOamdubFhwTWR2U3lkOEt3?=
 =?iso-2022-jp?B?MUk1TlJVNENHOFQwMTNrWExVYzJEeklBNWpFdUFOYmRObEx5QjV6ZGhy?=
 =?iso-2022-jp?B?SHhSNjAzZFovbG4rVlh4WlhwN0FrdlNTUDdkZFZ4dHlFZzcybVRicHdY?=
 =?iso-2022-jp?B?ZFFkU1h2T282WHBMbXNVTHJuaUVTZ3R4R0lHSnVuUHp0WFpZbXRBdDhp?=
 =?iso-2022-jp?B?N3BSYW1sWXVJK2l5cU1EZ2Y3OUU0S1NNQzNiU2ZzOEtIUVh0WHJrbXZ2?=
 =?iso-2022-jp?B?Y0pqN25rUnRrcDI0cmlDVE5UWThxQWg3WUFsdXNsbGdsNVJyTzg0Z0Rz?=
 =?iso-2022-jp?B?RFBTdVdMakRmcmxxZ2NRcXBEL0JkK1VwQVJFMGJaZXdjaFhESHA4dS9B?=
 =?iso-2022-jp?B?emhGQ3JQSkJ6MEdxTXE4dFk0b1haVVNHQTBkbzZ6V012TmFQTU9LSFlh?=
 =?iso-2022-jp?B?MitCQzQ4NkFqNW4xbjZCR29TaGN1ZWpWdnVHQldiZnU4ZWJQZ2JoQWh5?=
 =?iso-2022-jp?B?N3JRcVgvS0FoUGc1Q2JJK240NE93VS9jYUM3V3pwcm5ja3o5d25QQVpr?=
 =?iso-2022-jp?B?RzM1VmppNTcwa0VJZmRDMkwvZkhRVU1DdWt1N3o4VWVmaW5DNms5Wmgv?=
 =?iso-2022-jp?B?SzVPNjVScEdiek5hbk9GMG1yKy8wbFJpTW9aZmg0RDBNQjB2SWp3djZi?=
 =?iso-2022-jp?B?aCt5SmVmd05zeWYrMEhQcDZqSW50LzJvSC9HOE5ETC8rWFFOdEtXSkxm?=
 =?iso-2022-jp?B?UEM1YkhIaFN5QVRnbERRN0crNEc3QklBS21Rcg==?=
Content-Type: multipart/alternative;
	boundary="_000_TYCP286MB105323785D7FE4C021C8B886E1BE2TYCP286MB1053JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 861255ed-ae05-4dae-6461-08df0fdcbd3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 08:14:45.1746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3l2WvcmaCORjdjnvRxl5dWZ44xSf6lpDu1Ha/WrmXqxXhVwChhU27ASL/2VA7U5lhux5meS5Kr2GhA8S0VENhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6426
X-purgate-ID: tlsNG-c201ff/1789114490-251182A1-7920239D/0/0
X-purgate-type: clean
X-purgate-size: 9440

--_000_TYCP286MB105323785D7FE4C021C8B886E1BE2TYCP286MB1053JPNP_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

  *
The Xen atomics operations were originally taken from Linux. Looking at the=
 implementation there, I don't see a clrex on the failure path. Do you have=
 more details why we would want it?

Thanks for pointing this out.
I revisited the rationale for adding CLREX here, and I don't think there is=
 a sufficient reason for Xen to do so.
I found a rejected RFC^[1] in Linux in 2015 to add CLREX in atomic operatio=
ns. In that RFC, Linux arm maintainers said there is no need to add CLREX.
I also found a patch^[2] that makes LLVM emit CLREX on this path, with the =
rationale that keeping the monitor set might have a negative performance im=
pact on some microarchitectures. However, I have not been able to find conc=
rete microarchitecture-specific evidence or measurements demonstrating such=
 an impact.
Please consider this patch withdrawn.
Thanks for the review.
Regards,
Ryoji
[1] https://lore.kernel.org/linux-arm-kernel/1425016026-19766-1-git-send-em=
ail-bobby.prani@gmail.com/
[2] https://reviews.llvm.org/D13033

________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, September 9, 2026 16:10
To: =1B$B2,K\=1B(B =1B$BNCFs=1B(B <okamoto@valinux.co.jp>; xen-devel@lists.=
xenproject.org <xen-devel@lists.xenproject.org>
Cc: Hirokazu Takahashi <taka@valinux.co.jp>; Stefano Stabellini <sstabellin=
i@kernel.org>; Bertrand Marquis <bertrand.marquis@arm.com>; Michal Orzel <m=
ichal.orzel@amd.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on cmpxch=
g failure

Hi Ryoji,

On 09/09/2026 08:12, Ryoji Okamoto wrote:
> When the value comparison fails in atomic_cmpxchg, the code branches
> out without executing stxr, leaving the exclusive monitor in the
> exclusive state set by ldxr.
>
> Add `clrex` to the failure path to explicitly clear the exclusive
> monitor.

The Xen atomics operations were originally taken from Linux. Looking at
the implementation there, I don't see a clrex on the failure path. Do
you have more details why we would want it?

Also, if this is necessary on arm64, then we most likely we want the
same for the arm32 implementation (including __atomic_add_unless()).


Cheers,

--
Julien Grall


--_000_TYCP286MB105323785D7FE4C021C8B886E1BE2TYCP286MB1053JPNP_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_MSFontService, -apple-system, Roboto, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProo=
f">
Hi Julien,</div>
<ul style=3D"direction: ltr; margin-top: 0px; margin-bottom: 0px;" data-edi=
ting-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;unorderedStyl=
eType&quot;:4}">
<li style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Roboto=
, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(33, 33, 33); di=
rection: ltr; margin-top: 1em; margin-bottom: 1em; list-style-type: &quot;&=
#10146; &quot;;">
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;" class=
=3D"elementToProof" role=3D"presentation">
The Xen atomics operations were originally taken from Linux. Looking at the=
 implementation there, I don't see a clrex on the failure path. Do you have=
 more details why we would want it?</div>
</li></ul>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
Thanks for pointing this out.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
I revisited the rationale for adding CLREX here, and I don't think there is=
 a sufficient reason for Xen to do so.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
I found a rejected RFC^[1] in Linux in 2015 to add CLREX in atomic operatio=
ns. In that RFC, Linux arm maintainers said there is no need to add CLREX.<=
/div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
I also found a patch^[2] that makes LLVM emit CLREX on this path, with the =
rationale that keeping the monitor set might have a negative performance im=
pact on some microarchitectures. However, I have not been able to find conc=
rete microarchitecture-specific
 evidence or measurements demonstrating such an impact.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
Please consider this patch withdrawn.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
Thanks for the review.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
Regards,</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProof">
Ryoji</div>
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_MSFontService, -apple-system, Roboto, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProo=
f">
[1] <a href=3D"https://lore.kernel.org/linux-arm-kernel/1425016026-19766-1-=
git-send-email-bobby.prani@gmail.com/" id=3D"OWA38816b07-f007-67f7-33b4-9a3=
770943573" class=3D"OWAAutoLink">
https://lore.kernel.org/linux-arm-kernel/1425016026-19766-1-git-send-email-=
bobby.prani@gmail.com/</a></div>
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_MSFontService, -apple-system, Roboto, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(33, 33, 33);" class=3D"elementToProo=
f">
[2] <a href=3D"https://reviews.llvm.org/D13033" id=3D"OWAb2d51405-863d-8ab0=
-3ace-850112a957a7" class=3D"OWAAutoLink">
https://reviews.llvm.org/D13033</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Wednesday, September 9, 2026 16:10<br>
<b>To:</b> =1B$B2,K\=1B(B =1B$BNCFs=1B(B &lt;okamoto@valinux.co.jp&gt;; xen=
-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Cc:</b> Hirokazu Takahashi &lt;taka@valinux.co.jp&gt;; Stefano Stabellin=
i &lt;sstabellini@kernel.org&gt;; Bertrand Marquis &lt;bertrand.marquis@arm=
.com&gt;; Michal Orzel &lt;michal.orzel@amd.com&gt;; Volodymyr Babchuk &lt;=
Volodymyr_Babchuk@epam.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on=
 cmpxchg failure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Ryoji,<br>
<br>
On 09/09/2026 08:12, Ryoji Okamoto wrote:<br>
&gt; When the value comparison fails in atomic_cmpxchg, the code branches<b=
r>
&gt; out without executing stxr, leaving the exclusive monitor in the<br>
&gt; exclusive state set by ldxr.<br>
&gt; <br>
&gt; Add `clrex` to the failure path to explicitly clear the exclusive<br>
&gt; monitor.<br>
<br>
The Xen atomics operations were originally taken from Linux. Looking at <br=
>
the implementation there, I don't see a clrex on the failure path. Do <br>
you have more details why we would want it?<br>
<br>
Also, if this is necessary on arm64, then we most likely we want the <br>
same for the arm32 implementation (including __atomic_add_unless()).<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TYCP286MB105323785D7FE4C021C8B886E1BE2TYCP286MB1053JPNP_--

