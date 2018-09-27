From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Thu, 27 Sep 2018 16:05:24 +0530
Message-ID: <CAC4nxbvh6LA=t2iEdiw2UrqrQP3Zf2NtRcViJ1YNGZkyLZqYHg@mail.gmail.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4428069996853167348=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr_Andrushchenko@epam.com
Cc: jgross@suse.com, xen-devel@lists.xensource.com, andr2000@gmail.com, lars.kurth.xen@gmail.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============4428069996853167348==
Content-Type: multipart/alternative; boundary="00000000000031cf0b0576d7e6c5"

--00000000000031cf0b0576d7e6c5
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry, I forgot, I used code from github chapter [2] from that link, and
I just changed name "mydevice"  to "vdevb"

> Error 13 is EACCESS. I guess the access rights of the Xenstore nodes
> are not sufficient to write the needed entries.
Where I have to provide access rights, i.e from Kernel code or from from
command line in domain-0 or modify in xen source?
Any thing that I have to do/change in xenbits xen-4.8 sources code, to add
new PV device?

> Did you modify Xen tools (xl/libxl) for adding the new device type?
No, is it needed to modify some thing in xl/libxl for adding new device
type?

> If not you need to setup the Xenstore nodes manually.
Setup manually Xenstore means, using commands?

Thanks,
Omkar B




On Thu, Sep 27, 2018 at 3:50 PM Oleksandr Andrushchenko <
Oleksandr_Andrushchenko@epam.com> wrote:

> On 09/27/2018 01:16 PM, Juergen Gross wrote:
> > On 27/09/2018 12:07, Oleksandr Andrushchenko wrote:
> >> Hi,
> >> On 09/27/2018 12:39 PM, Lars Kurth wrote:
> >>> Adding a few people who have recently been working on PV drivers, as
> >>> well as Julien
> >>> Lars
> >>>
> >>>> On 27 Sep 2018, at 06:44, Omkar Bolla
> >>>> <omkar.bolla@pathpartnertech.com
> >>>> <mailto:omkar.bolla@pathpartnertech.com>> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> I am using Debian as Domain-0 and Debian as Domain-U on Hikey960
> >>>> platform(ARMv8) and using Xen-4.8 stable release. Here I want to
> >>>> create a PV frontend and backend to share memory between Domain-0 and
> >>>> Domain-U.
> >>>>
> >>>>
> >>>>
> >>>> I used below link to create frontend and backend,
> >>>> https://fnordig.de/2016/12/02/xen-a-backend-frontend-driver-example/
> >> The link above has another link to github [1] with 2 chapters. And it
> >> looks like you have
> >> already modified the sources ("mydevice" -> "vdevb" at least).
> >> So, what are the sources you are using?
> >>
> >> You could probably take a look at the relatively small vkbd frontend
> >> driver [2]
> >> to get some hints.
> >>>> But I am facing below errors while adding device vdevb to xenstore.
> >>>> Below errors I am getting from xenbus_switch_state().
> >>>> vdevb vdevb-0: failed to write error node for device/vdevb/0 (13
> >>>> writing new state)
> > Error 13 is EACCESS. I guess the access rights of the Xenstore nodes
> > are not sufficient to write the needed entries.
> >
> > Did you modify Xen tools (xl/libxl) for adding the new device type?
> > If not you need to setup the Xenstore nodes manually.
> There is a script [1] which comes with the example implementation,
> so I believe Omkar uses it with "mydevice" -> "vdevb" change
> >
> >
> > Juergen
> [1]
>
> https://github.com/badboy/xen-split-driver-example/blob/master/chapter02/activate.sh
>

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--00000000000031cf0b0576d7e6c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">Hi,</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br>=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Sorry, I =
forgot, I used code from github chapter [2] from that link, and</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">I just changed name &=
quot;mydevice&quot;=C2=A0 to &quot;vdevb&quot;</div><div><br></div><div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><span class=3D"gma=
il_default"></span><span style=3D"color:rgb(34,34,34)">&gt; Error 13 is EAC=
CESS. I guess the access rights of the Xenstore nodes</span><br style=3D"co=
lor:rgb(34,34,34)"><span style=3D"color:rgb(34,34,34)">&gt; are not suffici=
ent to write the needed entries.</span><br style=3D"color:rgb(34,34,34)">Wh=
ere I have to provide access rights, i.e from Kernel code or from from comm=
and line in domain-0 or modify in xen source?</div><div class=3D"gmail_defa=
ult" style=3D""><font color=3D"#0b5394">Any thing that I have to do/change =
in xenbits xen-4.8 sources code, to add new PV device?</font></div><div cla=
ss=3D"gmail_default" style=3D""><font color=3D"#0b5394"><br style=3D""></fo=
nt><span style=3D"color:rgb(34,34,34)">&gt; Did you modify Xen tools (xl/li=
bxl) for adding the new device type?</span></div><div class=3D"gmail_defaul=
t" style=3D""><font color=3D"#0b5394">No, is it needed to modify some thing=
 in xl/libxl for adding new device type?</font></div><div class=3D"gmail_de=
