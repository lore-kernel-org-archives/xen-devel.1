From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 12:26:54 +0200
Message-ID: <c66ee5214347aba2a0ecdaca4a92e06acafc025d.camel@suse.com>
References: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2685971673717519079=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EcPx=TA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hLPyi-0002me-5f
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:27:12 +0000
In-Reply-To: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org


--===============2685971673717519079==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T7Pg11Z4cYJN/MKnwXoi"


--=-T7Pg11Z4cYJN/MKnwXoi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-30 at 11:13 +0200, Juergen Gross wrote:
> In xen/common/schedule.c there is a weird "#ifndef CONFIG_X86" in
> do_poll().
>=20
> It was introduced way before anyone would think about ARM by commit
> ef4c6b079cc55e (I couldn't find any xen-devel mail related to that
> commit), so I guess it is related to IA64?
>=20
I guess it must be that one.

I rolled back the tree at that commit, and went checking how set_bit()
was implemented for IA64.

Interestingly, there's a comment above clear_bit(), which says:

 * clear_bit() is atomic and may not be reordered.  However, it does
 * not contain a memory barrier, so if it is used for locking purposes,
 * you should call smp_mb__before_clear_bit() and/or smp_mb__after_clear_bi=
t()                          =20
 * in order to ensure changes are visible on other processors.

which seems to confirm what we're thinking. Memory barriers are,
however, not mentioned at all for set_bit().

It's also explicitly stated that test_and_set_bit() and
test_and_clear_bit() do act as memory barriers.

The code appears to having been taken from Linux (it's even in
xen/include/asm-ia64/linux/asm/bitops.h), so maybe some more
investigation is possible, if deemed interesting.

> Question is: can we just drop it, or does ARM depend on it? And if
> ARM
> really needs it, is it the memory barrier only? And why wouldn't a
> similar barrier be needed in vcpu_block() then?
>=20
Well, the difference between vcpu_block() and do_poll() is that the
former does just one set_bit(), while the latter does two, with an
assignment in between.

So I guess what we're trying to deal with is the case of some CPU
having seen any random combination of poll_evtchn and the bits of
pause_flags and poll_mask, on an arch that permits enough reordering.

But, yes, if what you're saying is that, on an architectures that need
a barrier after set_bit(), that's then necessary in both functions,
that makes sense to me too.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-T7Pg11Z4cYJN/MKnwXoi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzIIu4ACgkQFkJ4iaW4
c+7UYBAA636iILn5HRLZTKeyc0+IgsDSDNzC7Cxk6w7dB8EaeR0sHlj6o/p1PtL9
3KtK8FZOMZvv3kJffq/7xp7cEucCbiJZ0EMADzp8SsUhsyc+EglRezb+rnkUJYCS
byW0sp4Pa3sinBuN6XPUBvFJgMUkR5i4gh+f8ZfbQEhD9iD9V0Ke37Yhj7wpKKNY
S4m5AbgSif1PRCEDW5gnRFPL9d9jGbaBpIeJJhLk5UQl2Y3Nbv5Addm4eC5GcgZ5
CQcvSM9+LnMY14L18pUd0rkSZBk0OTYXzkjbnqlHf2tK0jCI6W+1+yHYW7Mo/sOd
FsBr5VXPTCVTrKIccAyQnyzXSCNu9Zg39xnyk7djEkYll5iyq3oGDQJpnOTVm827
bRQB9lpJ3LieMCqm33tRd5mLDFX+vJc3snddsYoBFmpC3zBzLhIPMDnerm3c7Xxq
a23wYZH2zMn2DKNpfG/oJWtA13GoTLo0yu4rsIInmC07nKMXBi7N60cw1Xu63FpX
HX8MzTDbIk/camjqFIVp+vJZj3vZJbBhBDRoMKz340Qa01o795FE7+7Wgy8NDn6k
PxJlDDl3iaIsjA2d/bCDthEns1/8f/93ORC210MHvSNio7oCHhVOIdGGyl+WRlF/
oeTavVGnt8V2/8sIQySX8Q4++pd7ORhaUsencL9Po9veeqmyooM=
=T2wa
-----END PGP SIGNATURE-----

--=-T7Pg11Z4cYJN/MKnwXoi--



--===============2685971673717519079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2685971673717519079==--
