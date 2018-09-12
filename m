From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RFE: Detect NUMA misconfigurations and prevent
 machine freezes
Date: Wed, 12 Sep 2018 17:13:59 +0200
Message-ID: <2d2f115d3f45d76ea439a1b36df9953a3b979aca.camel@suse.com>
References: <6564259.GaOmOO5kt2@wopr.lan.crc.id.au>
 <29fc38c6-8908-2f6f-e496-a1644f56c59e@suse.com>
 <4e93ef83fb40d6a2a87f902f17bc0bc5@crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3635623575550961559=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g06qg-0001rC-K2
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 15:14:34 +0000
In-Reply-To: <4e93ef83fb40d6a2a87f902f17bc0bc5@crc.id.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============3635623575550961559==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fMthdTplQN+xcFwLcxg3"


--=-fMthdTplQN+xcFwLcxg3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-08-30 at 14:01 +1000, Steven Haigh wrote:
> On 2018-08-29 15:49, Juergen Gross wrote:
> >=20
> > RAM placement should not matter here. As the name already suggests
> > cpupools do assignment of cpus. RAM allocated will be preferred
> > taken
> > from a local node, but this shouldn't be mandatory for success.
> >=20
> > Would it be possible to use a debug hypervisor (e.g. 4.12-unstable)=20
> > for
> > generating a verbose log (hypervisor boot parameter "loglvl=3Dall")
> > and
> > sending the complete hypervisor log?
>=20
> I don't have a package for 4.11 or 4.12 built at all - but I did this
> on=20
> 4.10.2-pre (built from staging-4.10).
>
> [..]
>
> Add the CPUs:
> (XEN) Adding cpu 12 to runqueue 0
> (XEN)  First cpu on runqueue, activating
> (XEN) Removing cpu 12 from runqueue 0
> (XEN) Adding cpu 13 to runqueue 0
> (XEN) Removing cpu 13 from runqueue 0
> (XEN) Adding cpu 14 to runqueue 0
> (XEN) Removing cpu 14 from runqueue 0
> (XEN) Xen BUG at sched_credit2.c:3452
> (XEN) Adding cpu 15 to runqueue 0
> (XEN) ----[ Xen-4.10.2-pre  x86_64  debug=3Dn   Not tainted ]----
>
That's not a debug build, though.

It would be useful to test one such build (as suggested by Juergen), to
see if any of the existing ASSERTs triggers.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-fMthdTplQN+xcFwLcxg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluZLTgACgkQFkJ4iaW4
c+5jVhAAtFHQzwOHpzP9nxw5t6s+Ra1EkTT6XToHdDdW79KIQchmnW8PlOx4/NmS
hJo65UXXWMSdjdn2P54dhA37lmhlNU+MFCth4tFGYjCb+bzbD6stpDuDnK9RGMwg
SWE9KDhGoJWNV1xcAMN637lCdOcFSXHabXdN7NKVzFLzlEnPftuRg21bstRdBNla
OURpbb6JWQ2d46XaXDQgy203xlhpmkvk8orxgDIEVIBOKPOUuDdo+FQLXc6oQnTY
bRni6r6Af5eW5eCbW3g1eVNxoCK5AHj6/+rGeFqTjDKFDicbjwKKLVfOiq+VVIFn
Mkv81iqBsyVmjdclgFKE57HX83rndpKY8SJMLONFQ03WFgsHk7dSCBuzQUIA/138
bvEyJ8f4sZpFiI3hFYcrwlccXzjHMYJXnsJendxVEGAflN42dth3O6ErxwEstdwJ
BQZFbQ671t6mUt80LZBKLrPjOncPteNs9ScWBgqE4AOVxFciwX48wktvDsNeQVWl
vre8F6+FhIbSPdGry7FCpX56NfI2MldLCpDUJbSIvjpc8MGhnwZdRyxMDIJII2VT
MsRJekD/nVz0O5Guz534fXQRatxcNEWJzKg8QS8b2jWUIbcdF6sAWorYicbXxvza
XmTG9k3oYvAU74Z4RCVgsmMGcBDXfoFz2LM35S1T/XPRI870KtA=
=Sugh
-----END PGP SIGNATURE-----

--=-fMthdTplQN+xcFwLcxg3--



--===============3635623575550961559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3635623575550961559==--
