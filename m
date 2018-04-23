From: Yessine Daoud <da.yessine@gmail.com>
Subject: Re: EVTCHNOP_failure / xen 4.11
Date: Mon, 23 Apr 2018 10:33:43 +0100
Message-ID: <CABLtV0Ak0YUOEi34OUs5_v8S=7wFMrfw22vKtsiLMfnso2SHOg@mail.gmail.com>
References: <CABLtV0DecLru5y4M=tYTL7aq4Wk8vfL-h=tcZ4eUB0GN2s2KMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3157531527485194484=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yawg=hm=gmail.com=da.yessine@srs-us1.protection.inumbo.net>)
 id 1fAXr0-0006w3-BO
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 09:33:46 +0000
Received: by mail-io0-x235.google.com with SMTP id d24-v6so7813462iob.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Apr 2018 02:33:44 -0700 (PDT)
In-Reply-To: <CABLtV0DecLru5y4M=tYTL7aq4Wk8vfL-h=tcZ4eUB0GN2s2KMA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

--===============3157531527485194484==
Content-Type: multipart/alternative; boundary="000000000000dcd88d056a80bba2"

--000000000000dcd88d056a80bba2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

forgot to mention:  I am testing xen on Salvator-X board.
=E1=90=A7

2018-04-20 12:05 GMT+01:00 Yessine Daoud <da.yessine@gmail.com>:

> Hi,
>
> When I upgrade to Xen 4.11, I got the following when creating any guest:
>
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
> (XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
>
> This behavior is not seen when using Xen 4.10-stable.
> Any idea?
>
> Best Regards,
> Yessine daoud
> =E1=90=A7
>

--000000000000dcd88d056a80bba2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>forgot to mention:=C2=A0 I am t=
esting xen on Salvator-X board.</div></div><div hspace=3D"streak-pt-mark" s=
tyle=3D"max-height:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;ove=
rflow:hidden" src=3D"https://mailfoogae.appspot.com/t?sender=3DaZGEueWVzc2l=
uZUBnbWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D93f39837-c24a-4a38-92=
37-076bdfbe44ec"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-04-20 12:05 G=
MT+01:00 Yessine Daoud <span dir=3D"ltr">&lt;<a href=3D"mailto:da.yessine@g=
mail.com" target=3D"_blank">da.yessine@gmail.com</a>&gt;</span>:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>=
When I upgrade to Xen 4.11, I got the following when creating any guest:</d=
iv><div><br></div><div>(XEN)_event_channel.c:319:<wbr>d0v3_EVTCHNOP_failure=
:_domain_<wbr>1,_error_-22</div><div>(XEN)_event_channel.c:319:<wbr>d0v3_EV=
TCHNOP_failure:_domain_<wbr>1,_error_-22</div><div>(XEN)_event_channel.c:31=
9:<wbr>d0v3_EVTCHNOP_failure:_domain_<wbr>1,_error_-22</div><div>(XEN)_even=
t_channel.c:319:<wbr>d0v3_EVTCHNOP_failure:_domain_<wbr>1,_error_-22</div><=
div>(XEN)_event_channel.c:319:<wbr>d0v3_EVTCHNOP_failure:_domain_<wbr>1,_er=
ror_-22</div><div>(XEN)_event_channel.c:319:<wbr>d0v3_EVTCHNOP_failure:_dom=
ain_<wbr>1,_error_-22</div><div>(XEN)_event_channel.c:319:<wbr>d0v3_EVTCHNO=
P_failure:_domain_<wbr>1,_error_-22</div><div>(XEN)_event_channel.c:319:<wb=
r>d0v3_EVTCHNOP_failure:_domain_<wbr>1,_error_-22</div><div>(XEN)_event_cha=
nnel.c:319:<wbr>d0v3_EVTCHNOP_failure:_domain_<wbr>1,_error_-22</div><div>(=
XEN)_event_channel.c:319:<wbr>d0v3_EVTCHNOP_failure:_domain_<wbr>1,_error_-=
22</div><div><br></div><div>This behavior is not seen when using Xen 4.10-s=
table.</div><div>Any idea?</div><div><br></div><div>Best Regards,</div><div=
>Yessine daoud</div></div><div hspace=3D"streak-pt-mark" style=3D"max-heigh=
t:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DaZGEueWVzc2luZUBnbWFpbC5jb20%=
3D&amp;type=3Dzerocontent&amp;guid=3D20185354-8583-402b-884f-370108ab19ef">=
<font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>
</blockquote></div><br></div>

--000000000000dcd88d056a80bba2--


--===============3157531527485194484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3157531527485194484==--
