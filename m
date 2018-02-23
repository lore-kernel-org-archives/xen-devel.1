From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] README: require Python 2.6 or newer
Date: Fri, 23 Feb 2018 09:41:46 -0600
Message-ID: <a86086fe-823e-9e0c-e7ae-6a0df8bd5f28@cardoe.com>
References: <20180222193458.17118-1-cardoe@cardoe.com>
 <5A8FE4FE02000078001AAC03@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4069275091330781960=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=39ug=fr=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1epFTt-0004og-9A
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:41:53 +0000
Received: by mail-yw0-x244.google.com with SMTP id d205so2914754ywe.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2018 07:41:51 -0800 (PST)
In-Reply-To: <5A8FE4FE02000078001AAC03@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4069275091330781960==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="vrlEMDBkjAyZVXmhFpPo3M3ifY7psWfBF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vrlEMDBkjAyZVXmhFpPo3M3ifY7psWfBF
Content-Type: multipart/mixed; boundary="EsPqTHRZzbmDZ0mk5Ls0VjQXWiZgtRBHN";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>
Message-ID: <a86086fe-823e-9e0c-e7ae-6a0df8bd5f28@cardoe.com>
Subject: Re: [PATCH] README: require Python 2.6 or newer
References: <20180222193458.17118-1-cardoe@cardoe.com>
 <5A8FE4FE02000078001AAC03@prv-mh.provo.novell.com>
In-Reply-To: <5A8FE4FE02000078001AAC03@prv-mh.provo.novell.com>

--EsPqTHRZzbmDZ0mk5Ls0VjQXWiZgtRBHN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/23/18 2:55 AM, Jan Beulich wrote:
>>>> On 22.02.18 at 20:34, <cardoe@cardoe.com> wrote:
>> Increase the minimum required Python to 2.6 or newer.
>>
>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>=20
> That's the easy half. Tool stack configure scripts will also want to
> be adjusted (see the thread rooted at
> https://lists.xenproject.org/archives/html/xen-devel/2017-09/msg02389.h=
tml).
>=20
> Jan
>=20

Oh I completely agree. I should have been more clear in my patch. I
meant this to be the conversation starter about what we saw as an
acceptable minimum version for the next release and then was going to
commit to a few series to modernize things a bit.

--=20
Doug Goldstein


--EsPqTHRZzbmDZ0mk5Ls0VjQXWiZgtRBHN--

--vrlEMDBkjAyZVXmhFpPo3M3ifY7psWfBF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqQNjpfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1ACxAArM5BLk75+K2SQm0A1hJZZ6KzEFXmKgt9wZnQ7G2sNsMd5CAa6BKDB/gU
ewo9lTgqU50rf/dFIhow6pQfqUvjnqbaIYO8P0tcA7dtEarUone045CE7ZNy8jeL
BFN2vD+4tq8+f0zkYBOx3W2EITXKahpQ5EfxO2VieqJPQHs1eDCMGgG8z/qVBV49
ZJzTHsJCVR/OWHWGXu56/UwzzThGoqZovxKHJf9lzfruDhd3gguzEKCem6J/e75L
EImllD7WJbuAilynjq4+aXUizDksghzqe3JNIQDwr1ccvMQ7XgLSwTa+Eb2rwGL8
VQJvCOZ4VjbH8CWG9RonnAcZpEYv0HTQC5cRbFR7yPxeFsgYs3GvW27nBavmVuUz
7qGJYgwofjccfotmAPg3zABG9Ew62qngX2a8TS0nH7S9nLzbH089SDYcPIYbqayJ
6KVVuKhXXk4PdtDEZ1XUXn5BIT88nb2gE6SkYjfFSUNcBLnXtygdmZfO6afct/Xc
tGEeRnlbSxIDmPfo/fgm9VIZ7nWG2zFymkBMIFjRlLBjBcxag+zGlp6c+dzSKtH+
8k1a6g5QiW6O6JFI/OTWrMhPv2u24MiliufTUCQGq+G3JmRn6Up/5nPHupDX1F6j
mzm4z9gY+Md0IXADWdhlDWpq26QVfKFe0W8qKgUu9WgwWBfGEXI=
=FvK9
-----END PGP SIGNATURE-----

--vrlEMDBkjAyZVXmhFpPo3M3ifY7psWfBF--


--===============4069275091330781960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4069275091330781960==--
