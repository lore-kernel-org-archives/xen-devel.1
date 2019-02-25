From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 15:54:21 +0000
Message-ID: <2992D841-035D-4256-81D7-31B684FEB451@xenproject.org>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <f0266920-d8fc-a215-25a1-0a3da777b0a0@gmail.com>
 <ecc8d855-e3f7-9e19-b8d6-ee9a2685ade0@arm.com>
 <9398ea9e-d49f-7595-7b15-5f4524e43a72@gmail.com>
 <69ef3086-dda3-8c66-e3b6-20124e2d97cc@arm.com>
 <f502b83f-a9c6-76e8-b3ca-d11bfce348d6@gmail.com>
 <3a355069-854f-1283-e115-c6deeb6e701d@arm.com>
 <ee393536-d825-bf0d-1224-ac6f88daeda6@gmail.com>
 <e414749f-980d-168f-b276-fafd5ac92b92@arm.com>
 <49ce8567-f65c-cb74-018b-87216dccf132@gmail.com>
 <234d8052-6911-1b55-38c0-2f067aff56c6@arm.com>
 <6d85ae68-943d-9611-53e0-5b48081514d9@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============8086197619758639742=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QGuB=RA=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1gyIaI-00037O-LV
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 15:54:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id j125so8589071wmj.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 07:54:25 -0800 (PST)
In-Reply-To: <6d85ae68-943d-9611-53e0-5b48081514d9@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============8086197619758639742==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B14D2906-8C29-4E03-922C-248B868B2376"


--Apple-Mail=_B14D2906-8C29-4E03-922C-248B868B2376
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 25 Feb 2019, at 13:47, Oleksandr Andrushchenko <andr2000@gmail.com> =
wrote:
>=20
> On 2/25/19 3:40 PM, Julien Grall wrote:
>>=20
>>>> My point is not about sending such code on the mailing list. My =
point is you need to provide as much as possible details in your cover =
letter so we can be more efficient when reviewing. For instance, many of =
us does not have access to MISRA spec because it is not free...
>>> While I agree that one has to provide as much supporting information =
as possible
>>> while presenting some work to the community it is that I cannot =
disclose
>>> MISRA rules here. As you said, MISRA spec is not free. And of course =
I cannot
>>> expect anyone to by it for the reason that someone wants some patch =
to be
>>> "securely" or blindly reviewed. (BTW, this is the topic that has =
already been
>>> raised in our team internally and being discussed)
>>=20
>> I understand that MISRA is not free and does not ask you to =
copy/paste the PDF.
>>=20
>> What I ask is provide enough pointer for us to understand how this =
fits in Xen code base. For instance, a lot of the MISRA rules have =
explanation online (see website such as [1] and [2]). Another =
alternative is to summarize the issues with your own arguments.
>>=20
> Totally agree, I'll try harder next time in finding open sources with =
rule's
> descriptions

I am wondering, whether it would make sense to buy a set of MISRA C =
online copies for people who regularly review other people's code (eg. =
one per active committer). The cost is not that high per license
The problem is that it would exclude a part of the community
There would also be a minimal management overhead

Regards
Lars=

--Apple-Mail=_B14D2906-8C29-4E03-922C-248B868B2376
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 25 Feb 2019, at 13:47, Oleksandr Andrushchenko &lt;<a =
href=3D"mailto:andr2000@gmail.com" class=3D"">andr2000@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On 2/25/19 =
3:40 PM, Julien Grall wrote:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D""></blockquote><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">My point is not about sending such code on the mailing list. =
My point is you need to provide as much as possible details in your =
cover letter so we can be more efficient when reviewing. For instance, =
many of us does not have access to MISRA spec because it is not =
free...<br class=3D""></blockquote>While I agree that one has to provide =
as much supporting information as possible<br class=3D"">while =
presenting some work to the community it is that I cannot disclose<br =
class=3D"">MISRA rules here. As you said, MISRA spec is not free. And of =
course I cannot<br class=3D"">expect anyone to by it for the reason that =
someone wants some patch to be<br class=3D"">"securely" or blindly =
reviewed. (BTW, this is the topic that has already been<br =
class=3D"">raised in our team internally and being discussed)<br =
class=3D""></blockquote><br class=3D"">I understand that MISRA is not =
free and does not ask you to copy/paste the PDF.<br class=3D""><br =
class=3D"">What I ask is provide enough pointer for us to understand how =
this fits in Xen code base. For instance, a lot of the MISRA rules have =
explanation online (see website such as [1] and [2]). Another =
alternative is to summarize the issues with your own arguments.<br =
class=3D""><br class=3D""></blockquote><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Totally agree, I'll try harder next time in finding open =
sources with rule's</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">descriptions</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div></div>I am wondering, whether it would make sense to =
buy a set of MISRA C online copies for people who regularly review other =
people's code (eg. one per active committer). The cost is not that high =
per license<div class=3D"">The problem is that it would exclude a part =
of the community</div><div class=3D"">There would also be a minimal =
management overhead</div><div class=3D""><br class=3D""></div><div =
class=3D"">Regards</div><div class=3D"">Lars</div></body></html>=

--Apple-Mail=_B14D2906-8C29-4E03-922C-248B868B2376--


--===============8086197619758639742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8086197619758639742==--
