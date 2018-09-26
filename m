From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 07/12] xen: add domain specific parameter
 support
Date: Wed, 26 Sep 2018 18:58:57 +0200
Message-ID: <aa87360953092ff9a16c3c53da73ac7a1878b624.camel@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-8-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1978732676577841656=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5DA8-00064f-ES
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 16:59:44 +0000
In-Reply-To: <20180918060309.7186-8-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1978732676577841656==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+Hiu+l3cao2PjMwK50J7"


--=-+Hiu+l3cao2PjMwK50J7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the subject wants to say "cpupool specific" ?

With this adjusted...

On Tue, 2018-09-18 at 08:03 +0200, Juergen Gross wrote:
> Add the framework for being able to define cpupool specific
> parameters.
> This includes the needed macros for defining a parameter and the
> minimal set of functions for doing parameter parsing.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-+Hiu+l3cao2PjMwK50J7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlurutQACgkQFkJ4iaW4
c+4O9Q/+MLHdvDAkm5uC75uYs8lEwTFJpZiJsd2vgnzxkYEH88NO/Yw3JCH2KXgC
s6Rhkj8k9FB3mVHBvV/oTWIP5i8Udf1bl/czky/a7mVUX+Rhwf+HhmY/MUlRWNJ5
ekoTyvYErwY/Te9UNc7nMRhDNAH+0B1zbZ/5iAgYvf+YwqRX1dTv37k+vBh/xAPQ
60wp+K7lUZ05NkeAm2d7MjLCe5WnabfA8cGkz29F8qPUkpxk56CA2TY3AskVd+Ik
KaimS9NmJRr+nPx+AJC7UdPD/6VbD0aKtuoThx2828Hg4eH+zXZMhvHNVXhBdNL8
OqRw4yh985xzbA1i+BxpCGGkDmNI9L3ts4q99pMTCb72+/6GU1GcTrAp6friluBw
WW66Sbwfl8ASRGJEseb3BcQ6ZVCpILK1vvWcWLtFhZQs2iTwi0xexG9VxXIJId/0
IewMmFG2qpWMtBX6nECDGolSqJzgeQiEt63Fiowq7R0xjrc8rCNXko6fsjFXE26r
0C46tAy5CB1ZeSEEePkZfkpkvskig5lOYx100M24irKwYHdwsXt3DBweLK2jK43K
vtBpc968dvLzFQumTi0Tz9MQV8FYv+fajrqZcl+Gd6XKdZgCFh1YJEQRDdkoMFlD
fvS8tXRePVZRVxcXjVv269YK2CnQnwechuDEflE/beKdr/vaqq0=
=mA6b
-----END PGP SIGNATURE-----

--=-+Hiu+l3cao2PjMwK50J7--



--===============1978732676577841656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1978732676577841656==--
