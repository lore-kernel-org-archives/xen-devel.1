From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: Problem with IOMEM and domain reboot
Date: Mon, 12 Feb 2018 19:22:27 +0200
Message-ID: <CACvf2oUgzsigUDsFOQaaaAcj5XEoUv6b=VsfMyn_1V5feCM+cA@mail.gmail.com>
References: <ebf78aec-dcfd-72d9-dac2-06b29e4a66ae@gmail.com>
 <20180206123640.wifqw64camyfpobj@citrix.com>
 <267e7e75-9ef7-460b-15b2-0d9e450db5a7@gmail.com>
 <20180206125251.nirlx5ynwbzszrss@citrix.com>
 <02540760-c159-ec87-d41e-161033fafe13@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8923128700907687555=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=qqps=fg=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1elHoF-0001jD-0s
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 17:22:31 +0000
Received: by mail-io0-x231.google.com with SMTP id l17so18099890ioc.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2018 09:22:28 -0800 (PST)
In-Reply-To: <02540760-c159-ec87-d41e-161033fafe13@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8923128700907687555==
Content-Type: multipart/alternative; boundary="089e0826e9ac50882f0565071fd5"

--089e0826e9ac50882f0565071fd5
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 7, 2018 at 2:14 PM, Oleksandr Andrushchenko <andr2000@gmail.com>
wrote:

> On 02/06/2018 02:52 PM, Wei Liu wrote:
>
>> On Tue, Feb 06, 2018 at 02:44:56PM +0200, Oleksandr Andrushchenko wrote:
>>
>>>   From aa1f20af73a5a3c8f2c904b857a79334d18d41ff Mon Sep 17 00:00:00 2001
>>>
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>> Date: Wed, 20 Dec 2017 17:51:18 +0200
>>>>> Subject: [PATCH] [HACK] Reset iomem's gfn to LIBXL_INVALID_GFN on
>>>>> reboot
>>>>>
>>>>> During domain reboot its configuration is partially reused
>>>>> to re-create a new domain, but iomem's GFN field for the
>>>>> iomem is only restored for those memory ranges, which are
>>>>> configured in form of [IOMEM_START,NUM_PAGES[@GFN], but not for
>>>>> those in form of [IOMEM_START,NUM_PAGES], e.g. without GFN.
>>>>> For the latter GFN is reset to 0, but while mapping ranges
>>>>> to a domain during reboot there is a check that GFN treated
>>>>> as valid if it is not equal to LIBXL_INVALID_GFN, thus making
>>>>> Xen to map IOMEM_START to address 0 in the guest's address space.
>>>>>
>>>>> Workaround it by resseting GFN to LIBXL_INVALID_GFN, so xl
>>>>> can set proper values for mapping on reboot.
>>>>>
>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.
>>>>> com>
>>>>> ---
>>>>>    tools/libxl/libxl_domain.c | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
>>>>> index ef1a0927b00d..2678ad2ad54f 100644
>>>>> --- a/tools/libxl/libxl_domain.c
>>>>> +++ b/tools/libxl/libxl_domain.c
>>>>> @@ -1647,6 +1647,15 @@ int libxl_retrieve_domain_configuration(libxl_ctx
>>>>> *ctx, uint32_t domid,
>>>>>            }
>>>>>        }
>>>>> +    /* reset IOMEM's GFN to initial value */
>>>>> +    {
>>>>> +        int i;
>>>>> +
>>>>> +        for (i = 0; i < d_config->b_info.num_iomem; i++)
>>>>> +            if (d_config->b_info.iomem[i].gfn == 0)
>>>>> +                d_config->b_info.iomem[i].gfn = LIBXL_INVALID_GFN;
>>>>> +    }
>>>>> +
>>>>>
>>>> I don't think this is necessary. Instead we should tell libxl to save
>>>> the generated value into the template. Add an update_config hook for the
>>>> iomem type should be better.
>>>>
>>> Agree, this is why I tagged the patch as [HACK]
>>> Unfortunately, I have little knowledge of libxl and not sure
>>> how to properly fix it. Can you tell a bit more on what
>>> a proper fix could be?
>>>
>> See libxl__update_domain_configuration, which is called after domain
>> construction is completed. It will call the update_config hook for a
>> device type to save anything that is generated in the process of domain
>> creation. One example is in libxl_nic. You can do the same to iomem I
>> think.
>>
>> The end result is the generated values you care about are saved into the
>> template. When the domain is migrated / rebooted libxl will use the
>> saved values instead.
>>
> Thank you, will look at it to make a proper fix
>
> Strictly speaking your patch of adding the snippet to
>> libxl_retrieve_domain_configuration isn't wrong, but I would prefer that
>> function to only contain code to fetch states that can be changed during
>> domain runtime. The iomem range isn't one of those states AIUI.
>>
>> Wei.
>>
>>
>> Wei.
>>>>
>>> Thank you,
>>> Oleksandr
>>>
>>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel
>


Hi Wei,

