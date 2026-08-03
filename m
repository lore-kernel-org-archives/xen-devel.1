Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4F7C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 15:38:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381639.1625163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqukI-0004KZ-9p; Mon, 03 Aug 2026 15:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381639.1625163; Mon, 03 Aug 2026 15:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqukI-0004KS-6y; Mon, 03 Aug 2026 15:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1381639;
 Mon, 03 Aug 2026 15:38:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wqukG-0004KM-AI
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 15:38:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqukF-000inF-G6
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 17:38:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a70b5db-e002-0a2a0a5209dd-0a2a4507de56-38
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:38:27 +0200
Received: from [40.107.208.43]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a70b5ef-b4ea-0a2a45070019-286bd02b57bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:38:26 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB8003.namprd03.prod.outlook.com (2603:10b6:408:282::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 15:38:21 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 15:38:21 +0000
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
 b=TT8lmlup7esX4SPiDBkwiikbYYEsjqPWeQW5PnoZupzLOnDt3eJAg4ff/3eEap6AhiAUW6X8aSryB7zmkW133NPShedIn6MwbXf6uPrAITyY/JLuC6wfM1Bs0Td2cVxOQdoeIEk81vUrHYbZICXv3WM1uTwVypi8wrY86NOVax8DS+c3NADmjOdE3WIwATwCv3ZCRIVi6N3AHICbH1hbr9MLJv+YMhvzXtyiKx5siLXWImLvYyPuqIj9pUBaEUonEeg1JQ3Z/gfp3WTkhVgTvFquQsprXS6GcyGRBDUNC8tk1dG7RZHP98XVNuEI60zqLZXofpa8Gz9KmDIEiuGT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DJbWVherjg++BqI272ogCa9VbVUtKcQHwb55KAWEL4=;
 b=Sm42Q9yFlFu6P5GN06KyorwMXdqR4yjwwNkoJVE6FsN2ZLCRGf3BzP4icFTd+l98ZqqAVXETllNrc5rgWbxmWRHDnObxk6kC4phmHXL247+43YyR0Ks00CrGZsJHR/eFk5KWI8fLb/ZW2P5R1gvwj4lOlsK7whHGVTzgtXNDjTUvTBmlFGhhhEc4EhxCMyJ8O7+a5jrYjqNDSOXNCPdGK07l60wMaDa2nW9uHgqfrWG3r9L7gK4uXc63JzihDtL+45dxacqneucuKFAwRwpEtj8KrMo7GOlE9qm8bDYb2ED6BMf1u9MHTxwQ46wUObYlUZTGerb9G4/Er2AOf6DBZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DJbWVherjg++BqI272ogCa9VbVUtKcQHwb55KAWEL4=;
 b=Ne/MlHL2p/qCK0Qo+DnHoB1fiqcWH5F+BAHayQN+NaO4SXSbC4EANh5R+S5rarEdcJ2gPPT9Car4b1Iy0SXJSW0it6SKIDHXp/b7E1BcOaVU2PW9Hl4jYJ7rHtnfQfYEn4KwcCY/H7amb0w4sZvt43PLTM7q2dbfkcfDlk3Vxto=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/livepatch: Move init_or_livepatch_* into xen/init.h
Thread-Topic: [PATCH] xen/livepatch: Move init_or_livepatch_* into xen/init.h
Thread-Index: AQHdI1oaaSQdYQmCuk+Kogsfl3eCaraMcIo9
Date: Mon, 3 Aug 2026 15:38:21 +0000
Message-ID:
 <CH8PR03MB8274CA3275B26577BCB2109FF0D52@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20260803150925.408857-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260803150925.408857-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|LV3PR03MB8003:EE_
x-ms-office365-filtering-correlation-id: 5443ff49-ad3c-450c-0f4b-08def1753f9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +4ZIJoUPZdU0hOhLuhzP0EkCUhEuosfm33phJD29kf+RArB72pV6XccpzBMcBW4jBLzbZb8cATdFpjUUey5XA+/1+FgjWKC99DKqSU8gpnxb7IkM6DeVnG2IpKNyxJovNk/qC49RwCxAVMi52fo3zLncZZkzjLwgx7kRBi/cSDoJ9hqYgryLRSDRkNgdVj2FAjJ2T6HZDgnhUu7RTdZFCqzbxWXtvsr0LBu50Ow+YU9whopZy/gYKJI6Z8DErvRAAzzSQWjmxXkyd7Cq2RInimcqqvbs1o7G95o7rB5btFXQG+au4UO+LfGkds+ha1+ciwD/erdQXPg1TOh6sXnbI5CG8xlBG5liIkA5U/fx2lxe0qs8MH989tNxBZLVrbt/2oquXXTNFmcd9VwWHHF/MOkv/zeSyjUbJpQJRad1WDSjhP6F7Pmeo26bb1pngSgLiUKNsd0+5XIkkEKpIAA31tqaTsThmKepbfsUdzbn3UEzaftaBrlgaBpklXuBGjmWfMDYBR0dj0Hs9GszWYaYHipeuTs5GFjLzzwPbrt0ZgqNAaBcg77jcRxt1v5rCpstiFYiuKSoA01Yq3TUcio8N3KLvB/Gg7ZpgJTGRx84bT+ER7GOxUQ9rZjHWsfaINZAebZOwUEN4u3nF35txeuJrlYdDuWRIY7NnGzVM73jcOI0/o1EQ348wJuKALpD9o90y+pqasF71rlfyK/RCsKF77atfGv3wNziPMsZN5I9ekE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?37fWiSXoY/o85LOSLk0ki7kzDkzIUELShyFjzyC6JKXbizvSrUhTiuKEV2?=
 =?iso-8859-1?Q?ultEjHhQjuwGjN2kZmQnR7fMohNVWuSvKtxZ+UxLcdJ0oWmXBpxO29TRbB?=
 =?iso-8859-1?Q?sxhGWydkBipezyhofHfKJHFqBIU5RKkprIWmnawKVgQB75ipwNSq4ohPDu?=
 =?iso-8859-1?Q?RRUIDctOXy/07Y3oBpxUOr3NRMktrjZnvKZpVIRszRQeK5w4wpMAu2ubie?=
 =?iso-8859-1?Q?ocfGSTf63O1DfkNknRdwBUQvCSqY+iMcVorSH5p7jyL4ozZ38v7h5kiMUl?=
 =?iso-8859-1?Q?5OfSFj//CoREBXK4RIYm08eVktpN1/B8pyd2GxeUFRtBiYDqZWozW1WFDo?=
 =?iso-8859-1?Q?DPikRR7IMqTnF1YhU1cu52zPSLPcIQYIWE+1lpfZMaaV1cxok4vBZCmN8r?=
 =?iso-8859-1?Q?GqguDxpZVNn/COB6vs1Tp6WXUXgLKqacoJwgCQLrwREzu8Y2hcc+XBerIi?=
 =?iso-8859-1?Q?2Q+wPqOegWy+ml6OMnUH9dbxaFpBh/EIKNMkOPBclFcT7hO+6lluLQW9YW?=
 =?iso-8859-1?Q?BEnXcaBCvcNQdH036AKpkhv7g9ZpQI/sex4pDNfVbcTcZjNGTlCFccF+XH?=
 =?iso-8859-1?Q?calPOaSjAH7y05SwdSpIabiB3lre23njHmDVLJeR/vFDUJZSKm65urNizn?=
 =?iso-8859-1?Q?swZJiyiJf7koXUm3S8kj36N7AaF5eMs26XoQz6GyDj54UVyhcDtMouYuMw?=
 =?iso-8859-1?Q?9jHYJVye32rl0K5fzQLgYt1tW2yDgUy5lGNFhhRBgjJTRiZ8dVoahXGjRD?=
 =?iso-8859-1?Q?S2PrN9yCQmkRIB3ON0igXykLeEs7YfL0LW36Xx4tvFubA2KbOfK+B/n35s?=
 =?iso-8859-1?Q?cDVQ09c5qc7qwlsa/zQNSc5YZC5t6YbpuR5Cqhm+gPbb2oRqG8ECUd+W41?=
 =?iso-8859-1?Q?bDXq6nY06U8QVgpt1HsPju0ZT0GQ14KqktwkIr7hpTApkpuIU1KrN7oixE?=
 =?iso-8859-1?Q?3mwAqN+2nHgWzUFpU9D/DveuoK5WS+ezwq7tAcrzT1xVkdut+NmOPp6dGa?=
 =?iso-8859-1?Q?uAWHv16KWvWlOsROGgTOGNuXwJxtftw2HQHP+CIJzBQt4qmks18oQqU0KJ?=
 =?iso-8859-1?Q?YJ1fNGox/w1CY9bcIzoMxP81ltLdG1bxbdmFb+bBb/toYxMhLp3UPG8qFy?=
 =?iso-8859-1?Q?4CeR69Ucz0jX0Fm+h9QDrdEym++pX3mBYLTEgkqbKPLkucvQZWq7f1EGeC?=
 =?iso-8859-1?Q?6gFct8RboNVIlSeJQFL6D89efk7c7b3xE+lnrUO2UeasbXrcFglObAorky?=
 =?iso-8859-1?Q?l9l6KAOdyjTwYsvRoIVx7bOtuDw8CdIe9w3vmCv5n1+ZEDl/GRPSLuSWUD?=
 =?iso-8859-1?Q?lc7Uxwm9QHyYxNgX/P6h9UvJPB4ZoVlS7x+EtXIdl2NtEvxSDYwuGbL4TU?=
 =?iso-8859-1?Q?JHuKWQ8yr9sMzuwBfVNBmHMr9DEXaeOB5idDWZBPqcy0Uk16YpeedKCFqE?=
 =?iso-8859-1?Q?k1oMwHbyzMOMeXHpkZqC82otyp15maszBmfjKsn38YSnP2WXmZ1HaGgOdw?=
 =?iso-8859-1?Q?WVplkXcRc0wGISHpwbTxM+vL133DJxrjlmI4sjqbmZyITt4GHX3QeVf7Js?=
 =?iso-8859-1?Q?hu0+t76YmbRISRPg5cC9F25PaRVcOns2MTNKxhO5HhqzdbNt0+0krM5YX7?=
 =?iso-8859-1?Q?XW593Pi5N/iQgS11ViPU/LvVvgVzXaeFslccs9VXrYXpVf7Kn2FfJ7VHVk?=
 =?iso-8859-1?Q?tXqcK8xW+3Yxq1p+ir4CMYg6utQuDDGh4sf5I8sqw1kVhxrxQV+rOBGjey?=
 =?iso-8859-1?Q?WMK9bc44/zjKotWEwX5OrZFBKPd5wdg0pGGGYEtk++Eo1kCow9+xJcuo9x?=
 =?iso-8859-1?Q?gRKV4m6IKA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5443ff49-ad3c-450c-0f4b-08def1753f9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 15:38:21.3417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IyerVeoGFlk3geEim036Oivshq0RIfo9DWtCMQpWsfrGr6U/0SmpOhWvE9Brq6Tj839xWThD69iEVxfrjhh/2KrJzqRJH2gkJE5BU/r/qYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB8003
X-purgate-ID: tlsNG-ef75cf/1785771506-344CBAE4-87ADAC26/0/0
X-purgate-type: clean
X-purgate-size: 1198

> From: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Monday, August 3, 2026 4:09 PM=0A=
> To: Xen-devel=0A=
> Cc: Andrew Cooper; Anthony PERARD; Michal Orzel; Jan Beulich; Julien Gral=
l; Roger Pau Monn=E9; Stefano Stabellini; Oleksii Kurochko; Ross Lagerwall=
=0A=
> Subject: [PATCH] xen/livepatch: Move init_or_livepatch_* into xen/init.h=
=0A=
> =0A=
> xen/livepatch.h is a fairly heavyweight header pulling in public/sysctl.h=
, and=0A=
> a reasonable number of users care only for the init_or_livepatch_* tags o=
nly.=0A=
> =0A=
> They're arguably more init than livepatch anyway, and by moving them to=
=0A=
> init.h, we can remove a number of includes.=0A=
> =0A=
> The include in vsprintf was leftover from early versions of the work.  In=
 the=0A=
> version committed, d5ccf4482e4f ("x86, xsplice: Print payload's symbol na=
me=0A=
> and payload name in backtraces"), symbol_lookup() had been adjusted to ha=
ndle=0A=
> the livepatch symbol names properly.=0A=
> =0A=
> No functional change.=0A=
> =0A=
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
=0A=
Thanks=0A=