fault" style=3D""><font color=3D"#0b5394"><br style=3D""></font><span style=
=3D"color:rgb(34,34,34)">&gt; If not you need to setup the Xenstore nodes m=
anually.</span><br></div></div><div><span style=3D"color:rgb(11,83,148)"><s=
pan class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Setup manually X=
enstore means, using commands?</span></span></div><div><span style=3D"color=
:rgb(11,83,148)"><span class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)"><br></span></span></div><div><span style=3D"color:rgb(11,83,148)"><span =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Thanks,</span></span=
></div><div><span style=3D"color:rgb(11,83,148)"><span class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">Omkar B </span></span><div class=3D"gmai=
l-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin=
:2px 0px 0px"><br></div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)"></div><br></div><div><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Thu, Sep 27, 2018 at 3:50 PM Oleksandr Andrushchenko &lt;<a=
 href=3D"mailto:Oleksandr_Andrushchenko@epam.com">Oleksandr_Andrushchenko@e=
pam.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 09/27/201=
8 01:16 PM, Juergen Gross wrote:<br>
&gt; On 27/09/2018 12:07, Oleksandr Andrushchenko wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt; On 09/27/2018 12:39 PM, Lars Kurth wrote:<br>
&gt;&gt;&gt; Adding a few people who have recently been working on PV drive=
rs, as<br>
&gt;&gt;&gt; well as Julien<br>
&gt;&gt;&gt; Lars<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 27 Sep 2018, at 06:44, Omkar Bolla<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:omkar.bolla@pathpartnertech.com" tar=
get=3D"_blank">omkar.bolla@pathpartnertech.com</a><br>
&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:omkar.bolla@pathpartnertech.c=
om" target=3D"_blank">omkar.bolla@pathpartnertech.com</a>&gt;&gt; wrote:<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I am using Debian as Domain-0 and Debian as Domain-U on Hi=
key960<br>
&gt;&gt;&gt;&gt; platform(ARMv8) and using Xen-4.8 stable release. Here I w=
ant to<br>
&gt;&gt;&gt;&gt; create a PV frontend and backend to share memory between D=
omain-0 and<br>
&gt;&gt;&gt;&gt; Domain-U.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I used below link to create frontend and backend,<br>
&gt;&gt;&gt;&gt; <a href=3D"https://fnordig.de/2016/12/02/xen-a-backend-fro=
ntend-driver-example/" rel=3D"noreferrer" target=3D"_blank">https://fnordig=
.de/2016/12/02/xen-a-backend-frontend-driver-example/</a><br>
&gt;&gt; The link above has another link to github [1] with 2 chapters. And=
 it<br>
&gt;&gt; looks like you have<br>
&gt;&gt; already modified the sources (&quot;mydevice&quot; -&gt; &quot;vde=
vb&quot; at least).<br>
&gt;&gt; So, what are the sources you are using?<br>
&gt;&gt;<br>
&gt;&gt; You could probably take a look at the relatively small vkbd fronte=
nd<br>
&gt;&gt; driver [2]<br>
&gt;&gt; to get some hints.<br>
&gt;&gt;&gt;&gt; But I am facing below errors while adding device vdevb to =
xenstore.<br>
&gt;&gt;&gt;&gt; Below errors I am getting from=C2=A0xenbus_switch_state().=
<br>
&gt;&gt;&gt;&gt; vdevb vdevb-0: failed to write error node for device/vdevb=
/0 (13<br>
&gt;&gt;&gt;&gt; writing new state)<br>
<span class=3D"gmail_default" style=3D"color:rgb(11,83,148)"></span>&gt; Er=
ror 13 is EACCESS. I guess the access rights of the Xenstore nodes<br>
&gt; are not sufficient to write the needed entries.<br>
&gt;<br>
&gt; Did you modify Xen tools (xl/libxl) for adding the new device type?<br=
>
&gt; If not you need to setup the Xenstore nodes manually.<br>
There is a script [1] which comes with the example implementation,<br>
so I believe Omkar uses it with &quot;mydevice&quot; -&gt; &quot;vdevb&quot=
; change<br>
&gt;<br>
&gt;<br>
&gt; Juergen<br>
[1] <br>
<a href=3D"https://github.com/badboy/xen-split-driver-example/blob/master/c=
hapter02/activate.sh" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/badboy/xen-split-driver-example/blob/master/chapter02/activate.sh</a><br=
>
</blockquote></div></div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--00000000000031cf0b0576d7e6c5--


--===============4428069996853167348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4428069996853167348==--
