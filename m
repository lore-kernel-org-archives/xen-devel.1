From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/6] xen/domain: Call sched_destroy_domain()
 in the domain_create() error path
Date: Thu, 01 Mar 2018 14:27:09 +0100
Message-ID: <1519910829.9145.21.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5794895119590068009=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5794895119590068009==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-j7PrKIjdB37Abl7l31yi"


--=-j7PrKIjdB37Abl7l31yi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 14:14 +0000, Andrew Cooper wrote:
> If domain_create() fails, complete_domain_destroy() doesn't get
> called,
> meaning that sched_destroy_domain() is missed.  In practice, this can
> only
> fail because of exceptional late_hwdom_init() issues at the moment.
>=20
> Make sched_destroy_domain() idempotent, and call it in the fail path.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-j7PrKIjdB37Abl7l31yi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX/60ACgkQFkJ4iaW4
c+5BTRAArkgimZlvWUaDFpf8a7+/TjX69XgggeH5ZGFM6Xg/l2X5NNzUqaEFk10r
EX8kJHCGiarDiE0BI6qjWP5pP+nJwkPKFWR8ueq6socMTkTJldr1y9MSzGkZmRMN
IonkI/RYuvP0Hg713NCPulrkyKWuXIB8mevF4hT3ecwet9j//GjMm3Oa9zIjgXT6
2hZMYB7URiP4zsQI041vlGQ+LwuMbgI/2z6+IGpDNq03eX2c6yx596cizKgTtsiY
d0y8oRq24c2EC5+3qtOhJuVDc8sZ5Z1i+RuFwBoXL4nXn2cz8Yecjf2KOaMzvIa3
MwD6oLnoyMLX48BAygxu/S3TwEt+5QvVlD+Lcb04mQoiBdNRMatJymEq5lYYej64
UxURlPz5QNE56zM+MFRxJiFa2T/9368C+VXAVHJzQ79BD6v/n+vwKt/w/B/AWE46
t/lUGKC6yA9+ImX+r+XTTtk7fdmgkeSV5JQ0QsgpZkV2Bzz87SoBaZ93QUCKH+x/
x1YVJRdu7oP5FyqZKCLslKN1OOuSSJVkO+BTJJ7fk7yD9FQnYbxjX/qIuKHo8DI3
yTOpzlArFdYLzU5AzO8gfR+qUmTRsYSQ3rMeiz2vmK23fOdBX0M229Q2yI0g7wYZ
mo0YHBPcws9baugol2RHizmCKL3lOUXuJS92gHWgodt4cwt8cTA=
=xbOH
-----END PGP SIGNATURE-----

--=-j7PrKIjdB37Abl7l31yi--



--===============5794895119590068009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5794895119590068009==--
