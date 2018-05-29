From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 09/27] x86/acpi: Adapt assembly for PIE
 support
Date: Tue, 29 May 2018 14:31:14 +0200
Message-ID: <20180529123114.GB21399__23218.7491994866$1527597017$gmane$org@amd>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-10-thgarnie@google.com>
 <20180524110306.GA20225@amd>
 <CAJcbSZFJ84+VC5xDQZGHctupdqwmMBgqzLzFRqCTBpi5t-2Gvw@mail.gmail.com>
 <20180525091447.GC9666@amd>
 <CAJcbSZH17D01Stk4vRKKzjW6dxvK8x+S9sWL6vUopSP9=-x7Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3340465366419105810=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wrft=iq=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1fNdmc-0008S8-9L
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 12:31:22 +0000
In-Reply-To: <CAJcbSZH17D01Stk4vRKKzjW6dxvK8x+S9sWL6vUopSP9=-x7Nw@mail.gmail.com>
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


--===============3340465366419105810==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-05-25 10:00:04, Thomas Garnier wrote:
> On Fri, May 25, 2018 at 2:14 AM Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > On Thu 2018-05-24 09:35:42, Thomas Garnier wrote:
> > > On Thu, May 24, 2018 at 4:03 AM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > > On Wed 2018-05-23 12:54:03, Thomas Garnier wrote:
> > > > > Change the assembly code to use only relative references of symbo=
ls
> for
> > > the
> > > > > kernel to be PIE compatible.
> > > > >
> > > > > Position Independent Executable (PIE) support will allow to
> extended the
> > > > > KASLR randomization range below the -2G memory limit.
> > >
> > > > What testing did this get?
> > >
> > > Tested boot, hibernation and performance on qemu and dedicated machin=
e.
>=20
> > Well, this is suspend, not hibernation code.
>=20
> > So "sudo pm-suspend" or "echo mem > /sys/power/state" would be good
> > way to test this.
>=20
> Thanks, it worked. I added this to the testsuite I use for KASLR.

Thanks!

You can add my Acked-by:.

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsNSBIACgkQMOfwapXb+vJcmwCfVtj/DQE+VyxRZUU8UjiQVdHr
BO8AoIc6OVRZyFmsEwBtGucDDnQJI4fU
=APXA
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--


--===============3340465366419105810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3340465366419105810==--
