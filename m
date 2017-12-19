From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen release cycle revisited
Date: Tue, 19 Dec 2017 21:42:34 +1100
Message-ID: <3091712.73UAgB5JZV@wopr.lan.crc.id.au>
References: <63cf216a-71af-bd35-55e7-88c69b773e52@suse.com>
 <9ae5f5ce-85d5-ee68-eef7-36f3026e1c13@suse.com>
 <5A38E022020000780019858F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5976514840417281122=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A38E022020000780019858F@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@linaro.org>, "committers@xenproject.org" <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============5976514840417281122==
Content-Type: multipart/signed; boundary="nextPart1911371.vt4kXoLan2"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1911371.vt4kXoLan2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 19 December 2017 7:47:14 PM AEDT Jan Beulich wrote:
> >>> On 19.12.17 at 07:58, <jgross@suse.com> wrote:
> > My proposal addresses the 4.10 experience. I see the following
> > alternatives (assuming we want to keep the two releases per year
> > scheme):
> >=20
> > 1. Leave everything as is
> >=20
> >    Pro: seems to work for the June release
> >    Con: release date for the December release is risky
> >=20
> > 2. Move releases one month earlier, freeze dates as well (my proposal)
> >=20
> >    Pro: more time for release at end of the year
> >    Con: freeze date end of February at end of Chinese New Year holidays
> >   =20
> >         in some years (2018 not applicable, as we would move that
> >         release by 2 weeks only, so next time this will really hit us
> >         will be 2026, maybe a little bit in 2021)
> >=20
> > 3. Move releases one month earlier, freeze dates before holidays
> >=20
> >    Pro: developers won't have to let feature slip due to holiday
> >    Con: shorter development time for _all_ developers
> >=20
> > 4. Keep the June release like today, move the December release 2 or 4
> >=20
> >    weeks earlier
> >    Pro: all Pros of 1-3
> >    Con: every second release will have shorter development cycle
>=20
> 5. Go to a yearly release cycle, with June as expected release date.
> At the risk of (still) being the only one to dislike the 6-month cycle,
> I have to say that there, at the moment, being 4 actively maintained
> stable branches and 6 security maintained ones is - just like I did
> anticipate back when we discussed the shortening of the cycle - a
> significant burden. And we haven't even reached the point yet
> where all security maintained branches are from the 6-month cycle.

I've gotta agree here - I've already been skipping releases to keep up. 4.8=
=20
was a complete non-starter for me, and 4.10 might be the same. Its exhausti=
ng.

I'm not sure there are really enough under-the-hood changes to justify a 6=
=20
month rapid release cycle.

It adds extra load on the security team, packagers, distro builders etc etc=
=20
which could probably be avoided with a sane release cycle.

I would think one release per year + point releases / roll ups with all XSA=
s=20
and backported fixes every quarter would be fantastic - as well as a 'maste=
r'=20
that people can build off git at will...

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart1911371.vt4kXoLan2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlo47RoACgkQQa811Xp9
MdzXMw/+P69wudvkjgglQA+ZPWI2IXgLuK8AV9zeFTfTuK5w1iLb17krTLvq7pEr
87b7JKAYMtE1uQ1zQbA8Q4nBWVJb/R0dO/xM0FtroDeZjpSMvTBRDwiJi7ptmHJD
DKjXdR/PoG1c17WqgZ88CRKXlNU07i6xaI/32DWyIz8j9pI8qwiNN1APWLU1zf7N
li6Sj1QVAskWeU84sAYHWoMJkfubsPXKDIr1oCu0pEnz3G9SqG8+e+BVlc0SboZ8
Tm+QAG8L8f5Ai1az80Q1AXl5sOiRapcDm7+hTPMYA9hAQsmGav8XvLKSaW81ePg+
SCKykj+xZ3XOcY4nbwbu19Bz85T3eezHWcX2mZKivtiA9h0GKL06+5/MXo5kkZl+
WVLUdfjSk0/l9NCaXdrAXlkE9EuecfNAvLjuc02dtyrlgHENwFOcil7e9m1Kv3Mr
czp/coJVpcQ1CeHCaYHgVWHaaP33kOOKZYdPXw6Rz7cpcbLMkUCa7vGrKTvkYD7l
3XyHAUBHKGlkc/arbAvx+dN6kggdVz2oIL6SU8ctK9UZV3IvFRf14bagD/kT9Bmu
DYFUwogWXoUtsi7W5n3P16wBMtDHOrJjqF3Nfa237n1UICXN0NQw0t5RMoLM0cOC
hqMYpqVmj8+wrjjRIzw74ggY9BGQX3FSndu51OUycrt44LFUH/o=
=2Z5X
-----END PGP SIGNATURE-----

--nextPart1911371.vt4kXoLan2--





--===============5976514840417281122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5976514840417281122==--
