From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Mon, 01 Oct 2018 20:02:13 +0200
Message-ID: <76dd7d919faa6560aa025b4eb57301e97914b26b.camel@suse.com>
References: <osstest-128240-mainreport@xen.org>
 <5BB1E30202000078001ED16E@prv1-mh.provo.novell.com>
 <20181001143324.n6ghsnarvq6xslqt@zion.uk.xensource.com>
 <5BB238E102000078001ED56E@prv1-mh.provo.novell.com>
 <20181001151716.snpgmxh77crrmihq@zion.uk.xensource.com>
 <15ad853f-b9ac-ba0b-3cc6-457b61ec787e@citrix.com>
 <20181001153557.y4jgo37xzbaa5tgg@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8779457555915988540=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fopu=mn=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g72WV-0005iX-Mk
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 18:02:23 +0000
In-Reply-To: <20181001153557.y4jgo37xzbaa5tgg@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============8779457555915988540==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Lqbu8YpVKAacn+en7ctL"


--=-Lqbu8YpVKAacn+en7ctL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-10-01 at 16:35 +0100, Wei Liu wrote:
> On Mon, Oct 01, 2018 at 04:19:07PM +0100, George Dunlap wrote:
> > Wait, the migration code reads the scheduler parameters -- even if
> > these
> > have not been explicitly set by the admin -- and sends them along
> > with
> > the migration stream?  And if the remote scheduler is different,
> > the
> > migration fails?
> >=20
> > That's not so good. :-)
>=20
> But one can argue that the guest is specific configured that way so
> it's
> parameters should be preserved. We normally analyse things on a case
> by
> case basis.
>=20
Sure, but then this means that, in the restore path, we should query
the scheduler which is in use on the host.

If it is the same one that we also see in the migration stream, we try
to set the parameters. If it is a different one, we skip the setparam
all together (which is basically what Juergen is suggesting later in
the thread, AFAICT).

I don't think I've ever worked on migration, but I can try to look into
fixing this (tomorrow).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-Lqbu8YpVKAacn+en7ctL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluyYSUACgkQFkJ4iaW4
c+4d8w/8Dqhg2m1uiZZ/JBsjj+J+Hng/OABt4islsUdtzPs5AjqYHg98noi09npq
NSThxG8NESUrkCD52EspuPe2pSsUTOHdd1Ax5FTWoKWbxI0fOrNV4CHrJdbBdbS2
LvQhftyMLiYMZoeLOYXQiFgxKuVqPbaEa6kCtK3r01XCBLaQWeOhYE0Rh6OfyZ05
3kcURovxIrdiDpYdm+LdqLBjc7ObzawpYvWiKICSfZ5zEGtSDayZMEU36EM5XbY6
CGznZfDP8OhWU/TAUppOCusXRNiuRdslUXzTPF1kKaPd1tAQ2mnuG2rPQI8yaJsz
nm+jKTpo3+LCip9dtKd8SsTHjSRucsERLsYWq4XfxenXc0NKj6ofguUTMrgUg6nj
/AUlpraNxDDRegvEeAt5HAmBPePxUAKO/0Vw93Cp7xLTXTbg2Es1mBQwuFa/OgM5
oq8CcxOFtgZTn9WRWjdidNHB+UCwbDI8TcX/Ur/C7mq+HRSA58CnN9Zkf0PoPB+B
j7xLRnTxtN9W/mrFD68k0DL5ke9xMwOaGoDoECMpXI1Q0uNtQ+/p6OjUt+fHMYwo
g5hWD0LcGWFrEtW/r7E22VP719rXO/Yy7S32qz25oJ/O07xi19x9HOtk6QEL9VZE
RYT/jryUPjhaW+zQWV7P+owjkEgjrLr/K/PjfZg4hDv6yDDyOPY=
=UXfV
-----END PGP SIGNATURE-----

--=-Lqbu8YpVKAacn+en7ctL--



--===============8779457555915988540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8779457555915988540==--
