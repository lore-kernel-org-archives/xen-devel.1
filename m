From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 09:49:15 +0200
Message-ID: <7b2ff44127f10b0d01e8ed8865c71206c1a8f2f4.camel@suse.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
 <7079d0ee-a8ef-e164-12d9-8e3bfef81491@citrix.com>
 <03e84c44-2c33-b00f-bdfc-3c6b57123bfb@citrix.com>
 <CABfawhn6Cdv7HK6pbzEj-013wXwouOuzpOpiw5L-_WV=F4e0Bw@mail.gmail.com>
 <f1e40a27-c0c4-c3bd-eb43-1fb314ec20ac@citrix.com>
 <CABfawhnbPfqeXM01=9_55dOzYAkgEcPk4+YqieN-Ab_3OA=v0Q@mail.gmail.com>
 <5c251189-cfb7-a36a-5a33-fd661771c9c0@citrix.com>
 <CABfawhkkwkC3itQMuqVX1aHSD8ysYCckUi0URVy5kQfZFtjugA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8593270475349647320=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhkkwkC3itQMuqVX1aHSD8ysYCckUi0URVy5kQfZFtjugA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: mpohlack@amazon.de, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, joao.m.martins@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, aliguori@amazon.com, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, ross.philipson@oracle.com, George Dunlap <george.dunlap@citrix.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, mdontu <mdontu@bitdefender.com>, dwmw@amazon.co.uk, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8593270475349647320==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2vsUuv/fuvc+okFBcPLS"


--=-2vsUuv/fuvc+okFBcPLS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-25 at 12:35 -0600, Tamas K Lengyel wrote:
> On Thu, Oct 25, 2018 at 12:13 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
> >=20
> > TBH, I'd perhaps start with an admin control which lets them switch
> > between the two modes, and some instructions on how/why they might
> > want
> > to try switching.
> >=20
> > Trying to second-guess the best HT setting automatically is most
> > likely
> > going to be a lost cause.  It will be system specific as to whether
> > the
> > same workload is better with or without HT.
>=20
> This may just not be practically possible at the end as the system
> administrator may have no idea what workload will be running on any
> given system. It may also vary between one user to the next on the
> same system, without the users being allowed to tune such details of
> the system. If we can show that with core-scheduling deployed for
> most
> workloads performance is improved by x % it may be a safe option.=20
>
I haven't done this kind of benchmark yet, but I'd say that, if every
vCPU of every domain is doing 100% CPU intensive work, core-scheduling
isn't going to make much difference, or help you much, as compared to
regular scheduling with hyperthreading enabled.

Actual numbers may vary depending on whether VMs have odd or even
number of vCPUs but, e.g., on hardware with 2 threads per core, and
using VMs with at least 2 vCPUs each, the _perfect_ implementation of
core-scheduling would still manage to keep all the *threads* busy,
which is --as far as our speculations currently go-- what is causing
the performance degradation you're seeing.

So, again, if it is confirmed that this workload of yours is a
particularly bad one for SMT, then you are just better off disabling
hyperthreading. And, no, I don't think such a situation is common
enough to say "let's disable for everyone by default".

> But
> if every system needs to be tuned and evaluated in terms of its
> eventual workload, that task becomes problematic.
>
So, the scheduler has the notion of the system load (at least, Credit2
does), and it is in theory possible to put together some heuristics for
basically stopping using hyperthreading, upon certain conditions.

This, however, I see it as something completely orthogonal from
security related consideration and from core-scheduling.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-2vsUuv/fuvc+okFBcPLS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvSxvsACgkQFkJ4iaW4
c+5cEA//XWsly8poY9g05bWzqiUt/TQk/4sDd6YsuW/yPq1JSEzOcagci0kdmOoS
tJ/eBs6v6Vn1NvZuJX2DafGgEQs3tIHcJUtBQSyUsv9eZ5r9vk+zS0yyiKQzS8cT
/A8/a+kaTctZPQdVdn+K57Koq+SUspAmLrMCRtEGzHXfp7sgYLolzOFB0/wvN5AS
Xg6n/BtDdnnxv5cNxBmYZyMdy3GtiEqCEejtcIsH+ebt2x+1f+Rlo7vnE3oPZdqt
t1HMVSta4LYp9wfgBkIU+Ds2VLrqlPD/rgJAWX1JSH2QbhyNXdDzSmTNCBX7711W
WbXrpcwV8KQFOKn6VHS6vZk7DHLX/Nl46afKGsvbwcQzRMnzHskw2D7GZzLoypzw
6w2xsK5COrIA/ae3Gh8i9SzfVIZ1JQjzy/vy2a395DmardACTGsLJhiphGamCj4Y
uxdJ5seT3xL9zNZpSoB3REMfbw11sYMMdI3DwmNOVjnCJbk1pm4q9ZqXmSMkLpD9
V7+Y6WXJkOxzvfaIhjDpMKAmI+Jymn3i8EIdeoBZfsNDzcbFokePRrXfsb+uEpS6
wj+2rNHI4JCfMEmL//2GHTHjgkcmFXXXbmBISQVeRd6y5F+UVU0YNqnn/0QcGhlq
ukqsWMYm0JJu2s+LfNjLuL+bCkfy48zZgVBQ3D9m77elMxsK8d0=
=IZMd
-----END PGP SIGNATURE-----

--=-2vsUuv/fuvc+okFBcPLS--



--===============8593270475349647320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8593270475349647320==--
