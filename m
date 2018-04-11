From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: Resume from suspend to RAM broken when using early
 microcode updates
Date: Wed, 11 Apr 2018 12:01:00 +0000
Message-ID: <d8da2a1f-b2e8-f8c3-4e33-bc84ac0cc7d4@invisiblethingslab.com>
References: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
 <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2687981927770397587=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lz4q=ha=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f6ER0-0006nw-Nd
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 12:01:06 +0000
In-Reply-To: <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2687981927770397587==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="RvEutXSfhuyR3g14IOSTsESth4MprU0vW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RvEutXSfhuyR3g14IOSTsESth4MprU0vW
Content-Type: multipart/mixed; boundary="t3G56XfLeNdhzhL0THDyPiQB0p5kOmc0q";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8da2a1f-b2e8-f8c3-4e33-bc84ac0cc7d4@invisiblethingslab.com>
Subject: Re: Resume from suspend to RAM broken when using early microcode
 updates
References: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
 <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>
In-Reply-To: <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>

--t3G56XfLeNdhzhL0THDyPiQB0p5kOmc0q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 11/04/18 12:48, Simon Gaiser wrote:
>> Hi,
>>
>> when I use early microcode loading with the microcode update with the
>> BTI mitigations, resuming from suspend to RAM is broken.
>>
>> Based on added logging to enter_state() (from power.c) it doesn't
>> survive the local_irq_restore(flags) call (at least a printk() after t=
he
>> call doesn't output anything on the serial console).
>>
>> I guess that some irq handler tries to use IBRS/IBPB. But the microcod=
e
>> is only loaded later.
>>
>> If I simply move the microcode_resume_cpu(0) directly before the
>> local_irq_restore(flags) everything seems to work fine. But I'm not su=
re
>> if this has unintended consequences.
>>
>> I tested the above with Xen 4.8.3 from Qubes which includes the BTI an=
d
>> microcode patches from staging-4.8. AFAICS there are no commits which
>> changes the affected code or other commits which sound relevant so thi=
s
>> probably affected also all the newer branches.
>=20
> S3 support is a very unloved area of the hypervisor.
>=20
> Yes - we definitely need to get microcode reloaded before interrupts ar=
e
> enabled.

Do you see any problems with simply moving microcode_resume_cpu(0)
directly before the local_irq_restore(flags) call? (I'm not familiar
with the code at all and (early) resume handling sounds like something
which is easy to break in non obvious ways)

> That said, I would have expected a backtrace complaining about
> a GP fault if we had hit the use of IBRS/IBPB before the microcode was
> reloaded.

Yeah, not sure what's happening here. I don't get any output from after
local_irq_restore(flags). If you have some ideas for more debug output I
can easily test it.

Simon


--t3G56XfLeNdhzhL0THDyPiQB0p5kOmc0q--

--RvEutXSfhuyR3g14IOSTsESth4MprU0vW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrN+REACgkQkO9xfO/x
ly81hQ//S3ULYx4u3aph12EkSY5/wV3m98Liumk0IMtNCcV7A2D3yz69s60Vydpj
TpKkdn8cl7ryXWU7eYEk0bS7OK4vuwCTpSTeRyTS3BRXxqehbLRYu3kikIZQRh+Q
SHsKMnqLjPUDntFgfbDeA1WvHEZenuN7UAZ4cAfWyvoiLvJY1xW0YOIQJ8kbF0tR
Cu/Q1BAARUbc1U4Rtd6HEphvu2K3tLiaxaaOZtBLhtmob9ai5jZA3yeRkrb+BkZz
ktMigFNVW3njXxL4HSY/WNHluMad0QuJwfVfgFlA5mkihMOuFYysr11/S1PQ/tMe
hwx+uJXa5rEetwfvoPnwA/NYtLfAKJaQwSuu88VCadOpEar8lLzirsAY5y86YpkC
ZmgY/FviRuxhhNjSwoGQoHBZy/PBfTEZYRKPag5eXN4Xak2HP5M+/cBVCS4ov/Ps
d0/YZMzGJcz328TCEIjVrgU8npe8UeOrn/XR3cg311ZdHlvtss1xs0J51Ylflg7V
l3GRyyFu+6dqpFZhGaC9SonYK0n+ha7h0IYRa5iH3t6/566ZqDQMgqVBJjGAxl/A
mOaYTWLHBNnIyS9eJOaF5ac2oorvn6k6jDPfxwAY1x8Z1MASnyiJAsAZUFowKHWF
v3ORjU270hnq6RnIrt6psysp/NO9NXVQdCReD9W1Pp31lq5XIsI=
=s6d+
-----END PGP SIGNATURE-----

--RvEutXSfhuyR3g14IOSTsESth4MprU0vW--


--===============2687981927770397587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2687981927770397587==--
