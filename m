From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools/xenstore: add libdl dependency to
 libxenstore
Date: Fri, 9 Mar 2018 09:36:33 +0100
Message-ID: <20180309083633.GA12975@aepfle.de>
References: <20180307101744.32608-1-jgross@suse.com>
 <23199.51911.713278.912475@mariner.uk.xensource.com>
 <ac4b3f73-63b1-d081-aeed-a56d8a660d83@suse.com>
 <23199.54702.631341.284821@mariner.uk.xensource.com>
 <c0db67f3-707d-6e86-0fbd-7dfed9178d99@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6071879765259270752=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=1s9y=f7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1euDW6-0008WE-LZ
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 08:36:43 +0000
In-Reply-To: <c0db67f3-707d-6e86-0fbd-7dfed9178d99@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: ian.jackson@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============6071879765259270752==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 07, Juergen Gross wrote:

> On 07/03/18 13:06, ian.jackson@citrix.com wrote:
> > Juergen Gross writes ("Re: [PATCH] tools/xenstore: add libdl dependency to libxenstore"):
> >> On 07/03/18 12:19, Ian Jackson wrote:
> >>> Juergen Gross writes ("[PATCH] tools/xenstore: add libdl dependency to libxenstore"):
> >>>>  libxenstore.so.$(MAJOR).$(MINOR): LDFLAGS += -ldl
> >>>> +else
> >>>> +PKG_CONFIG_REMOVE += dl
> >>> What is this ?
> >> -ldl is needed on Linux only, but I didn't want to add a Linux specific
> >> pkg-config file. So I'm removing the dependency in case we are not on
> >> Linux.
> > Sorry, I was grepping an older xen tree, so I didn't see where this
> > variable was honoured.
> > Will this work, though, when what has to be done is to remove -ldl
> > from Libs, rather than from Requires ?
> Yes, I've tested it to work (in V2 we have: PKG_CONFIG_REMOVE += -ldl)

This breaks libvirt.
m4/virt-driver-xen.m4 tries to use just '-lxenstore' and the test fails
with missing 'dlsym'. If I adjust this .m4 file to use pkgconfig it
still fails. Only appending '-ldl' to XEN_LIBS will help. So to me it
looks like -ldl is now a hard requirement when linking to
libxenstore.so. I used 20180307T163340.c9bd8a7365 for testing.

Olaf

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWqJHjgAKCRBdQqD6ppg2
flAVAKDy2y5dbu9iMnXm3n60wQrcvEVfwQCg1nThKwl2ywY/V8laA5aUKaUhCg0=
=KkgZ
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--


--===============6071879765259270752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6071879765259270752==--
