From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Thu, 6 Sep 2018 22:31:28 +0200
Message-ID: <20180906203128.GJ1353__23222.6219996393$1536265826$gmane$org@mail-itl>
References: <20180906153355.25363-1-marmarek@invisiblethingslab.com>
 <bf287a28-5e40-1ea2-a983-3d6a8e9a9869@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5844588392092870416=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n4la=lu=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fy0wA-00009u-Tf
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 20:31:35 +0000
In-Reply-To: <bf287a28-5e40-1ea2-a983-3d6a8e9a9869@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org


--===============5844588392092870416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+Z7/5fzWRHDJ0o7Q"
Content-Disposition: inline


--+Z7/5fzWRHDJ0o7Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 04:14:50PM -0400, Boris Ostrovsky wrote:
> On 09/06/2018 11:33 AM, Marek Marczykowski-G=C3=B3recki wrote:
> > Scrubbing pages on initial balloon down can take some time, especially
> > in nested virtualization case (nested EPT is slow). When HVM/PVH guest =
is
> > started with memory=3D significantly lower than maxmem=3D, all the extra
> > pages will be scrubbed before returning to Xen. But since most of them
> > weren't used at all at that point, Xen needs to populate them first
> > (from populate-on-demand pool). In nested virt case (Xen inside KVM)
> > this slows down the guest boot by 15-30s with just 1.5GB needed to be
> > returned to Xen.
> >
> > Add runtime parameter to enable/disable it, to allow initially disabling
> > scrubbing, then enable it back during boot (for example in initramfs).
> > Such usage relies on assumption that a) most pages ballooned out during
> > initial boot weren't used at all, and b) even if they were, very few
> > secrets are in the guest at that time (before any serious userspace
> > kicks in).
> >
> > Default behaviour is unchanged.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> >
> > ---
> > Is module_param() a good thing for this? Other xen-balloon parameters a=
re
> > in /sys/devices/system/xen_memory, so maybe it would make sense to put
> > this one there too? But then, cmdline parameter would need to be added
> > separately and comment about core_param() suggests it shouldn't be used
> > if not absolutely necessary (is it?).
>=20
>=20
> You can also use cmdline_find_option() in the balloon driver.
>=20
> I would prefer that all tunables for the balloon driver live in the same
> place. (Note that in that case
> Documentation/ABI/stable/sysfs-devices-system-xen_memory will need to be
> updated).

Ok, will move that. This will also mean that it will affect only balloon
driver, not other users of mem-reservation.c (grant allocator). But
given the reason for this tunable, I think that's fine.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+Z7/5fzWRHDJ0o7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAluRjqAACgkQ24/THMrX
1ywXoQf9GslZ5mNMyTDoXZE1lz+20hZnloXps/YwcnK2/Ay5c3SGIrEmnd6vPDah
c4VUpATzbvRIDWgtkVlAohA1dunJXxEiG0kQfjPAkoPFbwtuY/O1/JW9m9vjnf4B
e9TBJ+IuN713Sh+6+AaBIfsNliiBnH6TCBL56v7EA3vi4t49oVPZ5Dp0xYjj7Tug
PmIL73QI99yol51gpGw0FZZTULlH7WqP2INzVsLhAQlhVyC7fN4wdskfBWnn9rao
aQpw6vIRu5TExGJn4hD8XjxIrfkkIGebvKVWATFHDHE/e1Z2lV0a++AitAg1l4zs
6vSnfcAZO8cVRQqD4SIPhDWGKtJJ1A==
=IoZO
-----END PGP SIGNATURE-----

--+Z7/5fzWRHDJ0o7Q--


--===============5844588392092870416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5844588392092870416==--
