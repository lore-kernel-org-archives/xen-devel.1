From: Liam Shepherd <liam@dancer.es>
Subject: Re: PROBLEM: xen-netfront: ethtool settings changed in
 4.4.134 causing packet loss
Date: Thu, 7 Jun 2018 21:33:28 +0100
Message-ID: <CAB8B+d29S1hwanUwca3ByRigDW05DZ-UVREioYCSnDWhUAOp2Q@mail.gmail.com>
References: <CAB8B+d34sEuoaHANbYdtD_YkdB=w52rDD4ppZtQQEFCJ6+Q8MA@mail.gmail.com>
 <b253bb6e-034f-61ce-5716-41faba532bf4@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0337665675087919550=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2gr1=iz=dancer.es=liam@srs-us1.protection.inumbo.net>)
 id 1fR1bM-0002xh-10
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 20:33:44 +0000
Received: by mail-yb0-x243.google.com with SMTP id v17-v6so3666430ybe.7
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jun 2018 13:33:41 -0700 (PDT)
In-Reply-To: <b253bb6e-034f-61ce-5716-41faba532bf4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Matthew Day <matthew.day@redmatter.com>
List-Id: xen-devel@lists.xenproject.org

--===============0337665675087919550==
Content-Type: multipart/alternative; boundary="000000000000e42ac7056e133297"

--000000000000e42ac7056e133297
Content-Type: text/plain; charset="UTF-8"

Thank you.

As a side point David Vrabel is listed in the maintainers file for xen
hypervisor interface in 4.4.135 but his email is no longer active it seems.

On 7 Jun 2018 09:35, "Ross Lagerwall" <ross.lagerwall@citrix.com> wrote:

On 06/05/2018 04:43 PM, Liam Shepherd wrote:
> When upgrading from 4.4.132 to 4.4.135 I started observing about 3%
> packet loss on PV on HVM domU interfaces. Specifically TX dropped
> packets (As reported by ifconfig).
>
> It seems that the default ethtool settings have changed.
>
> Previously (4.4.132):
> tx-checksumming: on
>      tx-checksum-ipv4: on [fixed]
>      tx-checksum-ip-generic: off [fixed]
>      tx-checksum-ipv6: on
>      tx-checksum-fcoe-crc: off [fixed]
>      tx-checksum-sctp: off [fixed]
> scatter-gather: on
>      tx-scatter-gather: on
>      tx-scatter-gather-fraglist: off [fixed]
> tcp-segmentation-offload: on
>      tx-tcp-segmentation: on
>      tx-tcp-ecn-segmentation: off [fixed]
>      tx-tcp6-segmentation: on
> udp-fragmentation-offload: off [fixed]
> generic-segmentation-offload: on
>
> Now (4.4.135):
> tx-checksumming: on
>      tx-checksum-ipv4: on [fixed]
>      tx-checksum-ip-generic: off [fixed]
>      tx-checksum-ipv6: off
>      tx-checksum-fcoe-crc: off [fixed]
>      tx-checksum-sctp: off [fixed]
> scatter-gather: off
>      tx-scatter-gather: off
>      tx-scatter-gather-fraglist: off [fixed]
> tcp-segmentation-offload: off
>      tx-tcp-segmentation: off
>      tx-tcp-ecn-segmentation: off [fixed]
>      tx-tcp6-segmentation: off
> udp-fragmentation-offload: off [fixed]
> generic-segmentation-offload: off [requested on]
>
> Manually running 'ethtool -K INT tso on sg on' on all interfaces stops
> the packet loss again. They're then set like this:
> tx-checksumming: on
>      tx-checksum-ipv4: on [fixed]
>      tx-checksum-ip-generic: off [fixed]
>      tx-checksum-ipv6: off
>      tx-checksum-fcoe-crc: off [fixed]
>      tx-checksum-sctp: off [fixed]
> scatter-gather: on
>      tx-scatter-gather: on
>      tx-scatter-gather-fraglist: off [fixed]
> tcp-segmentation-offload: on
>      tx-tcp-segmentation: on
>      tx-tcp-ecn-segmentation: off [fixed]
>      tx-tcp6-segmentation: off [requested on]
> udp-fragmentation-offload: off [fixed]
> generic-segmentation-offload: on
>
> I've traced it to a commit in 4.4.134:
> 6be4fe832954db3b359b72107a6c60e34d939b26
> xen-netfront: Fix race between device setup and open
> [ Upstream commit f599c64fdf7d9c108e8717fb04bc41c680120da4 ]
> https://patchwork.kernel.org/patch/10328969/
>
> Once that is reverted on 4.4.135, the ethtool settings are as 4.4.132
> and there is no packet loss.
>
Thanks for the bug report. Changing the ethtool settings was certainly
not intended with that change. I'll take a look to see what has gone wrong.


