From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Mon, 8 Jan 2018 09:02:37 +0000
Message-ID: <53951DED-1AEF-49B3-955B-9080E7D889F0@gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
 <20180107150029.GA2935@mail-itl>
 <4b0965ae-6746-febb-3c17-072e6f7aefd7@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: multipart/mixed; boundary="===============7496485230345879185=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=boe9=ed=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eYTLL-0006l2-Dv
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 09:03:43 +0000
Received: by mail-wm0-f42.google.com with SMTP id 9so12619076wme.4
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 01:03:36 -0800 (PST)
In-Reply-To: <4b0965ae-6746-febb-3c17-072e6f7aefd7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7496485230345879185==
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_22035434-01D8-4662-8F3D-1C43307ACAE7"


--Apple-Mail=_22035434-01D8-4662-8F3D-1C43307ACAE7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On 7 Jan 2018, at 17:11, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
>=20
>>>> Since PVH does not yet support PCI passthrough, are there other
>>>> recommended SP3 mitigations for 64-bit PV driver domains?
>>> Lock them down?  Device driver domains, even if not fully trusted, =
are
>>> going to be part of the system and therefore at least semi-TCB.
>>>=20
>>> If an attacker can't run code in your driver domain (and be aware of
>>> things like server side processing, JIT of SQL, etc as "running =
code"
>>> methods), they aren't in a position to mount an SP3 attack.
>> Well, the main reason why driver domains are used in Qubes OS is
>> assumption that it is not possible to really "lock them down", given
>> full OS (Linux) running inside and being exposed to the outside world
>> (having network adapters, USB controllers etc). There are so many
>> components running them, that for sure some of them are buggy. Just =
some
>> examples exploitable in the near past: DHCP client, Bluetooth stack.
>>=20
>> If we'd believe that handling those devices exposed to the outside =
world
>> is "safe", we wouldn't use driver domains at all...
>=20
> Indeed, but they are in a better position than arbitrary VMs, because
> users can't just log into them and start running code.  (I really =
hope...)


I wanted to point out =
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00497.html=
 =
<https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00497.htm=
l> which according to the cover letter is based on HVM and not PVH. I am =
not really sure whether this would solve some of the problems around PCI =
passthrough.=20

Regards
Lars=

--Apple-Mail=_22035434-01D8-4662-8F3D-1C43307ACAE7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 7 Jan 2018, at 17:11, Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt; wrote:</div><div =
class=3D""><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D"">Since PVH does not yet =
support PCI passthrough, are there other<br class=3D"">recommended SP3 =
mitigations for 64-bit PV driver domains?<br class=3D""></blockquote>Lock =
them down?&nbsp; Device driver domains, even if not fully trusted, =
are<br class=3D"">going to be part of the system and therefore at least =
semi-TCB.<br class=3D""><br class=3D"">If an attacker can't run code in =
your driver domain (and be aware of<br class=3D"">things like server =
side processing, JIT of SQL, etc as "running code"<br class=3D"">methods),=
 they aren't in a position to mount an SP3 attack.<br =
class=3D""></blockquote>Well, the main reason why driver domains are =
used in Qubes OS is<br class=3D"">assumption that it is not possible to =
really "lock them down", given<br class=3D"">full OS (Linux) running =
inside and being exposed to the outside world<br class=3D"">(having =
network adapters, USB controllers etc). There are so many<br =
class=3D"">components running them, that for sure some of them are =
buggy. Just some<br class=3D"">examples exploitable in the near past: =
DHCP client, Bluetooth stack.<br class=3D""><br class=3D"">If we'd =
believe that handling those devices exposed to the outside world<br =
class=3D"">is "safe", we wouldn't use driver domains at all...<br =
class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Indeed, but they =
are in a better position than arbitrary VMs, because</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">users can't just log into them and start running =
code.&nbsp; (I really hope...)</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote></div><br class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">I wanted to point out&nbsp;<a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00=
497.html" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2018-01/ms=
g00497.html</a>&nbsp;which according to the cover letter is based on HVM =
and not PVH. I am not really sure whether this would solve some of the =
problems around PCI passthrough.&nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D"">Regards</div><div =
class=3D"">Lars</div></body></html>=

--Apple-Mail=_22035434-01D8-4662-8F3D-1C43307ACAE7--


--===============7496485230345879185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7496485230345879185==--