The root cause of this problem is that auto generated code doesn't handle
default value when json is parsed. It is related not only IOMEM but
potentially some other structure as well.

Field "gfn" of libxl_iomem_range structure has default value
LIBXL_INVALID_GFN
which is not 0.

libxl_iomem_range = Struct("iomem_range", [
    ...
    ("gfn", uint64, {'init_val': "LIBXL_INVALID_GFN"}),
    ])

The default value is handled correctly when json is generated:

yajl_gen_status libxl_iomem_range_gen_json(yajl_gen hand, libxl_iomem_range
*p)
{
    ...

    if (p->gfn != LIBXL_INVALID_GFN) {
        s = yajl_gen_string(hand, (const unsigned char *)"gfn",
sizeof("gfn")-1);
        if (s != yajl_gen_status_ok)
            goto out;
        s = libxl__uint64_gen_json(hand, p->gfn);
        if (s != yajl_gen_status_ok)
            goto out;
    }

    ...
}

But when json is parsed, this "gfn" field is parsed as any other uint64
value.
As result we have 0 instead of LIBXL_INVALID_GFN.

int libxl__iomem_range_parse_json(libxl__gc *gc, const libxl__json_object
*o, libxl_iomem_range *p)
{
    ...

    {
        const libxl__json_object *saved_gfn = x;
        x = libxl__json_map_get("gfn", o, JSON_INTEGER);
        if (x) {
            rc = libxl__uint64_parse_json(gc, x, &p->gfn);
            if (rc)
                goto out;
        }
        x = saved_gfn;
    }
}

Is it done by design or there is an issue with parse_json?
If it is done by design then the solution proposed by you (update_config
hook)
will solve this problem. But handling default value in parse json looks
more correct.

-- 
Best Regards,
Oleksandr Grytsov.

