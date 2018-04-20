From: Yessine Daoud <da.yessine@gmail.com>
Subject: EVTCHNOP_failure / xen 4.11
Date: Fri, 20 Apr 2018 12:05:45 +0100
Message-ID: <CABLtV0DecLru5y4M=tYTL7aq4Wk8vfL-h=tcZ4eUB0GN2s2KMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2840302580472453897=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ga1=hj=gmail.com=da.yessine@srs-us1.protection.inumbo.net>)
 id 1f9TrQ-0006b3-6A
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 11:05:48 +0000
Received: by mail-it0-x22c.google.com with SMTP id m134-v6so2072170itb.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Apr 2018 04:05:46 -0700 (PDT)
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

--===============2840302580472453897==
Content-Type: multipart/alternative; boundary="000000000000833ba2056a45abe6"

--000000000000833ba2056a45abe6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

When I upgrade to Xen 4.11, I got the following when creating any guest:

(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22
(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22

This behavior is not seen when using Xen 4.10-stable.
Any idea?

Best Regards,
Yessine daoud
=E1=90=A7

--000000000000833ba2056a45abe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>When I upgrade to Xen 4.=
11, I got the following when creating any guest:</div><div><br></div><div>(=
XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22</div><d=
iv>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22</di=
v><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error_-22=
</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_error=
_-22</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_1,_e=
rror_-22</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_domain_=
1,_error_-22</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:_dom=
ain_1,_error_-22</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_failure:=
_domain_1,_error_-22</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_fail=
ure:_domain_1,_error_-22</div><div>(XEN)_event_channel.c:319:d0v3_EVTCHNOP_=
failure:_domain_1,_error_-22</div><div><br></div><div>This behavior is not =
seen when using Xen 4.10-stable.</div><div>Any idea?</div><div><br></div><d=
iv>Best Regards,</div><div>Yessine daoud</div></div><div hspace=3D"streak-p=
t-mark" style=3D"max-height:1px"><img alt=3D"" style=3D"width:0px;max-heigh=
t:0px;overflow:hidden" src=3D"https://mailfoogae.appspot.com/t?sender=3DaZG=
EueWVzc2luZUBnbWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D20185354-858=
3-402b-884f-370108ab19ef"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</fon=
t></div>

--000000000000833ba2056a45abe6--


--===============2840302580472453897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2840302580472453897==--
