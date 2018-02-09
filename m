From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RTDS with extra time issue
Date: Fri, 09 Feb 2018 16:18:47 +0100
Message-ID: <1518189527.5019.28.camel@suse.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <1518182334.5019.15.camel@suse.com>
 <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7634168045984626239=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=54lt=fd=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ekASB-0000io-1E
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 15:19:07 +0000
In-Reply-To: <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Meng Xu <xumengpanda@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============7634168045984626239==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-s5SiZt6hSbqNzdXxiKhX"


--=-s5SiZt6hSbqNzdXxiKhX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 17:03 +0200, Andrii Anisov wrote:
> > If DomR is not able to get its share, then we have an issue/bug in
> > the
> > scheduler. If it does, then the scheduler is doing its job, and the
> > issue may be somewhere else (e.g., something inside the guest may
> > eat
> > some of the budget, in such a way that not all of it is available
> > when
> > you actually need it).
>=20
> The DomR guest is really lean, I already shown processes list in it.
> I=20
> really doubt init together with getty on HVC can eat another 10% of
> CPU=20
> at any moment.
>=20
So, I'm a little bit in a hurry now, and I'll reply better later (or on
Monday). But for now, just to understand things better, can you enable
extratime for DomR as well, and report what you see in xentop, and
whether or not you still see deadline misses?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-s5SiZt6hSbqNzdXxiKhX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp9u9cACgkQFkJ4iaW4
c+6PWQ//ZY8m4iwxwLKsxwgOztUSvxPO5s4+LwWPJtMtJTWMk22lS9YuOUa0B5az
79eLn05Nmy1CFqVLLSC1/0pX3VnmPTNYcndOeB3mJgPtiwU9mG6DATS43Jl2+QUc
yWPp/9Yhnoxsql3ZJ3Vg0Ghr3wVq2KnINFyEScD6a1HDZuKRzeKQ7PWEEjVhgF3l
01nYtBEQfpBpnhi0c2s9cB6+FGhfqQ5Id6NW/xCkgQpahZ2RIOhreAe1H6qC8VsU
RWY/n7ePQgl33nPLGA1/FB4O7Ur6qczc8yj3UxTyZJsmYEqV1z0dwm5jS+WpmMv2
lHeXCHdZuTDchHCU8bFitxJccv0nN85SlGYnLtoo8pUR+MEoRNeB8NziMhZLlNt4
dR4IrgamBb7IKcDyfeecrZONYZjkIuN9SD4YdXGNj1z3prYJohRKrvU0LlW805ga
bjHqszxPeEU+AsE4HX4ldi0ISHccrvZ9RZB+XpNEK0xFB4j+X8EK347UTOAsV0M9
kTyuTcJFditrVIr3Fk0TNWpubCqXsOzabKUBAYowkb9IjC27M0qpvriJuD91pFU/
NF8PO0FqBTZsQyxyjlyRrFpiMT1ill+3Rw5rk/i77g7OHqLkYyrMOyuCQjilRo0D
p51KS4YirkmaGSV6fmBBPAY6EPuzZHgEDG4xXK+4Nhl7JDT1dbY=
=0jLx
-----END PGP SIGNATURE-----

--=-s5SiZt6hSbqNzdXxiKhX--



--===============7634168045984626239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7634168045984626239==--
