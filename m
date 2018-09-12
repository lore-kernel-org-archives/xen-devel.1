From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: BUG: sched=credit2 crashes system when using
 cpupools
Date: Wed, 12 Sep 2018 17:11:20 +0200
Message-ID: <9d3beeffa3ed724f751dc190b3de4d34a22f1ea3.camel@suse.com>
References: <6564259.GaOmOO5kt2@wopr.lan.crc.id.au>
 <29fc38c6-8908-2f6f-e496-a1644f56c59e@suse.com>
 <4e93ef83fb40d6a2a87f902f17bc0bc5@crc.id.au>
 <5B87ABF502000078001E36A3@prv1-mh.provo.novell.com>
 <faf61a4a900b3404de8077357e898159@crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1752591104606074789=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g06oI-0001ie-Q7
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 15:12:06 +0000
In-Reply-To: <faf61a4a900b3404de8077357e898159@crc.id.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============1752591104606074789==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-jWbrt5rPvnh8+z+y3S98"


--=-jWbrt5rPvnh8+z+y3S98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-08-30 at 18:49 +1000, Steven Haigh wrote:
> On 2018-08-30 18:33, Jan Beulich wrote:
> > > > >=20
> > Anyway - as J=C3=BCrgen says, something for the scheduler
> > maintainers to look into.
>=20
Ok, I'm back.

> Yep - I just want to confirm that we tested this in BOTH NUMA=20
> configurations - and credit2 crashed on both.
>=20
> I switched back to sched=3Dcredit, and it seems to work as expected:
> # xl cpupool-list
> Name               CPUs   Sched     Active   Domain count
> Pool-node0          12    credit       y          3
> Pool-node1          12    credit       y          0
>=20
Wait, in a previous message, you said: "A machine where we could get
this working every time shows". Doesn't that mean creating a separate
pool for node 1 works with both Credit and Credit2, if the node has
memory?

I mean, trying to clarifying, my understanding is that you have to
systems:

system A: node 1 has *no* memory
system B: both node 0 and node 1 have memory

Creating a Credit pool with pcpus from node 1 always work on both
systems.

OTOH, when you try to create a Credit2 pool with pcpus from node 1,
does it always crash on both systems, or does it work on system B and
crashes on system A ?

I do have a NUMA box with RAM in both nodes (so similar to system B).
Last time I checked, what you're trying to do worked there, pretty much
with any scheduler combination, but I'll recheck.

I don't have a box similar to system A. I'll try to remove some of the
RAM from that NUMA box, and check what happens.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-jWbrt5rPvnh8+z+y3S98
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluZLJkACgkQFkJ4iaW4
c+5bRg/+KNcyPcV0qB7RZsm/juqTmcs6KJKOoZHKmtidZ+YTmWf/AuYRkZeP2PSW
b+QhxStK0YYcY31irmIT5H+q58lwUqsXV2+FT7vK/jhnWJoY+pcXj7hBRvxHkfNr
fnAYs+BARC+BGEJSDETS3zLhwVaWasg8p7OhDeNl3Sl5jkkoRFkqyDNyx9czWMKd
F3KRzTUiVq2B2SUVgzKuCd9b7SXdLl9VK2PwdwYZXdrHv+QgQ6MNWYGPqJ+ZImGk
PgbGZUtiEfjSH3TjQbZllGYdMOzmwj1i8YUZ5CFL+3X6Azdv+bCgpOxErW1U6iWz
yLlZ7J9kxG0K9MbtOeAQRz+An83kIeyeBUFRFyLmnQEBjvyRA0IZ7LUL1EZFxvMF
T1AZs05+jQl9blWSNVQZmFR2ArumnQ0b215jztZ7+J2bi3C4auC4Y4sHhdIW69xF
TC7pA1+0a0rRpsSPAig5rYQDImiXneiJp4Wbf13tAAGkxzKnDK98tx4VFJucKmD7
O6w6B4Hg03u1wh40WiOWRXsFZz6Idkko7ydXJCF5suTuWh0BWdVoHP7GNlrsqwji
rMMqNWgvBi7Gb0JaNLXPyRVMxGdvezwGeUFv1tXDHSX6FxLRJoikaTHfmJqh8zm5
Q7jHfY1gi+ALxRwQvVUla+Z4iJTG4whXMpxYUT8Ov+JlxOw6rhE=
=Bvfu
-----END PGP SIGNATURE-----

--=-jWbrt5rPvnh8+z+y3S98--



--===============1752591104606074789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1752591104606074789==--
