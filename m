Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD804C88E77
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 19:37:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422064.1647647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6YyH-0004g0-SR; Tue, 15 Sep 2026 19:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422064.1647647; Tue, 15 Sep 2026 19:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6YyH-0004ft-PT; Tue, 15 Sep 2026 19:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1422064;
 Tue, 15 Sep 2026 19:37:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x6YyG-0004fk-1y
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 19:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6YyF-0085N2-6r
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 21:37:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa99e52-2eae-0a2a0a5409dd-0a2a4503b550-26
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 21:37:35 +0200
Received: from [40.107.208.45]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa99e7a-fae8-0a2a45030019-286bd02d6955-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 21:37:34 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH8PR03MB7308.namprd03.prod.outlook.com (2603:10b6:510:254::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Tue, 15 Sep
 2026 19:37:25 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:37:25 +0000
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
 b=NbSYQXNOIULcFVUMqtGecV97BIAlT9UUghOCZb22RDDBIbf2KabehI1gLUD2zpdr2/jmBuB4LyuehKUfRCxDxTL9PbO75kFpAo2IwgKzxTublF2L59e7z54XG+A7vwmQm3CfzBFPtbyV+EvVkJMecnMu9VOik1a+lYkFzDMx1/hIce9uSOKZm+mVbmbf8cCx+1R2ArYAbtOvOpUpEja+ZXpJOnFLg/hqOX20nhl7nimwczpWtiY555KnAClcqXyPjpkBs3s6+L2agKMuVN+QgO8d8dSbdZkHCjJLS4jhr1QNHE7x73/tEgJb78T7aBDXf6AD43fFE85xgAWzmv2yPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jge8zOljOUYlG2uCmO5vY/sOGSjD131OalvqMCXWsDk=;
 b=ldvONQiHCDKFm/ZSEZ7txEAY+5lBCM2VFoJV3tIg+MvWUoZkEYa92d2Dr61940F3d2UwuGqXU3M+y2VS5kqkGSkzOilEX5e6uio0//YAiAzWnNNmQ8XMZNLS61S1BD9nQQuZBdqxJt5lKxyfb2FHhzOLF3y5teUO0V/k77BlaPgLwbTqJlvsG+YK9JpWBKbMCe4i2Lv9jFcQ3WKvFVD63b7AxonFVuxdQRvaBeQEndj+HCg0dnONjcJoQEp8mkh0ThEhP9fGh1uY7aXsFHyLypFVK3rElCQjFuBxYa4SO/pTJHConlMNygA8hQ4wZE/NmzDUCL8LLF91aq6Mi7BrYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jge8zOljOUYlG2uCmO5vY/sOGSjD131OalvqMCXWsDk=;
 b=VnwAK5ezpraYiKLLyh1g39IOZOgWGQ+Q71WV1fQu7n1KSTfpT+8HSEYBiuJd49hWiTLPCFwruDxMo9o/Gf/MS6lDIYTq2aqP66OAu9kOrU7xVjOLTPobonRvNGHKrgBzEjVXYsoDjutMoSuorRMBR/h7EFYZOFp+mhTL19ghC7s=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Topic: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Index: AQHdQWMYYuOEW7sUTEmdu2MmKUu4LbbJV30AgAaz+PY=
Date: Tue, 15 Sep 2026 19:37:25 +0000
Message-ID:
 <BY1PR03MB79965A43641C02BC2267E5A8F3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-4-kevin.lampis@citrix.com>
 <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
In-Reply-To: <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|PH8PR03MB7308:EE_
x-ms-office365-filtering-correlation-id: 3aab7f18-af14-4a8c-5601-08df1360c4e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|18002099003|22082099003|56012099006|38070700021|10067099003|11063799006;
x-microsoft-antispam-message-info:
 4nuJVfJ1+CmQn+BeEihvC5HWcP+sZo6/QlkZPeJg9RqjcAHgidwQxAYnSQoOKppPu9kuqNqBqB/WkMI4heBRqgsgVj6YQwhOgcZfIOL9LN5tvagzH4q9HVjFaFFMXEI1U6E72lqtbEAo/cNyVTJR8MCkPfHxc82ocCjayrSdNmgCWe5wy5w66Xgs682osnyteR++lrw3+PhrrmrxhiIPRafE3aSqQdP20B2igMqqPH7YUGfgaDHgg4+Ciz59wX57zdsVWiTX4o1w+w5FBF0AShEWu1H0ht5NuHtxLRH1qa4c0W+pp9WQAmoALRs5GpKvKFjdhOHN2rN2FTZoLO1VsV9ek5952OJS5RXwI0CRJByQYi0+xVbMh3nHnhp9cXQsQArchsrGfK7+lFEp2plLvQ86BHsaC06AD5eZlj04Y2tnCz5wDuKbyV64D5Dldbsd1U14460MU4ZCyeYgTATBAIoCeor46n6yr9VyQfKg9IVuHEuMW0keKYL3SAY19xFo0qfuDYiRFpoGhawauhWolSy9+fdKFfCnI4NYoq7OfIIPvKfOneo+mZglMf9qrzIFVx7Pv+fOLGr0ox9AjQ27kpxyRNynHpDTKqRyRmobH384EBbypezdApPX19kz8XTXFHuHamiEKFXKGWmV7BUOjj5jcilNI4AkODhUoXuDbYcYQvpsG+ff+OG1AIDf+cPG9SQ4IdP/inFYV0kb11Ycscz6BebHfXdk4AWlUzmK7v8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099006)(38070700021)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?APXHXS7OuQDMX6X27aplWPt1hfU/mbNY+IkDPMFxFRItTy05WOpb/ybcVB?=
 =?iso-8859-1?Q?EzSqIJ9NmBHiO4Ci56on8O3yLb7GodIT17SaNx/Ev2sw4speug+6XIpf4T?=
 =?iso-8859-1?Q?ifV7FdMUVpFFbLJa+bJkZ/a/Z2p6zWNnUZagnSpOQ3B0GivXtyrBhYNeVM?=
 =?iso-8859-1?Q?M6SQ9KZBtu3uuS9dIOPPi4BUGC7nRGqTBuE8ilaMP/iX78/mK0N8ozaje4?=
 =?iso-8859-1?Q?IS7rbJjWerMCKFz1RAyW0GvvfRpz9rJ/u2iPSRh7j20v6/giZitFDuGvQR?=
 =?iso-8859-1?Q?eGZQN0UaxedUMgj39HGK8rKBOaWfaO3TOq5kGOT4Q2lMmReH/Ap20n46wF?=
 =?iso-8859-1?Q?wyUdIVIa7N+m/KG4qKusi11cMOzlcbu3Zm32uA/6ivIieSwkiFUJMnJV7J?=
 =?iso-8859-1?Q?erPevi1d7PED4hEUWkLlOUA9tRZ4eT/RgeUF2fmudy9Dp4Cs9xMRYX1p0Z?=
 =?iso-8859-1?Q?Mm5i20DTEJHnDkyGVuj8apq6ZAjeAYvJOhOn/LTdRd6AdtCSAitlLsDTSc?=
 =?iso-8859-1?Q?m75tmMwwQvlw919UFRX/r8Ug3gnlj4J4BwMi1lDWk0jJensBDI90awrUrg?=
 =?iso-8859-1?Q?jgj0pG9idfZ4GNSCHkhjTcOgYWMcdnPEJHrQFR945C99EpOutN7EfY+uf+?=
 =?iso-8859-1?Q?1bN68wE/jCzpn8f+bXwnkjC03AwLrdLlXq+E5HH4cOq1wFUnMmOmASUfGJ?=
 =?iso-8859-1?Q?39FcCx1FK+2bTUsBrEB9yuYq1dS9dTmnukGXi4JjKTbqGMitNcwDtzTdep?=
 =?iso-8859-1?Q?9fNSEOP3S9aQYe52o6SpvJSoe09tXZt5SPGkKwTgEoIs8qMgupeQc12Clt?=
 =?iso-8859-1?Q?s6cL1VUFlE7jtk6uxxqyPUWmv83r1xWTS3AB6qys/z0MIM4oIq+wp3y4e+?=
 =?iso-8859-1?Q?keA/aTYmemmiSyNvLFTu6k5/8fUVBoSB8Gyrs2aK+DAapsKmRMMKdw/PUR?=
 =?iso-8859-1?Q?PlGHaN6EIfeeEPXeJXbRLIByr6b0R34I/WeD5F+BcUQwpK3qLjNxhVketz?=
 =?iso-8859-1?Q?yRkBwK4z8EBm1nkum9OqH7Bwj8kUeo4oh9ofboe5BJQe8gglT1nE9Fscou?=
 =?iso-8859-1?Q?KRB1CElQrg9x3245eErPI1RX0npESvAgBLiyo1qxZuGvRdTOOdSzBjs3UU?=
 =?iso-8859-1?Q?gpPtae/cJeTk2JnDf/erjWK5Rw13N43Ig8rHtbaV+4C+P7Vq6ipOdPMPIn?=
 =?iso-8859-1?Q?mcClUtboXqza986tQWF9BtKkVKYbMQO+uijGZ0IyKTdT5IdHMZGqxOXYV0?=
 =?iso-8859-1?Q?tZIzN30xM0Ry5D5IiXEJSgM71nl5WzZO+CiZslwH8hIi058LDDMcOHWtSv?=
 =?iso-8859-1?Q?zucwzZRVXbt06EoFlvY5HexL36MWqaWLVBCmf5LmsfVBmiVtUUmf7wUR7d?=
 =?iso-8859-1?Q?C9+JWtPE1HgR6VVYoGQdRveAC4QGkM1pRQrQECCRmisnCJ81OsgFV2RpRH?=
 =?iso-8859-1?Q?So92a2n0LLqnSrnMCsoAh8NUThK+fOQc1kta0z8fp3P3yYjqlwXPSqCaK/?=
 =?iso-8859-1?Q?5YJVm63oIn+t4PAoBodm30Juqdx4ehYc26Sl3gvX/n7AgirKARds3/IS+t?=
 =?iso-8859-1?Q?yAzTi0OCK2k5yNWpfFw0+enQuaF0mEAnG21HRgBeYMSErmFdqVxUuwpUQs?=
 =?iso-8859-1?Q?XZEa7aiJkXYfX1dR8thAjLIEyP8G4Duhsg/eO3CRp+0R9f3POYeJ0+WgVa?=
 =?iso-8859-1?Q?VpV975eCdyEsP6Ip87Z9eVpFWTl3N8C7uFKGOW2op4WrNIv2RRvImyvcgU?=
 =?iso-8859-1?Q?q0kvPXo/oHxCrR/12OYEXIX2jq6X2VcAeiHwlhtc/jH9gp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aab7f18-af14-4a8c-5601-08df1360c4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 19:37:25.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wjnlfgowln6qNV1PKEbGZAjK1EooXWJQhSEgWceJnVYHrgOQ5RicjGMNd/+k+OorQ4To5eQn8wiedjaAGX7B8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7308
