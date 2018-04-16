From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 7/7] xen/arm: Restore IRQ affinity after
 hotplugging a CPU
Date: Mon, 16 Apr 2018 14:38:52 +0200
Message-ID: <4cd710a787e5668a98b83e8e53ea1ca1d7c5407c.camel@suse.com>
References: <20180411131927.27083-1-mirela.simonovic@aggios.com>
 <20180411131927.27083-8-mirela.simonovic@aggios.com>
 <3c33657b63a04a466028b02ce52d8777bbbfbf04.camel@suse.com>
 <CAKPH-Ngu7i+M2HPTG4WZ5hg5ZOKd=va5dECSK+W-=EnwBzR1zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2844623852610008268=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-Ngu7i+M2HPTG4WZ5hg5ZOKd=va5dECSK+W-=EnwBzR1zA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, julien.grall@arm.org, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============2844623852610008268==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-r6li7tow5xxm+xeObTFv"


--=-r6li7tow5xxm+xeObTFv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-04-13 at 12:11 +0200, Mirela Simonovic wrote:
> Hi Dario,
>=20
Hi,

> On Thu, Apr 12, 2018 at 6:49 PM, Dario Faggioli <dfaggioli@suse.com>
> wrote:
> No worries, my commit message should be more understandable and your
> answer helps me identify what's unclear. I'll try to explain below.
>=20
> This is about suspend/resume implementation for ARM that is based on
> PSCI and targeted for embedded systems as well. Each guest could have
> its own wake-up devices/interrupts (passthrough) that could trigger
> the resume. So the wake-up interrupt in this context triggers the
> resume. By 'all interrupts' I meant interrupts that are left enabled
> by guests upon suspend (those interrupts could wake-up the system).
> Here is the PSCI-based suspend to RAM design spec:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574
> .html
>=20
Ah, so you are talking about suspend/resume of _the_guest_! This was
actually the bit of information that I was missing. :-)

This was, probbly, partly due to me not being familiar with ARM, and to
the fact that I haven't really looked at the rest of the series
probably.

Still, I think it would not hurt for the changelog to be a bit more
explitic and clear.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-r6li7tow5xxm+xeObTFv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrUmVwACgkQFkJ4iaW4
c+7otQ//cY4g+ddSNLhtKiUPULZlEoBAKGEKljxm0T8aAw7SX7Am47m8ug/hxVgk
f5J4R7B9Zi4ecsxJfW7nG6yoIb06s5g0+nmCtzBxq8ZbV+EwgHeVCbO2VRPyxoK9
UiKumpCw0ObqW8c9yD9xSLDU1KQZPu4pY4y18ZzCGr90foVranW5luTRf07wCCf1
K491/GP2UMiuJD7kNSOqsEuvdLRbQcnvI5buWTmyM43utnHj+2RTAAaatlTGFyav
untPBnB+0/RM7tl56ZabwMeaGWWHBfSxWVUkcJd0Pl5Fula34MG1oOsYvM3o3UGm
7pVm3Io/y2RnZhBjXDNW4eD57dJiXNXTuGe4hhjHOxamGjlhiIM0le6Q0H5f8fzB
XuAPtWsXWHLaUIeaSjNt/Pv1Lz/yXPpWeDwf7L2ZCiwCFCmGpN2TTP8DVltEaITi
Naksg6RXlaSS3yWqyxaKOf0WGzBmdj6maVFvXsHfgmiwCJZuQYJ3Zswgvu/vXClL
FR9MZfa0nKpVpP/sFuTccIYdfXoTe20bxmb3vrvq4NzKlAVjALDkqSaNPM2Qr0NA
p+KwFFss281zokcvoFZhDfFyB0V3qumCS6hS7plWhO/KqyCpSYRWw8cTsS32voCf
/bPKsGliRGEBVv3i1TzMNUztfU7+zHhsaEDl1wRcmSe3ClQYfBM=
=vWAL
-----END PGP SIGNATURE-----

--=-r6li7tow5xxm+xeObTFv--



--===============2844623852610008268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2844623852610008268==--
