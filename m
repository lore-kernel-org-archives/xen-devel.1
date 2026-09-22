Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD8BC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:01:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428639.1651529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yFa-0000Ff-Cu; Tue, 22 Sep 2026 11:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428639.1651529; Tue, 22 Sep 2026 11:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yFa-0000FY-A0; Tue, 22 Sep 2026 11:01:26 +0000
Received: by outflank-mailman (input) for mailman id 1428639;
 Tue, 22 Sep 2026 11:01:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8yFY-0000FD-RT
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:01:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yFY-00GAup-8B
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:01:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab25ffd-2eae-0a2a0a5409dd-0a2a4508b902-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:01:24 +0200
Received: from [52.101.83.122]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab26003-f659-0a2a45080019-3465537a834e-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:01:24 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AM7PR03MB6264.eurprd03.prod.outlook.com (2603:10a6:20b:13d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 11:01:21 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 11:01:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3tpahzainPqapkGEh7njg4BaCpLABpZpT7tH4S3NgEWao/c7JbIVVvhnomRCIezWoEb6PjuDmrwwx5zmq+nUSFAPT4NMe0PhNkEhCOj5m+YYX12pDi7DolpL/Sa+Z8tCQnoz0LrVjXOo4KDexcb0IQaGQWImgsfsnaXlE65CP++U812tpVCd7y6UF+uOjeCcp8vK8PEwxVRmHylaUBCP5/BAtFQxt+kIY2pN9hAvxdn5oxnzfHkdQtJM8VWR+KYYat/DARDLgTGRg0+8cxYQtVowGXDdON/mVfrPm72K0AWRWwF2sOLd60Osos9F6gRLh81DzpPKwoOXu1aMa1S3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3W5tUjS+MCwugElpeUBsmEcQeNOhcCMCJZ7r4GSvwY=;
 b=fN+q7pf8XcB0VQLosIdXzXmCt0RfYSyksXcCsNtjr5uGoOUXDpP3UiH31/k3DwEfkrfv8rpWZS0BIVMxsf9WJdHRoaxzSlEFbVxrtEIxbFGE1LynV52dFeAS4j8rqctjcWHn8oyoRLJHwBC5gv4W8K5ztAM7scG7MToGg9afq8mYnWVxphw4B82++WhbnY2KKkOzBxzwwUHIaYHTbrOA8PXsGwI93CrEpfPjYLiSlHPwM8sbttKzvyTFOTNRv8Gge2op0JsKlEI/t1mpoAvZK2bsCgwjXixAerNoZIGc2sIMduJRsevU2GWex7e5Q46jOP7N6x174emChb1tNZeSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3W5tUjS+MCwugElpeUBsmEcQeNOhcCMCJZ7r4GSvwY=;
 b=Ay9sssYUrTGbzahlMTK9wK1Z7PXVYwh8jKt2iGRRrgAqBtLNgMLOG2jDqqjZoxWWR6mnqnbX8Z5KDtR73fXj1SM2eu/isJZO3fH7wauhqatARwOwM0c37LLfUq7G5g85Oljfo4FwzDNE8AwHSJg3JtYX8bs36qjR+9Nvwy4QtRrQeCvugnYjq0sY8Y6oLdsrtc6hvaa/zqmUUIHr9p1Y/S2IyfiqTnzvFcuHTs1cqAjr4YC3cv7r/sQeknIgt80Vhdrbp+8RlaBzaGkP26dRWKjr2heQdKsIOmMGaPiRe3JYWLL3MpSK/1YKnnhwMBkeC6eoBlnmZSPtlt3NTZZ0TQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>
Subject: Re: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
Thread-Topic: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
Thread-Index: AQHdOqU2Vkz5DOI+4USs/ahFyLHJfA==
Date: Tue, 22 Sep 2026 11:01:21 +0000
Message-ID: <87pky55z3z.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<8fe86787-7590-44f1-be4f-461b61d7669b@suse.com>	<87fqz26otq.fsf@epam.com>
	<162997df-6c5f-4f1c-b01f-16f6c2e4e0c6@suse.com>
In-Reply-To: <162997df-6c5f-4f1c-b01f-16f6c2e4e0c6@suse.com> (Jan Beulich's
	message of "Tue, 22 Sep 2026 08:36:23 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AM7PR03MB6264:EE_
x-ms-office365-filtering-correlation-id: 644e0546-61d5-42f9-4c52-08df1898d5f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|42112799006|38070700021|3023799007|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 E/7fZkwLIFS8RF5v6qMyDsrbsZqghdoTjb37ySqqh0zi1uSskloHDkRtOZjAxanqY79n5c7IeDlSyIK5oF96NniW0GtIz1L5BPEv+Zcqc0xGZ+1jpOTzyH9WXUKNwatpJmFBZHrHcHS2XcIu6YAs2wg1YgY7Tk+tmVezalCxsHkTXvm5xkarCrlRObB3ZnXE0SwjSd3LeOHTlbIruD2qMGMSOmIN2APiH2tnnt5YDbjuNos4wt7fkLfBWBxc8FrQz3+6J46MF+veI2tLBRGLqQHrIusg7xv6MmUKunkFP6UOL+xKQVfXLqyU7+RCCY8xkr044hvUX6WykoPgIYV1+P2Qoa6DK5aIYN4l/SA92S/NgWPhd4Go+n6l/ZmVtQQj2SB52dFGpYaEcWsPnmDYyHivF0AEs9HNJxaxL2dWMfsmQTlmpRATOvO8iXVPtric5NlMcvChc804uT74V261viqkpoxBZ/LqZnOitg8evvyziFnQjiOwRZfeSWdDqIFmFKiv9RVbLdhCZRV4nCNVB81l/0yuPrhtqfgon1ac2j2YO0MoCyaVQO9vxW+OV4BCvn6Ca+X4LoGM/rJkL49D1XzBk0oZNc4X8ztjN17Q7+J0pfmZ7pgg6TadQ34mAEQtJ9LoW8SU6HOC4ex2fG4pwBr7XA+r2VyORKYxX8uP8M6rXX+uR+/ceSBaZ6vftb3QuAWZNuJV1wwXX8oR7CwlBt4kfikewHtRRWBKw8G8Wpg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(42112799006)(38070700021)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fy1yw15Eh+f+hHE4O61nYQiy++uq/0m2JpWAfuEXsVsRKr15+mHTSYHp1s?=
 =?iso-8859-1?Q?G/RlwY6wQu1xCeZ3V9jbvG9Od3925kGOuGarUHayKnbbM+CGrt3D+4R8ly?=
 =?iso-8859-1?Q?79BupW9lBjaJ1+UHMSiEINZZ21HxG/sII8JSE28xTKLwBGF6kNbRxpvPiZ?=
 =?iso-8859-1?Q?nFB8fwno4c4GYmzUe3zkyg5b02CRsttMf/31+MyCwVmph/S58k1mGNF0ph?=
 =?iso-8859-1?Q?SaS1/bqS9CE+nYeZvbBD8YHq9BwJ83AM41HLXtYaPMssKztObI2cWKsLTq?=
 =?iso-8859-1?Q?VmWWOnpgKZzX4xMJk7qKRQv809f7q/560SLRf47xyscTgEMwMEZiy8HgL8?=
 =?iso-8859-1?Q?1WOWQIWi7mpFHYn9Y+lyImTgKmR/BXnMXtilIxWRcPLzMzx3rfX4r6jKOa?=
 =?iso-8859-1?Q?c2CjpDoJzp5gzUCuizpAa3jstH5PYUatU2jjJiyVWMM0Y8CW43Hkz6guvy?=
 =?iso-8859-1?Q?yAUNfn5Dv7p9do/4Akauf4O4j88j8nCEZ2qDm3kVlIWvBLovkHPVdrKofB?=
 =?iso-8859-1?Q?gHD1xkfoRnUiVkzrAZeIi/SVOVUxipkQFUgXjAqPmW4XPY+foqUnIiHmxb?=
 =?iso-8859-1?Q?f4sa+jEba2pGmJyJPV1bvq6/u9aCQlAydlKiBwkkm71pJa+8vGfUMYVlgr?=
 =?iso-8859-1?Q?GnyFHNjoGVHUd2sUS3X6bKD81+caa7OP98Q/+GcNIHgO+y05R2837fPzir?=
 =?iso-8859-1?Q?lNhdl/V22R41qqdRSNk9aks8FdJGlYCBOzufOsKzOyStgFHUTOi1AbBd8q?=
 =?iso-8859-1?Q?HShMi3j8NijP6flItWN/YIxb7kwzCcPm4/4kcgTT7pbUJCDXTIeW1Sb+HC?=
 =?iso-8859-1?Q?ZGtpHj/Ak1sm+c6/uG+eL3JHpih19aR9RzrQeJ6eLTvKurTU1WKXQqLKRZ?=
 =?iso-8859-1?Q?43cWfrjkWIQq6WozRqFRjuNIjyR9d/a11zoaC7O4hFAqWwQ+016jL4Vlvt?=
 =?iso-8859-1?Q?ovYNmSrhB33UaKngstCLZgpxhJ1vR8EPdaRk5kAfFF6AA7EPJG1iOmV/vV?=
 =?iso-8859-1?Q?C+HQ3nZNUQEYxgpqt+61cdgVJvZoak9aj+Y/dg30KWu3r8EpSm/9y3XA86?=
 =?iso-8859-1?Q?cL5I0vosH3ddfo3N54Vg2gLrMqTB+peUNm3f+DFFY3LDFKp76QlZsFTnWS?=
 =?iso-8859-1?Q?48QPtB9UAiMS+QygBky/xXf3Iz1jvhIF5qvyhKIe19USd2DzZ2cE/8UIhl?=
 =?iso-8859-1?Q?ELJn7Y0EIDLIBNQYM4BPxQwhHAXLlW6Zu8eFlAySK08YSnsNUNk4hO0Gno?=
 =?iso-8859-1?Q?i7fdydawiTlhOZ5TSAe2gjqa/w47vKOYTNBg0WHPvysSHDq+xDimipl3m8?=
 =?iso-8859-1?Q?ZrmdiOKETY6+kBeIyOzSA/L+ViXh9UG3D1AUSMTBM1pMmtUy3qhn1A/fEN?=
 =?iso-8859-1?Q?huc3zX8v0UD8+cg/g06I6YshGzhseK8W6gTNbejAEHAy6lOTYWijCzO5rm?=
 =?iso-8859-1?Q?JSdlAFRVwep5n0h4mRHb/vQ5gGDxZaL2NjrT+5GLxflP3cArGp/+sx7cMq?=
 =?iso-8859-1?Q?0iPPkYJ16szSk2+AO7RZkq0qzZFsvFWRvhnGhjx595j1JP8dIYsE4F7LJo?=
 =?iso-8859-1?Q?4z2cv9YWg1HNofbGCEICA/Expg8zUGCTjuZkYdh9KImQgIJEStT8lRYROY?=
 =?iso-8859-1?Q?RdYHYz6mWzjnHkRIXJ3/sBPNEqkBkWGoh9Bu2ykOIYcl2i0xctCTQb0T3K?=
 =?iso-8859-1?Q?ZF6S2uw8iq8gqtIuiBfR+1j7VSrTyI0hmIwxDDZMTOD/QWW1Z7GStLRh0p?=
 =?iso-8859-1?Q?xERzij74x9XN6XV5l1snuPfHmtfTrcYuSK/on3Ua7BhbIKD88pq1jSWUnw?=
 =?iso-8859-1?Q?ktIc9kfWKyL31FUurQyvfNfxeXKZKWc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644e0546-61d5-42f9-4c52-08df1898d5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 11:01:21.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QowOWXJip5k5jGfKSValRSm0fh38HsOCxLqustWeAZl6BbocqfbYw1IADDNab58ylMr1VoOFACr5xPhcvbmiazLrKII8+YUD6ISEeBp6Tww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6264
X-purgate-ID: tlsNG-c1860d/1790074884-D4B7187B-3B676E4D/0/0
X-purgate-type: clean
X-purgate-size: 1672

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 22.09.2026 03:45, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> Not doing so results in a number of Misra rule 11.8 (casting away of
>>> const-ness) violations. We need to allow kexec to use pointer to non-
>>> const though, so provide a means to override the default.
>>>
>>> For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
>>> incoming pointer.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/kexec.c
>>> +++ b/xen/common/kexec.c
>>> @@ -6,6 +6,9 @@
>>>   * - Magnus Damm <magnus@valinux.co.jp>
>>>   */
>>> =20
>>> +/* We're producing ELF notes here. */
>>> +#define ELFNOTE_CONST
>>=20
>> Frankly, it feels backwards. When reading this line of code I am
>> assuming that you are adding constness to ELF notes because you are
>> defining ELFNOTE_CONST. And I had to check the elf.h to understand that
>> you are doing exactly opposite. I am pretty sure that other people will
>> confused by this as well.
>
> Well, that's certainly possible. Yet then you or them are asked to make
> an alternative suggestion. An option I could think of would be to merely
> rename what is ELFNOTE_CONST right now, to no longer have the word
> "CONST" in it. ELFNOTE_MODIFIER maybe, albeit that reads a little clumsy
> to me.

Taking into account that we need 'const' to be enabled by default, maybe
something like that?

#ifndef ELFNOTE_NO_CONST
#define __ELFNOTE_CONST const
#else
#define __ELFNOTE_CONST
#endif

?

And then use

#define ELFNOTE_NO_CONST

in this hunk

--=20
WBR, Volodymyr=

