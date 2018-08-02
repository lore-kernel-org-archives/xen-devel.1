From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
Date: Thu, 2 Aug 2018 03:45:55 +0200
Message-ID: <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
 <20180801215425.GB1371@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2225335274414510025=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xq7u=kr=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fl355-00011D-PG
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 02:11:11 +0000
In-Reply-To: <20180801215425.GB1371@mail-itl>
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
--===============2225335274414510025==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="B05N4EaGicYyCFxTS3puMZB5AV9yV4pqN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B05N4EaGicYyCFxTS3puMZB5AV9yV4pqN
Content-Type: multipart/mixed; boundary="X0Wv7UIR4nZsez6vllK96OsXF3mvv6ZS7";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <ed52399e-81a7-a603-e20b-a33fc165f44c@invisiblethingslab.com>
Subject: Re: [Xen-devel] [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuL1kr6GdvvVaivxo_78e7PnTaWsk6JhuC7kfB8aZ-yxw@mail.gmail.com>
 <20180801215425.GB1371@mail-itl>
In-Reply-To: <20180801215425.GB1371@mail-itl>

--X0Wv7UIR4nZsez6vllK96OsXF3mvv6ZS7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Marek Marczykowski-G=C3=B3recki:
> On Wed, Aug 01, 2018 at 10:36:26AM -0400, Jason Andryuk wrote:
>> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
>> <marmarek@invisiblethingslab.com> wrote:
>>> This allows using arguments with spaces, like -append.
>>> Stubdomain side of this require "xenstore-client: Add option for raw
>>> in-/output" commit.
>>
>> I had to look up \x1b - it is ascii escape.  Since I was on the
>> www.asciitable.com, I saw \x1e is "record seperator" which might make
>> more sense.
>=20
> Simon, do you remember why you used \x1b? Otherwise indeed changing to
> \x1e would make sense.

As far as I recall it's a mostly arbitrary choice. I think I choose 0x1b
because I thought that ASCII escape would be very unlikely to ever
appear in an cmdline. 0x00 would be even better but you don't want to
handle 0x00 in bash. I'm not aware of a problem with 0x1e.


--X0Wv7UIR4nZsez6vllK96OsXF3mvv6ZS7--

--B05N4EaGicYyCFxTS3puMZB5AV9yV4pqN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAltiYlgACgkQkO9xfO/x
ly/nPA/9GVaC6ujcv7qv2yD35m+oh0iAayuwEda+BDpKcEW8D9HoFSF/ziX8m7To
UqQm0tNNLrqDLoyMBQ+zjtGiBG3ZySzuts1U1aKnw55r/lb2UVIPCX6WXdHAAVBi
x+jsf3Ks6v8qjhYYSvWJx1DqBYKnWjOUyeUbTm6QxgF574Ftufs8v1Ev5tILfeVf
d1IQ2PBUEowtNDgKPyHYfCqSISIhgESdPMLnVjUtnqUavRfylAr7u7DRONvz7Cpf
aljkypJDk71Zit6I0RZpYal0KxaPb/9jxqhwQSb6vfsJDjgRMAD6COvL0ted+Uzx
F0d6Rq4Y7dNgbUfvyFmg6bMQLe81S89DBEVRLX0sWbHVc7E2UrhDMawwxncgNN+9
5cLZKp2UwxZGxitUvnHvYjO3l60sjuRQsv1OQqVH4yJvxLH6Y8GnzXbyOXb0oRuA
HlGzQbX7KkT9im2fB5XXtLyj9SXjDh6uAdYIZup172fKqf7q0t8DE84g3WtUkJ/H
TbW5GQz5XkOhunlHgxYnYXKlFZjHCElllO2Pi9v6wckhnNSXTZm0ug8ZX8Cm0B2s
pAUIbk+joSCes6Abk1e+Fn5hKQVo7ztyBbEXugdjASGWT1ajenZhcz+V//NerxHi
/jeWEGJjDr8Y6xeojlTDG9BIPv2h/5WmLssvWH4aTL0aqiv0viE=
=ThcM
-----END PGP SIGNATURE-----

--B05N4EaGicYyCFxTS3puMZB5AV9yV4pqN--


--===============2225335274414510025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2225335274414510025==--
