From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 6/6] xen-pt: Round pci regions sizes to
 XEN_PAGE_SIZE
Date: Thu, 14 Mar 2019 20:22:49 +0100
Message-ID: <75347d5f-3b47-3b35-fa96-cd166c240d9e@invisiblethingslab.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-7-jandryuk@gmail.com>
 <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8064675520006245830=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4cC9=RR=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1h4VwZ-0008En-CR
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 19:23:07 +0000
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
--===============8064675520006245830==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="k01LiX1uIjjAoip0MVo2kj59g8S4bfLix"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k01LiX1uIjjAoip0MVo2kj59g8S4bfLix
Content-Type: multipart/mixed; boundary="UUcKDpgIaWBDxogu4LPlygjxrViPwCVYr";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
Message-ID: <75347d5f-3b47-3b35-fa96-cd166c240d9e@invisiblethingslab.com>
Subject: Re: [PATCH 6/6] xen-pt: Round pci regions sizes to XEN_PAGE_SIZE
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-7-jandryuk@gmail.com>
 <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
In-Reply-To: <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>

--UUcKDpgIaWBDxogu4LPlygjxrViPwCVYr
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

Not sure which one it was. Probably the USB controller or the SD host
controller. As your example below shows this is not so uncommon.

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
>=20
> Reviewing the code, I'm now wondering if the following in
> hw/xen/xen_pt.c:xen_pt_region_update is wrong:        rc =3D
> xc_domain_memory_mapping(xen_xc, xen_domid,
>                                      XEN_PFN(guest_addr + XC_PAGE_SIZE =
- 1),
>                                      XEN_PFN(machine_addr + XC_PAGE_SIZ=
E - 1),
>                                      XEN_PFN(size + XC_PAGE_SIZE - 1),
>                                      op);
>=20
> If a bar of size 0x100 is at 0xd0500800, then the machine_addr passed
> in would be 0xd0501000 which is past the actual location.  Should the
> call arguments just be XEN_PFN(guest_addr) & XEN_PFN(machine_addr)?
>=20
> BARs smaller than a page would also be a problem if BARs for different
> devices shared the same page.
>=20
> Regards,
> Jason
>=20
>>> This breaks the memory mapping via
>>> xc_domain_memory_mapping since this function is page based and the
>>> "offset" is therefore lost.
>>>
>>> Without this patch you will see error like this in the stubdom log:
>>>
>>>   [00:05.0] xen_pt_bar_read: Error: Should not read BAR through QEMU.=
 @0x0000000000000004
>>>
>>> QubesOS/qubes-issues#2849
>>>
>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>> ---
>>>  hw/xen/xen_pt.c | 10 +++++++---
>>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>>> index 5539d56c3a..7f680442ee 100644
>>> --- a/hw/xen/xen_pt.c
>>> +++ b/hw/xen/xen_pt.c
>>> @@ -449,9 +449,10 @@ static int xen_pt_register_regions(XenPCIPassthr=
oughState *s, uint16_t *cmd)
>>>      /* Register PIO/MMIO BARs */
>>>      for (i =3D 0; i < PCI_ROM_SLOT; i++) {
>>>          XenHostPCIIORegion *r =3D &d->io_regions[i];
>>> +        pcibus_t r_size =3D r->size;
>>>          uint8_t type;
>>>
>>> -        if (r->base_addr =3D=3D 0 || r->size =3D=3D 0) {
>>> +        if (r->base_addr =3D=3D 0 || r_size =3D=3D 0) {
>>>              continue;
>>>          }
>>>
>>> @@ -469,15 +470,18 @@ static int xen_pt_register_regions(XenPCIPassth=
roughState *s, uint16_t *cmd)
>>>                  type |=3D PCI_BASE_ADDRESS_MEM_TYPE_64;
>>>              }
>>>              *cmd |=3D PCI_COMMAND_MEMORY;
>>> +
>>> +            /* Round up to a full page for the hypercall. */
>>> +            r_size =3D (r_size + XC_PAGE_SIZE - 1) & XC_PAGE_MASK;
>>>          }
>>>
>>>          memory_region_init_io(&s->bar[i], OBJECT(s), &ops, &s->dev,
>>> -                              "xen-pci-pt-bar", r->size);
>>> +                              "xen-pci-pt-bar", r_size);
>>>          pci_register_bar(&s->dev, i, type, &s->bar[i]);
>>>
>>>          XEN_PT_LOG(&s->dev, "IO region %i registered (size=3D0x%08"P=
RIx64
>>>                     " base_addr=3D0x%08"PRIx64" type: %#x)\n",
>>> -                   i, r->size, r->base_addr, type);
>>> +                   i, r_size, r->base_addr, type);
>>>      }
>>>
>>>      /* Register expansion ROM address */
>>> --
>>> 2.20.1


--UUcKDpgIaWBDxogu4LPlygjxrViPwCVYr--

--k01LiX1uIjjAoip0MVo2kj59g8S4bfLix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlyKqgwACgkQkO9xfO/x
ly+XfxAAhHN4EJQGHrJ8RDGUC41qGL6DR7F/ooCf8PGccut4Bdr2TdBA1vJ1GpSd
s431bCADUkDhmK1grLVY/TXmJMpgz+J92jMGxMyd4DAhVht1gcpRg9uSTLxrg1FD
WSpLH2nUUMRZuz5FmnUOZlzYnu/W7V37qXxRvDhWpSZvXTSR6c5y9tgiNLnMwiGl
Ehl9zXn7RbRIwXVM//tyXR7/Ci5ZyoOm5pfxAMzZKTKIFvfmG25yjKltTxk+l0Gm
3kWt/KWwFB9EdwlnjtFWLyA8dEIvxa3HjliQOXPqbJeF206VlZJ28qvxRxSGrVww
NpxfOMWtgR6EfqVNPHNYm8pajFEMPg8hVWji8cB3/OVxhOnOVAAShSKuRQVuFKuK
eyEQi60Hr7yyWxMtf306BF4ymITVt61UWENXetB6NRxnz6kdQo+AbdOQzmikeGAN
Nbcr9oj5OuzECLJpwkxaIyQdOFAvYvDakwR+XekPvgtClm4Kfp+KyamqJ32qxwPo
PPMNOfq11OBJF0fyiEEODF7JsTVnua+RBcO5FFS7CxDxnSqwo5T0sLUWck8eVdYc
eWTA/NLq6KER9ooRoxy0HwCJ8AUwP4FGBLdWLdXBkoCpNZg+NVqdhvRBKSD2LW2p
TtJbwX2zG+Gqtebky5KKN0eqUaavZzzxxRvZPem+kgVTxg4ghhM=
=1lZD
-----END PGP SIGNATURE-----

--k01LiX1uIjjAoip0MVo2kj59g8S4bfLix--


--===============8064675520006245830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8064675520006245830==--
