From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 11/27] x86/power/64: Adapt assembly for
 PIE support
Date: Fri, 25 May 2018 11:10:24 +0200
Message-ID: <20180525091024.GA9666__23052.8432912708$1527239385$gmane$org@amd>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-12-thgarnie@google.com>
 <20180524110341.GB20225@amd>
 <CAJcbSZEnRhFDvYCG4ORH71LrcH2bAzOU5yF-oa9KkLpKo5UuSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5009765470106809347=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jxrn=im=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1fM8k4-00038U-5Y
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 09:10:32 +0000
In-Reply-To: <CAJcbSZEnRhFDvYCG4ORH71LrcH2bAzOU5yF-oa9KkLpKo5UuSQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, the arch/x86 maintainers <x86@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Yonghong Song <yhs@fb.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Beulich <JBeulich@suse.com>, "H . Peter Anvin" <hpa@zytor.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Christoph Lameter <cl@linux.com>, Alok Kataria <akataria@vmware.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Herbert Xu <herbert@gondor.a>
List-Id: xen-devel@lists.xenproject.org


--===============5009765470106809347==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-05-24 09:37:20, Thomas Garnier wrote:
> On Thu, May 24, 2018 at 4:04 AM Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > On Wed 2018-05-23 12:54:05, Thomas Garnier wrote:
> > > Change the assembly code to use only relative references of symbols f=
or
> the
> > > kernel to be PIE compatible.
> > >
> > > Position Independent Executable (PIE) support will allow to extended =
the
> > > KASLR randomization range below the -2G memory limit.
> > >
> > > Signed-off-by: Thomas Garnier <thgarnie@google.com>
>=20
> > Again, was this tested?
>=20
> Hibernation was tested as much as I can with qemu and my dedicated
>machine.

Ok, good.

Acked-by: Pavel Machek <pavel@ucw.cz>

> Any specific test you think I should use?

Hibernation working should be good enough test for this.

Thanks,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsH0wAACgkQMOfwapXb+vJiPACbB1beNmXz4oS4/mXx8V6gi+hn
3BMAmwQL+v/Mq6QFOs5pWL0flhKjfSRY
=e7mZ
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============5009765470106809347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5009765470106809347==--
