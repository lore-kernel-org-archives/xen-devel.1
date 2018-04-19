From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] xen-netfront: Fix hang on device removal
Date: Thu, 19 Apr 2018 20:09:00 +0000
Message-ID: <6ad676c8-476f-1181-1acd-985671f6c837__41655.6238350042$1524168523$gmane$org@invisiblethingslab.com>
References: <20180228122323.3914-1-jandryuk@gmail.com>
 <1b07e839-5633-3b1e-1997-b86a891b2962@invisiblethingslab.com>
 <CAKf6xpuusCJ0DMJ_G3hG5pd9vd8rUBH=VPa4TCvaoptGto-=Zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0311872970370268843=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i7pj=hi=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f9Fry-00030M-QS
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 20:09:27 +0000
In-Reply-To: <CAKf6xpuusCJ0DMJ_G3hG5pd9vd8rUBH=VPa4TCvaoptGto-=Zw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0311872970370268843==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="5u8trKVAeNy4LF1MR15s5bqCN9UIos27C"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5u8trKVAeNy4LF1MR15s5bqCN9UIos27C
Content-Type: multipart/mixed; boundary="jAv05fVE9GqNrG6iq4E36ns4Fw2mTx1hD";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: netdev@vger.kernel.org, xen-devel@lists.xenproject.org,
 Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <6ad676c8-476f-1181-1acd-985671f6c837@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH] xen-netfront: Fix hang on device removal
References: <20180228122323.3914-1-jandryuk@gmail.com>
 <1b07e839-5633-3b1e-1997-b86a891b2962@invisiblethingslab.com>
 <CAKf6xpuusCJ0DMJ_G3hG5pd9vd8rUBH=VPa4TCvaoptGto-=Zw@mail.gmail.com>
In-Reply-To: <CAKf6xpuusCJ0DMJ_G3hG5pd9vd8rUBH=VPa4TCvaoptGto-=Zw@mail.gmail.com>

--jAv05fVE9GqNrG6iq4E36ns4Fw2mTx1hD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jason Andryuk:
> On Thu, Apr 19, 2018 at 2:10 PM, Simon Gaiser
> <simon@invisiblethingslab.com> wrote:
>> Jason Andryuk:
>>> A toolstack may delete the vif frontend and backend xenstore entries
>>> while xen-netfront is in the removal code path.  In that case, the
>>> checks for xenbus_read_driver_state would return XenbusStateUnknown, =
and
>>> xennet_remove would hang indefinitely.  This hang prevents system
>>> shutdown.
>>>
>>> xennet_remove must be able to handle XenbusStateUnknown, and
>>> netback_changed must also wake up the wake_queue for that state as we=
ll.
>>>
>>> Fixes: 5b5971df3bc2 ("xen-netfront: remove warning when unloading mod=
ule")
>>
>> I think this should go into stable since AFAIK the hanging network
>> device can only be fixed by rebooting the guest. AFAICS this affects a=
ll
>> 4.* branches since 5b5971df3bc2 got backported to them.
>>
>> Upstream commit c2d2e6738a209f0f9dffa2dc8e7292fc45360d61.
>=20
> Simon,
>=20
> Yes, I agree.  I actually submitted the request to stable earlier
> today, so hopefully it gets added soon.

Ok, great. (I checked the stable patch queue, but didn't check the
mailing list archive).

> Have you experienced this hang?

Yes, it's affecting the kernel shipped by Qubes OS (see [1]).

Thanks, Simon.

[1]: https://github.com/QubesOS/qubes-issues/issues/3657


--jAv05fVE9GqNrG6iq4E36ns4Fw2mTx1hD--

--5u8trKVAeNy4LF1MR15s5bqCN9UIos27C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrY948ACgkQkO9xfO/x
ly9FHg//QOF2+kbnv9PmuOMSIPxmcg80tWRRkhsa9ZEqrFY5EB1OcTYy1bNfPAS+
frypECcQSl6M2G9eyB+aLFMWnEkndKEAQowIS2iXzqQp/O1y8CoO2Rhnr8u45Ft4
zSRiR+Y2b4tOIqpkjwuUUN9kyVcMYgdpCX4uGrIWl4o7fvaEOd2rbfwVXcfkGANR
TlwyED4FI1WgTq3rYl+WRC4lc1GvJMBl0lfwIGQFqnquj3yuOaLObDlJpEnJPRSz
yH4VCNsevrupxvy0xNJkOzIQmHH/0aHCnXarSMC5b1xGQaODHCm+N+NophaeN7h3
jgD1F6qZKT7BANQnyNDq0J2W2jRVLxD7uFFo5x/kXWuwaDUFJ1+yvIpPALYzAWzR
9UnvvNKXmr4p1FFa3yeqBi2zn7Lm8AHpT9qsMH/5Uhas9PU3hmawsEk8wflS9jtX
BZR34tmvVICAz/fFXJaN3+YK8HPrebcWz9TtAHCYNcD9vsc8B7A2fnVOxfWfrPc+
A1qZTC8HNtQB8KeNgwHMPQR/VHaq+fKFxcG9J4154KkAkmEkB5t2prjtT0Xo2tPo
8PZPVPz12K3eoeQU3ZwMkxle9k1dldN5R3d48fw5RpnLYY53arQhn+KzZR3wTEJx
iuu3aqUZy45QD1HWHNIN/lBgGZKaYQniuTVKY797+gx8b7aJl3k=
=Z+I/
-----END PGP SIGNATURE-----

--5u8trKVAeNy4LF1MR15s5bqCN9UIos27C--


--===============0311872970370268843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0311872970370268843==--
