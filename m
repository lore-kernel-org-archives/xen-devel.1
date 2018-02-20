From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xen: xenbus_dev_frontend: Fix
 XS_TRANSACTION_END handling
Date: Tue, 20 Feb 2018 04:56:00 +0000
Message-ID: <1d10edc6-8ad6-bc58-432c-d1867f0ab57a@invisiblethingslab.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <ea0630bd-5139-5f79-847c-f88f733b5053@suse.com>
 <1fbf69f9-f835-897e-144f-8c6f8b94cd26@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5744788804730938994=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ykbs=fo=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1enzzB-0005y1-Dr
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 04:57:01 +0000
In-Reply-To: <1fbf69f9-f835-897e-144f-8c6f8b94cd26@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5744788804730938994==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="BCNRGoU7u99MhOmENERYQD81uMIzqsj9q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BCNRGoU7u99MhOmENERYQD81uMIzqsj9q
Content-Type: multipart/mixed; boundary="UrcEycLHHCAXawABUXRgY4RJQDH6yYJTM";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: stable@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-kernel@vger.kernel.org
Message-ID: <1d10edc6-8ad6-bc58-432c-d1867f0ab57a@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xen: xenbus_dev_frontend: Fix XS_TRANSACTION_END
 handling
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <ea0630bd-5139-5f79-847c-f88f733b5053@suse.com>
 <1fbf69f9-f835-897e-144f-8c6f8b94cd26@suse.com>
In-Reply-To: <1fbf69f9-f835-897e-144f-8c6f8b94cd26@suse.com>

--UrcEycLHHCAXawABUXRgY4RJQDH6yYJTM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Juergen Gross:
> On 07/02/18 23:22, Simon Gaiser wrote:
>> Commit fd8aa9095a95 ("xen: optimize xenbus driver for multiple
>> concurrent xenstore accesses") made a subtle change to the semantic of=

>> xenbus_dev_request_and_reply() and xenbus_transaction_end().
>>
>> Before on an error response to XS_TRANSACTION_END
>> xenbus_dev_request_and_reply() would not decrement the active
>> transaction counter. But xenbus_transaction_end() has always counted t=
he
>> transaction as finished regardless of the response.
>=20
> Which is correct now. Xenstore will free all transaction related
> data regardless of the response. A once failed transaction can't
> be repaired, it has to be repeated completely.

So if xenstore frees the transaction why should we keep it in the list
with pending transaction in xenbus_dev_frontend? That's exactly what
this patch fixes by always removing it from the list, not only on a
successful response (See below for the EINVAL case).

[...]
>> But xenbus_dev_frontend tries to end a transaction on closing of the
>> device if the XS_TRANSACTION_END failed before. Trying to close the
>> transaction twice corrupts the reference count. So fix this by also
>> considering a transaction closed if we have sent XS_TRANSACTION_END on=
ce
>> regardless of the return code.
>=20
> A transaction in the list of transactions should not considered to be
> finished. Either it is not on the list or it is still pending.

With "considering a transaction closed" I mean "take the code path which
removes the transaction from the list with pending transactions".

=46rom the follow-up mail:
>>> The new behavior is that xenbus_dev_request_and_reply() and
>>> xenbus_transaction_end() will always count the transaction as finishe=
d
>>> regardless the response code (handled in xs_request_exit()).
>>
>> ENOENT should not decrement the transaction counter, while all
>> other responses to XS_TRANSACTION_END should still do so.
>=20
> Sorry, I stand corrected: the ENOENT case should never happen, as this
> case is tested in xenbus_write_transaction(). It doesn't hurt to test
> for ENOENT, though.
>=20
> What should be handled is EINVAL: this would happen if a user specified=

> a string different from "T" and "F".

Ok, I will handle those cases in xs_request_exit(). Although I don't
like that this depends on the internals of xenstore (At least to me it's
not obvious why it should only return ENOENT or EINVAL in this case).

In the xenbus_write_transaction() case checking the string before
sending the transaction (like the transaction itself is verified) would
avoid this problem.


--UrcEycLHHCAXawABUXRgY4RJQDH6yYJTM--

--BCNRGoU7u99MhOmENERYQD81uMIzqsj9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlqLqp8ACgkQkO9xfO/x
ly+XExAApdIgnsM6xkHjK8kBhDK57fz+xLyU6htNsOgamX4c94ZroOG3GhHXVGq0
zdyy/p/UCMwV/ySUfENZtbzzIj7uY+XJkgDBb5l/h39baok5AXGvBxch7AiFDTVp
MtgcgPYuBZwgtuIJiwF7HdrHyCQ+DurHQ9MRIxBeDesoJRNYfYHeady7QrPtBk4I
fZZ0n7SfTepI73h8mpnht8NWkwt8KgGFT6iJxItr7oqjbEC09lFRwvOddtX2zs5e
BGaDlgUAarrf8lFhy03BBJisGA8iWnlrxLRoLY1mS4WrBZDwyuLLSt1oswLE5J/w
yVYb3mnyABoEjZMw6nHnVBQmtPKzkyt9i/CSZFc31cqE+sPIvBBtoFZaS08m06Op
MHueVEaf1Gaa8LWZpen7vUhDd7bbxS/MioHu7Z354L1H7fRBEzLY59zMyvQPlpvw
5F6WPrFngrb1Q1qzH3FXt81MI8bnzGZj85SJXm5EOqxszMizHvpoF38aEI4p+Dv9
mRWKlNJC+GK93LAI8Bb6MclDb+F0cxlSWO32d4GDokJGJ45ZjRxJrZ5B9yWWalBp
3xsszLTBLx8+CH+IK09n2fCSqmUU4G17zSJqNiNciswpbpEmSNt4xyh44l/zHs9X
nWakkPtyXGuCbsY5ey0DpEk/gp/p8U+mwHrivWjuDI81mkwKBdo=
=3Gxv
-----END PGP SIGNATURE-----

--BCNRGoU7u99MhOmENERYQD81uMIzqsj9q--


--===============5744788804730938994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5744788804730938994==--
