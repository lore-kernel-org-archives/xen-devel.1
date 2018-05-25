From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 09/27] x86/acpi: Adapt assembly for PIE
 support
Date: Fri, 25 May 2018 11:14:47 +0200
Message-ID: <20180525091447.GC9666__26304.2050450624$1527239622$gmane$org@amd>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-10-thgarnie@google.com>
 <20180524110306.GA20225@amd>
 <CAJcbSZFJ84+VC5xDQZGHctupdqwmMBgqzLzFRqCTBpi5t-2Gvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3285632325539850669=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jxrn=im=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1fM8oG-0003Jn-RC
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 09:14:52 +0000
In-Reply-To: <CAJcbSZFJ84+VC5xDQZGHctupdqwmMBgqzLzFRqCTBpi5t-2Gvw@mail.gmail.com>
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


--===============3285632325539850669==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-05-24 09:35:42, Thomas Garnier wrote:
> On Thu, May 24, 2018 at 4:03 AM Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > On Wed 2018-05-23 12:54:03, Thomas Garnier wrote:
> > > Change the assembly code to use only relative references of symbols f=
or
> the
> > > kernel to be PIE compatible.
> > >
> > > Position Independent Executable (PIE) support will allow to extended =
the
> > > KASLR randomization range below the -2G memory limit.
>=20
> > What testing did this get?
>=20
> Tested boot, hibernation and performance on qemu and dedicated machine.

Well, this is suspend, not hibernation code.

So "sudo pm-suspend" or "echo mem > /sys/power/state" would be good
way to test this.

Thanks,
							Pavel

> > > diff --git a/arch/x86/kernel/acpi/wakeup_64.S
> b/arch/x86/kernel/acpi/wakeup_64.S
> > > index 50b8ed0317a3..472659c0f811 100644
> > > --- a/arch/x86/kernel/acpi/wakeup_64.S
> > > +++ b/arch/x86/kernel/acpi/wakeup_64.S
> > > @@ -14,7 +14,7 @@
> > >        * Hooray, we are in Long 64-bit mode (but still running in low
> memory)
> > >        */
> > >  ENTRY(wakeup_long64)
> > > -     movq    saved_magic, %rax
> > > +     movq    saved_magic(%rip), %rax
> > >       movq    $0x123456789abcdef0, %rdx
> > >       cmpq    %rdx, %rax
> > >       jne     bogus_64_magic
>=20
> > Because, as comment says, this is rather tricky code.
>=20
> I agree, I think maintainers feedback is very important for this patchset.


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsH1AcACgkQMOfwapXb+vJkPACgivHlv4yQvMmSVj7Gzzlmfl2d
K+EAnRZbTIvGxmfjC1t3r7e5toAEUioW
=2wkA
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--


--===============3285632325539850669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3285632325539850669==--
