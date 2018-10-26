From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 16:17:39 +0200
Message-ID: <c52bb2c11ff84f0fbc18802dffd0629a36adcb3a.camel@suse.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
 <7079d0ee-a8ef-e164-12d9-8e3bfef81491@citrix.com>
 <03e84c44-2c33-b00f-bdfc-3c6b57123bfb@citrix.com>
 <CABfawhn6Cdv7HK6pbzEj-013wXwouOuzpOpiw5L-_WV=F4e0Bw@mail.gmail.com>
 <f1e40a27-c0c4-c3bd-eb43-1fb314ec20ac@citrix.com>
 <CABfawhnbPfqeXM01=9_55dOzYAkgEcPk4+YqieN-Ab_3OA=v0Q@mail.gmail.com>
 <5c251189-cfb7-a36a-5a33-fd661771c9c0@citrix.com>
 <CABfawhkkwkC3itQMuqVX1aHSD8ysYCckUi0URVy5kQfZFtjugA@mail.gmail.com>
 <7b2ff44127f10b0d01e8ed8865c71206c1a8f2f4.camel@suse.com>
 <CABfawhnC-BLRnRQ9Rx9Jgt+runtA4JX-MyF7akcjhU9iGHx8gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1935441092210627949=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhnC-BLRnRQ9Rx9Jgt+runtA4JX-MyF7akcjhU9iGHx8gA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: mpohlack@amazon.de, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, joao.m.martins@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, aliguori@amazon.com, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, ross.philipson@oracle.com, George Dunlap <george.dunlap@citrix.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, mdontu <mdontu@bitdefender.com>, dwmw@amazon.co.uk, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1935441092210627949==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7p/B3VS04RXAMDIUN4/K"


--=-7p/B3VS04RXAMDIUN4/K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-26 at 06:01 -0600, Tamas K Lengyel wrote:
> On Fri, Oct 26, 2018, 1:49 AM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > I haven't done this kind of benchmark yet, but I'd say that, if
> > every
> > vCPU of every domain is doing 100% CPU intensive work, core-
> > scheduling
> > isn't going to make much difference, or help you much, as compared
> > to
> > regular scheduling with hyperthreading enabled.
>=20
> Understood, we actually went into the this with the assumption that
> in such cases core-scheduling would underperform plain credit1.=20
>
Which may actually happen. Or it might improve things a little, because
there are higher chances that a core only has 1 thread busy. But then
we're not really benchmarking core-scheduling vs. plain-scheduling,
we're benchmarking a side-effect of core-scheduling, which is not
equally interesting.

> The idea was to measure the worst case with plain scheduling and with
> core-scheduling to be able to see the difference clearly between the
> two.
>=20
For the sake of benchmarking core-scheduling solutions, we should put
ourself in a position where what we measure is actually its own impact,
and I don't think this very workload put us there.

Then, of course, if this workload is relevant to you, you indeed have
the right and should benchmark and evaluate it, and we're always
interested in hearing what you find out. :-)

> > Actual numbers may vary depending on whether VMs have odd or even
> > number of vCPUs but, e.g., on hardware with 2 threads per core, and
> > using VMs with at least 2 vCPUs each, the _perfect_ implementation
> > of
> > core-scheduling would still manage to keep all the *threads* busy,
> > which is --as far as our speculations currently go-- what is
> > causing
> > the performance degradation you're seeing.
> >=20
> > So, again, if it is confirmed that this workload of yours is a
> > particularly bad one for SMT, then you are just better off
> > disabling
> > hyperthreading. And, no, I don't think such a situation is common
> > enough to say "let's disable for everyone by default".
>=20
> I wasn't asking to make it the default in Xen but if we make it the
> default for our deployment where such workloads are entirely
> possible, would that be reasonable.=20
>
It all comes to how common a situation where you have a massively
oversubscribed system, with a fully CPU-bound workload, for significant
chunks of time.

As said in a previous email, I think that, if this is common enough,
and it is not something just transient, you'll are in trouble anyway.
And if it's not causing you/your customers troubles already, it might
not be that common, and hence it wouldn't be necessary/wise to disable
SMT.

But of course, you know your workload, and your requirements, much more
than me. If this kind of load really is what you experience, or what
you want to target, then yes, apparently disabling SMT is your best way
to go.

> If there are
> tests that I can run which are the "best case" for hyperthreading, I
> would like to repeat those tests to see where we are.
>=20
If we come up with a good enough synthetic benchmark, I'll let you
know.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-7p/B3VS04RXAMDIUN4/K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvTIgUACgkQFkJ4iaW4
c+6UGw//bblL6r40Gz6h8jo6bihB7iNQc0Ps+qmDq8ijOLqYPG07cMVpKS+6gjOo
bz12rPrRCFnczYcb8rztI3K6D/7oaLsGTqNIu+OKoe4CzzFCfp7pKvTY4Dvt/Dza
xvF/q8iHGqm8++lEeWGeVaRyHmK6CVbYwce7MOcRm7486G8LTQZQFHJ1FmTXe2d8
uLu/2sNHDPxuqVAokJwo/QC5Ti3I/oDaODCOvRP7FcFSvRB0262+xUp01JOV6BFE
R7fwQxlQQhyli3izvrIDHyn4nHl62TXzwM73nq6+Hs0troAbOP4kxm2yGbgf+vRq
9EvMChCx0Avzp+jpiPpBpflxgZdbq6vBdQ6b4YrKotluaMALFdSp8P2ZBmQrg23o
He63GIyqcHdqioKIc8SWMkE/v3RuAkVx91QAvHeY7oTPixq87RxNAcYeJhD1+jth
oR6PO9e4N3P63o1cnkVlGjXw2aiMPdYH86LcMB13fDuwrhC3ZvvMzPM3V3uIuThJ
MfcyuKkDdPt8Lmxzf/a6wbNdt0FtZUYeSldGuOx+d+qSvVMcE/j/sz8oVIyhhEbw
PD8FQ6I3ueePEe7o69SohXD7VFn70zzY7uK7GYxp1TWZxbzIIE4hijzatV8cnkoo
0Lu5rQHeL53EcezNfxcK+Mo3vgeFtua4w3A0SgBs4y9/R6zkYB4=
=R3E7
-----END PGP SIGNATURE-----

--=-7p/B3VS04RXAMDIUN4/K--



--===============1935441092210627949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1935441092210627949==--