--089e0826e9ac50882f0565071fd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Feb 7, 2018 at 2:14 PM, Oleksandr Andrushchenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andr2000@gmail.com" target=3D"_blank">andr2000@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div class=3D"gmail-m_-7595685037960029335HOEnZb"><div class=3D"gmail-m_-759=
5685037960029335h5">On 02/06/2018 02:52 PM, Wei Liu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
On Tue, Feb 06, 2018 at 02:44:56PM +0200, Oleksandr Andrushchenko wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 From aa1f20af73a5a3c8f2c904b857a793<wbr>34d18d41ff Mon Sep 17 00:00:=
00 2001<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
From: Oleksandr Andrushchenko &lt;<a href=3D"mailto:oleksandr_andrushchenko=
@epam.com" target=3D"_blank">oleksandr_andrushchenko@epam.<wbr>com</a>&gt;<=
br>
Date: Wed, 20 Dec 2017 17:51:18 +0200<br>
Subject: [PATCH] [HACK] Reset iomem&#39;s gfn to LIBXL_INVALID_GFN on reboo=
t<br>
<br>
During domain reboot its configuration is partially reused<br>
to re-create a new domain, but iomem&#39;s GFN field for the<br>
iomem is only restored for those memory ranges, which are<br>
configured in form of [IOMEM_START,NUM_PAGES[@GFN], but not for<br>
those in form of [IOMEM_START,NUM_PAGES], e.g. without GFN.<br>
For the latter GFN is reset to 0, but while mapping ranges<br>
to a domain during reboot there is a check that GFN treated<br>
as valid if it is not equal to LIBXL_INVALID_GFN, thus making<br>
Xen to map IOMEM_START to address 0 in the guest&#39;s address space.<br>
<br>
Workaround it by resseting GFN to LIBXL_INVALID_GFN, so xl<br>
can set proper values for mapping on reboot.<br>
<br>
Signed-off-by: Oleksandr Andrushchenko &lt;<a href=3D"mailto:oleksandr_andr=
ushchenko@epam.com" target=3D"_blank">oleksandr_andrushchenko@epam.<wbr>com=
</a>&gt;<br>
---<br>
=C2=A0 =C2=A0tools/libxl/libxl_domain.c | 9 +++++++++<br>
=C2=A0 =C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c<br>
index ef1a0927b00d..2678ad2ad54f 100644<br>
--- a/tools/libxl/libxl_domain.c<br>
+++ b/tools/libxl/libxl_domain.c<br>
@@ -1647,6 +1647,15 @@ int libxl_retrieve_domain_configur<wbr>ation(libxl_c=
tx *ctx, uint32_t domid,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 /* reset IOMEM&#39;s GFN to initial value */<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;b_info.num_i=
omem; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d_config-&gt;b_info.iomem[i]=
.gfn =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d_config-&gt;b_inf=
o.iomem[i].gfn =3D LIBXL_INVALID_GFN;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
</blockquote>
I don&#39;t think this is necessary. Instead we should tell libxl to save<b=
r>
the generated value into the template. Add an update_config hook for the<br=
>
iomem type should be better.<br>
</blockquote>
Agree, this is why I tagged the patch as [HACK]<br>
Unfortunately, I have little knowledge of libxl and not sure<br>
how to properly fix it. Can you tell a bit more on what<br>
a proper fix could be?<br>
</blockquote>
See libxl__update_domain_configura<wbr>tion, which is called after domain<b=
r>
construction is completed. It will call the update_config hook for a<br>
device type to save anything that is generated in the process of domain<br>
creation. One example is in libxl_nic. You can do the same to iomem I<br>
think.<br>
<br>
The end result is the generated values you care about are saved into the<br=
>
template. When the domain is migrated / rebooted libxl will use the<br>
saved values instead.<br>
</blockquote></div></div>
Thank you, will look at it to make a proper fix<div class=3D"gmail-m_-75956=
85037960029335HOEnZb"><div class=3D"gmail-m_-7595685037960029335h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Strictly speaking your patch of adding the snippet to<br>
libxl_retrieve_domain_configur<wbr>ation isn&#39;t wrong, but I would prefe=
r that<br>
function to only contain code to fetch states that can be changed during<br=
>
domain runtime. The iomem range isn&#39;t one of those states AIUI.<br>
<br>
Wei.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
Wei.<br>
</blockquote>
Thank you,<br>
Oleksandr<br>
</blockquote></blockquote>
<br>
<br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/m<wbr>ailman/lis=
tinfo/xen-devel</a></div></div></blockquote></div><br></div><div class=3D"g=
mail_extra"><br>Hi Wei,<br></div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">The root cause of this problem is that auto generated=
 code doesn&#39;t handle<br></div><div class=3D"gmail_extra">default value =
when json is parsed. It is related not only IOMEM but <br></div><div class=
=3D"gmail_extra">potentially some other structure as well.=C2=A0 <br></div>=
<div class=3D"gmail_extra"><br>Field &quot;gfn&quot; of libxl_iomem_range s=
tructure has default value LIBXL_INVALID_GFN<br></div><div class=3D"gmail_e=
xtra">which is not 0.<br></div><div class=3D"gmail_extra"><br>libxl_iomem_r=
ange =3D Struct(&quot;iomem_range&quot;, [<br>=C2=A0=C2=A0=C2=A0 ...<br>=C2=
=A0=C2=A0=C2=A0 (&quot;gfn&quot;, uint64, {&#39;init_val&#39;: &quot;LIBXL_=
INVALID_GFN&quot;}),<br>=C2=A0=C2=A0=C2=A0 ])<br><br></div><div class=3D"gm=
ail_extra">The default value is handled correctly when json is generated:<b=
r></div><div class=3D"gmail_extra"><br>yajl_gen_status libxl_iomem_range_ge=
n_json(yajl_gen hand, libxl_iomem_range *p)<br>{<br>=C2=A0=C2=A0=C2=A0 ...<=
br><br>=C2=A0=C2=A0=C2=A0 if (p-&gt;gfn !=3D LIBXL_INVALID_GFN) {<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s =3D yajl_gen_string(hand, (const uns=
igned char *)&quot;gfn&quot;, sizeof(&quot;gfn&quot;)-1);<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (s !=3D yajl_gen_status_ok)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s =3D libxl__uint64_gen_json(hand, =
p-&gt;gfn);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (s !=3D yajl_g=
en_status_ok)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 goto out;<br>=C2=A0=C2=A0=C2=A0 }<br>=C2=A0 <br>=C2=A0=C2=A0=C2=
=A0 ...<br>}<br><br></div><div class=3D"gmail_extra">But when json is parse=
d, this &quot;gfn&quot; field is parsed as any other uint64 value.<br></div=
><div class=3D"gmail_extra">As result we have 0 instead of LIBXL_INVALID_GF=
N.<br></div><div class=3D"gmail_extra"><br>int libxl__iomem_range_parse_jso=
n(libxl__gc *gc, const libxl__json_object *o, libxl_iomem_range *p)<br>{<br=
>=C2=A0=C2=A0=C2=A0 ...<br><br>=C2=A0=C2=A0=C2=A0 {<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const libxl__json_object *saved_gfn =3D x;<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x =3D libxl__json_map_get(&quot;gfn=
&quot;, o, JSON_INTEGER);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(x) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 rc =3D libxl__uint64_parse_json(gc, x, &amp;p-&gt;gfn);<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rc)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto out;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x =3D saved_gfn;<br>=C2=A0=C2=A0=C2=A0 }<=
br>}<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Is it done by design or there is an issue with parse_json?<br></div><div=
 class=3D"gmail_extra">If it is done by design then the solution proposed b=
y you (update_config hook)<br>will solve this problem. But handling default=
 value in parse json looks more correct.<br><br></div><div class=3D"gmail_e=
xtra">-- <br><div class=3D"gmail-m_-7595685037960029335gmail_signature">Bes=
t Regards,<br>Oleksandr Grytsov.</div>
</div></div>

--089e0826e9ac50882f0565071fd5--


--===============8923128700907687555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8923128700907687555==--
