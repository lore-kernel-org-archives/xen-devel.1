From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Tue, 9 Jan 2018 11:49:55 -0600
Message-ID: <819ffe6b-6399-507c-4e31-2f0babb49684@cardoe.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CAFLBxZbsNZR5h1a9aCHZwMs7xiq6_qOs+2Ptj4A7qWTtNqE6iA@mail.gmail.com>
 <alpine.DEB.2.10.1801090821190.4603@sstabellini-ThinkPad-X260>
 <CA+aC4kuWr00CmQeLAh0szYZDdNRCWBLSqu65TaQ1hBWTuXcnFA@mail.gmail.com>
 <5A550AF5020000780019CDF4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4902442378489131634=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2je3=ee=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eYy2E-0002Qj-RP
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 17:50:03 +0000
Received: by mail-yb0-x233.google.com with SMTP id b18so2936363ybn.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 09:50:01 -0800 (PST)
In-Reply-To: <5A550AF5020000780019CDF4@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Anthony Liguori <anthony@codemonkey.ws>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <dunlapg@umich.edu>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, committers@xenproject.org, security@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4902442378489131634==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="djxSGm5w39m8sKeyAH6e3BLwvVakYgBWY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--djxSGm5w39m8sKeyAH6e3BLwvVakYgBWY
Content-Type: multipart/mixed; boundary="MfNw7Ccw7KcpUSnqhzhkbDET4ORXTRrgd";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Jan Beulich <JBeulich@suse.com>, Anthony Liguori <anthony@codemonkey.ws>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <dunlapg@umich.edu>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Rich Persaud <persaur@gmail.com>, committers@xenproject.org,
 security@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <819ffe6b-6399-507c-4e31-2f0babb49684@cardoe.com>
Subject: Re: [Xen-devel] Radical proposal: ship not-fully-tidied shim as
 4.10.1
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CAFLBxZbsNZR5h1a9aCHZwMs7xiq6_qOs+2Ptj4A7qWTtNqE6iA@mail.gmail.com>
 <alpine.DEB.2.10.1801090821190.4603@sstabellini-ThinkPad-X260>
 <CA+aC4kuWr00CmQeLAh0szYZDdNRCWBLSqu65TaQ1hBWTuXcnFA@mail.gmail.com>
 <5A550AF5020000780019CDF4@prv-mh.provo.novell.com>
In-Reply-To: <5A550AF5020000780019CDF4@prv-mh.provo.novell.com>

--MfNw7Ccw7KcpUSnqhzhkbDET4ORXTRrgd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/9/18 11:33 AM, Jan Beulich wrote:
>>>> On 09.01.18 at 18:23, <anthony@codemonkey.ws> wrote:
>> On Tue, Jan 9, 2018 at 8:52 AM, Stefano Stabellini
>> <sstabellini@kernel.org> wrote:
>>> On Tue, 9 Jan 2018, George Dunlap wrote:
>>>> On Mon, Jan 8, 2018 at 9:01 PM, Rich Persaud <persaur@gmail.com> wro=
te:
>>>>> On a similarly pragmatic note: would a variation of Anthony's vixen=
 patch=20
>> series be suitable for pre-PVH Xen 4.6 - 4.9?  These versions are curr=
ently=20
>> documented as security-supported (Oct 2018 - July 2020).
>>>>
>>>> Hmm, Ian's mail seems to be focusing on the idea of checking in a
>>>> non-polished series to 4.10, rather than exctly what the content of
>>>> that series would be.
>>>>
>>>> In the IRL conversation that preceeded this mail, the new short-term=

>>>> target we discussed was:
>>>> 1. A 4.10-based shim that could boot either under HVM or PVH
>>>> 2. A script that would take an existing PV config, and spit out a) a=

