From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 09/27] x86/acpi: Adapt assembly for PIE
 support
Date: Thu, 24 May 2018 13:03:06 +0200
Message-ID: <20180524110306.GA20225__22092.1498760164$1527159718$gmane$org@amd>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-10-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8086342848764042541=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yumc=il=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1fLo1X-0001Xf-I4
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 11:03:11 +0000
In-Reply-To: <20180523195421.180248-10-thgarnie@google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, x86@kernel.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Yonghong Song <yhs@fb.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Beulich <JBeulich@suse.com>, "H . Peter Anvin" <hpa@zytor.com>, kernel-hardening@lists.openwall.com, Christoph Lameter <cl@linux.com>, Alok Kataria <akataria@vmware.com>, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>, Boris
List-Id: xen-devel@lists.xenproject.org


--===============8086342848764042541==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-05-23 12:54:03, Thomas Garnier wrote:
> Change the assembly code to use only relative references of symbols for t=
he
> kernel to be PIE compatible.
>=20
> Position Independent Executable (PIE) support will allow to extended the
> KASLR randomization range below the -2G memory limit.

What testing did this get?

> diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wake=
up_64.S
> index 50b8ed0317a3..472659c0f811 100644
> --- a/arch/x86/kernel/acpi/wakeup_64.S
> +++ b/arch/x86/kernel/acpi/wakeup_64.S
> @@ -14,7 +14,7 @@
>  	 * Hooray, we are in Long 64-bit mode (but still running in low memory)
>  	 */
>  ENTRY(wakeup_long64)
> -	movq	saved_magic, %rax
> +	movq	saved_magic(%rip), %rax
>  	movq	$0x123456789abcdef0, %rdx
>  	cmpq	%rdx, %rax
>  	jne	bogus_64_magic

Because, as comment says, this is rather tricky code.
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

iEYEARECAAYFAlsGm+oACgkQMOfwapXb+vLLAACeNw4n8p5ND1PjVeejcndbG7LD
PnoAn03Gtm+qB4eRF6elILLNbit31Tp4
=fVC7
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============8086342848764042541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8086342848764042541==--
