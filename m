From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Tue, 02 Oct 2018 12:36:15 +0200
Message-ID: <90163142367b52d50ca7c9eecc244b0fa70e33b3.camel@suse.com>
References: <osstest-128240-mainreport@xen.org>
 <5BB1E30202000078001ED16E@prv1-mh.provo.novell.com>
 <20181001143324.n6ghsnarvq6xslqt@zion.uk.xensource.com>
 <5BB238E102000078001ED56E@prv1-mh.provo.novell.com>
 <20181001151716.snpgmxh77crrmihq@zion.uk.xensource.com>
 <15ad853f-b9ac-ba0b-3cc6-457b61ec787e@citrix.com>
 <20181001153557.y4jgo37xzbaa5tgg@zion.uk.xensource.com>
 <fc2bbc89-cfc7-d906-6fe0-b1fd76ddd2ff@citrix.com>
 <26110706-a183-0c11-1efd-93ec76accd40@citrix.com>
 <ffd0c284-c1c9-680c-564a-ce066a1fb210@suse.com>
 <21b6732f17b0adc631bf85f9c42afc60510bcd73.camel@suse.com>
 <a54b13c5-1f51-f93b-040c-f1cd5a9aa9e9@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775050095022278490=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hhua=mo=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g7I2R-0002NZ-MU
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 10:36:23 +0000
In-Reply-To: <a54b13c5-1f51-f93b-040c-f1cd5a9aa9e9@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============1775050095022278490==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2teh6gfox8JQ++ToU4pa"


--=-2teh6gfox8JQ++ToU4pa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-10-02 at 11:06 +0100, George Dunlap wrote:
> On 10/01/2018 06:58 PM, Dario Faggioli wrote:
> >=20
> > George, let me know if you're working on a fix already, or if I
> > should
> > do that myself.
>=20
> I reverted the credit2 default; but really we need to have a design
> discussion about what we want the overall behavior to be.  It's not
> simple or obvious.
>=20
Ok. As saying to Jan, I'm starting to think that there is very few that
we can do, without risking of actively stomping on our own users' feet.

I mean, if someone wants to migrate a VM between a Credit and a Credit2
box, or between a Credit2 and RTDS box, who are we to forbid him/her to
do it?

So, basically, I'd make sure that the mismatch is being noticed, but
nothing more than that (i.e., I'd print a warning, and ignore the
parameters). Of course, if the two hosts do have the same scheduler, I
think it  does makes sense to re-apply the parameters them VM had on
the source host (principle of least surprise, etc).

I appreciate that there is the risk that one may have chosen RTDS, then
forgot, and not set sched=3Drtds on destination, and get an apparently
weird result... But I'd argue that if you are changing scheduler,
you're doing it for a reason, and it's unlikely you don't pay attention
to that when playing with migration.

Anyway, I'm not working this afternoon. So ping me on IRC tomorrow, if
you want to discuss this there. Or we can just go on via email, of
course. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-2teh6gfox8JQ++ToU4pa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluzSiAACgkQFkJ4iaW4
c+6OfQ/+OvEXvvStotaLV29jtyM08ecvx/qMOx/wgGpCPCWo1vHPi5rhoDIQTVPI
phZz6cAjuh1WU0ZJcHXFKJQLyiNNqPuZMMllqciB6rxothYaXUWrLvyoUsPtV/et
q11+5HM/lwnlrufzc2Uqf//GztjTW/0/7mexnsnYcFG3w/7VuIIhMYiJn/6Vy7z0
q/PZ9zFFCgCBabwu0N6sFZF4ROxAAxnZ3PIVKH7VFkKXxGk0yTHmcd4yK4fP5l8/
adYvu0i3Ks1ftvf0aS0kEx0aNrmqdkchmlKUEZLul5o/qTK5+R5rvKH1v6YAeg4a
tloqErBZJlgRleaTEuwLqxL35ttTEvpn+DkKE57BcM5kfjlvyHv3L9Yh8eJGviMx
HfotdHavCZJQ9C5uuiOutnZzVpD4YKdp+V2xMZ1ArfgPWg/oEB7a5+3hFjROz/Ji
7f8Zv9VT8g5BtB/xmJT+YjZTwJRlfT0fUwJtVMSq4SqSdl/j9nlUIgqBnQJ4lwF2
eU4tR47IpIjfPl3Sv/lnXSXlFZ29qtl2WR2KFkBuZ6rK6ChiQBE99B/UsypdQsyB
FSkkdXVZ53XrPaSR/JBV0doVqgMwfTeOj7zP4UUHSqHIgnQL31I3rVtHKQ4ZCBDY
l0AkFaCLyQMUJdJi+MQQDk7KwnrtV/R2HVsDPsTf5DopufITIiE=
=JRIV
-----END PGP SIGNATURE-----

--=-2teh6gfox8JQ++ToU4pa--



--===============1775050095022278490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1775050095022278490==--
