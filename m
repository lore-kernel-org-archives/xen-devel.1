Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1499EC55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 17:21:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381727.1625269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqwLA-0006pL-F3; Mon, 03 Aug 2026 17:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381727.1625269; Mon, 03 Aug 2026 17:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqwLA-0006pE-CV; Mon, 03 Aug 2026 17:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1381727;
 Mon, 03 Aug 2026 17:20:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wqwL9-0006p7-IB
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 17:20:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqwL8-005wQt-Io
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 19:20:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a70cdd2-5cb7-0a2a0a5109dd-0a2a450aaf30-18
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 19:20:38 +0200
Received: from [52.101.201.67]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a70cde4-f2d2-0a2a450a0019-3465c94312ce-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 19:20:38 +0200
Received: from LV4PR03MB8234.namprd03.prod.outlook.com (2603:10b6:408:2e3::8)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 17:20:34 +0000
Received: from LV4PR03MB8234.namprd03.prod.outlook.com
 ([fe80::264a:2e82:2064:7fab]) by LV4PR03MB8234.namprd03.prod.outlook.com
 ([fe80::264a:2e82:2064:7fab%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 17:20:34 +0000
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
 b=sQDUWfgloOuBhgGFHAs9LKFSjxN5m3HrWFN/rrazmfKbR4zEKz33sQw+g+lTc7+4BNE07lOE8qyr6DRlGsIG9oIZ2X63NoeoD8+NlfuOThUy2nXcIEk1X97e9sjjGPMqUGuTBdwqA0s+WmQdfFQJpr6Zno8QBx7iBS1wAt5hGThUpn5o7664OnVAmYnf99/rsawE3njOxlv0/zHpRUAeMR2vJscCZbs+JyJECxJQUsdtthIVvseNR1/E8sZct+YnM5GuUh7XfZDxQTOumnYPPTS8Qme7h/DjCXwFXIa5nHi4lPHb01LYSxQbaxb85FE0Kq9PGbKpd97gs+SI2gyEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McJSzCrEOR2LSblxBLAbR8WL/F8VFRGO8LEK1pbv4AY=;
 b=ksvdd48KX+t0nZiRJRkz5W2sKjJLt+Z5r+yPUJaeo6yuquLM+QgW5fI/KVwq+E4/QsB6wBrnQBXG29WrhEK/72uoNJObp3/4bht3GwaDy8Jm8aFObWXYPsfVQBrrXEbiLpdcGzfupGuVq6+9P5K5AqowY96421l0jN/wZnm6kG3fNGbe+KRYL6mQgSMvU4cCJf6l2eFHWXykWjC+gUJ248CuCc/moJoxcuUvV2ShiEbIipdx86EPrY4X6rHzpEhxjXRh9PlxJLm4ihCzdW/3gz5gA07i8xSsTX01PBlZultik1oocLpJHOPMTCi8FdbrQqUCSqOSuu3hYRPge3rBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McJSzCrEOR2LSblxBLAbR8WL/F8VFRGO8LEK1pbv4AY=;
 b=X4ff/j7m0B/uOn3cOa7vwuvZjoZRR8QlkQkDZ/A0Bj8zSHFzVWOkvKcqOmf04KFW6MtA6ylZxAAApsh1mxk15ff23uInBMz1oT7kWtzosZL5Dch6jozapfaXK2pXgihpMy/vyAw9GC6dgoetNK0f7Qn+MCX999TDW9gpL+xbo4g=
From: Marcus Granado <marcus.granado@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
Thread-Topic: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
Thread-Index: AQHdGF9mhIhyvqGSRUyPVZ4Z3HHB7rZ3oucAgAJQsgCAAB5PgIAKMo6AgAhhrfE=
Date: Mon, 3 Aug 2026 17:20:34 +0000
Message-ID:
 <LV4PR03MB8234F0C54B63FABE4D749FBBEDD52@LV4PR03MB8234.namprd03.prod.outlook.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com>
 <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
 <CAHt6W4erBfB+H_0d+2rQ0apz9Jt6ex+WVjEjyPm6EApoHVJgmg@mail.gmail.com>
 <1784755834.8631fc262581453bbf619ec5b2062170.19f8bbccffd000edb5@vates.tech>
 <CAHt6W4cWLfSVoCSgr-YsQb1Mv=VZek0CakTBwK7tx_n9RkeiUg@mail.gmail.com>
In-Reply-To:
 <CAHt6W4cWLfSVoCSgr-YsQb1Mv=VZek0CakTBwK7tx_n9RkeiUg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV4PR03MB8234:EE_|CO1PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: 2dc8adee-03c6-4607-bde3-08def183870d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|376014|1800799024|366016|38070700021|6133799003|56012099006|4143699003|11063799006|5023799004|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ai83XngNyv26uaWP2TIu1i2LXQtZvSNRXXPDdBMeALD85fvLZDdLgnTCikrFrmhUnOl0lTW52P5IVVYrIEaGbivG3ipOkpA3Ua1EJR0bjJKOnGV4/6teqrQpzADymFu2pbtrYy3smjFb/qRNh3mJOKPeFd/gslvVPEpJKrbtfs2zhzVOizesBMmV1/UKc5xM1CqPBnjYO4ZtUfDrEuvzUwKwQ43BlbpT5x/OTZiJYzp102X8hrWhiT2FuYn4mEcop1EoVaEIfNd4SzKETLUJvMS7ZxDzdMFXPqTlFh2dHzERQkRFgDD55pk/7sGGYTOTo5jT6cqG+kQy/0On0+P/GzJRxqn3ty27m37VXmXCPRgul5KuKmqlMdr9k70Oq08TuA0mTd7n9Kimkcg/PFAmSz4/ZlYI2WraLKOydWJUeSY03RxY+nqvQ6wfTWNJK0HjlaDb8L/3AOrvPPkQqSK6oTXHJDT3KqSVp56KwX3juhnXiRl84H9tqHDTp4rUcpG8dyIHBzw4hvWAuxQ2zoI+SCTb+YAlGgsCKOwTVXvVX2jXCqq6ZT6q4gR/bfYacdB0vgfThTFOT85YX9hEr023jtXbw4PpgeUAN4OnQlxHi+Qtl+iV4zgaPa0WnkX5sVLEkkDQUUgQn5xG4CaKd+lc4oHOhHANCz2AiBB5Ir2xVXOs200fCfhgZxYz7lp0Hqb4cMuwOGCn+m6DvX69/2/hOHWkeh2mTSFC8cBwyd5QFKo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV4PR03MB8234.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CV1LCZhFdxcJxtW4v20HQ03VEW6Lm19DNNJez83YIu9AWHLB4L37QYh8d7?=
 =?iso-8859-1?Q?Brp59IqJl6QmzyPhpWC0ehZNbsZRhA1gA/BnAFQ7/lcbRbs3+CfStRvh96?=
 =?iso-8859-1?Q?H4ItjBlcn6nHGeK6x9HH9DYI1yRCKYlXddGy2VhfyxmsVIxGTdF6JdIteH?=
 =?iso-8859-1?Q?JzPQnMzvdgmcx615T50cvwKcUP2rLtGiEhD4qMRRI5NXK5DOHeemJSTiZ/?=
 =?iso-8859-1?Q?vhEHLE2kg/1e/H3Q4i9T34Jraa9XKNeTPZw4bNvaEo7BlbcGk6XkmP1q/c?=
 =?iso-8859-1?Q?BNIaTHnUm2488/Q5FZSBzfNtACkFJ8wh7mPstPtmOFv6+XHskicITYZjmL?=
 =?iso-8859-1?Q?lFHoUTYPsuw+LguZf+wOta+5crV1FMf9ke7DR05xbSFL5T0Kq76O+RzrBB?=
 =?iso-8859-1?Q?ZqcAUB1loIeHdnwvqCOHiF5VpQIlWy3w4163FV3brVK+bC7K3CJ3iLHw2b?=
 =?iso-8859-1?Q?KT6aEv17UeVLq++uB6dPVVdDfaZFMuvKpiVmGt+dKXD4Y3DrSvZN7e+eCb?=
 =?iso-8859-1?Q?19ctMu3td2WZT8ytZ/5fWCTVa3IpJbuwSW+89hy2/UoEg8Wf5c2zf9gFKc?=
 =?iso-8859-1?Q?jEjcnOOpa44XKfOJaYNV6b1VHw0C0gjfpzFvH9B+wepvMeVl1ZEMLJRxft?=
 =?iso-8859-1?Q?whONMBUuKFjXUf7Xi+3h6do1qv2ooYxytbegePOEQ+VmoiKRLlQjM0JxEQ?=
 =?iso-8859-1?Q?RHKL+W4DLwlNFqwf7+X8aKKsltd8zdK6Nb/Ck22lziE7m47+UPOX136tYE?=
 =?iso-8859-1?Q?OB3zE4BbZHw9l3RPPj7xhq/qWHlLZWUXGo2Yh3DKckoRTZqJ4TWjzMJ+8E?=
 =?iso-8859-1?Q?iuU9iD5pL76xzZpLJmuLGkK40RqvH6issF3abrnfP+4PIhSZS9znbVW18Y?=
 =?iso-8859-1?Q?rKruGvUqJ4vEA7Asedwu5JWxyWdZ1DpbOH1pfvBAZKRrqSvqSvyMQ34ZqP?=
 =?iso-8859-1?Q?OKJQJEvS1EigWGnmezKlCdEm+rvcLi2G8VgWqXBDmR1eyOKpdPxL8ewsq+?=
 =?iso-8859-1?Q?COKmbJ1joV9M6iPtLqVK/tNpiptLLlF93D/w0V/VD0dBLIDb8BeFlNLpL3?=
 =?iso-8859-1?Q?MQIwGeZmWpwCieG9hH++VfrCGtjPdlBVaaZC8X1U18sqZeIiiQs+SXhjyd?=
 =?iso-8859-1?Q?vITmrZND5ImxtHMAIMEu7N047XhROrwo63OiWbyGFvQYQ5+USQnyCYtP+F?=
 =?iso-8859-1?Q?rf4fuAWev4vxVk/qz1eUCEhE/0lzGuKzkvHEx1HnBiEBQHglehgTKLCNBd?=
 =?iso-8859-1?Q?3lJFpSvxZHE+Fzz5i8v8GQbb+9WFJFdEZ9/IXrNsL6/1toE+uFgGHpsaRe?=
 =?iso-8859-1?Q?0CFGhmev089GTmdqm0lUiUq0MZdkV3b6nOno+F7Qxrl37ooVQ790LmpAky?=
 =?iso-8859-1?Q?4BWlRJMwmBKESZf3u2Xd2VxflQhypzj8JVh0joKQV99TwGPKDK2CNwtbTs?=
 =?iso-8859-1?Q?Dacq6h+gTn/Gzwl3v+kRKiYV1zhuNzgiJOI+Cm9tp1MTJBzwoRd8WltaUi?=
 =?iso-8859-1?Q?I3AKlMC0huEAu/Bu3NIwqohOMDZ8qtP1EUPxTZqH5JxZNWZxQBZj03lzjr?=
 =?iso-8859-1?Q?XsCspqAufJSHgEXx7MQRwEF3QHJCB4H9hNQyJRMcC1/Zxm1IeWExxwAKUV?=
 =?iso-8859-1?Q?+R/Mb5wj5Vc+g/mFfxNDSrEbAMvVGcEgIVqlo8YRXPAdYtrf93zpMLJCxG?=
 =?iso-8859-1?Q?e/JrcVjj5MbhRZE7TbaAA/kfnLjn2PgQlskKGTdkdi2Rnu4M6vwUT3UlIG?=
 =?iso-8859-1?Q?0U8C9QqgBY4qEaCeOxRh2PPjUg6j4EWuBmRy2c26i+4u1LJdqG2LLt8Jga?=
 =?iso-8859-1?Q?9uG54wwtB6b34tlGBhTzLgM66iEbswFEe+sATmRYRHPcbYA5ypnJfKTrdI?=
 =?iso-8859-1?Q?6X?=
x-ms-exchange-antispam-messagedata-1: oNOkn+7hI2Z4EA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV4PR03MB8234.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc8adee-03c6-4607-bde3-08def183870d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 17:20:34.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMB8AhLHGpRApPy1gWhSVIu3USMA/kkE1siULy1+gj5XYHCR2TW+QuRwFF4MyrmPLz0n6MJ5Gw8nZxvS/qSzqFBoxTdSXjjStSzdPi0Pu4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-purgate-ID: tlsNG-4011c0/1785777638-5ABD8CFC-6497A97C/0/0
X-purgate-type: clean
X-purgate-size: 6810

On Wed, 29 Jul 2026 at 10:14, Frediano Ziglio <freddy77@gmail.com> wrote:=
=0A=
> About compressing all together and considering also the issue of=0A=
> memory changing while sending I would vote to copy the memory in a=0A=
> temporary buffer to avoid this. One advantage is that it simplified=0A=
> the format. The current LZ4 implementation seems to cope with data=0A=
> changes but nothing guarantees it in the future, the buffer you are=0A=
> passing is not supposed to change while you compress it.=0A=
=0A=
=0A=
Agreed. Frediano and I discussed this further, including simplifications on=
=0A=
the compression record for v2 so that the page data compression:=0A=
* compresses the whole batch together=0A=
* and uses a staged copy for it as you and Teddy suggested (so that we do=
=0A=
not need to worry about mutating buffers affecting LZ4 or other algorithms)=
.=0A=
=0A=
Once there's exactly one compressed blob per record, there's no need for=0A=
extra fields to describe the compressed data, as the uncompressed batch=0A=
size is known (and bounded by MAX_BATCH_SIZE * page_size), and its=0A=
compressed size can be inferred from the size of the emitted compressed=0A=
record without a need for an explicit field for clen or a field with the=0A=
number of raw compressed blobs. This means the separate PAGE_DATA_LZ4=0A=
record type is not needed, and the proposal for v2 compression record could=
=0A=
simplify to reusing PAGE_DATA and spending one octet of its reserved word=
=0A=
as follows:=0A=
=0A=
=0A=
     0     1     2     3     4     5     6     7 octet=0A=
    +-----------------------+-----+-------------------+=0A=
    | count (C)             | comp| (reserved)        |=0A=
    +-----------------------+-----+-------------------+=0A=
    | pfn[0]                                          |=0A=
    +-------------------------------------------------+=0A=
    ...=0A=
    +-------------------------------------------------+=0A=
    | pfn[C-1]                                        |=0A=
    +-------------------------------------------------+=0A=
    | page_data[0..N-1] if comp =3D=3D 0                  |=0A=
    | or page_cdata     if comp !=3D 0                  |=0A=
    +-------------------------------------------------+=0A=
=0A=
with two new entries in the field table:=0A=
=0A=
comp        Compression algorithm applied to the page contents. 0=0A=
            means none, and the record is exactly as it is today. 1=0A=
            means LZ4 block format. Other values are reserved for=0A=
            other future formats like ZSTD etc. A comp !=3D 0 can only=0A=
            be emitted if 0 < len(page_cdata) < N * page_size. An=0A=
            unknown comp must cause the receiver to fail with a=0A=
            "Compression algorithm <value> not handled" error.=0A=
=0A=
page_cdata  Present instead of page_data when comp is non-zero. A=0A=
            single compressed object holding the concatenation of the=0A=
            N page_data entries. The receiver must verify that=0A=
            0 < count <=3D MAX_BATCH_SIZE.=0A=
=0A=
=0A=
Teddy, I hope this format covers your points: it's no longer LZ4 specific,=
=0A=
the inline clen inconsistency in libxenguest record disappears, it's one=0A=
block over an immutable copy of the batch instead of one per page, the=0A=
decompressed size is known up front, and the allocation derived from count=
=0A=
is bounded on the receiver.=0A=
=0A=
=0A=
This simplification is also forward-compatible in two different ways: your=
=0A=
64KB chunking for cache locality doesn't depend on the format, as the=0A=
staging copy can be done in chunks while still making a single compress=0A=
call over the whole batch. And if we find benefits in splitting the payload=
=0A=
into several compressed units, that can be implemented as a new comp value=
=0A=
using a self-delimiting format like zstd or lz4f frames, which report the=
=0A=
consumed bytes without a need to specify clen or extra framing fields at th=
e=0A=
record level.=0A=
=0A=
=0A=
On Wed, 22 Jul 2026 at 20:42, Frediano Ziglio <freddy77@gmail.com> wrote:=
=0A=
> Don't we need to bump the version number while we add a new mandatory rec=
ord?=0A=
=0A=
I believe we may avoid having to do a version bump if we adopt the property=
=0A=
that 0 < len(page_cdata) < N * page_size when comp !=3D 0, as in this case=
=0A=
the compressed data sent to an old receiver would fail in handle_page_data(=
)=0A=
with "PAGE_DATA record wrong size". Bumping the version would make=0A=
uncompressed migrations fail if they are sent to old receivers that also=0A=
understand uncompressed migration, so avoiding if possible would be good.=
=0A=
The spec says migration tools "shall always save images using version V",=
=0A=
so it doesn't seem like we could bump the version only when compression is =
on.=0A=
=0A=
=0A=
> Is there no kind of dialog about the supported version?=0A=
=0A=
There is no in-stream negotiation, and this proposal does not add one.=0A=
Compression is opt-in at the sender via xl migrate --compress, so an operat=
or=0A=
who enables it against an old receiver gets a clean failure rather than=0A=
corruption.=0A=
=0A=
> Why not extending the generalization compressing all payload of=0A=
> uncompressed packets (type+body),=0A=
=0A=
A composable wrapper would be a clean generic mechanism, but I think there=
=0A=
are two reasons not to go that way in v2: PAGE_DATA is effectively all of t=
he=0A=
stream bytes, so compressing the other record types would not show up in a=
=0A=
measurement. And the no-extra-fields property above depends on PAGE_DATA=0A=
specifically: a generic wrapper has no pfn array from where we can derive=
=0A=
the uncompressed size, so it would need explicit algorithm, compressed=0A=
size and uncompressed size fields on every record, which re-adds the fields=
=0A=
that this proposal tries to avoid.=0A=
=0A=
=0A=
Please let me know if the ideas above capture what you had in mind in terms=
 of=0A=
suggestions to improve v1.=0A=
=0A=
In particular, I wonder what the maintainers think of the use of one of the=
=0A=
octets of the PAGE_DATA reserved field for the purpose of indicating the da=
ta=0A=
is compressed, or is it preferable to use a new PAGE_DATA_COMPRESSED (0x13)=
=0A=
type record as a mandatory record so that an old receiver fails more cleanl=
y=0A=
when it doesn't understand compression "Mandatory record <name> not handled=
"=0A=
(caused by the specification of mandatory records) instead of with a generi=
c=0A=
error "PAGE_DATA record wrong size" (caused by the current safety=0A=
implementation that rejects unexpected record sizes)?=0A=
=0A=
=0A=
Marcus=0A=
=0A=

