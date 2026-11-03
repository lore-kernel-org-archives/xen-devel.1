Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C180860A2620
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=m1oh/e4L
Received: from list by lists.xenproject.org with outflank-mailman.1469490.1678294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBwu-0005xU-2l; Tue, 03 Nov 2026 10:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469490.1678294; Tue, 03 Nov 2026 10:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBwt-0005xN-W4; Tue, 03 Nov 2026 10:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1469490;
 Tue, 03 Nov 2026 10:41:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOBwt-0005xH-0D
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:41:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBws-00Cksk-D2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:41:02 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae9ba3a-bab6-0a2a0a5309dd-0a2a450ae746-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:41:02 +0100
Received: from [52.101.53.10]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae9ba3d-f2d2-0a2a450a0019-3465350a47bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:41:02 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5162.namprd03.prod.outlook.com (2603:10b6:5:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 10:40:57 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:40:57 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iup20RY6QR0osruMsEU3LEMQcmUGY59PF7JtlGAxc00yLAzSJ8K2fUUJo4RjtLL0PpEPzE03f20Wu2Y8HcXukmIStznPI0/jgwxeMVYcfHdUhZ8xfntblanMoopIptVpAgtu8IqBQaVQLJrCLYVWHGjNcIEKco6NbyG+H/kNPRGdRnnLD2wFrlqxZSzm+/5Byz+IkqjSTmEhOFnA6bnhQVdTBa2nmheqlVlgzdj/9CF+A+3vhwu1h7k7Bj2FjdLBqsvYLALXz6WAh7w+iCDVbmLFWY6oAPK7UQu8Yi5zdBgvH5RFFTIritycM01PG3CzzBEozH8WFiCH1aWZ/uXCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+rp+HkKiDpQ5odofpqzqWLGV+f0zTyHKKGfhBYkjPg=;
 b=wGs4Ly3DU+AVMHHduHuIjjbyQJ/9HaiGY0OpNjjrDdIhJKtSFjhARt9rfUPUjARRFxNP3FU+TJXSDbkcQtQMVTRcjF+CUrrrZHOacc+nuxQNaZVNbTRPjLnA7KsaL3O2q+FwSZ02Krn48TlZ1sPu9PB1P59yMLul0rAnAH9OOppSy2jp5d0LSoLV/MHre9K6GG5V2dgWYtTgBV6NanTis7ja+EK5H2vz4jB8cZzQ4Dt5zMiZKnOCuw3SP7+orexlDE+8r3K3pfw/ceNmhwEOKw9G0EUr5mAWvJIWpsxKInOaKd98Nu1/xxqhTRlX9EXJ/oEmYTJI4S0EiGcq7TOdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+rp+HkKiDpQ5odofpqzqWLGV+f0zTyHKKGfhBYkjPg=;
 b=m1oh/e4LxYFS02316b0VwnhvqCV78T4iR8ivqHOK7UoBVzu9K31X8K1AS9/ONB8nGg9Dnpde4HhdujN9xuZXpmTLCpemwb3OynlLSyoKmKV8oIkS9DFzAChQzz+stIxpCt88iG+M/ZS7sIQ0xatfHsgay4PP9lQGMSv2FhMX3jM=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?Windows-1252?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
Thread-Topic: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
Thread-Index: AQHdatCVxv5aMy5E3UirptM0GAVt0LcazasAgAAmNnyAACMIgIAAJnmAgADnBks=
Date: Tue, 3 Nov 2026 10:40:57 +0000
Message-ID:
 <CH8PR03MB82745557CA485A491C494626F0692@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
 <0c81f171-7ffc-4a59-8f9e-69ad27371b96@citrix.com>
 <CH8PR03MB82743DC59D48A031251F71AAF06A2@CH8PR03MB8274.namprd03.prod.outlook.com>
 <7021681a-277a-4b40-9963-74e55dde35af@citrix.com>
 <e499efd0-453c-4885-9e7a-388f21e45da1@citrix.com>
In-Reply-To: <e499efd0-453c-4885-9e7a-388f21e45da1@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|DM6PR03MB5162:EE_
x-ms-office365-filtering-correlation-id: 0781ce06-2a18-483a-2979-08df3996f1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|4143699003|5023799004|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261102123227099003|261021121427099003|261028144727099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 48XHy6+ru2eVv8UFK+Ss370TQtZ4duzAdQwVfTqcaHbrUOOx/Tn4dvhD/2P4G4vYZNjDFqORxZlvGZtUshBu2phE+d7yU75ctZm0Ebl8ARiLhGamlSnlf6jwDyXke+CLATAxHO8KYBX6xxe+MGOwlN7zE0z1gK+VDayKzuLRoBSa40mEalnRs3NAWcgoLfBpUGJLEg8TBwOWPCbWH1LX1Fn9X3RKTjK3bIrV3l57PpQ3OXRLzg/JZWMfk8rZmHL/Erftk1Zgb/febrjgz9eVWwPCy/6V8Dd8FsPvKO6dq8paFgzwNwExOG/t8tzoW8JJigOdOAwn120OkO/tXQGKpzhXs0c785246T7nG/uF1O0irUGWSU062+N2VOu1nrCZSE22IdBgvTCU1LxfNztw8fhkpBLG/B4C9Sphl9xT4K+WqxzMwAfxdeGWtTljlIC2hQEU22xjKsHFkLOSb3NQkFXobGrRIRDoLl777oUcaLsoYbF27cZE+LwQteONVY+8KRATUIW2QlwEJUjiGBuZa0SvtRHjTGyXmSwHqhIkrBEF7/VmbaEE/KcO8lZo+C7bF5EbjhUdIJ8ODg/DGjhWMpcWn1GzPQQHCNOTcflp/DuUNqG/e91Reh6PHYtC4+Z1lCp4AllTPB5vh7y+oeXU/fGaidcZ9QLLSRoltaE1G+nt5eOpyd55aqx5sNL/WJLX84cw/hMcYR5cF6cC8Nt0ZXfYVR3YueJkqE18cgRX9Bc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?NE7ciHerTZXdNPG3zXZ+a1oRT6jCOgTeYLjm7h+dQ25CeQduKsyLw0bG?=
 =?Windows-1252?Q?UgUY98kVKMWQ1HtziSANDs8kD9PBNbc2ntO4O8jkRPilw5i2yK+v9evr?=
 =?Windows-1252?Q?VYc8c7/6ftcHdQqTPtRpaw0iFAY7dRtoR9T94hWlo4HfKfs2ldhGFAoo?=
 =?Windows-1252?Q?Ik3ODfJNfMTtBQf3XRxEiiRdkS3eGInNibuJSdU1MJqR0NFyO76qQjY7?=
 =?Windows-1252?Q?a+b1lZ5+zNUi6UNO558wtoI7foQ4Os6FApmuzpHmyiD6LzehYawddWqC?=
 =?Windows-1252?Q?oYgPTeeGz9WL5nWW7cTo7OqW266bm2T1wYdPB+k8+atGXwyYoDycOz20?=
 =?Windows-1252?Q?qEphJ8rk2j/ukJ/ypp3RYvm/YPHC4F0aDC1lwG3B2ebWHKdgK1J3QAqf?=
 =?Windows-1252?Q?qZDmoKPaXV2tLerKQ+p/KkIzZ+nwzMhD34r3sz8BWm1oiQ+ASPs3Jqxt?=
 =?Windows-1252?Q?FWkCOrWoSYu/xK75xWb86v1OXqwdx4gOc4lffZnCn7H5WOqGiDnIc7LB?=
 =?Windows-1252?Q?EUzVAWEHEIZgkf5Qjy28b2RK2+ltf4g8l0WDOZT92M4HUaRKJVeZsKN8?=
 =?Windows-1252?Q?MZ2VXUMWQH75vCoN6HE/F5D6Hy0nk2IeTo/l3mrHHjxY2irZJ93bSDD8?=
 =?Windows-1252?Q?rwNS1zgg8xnG6Y7+6TUlu2igDsjpFZsYfdaoWqPyDOnmojnJYHDuJxhX?=
 =?Windows-1252?Q?I1b0+eYfpPUOmzgyAy3KHG/II1SMzFWdKqaSyWRRk1+TkuaZb6GPV9XR?=
 =?Windows-1252?Q?nkbCLkrFxcG16M074Yv3SuNYiqTYFetFZhjjnq019ApdAYBBKY80hgOP?=
 =?Windows-1252?Q?dBuBfM6MxctmbR+bqsBwy/FFDEt91UGivS/KmdGGh66dlriaON5XDKVH?=
 =?Windows-1252?Q?6W56vRtwBJypKA5pNysrcWSAfct9kCKsXaSd1db6FvWX1STFI2TOQEze?=
 =?Windows-1252?Q?+RKg+JGXNNJYkW6ge2TxlnwlbRlhL5XmVm38cK/MXtarPaVmLoixyBC9?=
 =?Windows-1252?Q?GZhMJs+piz84zjseVUCGWwkQZiSOTGxtgNI2dr1YUE/Oelf3IUbtvzK0?=
 =?Windows-1252?Q?Vpt+a/yJPVgzQb7DLHcSK1M4Fpn6JPslCsno0Mxa4U9RC5FHkiZZqC38?=
 =?Windows-1252?Q?J14yfQ3iF+L+5pwIQlngdfZbHFEMeCe/Z5YRAAl41XAbGlcAaFdUuqr1?=
 =?Windows-1252?Q?W2k1YkfaZ0UhsophVRtSF7PApiK92rZgVH3/8q5B4kMNQxZPZ3xxrTTP?=
 =?Windows-1252?Q?wSxucdJiQZwl5NSWI3zvvHZl6nWYbBjr9kAfg6XbcYoqoKRl7n7/8nnD?=
 =?Windows-1252?Q?AP0uWrHpuHk6O0FcZlhq1bR53GBfOR+Q5NyuyzR6c45bvvJnq2c9LsBM?=
 =?Windows-1252?Q?S1i0+Uj1eOqVs8GlJeH7FIZPh4+M2xfxv9oeaPzjx/uJCI2EP8H+dUeM?=
 =?Windows-1252?Q?OAsSL+OGu1/kjy47RHtIb5Dj2QSKvHHcm6nfqRRgn1u88FkD94chvHvb?=
 =?Windows-1252?Q?zegtWej+SnlY7SVdQ7RPsVMfOLwK8NKKKBvv7s2zFIHrGUziWk5EeSQC?=
 =?Windows-1252?Q?TM4NEz4Cz9UjRsWUatkDWxg05JVs97JVtWrZckhw+ZjIGqONC0gV72zq?=
 =?Windows-1252?Q?9Me/AP6ninRFsAX7wC2MD1XlaONBgZ6Gej7aNC7JUwsPCIFK/22GL5ba?=
 =?Windows-1252?Q?XA3Outpl3dq1E5G0W6hHaO0g7dO1gLcpe5KW0yXVFlx8GTwv7Od5Y53e?=
 =?Windows-1252?Q?b4l2BqEnCq18JiWTR9oRZU/gtKU1np86B4Z46G9ADZh22OjHT8ZVc7RB?=
 =?Windows-1252?Q?p1NuzRYT8NWFfrfWHm2+0+8suSTYbdsrPrq8C826RXT1az6dCnxbuWfl?=
 =?Windows-1252?Q?cIjzWhAnvwDnww=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0781ce06-2a18-483a-2979-08df3996f1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 10:40:57.5341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBi5xoUqf8jyGEJV251p8tFniaaHYrPWdTgoJniTy1w1nuCtBXKN5OwCO8LEXlgghdjEKVObbkOAekUxrqpVooguPrkyMVglxRISzsmt/eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162
X-purgate-ID: tlsNG-4011c0/1793702462-52EDACFC-D79D808B/10/78276251493
X-purgate-type: spam
X-purgate-size: 5424
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Monday, November 02, 2026 20:34=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Xen-devel <xen-devel@list=
s.xenproject.org>=0A=
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@suse=
.com>; Roger Pau Monn=E9 <roger@xenproject.org>; Teddy Astie <teddy.astie@v=
ates.tech>; Jason Andryuk <jason.andryuk@amd.com>=0A=
> Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit=
=0A=
>=0A=
>=0A=
> On 02/11/2026 6:16 pm, Andrew Cooper wrote:=0A=
> > On 02/11/2026 4:12 pm, Ross Lagerwall wrote:=0A=
> >>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of=
 Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> >>> Sent: Monday, November 02, 2026 13:54=0A=
> >>> To: Xen-devel <xen-devel@lists.xenproject.org>=0A=
> >>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@=
suse.com>; Roger Pau Monn=E9 <roger@xenproject.org>; Teddy Astie <teddy.ast=
ie@vates.tech>; Jason Andryuk <jason.andryuk@amd.com>=0A=
> >>> Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the clea=
nbit=0A=
> >>>=0A=
> >>>=0A=
> >>> On 02/11/2026 1:46 pm, Andrew Cooper wrote:=0A=
> >>>> Despite prior information to the contrary, APM Vol2 revision 3.46 Oc=
tober 2026=0A=
> >>>> has been adjusted to state that the vNMI fields in vINTR are covered=
 by the=0A=
> >>>> TPR cleanbit.=0A=
> >>>>=0A=
> >>>> Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_s=
et_vintr()=0A=
> >>>> rather than writing into the VMCB directly.=0A=
> >>>>=0A=
> >>>> In svm_inject_nmi(), fix an inefficiency from the introduction of vN=
MI.=A0 Move=0A=
> >>>> the reading of vmcb_get_general1_intercepts() to the point at which =
it is=0A=
> >>>> used; tt does not need reading on the case that vNMIs are enabled.=
=0A=
> >>>>=0A=
> >>>> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")=0A=
> >>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> >>>> ---=0A=
> >>>> CC: Jan Beulich <jbeulich@suse.com>=0A=
> >>>> CC: Roger Pau Monn=E9 <roger@xenproject.org>=0A=
> >>>> CC: Teddy Astie <teddy.astie@vates.tech>=0A=
> >>>> CC: Jason Andryuk <jason.andryuk@amd.com>=0A=
> >>> I forgot the extra comment.=A0 This bug is hidden by:=0A=
> >>>=0A=
> >>> =A0 =A0 /* The exit may have updated the TPR: reflect this in the har=
dware=0A=
> >>> vtpr */=0A=
> >>> =A0 =A0 intr =3D vmcb_get_vintr(vmcb);=0A=
> >>> =A0 =A0 intr.fields.tpr =3D=0A=
> >>> =A0 =A0 =A0 =A0 (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;=
=0A=
> >>> =A0 =A0 vmcb_set_vintr(vmcb, intr);=0A=
> >>> }=0A=
> >>>=0A=
> >>> at the very end of the vmexit handler which unconditionally writes vI=
NTR=0A=
> >>> and hits the cleanbit.=0A=
> >>>=0A=
> >>> This is an absurd codepath.=A0 SVM has virtualised CR8 since the very=
=0A=
> >>> beginning, and put in CR8_LEGACY for Windows to use even in 32bit mod=
e,=0A=
> >>> so the only path modifying TPR is a non-accelerated write to APIC_TPR=
.=A0=0A=
> >>> =A0That path can be updated to modify vINTR, and this logic dropped.=
=0A=
> >>>=0A=
> >>> ~Andrew=0A=
> >> The APM says "(Offset 60h=9667h)" for this bit in the current and prev=
ious=0A=
> >> versions. Perhaps that means that more or everything in that range may=
 be=0A=
> >> covered by this bit in future? In which case more extensive changes wo=
uld be=0A=
> >> needed to avoid future breakage.=0A=
> > The vINTR field is complicated, because some bits are unconditional,=0A=
> > while some are covered by a cleanbit.=0A=
> >=0A=
> > Byte 63h (V_INTR_MASKING, vGIF_EN, vNMI_EN, {,x2}AVIC_EN) all control=
=0A=
> > virtualisation behaviour.=A0 These are unconditional, and I bet the 3=
=0A=
> > reserved bits in there will continue to behave in the same way when the=
y=0A=
> > are given meaning.=0A=
=0A=
V_INTR_MASKING is covered by cleanbit 3 so I'm not sure that logic holds.=
=0A=
=0A=
> >=0A=
> > All other bytes are state of the vCPU, and are (now documented to be)=
=0A=
> > subject to the cleanbit.=0A=
=0A=
VGIF in byte 61h isn't documented as being subject to the cleanbit (yet).=
=0A=
=0A=
> >=0A=
> >> On a related note, I see the APM says this:=0A=
> >>> If any VMCB fields (excluding explicitly uncached fields) have been m=
odified,=0A=
> >>> all clean bits that are undefined (within the scope of the hypervisor=
) must be=0A=
> >>> cleared to zero.=0A=
> >> AFAICT Xen doesn't do this. Might that cause breakage in future?=0A=
> > Fun...=A0 That's incompatible with the previous sentence.=0A=
> >=0A=
> > Xen follows the previous advice, and sets:=0A=
> >=0A=
> > =A0 =A0 vmcb->cleanbits.raw =3D ~0u;=0A=
> >=0A=
> > early(ish) in the VMExit handler.=0A=
>=0A=
> It would appear that AMD reserve the right to retroactively introduce=0A=
> cleanbits.=0A=
>=0A=
> I maintain that it's absurd to suggest both "write ~0" and "clear all=0A=
> cleanbits you don't know if you write anything".=0A=
>=0A=
> The advice should be "write the cleanbits you know" in order to signify=
=0A=
> the VMCB as clean.=0A=
=0A=
Both approaches would surely function correctly but the doc's suggestion=0A=
potentially allows more caching if a new bit is introduced (but more comple=
x to=0A=
implement). In any case, what Xen currently does wouldn't work.=0A=
=0A=
Ross=

