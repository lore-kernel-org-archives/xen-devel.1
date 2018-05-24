From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Thu, 24 May 2018 13:39:00 +0000
Message-ID: <7b2654ea-338b-86da-4d0c-25bbd948251f@invisiblethingslab.com>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <20180518153344.GC11683@mail-itl>
 <5AFEF73D02000078001C425D@prv1-mh.provo.novell.com>
 <20180518161925.GE11683@mail-itl>
 <CAFLBxZagWwUe-wJ-f7B9KZSTYWfqta71w3GWcz=djbLZiODKHQ@mail.gmail.com>
 <f6449427-16b7-3868-4948-f5b4c533d9ea@invisiblethingslab.com>
 <5B06BAFE02000078001C58FB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8499601632906599073=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B06BAFE02000078001C58FB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8499601632906599073==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="tP4h0H55wRzNEJevpIE0V23kwu7bIOq1Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tP4h0H55wRzNEJevpIE0V23kwu7bIOq1Z
Content-Type: multipart/mixed; boundary="SNDEqQWeSKd3kw3yTvuYVIsJ5QTERdn8l";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 xen-devel <xen-devel@lists.xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <dunlapg@umich.edu>
Message-ID: <7b2654ea-338b-86da-4d0c-25bbd948251f@invisiblethingslab.com>
Subject: Re: [Xen-devel] Test for osstest, features used in Qubes OS
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <20180518153344.GC11683@mail-itl>
 <5AFEF73D02000078001C425D@prv1-mh.provo.novell.com>
 <20180518161925.GE11683@mail-itl>
 <CAFLBxZagWwUe-wJ-f7B9KZSTYWfqta71w3GWcz=djbLZiODKHQ@mail.gmail.com>
 <f6449427-16b7-3868-4948-f5b4c533d9ea@invisiblethingslab.com>
 <5B06BAFE02000078001C58FB@prv1-mh.provo.novell.com>
In-Reply-To: <5B06BAFE02000078001C58FB@prv1-mh.provo.novell.com>

--SNDEqQWeSKd3kw3yTvuYVIsJ5QTERdn8l
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
>>>> On 23.05.18 at 00:21, <simon@invisiblethingslab.com> wrote:
>> I have done some more testing in the meantime. The issue also affect
>> 4.10.1, but not 4.10.0. That's useful since it makes the bisect shorte=
r.
>> A bisect identifies 8462c575d9 "x86/xpti: Hide almost all of .text and=

>> all .data/.rodata/.bss mappings" as the commit which breaks suspend.
>>
>> 8462c575d9 is a squashed backport of:
>>
>>   422588e885 x86/xpti: Hide almost all of .text and all .data/.rodata/=
=2Ebss mappings
>>   d1d6fc97d6 x86/xpti: really hide almost all of Xen image
>>   044fedfaa2 x86/traps: Put idt_table[] back into .bss
>>
>> And indeed, reverting those on staging fixes suspend. (This also match=
es
>> the behavior that xpti=3Doff fixes suspend as George already reported
>> earlier today).
>=20
> Okay, that was quite helpful - I think I see now where I screwed up (i.=
e.
> the issue is in the middle of the three commits). Could you confirm tha=
t a
> Xen booted with "nosmp" suspends and resumes fine?

Yes, with nosmp suspend works.


--SNDEqQWeSKd3kw3yTvuYVIsJ5QTERdn8l--

--tP4h0H55wRzNEJevpIE0V23kwu7bIOq1Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsGwH0ACgkQkO9xfO/x
ly86Kw//WlMpiIkrRd40gS7r5t9X3z7bww+CVI6lkQUgsnhrANSho5icJaUZMxo0
BC8D/zrxY4km6dPAsF6Wor1ozNdjPv8XdICKIM/987OILOhSPC3cZ0Hdmtpqc1BL
Sa2IclDpckxTJRUZ+NE0aRJEeh84vCLZSP7Pw74jGu4l0Jbi3Z3mKtJZVg+upfvu
/2QtnnkBQRLYidzbALFnvf9ehprHiS+dkSG4PagtsjsqX1snScaduhYPit8JYCnG
8R647MQpAXnhl1dWPtLUIqg3IT/bNVcHcw5RNlCyEY9hXG9ta+NbZe1Ipedl+4+L
vDakqLaBxXt0pDiRPbouScO0HERDMmQMYj3yXr+zpHY1Ymvh8p3oAoHhxBCMLziB
RS7gN4WcAQsEM9waCoqWRUqB/IQ04HG6LD566HFLly6yuelEFWWuOhmML1hO42xc
3OrOTvDZBllmHTcbGdLoxjujok+vfQOBmWm9tzgP175alSpPXm8KCUOk2TBaAhGT
0OZGnXHrnhLLpMz2IlpTNR9CLJ+/fJMs1K6PRa182L18ybtHCsjIxXVS433GQo6+
lfMWSQXu72agIP41flCX6g0Ve7Smdrg2W8LEhoOL8H9vSMmUwxk9i+9/W7bwrlDC
ClfB4v/+nwHPRnp8Ahcg1+Qw+UWphl7N4AisBGzjwbvgFDEB8hM=
=aPC+
-----END PGP SIGNATURE-----

--tP4h0H55wRzNEJevpIE0V23kwu7bIOq1Z--


--===============8499601632906599073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8499601632906599073==--
