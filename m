From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/3] xen: Introduce
 vcpu_sleep_nosync_locked()
Date: Mon, 16 Apr 2018 15:21:58 +0200
Message-ID: <39c536ea48d4e6c207c61f94f197c18edda649c0.camel@suse.com>
References: <20180411122518.26270-1-george.dunlap@citrix.com>
 <20180411122518.26270-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6735500179270524190=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=igme=hf=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1f845N-0002bA-07
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 13:22:21 +0000
In-Reply-To: <20180411122518.26270-2-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============6735500179270524190==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MjZDA297YYhgF3pwEj+N"


--=-MjZDA297YYhgF3pwEj+N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 13:25 +0100, George Dunlap wrote:
> There are a lot of places which release a lock before calling
> vcpu_sleep_nosync(), which then just grabs the lock again.  This is
> not only a waste of time, but leads to more code duplication (since
> you have to copy-and-paste recipes rather than calling a unified
> function), which in turn leads to an increased chance of bugs.
>=20
> Introduce vcpu_sleep_nosync_locked(), which can be called if you
> already hold the schedule lock.
>=20
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-MjZDA297YYhgF3pwEj+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrUo3cACgkQFkJ4iaW4
c+7RTBAAg6ZjI1Y2er6iFwGs4yiC4flH6Sdw8NCSk9EeN7lsWdnspAT8yEDxIUlx
oDOIu5188fyzUTCryPbVqmbfnNtXFBOXSltVffiexqOEciIMMMwhJyXieKLlwfmu
Q3RiogbC63IylWkD7vg1Hh+8h4PPry1VDUzFoKxk1m/cz896pAVs9YwrGsInVu57
aUTZcr3qM7I8xdGPqfuALtRdjMqX9dFI2w8xK13UxITZ/VikP5yLC+R/68dISY38
Ky78SCz+1elpPBn5Ht1oZtaUblZa/o3mx9x0xkjGzY1AWLoQrPOF7mJm5n3V0sLd
+I91d/8oyPKxhk3udHekDM03c7ilorjnpObZaYk6sk8zXBpmzfEyZme+o8fTfWiW
PO03SzN6XQatwdBVNjWFNC3++STDQ8ydj5Q6U4ecNoj6Q98Xu2e0DS1/OliwetM1
LXuPMX1zH2ZGs6viKS823ISAjoMHIrxr5Mm3wYymkYqMVL6DGCTDraXuTCFW5gxg
sMGpfmgte4q+zOZ5gmALO1myzxsZqs9AKHVog5DziKjzsdaErFABukF72iHsN3Gi
RcdjiN/ZKowsovt41NgVdw1ecreU6z2g+1AHzYC2G6jqvqOW7SONznHLnG847q1j
kPT72vcsUkg/o3+IfQtDkTb/erEwFKnSMjtwt9xP2UTtnkY2gbk=
=COzs
-----END PGP SIGNATURE-----

--=-MjZDA297YYhgF3pwEj+N--



--===============6735500179270524190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6735500179270524190==--
