From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/6] xen: Add RING_COPY_RESPONSE()
Date: Mon, 30 Apr 2018 17:41:05 -0400
Message-ID: <cb0c0525-dac2-c26f-77ed-21128ecb623d__23384.2372698293$1525124232$gmane$org@oracle.com>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
 <ba8ed01b01a81d79f6d1c59e08a318dc0309a95d.1525122026.git-series.marmarek@invisiblethingslab.com>
 <7bd2ff07-9d29-8dea-6f55-5ff24ddd433c@oracle.com>
 <20180430212719.GF1124@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3448373459866330568=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpnp=ht=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDGV7-0002EP-Gi
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 21:38:25 +0000
In-Reply-To: <20180430212719.GF1124@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3448373459866330568==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vNzrufIOtU6vFxFMAPnjOdrkLyvUdqrgl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vNzrufIOtU6vFxFMAPnjOdrkLyvUdqrgl
Content-Type: multipart/mixed; boundary="V9HnKD6siNJ7JnWUPpd02LYyzf9t7aucO";
 protected-headers="v1"
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, stable@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <cb0c0525-dac2-c26f-77ed-21128ecb623d@oracle.com>
Subject: Re: [PATCH 1/6] xen: Add RING_COPY_RESPONSE()
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
 <ba8ed01b01a81d79f6d1c59e08a318dc0309a95d.1525122026.git-series.marmarek@invisiblethingslab.com>
 <7bd2ff07-9d29-8dea-6f55-5ff24ddd433c@oracle.com>
 <20180430212719.GF1124@mail-itl>
In-Reply-To: <20180430212719.GF1124@mail-itl>

--V9HnKD6siNJ7JnWUPpd02LYyzf9t7aucO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-US

T24gMDQvMzAvMjAxOCAwNToyNyBQTSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdy
b3RlOgo+IE9uIE1vbiwgQXByIDMwLCAyMDE4IGF0IDA1OjI1OjUyUE0gLTA0MDAsIEJvcmlz
IE9zdHJvdnNreSB3cm90ZToKPj4gQWxzbywgcGVyaGFwcyB0aGUgdHdvIGNhbiBiZSBjb2xs
YXBzZWQgdG9nZXRoZXIsIGFsb25nIHRoZSBsaW5lcyBvZgo+Pgo+PiAjZGVmaW5lIFJJTkdf
Q09QWV8oYWN0aW9uLCBfciwgX2lkeCwgX21zZykgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoMKgwqAgLyog
VXNlIHZvbGF0aWxlIHRvIGZvcmNlIHRoZSBjb3B5IGludG8gX21zZy4gKi/CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgwqDCoMKgICooX21zZykgPSAq
KHZvbGF0aWxlIHR5cGVvZihfbXNnKSlSSU5HX0dFVF8jI2FjdGlvbihfciwgX2lkeCk7wqDC
oCBcCj4+IH0gd2hpbGUgKDApCj4+Cj4+ICNkZWZpbmUgUklOR19DT1BZX1JFUVVFU1QoX3Is
IF9pZHgsIF9yZXEpwqAgUklOR19DT1BZXyhSRVFVRVNULCBfciwgX2lkeCwKPj4gX3JlcSkK
Pj4gI2RlZmluZSBSSU5HX0NPUFlfUkVTUE9OU0UoX3IsIF9pZHgsIF9yc3ApwqAgUklOR19D
T1BZXyhSRVNQT05TRSwgX3IsCj4+IF9pZHgsIF9yc3ApCj4+Cj4+Cj4+IChJIGhhdmUgbm90
IHRyaWVkIHRvIGNvbXBpbGUgdGhpcyBzbyBpdCBtYXkgd2VsbCBiZSB3cm9uZykKPiBJdCB3
b3JrcywgdGhhbmtzIDopCj4gSSdsbCB3YWl0IHdpdGggdjIgdW50aWwgSSBnZXQgZmVlZGJh
Y2sgb24gb3RoZXIgcGF0Y2hlcy4KPgoKCk9oLCBhbmQgb25lIG1vcmUgdGhpbmcgLS0tIHRo
ZSBjYW5vbmljYWwgdmVyc2lvbiBvZiB0aGlzIGZpbGUgbGl2ZXMgaW4KWGVuIChpbmNsdWRl
L3B1YmxpYy9pby9yaW5nLmgpIHNvIGl0IG5lZWRzIGZpcnN0IHRvIGJlIGFjY2VwdGVkIGJ5
IFhlbgptYWludGFpbmVycy4KCi1ib3Jpcwo=

--V9HnKD6siNJ7JnWUPpd02LYyzf9t7aucO--

--vNzrufIOtU6vFxFMAPnjOdrkLyvUdqrgl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAlrnjXEACgkQit52kIbK
wbIRvg/8Dud/7NIaJ+XBtdzL3C7Qu5zfGAM+8E0UATljwYRBiMlam9aKnu2Cycgv
SJEpVVJhDcAfCB93/rLeN9okwkJrqxpQcl9+8hghwsmbhM1+CM6YreFqzEc8iLJp
Ni0qu2HKq5Gp9z8Pdxw7/wq6GhWwHCRAwK6ODhshV+I9SdOX0qmaTdhPWttaj4iW
hs3+jQZr2t8rHWypPlx/RX43LENZVIdcOzwp6meYycxm1Hf6RZvHkj/RrP98m7jl
WDHZ3l+oQIE8Yht5FJF3YyoyWroUOMgYlIe5/Nogb8QpbbYN+9MnyejrbhXLkNTT
GM+nKe3lmPnc/JKnAPHMTM0sGAm5KpsN39Zsg4e985rZPitr+6B+Cu1qbGrWTjPc
xO8C45p9K62Mr+iD9dV6Le1UVoslhGeCNt8naw4E1rxZbI1d+dDknV0ZAaI+MO+s
wV3TooUX3vhD8UTbYUy9j44qAfqfI+J0PYSpxJa51jqmgXntdKfrOvKuDdfGz04+
GeIr02KaxJ6cA907+Dqkqq372XuBFjdpbAzxq33nMnkt0lvsMJWHmBJddTwTwZ9l
yEu0UCmd4N/re09vYNqelzrjz+3T7Sjg+Wk995xdZZcR7FF+oPTLUU6zuIx0IoYS
+5Sp1huBpR0g4z9G8zznauXXjBGJoWF/04SnnJ3XzkGO1ayl5NU=
=VPEN
-----END PGP SIGNATURE-----

--vNzrufIOtU6vFxFMAPnjOdrkLyvUdqrgl--


--===============3448373459866330568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3448373459866330568==--
