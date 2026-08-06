Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41BDC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 10:46:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384571.1627448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrvcG-00018c-Ih; Thu, 06 Aug 2026 10:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384571.1627448; Thu, 06 Aug 2026 10:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrvcG-00018V-G4; Thu, 06 Aug 2026 10:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1384571;
 Thu, 06 Aug 2026 10:46:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wrvcF-00018L-Lg
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 10:46:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrvcF-00FJJc-2K
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 12:46:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a7465f0-5cb7-0a2a0a5109dd-0a2a450ce2a2-30
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 12:46:23 +0200
Received: from [40.93.196.47]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a7465fd-f479-0a2a450c0019-285dc42fd2aa-4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 12:46:22 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB5503.namprd03.prod.outlook.com (2603:10b6:a03:288::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 10:46:19 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 10:46:19 +0000
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
 b=n7PpmMRu13Cb0988JUFHrsR4dEaVBYXtkf5REmmf5G5iBQvsBgzUZUliI+lsgJhZcy2BVLB1GjmanNebzkaptef8Q/7+Vl9lHHVSm53lSSdRkNGAo8eDVYc0YozKplWi/zWuQVvOlQfSA490M31CaDc899uDhn23nIfVvn5V2juVT6CaGxlcYfHMYY3yGk0VULv8ZDnP0sImEHqJZd/5yqSOulDbARCfC6rPY8QO2y/LL6wS/DotYOBJPD/rb+C1/FyvQMoHkRzXgasXOo+kHZdTExWvUD6ilV1kJggyo/iABT1O7KT5GKOJUY5JWS5r+7Hy5gPnq2dI2/KnUigS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeAbZflcsgtYbs0Djv2pO3bp8Pg7BdliWHPU2oAikOk=;
 b=qz/QEIGNBEmaO7lLsFIJX6wfjlgwMIycEqvkpj+TeVMs97mbN/sg3j/ViKI8AoMReDA1x7CqCFkkBWtURbV2FTt2EgzclkkeLWF/l951Ks3X1Fz67hMTl8SU22Iq5mIOJ9oA2HqXCyijQLOX6P15wY76jcNP7ukwlqucgCuWSnEf/d7U0yo9doJ2HAlfN1OzeeBjGQEL8E038N7Tm7IU1X2RRQ3X0Hw1+FcZBZ2z964ZcFWy5Lxd+e+7+YBShCpXl4L590T1yRKbnf9XJGd+rYkepIkXg4ptSYpySlzagpuy9BORriWiPSrHxILgxQbM5yKYnHUuGilqs8fZjotJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeAbZflcsgtYbs0Djv2pO3bp8Pg7BdliWHPU2oAikOk=;
 b=hedUaixTku8z3Y2Qq8I9RsS3bBCDxiVBPipExXoeamqRlmx9t8tfUeVbHt2O72DNxI2jVuy1el2OPVPYNFeBBBuYQnxUA1L+Wth6d4ET6F1/uA/8CRtb70uparNrrlaSzb2gIRyeqUKubkBonFSgvEJ5tRztTiMKmp4ODkGcJ7I=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1 0/6] nestedsvm: Misc fixes
Thread-Topic: [PATCH v1 0/6] nestedsvm: Misc fixes
Thread-Index: AQHc7QzgdzWBfRT220y6Z9wl6s7+W7aRRvIr
Date: Thu, 6 Aug 2026 10:46:19 +0000
Message-ID:
 <CH8PR03MB82749DB863DD5566B83C6DE0F0D22@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|SJ0PR03MB5503:EE_
