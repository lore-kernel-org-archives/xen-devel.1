From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v1 2/5] libxl: add vsnd list and info
Date: Thu, 8 Feb 2018 16:40:31 +0200
Message-ID: <CACvf2oW7KG0QUTyP+thxJSKJk495S50qGgv_TB4mQ0qxu1jwwg@mail.gmail.com>
References: <1509548687-6071-1-git-send-email-al1img@gmail.com>
 <1509548687-6071-3-git-send-email-al1img@gmail.com>
 <20180206144347.jqthpwxstckd2voc@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3790598991620680823=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=aijf=fc=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1ejnNJ-00012j-Nv
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 14:40:33 +0000
Received: by mail-io0-x244.google.com with SMTP id f89so5999280ioj.4
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2018 06:40:32 -0800 (PST)
In-Reply-To: <20180206144347.jqthpwxstckd2voc@citrix.com>
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

--===============3790598991620680823==
Content-Type: multipart/alternative; boundary="94eb2c059b36cfbee90564b46407"

--94eb2c059b36cfbee90564b46407
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 6, 2018 at 4:43 PM, Wei Liu <wei.liu2@citrix.com> wrote:

> On Wed, Nov 01, 2017 at 05:04:44PM +0200, Oleksandr Grytsov wrote:
> > From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> >
> > Add getting vsnd list amd info API
> >
> > Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> > ---
> >  tools/libxl/libxl.h         |  10 ++
> >  tools/libxl/libxl_types.idl |  19 +++
> >  tools/libxl/libxl_utils.h   |   3 +
> >  tools/libxl/libxl_vsnd.c    | 375 ++++++++++++++++++++++++++++++
> +++++++++++++-
> >  4 files changed, 404 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
> > index 7200d49..acb73ce 100644
> > --- a/tools/libxl/libxl.h
> > +++ b/tools/libxl/libxl.h
> > @@ -1927,6 +1927,16 @@ int libxl_device_vsnd_destroy(libxl_ctx *ctx,
> uint32_t domid,
> >                                const libxl_asyncop_how *ao_how)
> >                                LIBXL_EXTERNAL_CALLERS_ONLY;
> >
> > +libxl_device_vsnd *libxl_device_vsnd_list(libxl_ctx *ctx,
> > +                                          uint32_t domid, int *num)
> > +                                          LIBXL_EXTERNAL_CALLERS_ONLY;
> > +void libxl_device_vsnd_list_free(libxl_device_vsnd* list, int num)
> > +                                 LIBXL_EXTERNAL_CALLERS_ONLY;
> > +int libxl_device_vsnd_getinfo(libxl_ctx *ctx, uint32_t domid,
> > +                              libxl_device_vsnd *vsnd,
> > +                              libxl_vsndinfo *vsndlinfo)
> > +                              LIBXL_EXTERNAL_CALLERS_ONLY;
> > +
> >  /* Keyboard */
> >  int libxl_device_vkb_add(libxl_ctx *ctx, uint32_t domid,
> libxl_device_vkb *vkb,
> >                           const libxl_asyncop_how *ao_how)
> > diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> > index aa30196..553e724 100644
> > --- a/tools/libxl/libxl_types.idl
> > +++ b/tools/libxl/libxl_types.idl
> > @@ -988,6 +988,25 @@ libxl_vdisplinfo = Struct("vdisplinfo", [
> >      ("connectors", Array(libxl_connectorinfo, "num_connectors"))
> >      ], dir=DIR_OUT)
> >
> > +libxl_streaminfo = Struct("streaminfo", [
> > +    ("req_evtch", integer),
> > +    ("req_rref", integer)
> > +    ])
> > +
> > +libxl_pcminfo = Struct("pcminfo", [
> > +    ("streams", Array(libxl_streaminfo, "num_vsnd_streams"))
> > +    ])
> > +
> > +libxl_vsndinfo = Struct("vsndinfo", [
> > +    ("backend", string),
> > +    ("backend_id", uint32),
> > +    ("frontend", string),
> > +    ("frontend_id", uint32),
> > +    ("devid", libxl_devid),
> > +    ("state", integer),
> > +    ("pcms", Array(libxl_pcminfo, "num_vsnd_pcms"))
> > +    ])
> > +
> >  # NUMA node characteristics: size and free are how much memory it has,
> and how
> >  # much of it is free, respectively. dists is an array of distances from
> this
> >  # node to each other node.
> > diff --git a/tools/libxl/libxl_utils.h b/tools/libxl/libxl_utils.h
> > index 9e743dc..5455752 100644
> > --- a/tools/libxl/libxl_utils.h
> > +++ b/tools/libxl/libxl_utils.h
> > @@ -82,6 +82,9 @@ int libxl_devid_to_device_usbctrl(libxl_ctx *ctx,
> uint32_t domid,
> >  int libxl_devid_to_device_vdispl(libxl_ctx *ctx, uint32_t domid,
> >                                   int devid, libxl_device_vdispl
> *vdispl);
> >
> > +int libxl_devid_to_device_vsnd(libxl_ctx *ctx, uint32_t domid,
> > +                               int devid, libxl_device_vsnd *vsnd);
> > +
> >  int libxl_ctrlport_to_device_usbdev(libxl_ctx *ctx, uint32_t domid,
> >                                      int ctrl, int port,
> >                                      libxl_device_usbdev *usbdev);
> > diff --git a/tools/libxl/libxl_vsnd.c b/tools/libxl/libxl_vsnd.c
> > index 99e4be3..35f1aed 100644
> > --- a/tools/libxl/libxl_vsnd.c
> > +++ b/tools/libxl/libxl_vsnd.c
> > @@ -37,22 +37,247 @@ static int libxl__device_from_vsnd(libxl__gc *gc,
> uint32_t domid,
> >     return 0;
> >  }
> >
> > +static int libxl__sample_rates_from_string(libxl__gc *gc, const char
> *str,
> > +                                           libxl_vsnd_params *params)
> > +{
> > +    char *tmp = libxl__strdup(gc, str);
> > +
> > +    params->num_sample_rates = 0;
> > +    params->sample_rates = NULL;
> > +
> > +    char *p = strtok(tmp, " ,");
> > +
> > +    while (p != NULL) {
> > +        params->sample_rates = realloc(params->sample_rates,
> > +                                       sizeof(*params->sample_rates) *
> > +                                       (params->num_sample_rates + 1));
>
> This is problematic. You need to check if realloc returns NULL before
> overwriting sample_rates.
>
> It is also a bit expensive to realloc 1 element at a time. Is is
> possible to know the size before hand? If not, then fine.
>
> Please use libxl__realloc instead. We have quite a few wrappers in
> libxl. In general please use them unless you have very compelling reason
> not to.
>
> There could be other places in your two series that I missed, please fix
> them.
>
> Wei.
>

Yes, I agree that it is bit expensive to make realloc for each element.
I will count num elements before. About using realloc instead of
libxl_realloc in this place. it is autogenerated structure and it will be
freed with appropriate API. Using libxl__realloc will cause double free
issue.

-- 
Best Regards,
Oleksandr Grytsov.

--94eb2c059b36cfbee90564b46407
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 6, 2018 at 4:43 PM, Wei Liu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><d=
iv class=3D"h5">On Wed, Nov 01, 2017 at 05:04:44PM +0200, Oleksandr Grytsov=
 wrote:<br>
&gt; From: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.c=
om">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt;<br>
&gt; Add getting vsnd list amd info API<br>
&gt;<br>
&gt; Signed-off-by: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_gryts=
ov@epam.com">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tools/libxl/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 =
++<br>
&gt;=C2=A0 tools/libxl/libxl_types.idl |=C2=A0 19 +++<br>
&gt;=C2=A0 tools/libxl/libxl_utils.h=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 tools/libxl/libxl_vsnd.c=C2=A0 =C2=A0 | 375 ++++++++++++++++++++=
++++++++++<wbr>+++++++++++++-<br>
&gt;=C2=A0 4 files changed, 404 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h<br>
&gt; index 7200d49..acb73ce 100644<br>
&gt; --- a/tools/libxl/libxl.h<br>
&gt; +++ b/tools/libxl/libxl.h<br>
&gt; @@ -1927,6 +1927,16 @@ int libxl_device_vsnd_destroy(<wbr>libxl_ctx *c=
tx, uint32_t domid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const libxl_asyncop_how *ao_how)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBXL_EXTERNAL_CALLERS_ONLY;<br>
&gt;<br>
&gt; +libxl_device_vsnd *libxl_device_vsnd_list(libxl_<wbr>ctx *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t domid, int *num)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LIBXL_EXTERNAL_CALLERS_ONLY;<br>
&gt; +void libxl_device_vsnd_list_free(<wbr>libxl_device_vsnd* list, int nu=
m)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBXL_EXTERNAL_CALLERS_ONL=
Y;<br>
&gt; +int libxl_device_vsnd_getinfo(<wbr>libxl_ctx *ctx, uint32_t domid,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device_vsnd *vsnd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_vsndinfo *vsndlinfo)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBXL_EXTERNAL_CALLERS_ONLY;<br>
&gt; +<br>
&gt;=C2=A0 /* Keyboard */<br>
&gt;=C2=A0 int libxl_device_vkb_add(libxl_ctx *ctx, uint32_t domid, libxl_d=
evice_vkb *vkb,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const libxl_asyncop_how *ao_how)<br>
&gt; diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl=
<br>
&gt; index aa30196..553e724 100644<br>
&gt; --- a/tools/libxl/libxl_types.idl<br>
&gt; +++ b/tools/libxl/libxl_types.idl<br>
&gt; @@ -988,6 +988,25 @@ libxl_vdisplinfo =3D Struct(&quot;vdisplinfo&quot=
;, [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (&quot;connectors&quot;, Array(libxl_connectorinfo=
, &quot;num_connectors&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ], dir=3DDIR_OUT)<br>
&gt;<br>
&gt; +libxl_streaminfo =3D Struct(&quot;streaminfo&quot;, [<br>
&gt; +=C2=A0 =C2=A0 (&quot;req_evtch&quot;, integer),<br>
&gt; +=C2=A0 =C2=A0 (&quot;req_rref&quot;, integer)<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt; +libxl_pcminfo =3D Struct(&quot;pcminfo&quot;, [<br>
&gt; +=C2=A0 =C2=A0 (&quot;streams&quot;, Array(libxl_streaminfo, &quot;num=
_vsnd_streams&quot;))<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt; +libxl_vsndinfo =3D Struct(&quot;vsndinfo&quot;, [<br>
&gt; +=C2=A0 =C2=A0 (&quot;backend&quot;, string),<br>
&gt; +=C2=A0 =C2=A0 (&quot;backend_id&quot;, uint32),<br>
&gt; +=C2=A0 =C2=A0 (&quot;frontend&quot;, string),<br>
&gt; +=C2=A0 =C2=A0 (&quot;frontend_id&quot;, uint32),<br>
&gt; +=C2=A0 =C2=A0 (&quot;devid&quot;, libxl_devid),<br>
&gt; +=C2=A0 =C2=A0 (&quot;state&quot;, integer),<br>
&gt; +=C2=A0 =C2=A0 (&quot;pcms&quot;, Array(libxl_pcminfo, &quot;num_vsnd_=
pcms&quot;))<br>
&gt; +=C2=A0 =C2=A0 ])<br>
&gt; +<br>
&gt;=C2=A0 # NUMA node characteristics: size and free are how much memory i=
t has, and how<br>
&gt;=C2=A0 # much of it is free, respectively. dists is an array of distanc=
es from this<br>
&gt;=C2=A0 # node to each other node.<br>
&gt; diff --git a/tools/libxl/libxl_utils.h b/tools/libxl/libxl_utils.h<br>
&gt; index 9e743dc..5455752 100644<br>
&gt; --- a/tools/libxl/libxl_utils.h<br>
&gt; +++ b/tools/libxl/libxl_utils.h<br>
&gt; @@ -82,6 +82,9 @@ int libxl_devid_to_device_usbctrl(<wbr>libxl_ctx *ct=
x, uint32_t domid,<br>
&gt;=C2=A0 int libxl_devid_to_device_vdispl(<wbr>libxl_ctx *ctx, uint32_t d=
omid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int devid, libxl_dev=
ice_vdispl *vdispl);<br>
&gt;<br>
&gt; +int libxl_devid_to_device_vsnd(<wbr>libxl_ctx *ctx, uint32_t domid,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int devid, libxl_device_vsnd *vsn=
d);<br>
&gt; +<br>
&gt;=C2=A0 int libxl_ctrlport_to_device_<wbr>usbdev(libxl_ctx *ctx, uint32_=
t domid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ctrl, in=
t port,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device=
_usbdev *usbdev);<br>
&gt; diff --git a/tools/libxl/libxl_vsnd.c b/tools/libxl/libxl_vsnd.c<br>
&gt; index 99e4be3..35f1aed 100644<br>
&gt; --- a/tools/libxl/libxl_vsnd.c<br>
&gt; +++ b/tools/libxl/libxl_vsnd.c<br>
&gt; @@ -37,22 +37,247 @@ static int libxl__device_from_vsnd(libxl_<wbr>_gc=
 *gc, uint32_t domid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static int libxl__sample_rates_from_<wbr>string(libxl__gc *gc, const =
char *str,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libxl_vsnd_params *params)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 char *tmp =3D libxl__strdup(gc, str);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 params-&gt;num_sample_rates =3D 0;<br>
&gt; +=C2=A0 =C2=A0 params-&gt;sample_rates =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 char *p =3D strtok(tmp, &quot; ,&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while (p !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;sample_rates =3D realloc(param=
s-&gt;sample_rates,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeo=
f(*params-&gt;sample_rates) *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(para=
ms-&gt;num_sample_rates + 1));<br>
<br>
</div></div>This is problematic. You need to check if realloc returns NULL =
before<br>
overwriting sample_rates.<br>
<br>
It is also a bit expensive to realloc 1 element at a time. Is is<br>
possible to know the size before hand? If not, then fine.<br>
<br>
Please use libxl__realloc instead. We have quite a few wrappers in<br>
libxl. In general please use them unless you have very compelling reason<br=
>
not to.<br>
<br>
There could be other places in your two series that I missed, please fix<br=
>
them.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Wei.<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">Yes, =
I agree that it is bit expensive to make realloc for each element.<br></div=
><div class=3D"gmail_extra">I will count num elements before. About using r=
ealloc instead of<br>libxl_realloc in this place. it is autogenerated struc=
ture and it will be<br></div><div class=3D"gmail_extra">freed with appropri=
ate API. Using libxl__realloc will cause double free<br></div><div class=3D=
"gmail_extra">issue.<br></div><div class=3D"gmail_extra"><br>-- <br><div cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Best Regards,<br=
>Oleksandr Grytsov.</div>
</div></div>

--94eb2c059b36cfbee90564b46407--


--===============3790598991620680823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3790598991620680823==--
