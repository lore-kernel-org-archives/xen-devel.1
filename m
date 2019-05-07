From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
Date: Tue, 7 May 2019 18:43:11 +0200
Message-ID: <20190507164311.GB1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
 <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
 <20190507153825.GA1502@mail-itl>
 <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8448316691333705168=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vvNG=TH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hO3BZ-0001yQ-Hi
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:43:21 +0000
In-Reply-To: <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8448316691333705168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GD0jJf8rm+K0B4Sk"
Content-Disposition: inline


--GD0jJf8rm+K0B4Sk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 10:12:13AM -0600, Jan Beulich wrote:
> >>> On 07.05.19 at 17:38, <marmarek@invisiblethingslab.com> wrote:
> > What do you think about adding something that could be backported?
> > Xen is quite insistent on initializing framebuffer, even with
> > console=3Dcom1 or console=3Dnone. Which means, there is no workaround f=
or
> > this problem.
>=20
> When the system is in a simple text mode the /basevideo option of
> xen.efi ought to help, but if it's in an LFB-based mode already (which
> is the case on the systems I have) then indeed I can't see any
> workaround.
>=20
> > Maybe, as a first step, a change that abort framebuffer initialization
> > if lfb_base =3D=3D 0 (I assume this is never valid value here, right?)?
>=20
> Yes, that would be an option. But it would help only in your specific
> case, not if the truncation results in a non-zero value. I guess we'd
> better avoid filling the structure if we'd truncate the value.

Yes, I was thinking about setting lfb_base=3D0 explicitly if it would
overflow otherwise.

> But what's wrong with backporting your change as is?

If this commit would be backported, what value you'd put in that #ifdef?
Also, one may argue that ABI changes should not be backported... But
since there is clear and independent of xen version method of detecting
it, I don't think this would be a big issue here.

> > If not, then at least abort boot when text console is still there
> > (blexit before efi_exit_boot). Any preference?
>=20
> What's wrong with the text console still active? Or maybe I'm
> misunderstandint you make...

As soon as you call ExitBootServices(), you can't use
SIMPLE_TEXT_OUTPUT_INTERFACE anymore. Which means if a) framebuffer
address didn't fit, and b) you called ExitBootServices() already, you
don't have any means to tell the user what is wrong. Other than serial
console of course, if you're lucky enough to have one. So the idea was
to report the problem before ExitBootServices().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--GD0jJf8rm+K0B4Sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzRtZ4ACgkQ24/THMrX
1yyyfAgAl8W5xOVYsNwgokMKqMrJ7blZq7xUpiQ9QTjocl56E39f+Wxssd4BN1u7
QOI3yeDFdm2BZMRFoM+6E2V4XsTosule0wAzQQ0HuhSsvhuHMX5tE6OAKTV6ZS6S
6X5y8Fc0TZOlrScK+SPsesi3UhlMIypz4YWP7Z3fWitR38T1vsY5D5I8butFap5B
4SAmf/IZjv9IIP2WH4cCvcAxsg+PWzIUCke6Nwy7lNMWGUjP2baUfWQTLRNBwlSq
R57z79cR5zbU2f5RxqiOrVGiCMQ6cOaZF47UWpGhMIQh1qIsAfTMn8+vB/Ir/nRj
RFOtzMrqkqIealG6bWrw9Gzmf2TwvA==
=yOIa
-----END PGP SIGNATURE-----

--GD0jJf8rm+K0B4Sk--


--===============8448316691333705168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8448316691333705168==--
