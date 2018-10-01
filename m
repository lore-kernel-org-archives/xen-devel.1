From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Mon, 01 Oct 2018 19:58:40 +0200
Message-ID: <21b6732f17b0adc631bf85f9c42afc60510bcd73.camel@suse.com>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2547146926573110525=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fopu=mn=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g72TG-0004ye-05
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 17:59:02 +0000
In-Reply-To: <ffd0c284-c1c9-680c-564a-ce066a1fb210@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============2547146926573110525==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-o+RzgEm1E5m2xZqIpAG7"


--=-o+RzgEm1E5m2xZqIpAG7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-10-01 at 18:07 +0200, Juergen Gross wrote:
> On 01/10/2018 17:48, George Dunlap wrote:
> > On 10/01/2018 04:40 PM, Andrew Cooper wrote:
> > > On 01/10/18 16:35, Wei Liu wrote:
> > > > > Wait, the migration code reads the scheduler parameters --
> > > > > even if these
> > > > > have not been explicitly set by the admin -- and sends them
> > > > > along with
> > > > > the migration stream?  And if the remote scheduler is
> > > > > different, the
> > > > > migration fails?
> > > > >=20
> > > > > That's not so good. :-)
> > > >=20
> > > > But one can argue that the guest is specific configured that
> > > > way so it's
> > > > parameters should be preserved. We normally analyse things on a
> > > > case by
> > > > case basis.
> > >=20
> > > If there isn't an obvious fix, then the switch of default
> > > scheduler
> > > needs reverting until there is a fix present.  This is currently
> > > blocking master.
> >=20
> > Agreed.  I'd argue for ignoring failures to set scheduler
> > parameters on
> > migrate, on the grounds that this will be less risk to the project
> > as a
> > whole than reverting credit2 again.  But either way we should do
> > something quickly.
>=20
> We should ignore a mismatch of the scheduler. Failures when setting
> parameters for a matching scheduler should not be ignored IMO.
>=20
Indeed! Especially considering that this isn't really related on what
the default scheduler is (despite it being making Credit2 default that
triggers the issue).

In fact, what if:
- user uses Credit1 (default and supported) on host A
- user uses Credit2 (supported) on host B
- user migrates VM
- BOOOM!

So, unless it is intended --and, I'd say, also documented somewhere--
that migrating between hosts which use different schedulers is to be
avoided, this is already a bug, whatever the default scheduler is...

George, let me know if you're working on a fix already, or if I should
do that myself.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-o+RzgEm1E5m2xZqIpAG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluyYFAACgkQFkJ4iaW4
c+6tbg//bXkSkuKsd+8q1rlnofAleRIUpspfiKNL3zYgKRj+PpTu/CheddUgl8/P
gPsCnvPc7eKM8oURuxqIrg3dhQgxZeNryMsEVISYLig1lZf+V0Asy8/jBtmjqzDV
Sga4afHJsSBKRYLWWxkfOBj2uSscriMoHRKvUBpkrAI2WVYE258jwa4APKiJqz4b
QF6DJsxJ0OqgYUcXuww9hGVu9dvMDwHXyB9bBKFhLyv8nXXvRiTt68E8d0Ajcjk7
EV/0VUpykl2OpcdDgkUh1BJqflkDuQyVW5aIAVVv3siNrAzlTUCNBX5JucXt2JqA
MKZwh2vc5SaeApiQ0+26AlDYRY3iWHQ9ESYHHQ4DdCSmNJYCpGXddaahYDpVddhM
PbjVO9WJ8bsP+wOaEHqqq5a4qyl6hq2+FkZUYoMSk75hZ8cCg4WIhe1mkh67+P0K
IOMPHV/g2nFEtEKA2yVygM68gC133obUX16fu7ecs/FJgGBhL4EybrS0VrIyFaXF
7gmlDaS9SKGWVgBmFfbMYgh76oDFWzVfYbbRZrN00piOa3izkTC145+Jgel17c01
4mhNS70Oe9l5fBisUNaSmyTtsFDapAGcq3Ey9bOwzP3DjNr6h9aK1dkJ8UKpLV3Y
HPOLLWF0UzztsnsUi+pnuk4YOazqpEwTOam+5I1cOCyHAq/reUk=
=7awx
-----END PGP SIGNATURE-----

--=-o+RzgEm1E5m2xZqIpAG7--



--===============2547146926573110525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2547146926573110525==--
