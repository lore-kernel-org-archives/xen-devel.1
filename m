From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 2/6] xen: add helper for calling
 notifier_call_chain() to common/cpu.c
Date: Fri, 29 Mar 2019 18:33:11 +0100
Message-ID: <c9629b8982c9ac634d8b7d223d1823286202ec4d.camel@suse.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <20190328120658.11083-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5720679569975248691=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9vNZ-0000z9-Ig
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 17:33:21 +0000
In-Reply-To: <20190328120658.11083-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============5720679569975248691==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Y3KeaAh2UlV8AsxEv0UD"


--=-Y3KeaAh2UlV8AsxEv0UD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-28 at 13:06 +0100, Juergen Gross wrote:
> Add a helper cpu_notifier_call_chain() to call notifier_call_chain()
> for a cpu with a specified action, returning an errno value.
>=20
> This avoids coding the same pattern multiple times.
>=20
> While at it avoid side effects from using BUG_ON() by not using
> cpu_online(cpu) as a parameter.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add nofail parameter to cpu_notifier_call_chain()
> - avoid side effects from using BUG_ON() macro (Andrew Cooper)
> ---
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Y3KeaAh2UlV8AsxEv0UD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeVtcACgkQFkJ4iaW4
c+58aRAAo+c6iZq28s9XqtTQu6kzAW9MIUZPE7TkYHGUJiVWOhcHqKeayWT6HoME
PF/7fgtcSH2lRNNs7UIj1dl5s/hJwelSDKgJ/S2jJ/gvFgXQIVHA+KiZHnspTOHy
SFlTUs6r137wyGFMb1UeedmyfnpTUJ9m9dRojnBhbYTb/YW25E16q3YWvhSikR4e
Z4iajikH04JhRK2cCHTWkXtylMV3K1U5NtvRWYVt+npI4TXe/BEzZ7xLLto/bLqv
iRnTrirNv/KAht4T0DOcVoVd5UdvOHqZKx51UsW+zqjV3BbC7vmp/f39W2EyJhyt
Z4vfW2r+o/gFfH2gYkWMGY157o5tIXJRjIIhgZREqSy0MkIbmzPnTx7tvph1KtMo
Ipy86UOuvIunML8MUwe/RolsS33uK5B2qAhHhON/MJNb8XbK0pObs9pOYQZ+yJP7
ujpEjR+FwECqtUSIDCdRn6EDVsGTNf1iEmZ9yvn5mK9YsXUuoejRj0kDx3k72nmC
iVrZdNNBfXTyNJpGKYf55fTx5f+VNb0syDJmgrIjckwlgXxIJoMH7zOndEYcwNhm
TEu/Wf2X9dcKXIEbUD0HuyDMjidVXpxGHR51v/s5ECaMEgb94OWEh8vd0Wim2e+y
IfTOTWs4kNI7Go3kgz6xKzDWUBOpofbGZQ8MKmGaIqnmsik6ooE=
=oqlg
-----END PGP SIGNATURE-----

--=-Y3KeaAh2UlV8AsxEv0UD--



--===============5720679569975248691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5720679569975248691==--
