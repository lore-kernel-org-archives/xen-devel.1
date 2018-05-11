From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Subject: Re: domain_crash_sync vs "plain crash"
Date: Fri, 11 May 2018 19:46:50 -0300
Message-ID: <CAAQRGoAEvSHZ_8syG0Vah0vsFQxvG+5pk2DK5f+pgB13KZriAQ@mail.gmail.com>
References: <CAAQRGoCRJch7OLrCyOUUx9gUWpB07_+LBawXkTbCWZ1eii7Qtw@mail.gmail.com>
 <5AEFFB9A02000078001C1134@prv1-mh.provo.novell.com>
 <bb9f16d1-d634-98a4-23a5-a0554aa20a92@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4704362026520437711=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bb9f16d1-d634-98a4-23a5-a0554aa20a92@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4704362026520437711==
Content-Type: multipart/alternative; boundary="0000000000000d907f056bf5eac8"

--0000000000000d907f056bf5eac8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Andrew,

Despite SCHED_OP, that I've blacklisted, which one came to mind?


On Mon, May 7, 2018 at 5:13 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 07/05/2018 08:09, Jan Beulich wrote:
> >>>> On 07.05.18 at 03:06, <charles.fg@gmail.com> wrote:
> >> When I'm performing some hypercalls with some "unexpected" parameters
> >> (robustness test) sometimes the guest is explicitly  "killed" by xen
> >> calling the domain_crash(), but sometimes the guest just crash without
> any
> >> explicit message on dmesg or logs.
> >>
> >> Are those "plain crashes" an expected behavior by design on Xen or are
> they
> >> some untreated parameter checking or something else?
> > A silent crash is never supposed to happen, but you always need to firs=
t
> > consider whether the crashing component actually has a way to get
> > something out to wherever you monitor its logs. That is, without
> (physical
> > or virtual, depending on component) serial console you're often unlikel=
y
> to
> > actually observe any messages connected to the crash.
> >
> > If you can track down a _truly_ silent crash to its origin, submitting =
a
> patch
> > to make it non-silent would be appreciated.
>
> Alternatively, if you are fuzzing the hypercalls, which it sounds like
> you are, then you need to ensure that you blacklist operations such as
> SCHEDOP_shutdown and SCHEDOP_poll to avoid the fuzzer hitting legitimate
> hypercalls which shut down or block for indefinite periods of time.
>
> ~Andrew
>
--=20
Atenciosamente,
Charles F.'. Gon=C3=A7alves

--0000000000000d907f056bf5eac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">@Andrew,=C2=A0<div><br></div><div>Despite SCHED_OP, that I=
&#39;ve blacklisted, which one came to mind?=C2=A0</div><div><br><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Mon, May 7, 2018 at 5:13 AM Andrew=
 Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@cit=
rix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 07/05/201=
8 08:09, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; On 07.05.18 at 03:06, &lt;<a href=3D"mailto:charles.fg@gma=
il.com" target=3D"_blank">charles.fg@gmail.com</a>&gt; wrote:<br>
&gt;&gt; When I&#39;m performing some hypercalls with some &quot;unexpected=
&quot; parameters<br>
&gt;&gt; (robustness test) sometimes the guest is explicitly=C2=A0 &quot;ki=
lled&quot; by xen<br>
&gt;&gt; calling the domain_crash(), but sometimes the guest just crash wit=
hout any<br>
&gt;&gt; explicit message on dmesg or logs.<br>
&gt;&gt;<br>
&gt;&gt; Are those &quot;plain crashes&quot; an expected behavior by design=
 on Xen or are they<br>
&gt;&gt; some untreated parameter checking or something else?<br>
&gt; A silent crash is never supposed to happen, but you always need to fir=
st<br>
&gt; consider whether the crashing component actually has a way to get<br>
&gt; something out to wherever you monitor its logs. That is, without (phys=
ical<br>
&gt; or virtual, depending on component) serial console you&#39;re often un=
likely to<br>
&gt; actually observe any messages connected to the crash.<br>
&gt;<br>
&gt; If you can track down a _truly_ silent crash to its origin, submitting=
 a patch<br>
&gt; to make it non-silent would be appreciated.<br>
<br>
Alternatively, if you are fuzzing the hypercalls, which it sounds like<br>
you are, then you need to ensure that you blacklist operations such as<br>
SCHEDOP_shutdown and SCHEDOP_poll to avoid the fuzzer hitting legitimate<br=
>
hypercalls which shut down or block for indefinite periods of time.<br>
<br>
~Andrew<br>
</blockquote></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Atenciosamen=
te,=C2=A0</div>Charles F.&#39;. Gon=C3=A7alves</div></div>

--0000000000000d907f056bf5eac8--


--===============4704362026520437711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4704362026520437711==--