X-purgate-ID: tlsNG-33051d/1789501055-6DED24E9-1155097C/0/0
X-purgate-type: clean
X-purgate-size: 1255

>This seems unwise.  I think you want a return 0 in the=0A=
>paging_write_guest_entry() case because returning the input cannot=0A=
>possibly lead to anything good.=0A=
=0A=
This would make the calling code in mod_l1_entry() more complicated.=0A=
=0A=
At the moment it shakes out like this=0A=
    static int mod_l1_entry(l1_pgentry_t *pl1e,=0A=
                            ...,=0A=
                            l1_pgentry_t *ol1e_out)=0A=
    {=0A=
        l1_pgentry_t ol1e =3D l1e_read(pl1e);=0A=
        ...=0A=
        ol1e =3D UPDATE_ENTRY(l1, pl1e, ol1e, ...);=0A=
        ...=0A=
        put_page_from_l1e(ol1e, pt_dom);=0A=
        ...=0A=
        if ( ol1e_out )=0A=
            *ol1e_out =3D ol1e;=0A=
    }=0A=
=0A=
But if UPDATE_ENTRY() sometimes returns 0 depending on what internal path i=
t=0A=
takes then we'll need two local ol1e variables, one that is always valid to=
=0A=
give to put_page_from_l1e() and a different one to maybe assign to *ol1e_ou=
t.=0A=
=0A=
When you say "returning the input cannot possibly lead to anything good", t=
he=0A=
current version of this patch series actually depends on it.=0A=
=0A=
I guess I just wanted to clarify before adding more complexity to mod_l1_en=
try.=0A=

