From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Xen inside KVM on AMD: Linux HVM/PVH crashes on AP
 bring up
Date: Mon, 14 May 2018 00:03:56 +0200
Message-ID: <20180513220356.GA2731@mail-itl>
References: <20180416151403.GA2208@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0028191934370238793=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180416151403.GA2208@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xen.org>, kvm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>
List-Id: xen-devel@lists.xenproject.org


--===============0028191934370238793==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2018 at 05:14:03PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> I' trying to boot Linux PVH on Xen, which is running inside KVM on AMD
> hardware. As soon as secondary CPU is starting, domain crashes.
> Strangely, without printing any related messages on the console. The
> last message is "x86: Booting SMP configuration:".
> This happens for both PVH and HVM with 2 vcpus. PVH/HVM domains with 1
> vcpu works fine(*), as well as PV domains with multiple vcpus.
>=20
> Using gdbsx I've managed to get the point where it crashes:
>=20
>     (gdb) f 12
>     #12 0xffffffff81025101 in do_error_trap (regs=3D0xffffc9000037fe78, e=
rror_code=3D-2401053088876204019,=20
>         str=3D0x40 <irq_stack_union+64> <error: Cannot access memory at a=
ddress 0x40>, trapnr=3D6, signr=3D-2)
>         at arch/x86/kernel/traps.c:302
>     302	arch/x86/kernel/traps.c: No such file or directory.
>     (gdb) p/x *regs
>     $8 =3D {r15 =3D 0x0, r14 =3D 0x0, r13 =3D 0x0, r12 =3D 0x0, bp =3D 0x=
1, bx =3D 0xffff88007fd0f040, r11 =3D 0x0,=20
>       r10 =3D 0x0, r9 =3D 0x38, r8 =3D 0x0, ax =3D 0xffffffe4, cx =3D 0xf=
fffffff82251e68, dx =3D 0x0, si =3D 0x96,=20
>       di =3D 0x82, orig_ax =3D 0xffffffffffffffff, ip =3D 0xffffffff81036=
bd3, cs =3D 0x10, flags =3D 0x10086,=20
>       sp =3D 0xffffc9000037ff20, ss =3D 0x0}
>     (gdb) info symbol 0xffffffff81036bd3
>     identify_secondary_cpu + 83 in section .text
>=20
> It is BUG_ON(c =3D=3D &boot_cpu_data). If I read it correctly, "c" is 0x8=
2,
> which indeed isn't &boot_cpu_data (0xffffffff8234fe00).
>=20
> Any idea?
>
> Version info:
> Linux (L0, KVM): 4.4.114-42 (OpenSUSE Leap 42.3)
> Xen (L1): 4.8.3
> Linux dom0 (L1): 4.14.18
> Linux guest: 4.14.18

Upgrading L0 kernel to 4.16.8 and guest (L2) kernel to 4.15.6 fixed this
problem. Not sure if L0 kernel upgrade was necessary (on its own didn't
helped), but the latter one definitely was.

> (*) besides some 20s+ delay on flush_work in deferred_probe_initcall,
> before actually calling deferred_probe_work_func.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr4tksACgkQ24/THMrX
1yz5YAf/cB39pF6WmblzUTMR7/5mnLGk3qyBFAmTJplJuJ3032eLyzU/OQ0idN2t
W5++UduAqoPBCBc2eyYEoz9KvczmDUAELqoER3wGqJeW1YT72zQ5l3s1oDAfXjrF
qsk4V3zERUYraKqjvLf/ak7r8tN7NVplm3BU/D1CnKBavVx62aIeQVbpFjCHS22g
nBZzySv7QAOKPfz6sjQWer5tVvsDY+43vxQ8m7KeswRXcv02ofnLsV5DRGDMEu5c
Dre4LtMRC9XMQolAr4QhTOQyhwU7A+L7dB0EaFuYXOuDeC/OEHvmr/O/WJvMIvzW
/kgjw816yTPPFxih5HcCLkBBktoHCw==
=0lnn
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--


--===============0028191934370238793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0028191934370238793==--
