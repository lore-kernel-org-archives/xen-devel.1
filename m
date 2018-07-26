From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] xenconsole: add option to avoid escape
 sequences in log
Date: Wed, 25 Jul 2018 18:15:20 -0700
Message-ID: <CACMJ4GYzBQHdd-V=R1fMv+F6WTggtpbhmhCxNTzt8oCBAw8-LA@mail.gmail.com>
References: <20180721001412.26214-1-marmarek@invisiblethingslab.com>
 <20180725084939.fyb7gco34gonbsp3@citrix.com>
 <20180725085321.jaaro3xbqykyrzjs@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4387629828894050199=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180725085321.jaaro3xbqykyrzjs@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4387629828894050199==
Content-Type: multipart/alternative; boundary="0000000000009c7aac0571dcbae3"

--0000000000009c7aac0571dcbae3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2018 at 1:53 AM, Wei Liu <wei.liu2@citrix.com> wrote:

> On Wed, Jul 25, 2018 at 09:49:39AM +0100, Wei Liu wrote:
> > On Sat, Jul 21, 2018 at 02:14:12AM +0200, Marek Marczykowski-G=C3=B3rec=
ki
> wrote:
> >
> > > +
> > > +   memcpy(dest, buf, len);
> > > +   for (i =3D 0; i < len; i++) {
> > > +           if (dest[i] =3D=3D '\033')
> > > +                   dest[i] =3D '.';
> > > +   }
> >
> > This could be made more efficient by using:
> >
> >         for (i =3D 0; i < len; i++) {
> >              if (src[i] =3D=3D '\033')
> >                  dst[i] =3D '.';
> >              else
> >                  dst[i] =3D src[i];
>

The above code doesn't write the value that was checked into the
destination buffer; instead it does a second copy from the source buffer.
That is a problematic code pattern that we shouldn't really encourage.


>
> Oh this can even be written in a shorter form:
>
>   dst[i] =3D src[i] !=3D '\033' ?: '.';
>
>
That may be shorter but it is harder to understand, whereas Marek's
original code is clear and well structured.

One nit with the proposed patch is the introduction of the dynamically size
array on the stack, with input to the function determining its size:

>   static int write_all(int fd, const char* buf, size_t len)
>   {
> +       char buf_replaced[len];

That might be just fine for userspace code, but would it be better replaced
with a fixed size buffer and a loop instead?

Christopher

--0000000000009c7aac0571dcbae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 25, 2018 at 1:53 AM, Wei Liu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Wed, Jul 25, 2018 at 09:4=
9:39AM +0100, Wei Liu wrote:<br>
&gt; On Sat, Jul 21, 2018 at 02:14:12AM +0200, Marek Marczykowski-G=C3=B3re=
cki wrote:<br>&gt; <br>&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0memcpy(dest, buf, len);<br>
&gt; &gt; +=C2=A0 =C2=A0for (i =3D 0; i &lt; len; i++) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dest[i] =3D=3D &#39=
;\033&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dest[i] =3D &#39;.&#39;;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; This could be made more efficient by using:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; len; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (src[i] =3D=3D &#39=
;\033&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst[i] =
=3D &#39;.&#39;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst[i] =
=3D src[i];<br></div></div></blockquote><div><br></div><div><div>The above =
code doesn&#39;t write the value that was checked into the destination buff=
er; instead it does a second copy from the source buffer. That is a problem=
atic code pattern that we shouldn&#39;t really encourage.</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"gmail-HOEnZb"><div class=3D"gmail-h5">
<br>
</div></div>Oh this can even be written in a shorter form:<br>
<br>
=C2=A0 dst[i] =3D src[i] !=3D &#39;\033&#39; ?: &#39;.&#39;;<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br></div></div></block=
quote><div><br></div><div><div>That may be shorter but it is harder to unde=
rstand, whereas Marek&#39;s original code is clear and well structured.</di=
v></div><div><br></div><div><div>One nit with the proposed patch is the int=
roduction of the dynamically size array on the stack, with input to the fun=
ction determining its size:</div><div><br></div><div>&gt;=C2=A0 =C2=A0stati=
c int write_all(int fd, const char* buf, size_t len)</div><div>&gt;=C2=A0 =
=C2=A0{</div><div>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf_replaced[len];<=
/div><div><br></div><div>That might be just fine for userspace code, but wo=
uld it be better replaced with a fixed size buffer and a loop instead?</div=
></div><div><br></div><div>Christopher</div><div>=C2=A0</div></div></div></=
div>

--0000000000009c7aac0571dcbae3--


--===============4387629828894050199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4387629828894050199==--
