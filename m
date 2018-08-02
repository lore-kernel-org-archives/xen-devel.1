From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
Date: Thu, 2 Aug 2018 03:54:40 +0200
Message-ID: <cf4b7770-712c-6438-3162-b62ef7824d7e@invisiblethingslab.com>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
 <20180801215425.GB1371@mail-itl>
 <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0674002785717623508=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xq7u=kr=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fl2vO-00009W-U5
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 02:01:11 +0000
In-Reply-To: <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0674002785717623508==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LVsLhR3WlhrB8KJfkA1nqNRWEEaSDNV4e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LVsLhR3WlhrB8KJfkA1nqNRWEEaSDNV4e
Content-Type: multipart/mixed; boundary="kQu8NPzB5S9SJjinPUZbwBGxqulM3zBjP";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <cf4b7770-712c-6438-3162-b62ef7824d7e@invisiblethingslab.com>
Subject: Re: [Xen-devel] [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
 <20180801215425.GB1371@mail-itl>
 <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>
In-Reply-To: <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>

--kQu8NPzB5S9SJjinPUZbwBGxqulM3zBjP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Simon Gaiser:
> Marek Marczykowski-G=C3=B3recki:
>> On Wed, Aug 01, 2018 at 10:36:26AM -0400, Jason Andryuk wrote:
>>> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
>>> <marmarek@invisiblethingslab.com> wrote:
>>>> This allows using arguments with spaces, like -append.
>>>> Stubdomain side of this require "xenstore-client: Add option for raw=

>>>> in-/output" commit.
>>>
>>> I had to look up \x1b - it is ascii escape.  Since I was on the
>>> www.asciitable.com, I saw \x1e is "record seperator" which might make=

>>> more sense.
>>
>> Simon, do you remember why you used \x1b? Otherwise indeed changing to=

>> \x1e would make sense.
>=20
> As far as I recall it's a mostly arbitrary choice. I think I choose 0x1=
b
> because I thought that ASCII escape would be very unlikely to ever
> appear in an cmdline. 0x00 would be even better but you don't want to
> handle 0x00 in bash. I'm not aware of a problem with 0x1e.

PS: If you follow the Wikipedia description [1] of the "separator"
control characters 0x1f would fit even better. But I don't think it
really matters what rare character we use.

[1]: https://en.wikipedia.org/wiki/C0_and_C1_control_codes#FS


--kQu8NPzB5S9SJjinPUZbwBGxqulM3zBjP--

--LVsLhR3WlhrB8KJfkA1nqNRWEEaSDNV4e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAltiZGEACgkQkO9xfO/x
ly/Zzw//b4qNPTUzCd2swKbgewGrhCRLtw8NCqvI2jO+WADgnOrhfCKo4H5VrZPv
m8vNDtParknA5aYrlmYPKnFi472qj3C0oKixWKjmozN/qNhRheRiOtVXo5JmqtPB
hi2lwA3li3lOdhuvhsFJSABbq+YDkJ5lmYPGnhKqjC/Q7dwqsoHYLzVeF5w9udeK
nCqucEjw4h/tGAmILFEwR7i6uwhdkeKMQ+5rNqang3RMXOUPuWwDWpGzQxRQyjGl
Cvwboucm9YydlVl5GeNTRu1N3SbQ+3lCY3XFWF646OTwofq+KJsj0M+ySeAf63uL
+IORAMkxE5jK622mWXlaDtrBI0Zb0hC+/a1cahzOdGaZmsUROalErl409Xneabp2
soo4TseSTmZrB60cQQLcmuIT4HQU2emZYV6LdStHvIjPqOTehVJX6kOtGzetWRaL
/mrImI3nCVsRvmkuEU+98CM23JmKSCc/UaIppaZMvb3dF5WaMChPz9j8SJ8z4xsy
7FiDrfKebUkbVS0llu8gSZlrGwZYgudlBYuvjiEN0nZxSmCnbj5gIbWQH1njvcn/
eBeCeeP63ucn+djEqUlFaM9xq2Sljdh27nZfp0xNaFCrJ7sFSUxzLdIEH2gfgkDQ
3IwFD5akttN41QBpyBqyBgI7jBT5w6Tfb3K/rPu1aJFA7O0/Y10=
=F7JP
-----END PGP SIGNATURE-----

--LVsLhR3WlhrB8KJfkA1nqNRWEEaSDNV4e--


--===============0674002785717623508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0674002785717623508==--
