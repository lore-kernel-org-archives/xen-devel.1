From: Ed Vielmetti <ed@packet.com>
Subject: Re: [PATCH RFC for next] xen: make grant table
 configurable
Date: Mon, 21 Jan 2019 10:55:19 -0500
Message-ID: <CA+Gavy6v1n3uYyOOD-Q07zV4q5XSXm0wmcCv0ka0_2UrwQS16g@mail.gmail.com>
References: <20190117123054.809-1-wei.liu2@citrix.com>
 <alpine.DEB.2.10.1901170936190.18561@sstabellini-ThinkPad-X260>
 <20190117173807.fvmvakv2j7hqttkr@zion.uk.xensource.com>
 <alpine.DEB.2.10.1901170939280.18561@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3619954663533259951=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fgM5=P5=packet.com=ed@srs-us1.protection.inumbo.net>)
 id 1glbvb-0001hV-1o
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 15:55:59 +0000
Received: by mail-vk1-xa44.google.com with SMTP id j23so4672182vke.13
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 07:55:57 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1901170939280.18561@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Edward Vielmetti <ed@packet.net>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3619954663533259951==
Content-Type: multipart/alternative; boundary="0000000000006f5377057ff9e56a"

--0000000000006f5377057ff9e56a
Content-Type: text/plain; charset="UTF-8"

Yes! I'd love to hear more about what you did, to help me further promote
Xen as a Works on Arm supported project. Also, I'd love to hear more
details about the Gitlab integration, as I am working diligently to get
arm64 support into their mainline roadmap.

thanks

Ed

On Thu, Jan 17, 2019 at 12:41 PM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Thu, 17 Jan 2019, Wei Liu wrote:
> > On Thu, Jan 17, 2019 at 09:36:57AM -0800, Stefano Stabellini wrote:
> > > On Thu, 17 Jan 2019, Wei Liu wrote:
> > > > Introduce CONFIG_GRANT_TABLE. Provide stubs and make sure x86 and arm
> > > > hypervisors build with grant table disabled.
> > >
> > > Looks like a good idea.
> > >
> > >
> > > > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > > > ---
> > > > I did this when I worked on splitting PV and HVM and thought this
> > > > might be useful and it was simple enough to get done.
> > > >
> > > > RFC because I can envisage some configurations in the distant future
> > > > do away with grant table and event channel. There is small a benefit
> > > > to consider accepting this patch now so that Gitlab's randconf build
> > > > can start testing with grant table turned off right away.
> > >
> > > Can Gitlab do Arm hypervisor builds?
> >
> > Yes. I hooked up a box from WorksOnArm for Arm64 builds.
>
> Very nice!! You should write a blog post or something about it.
>

--0000000000006f5377057ff9e56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes! I&#39;d love to hear more about what you did, to help=
 me further promote Xen as a Works on Arm supported project. Also, I&#39;d =
love to hear more details about the Gitlab integration, as I am working dil=
igently to get arm64 support into their mainline roadmap.<div><br></div><di=
v>thanks</div><div><br></div><div>Ed</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 17, 2019 at 12:41 PM =
Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellin=
i@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 17 Jan 2019, Wei Liu wrote:<br>
&gt; On Thu, Jan 17, 2019 at 09:36:57AM -0800, Stefano Stabellini wrote:<br=
>
&gt; &gt; On Thu, 17 Jan 2019, Wei Liu wrote:<br>
&gt; &gt; &gt; Introduce CONFIG_GRANT_TABLE. Provide stubs and make sure x8=
6 and arm<br>
&gt; &gt; &gt; hypervisors build with grant table disabled.<br>
&gt; &gt; <br>
&gt; &gt; Looks like a good idea.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix=
.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; I did this when I worked on splitting PV and HVM and thought=
 this<br>
&gt; &gt; &gt; might be useful and it was simple enough to get done.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; RFC because I can envisage some configurations in the distan=
t future<br>
&gt; &gt; &gt; do away with grant table and event channel. There is small a=
 benefit<br>
&gt; &gt; &gt; to consider accepting this patch now so that Gitlab&#39;s ra=
ndconf build<br>
&gt; &gt; &gt; can start testing with grant table turned off right away.<br=
>
&gt; &gt; <br>
&gt; &gt; Can Gitlab do Arm hypervisor builds?<br>
&gt; <br>
&gt; Yes. I hooked up a box from WorksOnArm for Arm64 builds.<br>
<br>
Very nice!! You should write a blog post or something about it.<br>
</blockquote></div>

--0000000000006f5377057ff9e56a--


--===============3619954663533259951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3619954663533259951==--
