From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Tue, 24 Apr 2018 10:43:09 -0500
Message-ID: <1e72b98a-5553-5990-2327-c86c75952e87@redhat.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
 <23263.17660.17771.980752@mariner.uk.xensource.com>
 <20180424151830.GI20310@redhat.com>
 <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2323275192548414927=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cepz=hn=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fB065-0001Q8-En
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 15:43:13 +0000
In-Reply-To: <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>
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
--===============2323275192548414927==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UH1yxr9BkEMy5b5h2w3SUW9Q97q4eyV5x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UH1yxr9BkEMy5b5h2w3SUW9Q97q4eyV5x
Content-Type: multipart/mixed; boundary="LVcktQ4BLgydvTgSIAq2uuCmeWEes1LFD";
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
Message-ID: <1e72b98a-5553-5990-2327-c86c75952e87@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup: Replace perror with
 error_report
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
 <23263.17660.17771.980752@mariner.uk.xensource.com>
 <20180424151830.GI20310@redhat.com>
 <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>
In-Reply-To: <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>

--LVcktQ4BLgydvTgSIAq2uuCmeWEes1LFD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/24/2018 10:40 AM, Eric Blake wrote:
> On 04/24/2018 10:18 AM, Daniel P. Berrang=C3=A9 wrote:
>=20
>>>  - static void vreport(report_type type, const char *fmt, va_list ap)=

>>>  + static void vreport(report_type type, int errnoval, const char *fm=
t, va_list ap)
>>> ...
>>>  +     if (errnoval >=3D 0) {
>>>  +         error_printf(": %s", strerror(errnoval);
>>>  +     }
>>>
>>> and then add both
>>>   error_report_errno
>>>   error_vreport_errno
>>> with the obvious semantics.
>>
>> That would be nice, because then we can make these two functions actua=
lly
>> use strerror_r() instead of strerror(), for thread safety on all platf=
orms.
>=20
> Except that strerror_r() is a bear to use portably, given that glibc's
> default declaration differs from the POSIX requirement (you can force
> glibc to give you the POSIX version, but doing so causes you to lose
> access to many other useful extensions).  It's rather telling that 'git=

> grep strerror_r' currently comes up empty.

That said, glib's g_strerror() may be suitable for this purpose,
although we are currently using it only in tests/ivshmem-test.c.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--LVcktQ4BLgydvTgSIAq2uuCmeWEes1LFD--

--UH1yxr9BkEMy5b5h2w3SUW9Q97q4eyV5x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrfUI0ACgkQp6FrSiUn
Q2rdBgf+LpmtzP5RgSpkhUpOM/gnsLjiItbCM87i3yHK2pISN7BQZDguL75ckv+G
mDKusBsKMsmodVymoNGwWICy6VnE7U33/yb/vFgDQug2VFVp5wQXCJFiPlFSYa2D
0knliVdIEIcAxsa3ldOFfSSsp8JKBxSfVl9AKp8f1C1hWb+SGg7MACmGi/+YKmOw
DAbpT0WCtT5GF5uWM8yX1LlpY3Iu0dtjQ5YZyx3oIPMLT2gk4C4pH0ANpnsQyQxO
6OI0L5GZoULp+ET9XS3SF14mkpPZkGic5S1xozUtrtAj87yw0U0Mz+eCzIhyeELb
0Uo5MQ1k6Bowk3UFne/yyiIYAHzhNg==
=czfD
-----END PGP SIGNATURE-----

--UH1yxr9BkEMy5b5h2w3SUW9Q97q4eyV5x--


--===============2323275192548414927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2323275192548414927==--
