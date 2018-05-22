From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Tue, 22 May 2018 22:21:00 +0000
Message-ID: <f6449427-16b7-3868-4948-f5b4c533d9ea@invisiblethingslab.com>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <20180518153344.GC11683@mail-itl>
 <5AFEF73D02000078001C425D@prv1-mh.provo.novell.com>
 <20180518161925.GE11683@mail-itl>
 <CAFLBxZagWwUe-wJ-f7B9KZSTYWfqta71w3GWcz=djbLZiODKHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6495704982692874583=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZagWwUe-wJ-f7B9KZSTYWfqta71w3GWcz=djbLZiODKHQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6495704982692874583==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="yjnEaRJd0VcsYTw7QgbtMaxuFTmShFtgH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yjnEaRJd0VcsYTw7QgbtMaxuFTmShFtgH
Content-Type: multipart/mixed; boundary="vFrkztyTPUwdVFQKQgU1665j9nPRnlFbI";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <dunlapg@umich.edu>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <f6449427-16b7-3868-4948-f5b4c533d9ea@invisiblethingslab.com>
Subject: Re: [Xen-devel] Test for osstest, features used in Qubes OS
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <20180518153344.GC11683@mail-itl>
 <5AFEF73D02000078001C425D@prv1-mh.provo.novell.com>
 <20180518161925.GE11683@mail-itl>
 <CAFLBxZagWwUe-wJ-f7B9KZSTYWfqta71w3GWcz=djbLZiODKHQ@mail.gmail.com>
In-Reply-To: <CAFLBxZagWwUe-wJ-f7B9KZSTYWfqta71w3GWcz=djbLZiODKHQ@mail.gmail.com>

--vFrkztyTPUwdVFQKQgU1665j9nPRnlFbI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

George Dunlap:
> On Fri, May 18, 2018 at 5:19 PM, Marek Marczykowski
> <marmarek@invisiblethingslab.com> wrote:
>> On Fri, May 18, 2018 at 09:54:37AM -0600, Jan Beulich wrote:
>>>>>> On 18.05.18 at 17:33, <marmarek@invisiblethingslab.com> wrote:
>>>> Yes, I'm happy to help with that. As I've said, the basic test is ve=
ry
>>>> simple (rtcwake command) and already very useful. The fact that it i=
s(?)
>>>> broken on staging doesn't make it easier,
>>>
>>> Details on the breakage would be appreciated (on a separate thread),
>>> unless you plan to address it yourself. I recall Simon(?) mentioning =
this as
>>> well, but also not providing sufficient data to consider looking into=
 it
>>> (perhaps simply because it wasn't easy to obtain useful data, as
>>> frequently is the case with S3 resume). I think it would be nice if w=
e could
>>> release 4.11 without a regression here.
>>
>> I only know that Simon have tested it and it fails. Cc'ing him.

I run into the same problem as George below (see [1] for the inital
report).

> Well I tried it with a post-RC 4.11 and got the below.  I haven't done
> any investigation.
>=20
>  -George
>=20
[...]
> (XEN) *** DOUBLE FAULT ***
> (XEN) ----[ Xen-4.11-rc  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d080377944>] handle_exception+0x9c/0xf7
> (XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
> (XEN) rax: ffffc900422480b8   rbx: 0000000000000000   rcx: 000000000000=
0005
> (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 000000000000=
0000
> (XEN) rbp: 000036ffbddb7f27   rsp: ffffc90042248000   r8:  000000000000=
0000
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 000000000000=
0000
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc9004224=
ffff
> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 000000000000=
26e0
> (XEN) cr3: 000000018a100000   cr2: ffffc90042247ff8
> (XEN) fsb: 00007f6242d95700   gsb: ffff88003dc00000   gss: 000000000000=
0000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Current stack base ffffc90042248000 differs from expected ffff830=
0dfa80000
> (XEN) Valid stack range: ffffc9004224e000-ffffc90042250000,
> sp=3Dffffc90042248000, tss.rsp0=3Dffff8300dfa87fa0
> (XEN) No stack overflow detected. Skipping stack trace.
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) DOUBLE FAULT -- system shutdown
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...

I have done some more testing in the meantime. The issue also affect
4.10.1, but not 4.10.0. That's useful since it makes the bisect shorter.
A bisect identifies 8462c575d9 "x86/xpti: Hide almost all of .text and
all .data/.rodata/.bss mappings" as the commit which breaks suspend.

8462c575d9 is a squashed backport of:

  422588e885 x86/xpti: Hide almost all of .text and all .data/.rodata/.bs=
s mappings
  d1d6fc97d6 x86/xpti: really hide almost all of Xen image
  044fedfaa2 x86/traps: Put idt_table[] back into .bss

And indeed, reverting those on staging fixes suspend. (This also matches
the behavior that xpti=3Doff fixes suspend as George already reported
earlier today).

[1]: https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg0113=
7.html


--vFrkztyTPUwdVFQKQgU1665j9nPRnlFbI--

--yjnEaRJd0VcsYTw7QgbtMaxuFTmShFtgH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsEl+EACgkQkO9xfO/x
ly/e/BAAoq6GdzfuPKeKoKaxsnnhlJcXslg5iW7WrTtirHZf+XBdXhPVwk97mekX
3ELloXq6JIAWr+ypeffV7/orM/8eylc4f51tp0B8vzqQSPPtvaYGE0IKSqI4T1UN
5/wCBShYc4aQQ6t0/VscV8R/I7tHQvqLpS7GJFLcWtBPPp1jCZQbmE7YLFI2SDY+
dXdQEUejTHsmqEGHoEmGMEcA+hihBflLtCYfNpyAxNSt7lsLoRb+tRmegJT2+sAt
DU27Bfd4CUPthabrDsZUIKzuZBpfgztg8WR/MCjetabqhQjzZ01fvgA7kk1Wklxn
yJSQDTs8bgHKtkMNIFQRKaxpA7u46C7LmT3Ra+vcaTv3NJVGZUxC72m+S1MNWQEb
R6JgX9m/QyB5s6CahXFKKJ5115oAN49iq283D7KKqF2j0TccOXpUJqfH1SA/jHox
FG8Yi1o4PVEJgqAUMO/kMuUMaIOtwOfQm+uXI1AokGAKo2942xZ10Wej4HzE+Vcb
GGfXBed8oT69E5b36TAF0iSfGeZ3kZxkz8h1nApACvnk4V31adQe0BfMtxVAsApo
PB8HEylZ4TFmtb8HRBcSJ5xfJfOUiSUE0s7vhswSBQpsS/sAr82KOt613w1saK7F
SAi+0Yvo6j2A9gFtKG3oWqNFVwTKum7ERGkBIOx06aC84uTrrVU=
=sJun
-----END PGP SIGNATURE-----

--yjnEaRJd0VcsYTw7QgbtMaxuFTmShFtgH--


--===============6495704982692874583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6495704982692874583==--
