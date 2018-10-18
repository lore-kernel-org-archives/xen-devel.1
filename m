From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Thu, 18 Oct 2018 12:40:03 +0200
Message-ID: <1512088641b882784424092b7d1c55d9ccd217a0.camel@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <7553b02f-514d-d577-a4ae-3478036f8f62@suse.com>
 <3636eba03691a0331a6e82cb11a651fd41c475ec.camel@suse.com>
 <6ffe5f58-8aec-c349-e08b-58dc1d3d5469@suse.com>
 <8224a31a6fd968344499b52e4bc77d78576c1a8e.camel@suse.com>
 <60e809eb-1971-b467-9a56-c116c60445b2@suse.com>
 <d6956fbf7441ae3ced4a273c58b7126db1c6466c.camel@suse.com>
 <ade01660-a6c1-340c-34e7-0d9e0b2ff51f@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2031636110289633940=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzov=m6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gD5it-0007QB-E6
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 10:40:11 +0000
In-Reply-To: <ade01660-a6c1-340c-34e7-0d9e0b2ff51f@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Bhavesh Davda <bhavesh.davda@oracle.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============2031636110289633940==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-y8i77qS9UCEQVnhDOgjY"


--=-y8i77qS9UCEQVnhDOgjY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-12 at 11:23 +0200, Juergen Gross wrote:
> On 12/10/2018 11:15, Dario Faggioli wrote:
> >=20
> > But, anyway, if I'm in sched_dario.c, and schedule.c makes me
> > reason in
> > terms of vCores, how do I deal with single CPUs for a particular
> > cpupool that does not want core-scheduling?
>=20
> sched_dario.c would only know of scheduling entities. Mapping of
> vcpus
> to scheduling entities is part of the infrastructure.
>=20
> schedule.c would receive vcpu state changes. In case such a vcpu
> state change leads to a scheduling entity state change the related
> scheduler is informed about that to be able to react.
>=20
> In case the scheduling entity is a thread (no core scheduling) each
> vcpu state change will result in a scheduling entity state change,
> so it will be as today.
>=20
I think I'm starting to understand more your idea, although not
completely (or at least, I think I understand it completely, but I
still can't make up, in my mind, a fully complete picture of how the
code will look, and of how it will work).

I think I still see reasons why something like group-scheduling belongs
in sched_dario.c, rather than in schedule.c, but that may partly be
because I've been working on doing it in _that_way_ for some time, and
my brain is wrapped around such design. :-)

IAC, this really continues to look to me like a major rework of (not
only, probably) scheduling code. This, of course, does not mean this is
not worth doing, not per-se, at least. And although, as I said, I still
have some doubts, it is certainly possible that they'll be proven=20
wrong by continuing the discussion, or by writing/seeing a prototype.

A little bit more on the practical side, there are patches out there
that let us achieve the goal, the Credit2 one being in the "not too
bad" state (at least IMO, and I'd be happy to have feedback on that).
In fact, with some effort, the Credit2 series could even be 4.12
material. I don't think the same would be true for the rework (and I'm
talking both in general, and considering my current situation, assuming
it would be me doing this --which is not necessarily the case, of
course :-D ).

So, basically, the way I personally see it more likely for us to get
core-scheduling not too far away in time, is by means of an approach
that does not require rewriting, and testing, and benchmarking (because
it's scheduling, look at what the process has been/is being to switch
to Credit2!) large portions of the scheduler.

And then maybe we can focus on how to make core-scheduling useful and
effective in really mitigating things like TLBLeed (via more topology
awareness in both guest and Xen) and L1TF (by the doing "panopticon"
[1] and/or truly synch'd context switches).

Others? Thoughts?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-y8i77qS9UCEQVnhDOgjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvIYwMACgkQFkJ4iaW4
c+6Qiw//QxzooPt4bRoQqZ+I85EvMIdyCb9iNCodHCYYu1DnrCRlObqmlNUmk6Iq
YCbh//hUosOWPEGf65dMZ+8NJxSFhnOGyVOhu5eCIEgl3nsnl8vm3LpBsczBKne5
2+xs5jKLxAfSQl4hohVaP2iH+vAjA8A845tY0yCivqukciJAfBoTxOJbWIm1BMR3
IOfKUq4DKPfag9z/nFGWwsIh+XYphrWUxrWoc36hxvamnQpQfl0uohzbZcKQsHlQ
tUNYXCIYMCvs6XUHn0k1NvRLXmrVDGn34M19wAPUlDg0cE4yWR3eQk/rAaLLbB22
ZWunabTBDJmbzmB94Pc52tQKXm+314809WRJxz/s/dZ31WeU5G9puKF7PvqmOjFY
kJ9g6T0Gub6CweM/Ykd9785kicF+7jKqQLRZgcmLKZSg/OXMtIgYwEQTcwVQuH6A
3UGBfJ+8w9vpGTVTVHvBTMGOBnhtJeW+yKDHurT6dC8Dkp3bW2PkMZTzSZBJhM3O
YJQ5f/PQc1nD5Z75kKUil+dO8nmYBB+3y6hVl4Xy0j4jxWqIbpRAKePYo+QRmrNM
2Ielo/lTl0U/xugf3xnDE6cMVrXsYHGO+hkMxuJUICh65a3n27xOZndDd38Orc+w
tgMdqN+va0tzP3v0wOH6Hr3Rn4TV5pMTEeT0zQHQq2cW5zIcx5I=
=nbLP
-----END PGP SIGNATURE-----

--=-y8i77qS9UCEQVnhDOgjY--



--===============2031636110289633940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2031636110289633940==--