-- 
Ross Lagerwall

--000000000000e42ac7056e133297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you.<div dir=3D"auto"><br></div><div dir=3D"auto">A=
s a side point David Vrabel is listed in the maintainers file for xen hyper=
visor interface in 4.4.135 but his email is no longer active it seems.</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 Jun 2=
018 09:35, &quot;Ross Lagerwall&quot; &lt;<a href=3D"mailto:ross.lagerwall@=
citrix.com">ross.lagerwall@citrix.com</a>&gt; wrote:<br type=3D"attribution=
"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div class=3D"elided-text">On 06/05/2018 04:43 P=
M, Liam Shepherd wrote:<br>
&gt; When upgrading from 4.4.132 to 4.4.135 I started observing about 3%<br=
>
&gt; packet loss on PV on HVM domU interfaces. Specifically TX dropped<br>
&gt; packets (As reported by ifconfig).<br>
&gt; <br>
&gt; It seems that the default ethtool settings have changed.<br>
&gt; <br>
&gt; Previously (4.4.132):<br>
&gt; tx-checksumming: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ipv4: on [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ip-generic: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ipv6: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-fcoe-crc: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-sctp: off [fixed]<br>
&gt; scatter-gather: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-scatter-gather: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-scatter-gather-fraglist: off [fixed]<br>
&gt; tcp-segmentation-offload: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp-segmentation: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp-ecn-segmentation: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp6-segmentation: on<br>
&gt; udp-fragmentation-offload: off [fixed]<br>
&gt; generic-segmentation-offload: on<br>
&gt; <br>
&gt; Now (4.4.135):<br>
&gt; tx-checksumming: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ipv4: on [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ip-generic: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ipv6: off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-fcoe-crc: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-sctp: off [fixed]<br>
&gt; scatter-gather: off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-scatter-gather: off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-scatter-gather-fraglist: off [fixed]<br>
&gt; tcp-segmentation-offload: off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp-segmentation: off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp-ecn-segmentation: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp6-segmentation: off<br>
&gt; udp-fragmentation-offload: off [fixed]<br>
&gt; generic-segmentation-offload: off [requested on]<br>
&gt; <br>
&gt; Manually running &#39;ethtool -K INT tso on sg on&#39; on all interfac=
es stops<br>
&gt; the packet loss again. They&#39;re then set like this:<br>
&gt; tx-checksumming: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ipv4: on [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ip-generic: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-ipv6: off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-fcoe-crc: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-checksum-sctp: off [fixed]<br>
&gt; scatter-gather: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-scatter-gather: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-scatter-gather-fraglist: off [fixed]<br>
&gt; tcp-segmentation-offload: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp-segmentation: on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp-ecn-segmentation: off [fixed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tx-tcp6-segmentation: off [requested on]<br>
&gt; udp-fragmentation-offload: off [fixed]<br>
&gt; generic-segmentation-offload: on<br>
&gt; <br>
&gt; I&#39;ve traced it to a commit in 4.4.134:<br>
&gt; 6be4fe832954db3b359b72107a6c60e34d939b26<br>
&gt; xen-netfront: Fix race between device setup and open<br>
&gt; [ Upstream commit f599c64fdf7d9c108e8717fb04bc41c680120da4 ]<br>
&gt; <a href=3D"https://patchwork.kernel.org/patch/10328969/" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://patchwork.kernel.org/patch/10328=
969/</a><br>
&gt; <br>
&gt; Once that is reverted on 4.4.135, the ethtool settings are as 4.4.132<=
br>
&gt; and there is no packet loss.<br>
&gt; <br></div>
Thanks for the bug report. Changing the ethtool settings was certainly <br>
not intended with that change. I&#39;ll take a look to see what has gone wr=
ong.<div class=3D"signature-text"><br>
<br>
-- <br>
Ross Lagerwall<br>
</div></blockquote></div><br></div>

--000000000000e42ac7056e133297--


--===============0337665675087919550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0337665675087919550==--
