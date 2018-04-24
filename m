From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/1] xen: credit2: rb-tree for runqueues
Date: Tue, 24 Apr 2018 13:03:05 +0200
Message-ID: <ece8046e96f9e29368050085af2219d78f6b43b7.camel@suse.com>
References: <20180403165505.8441-1-kpraveen.lkml@gmail.com>
 <20180403165505.8441-2-kpraveen.lkml@gmail.com>
 <e70b5f0797a7636de199e61290f6d769d88d2b63.camel@suse.com>
 <69cb790c-1533-d9fa-07d8-32d589d8d303@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5025112318729236616=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <69cb790c-1533-d9fa-07d8-32d589d8d303@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>, xen-devel@lists.xen.org
Cc: george.dunlap@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org


--===============5025112318729236616==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ydfkLWkaaeT+6lNXPUm3"


--=-ydfkLWkaaeT+6lNXPUm3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-24 at 14:30 +0530, Praveen Kumar wrote:
> Hi Dario,
>=20
Hi!

> On Tuesday 17 April 2018 04:16 PM, Dario Faggioli wrote:
> > On Tue, 2018-04-03 at 22:25 +0530, Praveen Kumar wrote:
> > >=20
> > > +        if ( svc->credit < entry->credit )
> > > +            node =3D &parent->rb_left;
> > > +        else
> > > +            node =3D &parent->rb_right;
> > > +
> > > +        (*pos)++;
> > > +    }
> > > +    rb_link_node(&svc->runq_elem, parent, node);
> > > +    rb_insert_color(&svc->runq_elem, root);
> > > +}
> > >=20
> > Wait, where's the part where we cache which element is the one with
> > the
> > highest credits? (And the same applies to the tree-removal
> > function, of
> > course.)
> >=20
> > In fact, we need a field for storing such a cache in the runqueue
> > data
> > structure as well, and we need to keep it updated.
>=20
> I thought of caching the left most node as done in rb_tree, but I=20
> thought of taking an easy way to have things working and delaying
> the=20
> Linux rb_tree caching variant to be ported in next patch or so.
>
That is fine, as soon as the fact that you are not doing it right now,
but planning to do it in another patch is stated somewhere (e.g., cover
letter or a changelog).

> > I would suggest we do not try to use the rb_*_cached() functions,
> > and
> > cache rightmost explicitly in runqueue_data.
>=20
> Ok, that sounds better, I will introduce an entry for rightmost
> element=20
> to be cached in runqueue_data
> Also, lets port the Linux rb_tree cache variant as well ( probably
> in=20
> future we may use that ).
>
I'm not sure about this last part. I mean, I can see other uses of rb-
trees, TBH, and ones where such caching would be useful. Still, I'll do
the port when we actually decide to use the new functionallity (or
when, e.g., we run into issues retro-fitting a Linux fix, etc).

> > Err... is it? Isn't the leftmost element the one with the _least_
> > credits? It looks to me that we want rb_last().
> >=20
> > And IAC, we don't want to have to traverse the tree to get the
> > runnable
> > vcpu with the highest credit, we want it available in O(1) time.
> >=20
> > That's why we want to cache it.
>=20
> Yes, it looks like an error. Will update the patch in v2.
>
Right. So, I think the main problem with this patch was this one, i.e.,
the fact that the runqueue was sorted in the wrong order.

Then there is the lack of caching, for O(1) access to the head of the
runqueue itself. As said, it is ok for that to come in its own patch of
this series. It is also ok if this comes as a later patch, as soon as
that is clearly stated.

> Sure, let me have 3 series, first; Linux porting , second; rb_tree=20
> changes which doesn't have caching and third; have rightmost node
> cached.
>=20
I'd actually skip doing the porting right now... Although, in this
case, it's not really my call, and others may have different a opinion.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-ydfkLWkaaeT+6lNXPUm3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrfDugACgkQFkJ4iaW4
c+645Q/+P0WZTZ4I5T09KklKOY82iA2bm8oRk0V0geUlC2gBgiMPAh9lNMPHrjOo
Xy9P+xTHHlHcMhdseLCp8kjswmaXA00Y7VQCkIRq/zcxuQab2+GYZGcaFqX87Fig
+bYzZxoKedJr805m5VnRfBn9C8LyUKS0qYbL56uq6/wrWnnqZoHcJBJsyox82yb8
uTO89flfLMxiYnQ6uDbOsF1l5gbccH+7luxsP7jYC33r82jn9jGDKn967sgKYkm9
MUlA/5HfAKPCURtqHD8DBari6NF5JQTUPLyvZ9EUd0wbsbbvz8EWBWp4nHVFb8jS
jyvCi/fHlUOSSnBctf68Gtc7yycK5ugd4GphHKbCf7waKzP80zkILl8Eqwb2bc/N
4a6+Z1H7NXGJZnogZksYLVANFLo7xUjGkOHMEQDaPRoBcJFG1hEnPl7mcKRum/OV
6nY65vg6wB7brOgh871QEfbhqgeAmk7cWup1EmIdpGsL8V39EgANk4jYaw2vj0ri
2ucRlmeX/ovR/w2bNfVFM76PtNRHnV5hn0Nd9RXboKCoxukiN9P+QTrs5j72ibM6
mkdZMrIVEoYOaIoF16bpiQAwhZca/Iso0szJfAV6nT9b45RUPhybjRZjY1tKypVQ
k18i1Zkz4Bfs3LLQ44+tT2WCe5FRqkNBnGfTtRzp7FywIAp7KMQ=
=Znbh
-----END PGP SIGNATURE-----

--=-ydfkLWkaaeT+6lNXPUm3--



--===============5025112318729236616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5025112318729236616==--
