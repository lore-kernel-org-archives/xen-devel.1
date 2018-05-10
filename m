From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Thu, 10 May 2018 18:21:57 +0200
Message-ID: <7eb8af10b99b61720ecd9ff273b38ec1e4ae163d.camel@suse.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-11-mirela.simonovic@aggios.com>
 <ffc6351e-350c-b1c9-ea3e-fd4936701eb1@arm.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
 <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
 <4dec77ef3b2a940453e1bc112e6dae21cb99af18.camel@suse.com>
 <CAKPH-NicJOBS7mLYSvo-Z62yxNuFbMZfZR7BdfUfJvEcoGoZOA@mail.gmail.com>
 <300e3466-8214-764a-6c33-ce8aaea31ed9@arm.com>
 <CAKPH-NgvzykBMx1jouMV-fBbLN8=oHmb3zFhy+pPQTwcQdf2Vg@mail.gmail.com>
 <16d143e7-9edc-830d-8688-74839cb11583@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3367610054844486687=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <16d143e7-9edc-830d-8688-74839cb11583@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3367610054844486687==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RAUAzQGqctzeAnl2Ids5"


--=-RAUAzQGqctzeAnl2Ids5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-05-10 at 17:02 +0100, Julien Grall wrote:
> On 10/05/18 16:49, Mirela Simonovic wrote:
> > Regardless of the fact that the notifier returns an error or not, I
> > believe it would be good and safe to set priority and document that
> > priority zero would cause racing issue in the scenario I debugged
> > today. I'm pretty sure that this discussion would be forgotten soon
> > and it really should be documented in code/comment.
> >=20
> > In emails above I assumed we'll stop the erroneous CPU. I didn't
> > have
> > a chance to try returning an error until few minutes ago.
> > I tried returning an error from the notifier now and the whole
> > system
> > fails. You realized according to the answer below that this is
> > going
> > to happen.
>=20
> I was aware about it since the beginning. The whole point of the=20
> conversation was we should avoid to take the decision at the lower
> level=20
> and let the upper layer decide what to do.
>=20
This makes sense to me.

> > I would rather stop CPU because changing notify_cpu_starting
> > affects
> > x86 as well, I cannot dig into that and it would be really to much
> > for
> > this series. Since you're fine with stopping cpu as well, please
> > lets
> > do that instead of escalating this to who knows where :)
>=20
> Also, while I suggest that it could be replaced by stop_cpu() in the=20
> common code, I also suggested that notifier_cpu_starting() could
> return=20
> an error then the architecture specific code can decide what to do.
>=20
> On x86 it would still be a BUG_ON(notifier_cpu_starting()). On Arm
> we=20
> can decide what to do. But it is not part of that discussion here.
>=20
As just saind in the other email, I don't think this is all it's
necessary to enable CPU_STARTING to fail.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-RAUAzQGqctzeAnl2Ids5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr0caUACgkQFkJ4iaW4
c+6h+A//ZamWGgG+LePfMOeVKoW+7kqHqlGH5luqZfHhKLUK/n5XTJ4E9QbAP/CN
mbywlTmkiPFZyj0+INPDZjdyKMYCoU1tw81m2BXIllJMKfpq5BhbhjyuV2uiMPMf
/sU+3dIeKyXYyZwrbyo9mhus6as4589ZEPmj38+3wzSMKpTqr9aWsMf6y1TcPCzn
2fayMmiHzrCqxKChlI+oFCynRZl0LktIR2WHmYbgmHXV516Mu8vNs/EnzMY33aEf
bDcCQMkvdQEXHvSC2dJoLh0tTzHzYDGpvreGNqpYRBrJ83ST4WmmL0hnmCxbxgUL
/qFZu15PEOyWTjGSGKmd3ZhIgDz1kULJU/w233hVbgkewo2RB90AFYV1KCrrEGJm
SY5z973AdH5R1Ikl2tuHyCv6BnHjKvQIZE/f3k3ityvqb1V/4L0iy6lZeRllHXFD
TJHJ60dVpnoD6RICvy1f+wBYtIeaoDYOfc7yyRXV0uNQyYpA99sPhEt2rjSVM4X7
Z415De/SdaS2CKdMlKbDYIVYnmni+CXG92Es2xfZhr8AnOB1AMwjo6V/RHTX6jRS
1h6q50TDZpRtJ+Ok5Hwv380ZJIcatScRnUYyLoN+s5aZTLmhmWeQWqHA5Ql/7K7a
+71yQEbXx7i966zE9THCZaLwGAuqZFLay/RYnGwatLwDcf+59ew=
=wZZF
-----END PGP SIGNATURE-----

--=-RAUAzQGqctzeAnl2Ids5--



--===============3367610054844486687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3367610054844486687==--
