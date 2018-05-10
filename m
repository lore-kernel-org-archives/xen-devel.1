From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 06/10] xen/common: Restore IRQ affinity
 when hotplugging a pCPU
Date: Thu, 10 May 2018 09:33:18 +0200
Message-ID: <ec82f39caaae39ba9530cf41e373bb6f1546adb5.camel@suse.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-7-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2539950937348947155=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180427171258.28852-7-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, xen-devel@lists.xen.org
Cc: edgar.iglesias@xilinx.com, George Dunlap <george.dunlap@eu.citrix.com>, julien.grall@arm.com, sstabellini@kernel.org, dm@aggios.com
List-Id: xen-devel@lists.xenproject.org


--===============2539950937348947155==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-yHAiMbkzQhzQoIkcIe2F"


--=-yHAiMbkzQhzQoIkcIe2F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-04-27 at 19:12 +0200, Mirela Simonovic wrote:
> Non-boot pCPUs are being hot-unplugged during the system suspend to
> RAM and hotplugged during the resume. When non-boot pCPUs are
> hot-unplugged the interrupts that were targeted to them are migrated
> to the boot pCPU.
> On suspend, each guest could have its own wake-up devices/interrupts
> (passthrough) that could trigger the system resume. These interrupts
> could be targeted to a non-boot pCPU, e.g. if the guest's vCPU is
> pinned to a non-boot pCPU. Due to the hot-unplug of non-boot pCPUs
> during the suspend such interrupts will be migrated from non-boot
> pCPUs
> to the boot pCPU (this is fine). However, when non-boot pCPUs are
> hotplugged on resume, these interrupts are not migrated back to non-
> boot
> pCPUs, i.e. IRQ affinity is not restored on resume (this is wrong).
> This patch adds the restoration of IRQ affinity when a pCPU is
> hotplugged.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> ---
> CC: George Dunlap <george.dunlap@eu.citrix.com>
> CC: Dario Faggioli <dfaggioli@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-yHAiMbkzQhzQoIkcIe2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrz9b4ACgkQFkJ4iaW4
c+54Xg//WlTM/psHaOMYIzcL7ViM2ErvHN6Yb99mB3o24p7TmgThS83cKJRwjR31
Z/duT4tI29zwYvXQYonMU0Q5lHSeJiurSrVz0tktPoUAOVouhXIc2gnfiYlNj4oo
faEtUgX5g1y4ZYggzyI1ZoYiVE6mby78DfnDik7F74EquJotHLhI7QTu03+dEbXm
0N/SlnnIshJHkyIrA/NL8ZTbeVX307rbZfhfvjQIdf+0gYSFaZigaQllnIzSaASO
j951WT5CLyjR3AOIUlxRYOsHZgPtaNEbng0042JyIyD02hLp8ZnPBWdDv+3V5g0d
U+uGBw1kP4Cw9sLYx0sJJdC9T3B17qKWppZseoIooX+LUDHOTcblkicM8RD1P5Pg
ITQXOUfNW5BR2451g5iHwVJmaA5rDeBYL/LhrVYopNSE6jXODq8WnBPaq0VXS3FO
JgHVFtf55CBLhr2WOXDi+eaY3nxUgtUCK05kI7uPDYuXRbqRADnGp3B32rl8EF9z
l7sxccwmxBAHG87k3FjJ7Ltg+1nQ8rSh9hZXqgW2ATAUmlRKCf78pElQ7/TOkndp
dR/UyDDE/G4dB7bZZuXZNuwwhOhsN5FIgHyTX8vhlzO8ngrUOGikxLPW3TrN/0rJ
nAM5UlGHke0lgvrXhx1Qb8wjkWWfLnC4eHPsiVjuRK8sDKNAp+I=
=mXLR
-----END PGP SIGNATURE-----

--=-yHAiMbkzQhzQoIkcIe2F--



--===============2539950937348947155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2539950937348947155==--
