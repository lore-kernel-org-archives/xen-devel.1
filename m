From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Tue, 24 Apr 2018 10:40:47 -0500
Message-ID: <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
 <23263.17660.17771.980752@mariner.uk.xensource.com>
 <20180424151830.GI20310@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8090971530676088213=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cepz=hn=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fB03n-0001IU-D4
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 15:40:51 +0000
In-Reply-To: <20180424151830.GI20310@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair.francis@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8090971530676088213==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fmYDIuWfduDk9WEwCPmLVKeDUzgSDn7Re"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fmYDIuWfduDk9WEwCPmLVKeDUzgSDn7Re
Content-Type: multipart/mixed; boundary="GyiGjqzIibE0oZ4VEnQQzKCrqOLkCkdhS";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup: Replace perror with
 error_report
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
 <23263.17660.17771.980752@mariner.uk.xensource.com>
 <20180424151830.GI20310@redhat.com>
In-Reply-To: <20180424151830.GI20310@redhat.com>

--GyiGjqzIibE0oZ4VEnQQzKCrqOLkCkdhS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/24/2018 10:18 AM, Daniel P. Berrang=C3=A9 wrote:

>>  - static void vreport(report_type type, const char *fmt, va_list ap)
>>  + static void vreport(report_type type, int errnoval, const char *fmt=
, va_list ap)
>> ...
>>  +     if (errnoval >=3D 0) {
>>  +         error_printf(": %s", strerror(errnoval);
>>  +     }
>>
>> and then add both
>>   error_report_errno
>>   error_vreport_errno
>> with the obvious semantics.
>=20
> That would be nice, because then we can make these two functions actual=
ly
> use strerror_r() instead of strerror(), for thread safety on all platfo=
rms.

Except that strerror_r() is a bear to use portably, given that glibc's
default declaration differs from the POSIX requirement (you can force
glibc to give you the POSIX version, but doing so causes you to lose
access to many other useful extensions).  It's rather telling that 'git
grep strerror_r' currently comes up empty.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--GyiGjqzIibE0oZ4VEnQQzKCrqOLkCkdhS--

--fmYDIuWfduDk9WEwCPmLVKeDUzgSDn7Re
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrfT/8ACgkQp6FrSiUn
Q2oaZAf/SxDhoSZ/QNAqJkm7aiSEIriAtOUYIWB4oT9Pb8JOMx6qJxz3SrjtBwfk
xtkyMbBBxsn57PqHVUnFqc3f14BhZr0RvBMWoE0wMpBMyCqKmw8+1t9HVr5zRIpB
Z/6qJCfgAYPiZ1+ZDB2Ik2yFyoSFUro16lkrFXw51FZSm6Kt4Egy9HNsmzdaMQrB
lS4bWR3wbA8n7ypL2ZTgN943dFx3XeTMRZ3nUbY8GV0HoWWayOdCISBGdUVY/NMp
VvidvAXNvMf1B46a5IPNUYK2Q7WnGQiTnFRPfFzj6xAWPnsRLm6p/+ItXn2bUcHm
dHNXTB7+7YRF7zSFmPaLkM9nXXLXlQ==
=9Suj
-----END PGP SIGNATURE-----

--fmYDIuWfduDk9WEwCPmLVKeDUzgSDn7Re--


--===============8090971530676088213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8090971530676088213==--
