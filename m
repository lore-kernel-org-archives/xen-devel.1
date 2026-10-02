Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C2BCA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 10:53:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439041.1657555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCasx-0000AO-6n; Fri, 02 Oct 2026 10:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439041.1657555; Fri, 02 Oct 2026 10:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCasx-0000AA-38; Fri, 02 Oct 2026 10:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1439041;
 Fri, 02 Oct 2026 10:53:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCasv-00009u-J4
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:53:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCasu-005hfj-On
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 12:53:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abf8d04-2eae-0a2a0a5409dd-0a2a4506e49e-16
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:53:00 +0200
Received: from [52.101.62.33]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abf8d0a-195a-0a2a45060019-34653e214168-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:53:00 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CO1PR03MB7841.namprd03.prod.outlook.com (2603:10b6:303:270::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 10:52:31 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:52:31 +0000
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
 b=x2u0YT+b1LlafBRiXHNn34WVomRt9NmpaIpMILwpS3R1i2G5ewPV+VxsXlKBBRi0roQd/F8GmUQU0tFdI0xgfKny5WdG5goq/0eDL2/japaLzMuklEEfgMjXaMyorYasjiJaf/MWSZ5Fe+qBgD6oRUwUpFZOXabMUXqu1VLclvKgLKMJvZc1jfGVf0ewvpVAzxUhQ9pY6dmyHRi+H6QX6coxDMIpJae+kK/c2VRFs8uGrEaFRk71i9iogw93mG7l1EGekwRDw2CP7RMXmgXalk3Uu90H7EOmnKIhvKzGBQl1RAo+jF9E/b5FeM9Q2rHMLApQzaGYpA1QqMdFPYldow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBU9T5Y54MpT8dNsA/CG6j7zmFFrb6B19NlexK0HmDk=;
 b=DZzIbVd1rzue8hWWm2Fyl72S6kTuTHLwkmI0FSoVIaSosX5JLYSXjTzBAt+avMeQ3gVciiIrmLfn/5iYTeW5pYZ+fakHabQqEYdQFE+fKPJwW4a14Er1LiSwzbGTUh32rOh7Lw5XY4GH3Px8x/RGlXQoDIHZAhxNObKGYuDRGEn3DaAgVXBiAQXKqOb6x66A+txvC9wW4Zd5ky2OIMcgBX4d7HWG9sDorEIBE92/TkUKGyLLA8hnhlohFRwC2kRQbVcTBMNY/FtnrXkGg42ogLTR1sfOWexrx58B7oUiCtHHDxPXxIqxzwHLwWHh7YSGpDp5tQpFbbzwMDnw3GZTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBU9T5Y54MpT8dNsA/CG6j7zmFFrb6B19NlexK0HmDk=;
 b=L1mFwtJTspj3OdpCrz35fEiGkT4WUjMyMM+jk84DnSIAQk4qqIlg4TCLryGONQUdZ+RKQXf31pl5Kxq/PImKKPKIZIK2SOPF7iv95kTX6n05bqNgWm3mOuOdYwZaPUiU1SUrSrybGat2+GkAWoE5JJtGAASOvz+zo0ski8DrZm8=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
Thread-Topic: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
Thread-Index: AQHdUcyw+vB+FMChKUya9aL6N17n2rbpvOkAgAAvJJuAAAfxgIAAIBbp
Date: Fri, 2 Oct 2026 10:52:31 +0000
Message-ID:
 <BY1PR03MB7996277A01F884028C5C2D04F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-2-kevin.lampis@citrix.com>
 <a91fef08-3a0a-4a71-9618-9d6d3e74112d@suse.com>
 <BY1PR03MB799623147B668DE6406228E4F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
 <2db46bf6-87e7-4f1f-b440-b73be1f86b55@suse.com>
In-Reply-To: <2db46bf6-87e7-4f1f-b440-b73be1f86b55@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|CO1PR03MB7841:EE_
x-ms-office365-filtering-correlation-id: 110f3550-5ba4-4aae-4e23-08df2073420a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 sVzPx8WRaLryM4/WsJHyBbmcve1f0L53LliMl8dg4oNmSxylBWXxUwHVs3CnuKUSp1vrpFm82OWTYt6uYOYzKxZMHQlaUH5GXpT+ahweidZPXBiyqruuJZKggpXjaTDB9QI5Mk/S6iokNmNH6a4AL2qc1BtbW3CQtoZ8Oe36pCqYh4IyELxbyluID/RGtB6a7e4Uct0fIZbxo5PnfhwmGl00iW1O/aUX0cKoRp8DIhXS3oYjmyY3NERP8r1ASqhw5DBFd2rt6SsnOtv63BL7biH7Eu53N+J8Y9PKRvuUy3SiRzjNpApWMWp2BmqIZE12Fu8M1bO81en5V92Lsbpu/R1uVmBYOB8dS7bpPl7p8HLevOfSxjtMsKz3rK5wg6VkWLGa6nNOSzVWTrOT4rFHDHv0rLl90mb6BqIJ6Kij0do03fDZ2IjLEhc7H2XCsF1v/38XwsDtbqarzD6ntCUuBsLWER2r9o6ll+8CY4flK5uUC8Oj7RzTOBS22HHnYvnjFvTN2ALP2e8zUM2OyOIMsU6hEuqzACiz5PyH7HLfacS63E1Xph4OxFWoSIn3pocOTmW6Z+JYVzzVYoTYwxJWKKTZVis4KwA7dTo6f5BjPrHZJP4aPcHV5w6muvxEkXt0FBF2+4T2t5p48e8sKcmDQkJT70cvdVmLJDkFqyzObHI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TSPA14YqH48z4+K1PLhz3NHVhSb4hyopwtG79Tj7fzdeamIV5n4M8CJPc2?=
 =?iso-8859-1?Q?YzaSifhWRP57UXWbQ2i0otlXtgC6aKHFXE9ldUlzZQkboi5YWHauDB06y8?=
 =?iso-8859-1?Q?bxEwZFTP+No8Z4LfJpDgAo8mTIqBKhDQBSuug+dppDVa6y4/6E0yS45J96?=
 =?iso-8859-1?Q?1osgLt0ANrz+WtsAqM/HyQXeVRYiA+OIW2ZAN/y40iAHuOmv5//eDUsCB0?=
 =?iso-8859-1?Q?qhcNz5bAAaKvfVpt/opmzlBoSh7L5T35uIAONQlah3XpP53wx7T4OYgy21?=
 =?iso-8859-1?Q?BqOiRyDopeF7qXqBllLd/Bu814rXiNZXLWHhVsa08rnL7suo1rm2PhITqD?=
 =?iso-8859-1?Q?aBOeGq8rqkqNwW+9dBQtrjB1fAeqRjJ4S903gPr0JMoJz++HnE7STgN8+C?=
 =?iso-8859-1?Q?8Gtbh3ftj25lXOBl8lLNnMFqgaHWYtmQmiE+nFH/7P6X+XOlTWf1QmJFzt?=
 =?iso-8859-1?Q?j4lOIzjh+X96egML5n6nGrGe38azW1I0ChTM5eWwbyFd2okh9PFWfvDU+h?=
 =?iso-8859-1?Q?zd7lf3vaHR8pDqL8E22VQNFpCWGH9bjoRgwqj268VCdAVwO+FV2XRVBiyz?=
 =?iso-8859-1?Q?XgxqtELoHV+2nqcnd8vEl+VD/axYCI/XhzHceILNuEDd7mw2Bs5NYOXYgj?=
 =?iso-8859-1?Q?KcTZ2NjxYoLazAz47wCD/Sl6Al7w3gQ0nhOLFSiginCorSvQAU7dz5bPs2?=
 =?iso-8859-1?Q?ylBP6+b8IC5ZEEd9qXpam6eIsXYEXG6Bd5iNAo6cTFaczec1tPsHCdfB0E?=
 =?iso-8859-1?Q?Zi3oEycgmPcON9sqX0L/SLYvkojfDWxqUB1lDt0Wn2IatiX1E1aJmGLnmg?=
 =?iso-8859-1?Q?i+V+cpVOIVXHumjgOeX4E+9W2is501Du+S9vke6/7qwReCqV80+Dzlw9/x?=
 =?iso-8859-1?Q?5//jZeXzS8huP+ITD9q7iL/b3pEClO3p+FdZo0xwUwQNFWzSXSBD4kNc4s?=
 =?iso-8859-1?Q?KL1Zs6XWw2p7o9cpmJCr55m5jh6FLONV5iCElD+FhEeN7gzE1XVo+wqXlb?=
 =?iso-8859-1?Q?0coJrQ1u6/vJCKvaWh2SL/Lla3VY1VjWaHTsOrbpS29cEdDKao1J4WSagJ?=
 =?iso-8859-1?Q?F9EaypCKcJTnl5NLXJO1ZuVtNhHoY3fdQgi5uTzD0r+J9KuH6FepgTUkjP?=
 =?iso-8859-1?Q?BI6CF7s3HmQude3MhacSeUP7Ynw6hu0LkdNzQhoJgnHRv8CUPgSstPHv/x?=
 =?iso-8859-1?Q?xQ+4J/1m6uRAXfyVw3TqGBZdmygXFaCbr7ec/z/G4fkyfgsmtALsJKnxxd?=
 =?iso-8859-1?Q?uctEi7xyaaXv3twMy+yVYhnh+yEwXTVYhyMbQPxpfD2DnaCTM+QU2qoc3E?=
 =?iso-8859-1?Q?GbwxJKKXJj9UtSBz1ok6zx46UMGXwwioSgGN3cwSGbZc/2WRDPM2xKToXw?=
 =?iso-8859-1?Q?JcyGw9LOJo/Pv4l8cFByKyAL5O29jTzeQ17WGo1hA5rL9hNkkRISIDH9G4?=
 =?iso-8859-1?Q?h9sOOurNaRCJFVhPYRaFrbxQAOXk3YtNtnUY2v6kWZ75RtrpzxycU3BoV1?=
 =?iso-8859-1?Q?olpn6DCy7zJdXQsxXZDPTmZU7SMn7Q4tYgBEWT6XumA0m3FrnTGUpNbDH6?=
 =?iso-8859-1?Q?UiAYFISUlNI1Sg4IRo/tCapg+1QdcnUgBmy+De+ESP1C1Q04TLMyE9PJOJ?=
 =?iso-8859-1?Q?YEykL1TmiyLaL13h+cdI0xGAcqsZFViOQSnohdhSWEXtHrnMbW2OdIA5py?=
 =?iso-8859-1?Q?XoEv6PfN89DEJ0XS/jQbutxKmBRfDtsTXN8E1hU+QF844uHJs19DXbWaRd?=
 =?iso-8859-1?Q?ETYTP/uTfDvl1TDU6dktBv4qnijLnFxe58EhJoGKq5d1K/ZO2N6rSegh6j?=
 =?iso-8859-1?Q?zEWTV3AwSw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110f3550-5ba4-4aae-4e23-08df2073420a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 10:52:31.1018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMl17Clcy0u6cNZnVxFZdF7EHNUwf37GiFalt42q5hZHqP/PaVDP8t40pv3F0NVLm30husxF/FPaJgAQeUURjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7841
X-purgate-ID: tlsNG-16d1c6/1790938380-F480577B-B45943F0/0/0
X-purgate-type: clean
X-purgate-size: 168

>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D5ec86c22b4b3f26=
eab0fe9af4cbd0f90d315d820=0A=
=0A=
I'm sorry for missing that, I should have rebased.=

