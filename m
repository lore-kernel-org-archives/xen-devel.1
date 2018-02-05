From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/3] xen: Disable ARINC653 scheduler by
 default for non-DEBUG builds
Date: Mon, 05 Feb 2018 15:42:01 +0100
Message-ID: <1517841721.8082.1.camel@suse.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <20180205113642.3174-3-george.dunlap@citrix.com>
 <5A786BD402000078001A53CA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3941560595666776700=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jhda=e7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eihyz-0007KJ-65
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 14:42:57 +0000
In-Reply-To: <5A786BD402000078001A53CA@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============3941560595666776700==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ta83OIz5pCIcRpIqzCQM"


--=-ta83OIz5pCIcRpIqzCQM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-02-05 at 06:36 -0700, Jan Beulich wrote:
> > > > On 05.02.18 at 12:36, <george.dunlap@citrix.com> wrote:
> >=20
> > The ARINC653 scheduler is targeted at a very specific niche;
> > typical
> > users cannot benefit from using it.  Disable it by default for
> > non-DEBUG builds.
>=20
> The more that its prompt says "(EXPERIMENTAL)".
>=20
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-ta83OIz5pCIcRpIqzCQM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp4bTkACgkQFkJ4iaW4
c+5lkw//S/ZxCqhqHGGksvS5QHCeZ3+GINDBfUbw7Vjcjm7E3fYCYW7Q4obKpaVu
J04jVFCrhuEk9d2VTIQxqQue+iHN2s/6lGqboFAOahTzW4/VYyUbPyUfmnZ3I95l
Uwi+pypbhoBBoWgjh7T/7420jqKtVQAoAx5xTiznZg9SBxwsqLsx13lgQsrI5YbN
WYtaiFxQh3kNb4OTJVvNbnDE2HQ1WOxzrMzV2ws/H30LoWIABuyLBSenVgNtoYUE
N9DOor2hyvxWHxEbdp/Mx+IRA58U4zsqym7DI47fgv46lU6JxhpxNfRms2W0lUW5
2PPYuVIsRZSHHPrI9b+Pl8EMGesvc789O5PHwDfy4JgrHV4Fjigwlv8scJaRJ291
fc6L7L4TJynj0x4jJg+dgFchgulace3VCyQSZBr1a+Zagax807zA6EQmXXucjSzy
3xc9C3ueBZIKkGrldyM2ykAvrRJeho74jj+iM//sFTTakjjSEmf7LcWI6ILHWjzD
o789ez6PhPp6ZWpm7gv8ff2Pv2u5PDoBBhrkJYewqdX9VCOCbZzzxBr0ZJfpw6HY
xh5U++HpLenWtcRK6fSHZMHoGVEC5LByGSwXN1CVyUghrN+amSWDvc5RNc1A7Hd5
h+D+aI8pqfAwPnL01HSWVeR66wVeYgef+mBXuQqpsK60qxjNQHg=
=yg/2
-----END PGP SIGNATURE-----

--=-ta83OIz5pCIcRpIqzCQM--



--===============3941560595666776700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3941560595666776700==--
