Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BB606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=CIHaUuoM
Received: from list by lists.xenproject.org with outflank-mailman.1501401.1697464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVufq-0008WA-5D; Tue, 24 Nov 2026 17:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501401.1697464; Tue, 24 Nov 2026 17:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVufq-0008W3-22; Tue, 24 Nov 2026 17:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1501401;
 Tue, 24 Nov 2026 17:51:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex.brett@citrix.com>) id 1xVufp-0008Vx-5O
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVufo-004LtD-Ac
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:51:20 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6b05ce87-8faa-0a2a0a5109dd-0a2a45019556-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:51:20 +0100
Received: from [40.107.200.64]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6b05ce95-5bcc-0a2a45010019-286bc840579d-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:51:19 +0100
Received: from CH7PR03MB7859.namprd03.prod.outlook.com (2603:10b6:610:24f::20)
 by SJ0PR03MB5744.namprd03.prod.outlook.com (2603:10b6:a03:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 17:50:14 +0000
Received: from CH7PR03MB7859.namprd03.prod.outlook.com
 ([fe80::967:59c2:d16:1fcf]) by CH7PR03MB7859.namprd03.prod.outlook.com
 ([fe80::967:59c2:d16:1fcf%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:50:14 +0000
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
 b=KSCZaG7+j/WkjPqg8nFbLd0n0dnb0VevbTHvD60xmOVu3AIHYef6mSGDjwDkIwRKwGOuWJZrnYkH3yDwaNrYi9/sLRM/TVYtYMYyhQ8XUHY/Z4nXQXzvR9lpwqsoGynqOwYmLLaXjYZ+fXNpZ3gPpt0fkHZU3I9+tVvrHOYV5MmurQx5ydZJCgacLLO4viG4lIfiOvxOljsgUDe8jQBw6UtJKBa4cV2ZjwrS/wEUDHhUS/uBY1N9mcHmeMjKicHylfBy8ZM+a8it7Tyqtc9rMZT1n5WljQTjFUaZhjvlaorsWBH+yN8uCG7IyhTAKnXoWMrO3BL3a019PFQbMfBf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TURF5Cn7OF5XBijgyj0Doy0rP8ZpHpdJaZWY72lgzYo=;
 b=fFXasXUWF9bc16XwYMVSJ/Sk12qyKeR94u06ZI4ep/uMlwLBQxVrscJJ0Iy4HXWzH4RgP19fd+HmCtmzGSxTlYNUUOFssFlzMxwMkWGynsoqPKCsrHzCeXrmlFab9njulkGpngEYVWigVkjSJfWUiJsnvHrevsAvjbZcFgIcJSLeHQL9SykcP3Dw8dOXjte9ZvD8VEuSaXtfoaG07iuRav6SqHUIucyXaS5TbdVnLZoUYGcAtxZOQ6oijzdKUg90X24iBtBBJSfmy/Q1uj5SLLSStufhbrxUum4LT7AoK963TEyHXV+T1XdnMFRkpPtpfT3kX/WbMRCJELwWuSiCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TURF5Cn7OF5XBijgyj0Doy0rP8ZpHpdJaZWY72lgzYo=;
 b=CIHaUuoMz1bhTdEXHo0sN69a+5ECmBFBzCeTfHlBLSi06D9f0dW2B7V+dCsK7/Q7Rk8kSM0ehDwGJYgSR40N89I5Tky2bVUI+sC7kuhpFD1gY4Dux/V3LRK9OJ+ncwfBFboYiQnMYbSF3Tcy0hi0OyMLDCGazo5RaECe9P+qHsU=
From: Alex Brett <alex.brett@citrix.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen-mapcache: Fix a build error with -fexceptions
Thread-Topic: [PATCH] xen-mapcache: Fix a build error with -fexceptions
Thread-Index: AQHdfAjNhQfIGpX4FkquReWyKCmM97c9NgYAgABIgBY=
Date: Tue, 24 Nov 2026 17:50:14 +0000
Message-ID:
 <CH7PR03MB78598CA14D0E71AF483463DCE3442@CH7PR03MB7859.namprd03.prod.outlook.com>
References: <20261124114127.790173-1-alex.brett@citrix.com>
 <CAFEAcA8FLcSkUtFvRF+mc6U1kjJBBVB-iLyfDgcpKBuDuP8hog@mail.gmail.com>
In-Reply-To:
 <CAFEAcA8FLcSkUtFvRF+mc6U1kjJBBVB-iLyfDgcpKBuDuP8hog@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH7PR03MB7859:EE_|SJ0PR03MB5744:EE_
x-ms-office365-filtering-correlation-id: 53f150b3-78c2-4cfa-5c12-08df4a5364e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|261009223027099003|22082099003|261022075727099003|261026121527099003|38070700021|56012099006|4143699003|10067099003|11063799006;
x-microsoft-antispam-message-info:
 JAqSH3/3wn6GaoATP+HB9xEyLs3LvdSxWpBbBKkS63L3XUq6EJ8fwV5f4Ox5Wg8al30Cwx8wwMMXcxL13pg/ievA7PnvFQKF3mjDO4v6Wo/gj5kBCS+B33GFMz7/DcloMR5oo1ANk4YuHbU39aC4YCyU9vlKNVstoCwYhVD2AXu9IdIsznAQ0/jydkwrs5H4j53S68/8QhDvntOKWizPljqNt7VAO9564/LbfaTlZH6HxVf/jp1pTzle74027wksXS1hP7PdKwEf7h1QFCingou8yYnQXE++Sw2/HrSMRftE2bcye60AxmU2dHMJ62OrVgETyQ1t56UVpz2Hcr1aT/lUhoLi5NyG7TRUGYdPDjML9CrWLvgtMNQm8nhuWfdEUb7u4hnnvMqibkKSOHoW7X1tS67BdaoYyIcYN66ncACkwhiXmfIRKcTYbSkaN1v3XwrkwZvpggLEy3rgBbDezhhWVlIAFYqBBx5bbpcb6oV5rZ6SlNlwh0/scurMzDuMRvSq0dqwrcTba4yet96pFCuy+r/JYNR8bJxpyaXDtCZ6HkuW9E00Mk26jp5rRvShA4+qag7TgKmIEQwae8QQr39vXjreMht7iqC4DvpMmj/y48e6LlGxunN1pA9XTgH5VtR6vJVKywW+vlTFFQn3JGao9AWUhVpCYstVEF0+5Ho=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7859.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(261009223027099003)(22082099003)(261022075727099003)(261026121527099003)(38070700021)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t7rRAesvuAOylY7rgE/JftVFEZhurZ08NVboBlhexjWyCrgebQS80APTrl?=
 =?iso-8859-1?Q?/Pg3xwA8U2JOwmhd7LUS6b7mnN6sN4K5399a/7UHqb4ne0IjmRqgJR5b1E?=
 =?iso-8859-1?Q?ODd5k1qnVWDnYpO4gUFe2pgr474RNDOcHHSMD/90DQU33Yq+tYNmBFCoTV?=
 =?iso-8859-1?Q?2vDTSJaGoywpQZ507rIRnX3DvTkrhoSd9nxy7ZQjTWbBxUHlh4l1btlHiw?=
 =?iso-8859-1?Q?Z5o6Q1mP2yEbzQuxQ7YPsyKMUi2m7MF7QKg1hfq9Wd5B7p+VR9GRNQPJz+?=
 =?iso-8859-1?Q?wGSNlVXFJji1wLDLRBSnfMJNshxWbtMNIO6WgxQIUNGsm7ZePMfq0u9PSp?=
 =?iso-8859-1?Q?OBk4Q0RQc8l/G0IdnHRjGHSNHtQmp2e1MbGnhqnrNE7WK0fnYOs3Vimeqq?=
 =?iso-8859-1?Q?JE2cn9xdsy0NxiypaEjbN78ZxQwdjocMs53+RfmcHf8gjuwMuWt0bK4AkS?=
 =?iso-8859-1?Q?638PVJkftbzr1rIS3paqfXP2jdaRk6+tTKaSFv3AX/dvEWZDRyqGMfC7ox?=
 =?iso-8859-1?Q?R0DAiwnZ6QnjU16Fvm7udv0N6FbwUpxukdH8TXpiXkTsjkwUdnRRVwNmkP?=
 =?iso-8859-1?Q?GtLbzyC9PGzHKFwe7TXnGHVVLfqTpUZ3vvHLiDZMAu6oTOZJjhrlLWqKeY?=
 =?iso-8859-1?Q?MX+IzQfqtD5PL7iNqvwqDKSRTR+AOlh0hY2+bvhDos/sFwefE+WjH+X2rF?=
 =?iso-8859-1?Q?HgMazFpfJzfmraVtObguvxeX3+dC6z1igaWOVoA8WROUy25dIvEqnZELuu?=
 =?iso-8859-1?Q?vwqBPEzAIAhSgEDlqE4vyYcY7fFxn8ebd49+YmA0f4SAmUUFWDtAjc5TQ6?=
 =?iso-8859-1?Q?PaEmmoVWvdhx1agAxESLvCpPVM49nyz3VUS471APuzu8sIJMpwyIw2/OtZ?=
 =?iso-8859-1?Q?uIWejT4dTKCmzEaNWulO3U2qIjJQU0OmIJ8Q8Z/UBa8WpEAoMGbZjFdmEl?=
 =?iso-8859-1?Q?3KlSmfPMFJWtrke1+KMQ9orbolo0EqlQBbm1SED8mZPUSoIycZ6c2SVkUq?=
 =?iso-8859-1?Q?NyZHGVWsPnCLT7EmSZyLCEms1BbRY0LUpJ1kIEiy9LMGMsbVMs9d2XzeqC?=
 =?iso-8859-1?Q?IMggclc0LjHKz7rxcHVjXvUev5qRTm1xJxKjLt+yuQBEer4c5vBW66Gqn2?=
 =?iso-8859-1?Q?MSr96hSpyMsKDR8G0q2fruQT7szDd0sDnYtZvoiWQU67z6AYvv2t5wEJf0?=
 =?iso-8859-1?Q?9Y2YzYBYkyD0e5GnenIEiu99ZGqZz7eeO1UZD/skW/ZKwuHdaUbkKKxSBI?=
 =?iso-8859-1?Q?Pii3VaBNoYKwWEiE04kbmS4HAqMkIp7+mNw5/ksE8gfiYDgDTKe0LgMbT7?=
 =?iso-8859-1?Q?tNSGZc6kCSygI1dxoQrnbNrlpsEM0y7aAd8vfBV/5zrjrZsg/pIVc+RgXZ?=
 =?iso-8859-1?Q?ETGFdSsu5LJ44TiwlOCiziUKYOV/qmfUwrv7IFI7K2TAl5m4Vn6H1t9nk4?=
 =?iso-8859-1?Q?yxDcuJOINQ6tYRgHNBAimyPR5kk1tc8nUL1Ck6esmsdvPP2lZMv6KXEpqu?=
 =?iso-8859-1?Q?RIO77pNqEPTqPfaKcHQTGhIclOCFP257OaVzuRBzfP7WyhCpWM2e1+GRSp?=
 =?iso-8859-1?Q?170XQK7iwujauuukDj7h7eQIJXmDQKWMkdxodmXcozsa9UcZn0PrOEU7dH?=
 =?iso-8859-1?Q?5bNBsPCKUtjk0adpJu55QidapoB6cGRiU9IpBVW8yi0WqwGIbaaTHAUNXz?=
 =?iso-8859-1?Q?Pjp3hh68knUrJBBHlc4DpqPsKc9qJZiMTHA8O+h0INh3bmajxccdFUnDIZ?=
 =?iso-8859-1?Q?uhV0Xzcg5gU9vbgq8EpJHQVCKhZiN+QTXzEswETT5YqS+n?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7859.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f150b3-78c2-4cfa-5c12-08df4a5364e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 17:50:14.5338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRWitp8KBRR9hUdaUXFIeuBLAK1ibdc+V3YI205B92jK83E7UrOB8NpQKO5Aq7NQ7Enp4WyWdoS2I5SUVUjfZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
X-purgate-ID: tlsNG-d62444/1795542679-4F3425FD-6C99F549/0/0
X-purgate-type: clean
X-purgate-size: 479
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> but why are you building with "-fexceptions" ? Trying to throw=0A=
> a C++ exception through QEMU's C code seems like it's likely=0A=
> to run into all kinds of problems and corner cases...=0A=
=0A=
So "-fexceptions" is a default compiler flag for Fedora and derived=0A=
distributions - their justification is in the "Individual compiler flags"=
=0A=
section of=0A=
https://src.fedoraproject.org/rpms/redhat-rpm-config/blob/rawhide/f/buildfl=
ags.md=0A=
=0A=
Alex=

