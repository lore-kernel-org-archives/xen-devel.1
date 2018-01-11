From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/credit2: Drop unnecessary bit test
Date: Thu, 11 Jan 2018 18:26:49 +0100
Message-ID: <1515691609.30117.59.camel@suse.com>
References: <1515689305-29482-1-git-send-email-andrew.cooper3@citrix.com>
 <e5b93c38-5e8a-3fa1-ee6f-b49ebe45ba1d@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1381554927343607666=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e5b93c38-5e8a-3fa1-ee6f-b49ebe45ba1d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============1381554927343607666==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-JsllWdh2PJCGO19gzPtx"


--=-JsllWdh2PJCGO19gzPtx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-11 at 16:50 +0000, George Dunlap wrote:
> On 01/11/2018 04:48 PM, Andrew Cooper wrote:
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: George Dunlap <george.dunlap@eu.citrix.com>
> > CC: Dario Faggioli <dfaggioli@suse.com>
> >=20
> > Notices by chance while inspecting the disassembly delta for
> > "x86/bitops:
> > Introduce variable/constant pairs for __{set,clear,change}_bit()"
> > ---
> >  xen/common/sched_credit2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/xen/common/sched_credit2.c
> > b/xen/common/sched_credit2.c
> > index 18f39ca..ee9768e 100644
> > --- a/xen/common/sched_credit2.c
> > +++ b/xen/common/sched_credit2.c
> > @@ -2063,7 +2063,7 @@ csched2_vcpu_sleep(const struct scheduler
> > *ops, struct vcpu *vc)
> >          update_load(ops, svc->rqd, svc, -1, NOW());
> >          runq_remove(svc);
> >      }
> > -    else if ( svc->flags & CSFLAG_delayed_runq_add )
> > +    else
> >          __clear_bit(__CSFLAG_delayed_runq_add, &svc->flags);
>=20
> There was a reason for this at some point, I'm sure. =20
>
Adding Juergen, as commit e8abdea48a ("use masking operation instead of
test_bit for CSFLAG bits") is his.

> Did this used to
> be the atomic version (without the __) originally?
>=20
At the beginning, yes. In fact, if you look at how the code was before
Juergen's patch:

    else if ( test_bit(__CSFLAG_delayed_runq_add, &svc->flags) )
         clear_bit(__CSFLAG_delayed_runq_add, &svc->flags);

Which indeed was overkill. That patch got rid of test_bit(), but did
not touch clear_bit().

I then turned the clear_bit() in __clear_bit() in commit 222234f2ad
("xen: credit2: use non-atomic cpumask and bit operations") but kept
the test.

=46rom a code readability perspective, I like this patch (and have
thought about doing this myself many times). From a performance
perspective, the test may make sense. In fact, we do a technically
unnecessary "load", but that may avoid having to pay the price of a
"store".

I guess it's debatable whether that is worth or not, in general.
However, at least in this specific case, I don't think this matters too
 much, and I'd be inclined to take the patch.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-JsllWdh2PJCGO19gzPtx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpXnlkACgkQFkJ4iaW4
c+5Vrg//dCpKkIj8Ee7AdFnFyfSZXHHZxHoJFWw5pRAkF11oyRWKTait7ua9otJ9
MQzY0XeCroXq2qR5ilQm6U2n38+lHDF5Ss13T3wjr9Fq+rgQ7v4djoYF/WByYa0b
OQRLTt55VHwZpDLJjdR5hG6vYzSukaX+pAhB1u+msmIKxw+4xWeHeDmlf+8ayrrk
gbGQ9aM5HeB1j+0UaKTbqY90tm1e/830/oU7Qrr6Qz16/vM1vc9PNb6sNXiF+V1w
NtWN4Q1nW4AqHWjpj4aIptbc0/ElSU38vJURi1tMA6s79qSdThrzkCI53oRvQ/ij
1TVL3wnwfye2cMx+56fSqcT1qdX/QzVAtR5pEj/TKJ5IUYaCLepw69LHLgWXVS1l
NXU0wGJsNOu0GW83uShnawRFdn7Np0NlkewaDPbKxTb3hV/FG+EfEmmZ3brfzNUq
ImWsf6r7x/FABQz9UrBJgEDXdoAwbFNG7UFAbbw1xFwAO6ynoLhDE8t8OXSka8Ca
/X5/ylyP3rhVBelfv24zIAQwXxUD1J/xHmy0PHfq845RqpPeUGALMXdSykhKGLZQ
bkj7WsqFjyJlvG2OTX66NYo2AdoLD2ZZWlIOawir3rWD6MgBNHnGLrKqRu01+ieG
Cw/stQyGZ7dpnLKwoalIp5lijU16xiffQG2R3XptOnkrNBNSid4=
=nrLV
-----END PGP SIGNATURE-----

--=-JsllWdh2PJCGO19gzPtx--



--===============1381554927343607666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1381554927343607666==--
