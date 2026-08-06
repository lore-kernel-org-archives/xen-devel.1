Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A6C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 10:44:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384562.1627440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrva0-0000Wp-5E; Thu, 06 Aug 2026 10:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384562.1627440; Thu, 06 Aug 2026 10:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrva0-0000Wi-2S; Thu, 06 Aug 2026 10:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1384562;
 Thu, 06 Aug 2026 10:44:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wrvZz-0000Wc-7P
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 10:44:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrvZy-007XZa-4H
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 12:44:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a74655b-e002-0a2a0a5209dd-0a2a450be1d8-44
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 12:44:02 +0200
Received: from [40.93.196.65]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a746570-b7e8-0a2a450b0019-285dc441fe8b-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 12:44:01 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB5503.namprd03.prod.outlook.com (2603:10b6:a03:288::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 10:43:57 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 10:43:56 +0000
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
 b=e+WjnN1x62m821yepLlTypVVUw2lA5aoIKF/Aj+OADbpN6Gfk4SSjKzzA3DzRWdEvaNse+5gFNj+3Q7fx11NjKhDSC+pKppLP8UEkmbGuat2pAL+1lE5AwjumN91IrN/9sVBVEAOLVhLJQsc4mHhk+9+r19lumR4fESbpeGvAOHnesGqTd930fH8MQ7s7yTnaeufBpNxDBLeYKu5Xf3UbHa+o73oDNndWYloFbbP3GOjo7BWj6FU9NIWi9uh+a/mv+14HlTGKDnNU3jeH54ttfnpCXzkQ/nQGgKIYE27xY/qczx8GfoSqji76KJJg2gqj+JVIt8dIi0N5fkPtwFcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rJ/ii9+zYru9tGxrnZ9ThdtN66dT0Yw8UgDRDt0hto=;
 b=EDfjIMxn+reGV3AAwKWSJbsSMUSd2W//FxwBoWORVU4FKHStWsWScrebw7vxXxRwMgOUAg/hF+M0caLqM8R167ByV/nP4IpBSvmGtF1SxTLcSS+8IiDmGLbQZEfkvvNClm46Ww/KxcqmOSV6smQWK1kKfiPth03tQgoACpZ/GzVFBzcAVfHwMW7mx6InFORj91WgNy3Y6TopLsVJsXBxLKMYV3XicoiFz19djMkfFX5zFQvHgGYTIo6f58vYIqp3KeEAwm6zcfPrUWpJpOjv69rpRWGiZoZV9ThOAO/j00e7L2sNLIy4jZ2DNDpNwoQRkvW7fgcv60quHQE2onvX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rJ/ii9+zYru9tGxrnZ9ThdtN66dT0Yw8UgDRDt0hto=;
 b=0IMavQE5UjYj+VpvNUvqtKvMX7939XpLDT9D4p6vFPXXtTv3Rc6Q0GcRTv27AGvbfaB+TDW1mM7JypX1c0dR1z6bt2BD9bCugGL43j8Rnq+R6O/y/dG8f1qLT12AI2wwPiXT8UVbElHORKWtL3A//k3PcpG5c+0TRswOTEuIP7w=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <andrew.cooper@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check
Thread-Topic: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check
Thread-Index: AQHc7Qzj6Zyg1vqVRkydd+9Jb6lnwrYgRXUAgAAGJoCAcPgFxA==
Date: Thu, 6 Aug 2026 10:43:56 +0000
Message-ID:
 <CH8PR03MB8274EFC6FA9AA86D68E4277FF0D22@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-2-ross.lagerwall@citrix.com>
 <b9ddc37c-216b-4c18-8d77-03ce641d2614@citrix.com>
 <6e81d92d-cef7-43e4-8dfc-08c5edbb504d@citrix.com>
In-Reply-To: <6e81d92d-cef7-43e4-8dfc-08c5edbb504d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|SJ0PR03MB5503:EE_
x-ms-office365-filtering-correlation-id: b8e387ad-18e9-4930-33ea-08def3a79db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 nVk/XadbjvbD4dlpOG/3qfpklA81R6BhOTF+CdQOJ6UEUbXICWst23Eq5ss5IZRD9eZEht01l1ckxSKVN8JxFqNBPECbgejEEML6R2pLbNm0kzbHqBg62jR+k7K4LP2dOu2XKQVHTH4KjrPRZUSriYdWraed4QmudJafSOFCJUis//5HAY9853e+6JCdWkZYraAl+DGx/7d1XZZHRhb9h9FmXcEmd83lAKZK4wt7ofP6guaWVpTNaOA7I9jzMtpj22BYTtfIRq1uXLVPVOmCqPjsAXuVDQNGGFb8T+PaKC8O4zaeE1DD4FU96s2En7Glu1zO9rIZgcI1+tc9b5Ecu8LWk8iqTK/N+c34DZt8fdrLYpPI1AhTG6s/xTk2A46n14Ri0j4U+fAbzE3G0Cw9pgpyNAvarPEBgTt8l5ach06pA8gUbwre0DDwl/iLzoK3RPp7LPgWBckTvc0wkuBfx7pQiQFf0wQtYma4D+4pmXK7uz5POUX6SYCAFei/TkFpE62nMhQ69u2JLIb9mkJjFfJFR0sZAiSvjJ6cmtIsGAZWV6oLzMiN1PwrEsj/7mkHnIuqGm7qqkpAUl0tDbAF43GiyjQ/sDuviefoWgeKPrOBs/24M8IgnDVYPP8OjbVhHle6SpsTPiY2c8MZzwu9Pv2X6t3VMdoA73aHesDVIpSsd4Ir5Io95rNEVfjhLomUZis6qMS2ybSzB95u7ljsxfL/F70lqFCfmHAkL4510ok=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4MsTEWwLufj0XGW0kg4xA8JQV5HbfCK99up3iyykBGpVMwwOZc4L63C6pC?=
 =?iso-8859-1?Q?iRroVpdPwltGDc35/Olmvva5sxJUSPphrMtvwtrJVo3esqL0iOChRaPArO?=
 =?iso-8859-1?Q?7WbTMvOBWOzXtJw+fyNzMoJiCFmiRn56oCdLJfEmNFVgfEI4qzDp6nsxU3?=
 =?iso-8859-1?Q?6GjxIQrdB5WN2AkMUihxWrz19Rk1aMGOg0o9Rcfjxhvb91wZHPYynFiz+d?=
 =?iso-8859-1?Q?TSgo4WUnf6j8M7jw11PAwQQgX+ex9Qu8sTH3qifu+G41TXXumWuxAc+CyQ?=
 =?iso-8859-1?Q?NUGQPFA991qSPm4X4gk+aj8PZBNHPAvmC162mWRK710SlBE4kLrYnJn/PC?=
 =?iso-8859-1?Q?52/4gJai5w56sBiE+LoMFVmhpiUwOPl3RNPVFYKc1xgzRnlw659me78Imt?=
 =?iso-8859-1?Q?P3ogKm5B7UjG4SP67CrrMVYiW52vudi2xknE0ZG3dQL7xZtv6fHiVbRHRH?=
 =?iso-8859-1?Q?UiKXyytloIrapCVOgdF4b9jLRvjOuAUP5oH4VhikuGfHZdGHy1h8YCY6I8?=
 =?iso-8859-1?Q?dEMjv//8oG7vgZc5J6TRaYEVvyP4JnFN2Y52d3kzVLOLhkTX196xvXAf67?=
 =?iso-8859-1?Q?Zx/VlSrdTH/zSUuG8J2SzU4JKeg1AAGKA/GuxRtoMhfdulyL/sXa8S+WjX?=
 =?iso-8859-1?Q?dKZQaHp7HAZ5mU0LozCIa4c/KIpmZZyX+zOok+mgx7RSlgthKa2Y6aigZG?=
 =?iso-8859-1?Q?V2nTApoqLu6XVSXU+QHEZ0zXYQTEvWrHxlSg0WpCHy6ckgHubgQC1UWPHI?=
 =?iso-8859-1?Q?Qm1iIbf/UItwI6ZsSLy5dhIJPwU68upkkrEYm8q8QjNvhLfpNRf1vpoKU9?=
 =?iso-8859-1?Q?SOj19Vin/3BVd0EKeUgDvUEiV0O1Wss12rY1Ayl2+yT5ljiMGtqBJoY2dy?=
 =?iso-8859-1?Q?wojmTgWDgJUtYbXPtDsUHLEwd0gK31esC8uWLJGUo0I/LnSrJd9yUShOuQ?=
 =?iso-8859-1?Q?ARdg/DKg0KyWYCZjMUUZRM0a9nE12odacvyI2eVM6BscH+dYSgr0UVV/o5?=
 =?iso-8859-1?Q?u62YFNMVVOurr4b1Kgrn2lBXTgBhyQnC2xOM+6LwH9SfrkDoiTPLuECQYv?=
 =?iso-8859-1?Q?0SBXh5ZCOyFDPkHkLYtQW8lWArEGGSsrWs6V2MOhhpV3IRQ1R22jFmLXuU?=
 =?iso-8859-1?Q?Qy3c4TyjJqXKTJ8ml8T8yEBj9teVW81xSGysNoW0oI3eL6QXx8rxej8THL?=
 =?iso-8859-1?Q?2ga1aGDvbzZDrC2H10OxH3j2jqMVfTBkAiC2ij1RsDIXER4+nkcE67Dzam?=
 =?iso-8859-1?Q?3EC2b/6eNHQy5PAqg9fZBZ6qhbGZHBlps9APq/9TrOzBFP5aYrgpOpuzLT?=
 =?iso-8859-1?Q?6qHF6EV1yr8mWTlOAeeVj5robtoAuloVK6Olevha3Jc81wpMGdXVACnO49?=
 =?iso-8859-1?Q?YLQDDMm5x+NIyPGypcy2PAYvN38Hx8iOwH+zZyOwkUQAfDvIJcSxcfTjLi?=
 =?iso-8859-1?Q?7rDMUVS93QMEqTeDYIqLhBYaxtv+Fbv4icnv7XEkuDaIMMEubN+Ks+7eYT?=
 =?iso-8859-1?Q?BwNAo/rWRT3MFgBwlGzOEVzNpCW7b3wgDU8jNXVcKimzkTePtbIBx5S6J4?=
 =?iso-8859-1?Q?SEVhAFaitaqx8RSmntR+a5z5Xy9SY+VsvKgSrhrGj/qzL/RuvanPKL4x2j?=
 =?iso-8859-1?Q?pIuuiF5PvIgP4BEewy3mPhqSA9UBPzrXFkKA0Bv1dztBAaJKgfhsGOvkNO?=
 =?iso-8859-1?Q?+FqVu5JYSoYYt4ATFrhIlcYn8ltcxL8f4zQt39CQw/G2JlPcxyJHv3QSh9?=
 =?iso-8859-1?Q?ZOBuwEV3kyjx3NR1VkVvLtx7SI0pSOcFvFlj6clFXpKYHsVfF1v+t1zMgO?=
 =?iso-8859-1?Q?cjLBBye1vA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e387ad-18e9-4930-33ea-08def3a79db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 10:43:56.3654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQtrGXFI+BKnqPnlGYMBbEg32qCJAn5NOcRQPVxoSqTuwYrLqx7B/hPql9pVYh7nuStlOoDWH6mrQothEa+90EFjxXyToyuorEHiNYt8MWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5503
X-purgate-ID: tlsNG-42698a/1786013042-A98C19EA-BEBCB92D/0/0
X-purgate-type: clean
X-purgate-size: 3155

> From: Ross Lagerwall=0A=
> Sent: Tuesday, May 26, 2026 2:23 PM=0A=
> To: Andrew Cooper; xen-devel@lists.xenproject.org=0A=
> Cc: Jan Beulich; Roger Pau Monne; Jason Andryuk; Teddy Astie=0A=
> Subject: Re: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check=0A=
> =0A=
> On 5/26/26 2:01 PM, Andrew Cooper wrote:=0A=
> > On 26/05/2026 1:40 pm, Ross Lagerwall wrote:=0A=
> >> The existing code checks for any reserved bit set while the APM only=
=0A=
> >> considers it invalid if an MBZ bit is set. Relax the check to match th=
e=0A=
> >> APM and hardware.=0A=
> >>=0A=
> >> Some of the reserved bits were observed to be set running Rocky Linux=
=0A=
> >> 10.1 on Xen on Xen.=0A=
> >>=0A=
> >> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualiz=
ation")=0A=
> >> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> >> ---=0A=
> >>   xen/arch/x86/hvm/svm/vmcb.c | 6 ++----=0A=
> >>   1 file changed, 2 insertions(+), 4 deletions(-)=0A=
> >>=0A=
> >> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c=
=0A=
> >> index 975a1eaef806..9ada491e57db 100644=0A=
> >> --- a/xen/arch/x86/hvm/svm/vmcb.c=0A=
> >> +++ b/xen/arch/x86/hvm/svm/vmcb.c=0A=
> >> @@ -347,10 +347,8 @@ bool svm_vmcb_isvalid(=0A=
> >>           PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0)=
;=0A=
> >>=0A=
> >>       if ( (cr0 & X86_CR0_PG) &&=0A=
> >> -         ((cr3 & 7) ||=0A=
> >> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe=
0)) ||=0A=
> >> -          ((efer & EFER_LMA) &&=0A=
> >> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )=0A=
> >> +         ((efer & EFER_LMA) &&=0A=
> >> +           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )=0A=
> >>           PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);=0A=
> >>=0A=
> >>       valid =3D hvm_cr4_guest_valid_bits(v->domain);=0A=
> >=0A=
> > The APM does say MBZ for VMRUN, but the end result of a VMEntry (virtua=
l=0A=
> > or otherwise) must be a legal CR3 value.=0A=
> >=0A=
> > For 5.2.1 CR3 Register (Legacy) and 5.3.2 CR3 (Long), the APM states:=
=0A=
> >=0A=
> > Reserved Bits. Reserved fields should be cleared to 0 by software when=
=0A=
> > writing CR3.=0A=
> >=0A=
> > What's the real behaviour for trying to set a reserved, non-MBZ bit in=
=0A=
> > CR3?  On Intel it's strictly a #GP, and I really hope it's the same on =
AMD.=0A=
> >=0A=
> > i.e. I really hope this is a documentation error on AMD's behalf, and=
=0A=
> > not a misfeature we need to support.=0A=
> >=0A=
> =0A=
> An hvm32pae XTF test that does this...=0A=
> =0A=
>      write_cr3(read_cr3() | 1);=0A=
>      printk("cr3 is %lx\n", read_cr3());=0A=
> =0A=
> ... succeeds and prints:=0A=
> =0A=
>      cr3 is 105001=0A=
> =0A=
> This was similarly observed by the KVM folks in this thread:=0A=
> https://patchwork.kernel.org/project/kvm/patch/20200713043908.39605-1-nam=
it@vmware.com/#23578493=0A=
=0A=
Ping, Andrew?=0A=
=0A=
The existing check doesn't mirror what hardware does and causes real-world =
failures.=0A=
Can this patch go in?=0A=
=0A=
Ross=