x-ms-office365-filtering-correlation-id: e545e8d1-cc4e-4d33-467f-08def3a7f337
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 +DBpt7k6bS8bMBa2Sm226Sf4SWa5djM80KgbdvWdf6PAVO6a6fiAsi9+L+jbf5K/6zhg8jsvWN4TV9RQnbmi8kjfOtXgLK29R9wb/YLxcvYIK1gzo10cS7lXaxYIVkljygkZ4kkZOYULQtzkWA/2ISZuOtrQ0uJATriY5J365ftJ8YYxYHxMzWHARPVeml+FONeKXWSkozi8kdbMROyehJkQ7ak0H58efYdpqFiXHhWow+1wnVC1Os4iY4CDWCCWJ9BJGtoQ/RZ8kKGM4r/Coc4MyjYMyYVrsTAsNjEqpgMYhXp4rgl2bgFXlzBR8LfNDK1sNJ2yfwRg0XkyHnVnRIvuhI5FWQbrML9qYFRqtEEWygzBcHgVQDynQQpt/e8Y9xy+NZlcitYXJ+GRMh81hUEuSkXSQuz0Uq3nNcF3auPxVNOlHgPp/Ti+0I9a2r0Bkq1wju6KqRnnvhaw0bOMrW/HB3i2hg+MhKXzjr3hQ56G0Z35Pkkfz2lst/lfr+LawsesYrPGwj1oPmviVi9bcKkET20zbe5wDIAGsB888F43tTGJYqUVXR+j8zDokxpzUHyXBjT+QSHwo2347afbIkA22sGB7p1GlxQWFgN9JMDNmCck3zB+mR5VtqlkZCGlnfkEEVgecw1gh7fOSS/hp6rxmwK2JumY2crTQCdsBfV1iHLRdwURUGiEp98Qdi2BZ/uIbqMnhWRu1GYHcC9dvhsC43a40Q7HRdU6ijL0ZUs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qEGHupsILwS+48f/krHsv4ZXJ2RdoZUgVTwsmm2jNninBGw4M/cHG1U6G8?=
 =?iso-8859-1?Q?peI9JMYYB/R/5TCJNqo+I27IaVixvFQxyJjHCTw3ME0qxyiZUG5j/zSGXB?=
 =?iso-8859-1?Q?1dSckOz706OYjoR16js0Z72cpyQpEBASdSiGIvvIUf2IjB/WcerbJGMLYt?=
 =?iso-8859-1?Q?PobAKZD2d/DVWFam323VbCTHmdq2tVDTta03AZqCmTA6us7E52aexwUwP9?=
 =?iso-8859-1?Q?3V32FKnvSoAX/li2yeyY+0NPsExZAXS4MvA7itVie06rPeTOvH/nYB7bc8?=
 =?iso-8859-1?Q?w/GvCL8taIKAbfaM0NCs7YkWYVIw9shZ6rAf4EKEowh3D2HfoVzXsjjBnX?=
 =?iso-8859-1?Q?w8jUiv+7HquPB6DEoKQNDNWjOJ9NHP0dGMV5tBYo9dOrUbIOw25mcyJT0E?=
 =?iso-8859-1?Q?yndjyk/85p1XOFT30PQq0rqn1UqFZelnC4InSzl5otVrW2X+BIEzzS06RZ?=
 =?iso-8859-1?Q?KvBY/pfwX4lUMSz0fbEV5xJQKfVXLr2lkSIvoiJw5T6XSI+3lOvLORdTUN?=
 =?iso-8859-1?Q?/QFNKqzoXyK2DXWJ3sNbTQi94OSm+8ZZDMGclBQJUCItOvc+RF7ZN5si4Z?=
 =?iso-8859-1?Q?xuiP2YnUY+DNJMRVZxLE32Nu8aQCjWxFFgkW6mViogqTCWk9+8S7IFlUUL?=
 =?iso-8859-1?Q?+WIH/vdRPwMxUVnc+Jqy8zz8Qz/FmJGvPBcEaaj7kShvvGJk/s+1EAfY01?=
 =?iso-8859-1?Q?khyIHjYoRVP9IcTB2EvuHRh8S2eAbpwwBcng2RJjPmy5LLTf+dmDVvVRFP?=
 =?iso-8859-1?Q?7umxuFaT+SRfxrpZCZkFlbjbKDPfx8etPIgSOA29UoGZ8Tac7WSn/S9WQU?=
 =?iso-8859-1?Q?pyqlb8l4KHJEmnxEM4EMo4mXZv69LuzciG7wBK8orgaKQ0tW7afGRfYgLy?=
 =?iso-8859-1?Q?XaqKLsznnqzHgLqjSTr49KoxmspdoPN31gOdfzmN3bNeQPRXHQyWv3KIrW?=
 =?iso-8859-1?Q?di28O+BXwSBfr7I3+rMGiwy8ur5xH7GsqbEv+TEgjKcgIyY7ygICAU0jhK?=
 =?iso-8859-1?Q?JVvOv+NqjqHLj6ZWz0PuV89Mqzf6kLRJR6M4PHuWf50+kisIXuvVt7MJYA?=
 =?iso-8859-1?Q?XpbDC6/+58oxyN4YuF5GXNa7xXEKScZ81kSsg9J4YpnDUMDwSZLeWE7fRQ?=
 =?iso-8859-1?Q?+riDaWFJz25B/k4FnB4+STjnheU50DOBA7TkB/0IgNAszTpp79p/MEdze9?=
 =?iso-8859-1?Q?cDA6eNebsrUoPeELNuoPNtAVkO60vC6y3oMn+n0xWtyf9cuB37CRKpmeeA?=
 =?iso-8859-1?Q?Bx3Mudn3nofceQ/2ogNReoB24rsco4oJvC+FKqzPF67s7vvi4w3HJpnjOo?=
 =?iso-8859-1?Q?YH6FIdNDTLGjMplSvKuqCxVJndNrthyvoZuD1wb5amV+GCm+dIxHD6XgaK?=
 =?iso-8859-1?Q?2aM7mBEEjBaRdjh5zawlQWPICYDrRO/hAchtO6U0MZc72LIcbMXmKTiIgQ?=
 =?iso-8859-1?Q?5imvlw1ZI/kdmuxoYdWFqygTuPrsUIWcnfoYYahkyviLjJVPHZj8f972oR?=
 =?iso-8859-1?Q?4Kch14qjHPB8P/xGqMy243Ijo0pTHYDo0GX3MkWbCfFK7k5K01LeV0qfgQ?=
 =?iso-8859-1?Q?cu3T9OEvRATRQm3eExVkiHtrFydDnnY4RLVRsTbHTGAJQSvhCVzXdXX7Zt?=
 =?iso-8859-1?Q?wFSujHVuzKJ/RRrqECeqfNoRqlTWYsLKqmApfeyHBy/S/3B3/5DqI2WJ79?=
 =?iso-8859-1?Q?oE6o+FkFJmGswbUx40EgUMmSCWR/fQHCSdvLm6oouPaPOIcKkzddEAKBS1?=
 =?iso-8859-1?Q?R3P8CPFISmW1SJtpgZgoNmBkdH2aCpCuYz/y5Q2lmPLjHEdKfAL/b6C8SP?=
 =?iso-8859-1?Q?7WF9JJz1fg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e545e8d1-cc4e-4d33-467f-08def3a7f337
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 10:46:19.8251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qV6bCrhHmZxwy4xS/4ljTBTPkh+bg0tQtIkWjNOnl9CIF7F6kUiL9dpCrn/fKiN9J8eWeNqGieBSh72szuA5Ye/OQVE6CxlcsdIoTM88IyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5503
X-purgate-ID: tlsNG-d25034/1786013182-032D8A5B-C2D00A0C/0/0
X-purgate-type: clean
X-purgate-size: 1234

