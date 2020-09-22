Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C877C2D0E2
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 08:17:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2483E239E5
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 08:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XobQuyAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2483E239E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKdUP-0004IY-H1; Tue, 22 Sep 2020 08:17:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3vi=C7=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1kKdUO-0004IT-MR
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 08:17:28 +0000
X-Inumbo-ID: 404ae16c-8ecf-4edc-b6d9-578a72092836
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 404ae16c-8ecf-4edc-b6d9-578a72092836;
 Tue, 22 Sep 2020 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600762647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oakQ8ZvOG/PZHFgINL6qXTOYOkalonDKl4hzXDidq5o=;
 b=XobQuyAWfon1EKF6Gb61XUu4Ok2hWvvh34e0g0Wn1iZn/LPwThXicMbUzy2+3GVCMvcXL3
 9JX/4SLNyCOyR8wG7SyqavQzHoJno+l5CVN2VWJF1v1kDXcGzkyyvjD9ToWJFRx5L+OjOF
 gjWDKvOXOuwiOj36gPnaYK1cZQtYths=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-NmB85ZUzNVuAZQDy8gEBcA-1; Tue, 22 Sep 2020 04:17:23 -0400
X-MC-Unique: NmB85ZUzNVuAZQDy8gEBcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8F881868405;
 Tue, 22 Sep 2020 08:17:18 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E4395C225;
 Tue, 22 Sep 2020 08:17:05 +0000 (UTC)
Date: Tue, 22 Sep 2020 09:17:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, fam@euphon.net, ysato@users.sourceforge.jp,
 berto@igalia.com, jslaby@suse.cz, rth@twiddle.net, pl@kamp.de,
 david@redhat.com, pasic@linux.ibm.com, eblake@redhat.com,
 mreitz@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 palmer@dabbelt.com, armbru@redhat.com, kvm@vger.kernel.org,
 yuval.shaia.ml@gmail.com, mst@redhat.com, cohuck@redhat.com,
 qemu-block@nongnu.org, sw@weilnetz.de, dgilbert@redhat.com,
 mdroth@linux.vnet.ibm.com, jiaxun.yang@flygoat.com,
 jsnow@redhat.com, jcmvbkbc@gmail.com, marcel.apfelbaum@gmail.com,
 Alistair.Francis@wdc.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com, chenhc@lemote.com,
 aleksandar.qemu.devel@gmail.com, ehabkost@redhat.com,
 borntraeger@de.ibm.com, sunilmut@microsoft.com, thuth@redhat.com,
 pbonzini@redhat.com, sstabellini@kernel.org,
 anthony.perard@citrix.com, kraxel@redhat.com,
 peter.maydell@linaro.org, namei.unix@gmail.com, paul@xen.org,
 kwolf@redhat.com, kbastian@mail.uni-paderborn.de,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, laurent@vivier.eu,
 xen-devel@lists.xenproject.org, mjrosato@linux.ibm.com,
 sheepdog@lists.wpkg.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 quintela@redhat.com, zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
Message-ID: <20200922081705.GB201611@stefanha-x1.localdomain>
References: <20200921162346.188997-1-stefanha@redhat.com>
 <160072176188.21069.7427016597134663502@66eaa9a8a123>
MIME-Version: 1.0
In-Reply-To: <160072176188.21069.7427016597134663502@66eaa9a8a123>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 01:56:08PM -0700, no-reply@patchew.org wrote:
> ERROR: Macros with multiple statements should be enclosed in a do - while=
 loop
> #2968: FILE: include/qemu/atomic.h:152:
> +#define qemu_atomic_rcu_read__nocheck(ptr, valptr)      \
>      __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
>      smp_read_barrier_depends();
>=20
> ERROR: space required before that '*' (ctx:VxB)
> #3123: FILE: include/qemu/atomic.h:347:
> +#define qemu_atomic_read__nocheck(p) (*(__typeof__(*(p)) volatile*) (p))
>                                                                   ^
>=20
> ERROR: Use of volatile is usually wrong, please add a comment
> #3123: FILE: include/qemu/atomic.h:347:
> +#define qemu_atomic_read__nocheck(p) (*(__typeof__(*(p)) volatile*) (p))
>=20
> ERROR: space required before that '*' (ctx:VxB)
> #3125: FILE: include/qemu/atomic.h:349:
> +    ((*(__typeof__(*(p)) volatile*) (p)) =3D (i))
>                                   ^
>=20
> ERROR: Use of volatile is usually wrong, please add a comment
> #3125: FILE: include/qemu/atomic.h:349:
> +    ((*(__typeof__(*(p)) volatile*) (p)) =3D (i))
>=20
> ERROR: space required after that ',' (ctx:VxV)
> #3130: FILE: include/qemu/atomic.h:352:
> +#define qemu_atomic_set(ptr, i)     qemu_atomic_set__nocheck(ptr,i)
>                                                                  ^
>=20
> ERROR: memory barrier without comment
> #3205: FILE: include/qemu/atomic.h:410:
> +#define qemu_atomic_xchg(ptr, i) (smp_mb(), __sync_lock_test_and_set(ptr=
, i))
>=20
> WARNING: Block comments use a leading /* on a separate line
> #3280: FILE: include/qemu/atomic.h:462:
> +/* qemu_atomic_mb_read/set semantics map Java volatile variables. They a=
re
>=20
> WARNING: Block comments use a leading /* on a separate line
> #6394: FILE: util/bitmap.c:214:
> +        /* If we avoided the full barrier in qemu_atomic_or(), issue a
>=20
> WARNING: Block comments use a leading /* on a separate line
> #7430: FILE: util/rcu.c:85:
> +        /* Instead of using qemu_atomic_mb_set for index->waiting, and
>=20
> WARNING: Block comments use a leading /* on a separate line
> #7456: FILE: util/rcu.c:154:
> +        /* In either case, the qemu_atomic_mb_set below blocks stores th=
at free
>=20
> total: 7 errors, 4 warnings, 6507 lines checked

These are pre-existing coding style issues. This is a big patch that
tries to make as few actual changes as possible so I would rather not
try to fix them.

Stefan

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9pswEACgkQnKSrs4Gr
c8iYggf/cN1AvmT30HEFnk6TFaWwEK/1uPdJX8OsfFcwI7Y3ubB8wcLWnyXzwsOg
tRL2aDrOZ1cJcV8pHVtlNuJTcqox1NBFhSC6thYgo4PzXU7O2+LPijF+PrrJBrer
C/TLImTNNDBL8+IQX8bOBz4kVqyoEoodEvNsRUb05oyhVK0uej9yK0Vf+WOiRDmf
O4f1cAXTcA0qhhmU5NJO5sNe3cVEbrkHJ9wtK7mFlIRt/RuHLvW5M0UscL0/KF2o
SyWNVBIVFKBl/o16jkA4J+C1wAM6uPP3s5NYqJgaEUtYUaP7cir42blCMCa3MYz6
LSmqavtaJ2f531DBpjOq3G5c+fyk5A==
=nJgj
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--


