From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [Qemu-block] [PATCH] qemu: include generated files
 with <> and not ""
Date: Tue, 20 Mar 2018 13:10:41 +0000
Message-ID: <20180320131041.GB24329@stefanha-x1.localdomain>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2545553586865084445=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h5wp=gk=gmail.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1eyH2M-0007WY-KU
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:10:46 +0000
Received: by mail-wm0-x241.google.com with SMTP id t6so3389072wmt.5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 06:10:45 -0700 (PDT)
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>, Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============2545553586865084445==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 03:54:36AM +0200, Michael S. Tsirkin wrote:
> QEMU coding style at the moment asks for all non-system
> include files to be used with #include "foo.h".
> However this rule actually does not make sense and
> creates issues for when the included file is generated.
>=20
> In C, include "file" means look in current directory,
> then on include search path. Current directory here
> means the source file directory.
> By comparison include <file> means look on include search path.
>=20
> As generated files are not in the search directory (unless the build
> directory happens to match the source directory), it does not make sense
> to include them with "" - doing so is merely more work for preprocessor
> and a source or errors if a stale file happens to exist in the source
> directory.
>=20
> This changes include directives for all generated files, across the
> tree. The idea is to avoid sending a huge amount of email.  But when
> merging, the changes will be split with one commit per file, e.g. for
> ease of bisect in case of build failures, and to ease merging.
>=20
> Note that should some generated files be missed by this tree-wide
> refactoring, it isn't a big deal - this merely maintains the status quo,
> and this can be addressed by a separate patch on top.

Stale header files are a pain.  I often do make distclean before
checking out a radically different QEMU version to avoid the problem.

This patch trades off the stale header file issue for a new approach to
using <> vs "", which will be hard to use consistently in the future
since it is unconventional.

Is the build time improvement worth it (please post numbers)?

Stefan

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJasQhRAAoJEJykq7OBq3PIhegIAIuKiJzv3MhB1QK0Lnz/P592
Sj2qAfnfuQx/KTgnY8u9eookcjP0oLcPzlDMOMnuBcDmy676pEBiyfnUIdcQ0LZM
2i2bROjPgfwqqfLWFI4zYc7w76i43e3rU4bzIBh7f767IxlRTlb3auxTknxEL1IO
pi1ZYsNHvOHaXvfNTbTVfetHTOuP/KgwN2VFnHgzhqmPxNlesJOArsG341SG95X6
4wkmXPEe1z47dpCWHF3HMvX8Lkn/Sb4C0LVK6cgBHHtRVS/5hhk150tQAiUTaRKM
JgoD11JKE3C3+BK5n1z15dsx5UR2lKyEIEKKtgNp476Vw6UQprcvAITTJgD2CFw=
=8mFJ
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--


--===============2545553586865084445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2545553586865084445==--