>>>> bootable ISO with the shim & whatever was needed, and b) a new confi=
g
>>>> that would boot the same VM, but in HVM mode with the shim
>>>>
>>>> The script + a 4.10 shim binary *should* allow most PV guests to boo=
t
>>>> without any changes whatsoever for most older versions of Xen.
>>>>
>>>> There are a number of people for whom this won't work; I think we al=
so
>>>> need to provide a way to transparently change PV guests into PVshim
>>>> guests.  But that will necessarily involve significant toolstack
>>>> functionality, at which point you might as well backport PVH as well=
=2E
>>>
>>> Yes, there will be a number of people that won't be covered by this f=
ix,
>>> including those that can't use HVM/PVH mode because VT-x isn't availa=
ble
>>> at all in their environment. That is the only reason to run PV today.=

>>> Providing a way to transparently change PV guests into PVshim guests
>>> won't cover any of these cases. A more complete workaround to SP3 is
>>> along the lines of https://marc.info/?l=3Dxen-devel&m=3D1515097406256=
90.
>>>
>>> That said, I realize that we are only trying to do the best we can in=
 a
>>> very difficult situation, with very little time in our hands. I agree=

>>> with Ian that we should commit something unpolished and only partiall=
y
>>> reviewed soon, even though it doesn't cover a good chunk of the userb=
ase
>>> for one reason or another. Even if migration doesn't work, it will st=
ill
>>> help all that don't require it. It is only a partial fix by nature
>>> anyway.
>>
>> Can people be a bit more explicit about what they think should be done=
 here?
>>
>> I'm happy to redirect effort to PVH shim if that's what the solution
>> is going to be.
>>
>> I obviously prefer the HVM approach as it works on a broad range of Xe=
n=20
>> versions
>> without modification but I'm keen to get something done quickly and
>> don't want to
>> waste effort.
>=20
> From what I've read today, I have no reason to believe the PVH
> shim won't work in HVM mode. How would the HVM-only approach
> be better in that case?
>=20
> Jan

I feel like I should state the obvious here. Its tested over a large
data set.
--=20
Doug Goldstein


--MfNw7Ccw7KcpUSnqhzhkbDET4ORXTRrgd--

--djxSGm5w39m8sKeyAH6e3BLwvVakYgBWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpVAMZfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl2qEg//SdbM8Cg2dY2LziXj2ptw/KkVJg1MzRW7OFjdYWH3VO/yWUEhOXCBemlG
wTeMv+R9CYfOof0dKjb+jX3VXPH7xBCTqnxiRa/AfgCShwdoNcyiuDtGnJx//kWR
E4YlH3t/I/tKi8nC/fHtSx+qp44KwHTETD8ImYwGPjbPp3JMomKYO7lJ55erCh4k
Y04a0S33g8wt81wzUqP3vQON4VjErRjRG0urh0kILf+VH1KGPNwXRdIeYaqHS8rx
tpal6XjlnF0eTDTdKIul7GX74WAMRV7jKx/Qeag0BQQg+83ky+IBsHt6QPWrryfA
L36wvIddVU8fd9P6HYZA4GzNJIFqP0wCgxsIG/DOfX0F9OqfKR/3QiBWDMpoWgDK
0En488pXCbccrqyyyelZAQ6ZJ2hMLpl9KMhHd2UqsaEP23CBV9pTN6lUpMfzs+Si
+OX1uiT6EjJQe5wQQPNHyEyRgLMMoTVmOG1ZzQU7FolxF+huOPmHtyXBYu0r4Exc
LgGA2tqKZewSCzJRhAK7kgnai9ZawaORbZkUQejIDzYt++A8PggJBdaIt3IN++Gd
ew5/nPmIVpJMH9WKQS0D8VXOLq5aoNIAcxARMRFBPkOKf2amQq6FGnXs5EgCI76r
xg86ovHekD3M0Wc+VCz2NaBZ5+NN32HG+6MC8aRQqHghc4C/nCs=
=Bav9
-----END PGP SIGNATURE-----

--djxSGm5w39m8sKeyAH6e3BLwvVakYgBWY--


--===============4902442378489131634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4902442378489131634==--
