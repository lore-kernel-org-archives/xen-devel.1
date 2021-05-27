Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAEEC47089
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 14:10:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB36161248
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 14:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB36161248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133504.248806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGiV-0002is-Fj; Thu, 27 May 2021 14:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133504.248806; Thu, 27 May 2021 14:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmGiV-0002il-C1; Thu, 27 May 2021 14:10:31 +0000
Received: by outflank-mailman (input) for mailman id 133504;
 Thu, 27 May 2021 14:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Vta=KW=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1lmGiU-0002ib-Ek
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 14:10:30 +0000
Received: from eu-smtp-delivery-151.mimecast.com (unknown [185.58.85.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 78e1a745-4556-422c-9f63-46d0d9b93036;
 Thu, 27 May 2021 14:10:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-140-jheLYrfmNJS7VYboBqC6Hg-1; Thu, 27 May 2021 15:10:23 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 27 May 2021 15:10:21 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 27 May 2021 15:10:21 +0100
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
X-Inumbo-ID: 78e1a745-4556-422c-9f63-46d0d9b93036
X-MC-Unique: jheLYrfmNJS7VYboBqC6Hg-1
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chen Huang' <chenhuang5@huawei.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Paul Mackerras" <paulus@samba.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Mark Fasheh <mark@fasheh.com>, Joel
 Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Nathan
 Lynch <nathanl@linux.ibm.com>, "Andrew Donnellan" <ajd@linux.ibm.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, "Andrew Morton" <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, Yang
 Yingliang <yangyingliang@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: RE: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Thread-Topic: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Thread-Index: AQHXUg74rK/OAxNe1kmGDaODmfSqv6r3X4NA
Date: Thu, 27 May 2021 14:10:21 +0000
Message-ID: <0f03f9b9ff41460db2935e077f7f80c7@AcuMS.aculab.com>
References: <20210526092020.554341-1-chenhuang5@huawei.com>
 <20210526092020.554341-2-chenhuang5@huawei.com>
In-Reply-To: <20210526092020.554341-2-chenhuang5@huawei.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Chen Huang
> Sent: 26 May 2021 10:20
>=20
> The simple_strtoull() function is deprecated in some situation, since
> it does not check for the range overflow, use kstrtoull() instead.
>=20
...
> -=09target_bytes =3D simple_strtoull(buf, &endchar, 0) * 1024;
> +=09ret =3D kstrtoull(buf, 0, &target_bytes);
> +=09if (ret)
> +=09=09return ret;
> +=09target_bytes *=3D 1024;

I'd have thought it was more important to check *endchar
than overflow.
If you are worried about overflow you need a range check
before the multiply.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


