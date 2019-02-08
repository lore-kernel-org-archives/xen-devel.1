From: Olivier Lambert <lambert.olivier@gmail.com>
Subject: Fetching Xen metrics
Date: Fri, 8 Feb 2019 15:41:22 +0100
Message-ID: <CACJ1ZNsS=yzne02djtZbr3Yu+BbMoCwDUyU+xhsB=o_HtJ6N7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3248990023216798515=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkrH=QP=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1gs7LW-0004Dt-Aa
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 14:41:38 +0000
Received: by mail-ot1-x335.google.com with SMTP id s5so6137407oth.7
 for <xen-devel@lists.xenproject.org>; Fri, 08 Feb 2019 06:41:37 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============3248990023216798515==
Content-Type: multipart/alternative; boundary="000000000000c7f541058162f4f7"

--000000000000c7f541058162f4f7
Content-Type: text/plain; charset="UTF-8"

Hi there!

Following a Twitter discussion with Netdata people (see
https://twitter.com/linuxnetdata/status/1093834441930215425) we would like
to help them to build a Netdata plugin [1] for gathering Xen metrics. From
the Dom0, no need to access those from the "outside".

Right now, there is RRDs gathered by XAPI [2], but it's a bunch of XML
files that we'd like to avoid to parse them (CPU cost). We are talking
fetching every second (every 5 secs max), so ideally it should be
efficient. On a storage side, it's easier because Netdata already detect
mount points and gather IOPS and other kernel things (perfect for a dom0
used as a storage/network privileged domain), so it's OK on this side. It's
really on the "compute"/Xen side that we don't know where to start.

Is there any "endpoint" we could fetch some Xen metrics? (equivalent of
/proc but for Xen). If not, is there a way we (XCP-ng project) can
contribute to expose those metrics? Would it require a Xen modification
only or also something in the dom0?

Final question: what kind of Xen metrics would be interesting to monitor in
your opinion?

Thanks for your feedback,


Olivier and the whole XCP-ng Team


[1]: Netdata is an agent you deploy on the host, parsing multiple metrics
and deliver beautiful live dashboards, see a demo here:
https://london.my-netdata.io/default.html#;theme=slate

[2]: we intend to do embed that in a future XCP-ng release

--000000000000c7f541058162f4f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi there!</div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">Following a Twitter discussion with Net=
data people (see <a href=3D"https://twitter.com/linuxnetdata/status/1093834=
441930215425">https://twitter.com/linuxnetdata/status/1093834441930215425</=
a>) we would like to help them to build a Netdata plugin [1] for gathering =
Xen metrics. From the Dom0, no need to access those from the &quot;outside&=
quot;.<br></div><div dir=3D"ltr"><br></div><div>Right now, there is RRDs ga=
thered by XAPI [2], but it&#39;s a bunch of XML files that we&#39;d like to=
 avoid to parse them (CPU cost). We are talking fetching every second (ever=
y 5 secs max), so ideally it should be efficient. On a storage side, it&#39=
;s easier because Netdata already detect mount points and gather IOPS and o=
ther kernel things (perfect for a dom0 used as a storage/network privileged=
 domain), so it&#39;s OK on this side. It&#39;s really on the &quot;compute=
&quot;/Xen side that we don&#39;t know where to start.</div><div><br></div>=
<div>Is there any &quot;endpoint&quot; we could fetch some Xen metrics? (eq=
uivalent of /proc but for Xen). If not, is there a way we (XCP-ng project) =
can contribute to expose those metrics? Would it require a Xen modification=
 only or also something in the dom0?<br></div><div><br></div>Final question=
: what kind of Xen metrics would be interesting to monitor in your opinion?=
</div><div dir=3D"ltr"><br></div><div>Thanks for your feedback,</div><div><=
br></div><div><br></div><div>Olivier and the whole XCP-ng Team<br></div><di=
v><br></div><div><br></div><div dir=3D"ltr"><div>[1]: Netdata is an agent y=
ou deploy on the host, parsing multiple metrics and deliver beautiful live =
dashboards, see a demo here: <a href=3D"https://london.my-netdata.io/defaul=
t.html#;theme=3Dslate">https://london.my-netdata.io/default.html#;theme=3Ds=
late</a></div><div><br></div><div>[2]: we intend to do embed that in a futu=
re XCP-ng release<br><div><br></div></div></div></div>

--000000000000c7f541058162f4f7--


--===============3248990023216798515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3248990023216798515==--
