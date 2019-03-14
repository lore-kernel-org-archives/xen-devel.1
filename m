From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 6/6] xen-pt: Round pci regions sizes to
 XEN_PAGE_SIZE
Date: Thu, 14 Mar 2019 21:45:26 +0100
Message-ID: <a030fb34-6297-753c-c209-e57702eace6a@invisiblethingslab.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-7-jandryuk@gmail.com>
 <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2137475905164763978=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4cC9=RR=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1h4XEV-0006Jy-No
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 20:45:43 +0000
In-Reply-To: <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2137475905164763978==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="2sZU9GiB04oIQv7fUDCy0yeOmCJhff6k3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2sZU9GiB04oIQv7fUDCy0yeOmCJhff6k3
Content-Type: multipart/mixed; boundary="OEiFKU6eufhOLawkk43m9h2ESeslOgexa";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
Message-ID: <a030fb34-6297-753c-c209-e57702eace6a@invisiblethingslab.com>
Subject: Re: [PATCH 6/6] xen-pt: Round pci regions sizes to XEN_PAGE_SIZE
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-7-jandryuk@gmail.com>
 <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
In-Reply-To: <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>

--OEiFKU6eufhOLawkk43m9h2ESeslOgexa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jason Andryuk:
> On Wed, Mar 13, 2019 at 11:09 AM Paul Durrant <Paul.Durrant@citrix.com>=
 wrote:
>>
>>> -----Original Message-----
>>> From: Jason Andryuk [mailto:jandryuk@gmail.com]
>>> Sent: 11 March 2019 18:02
>>> To: qemu-devel@nongnu.org
>>> Cc: xen-devel@lists.xenproject.org; marmarek@invisiblethingslab.com; =
Simon Gaiser
>>> <simon@invisiblethingslab.com>; Jason Andryuk <jandryuk@gmail.com>; S=
tefano Stabellini
>>> <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>;=
 Paul Durrant
>>> <Paul.Durrant@citrix.com>
>>> Subject: [PATCH 6/6] xen-pt: Round pci regions sizes to XEN_PAGE_SIZE=

>>>
>>> From: Simon Gaiser <simon@invisiblethingslab.com>
>>>
>>> If a pci memory region has a size < XEN_PAGE_SIZE it can get located =
at
>>> an address which is not page aligned.
>>
>> IIRC the PCI spec says that the minimum memory region size should be a=
t least 4k. Should we even be tolerating BARs smaller than that?
>>
>>   Paul
>>
>=20
> Hi, Paul.
>=20
> Simon found this, so it affects a real device.  Simon, do you recall
> which device was affected?
>=20
> I think BARs only need to be power-of-two size and aligned, and 4k is
> not a minimum.  16bytes may be a minimum, but I don't know what the
> spec says.
>=20
> On an Ivy Bridge system, here are some of the devices with BARs smaller=
 than 4K:
> 00:16.0 Communication controller: Intel Corporation 7 Series/C210
> Series Chipset Family MEI Controller #1 (rev 04)
>    Memory at d0735000 (64-bit, non-prefetchable) [disabled] [size=3D16]=

> 00:1d.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset
> Family USB Enhanced Host Controller #1 (rev 04) (prog-if 20 [EHCI])
>    Memory at d0739000 (32-bit, non-prefetchable) [disabled] [size=3D1K]=

> 00:1f.3 SMBus: Intel Corporation 7 Series/C210 Series Chipset Family
> SMBus Controller (rev 04)
>    Memory at d0734000 (64-bit, non-prefetchable) [disabled] [size=3D256=
]
> 02:00.0 System peripheral: JMicron Technology Corp. SD/MMC Host
> Controller (rev 30)
>    Memory at d0503000 (32-bit, non-prefetchable) [disabled] [size=3D256=
]
>=20
> These examples are all 4K aligned, so this is not an issue on this mach=
ine.

I wrote this patch quite some time ago, so I might be misremembering
something but IIRC the problem was the address qemu allocates with
memory_region_init_io(). I.e. the address as seen from inside the VM, so
it does not help if the real address is aligned.


--OEiFKU6eufhOLawkk43m9h2ESeslOgexa--

--2sZU9GiB04oIQv7fUDCy0yeOmCJhff6k3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlyKvWYACgkQkO9xfO/x
ly8VBBAAupOXjMrmuARGxnfDEzLSVLQEFWm3d7XyZzPNPlSHaNY73kklyJEG5yJD
V6rzE5eyj5tdn3/TzGZSBQDphc561yx+wZ81ZrbfcnwI5crcVX7orit6WjEiS8gF
MCWntXnAMq8p8OiTuIM2kzs93ojX+NGtRvcOHcgK9sHeGN5bByz/h1nGTB8CgBGt
Z/XRvG51h2skaSsuqO1QpOMrA2e+sKqHQwNgDWVq3x65IyZZPmIvY8wckkXgG/Uo
UK8BzCrBwVEbDAUI6jEcpwE73zdEg3e4FuNChgpZhL6C9nkToXLtl3/llS23BfHK
fYXN2PV9XnmMrbbixeUbOqzaQi43Q0A1eqCS/epT6ZKeTvoRiwdn0zpHKhrquF+F
MCyrI/kuIeDON0lnjN5BetMypZur0/roD+a52lV9L6two7co5FbUag1Q20LEs+0v
1FmFW5rloobtqdqyk+7fjJQKRzhCU/yn4HACKIVnKxaOS1LoNFV5spRSW/GsVK0o
rPoVXx9Cm0ShAjYxZdD3Ski3ZwcNpNr9iTk8SagOeXzCGUXiA+C7RszUCPV0Pn04
jOgH33xyTfWFyY413w15tFCepBWkeEZ4caRaw2mhmoxQF8M/+C5s4hB3z0NS+UUW
6Pz43OX2iBiLpA3pVCjlXFWpYWfzoafP0my3uc/+629BjcNcfbY=
=0YJK
-----END PGP SIGNATURE-----

--2sZU9GiB04oIQv7fUDCy0yeOmCJhff6k3--


--===============2137475905164763978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2137475905164763978==--
