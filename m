From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Thu, 12 Apr 2018 17:38:31 +0200
Message-ID: <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0736038929550906866=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============0736038929550906866==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T7lpa0/JQoYUbmudzot1"


--=-T7lpa0/JQoYUbmudzot1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-04-12 at 15:15 +0200, Dario Faggioli wrote:
> On Thu, 2018-04-12 at 14:45 +0200, Olaf Hering wrote:
> >=20
> > dies after the first iteration.
> >=20
> >         BUG_ON(!test_bit(_VPF_migrating, &prev->pause_flags));
> >=20
>=20
Update. I replaced this:

+        BUG_ON(vcpu_runnable(prev));
+        BUG_ON(!test_bit(_VPF_migrating, &prev->pause_flags));

with this, in the patch:

+        if (vcpu_runnable(prev) || !test_bit(_VPF_migrating, &prev->pause_=
flags))
+            printk("d%uv%d runnbl=3D%d proc=3D%d pf=3D%lu\n", prev->domain=
->domain_id, prev->vcpu_id,
+                   vcpu_runnable(prev), prev->processor, prev->pause_flags=
);
+        BUG_ON(!test_bit(_VPF_migrating, &prev->pause_flags));

Output is:

(XEN) d10v0 runnbl=3D1 proc=3D31 pf=3D0
(XEN) Xen BUG at schedule.c:1572

On CPU 16.

It is still the BUG_ON(!test_bit(VPF_migrating)) which is triggering (I
actually meant to get rid of that as well, but I forgot.)

So, it looks like before, we did not hit BUG_ON(vcpu_runnable(prev)),
while in this run, vcpu_runnable(prev) is 1. I mean, I know it's a
race, but... wow...

We are in here because VPF_migrating was set, but it must be getting
cleared, concurrently with us, at about this time.

We are on CPU 16, inside context_saved(), and our 'prev' is d10v0. This
means its 'processor' should still be 16. But it's 31, so someone has
changed it already. I'm assuming it has been the vcpu_migrate() from
vcpu_set_affinity(). And this could very well be fine, but then, why we
also, when inside vcpu_migrate(), find VPF_migrating set?

I'll add more debugging to check if the vcpu is in a runqueue...

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-T7lpa0/JQoYUbmudzot1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrPfXcACgkQFkJ4iaW4
c+7SPRAAwTYdKlk+U1J3KPH9fKwEOu9epafS8gyBHFe05OKIz6j6gT1zOGxKY2bq
rP5pNDh2VbLCLvcsbzJ75/zQjZQ6SyQWTDqHC6Cyf2VdRHV8VljVXjHhaqPmW688
jXDhJ0NaRB6rjrKfP0sVFwSS8eOrHKSXSgqnjKSRxMwixfLgbnF5KTtT0pds9nOU
S0Fh5ZUy/bSleREDIeJwlfQCxR1D/hBhX8LnFet8AYLF6bS3kfxPIhpNhK0aMzmv
IVeCAWgTgfXteGHHhlW9Kv4fSYrOLKeYDD54cKkV0FKHyxi9Fb5jRgbLUoBhLyw+
5oRvJDOvGYwtphkhzczbHSHPTZxvmDUu7YSTuDjgG72DoKS1ySViaMOOF+zOU3ff
cBZcmSX2ctWrhSBb7FX88jY1krVfiUUk3hwwwk3Lw4OXa6iZ2Z9k2Z3b8JwVv81Q
cpp2Nk+K+AbLl4VuaCvbpgKLK/Uk1nOV1kd/fCGhfVsQDzapFj1KTGtpy8I9NOrb
u0qyByKh27JdD/UE9Wah7ul+nM7pXaNdXcFs/5w5ETr2vnYprhIrSV88SfCHsEEu
wXuSute1TyiDw9GYhFqeC1+pwa9TNAKuYIp5A+VxDgJed9lYp//+5fn+6BK+Q2XW
Fi1vzwRmskYG1b6zxC0eZ07UY4wYEstWwVsKJLfMBreOtHEbQsw=
=w/fW
-----END PGP SIGNATURE-----

--=-T7lpa0/JQoYUbmudzot1--



--===============0736038929550906866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0736038929550906866==--
