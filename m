From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Fri, 16 Nov 2018 23:10:01 +0100
Message-ID: <8360fcb5d01296ce3486411595c46786e2fab675.camel@suse.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <d4dc12d3-2382-44d3-d078-faeb7c195eb4@arm.com>
 <036e4740-ae1a-e699-719f-966db8876089@citrix.com>
 <8ac0ae95-f696-4b5d-0b18-e96cfc0fcc13@aggios.com>
 <e8bd7b71-743e-898c-b4bc-030833ff7b6d@arm.com>
 <e27e20c8-27ce-f67e-e2ea-19cc83e78314@citrix.com>
 <2843b8c2-a801-879a-72c3-53ad4de3b90b@arm.com>
 <35259cfc-1eea-63e8-ae5a-1d829d1b743f@citrix.com>
 <CAKPH-NjH60sQsw56ox_XG1d_TTfdQtCo9rVzY5mHrpKakkv0LQ@mail.gmail.com>
 <a9136b32-cf4a-9104-3f33-7261aec7d744@arm.com>
 <CAKPH-NjivCuZ0Wse_CKvC-OeGrg6unD17vQAn+Y=riVDpnEMrw@mail.gmail.com>
 <900a46da-c03d-47fe-d331-71f4e5b3d415@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5862367895462730259=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <900a46da-c03d-47fe-d331-71f4e5b3d415@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Tim Deegan <tim@xen.org>, Xen Devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5862367895462730259==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WcC3t0F/lLDoXvto7Ssq"


--=-WcC3t0F/lLDoXvto7Ssq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-11-15 at 11:38 +0000, Julien Grall wrote:
> On 11/15/18 11:10 AM, Mirela Simonovic wrote:
> I don't think we are discussing the same thing. The discussion was=20
> around other vCPUs, not the vCPU calling SYSTEM_SUSPEND.
>=20
> Most likely in the future, we would want to allow the toolstack to=20
> request resuming the domain. This can be considered as an event.
>=20
> > Given the assumption, my understanding is that Xen itself will not
> > unblock vCPU, except due to an interrupt targeted to the guest.
> > Am I missing something? An example would be appreciated.
>=20
> At least on Arm, the current semantics of vcpu_block/vcpu_unblock is
> to=20
> block until you receive an events.
>=20
> I don't much want to restrict the definition of events to only=20
> interrupts.  To clarify my point, if you want to wake-up for any
> events=20
> then fine.=20
>
So, I certainly lack deep knowledge of PSCI, as well as other aspects
of how this suspend/resume logic will work, but just to clarify on
this.

vcpu_unblock() may indeed be called from a number of places, but it
actually wakes-up the vcpu _iff_ the vcpu is runnable. If it is not
--e.g., because pause_count is not zero, or any vcpu or domain
pause_flags are set-- the vcpu stays blocked (check the implementation
of vcpu_wake() and of vcpu_runnable()).

So, it looks to me that what you want is to be sure that when an event
arrives, but the vcpus need to remain suspended, vcpu_runnable()
returns false for them. OTOH, when the events that you want to wake
them up arrives, you want it to return true.

Whether that is better done by using pause_count (plus some other flag,
as Stefano is saying) or with either an existing or new vcpu or domain
pause flag, I don't know, but it looks like it could work to me.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-WcC3t0F/lLDoXvto7Ssq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvQDkACgkQFkJ4iaW4
c+4Q1w/+NiQcRriMEn3O3EwKcgq8W4n8P9KHTAuBff4a9f/rnbvU8B2ZC2JFMWTu
Tg3nq29B4VuVT3IxoUQAkcoayNB6Jngdefz3t/jPw/vnw0y03IwV6YvHjtrRDosC
4xxRAK02ge0fRJ7tabeDTbq4Z20NdWDDx4+PoY/CwhZPmx83mK0KM97o24RmxW+9
HNWiWhxZkBvnaBXkISBiVO01oduAdvFdr3nvB79i8hD662BdWd7W12F/oVPV6t9B
MFIcXObrMMfKJuHzPotRxHBfwTU4HT2MqdRLRRSf3JHg4snPhCzUFP8ybZYJd1+b
lXBamMKCCf4qiiEwodib74AiM43xoQ6V4havGLvpz0X/qO2jfgvwNlIlquNW9Fz0
Y+7e77rA/pbrnn5zoP5La4yUA5TZnRYKkkMWNmZeYvHroW1qOK+WcYLuXhL392aI
fQcDFoIT+WdR7LPsh5gRWphOD902OUgvxJI1nLI7HyqnWLwRcrDGZeYDAIBcrCVZ
Vg1nJFGESZQ884fId+2Y8IRXKS8rIRu0mg7Slcr2s7924pHPUBj0mXfBdZezJ4u2
K2pFc4QHy93oA8xlBMHEGYmNOkDH13yBwvBrXtMBWA8Nz+wHay2N+BTDLfYPq7wS
lPeWkf1KCiOlT1EICZPttWfEd3K6+aoJyioadwKy7Yny5zot7sA=
=X2i0
-----END PGP SIGNATURE-----

--=-WcC3t0F/lLDoXvto7Ssq--



--===============5862367895462730259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5862367895462730259==--