> From: Ross Lagerwall=0A=
> Sent: Tuesday, May 26, 2026 1:40 PM=0A=
> To: xen-devel@lists.xenproject.org=0A=
> Cc: Ross Lagerwall; Jan Beulich; Andrew Cooper; Roger Pau Monne; Jason An=
dryuk; Teddy Astie=0A=
> Subject: [PATCH v1 0/6] nestedsvm: Misc fixes=0A=
> =0A=
> Before this series, running Linux on Xen on Xen on a modern AMD=0A=
> processor would lock up L1 shortly after L2 reached the bootloader.=0A=
> Furthermore, L1's domain could not be destroyed.=0A=
> =0A=
> After this series, repeating the same results in L2 crashing shortly=0A=
> after it reaches the Linux kernel but L1 survives and its domain can be=
=0A=
> properly destroyed. This is not great but is at least some small amount=
=0A=
> of progress.=0A=
> =0A=
> Thanks,=0A=
> Ross=0A=
> =0A=
> Ross Lagerwall (6):=0A=
>   nestedsvm: Fix CR3 MBZ check=0A=
>   nestedsvm: Adjust L2's DR intercept when adjusting L1=0A=
>   nestedsvm: Use the correct VMCB for vGIF=0A=
>   nestedsvm: Set GIF during VMRUN if vGIF is enabled=0A=
>   nestedsvm: Fix deferred event injection=0A=
>   nestedsvm: Allow destroying the domain fully=0A=
=0A=
Ping? Can I please get some reviews on patches 3, 4, and 5 please?=0A=
=0A=
Thanks,=0A=
Ross=

