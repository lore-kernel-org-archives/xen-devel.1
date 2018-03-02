From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xen: xenbus_dev_frontend: Fix
 XS_TRANSACTION_END handling
Date: Fri, 02 Mar 2018 14:58:00 +0000
Message-ID: <d69513ba-2151-c20e-9d99-c034af52e7d3__9406.10263865001$1520002617$gmane$org@invisiblethingslab.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <ea0630bd-5139-5f79-847c-f88f733b5053@suse.com>
 <1fbf69f9-f835-897e-144f-8c6f8b94cd26@suse.com>
 <1d10edc6-8ad6-bc58-432c-d1867f0ab57a@invisiblethingslab.com>
 <2263ddf3-54f6-d81e-7674-d0ae0802aa65@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7460535145459081298=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=07i6=fy=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1erm8S-0004a1-2C
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 14:58:12 +0000
In-Reply-To: <2263ddf3-54f6-d81e-7674-d0ae0802aa65@suse.com>
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
--===============7460535145459081298==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="4Ta7kYTBOA8H9GpsR5KFPcEvJnuPk3LU2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4Ta7kYTBOA8H9GpsR5KFPcEvJnuPk3LU2
Content-Type: multipart/mixed; boundary="LAegF8IqMdDleZhiKI20Qky4eFwkvh4Z7";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: stable@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-kernel@vger.kernel.org
Message-ID: <d69513ba-2151-c20e-9d99-c034af52e7d3@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xen: xenbus_dev_frontend: Fix XS_TRANSACTION_END
 handling
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <ea0630bd-5139-5f79-847c-f88f733b5053@suse.com>
 <1fbf69f9-f835-897e-144f-8c6f8b94cd26@suse.com>
 <1d10edc6-8ad6-bc58-432c-d1867f0ab57a@invisiblethingslab.com>
 <2263ddf3-54f6-d81e-7674-d0ae0802aa65@suse.com>
In-Reply-To: <2263ddf3-54f6-d81e-7674-d0ae0802aa65@suse.com>

