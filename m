From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 7/7] tools/kdd: mute spurious gcc warning
Date: Fri, 6 Apr 2018 16:32:42 +0200
Message-ID: <20180406143242.GM3176@mail-itl>
References: <cover.c71341b28191a3808896e82914eb11c1472687b2.1522893038.git-series.marmarek@invisiblethingslab.com>
 <5888eecca0c8de49a455b2ce9722760a3dbdf4d0.1522893038.git-series.marmarek@invisiblethingslab.com>
 <3b81cb5f-4f64-4626-d105-bd58766807d0@oracle.com>
 <20180406130728.ez7725vdsltorixu@citrix.com>
 <dc5d9a85-ab9c-2cdb-9319-1284158e4596@oracle.com>
 <20180406134117.cnw6taklnojynfn3@citrix.com>
 <52a5c902-c75e-9cae-d447-10f2aefffa9a@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4629433374245628072=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <52a5c902-c75e-9cae-d447-10f2aefffa9a@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============4629433374245628072==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VnOTrGv5LmZxna7m"
Content-Disposition: inline


--VnOTrGv5LmZxna7m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 06, 2018 at 09:56:05AM -0400, Boris Ostrovsky wrote:
> On 04/06/2018 09:41 AM, Wei Liu wrote:
> > On Fri, Apr 06, 2018 at 09:39:50AM -0400, Boris Ostrovsky wrote:
> >> On 04/06/2018 09:07 AM, Wei Liu wrote:
> >>> On Fri, Apr 06, 2018 at 08:39:53AM -0400, Boris Ostrovsky wrote:
> >>>> On 04/04/2018 09:50 PM, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> gcc-8 complains:
> >>>>>
> >>>>>     kdd.c:698:13: error: 'memcpy' offset [-204, -717] is out of the=
 bounds [0, 216] of object 'ctrl' with type 'kdd_ctrl' {aka 'union <anonymo=
us>'} [-Werror=3Darray-bounds]
> >>>>>                  memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> >>>>>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>>>     kdd.c: In function 'kdd_select_callback':
> >>>>>     kdd.c:642:14: note: 'ctrl' declared here
> >>>>>          kdd_ctrl ctrl;
> >>>>>                   ^~~~
> >>>>>
> >>>>> But this is impossible - 'offset' is unsigned and correctly validat=
ed
> >>>>> few lines before.
> >>>>>
> >>>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> >>>>> ---
> >>>>>  tools/debugger/kdd/kdd.c | 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> >>>>> index 1bd5dd5..61d769e 100644
> >>>>> --- a/tools/debugger/kdd/kdd.c
> >>>>> +++ b/tools/debugger/kdd/kdd.c
> >>>>> @@ -695,7 +695,10 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> >>>>>              KDD_LOG(s, "Request outside of known control space\n");
> >>>>>              len =3D 0;
> >>>>>          } else {
> >>>>> +#pragma GCC diagnostic push
> >>>>> +#pragma GCC diagnostic ignored "-Warray-bounds"
> >>>>>              memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> >>>>> +#pragma GCC diagnostic pop
> >>>>>          }
> >>>>>      }
> >>>>> =20
> >>>> Breaks 32-bit build, at least with my (ancient, gcc version 4.4.5
> >>>> 20101112 (Red Hat 4.4.5-2) (GCC)) compiler:
> >>>>
> >>>>
> >>>>
> >>>> kdd.c: In function =E2=80=98kdd_handle_read_ctrl=E2=80=99:
> >>>> kdd.c:698: error: #pragma GCC diagnostic not allowed inside functions
> >>>> kdd.c:699: error: #pragma GCC diagnostic not allowed inside functions
> >>>> kdd.c:701: error: #pragma GCC diagnostic not allowed inside functions
> >>>> make[5]: *** [kdd.o] Error 1
> >>>>
> >>> Does moving the relevant #pragma's outside of the function fix it?
> >> The additional problem with these pragmas is that apparently push/pop
> >> have been introduced in gcc 4.6.0:
> >>
> >> https://gcc.gnu.org/onlinedocs/gcc-4.6.0/gcc/Diagnostic-Pragmas.html#D=
iagnostic-Pragmas
> >>
> >> If you change release number to a lower one (e.g. 4.5.4) you won't see=
 them.
> >>
> >> So I can move "diagnostic ignored" from inside the function and that
> >> will clear the "GCC diagnostic not allowed inside functions" error. But
> >> then push/pop are not recognized:
> >>
> >> cc1: warnings being treated as errors
> >> kdd.c:639: error: expected [error|warning|ignored] after =E2=80=98#pra=
gma GCC
> >> diagnostic=E2=80=99
> >> kdd.c:714: error: expected [error|warning|ignored] after =E2=80=98#pra=
gma GCC
> >> diagnostic=E2=80=99
> >>
> >> (Interestingly, my 64-bit build completed without issues)
> > Hmm... this is messy.
> >
> > If you have information about which version does what we can try to
> > enclose the #pragma's with #if __GCC__.
>=20
>=20
> Can we instead pre-compute the pointer to pacify the compiler? I haven't
> seen the original error so I can't test it, but something like

Nope, it doesn't help. But adding "if (offset > 0)" before that "+=3D
offset" does...=20
For me it looks like a gcc bug. Not sure how to deal with this. Enclose
#pragma with #if __GNUC__ >=3D 8 ?

> diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> index 61d769e..1b048ac 100644
> --- a/tools/debugger/kdd/kdd.c
> +++ b/tools/debugger/kdd/kdd.c
> @@ -688,6 +688,7 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> =C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 32-bit control-regist=
er space starts at 0x[2]cc, for 84 bytes */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t offset =3D addr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ptr =3D &ctrl.c32;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (offset > 0x200)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
offset -=3D 0x200;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset -=3D 0xcc;
> @@ -695,10 +696,8 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
KDD_LOG(s, "Request outside of known control space\n");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
len =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Warray-bounds"
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcp=
y(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> -#pragma GCC diagnostic pop
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr +=
=3D offset;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcp=
y(buf, ptr, len);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> -boris

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--VnOTrGv5LmZxna7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrHhQoACgkQ24/THMrX
1yzrbAf9H7+yxJkH9fgjsvbY/Hxc7gL6XTj6dV6u19nBr8QKSir0WtRGEOIYNSEk
hzJOkuuFHCs4X2Z4R9hmoWD+ouZEkfrfCnaJABM4n+DFXCvO351qpXcgxbOkFm0+
pIWmNQqVzXi4IBFu5LltpGR26faYYhglO0nZLp11XNq6/YIFPoDV0NY29XYju87N
Ql57Pm1zT/i35lvL4F7162JuSb58HOaXcqlQMldCHrWhdAJYAR/ouQP5U4lWVumz
wkz0ECdMYGkH+akXfP/nKlz9loYlmspao5EmbkoFUzZDM8SFY7jUT14ZJLOFWpsR
32aCldbS71GQIZcEijcq/EdDS+5LGQ==
=PlSq
-----END PGP SIGNATURE-----

--VnOTrGv5LmZxna7m--


--===============4629433374245628072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4629433374245628072==--
