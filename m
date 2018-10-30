From: Vladimir Botka <vbotka@gmail.com>
Subject: Re: [Xen-users] [XEN][ARM] WiFi bridge creation
Date: Tue, 30 Oct 2018 11:34:08 +0100
Message-ID: <20181030113408.74525d80@planb.netng.org>
References: <CAFsJcmYQRttza046T09sCBZzEs7pm31uxawQJHxsQySpyELkBQ@mail.gmail.com>
 <20181030080929.6d04a875@planb.netng.org>
 <CAFsJcmZFrpmattTzwkijF7Wz4cgXErg0090QBx1S-zJCRNnScg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7239256549964692924=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m0b/=nk=gmail.com=vbotka@srs-us1.protection.inumbo.net>)
 id 1gHRLi-0006Jh-Aq
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 10:34:14 +0000
In-Reply-To: <CAFsJcmZFrpmattTzwkijF7Wz4cgXErg0090QBx1S-zJCRNnScg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vikram K <vikram.k@pathpartnertech.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7239256549964692924==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O8jgs21=Nf//IWlLqx.q1U_"; protocol="application/pgp-signature"

--Sig_/O8jgs21=Nf//IWlLqx.q1U_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

> On Tue, Oct 30, 2018 at 12:39 PM Vladimir Botka <vbotka@gmail.com> wrote:
> > On Tue, 30 Oct 2018 10:03:22 +0530
> > Vikram K <vikram.k@pathpartnertech.com> wrote:
> > > Hello,
> > > We are using Hikey960 with Debian as Dom0 and DomU. This board has on=
ly
> > > WiFi interface. We want to create bridge between Dom0 and DomU so tha=
t =20
> > > DomU =20
> > > has internet access. We tried to create bridge using brtcl command, b=
ut =20
> > > it =20
> > > is not working. Please provide pointers. =20

> > AFAIK, it's not working
> > https://marc.info/?l=3Dlinux-wireless&m=3D136743495526905&w=3D2
> > "There is a proposed fix that is included in OpenWrt"
> > https://marc.info/?l=3Dlinux-wireless&m=3D145591129008322&w=3D2
> > More details are avilable in OpenWrt WiKi
> > https://wiki.openwrt.org/doc/recipes/relayclient
> > -vlado

On Tue, 30 Oct 2018 15:01:39 +0530
Vikram K <vikram.k@pathpartnertech.com> wrote:
> Hi,
> As per below link, it is possible to share Internet via WiFi between Dom0
> and DomU,.
> https://wiki.xenproject.org/wiki/Xen_in_WiFi_networks
> Tried the suggested solution using ebtables, but it did not work.
> * ebtables -t nat -A POSTROUTING -s 00:60:00:00:00:01 \
>               -j snat --to-source 00:60:aa:bb:cc:dd*
> In the configurations file we have added below configuration in DomU
> config file.
> * vif =3D ['mac=3D00:16:3e:64:b8:40']*
> Apart from that do we need to add any addition configuration?

NAT is a different story. Worked for me with Armbian(no XEN) and Atheros 92=
80
couple of years ago. I used Ansible to configure it.
https://github.com/vbotka/ansible-linux-postinstall/blob/master/templates/r=
outer1-iptables.j2

HTH,

- vlado

--Sig_/O8jgs21=Nf//IWlLqx.q1U_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbaThuYKQgbbmDrVkkNGZEo7UTwEFAlvYM6AACgkQkNGZEo7U
TwE5lgf9Haf1AwdlZj0KbytTpKZNtM2SByLvgm2UrfeMO3MLoweRh03ZHLhEJaSw
pNZIfopYYrZAeGH2r8pfp3+whAlFkEC3N5o03N9jqyLyYp3/eoAUgSOFqjpe0wgP
G3VxuMqYzMbXC/p/fMeOv9ciH/f5utm6vGAcenoqU7uC3JmMsGeorYGMAFGwwj+v
BSoISVvJpzMyc7figJr/a4ARS0xWR3+izVm9yUUVbJ8nc4Qtw0X2H2Qgz96rEOXj
lTI+MqRy62kEAmshu81Hv7fej0UWce0g3ByVMMzsIoDRq/moDyrmxgxsaNxmv6rH
EH8A51QWc1FRHIgCp8IhsnS4uccBEA==
=slBT
-----END PGP SIGNATURE-----

--Sig_/O8jgs21=Nf//IWlLqx.q1U_--


--===============7239256549964692924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7239256549964692924==--