--LAegF8IqMdDleZhiKI20Qky4eFwkvh4Z7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Juergen Gross:
> On 20/02/18 05:56, Simon Gaiser wrote:
>> Juergen Gross:
>>> On 07/02/18 23:22, Simon Gaiser wrote:
>>>> Commit fd8aa9095a95 ("xen: optimize xenbus driver for multiple
>>>> concurrent xenstore accesses") made a subtle change to the semantic =
of
>>>> xenbus_dev_request_and_reply() and xenbus_transaction_end().
>>>>
>>>> Before on an error response to XS_TRANSACTION_END
>>>> xenbus_dev_request_and_reply() would not decrement the active
>>>> transaction counter. But xenbus_transaction_end() has always counted=
 the
>>>> transaction as finished regardless of the response.
>>>
>>> Which is correct now. Xenstore will free all transaction related
>>> data regardless of the response. A once failed transaction can't
>>> be repaired, it has to be repeated completely.
>>
>> So if xenstore frees the transaction why should we keep it in the list=

>> with pending transaction in xenbus_dev_frontend? That's exactly what
>> this patch fixes by always removing it from the list, not only on a
>> successful response (See below for the EINVAL case).
>=20
> Aah, sorry, I seem to have misread my own coding. :-(
>=20
> Yes, you are right. Sorry for not seeing it before.
>=20
>>
>> [...]
>>>> But xenbus_dev_frontend tries to end a transaction on closing of the=

>>>> device if the XS_TRANSACTION_END failed before. Trying to close the
>>>> transaction twice corrupts the reference count. So fix this by also
>>>> considering a transaction closed if we have sent XS_TRANSACTION_END =
once
>>>> regardless of the return code.
>>>
>>> A transaction in the list of transactions should not considered to be=

>>> finished. Either it is not on the list or it is still pending.
>>
>> With "considering a transaction closed" I mean "take the code path whi=
ch
>> removes the transaction from the list with pending transactions".
>>
>> From the follow-up mail:
>>>>> The new behavior is that xenbus_dev_request_and_reply() and
>>>>> xenbus_transaction_end() will always count the transaction as finis=
hed
>>>>> regardless the response code (handled in xs_request_exit()).
>>>>
>>>> ENOENT should not decrement the transaction counter, while all
>>>> other responses to XS_TRANSACTION_END should still do so.
>>>
>>> Sorry, I stand corrected: the ENOENT case should never happen, as thi=
s
>>> case is tested in xenbus_write_transaction(). It doesn't hurt to test=

>>> for ENOENT, though.
>>>
>>> What should be handled is EINVAL: this would happen if a user specifi=
ed
>>> a string different from "T" and "F".
>>
>> Ok, I will handle those cases in xs_request_exit(). Although I don't
>> like that this depends on the internals of xenstore (At least to me it=
's
>> not obvious why it should only return ENOENT or EINVAL in this case).
>>
>> In the xenbus_write_transaction() case checking the string before
>> sending the transaction (like the transaction itself is verified) woul=
d
>> avoid this problem.
>=20
> Right. I'd prefer this solution.
>=20
> Remains the only problem you tried to tackle with your second patch: a
> kernel driver going crazy and ending transactions it never started (or
> ending them multiple times). The EINVAL case can't happen here, but
> ENOENT can. Either ENOENT has to be handled in xs_request_exit() or you=

> need to keep track of the transactions like in the user interface and
> refuse ending an unknown transaction. Or you trust the kernel users.
> Trying to fix the usage counter seems to be the wrong approach IMO.

The point of the second patch was to detect such bugs. This would have
saved quite some time to find this bug. I added the "fix" of the counter
I just because it was trivial after having the if there.

Adding tracking seems to be a quite complex solution for a _potential_
problem.

So I would go with checking ENOENT in xs_request_exit(). Should this be
WARN_ON_ONCE()? Since this normally should not happen I would say yes.

Should I keep the reference counter sanity check? And if yes, with the
"fix" to the counter?


--LAegF8IqMdDleZhiKI20Qky4eFwkvh4Z7--

--4Ta7kYTBOA8H9GpsR5KFPcEvJnuPk3LU2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlqZZooACgkQkO9xfO/x
ly9S4BAAwy8JKovMic3Tp9zH1u6AwbzDhjizIbVaHAGD7nzECIRSWCR1G7zLkT9k
1TllEcOKx/85UaxJXoJekgwP3M8xggMeTH6YvWJrtmyiu9giSwi8vSEtIQyv4Rbr
DUfo+Frr+2h21v20rPJbWJCZ+IYCpApnwfrIfChEGpVG/JHOUfZzVvDuU8fNcvFJ
5wunEaNiWuAWuN2d1bnGkZnLyWtFU220mNx+D/L664L6M0Od1ZOa/dCeQodCMY5H
rNkTOAiRFeblQ+QCsAGJQKb2TBay0YXPF15KupBr50/AwyHUVKPjMxA8MivkKgaD
APdv06Gml2PZLs/ikC6jCObQ1Jl+4q8lzCUZzwXMKKhKsN4jja5oPcogjVlfgr+H
JQyMTtgmZSNxQmDTJAH8yaHGxAzCFqsiq+tHq+fhDGX5WXc9NFh5UuZZvPAll4Fi
eSIoDKgSutPS+bmaRfy8XFe9bsnTUecqoSVTkn/Z3ArNEJ8pvZwsa84R5OYVUpJk
O93xyjJAay4P1AMZ0gUdWcycmag8nsIdxFYIVjGTjzzoTb24Dc3c6Sa9Ld3LYXgq
n3B4ZZoV+Km+gD2xNaV6CPvmYzWTY8nAXWlpyyDlJ46a6fnXCtBx/qD1AlLoC92W
QX/vfmTnPwa/abSexo5CRjIAUdD+/9vVROwXS0GWoCqjC90VtF0=
=pQo9
-----END PGP SIGNATURE-----

--4Ta7kYTBOA8H9GpsR5KFPcEvJnuPk3LU2--


--===============7460535145459081298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7460535145459081298==--
