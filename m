From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Don't add Xen's
 libs to LDFLAGS
Date: Mon, 4 Feb 2019 16:11:48 -0600
Message-ID: <0cbb581b-d945-7aa6-a123-c2c9422d76f9@redhat.com>
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
 <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru>
 <87fttijvfm.fsf@dusky.pond.sub.org>
 <9a1725c3-1119-886d-2d9d-11369ea5f207@redhat.com>
 <CAFEAcA-qKrCSc0U2hWDzsHyrEaMtPVQ1A6o6FFvtucg0tnaM2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8694774631943976498=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mc0N=QL=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1gqmT2-0000bM-Ab
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 22:11:52 +0000
In-Reply-To: <CAFEAcA-qKrCSc0U2hWDzsHyrEaMtPVQ1A6o6FFvtucg0tnaM2A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8694774631943976498==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5555Gu7QHl6ypVnidA72ovGCzNhYY3tkG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5555Gu7QHl6ypVnidA72ovGCzNhYY3tkG
Content-Type: multipart/mixed; boundary="wKKy2ozZTzej2pfogCR4nhuX3SnraHp7R";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefano Stabellini <sstabellini@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Message-ID: <0cbb581b-d945-7aa6-a123-c2c9422d76f9@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Don't add Xen's libs to LDFLAGS
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
 <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru>
 <87fttijvfm.fsf@dusky.pond.sub.org>
 <9a1725c3-1119-886d-2d9d-11369ea5f207@redhat.com>
 <CAFEAcA-qKrCSc0U2hWDzsHyrEaMtPVQ1A6o6FFvtucg0tnaM2A@mail.gmail.com>
In-Reply-To: <CAFEAcA-qKrCSc0U2hWDzsHyrEaMtPVQ1A6o6FFvtucg0tnaM2A@mail.gmail.com>

--wKKy2ozZTzej2pfogCR4nhuX3SnraHp7R
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/24/19 12:29 PM, Peter Maydell wrote:
> On Thu, 24 Jan 2019 at 17:40, Eric Blake <eblake@redhat.com> wrote:
>>
>> On 1/24/19 2:45 AM, Markus Armbruster wrote:
>>
>>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>>> Revieved-by: Michael Tokarev <mjt@tls.msk.ru>
>>>
>>> Typo in Reviewed-by.
>>
>> Should we tighten checkpatch.pl to flag suspicious-looking 'xxx-by:'
>> tags, to catch instances of typos?
>=20
> Yes, I would vote for having it whitelist the half a dozen
> expected ones and complain about the rest. I think we
> kind of discussed this in the past...

I submitted a patch along those lines:
https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg00910.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--wKKy2ozZTzej2pfogCR4nhuX3SnraHp7R--

--5555Gu7QHl6ypVnidA72ovGCzNhYY3tkG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxYuKQACgkQp6FrSiUn
Q2rcpwf/c90eDrLuVw5rOxjqQha+5ISQDK/Fr1Q4yxxln/5RIgBDgN9fAW+80Jol
mfJMK+bSAkL+rOdkJ6veE2aIvZBdU5BLxYhVcGmyEA92uXFjMXMjRKZe8Ew+mUvP
qWFE3Rh3LF84XSEafm5R8Mb5R+B2PTJGuC4BuUESnqUpm6v5/KiSyV4mTjbS6Nbc
ghsKXArIjhQSkArWM2cOzQ2AOOlyREsT8AZ/lHte11Qwq2IHhLPHUflrPdXdnO+T
rxfhQFcr5IQwH1lFma8z8A9vxytF86z4IJsJu7NOPBdggSGqZd/vCzsT6R4yemro
DRIWwiRgVqEUDtqtowLRPTunTqZB2A==
=03lY
-----END PGP SIGNATURE-----

--5555Gu7QHl6ypVnidA72ovGCzNhYY3tkG--


--===============8694774631943976498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8694774631943976498==--
