From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v2 1/2] xen: credit2: rb-tree for
 runqueues
Date: Thu, 24 Jan 2019 10:41:34 +0100
Message-ID: <9ad6f06d8f03f5fcafeb39c02121e6c86cbb6ca8.camel@suse.com>
References: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
 <20181223142134.7857-2-kpraveen.lkml@gmail.com>
 <1a25c901ffbf70d3f798395efc3e44a3e0a33075.camel@suse.com>
 <CABcWhv5iR=2-DGhar7td_CLyNQWJXcEpRzVp6=_+HqU0qvNLzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4517569796325490656=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Bqw=QA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gmbVd-0003Ac-3y
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 09:41:17 +0000
In-Reply-To: <CABcWhv5iR=2-DGhar7td_CLyNQWJXcEpRzVp6=_+HqU0qvNLzQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============4517569796325490656==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wLZt+B+UrDIbKolNclhY"


--=-wLZt+B+UrDIbKolNclhY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-01-23 at 23:00 +0530, Praveen Kumar wrote:
> Hi Dario,
>
Hi,

> Thanks for your comments.
>=20
So, two things. Can you please not top post? :-)

Also, trim the quotes, which means, when quoting while replying, which
is the good thing to do, remove the stuff that are not necessary for
understanding what you are replying to.

This avoids people having to scroll down for pages and pages, before
finding what you wrote. Even worse, lack of trimming, especially if
combined with top posting, like in this email, may make people think
that there's no other content in your mail, besides the top-posted
one! :-O

For instance, the first time I opened this message of yours, I thought
like that and did not scrolled down. It was only on second thoughts
that I came back and went double checking. :-)

Trying to make all the above clear, what I mean is do like this:

> On Fri, Jan 18, 2019 at 8:38 PM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> > On Sun, 2018-12-23 at 19:51 +0530, Praveen Kumar wrote:
> > > --- a/xen/common/sched_credit2.c
> > > +++ b/xen/common/sched_credit2.c
> > >=20
> > > @@ -3762,8 +3784,8 @@ csched2_dump(const struct scheduler *ops)
> > >              dump_pcpu(ops, j);
> > >=20
> > >          printk("RUNQ:\n");
> > > -        list_for_each( iter, runq )
> > > -        {
> > > +
> > > +        for (iter =3D rb_last(runq); iter !=3D NULL; iter =3D
> > > rb_prev(iter)) {
> > >              struct csched2_vcpu *svc =3D runq_elem(iter);
> > >=20
> > >              if ( svc )
> > >=20
> > Ok, this makes sense. Have you verified that the runqueue is
> > printed in
> > credits order in the dump?
> >=20
>=20
> Yes, I have dumped this using 'xl debug-keys r'
>=20
> dmesg output :
> ...
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D549728084734
> (XEN) Online Cpus: 0-3
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-3
> (XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Active queues: 1
> (XEN) default-weight     =3D 256
> (XEN) Runqueue 0:
> (XEN) ncpus              =3D 4
> (XEN) cpus               =3D 0-3
> (XEN) max_weight         =3D 256
> (XEN) pick_bias          =3D 1
> (XEN) instload           =3D 1
> (XEN) aveload            =3D 10002 (~3%)
> (XEN) idlers: 7
> (XEN) tickled: 0
> (XEN) fully idle cores: 7
> (XEN) Domain info:
> (XEN) Domain: 0 w 256 c 0 v 4
> (XEN)   1: [0.0] flags=3D2 cpu=3D3 credit=3D9803083 [w=3D256] load=3D517 =
(~0%)
> (XEN)   2: [0.1] flags=3D0 cpu=3D1 credit=3D10404026 [w=3D256] load=3D239=
 (~0%)
> (XEN)   3: [0.2] flags=3D0 cpu=3D0 credit=3D10369899 [w=3D256] load=3D219=
3
> (~0%)
> (XEN)   4: [0.3] flags=3D0 cpu=3D2 credit=3D10500000 [w=3D256] load=3D135=
4
> (~0%)
> (XEN) Runqueue 0:
> (XEN) CPU[00] runq=3D0, sibling=3D1, core=3Df
> (XEN) CPU[01] runq=3D0, sibling=3D2, core=3Df
> (XEN) CPU[02] runq=3D0, sibling=3D4, core=3Df
> (XEN) CPU[03] runq=3D0, sibling=3D8, core=3Df
> (XEN) run: [0.0] flags=3D2 cpu=3D3 credit=3D9803083 [w=3D256] load=3D517 =
(~0%)
> (XEN) RUNQ:
>=20
Well, ok, but in this case there's no vcpu sitting in the runqueue. So,
we can't really see whether the runqueue is actually kept in the proper
order.

Not that a test like this is too valuable and, now that I think more
about this, it's probably worth putting some ASSERT()-s in the code to
properly make sure of that... but still, it's something.

In order to actually have and see vcpus within the scheduler runqueues,
you can start a lot of domains --at least enough for having more vcpus
than pcpus-- and run some synthetic workload (like `yes') inside them,
so their vcpu will be busy.

Playing with pinning and cpupools can also help.

In the end, what you want is to have something printed after that:

 (XEN) RUNQ:

marker, in the dump.

> Will send the updated patch soon. Thanks.
>=20
Cool, thanks. :-)
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-wLZt+B+UrDIbKolNclhY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxJiFAACgkQFkJ4iaW4
c+7QGBAAkJp8Bl4wPw3PlLSg+76RBkmoyXDSFSfa/SiQMxg7vpnjsx247j1X0eTT
sl4TekJHAnskf4oR53pnW4gWF91aYiEyCsYaxlpVpkEDk9T8M06/JUErHWt+Yw+/
vuK470Zt/oWG3q/+ft2LbOlyPXxOcy9zj3qIcx31aFl9fWTB6tv5K8QIEf8klwj4
iucT9yAKmPLotBbM9HO81mm1FthY2op3nz+e/RyQ5KWfOlbGHksBB1hbw/Oqi448
3iDcuB9v+wMiErwkqCJPQl3u5oE6ax3MiSnJSPeKY3RfXh8PXCz6KbwVFmHiN8Ak
siRnwNkoBSh9CvcPmYQBGkR4nuDrssV6670Mblo7PsPxlBWJt0Q4ikoWIn2vCUQy
OwejVdWYfsbQGWMCALC1eicPgrUXdvjkkSc1+hlHuJrAGNy9Pntsld6oHyIvzca1
ddciQE7h40DauQMc+oos7Zrakfh6tk0KuGqB88rMK0gC86csTusxKJ+bbZ3uJJof
1oZTKP+iu5B6y+TUX/agVKnYNlTuirhNXhgw8C3Mu7NmMQZovkSr7mE+JcIjfvPL
fzksUuYXnDHMKFonKG+W746KzUJ4XYG2AKixwkBmdy5OqpIuQJa32rQiYMdlJyEJ
tXrMJrU2Fh3vND6kLqIV72bMdQ9AuCgC4gthRui1LvQ3CcOGJmA=
=oinZ
-----END PGP SIGNATURE-----

--=-wLZt+B+UrDIbKolNclhY--



--===============4517569796325490656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4517569796325490656==--
