From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v1 3/6] libxl: add backend type and id to vkb
Date: Tue, 6 Feb 2018 18:45:15 +0200
Message-ID: <CACvf2oXxVy4LT7CCy7tv+PSTDALwESFNVsthGO_NkDqtHRecaA@mail.gmail.com>
References: <1509548707-6134-1-git-send-email-al1img@gmail.com>
 <1509548707-6134-4-git-send-email-al1img@gmail.com>
 <20180206142522.pe5mg2yzga6weagk@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2247112149724470494=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=axhc=fa=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1ej6Mw-0001a7-0S
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 16:45:18 +0000
Received: by mail-io0-x241.google.com with SMTP id d13so3154466iog.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2018 08:45:16 -0800 (PST)
In-Reply-To: <20180206142522.pe5mg2yzga6weagk@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============2247112149724470494==
Content-Type: multipart/alternative; boundary="001a113ed3c839184405648de7cd"

--001a113ed3c839184405648de7cd
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 6, 2018 at 4:25 PM, Wei Liu <wei.liu2@citrix.com> wrote:

> On Wed, Nov 01, 2017 at 05:05:04PM +0200, Oleksandr Grytsov wrote:
> > From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> >
> > New field backend_type is added to vkb device
> > in order to have QEMU and user space backend
> > simultaneously. Each vkb backend shall read
> > appropriate XS entry and service only own
> > frontends.
> > Id is a string field which used by the backend
> > to indentify the frontend.
> >
> > Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> > ---
> >  tools/libxl/libxl_create.c  |  3 +++
> >  tools/libxl/libxl_dm.c      |  1 +
> >  tools/libxl/libxl_types.idl |  8 ++++++++
> >  tools/libxl/libxl_vkb.c     | 33 ++++++++++++++++++++++++++++++++-
> >  4 files changed, 44 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> > index f813114..60d8686 100644
> > --- a/tools/libxl/libxl_create.c
> > +++ b/tools/libxl/libxl_create.c
> > @@ -1376,6 +1376,9 @@ static void domcreate_launch_dm(libxl__egc *egc,
> libxl__multidev *multidev,
> >          for (i = 0; i < d_config->num_vfbs; i++) {
> >              libxl__device_add(gc, domid, &libxl__vfb_devtype,
> >                                &d_config->vfbs[i]);
> > +        }
> > +
> > +        for (i = 0; i < d_config->num_vkbs; i++) {
> >              libxl__device_add(gc, domid, &libxl__vkb_devtype,
> >                                &d_config->vkbs[i]);
> >          }
> > diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> > index 98f89a9..f07de35 100644
> > --- a/tools/libxl/libxl_dm.c
> > +++ b/tools/libxl/libxl_dm.c
> > @@ -1728,6 +1728,7 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc
> *gc,
> >
> >      vkb->backend_domid = 0;
> >      vkb->devid = 0;
> > +
>
> Stray change. I don't have objection though.
>
> >      return 0;
> >  }
> >
> > diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> > index cd0c06f..c3876a2 100644
> > --- a/tools/libxl/libxl_types.idl
> > +++ b/tools/libxl/libxl_types.idl
> > @@ -240,6 +240,12 @@ libxl_checkpointed_stream =
> Enumeration("checkpointed_stream", [
> >      (2, "COLO"),
> >      ])
> >
> > +libxl_vkb_backend = Enumeration("vkb_backend", [
> > +    (0, "UNKNOWN"),
> > +    (1, "QEMU"),
> > +    (2, "LINUX")
> > +    ])
> > +
> >  #
> >  # Complex libxl types
> >  #
> > @@ -603,6 +609,8 @@ libxl_device_vkb = Struct("device_vkb", [
> >      ("backend_domid", libxl_domid),
> >      ("backend_domname", string),
> >      ("devid", libxl_devid),
> > +    ("backend_type", libxl_vkb_backend),
> > +    ("id", string)
> >      ])
> >
> >  libxl_device_disk = Struct("device_disk", [
> > diff --git a/tools/libxl/libxl_vkb.c b/tools/libxl/libxl_vkb.c
> > index ea6fca8..88ab186 100644
> > --- a/tools/libxl/libxl_vkb.c
> > +++ b/tools/libxl/libxl_vkb.c
> > @@ -17,6 +17,10 @@
> >  static int libxl__device_vkb_setdefault(libxl__gc *gc, uint32_t domid,
> >                                          libxl_device_vkb *vkb, bool
> hotplug)
> >  {
> > +    if (vkb->backend_type == LIBXL_VKB_BACKEND_UNKNOWN) {
> > +        vkb->backend_type = LIBXL_VKB_BACKEND_QEMU;
> > +    }
> > +
> >      return libxl__resolve_domid(gc, vkb->backend_domname,
> &vkb->backend_domid);
> >  }
> >
> > @@ -34,6 +38,30 @@ static int libxl__device_from_vkb(libxl__gc *gc,
> uint32_t domid,
> >      return 0;
> >  }
> >
> > +static int libxl__device_vkb_dm_needed(libxl_device_vkb *vkb, uint32_t
> domid)
> > +{
> > +   if (vkb->backend_type == LIBXL_VKB_BACKEND_QEMU) {
> > +        return 1;
> > +   }
>
> No need to have {} for a single statement here.
>
> > +
> > +    return 0;
> > +}
> > +
> > +static int libxl__set_xenstore_vkb(libxl__gc *gc, uint32_t domid,
> > +                                   libxl_device_vkb *vkb,
> > +                                   flexarray_t *back, flexarray_t
> *front,
> > +                                   flexarray_t *ro_front)
> > +{
> > +    if (vkb->id) {
> > +        flexarray_append_pair(front, "id", vkb->id);
> > +    }
> > +
>
> Ditto.
>
> And, isn't 0 a valid device id?
>
>
id here is char *. I put it to xenstore only if it is defined. It shall be
defined for linux backend
in case of multiple instances of kbd device are defined. The backend
distinguishes them
by id.

Wei.
>



-- 
Best Regards,
Oleksandr Grytsov.

--001a113ed3c839184405648de7cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 6, 2018 at 4:25 PM, Wei Liu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><d=
iv class=3D"h5">On Wed, Nov 01, 2017 at 05:05:04PM +0200, Oleksandr Grytsov=
 wrote:<br>
&gt; From: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.c=
om">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt;<br>
&gt; New field backend_type is added to vkb device<br>
&gt; in order to have QEMU and user space backend<br>
&gt; simultaneously. Each vkb backend shall read<br>
&gt; appropriate XS entry and service only own<br>
&gt; frontends.<br>
&gt; Id is a string field which used by the backend<br>
&gt; to indentify the frontend.<br>
&gt;<br>
&gt; Signed-off-by: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_gryts=
ov@epam.com">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tools/libxl/libxl_create.c=C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 tools/libxl/libxl_dm.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 tools/libxl/libxl_types.idl |=C2=A0 8 ++++++++<br>
&gt;=C2=A0 tools/libxl/libxl_vkb.c=C2=A0 =C2=A0 =C2=A0| 33 ++++++++++++++++=
++++++++++++++<wbr>++-<br>
&gt;=C2=A0 4 files changed, 44 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c<b=
r>
&gt; index f813114..60d8686 100644<br>
&gt; --- a/tools/libxl/libxl_create.c<br>
&gt; +++ b/tools/libxl/libxl_create.c<br>
&gt; @@ -1376,6 +1376,9 @@ static void domcreate_launch_dm(libxl__egc *egc,=
 libxl__multidev *multidev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;nu=
m_vfbs; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl__device_add(gc, =
domid, &amp;libxl__vfb_devtype,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;d_config-&gt;vfbs[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;num_vkb=
s; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl__device_add(gc, =
domid, &amp;libxl__vkb_devtype,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;d_config-&gt;vkbs[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c<br>
&gt; index 98f89a9..f07de35 100644<br>
&gt; --- a/tools/libxl/libxl_dm.c<br>
&gt; +++ b/tools/libxl/libxl_dm.c<br>
&gt; @@ -1728,6 +1728,7 @@ static int libxl__vfb_and_vkb_from_hvm_<wbr>gues=
t_config(libxl__gc *gc,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vkb-&gt;backend_domid =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vkb-&gt;devid =3D 0;<br>
&gt; +<br>
<br>
</div></div>Stray change. I don&#39;t have objection though.<br>
<div><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl=
<br>
&gt; index cd0c06f..c3876a2 100644<br>
&gt; --- a/tools/libxl/libxl_types.idl<br>
&gt; +++ b/tools/libxl/libxl_types.idl<br>
&gt; @@ -240,6 +240,12 @@ libxl_checkpointed_stream =3D Enumeration(&quot;c=
heckpointed_<wbr>stream&quot;, [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (2, &quot;COLO&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt;<br>
&gt; +libxl_vkb_backend =3D Enumeration(&quot;vkb_backend&quot;, [<br>
&gt; +=C2=A0 =C2=A0 (0, &quot;UNKNOWN&quot;),<br>
&gt; +=C2=A0 =C2=A0 (1, &quot;QEMU&quot;),<br>
&gt; +=C2=A0 =C2=A0 (2, &quot;LINUX&quot;)<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Complex libxl types<br>
&gt;=C2=A0 #<br>
&gt; @@ -603,6 +609,8 @@ libxl_device_vkb =3D Struct(&quot;device_vkb&quot;=
, [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (&quot;backend_domid&quot;, libxl_domid),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (&quot;backend_domname&quot;, string),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (&quot;devid&quot;, libxl_devid),<br>
&gt; +=C2=A0 =C2=A0 (&quot;backend_type&quot;, libxl_vkb_backend),<br>
&gt; +=C2=A0 =C2=A0 (&quot;id&quot;, string)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ])<br>
&gt;<br>
&gt;=C2=A0 libxl_device_disk =3D Struct(&quot;device_disk&quot;, [<br>
&gt; diff --git a/tools/libxl/libxl_vkb.c b/tools/libxl/libxl_vkb.c<br>
&gt; index ea6fca8..88ab186 100644<br>
&gt; --- a/tools/libxl/libxl_vkb.c<br>
&gt; +++ b/tools/libxl/libxl_vkb.c<br>
&gt; @@ -17,6 +17,10 @@<br>
&gt;=C2=A0 static int libxl__device_vkb_setdefault(<wbr>libxl__gc *gc, uint=
32_t domid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libxl_device_vkb *vkb, bool hotplug)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 if (vkb-&gt;backend_type =3D=3D LIBXL_VKB_BACKEND_UNKNO=
WN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vkb-&gt;backend_type =3D LIBXL_VKB_BACKEN=
D_QEMU;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return libxl__resolve_domid(gc, vkb-&gt;backend_do=
mname, &amp;vkb-&gt;backend_domid);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -34,6 +38,30 @@ static int libxl__device_from_vkb(libxl__<wbr>gc *g=
c, uint32_t domid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static int libxl__device_vkb_dm_needed(<wbr>libxl_device_vkb *vkb, ui=
nt32_t domid)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0if (vkb-&gt;backend_type =3D=3D LIBXL_VKB_BACKEND_QEMU) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; +=C2=A0 =C2=A0}<br>
<br>
</div></div>No need to have {} for a single statement here.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int libxl__set_xenstore_vkb(libxl_<wbr>_gc *gc, uint32_t domid=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl_device_vkb *v=
kb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flexarray_t *back, =
flexarray_t *front,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flexarray_t *ro_fro=
nt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (vkb-&gt;id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 flexarray_append_pair(front, &quot;id&quo=
t;, vkb-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
</span>Ditto.<br>
<br>
And, isn&#39;t 0 a valid device id?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br>id here is char *. I put it to xenstore only if it is defined. =
It shall be defined for linux backend<br></div><div>in case of multiple ins=
tances of kbd device are defined. The backend distinguishes them<br></div><=
div>by id.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"HOEnZb"><font color=3D"#888888">
Wei.<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">Best Regards,<br>O=
leksandr Grytsov.</div>
</div></div>

--001a113ed3c839184405648de7cd--


--===============2247112149724470494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2247112149724470494==--
