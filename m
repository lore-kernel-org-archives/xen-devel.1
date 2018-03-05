From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] xl: remove apic option for PVH guests
Date: Mon, 5 Mar 2018 08:43:48 -0600
Message-ID: <6e1a0fe7-b27e-cdbb-e4b3-4e775e781c01@cardoe.com>
References: <20180228102053.1838-1-roger.pau@citrix.com>
 <20180301122205.bopopnky7n55zdmo@citrix.com>
 <7cb0df11-35a4-86fc-b475-e8a8c71102e7@citrix.com>
 <20180301160123.b5psgx5pjkvxkprh@citrix.com>
 <20180301170155.tzemvvsx6sgt2kob@MacBook-Pro-de-Roger.local>
 <20180302110929.tu2hdqa2jxpyzm2z@citrix.com>
 <5A9943A402000078001ADBD0@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7758051722202201067=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gpjw=f3=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1esrKa-0007ZL-0P
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 14:43:12 +0000
Received: by mail-yw0-x22d.google.com with SMTP id p70so5677616ywg.10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 06:43:10 -0800 (PST)
In-Reply-To: <5A9943A402000078001ADBD0@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7758051722202201067==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="bqU5t4WIQcAcNV51xbTg1acFFTbhaR2rs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bqU5t4WIQcAcNV51xbTg1acFFTbhaR2rs
Content-Type: multipart/mixed; boundary="aBkOLtlVtSg9RQRFQNMC76kKEJR2LZs0l";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <6e1a0fe7-b27e-cdbb-e4b3-4e775e781c01@cardoe.com>
Subject: Re: [Xen-devel] [PATCH] xl: remove apic option for PVH guests
References: <20180228102053.1838-1-roger.pau@citrix.com>
 <20180301122205.bopopnky7n55zdmo@citrix.com>
 <7cb0df11-35a4-86fc-b475-e8a8c71102e7@citrix.com>
 <20180301160123.b5psgx5pjkvxkprh@citrix.com>
 <20180301170155.tzemvvsx6sgt2kob@MacBook-Pro-de-Roger.local>
 <20180302110929.tu2hdqa2jxpyzm2z@citrix.com>
 <5A9943A402000078001ADBD0@prv-mh.provo.novell.com>
In-Reply-To: <5A9943A402000078001ADBD0@prv-mh.provo.novell.com>

--aBkOLtlVtSg9RQRFQNMC76kKEJR2LZs0l
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/2/18 5:29 AM, Jan Beulich wrote:
>>>> On 02.03.18 at 12:09, <wei.liu2@citrix.com> wrote:
>> On Thu, Mar 01, 2018 at 05:01:55PM +0000, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Mar 01, 2018 at 04:01:23PM +0000, Wei Liu wrote:
>>>> On Thu, Mar 01, 2018 at 03:57:18PM +0000, Andrew Cooper wrote:
>>>>> On 01/03/18 12:22, Wei Liu wrote:
>>>>>> On Wed, Feb 28, 2018 at 10:20:53AM +0000, Roger Pau Monne wrote:
>>>>>>> XSA-256 forces the local APIC to always be enabled for PVH guests=
, so
>>>>>>> ignore any apic option for PVH guests. Update the documentation
>>>>>>> accordingly.
>>>>>> I think how I will approach this is to dictate that PVH always has=
 LAPIC
>>>>>> in our in-tree document, then use that as the justification for th=
is
>>>>>> change. That's the consensus from 2 years ago, right?
>>>>>>
>>>>>> Or we're just working around the limitation in our code base, and =
users
>>>>>> may demand a no-LAPIC PVH guest just because...
>>>>>
>>>>> Currently, Xen enforces that HVM guests have an LAPIC.  This is bec=
ause
>>>>> making the non-LAPIC case function correctly/safely devolved into a=

>>>>> massive rats nest and I stopped trying to fix it after 2 days of tr=
ying.
>>>>>
>>>>> At the moment, it would be wise to discuss whether the non-LAPIC ca=
se is
>>>>> actually sensible.  I personally see no value in keeping it.
>>>>>
>>>>
>>>> +1
>>>>
>>>>> If someone can come up with a convincing usecase for keeping it, th=
en
>>>>> ok, but the barrier for this is increasing all the time, especially=
 now
>>>>> that hardware acceleration and posted interrupts means that a
>>>>> pipeline-virtualised APIC is faster and more efficient than any of =
our
>>>>> event channel mechanisms.
>>>>
>>>> +1
>>>
>>> I've looked at the in-tree pvh document and it just refers to the loc=
al
>>> APIC in this sentence:
>>>
>>> "AP startup can be performed using hypercalls or the local APIC if pr=
esent."
>>>
>>> I guess the trailing "if present" could be removed, but it's not
>>> colliding with this patch.
>>>
>>> I'm happy with rebasing this patch and applying the above change, is
>>> there any other document that should be changed?
>>
>> Can we make it more explicit. Like
>>
>>   VCPUs for PVH must have local APIC and it can't be disabled.
>>
>> ?
>=20
> To be honest I liker Roger's suggestion better. And yet better
> would imo be if we left that sentence alone, unless we really mean
> to close that road for anyone wanting to take on making APIC-
> less guests work securely.
>=20
> Jan

I believe that's exactly what Andrew proposed in
https://lists.xenproject.org/archives/html/xen-devel/2018-03/msg00089.htm=
l
removing the wording doesn't exclude someone from adding it later but it
does make it clear that its not available today.

--=20
Doug Goldstein


--aBkOLtlVtSg9RQRFQNMC76kKEJR2LZs0l--

--bqU5t4WIQcAcNV51xbTg1acFFTbhaR2rs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqdV6RfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1qMA//bkwANuW2eZzS3SkqldB5AEj3KkMuHK26V0C/jTMAVyNn688GzkEkkrSQ
U/tz30dDvayneKxgqP5yVJXb8RddtgwVvqFXKa+t8GrzMxdvOVuJaOWksuyEzU83
tFnMavjWpope25sO+gwgSpXXehadjpWmuVRRhd5EVK740cONjV3xDUdpJo2yxiS5
G8Q7vmJ77wNNYKkuQKTVLB6n297uZBlLUqLZV2dv1YHWv70WHcHe7fb0xNqgMHAT
oV92xyRq8V8Bp5V4bh5f1xTu/UmY/9utiDyXXf6i74bGOZy9IKKrySY+iAiLhtsg
Oc2XtnC/Mi3zWUQ1X8zxMdNsiVGUP/Odlc1bYs+8UV8DGMCf5Gm89SG1o4BWPUor
DbWhmds684Hr1wUFBcijJvPmhqBHc8b2vbmPFfLGwl1/6d9pBoet3JQ2QJTa5XpN
7ZKFcigC4NLTik++7sEqD6SnY1aHmxWYuEmdwIUnxL2VpTK6g1t+/OOFkJWYxZWK
Xd+Ak4x6PI5ieGHg+R87OlUEeidgp+OZ0r5rPQrsSrcFKjil4JF+4U0z4PlyVAYG
3kPS8Ntu8rdKKAVIb7umRgzx7hkygAY3JbxaQLZbxrfL2Y5K0G29zRBdMMww71y+
ZqUF9CnAEjW0TPnCGzYPIo2/E9vhDRNtG24F1djx6hIWDuBEvqw=
=K/nl
-----END PGP SIGNATURE-----

--bqU5t4WIQcAcNV51xbTg1acFFTbhaR2rs--


--===============7758051722202201067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7758051722202201067==--
