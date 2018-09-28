From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Fri, 28 Sep 2018 18:25:06 +0530
Message-ID: <CAC4nxbuTQ1uP6rKiCAp7hDe-ygq9LKHQw8ggVM+fOVH-VvU8Tw@mail.gmail.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
 <CAC4nxbvh6LA=t2iEdiw2UrqrQP3Zf2NtRcViJ1YNGZkyLZqYHg@mail.gmail.com>
 <d130b853-0e33-ecb7-5598-d99791a5f2bf@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="000000000000a0fa920576edf7f3"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d130b853-0e33-ecb7-5598-d99791a5f2bf@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: xen-devel@lists.xensource.com, Oleksandr_Andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--000000000000a0fa920576edf7f3
Content-Type: multipart/alternative; boundary="000000000000a0fa8e0576edf7f1"

--000000000000a0fa8e0576edf7f1
Content-Type: text/plain; charset="UTF-8"

Hi,
I tried to run script after pause the domain and unpause domain after run
script. But I ended up with same error

Below I shared  PV device log, and attached my FE and BE driver and script
that i used,
root@hikey960:/debian#
[XEN_BUF]xen_vdevb_be_probe(): 124: Probe called. We are good to go.
[  165.087419] [XEN_BUF]xen_vdevb_be_probe(): 125:  ffffffc017fb7000 1
[  165.093759] [XEN_BUF]xen_vdevb_be_probe(): 137: info->domid: 1
[  165.099641] [XEN_BUF]xen_vdevb_be_probe(): 138: devicetype: vdevb,
nodename: backend/vdevb/1/0, otherend: /local/domain/1/device/vdevb/0
[  165.112939] [XEN_BUF]xen_vdevb_be_frontend_changed(): 177: dev->state:
XenbusStateInitialising-1, frontend_state: XenbusStateInitialising-1

root@hikey960:/debian#
root@hikey960:/debian#
root@hikey960:/debian#
root@hikey960:/debian#
root@hikey960:/debian# xl console debian
[   22.243570] [XEN_BUF]xen_vdevb_fe_probe(): 24: Probe called. We are good
to go.
[   22.243606] [XEN_BUF]xen_vdevb_fe_probe(): 25:  ffffffc0160b4000 0
[   22.243620] [XEN_BUF]xen_vdevb_fe_probe(): 38: info->domid: 0
[   22.243633] [XEN_BUF]xen_vdevb_fe_probe(): 39: devicetype: vdevb,
nodename: device/vdevb/0, otherend: /local/domain/0/backend/vdevb/1/0
[   22.244669] [XEN_BUF]xen_vdevb_fe_backend_changed(): 64: dev->state:
XenbusStateInitialising-1, backend_state: XenbusStateInitWait-2
[   22.244701] [XEN_BUF]frontend_connect(): 53: Connecting the frontend now
[   22.245866] vdevb vdevb-0: 13 writing new state
[   22.246085] vdevb vdevb-0: failed to write error node for device/vdevb/0
(13 writing new state)
[   22.250005] vdevb vdevb-0: 13 writing new state
[   22.250220] vdevb vdevb-0: failed to write error node for device/vdevb/0
(13 writing new state)
root@hikey960:~#


Thanks,
Omkar  B


On Thu, Sep 27, 2018 at 4:33 PM Juergen Gross <jgross@suse.com> wrote:

> On 27/09/2018 12:35, Omkar Bolla wrote:
> > Hi,
> >
> > Sorry, I forgot, I used code from github chapter [2] from that link, and
> > I just changed name "mydevice"  to "vdevb"
>
> Okay.
>
> >
> >> Error 13 is EACCESS. I guess the access rights of the Xenstore nodes
> >> are not sufficient to write the needed entries.
> > Where I have to provide access rights, i.e from Kernel code or from from
> > command line in domain-0 or modify in xen source?
>
> I guess you have your frontend already loaded when running the
> script creating the Xenstore entries?
>
> This would explain the problem: as soon as the entries are written
> the frontend will react. At this point the access rights are not setup
> properly, this is done a little bit later in the script.
>
> Possible solutions are to either load the frontend driver only after
> setting up the Xenstore entries, or to pause the domain while doing
> so and unpause it afterwards (or start the domain paused, create the
> Xenstore entries, and unpause the domain).
>
> The really correct way to do it would be to setup Xenstore in a single
> transaction (write all the entries and set access rights).
>
> > Any thing that I have to do/change in xenbits xen-4.8 sources code, to
> > add new PV device?
>
> Only if you want to include domain config file entries for your device.
>
> >
> >> Did you modify Xen tools (xl/libxl) for adding the new device type?
> > No, is it needed to modify some thing in xl/libxl for adding new device
> > type?
>
> This was just a question to learn how Xenstore is being initialized
> in your scenario.
>
> >
> >> If not you need to setup the Xenstore nodes manually.
> > Setup manually Xenstore means, using commands?
>
> Yes, like your script does.
>
>
> Juergen
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

--000000000000a0fa8e0576edf7f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)">Hi,</div><div class=3D"gmail_default" style=3D"color:rgb=
(11,83,148)">I tried to run script after pause the domain and unpause domai=
n after run script. But I ended up with same error</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)">Below I shared=C2=A0 PV device log, and=
 attached my FE and BE driver and script that i used,=C2=A0</div><div class=
=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">root@hikey960:/debi=
an#</span><span style=3D"color:rgb(11,83,148)"><br></span></div><div class=
=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">[</span><font color=
=3D"#0b5394">XEN_BUF]xen_vdevb_be_probe(): 124: Probe called. We are good t=
o go.</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 165.087419] [XEN_BUF]xen_vdevb_be_probe(): 125:=C2=A0 ffffffc017fb7000 =
1</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =
165.093759] [XEN_BUF]xen_vdevb_be_probe(): 137: info-&gt;domid: 1</font></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 165.099641]=
 [XEN_BUF]xen_vdevb_be_probe(): 138: devicetype: vdevb, nodename: backend/v=
devb/1/0, otherend: /local/domain/1/device/vdevb/0</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 165.112939] [XEN_BUF]xen=
_vdevb_be_frontend_changed(): 177: dev-&gt;state: XenbusStateInitialising-1=
, frontend_state: XenbusStateInitialising-1</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394"><br></font></div><div class=3D"gmail_defa=
ult"><font color=3D"#0b5394">root@hikey960:/debian#=C2=A0</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394">root@hikey960:/debian#=C2=
=A0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">root@h=
ikey960:/debian#=C2=A0</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">root@hikey960:/debian#=C2=A0</font></div><div class=3D"gmail_d=
efault"><font color=3D"#0b5394">root@hikey960:/debian# xl console debian</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A022.243570] [XEN_BUF]xen_vdevb_fe_probe(): 24: Probe called. We are good =
to go.</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=
=C2=A0 =C2=A022.243606] [XEN_BUF]xen_vdevb_fe_probe(): 25:=C2=A0 ffffffc016=
0b4000 0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=
=C2=A0 =C2=A022.243620] [XEN_BUF]xen_vdevb_fe_probe(): 38: info-&gt;domid: =
0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =
=C2=A022.243633] [XEN_BUF]xen_vdevb_fe_probe(): 39: devicetype: vdevb, node=
name: device/vdevb/0, otherend: /local/domain/0/backend/vdevb/1/0</font></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A022.24=
4669] [XEN_BUF]xen_vdevb_fe_backend_changed(): 64: dev-&gt;state: XenbusSta=
teInitialising-1, backend_state: XenbusStateInitWait-2</font></div><div cla=
ss=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A022.244701] [XEN_=
BUF]frontend_connect(): 53: Connecting the frontend now</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A022.245866] vdev=
b vdevb-0: 13 writing new state</font></div><div class=3D"gmail_default"><f=
ont color=3D"#0b5394">[=C2=A0 =C2=A022.246085] vdevb vdevb-0: failed to wri=
te error node for device/vdevb/0 (13 writing new state)</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A022.250005] vdev=
b vdevb-0: 13 writing new state</font></div><div class=3D"gmail_default"><f=
ont color=3D"#0b5394">[=C2=A0 =C2=A022.250220] vdevb vdevb-0: failed to wri=
te error node for device/vdevb/0 (13 writing new state)</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">root@hikey960:~#</font></div>=
<div class=3D"gmail_default"><br></div><div class=3D"gmail_default"><br></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394">Thanks,</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394">Omkar=C2=A0 B</font><=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br></div>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Sep 27,=
 2018 at 4:33 PM Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com">jgros=
s@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 27/09=
/2018 12:35, Omkar Bolla wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Sorry, I forgot, I used code from github chapter [2] from that link, a=
nd<br>
&gt; I just changed name &quot;mydevice&quot;=C2=A0 to &quot;vdevb&quot;<br=
>
<br>
Okay.<br>
<br>
&gt; <br>
&gt;&gt; Error 13 is EACCESS. I guess the access rights of the Xenstore nod=
es<br>
&gt;&gt; are not sufficient to write the needed entries.<br>
&gt; Where I have to provide access rights, i.e from Kernel code or from fr=
om<br>
&gt; command line in domain-0 or modify in xen source?<br>
<br>
I guess you have your frontend already loaded when running the<br>
script creating the Xenstore entries?<br>
<br>
This would explain the problem: as soon as the entries are written<br>
the frontend will react. At this point the access rights are not setup<br>
properly, this is done a little bit later in the script.<br>
<br>
Possible solutions are to either load the frontend driver only after<br>
setting up the Xenstore entries, or to pause the domain while doing<br>
so and unpause it afterwards (or start the domain paused, create the<br>
Xenstore entries, and unpause the domain).<br>
<br>
The really correct way to do it would be to setup Xenstore in a single<br>
transaction (write all the entries and set access rights).<br>
<br>
&gt; Any thing that I have to do/change in xenbits xen-4.8 sources code, to=
<br>
&gt; add new PV device?<br>
<br>
Only if you want to include domain config file entries for your device.<br>
<br>
&gt; <br>
&gt;&gt; Did you modify Xen tools (xl/libxl) for adding the new device type=
?<br>
&gt; No, is it needed to modify some thing in xl/libxl for adding new devic=
e<br>
&gt; type?<br>
<br>
This was just a question to learn how Xenstore is being initialized<br>
in your scenario.<br>
<br>
&gt; <br>
&gt;&gt; If not you need to setup the Xenstore nodes manually.<br>
&gt; Setup manually Xenstore means, using commands?<br>
<br>
Yes, like your script does.<br>
<br>
<br>
Juergen<br>
</blockquote></div>

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
--000000000000a0fa8e0576edf7f1--

--000000000000a0fa920576edf7f3
Content-Type: text/x-csrc; charset="US-ASCII"; name="xen_buf_frontend.c"
Content-Disposition: attachment; filename="xen_buf_frontend.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jmm0axhd0>
X-Attachment-Id: f_jmm0axhd0

I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPiAgLyogTmVlZGVkIGJ5IGFsbCBtb2R1bGVzICovCiNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4gIC8qIE5lZWRlZCBmb3IgS0VSTl9BTEVSVCAqLwoKI2lu
Y2x1ZGUgPHhlbi94ZW4uaD4gICAgICAgLyogV2UgYXJlIGRvaW5nIHNvbWV0aGluZyB3aXRoIFhl
biAqLwojaW5jbHVkZSA8eGVuL3hlbmJ1cy5oPgoKI2luY2x1ZGUgInhlbl9idWYuaCIKCnN0cnVj
dCB2ZGV2YmZybnRfaW5mbyB7CglzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2OwoJdW5zaWduZWQg
aW50IGV2dGNobjsKCXVuc2lnbmVkIGludCBpcnE7CgoJZ3JhbnRfcmVmX3QgcmluZ19yZWY7CgkK
fTsKLy8gVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBhY3RpdmF0aW9uIG9mIHRoZSBkZXZpY2UK
c3RhdGljIGludCB4ZW5fdmRldmJfZmVfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwK
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeGVuYnVzX2RldmljZV9pZCAqaWQpCnsKCXN0cnVj
dCB2ZGV2YmZybnRfaW5mbyAqaW5mbyA9IE5VTEw7CgkKCQoJcHJfbG9nKCJQcm9iZSBjYWxsZWQu
IFdlIGFyZSBnb29kIHRvIGdvLlxuIik7Cglwcl9sb2coIiAlcCAlZFxuIiwgZGV2LCBkZXYtPm90
aGVyZW5kX2lkKTsKCgkvKiBBbGxvY2F0aW5nIG1lbW9yeSBmb3IgcHJpdmF0ZSBzdHJ1Y3R1cmUg
Ki8KCWluZm8gPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgdmRldmJmcm50X2luZm8pLCBHRlBfS0VS
TkVMKTsKCWlmICghaW5mbykgewoJCXhlbmJ1c19kZXZfZmF0YWwoZGV2LCAtRU5PTUVNLAoJCQkJ
ICJhbGxvY2F0aW5nIGZyb250ZW5kIHN0cnVjdHVyZSIpOwoJCXJldHVybiAtRU5PTUVNOwoJfQoK
CWluZm8tPmRldiA9IGRldjsKCWRldl9zZXRfZHJ2ZGF0YSgmZGV2LT5kZXYsIGluZm8pOwovLwlp
bmZvLT5kb21pZCA9IGRldi0+b3RoZXJlbmRfaWQ7Cglwcl9sb2coImluZm8tPmRvbWlkOiAlZFxu
IiwgZGV2LT5vdGhlcmVuZF9pZCk7Cglwcl9sb2coImRldmljZXR5cGU6ICVzLCBub2RlbmFtZTog
JXMsIG90aGVyZW5kOiAlc1xuIiwgZGV2LT5kZXZpY2V0eXBlLCBkZXYtPm5vZGVuYW1lLCBkZXYt
Pm90aGVyZW5kKTsKCi8vCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUluaXRp
YWxpc2VkKTsKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50IHhlbl92ZGV2Yl9mZV9yZW1vdmUoc3Ry
dWN0IHhlbmJ1c19kZXZpY2UgKmRldikKewoJcHJfbG9nKCJcbiIpOwoJcmV0dXJuIDA7Cn0KLy8g
VGhpcyBpcyB3aGVyZSB3ZSBzZXQgdXAgeGVuc3RvcmUgZmlsZXMgYW5kIGV2ZW50IGNoYW5uZWxz
CnN0YXRpYyBpbnQgZnJvbnRlbmRfY29ubmVjdChzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KQp7
Cglwcl9sb2coIkNvbm5lY3RpbmcgdGhlIGZyb250ZW5kIG5vd1xuIik7CglyZXR1cm4gMDsKfQoK
Ly8gVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBhIHN0YXRlIGNoYW5nZSBvZiB0aGUgYmFja2Vu
ZCBkcml2ZXIKc3RhdGljIHZvaWQgeGVuX3ZkZXZiX2ZlX2JhY2tlbmRfY2hhbmdlZChzdHJ1Y3Qg
eGVuYnVzX2RldmljZSAqZGV2LAoJCQkgICAgZW51bSB4ZW5idXNfc3RhdGUgYmFja2VuZF9zdGF0
ZSkKewoJc3RydWN0IHZkZXZiZnJudF9pbmZvICppbmZvID0gZGV2X2dldF9kcnZkYXRhKCZkZXYt
PmRldik7CgovL3ByX2xvZygiaW5mbzogJXBcbiIsIGluZm8pOwpwcl9sb2coImRldi0+c3RhdGU6
ICVzLSVkLCBiYWNrZW5kX3N0YXRlOiAlcy0lZFxuIiwgeGVuYnVzX3N0YXRlX2FycmF5W2Rldi0+
c3RhdGVdLCBkZXYtPnN0YXRlLCB4ZW5idXNfc3RhdGVfYXJyYXlbYmFja2VuZF9zdGF0ZV0sIGJh
Y2tlbmRfc3RhdGUpOwoJc3dpdGNoIChiYWNrZW5kX3N0YXRlKQoJewoJCWNhc2UgWGVuYnVzU3Rh
dGVJbml0aWFsaXNpbmc6CgkJCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUlu
aXRpYWxpc2luZyk7CgkJCWJyZWFrOwoJCWNhc2UgWGVuYnVzU3RhdGVJbml0aWFsaXNlZDoKCQlj
YXNlIFhlbmJ1c1N0YXRlUmVjb25maWd1cmluZzoKCQljYXNlIFhlbmJ1c1N0YXRlUmVjb25maWd1
cmVkOgoJCWNhc2UgWGVuYnVzU3RhdGVVbmtub3duOgoJCQlicmVhazsKCgkJY2FzZSBYZW5idXNT
dGF0ZUluaXRXYWl0OgoJCQlpZiAoZGV2LT5zdGF0ZSAhPSBYZW5idXNTdGF0ZUluaXRpYWxpc2lu
ZykKCQkJCWJyZWFrOwoJCQlpZiAoZnJvbnRlbmRfY29ubmVjdChkZXYpICE9IDApCgkJCQlicmVh
azsKCgkJCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNvbm5lY3RlZCk7CgoJ
CQlicmVhazsKCgkJY2FzZSBYZW5idXNTdGF0ZUNvbm5lY3RlZDoKCQkJcHJfbG9nKCJPdGhlciBz
aWRlIHNheXMgaXQgaXMgY29ubmVjdGVkIGFzIHdlbGwuXG4iKTsKCQkJYnJlYWs7CgoJCWNhc2Ug
WGVuYnVzU3RhdGVDbG9zZWQ6CgkJCWlmIChkZXYtPnN0YXRlID09IFhlbmJ1c1N0YXRlQ2xvc2Vk
KQoJCQkJYnJlYWs7CgkJCS8qIE1pc3NlZCB0aGUgYmFja2VuZCdzIENMT1NJTkcgc3RhdGUgLS0g
ZmFsbHRocm91Z2ggKi8KCQljYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKCQkJeGVuYnVzX2Zyb250
ZW5kX2Nsb3NlZChkZXYpOwoJfQp9CgovLyBUaGlzIGRlZmluZXMgdGhlIG5hbWUgb2YgdGhlIGRl
dmljZXMgdGhlIGRyaXZlciByZWFjdHMgdG8Kc3RhdGljIGNvbnN0IHN0cnVjdCB4ZW5idXNfZGV2
aWNlX2lkIHhlbl92ZGV2Yl9mZV9pZHNbXSA9IHsKCXsgInZkZXZiIiAgfSwKCXsgIiIgIH0KfTsK
Ci8vIFdlIHNldCB1cCB0aGUgY2FsbGJhY2sgZnVuY3Rpb25zCnN0YXRpYyBzdHJ1Y3QgeGVuYnVz
X2RyaXZlciB4ZW5fdmRldmJfZmVfZHJpdmVyID0gewoJLmlkcyAgPSB4ZW5fdmRldmJfZmVfaWRz
LAoJLnByb2JlID0geGVuX3ZkZXZiX2ZlX3Byb2JlLAoJLnJlbW92ZSA9IHhlbl92ZGV2Yl9mZV9y
ZW1vdmUsCgkub3RoZXJlbmRfY2hhbmdlZCA9IHhlbl92ZGV2Yl9mZV9iYWNrZW5kX2NoYW5nZWQs
Cn07CgovLyBPbiBsb2FkaW5nIHRoaXMga2VybmVsIG1vZHVsZSwgd2UgcmVnaXN0ZXIgYXMgYSBm
cm9udGVuZCBkcml2ZXIKc3RhdGljIGludCBfX2luaXQgeGVuX3ZkZXZiX2ZlX2luaXQodm9pZCkK
ewpwcl9sb2coInhlbl9kb21haW5fdHlwZTogJWQsIHhlbl9kb21haW46ICVkXG4iLCB4ZW5fZG9t
YWluX3R5cGUseGVuX2RvbWFpbigpKTsKCXByX2xvZygiSGVsbG8gV29ybGQhXG4iKTsKCglyZXR1
cm4geGVuYnVzX3JlZ2lzdGVyX2Zyb250ZW5kKCZ4ZW5fdmRldmJfZmVfZHJpdmVyKTsKfQptb2R1
bGVfaW5pdCh4ZW5fdmRldmJfZmVfaW5pdCk7CgovLyAuLi5hbmQgb24gdW5sb2FkIHdlIHVucmVn
aXN0ZXIKc3RhdGljIHZvaWQgX19leGl0IHhlbl92ZGV2Yl9mZV9leGl0KHZvaWQpCnsKCXhlbmJ1
c191bnJlZ2lzdGVyX2RyaXZlcigmeGVuX3ZkZXZiX2ZlX2RyaXZlcik7Cglwcl9sb2coICJHb29k
YnllIHdvcmxkLlxuIik7Cn0KbW9kdWxlX2V4aXQoeGVuX3ZkZXZiX2ZlX2V4aXQpOwoKTU9EVUxF
X0xJQ0VOU0UoIkdQTCIpOwpNT0RVTEVfQUxJQVMoInhlbi1jbGs6IHZkZXZiIik7Cg==
--000000000000a0fa920576edf7f3
Content-Type: text/x-csrc; charset="US-ASCII"; name="xen_buf_backend.c"
Content-Disposition: attachment; filename="xen_buf_backend.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jmm0bcoh1>
X-Attachment-Id: f_jmm0bcoh1

I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPiAgLyogTmVlZGVkIGJ5IGFsbCBtb2R1bGVzICovCiNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4gIC8qIE5lZWRlZCBmb3IgS0VSTl9BTEVSVCAqLwoKI2lu
Y2x1ZGUgPHhlbi94ZW4uaD4gICAgICAgLyogV2UgYXJlIGRvaW5nIHNvbWV0aGluZyB3aXRoIFhl
biAqLwojaW5jbHVkZSA8eGVuL3hlbmJ1cy5oPgoKI2luY2x1ZGUgInhlbl9idWYuaCIKCgoKCnN0
cnVjdCB2ZGV2YmJrX2luZm8gewoJc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldjsKCglkb21pZF90
IGRvbWlkOwoJdW5zaWduZWQgaW50IGlycTsKCi8vCXN0cnVjdCB2c2NzaWlmX2JhY2tfcmluZyBy
aW5nOwoJaW50IHJpbmdfZXJyb3I7CgoJc3BpbmxvY2tfdCByaW5nX2xvY2s7CglhdG9taWNfdCBu
cl91bnJlcGxpZWRfcmVxczsKCglzcGlubG9ja190IHZkZXZiX2xvY2s7CglzdHJ1Y3QgbGlzdF9o
ZWFkIHZkZXZiX2VudHJ5X2xpc3RzOwoKCXdhaXRfcXVldWVfaGVhZF90IHdhaXRpbmdfdG9fZnJl
ZTsKfTsKCi8vIFRoaXMgaXMgd2hlcmUgd2Ugc2V0IHVwIHBhdGggd2F0Y2hlcnMgYW5kIGV2ZW50
IGNoYW5uZWxzCnN0YXRpYyB2b2lkIGJhY2tlbmRfY29ubmVjdChzdHJ1Y3QgeGVuYnVzX2Rldmlj
ZSAqZGV2KQp7Cglwcl9sb2coIkNvbm5lY3RpbmcgdGhlIGJhY2tlbmQgbm93XG4iKTsKfQovLyBU
aGlzIHdpbGwgZGVzdHJveSBldmVudCBjaGFubmVsIGhhbmRsZXJzCnN0YXRpYyB2b2lkIGJhY2tl
bmRfZGlzY29ubmVjdChzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KQp7Cglwcl9sb2coIkNvbm5l
Y3RpbmcgdGhlIGJhY2tlbmQgbm93XG4iKTsKfQovLyBXZSB0cnkgdG8gc3dpdGNoIHRvIHRoZSBu
ZXh0IHN0YXRlIGZyb20gYSBwcmV2aW91cyBvbmUKc3RhdGljIHZvaWQgc2V0X2JhY2tlbmRfc3Rh
dGUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKCQkJICAgICAgZW51bSB4ZW5idXNfc3RhdGUg
c3RhdGUpCnsKLy9wcl9sb2coImRldi0+c3RhdGU6ICVzLSVkLCBzdGF0ZTogJXMtJWRcbiIsIHhl
bmJ1c19zdGF0ZV9hcnJheVtkZXYtPnN0YXRlXSwgZGV2LT5zdGF0ZSwgeGVuYnVzX3N0YXRlX2Fy
cmF5W3N0YXRlXSwgc3RhdGUpOwoJd2hpbGUgKGRldi0+c3RhdGUgIT0gc3RhdGUpIHsKCQlzd2l0
Y2ggKGRldi0+c3RhdGUpIHsKCQljYXNlIFhlbmJ1c1N0YXRlSW5pdGlhbGlzaW5nOgoJCQlzd2l0
Y2ggKHN0YXRlKSB7CgkJCWNhc2UgWGVuYnVzU3RhdGVJbml0V2FpdDoKCQkJY2FzZSBYZW5idXNT
dGF0ZUNvbm5lY3RlZDoKCQkJY2FzZSBYZW5idXNTdGF0ZUNsb3Npbmc6CgkJCQl4ZW5idXNfc3dp
dGNoX3N0YXRlKGRldiwgWGVuYnVzU3RhdGVJbml0V2FpdCk7CgkJCQlicmVhazsKCQkJY2FzZSBY
ZW5idXNTdGF0ZUNsb3NlZDoKCQkJCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0
ZUNsb3NlZCk7CgkJCQlicmVhazsKCQkJZGVmYXVsdDoKCQkJCUJVRygpOwoJCQl9CgkJCWJyZWFr
OwoJCWNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6CgkJCXN3aXRjaCAoc3RhdGUpIHsKCQkJY2FzZSBY
ZW5idXNTdGF0ZUluaXRXYWl0OgoJCQljYXNlIFhlbmJ1c1N0YXRlQ29ubmVjdGVkOgoJCQkJeGVu
YnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlSW5pdFdhaXQpOwoJCQkJYnJlYWs7CgkJ
CWNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgoJCQkJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhl
bmJ1c1N0YXRlQ2xvc2luZyk7CgkJCQlicmVhazsKCQkJZGVmYXVsdDoKCQkJCUJVRygpOwoJCQl9
CgkJCWJyZWFrOwoJCWNhc2UgWGVuYnVzU3RhdGVJbml0V2FpdDoKCQkJc3dpdGNoIChzdGF0ZSkg
ewoJCQljYXNlIFhlbmJ1c1N0YXRlQ29ubmVjdGVkOgoJCQkJYmFja2VuZF9jb25uZWN0KGRldik7
CgkJCQl4ZW5idXNfc3dpdGNoX3N0YXRlKGRldiwgWGVuYnVzU3RhdGVDb25uZWN0ZWQpOwoJCQkJ
YnJlYWs7CgkJCWNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgoJCQljYXNlIFhlbmJ1c1N0YXRlQ2xv
c2VkOgoJCQkJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2luZyk7CgkJ
CQlicmVhazsKCQkJZGVmYXVsdDoKCQkJCUJVRygpOwoJCQl9CgkJCWJyZWFrOwoJCWNhc2UgWGVu
YnVzU3RhdGVDb25uZWN0ZWQ6CgkJCXN3aXRjaCAoc3RhdGUpIHsKCQkJY2FzZSBYZW5idXNTdGF0
ZUluaXRXYWl0OgoJCQljYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKCQkJY2FzZSBYZW5idXNTdGF0
ZUNsb3NlZDoKCQkJCWJhY2tlbmRfZGlzY29ubmVjdChkZXYpOwoJCQkJeGVuYnVzX3N3aXRjaF9z
dGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2luZyk7CgkJCQlicmVhazsKCQkJZGVmYXVsdDoKCQkJ
CUJVRygpOwoJCQl9CgkJCWJyZWFrOwoJCWNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgoJCQlzd2l0
Y2ggKHN0YXRlKSB7CgkJCWNhc2UgWGVuYnVzU3RhdGVJbml0V2FpdDoKCQkJY2FzZSBYZW5idXNT
dGF0ZUNvbm5lY3RlZDoKCQkJY2FzZSBYZW5idXNTdGF0ZUNsb3NlZDoKCQkJCXhlbmJ1c19zd2l0
Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CgkJCQlicmVhazsKCQkJZGVmYXVsdDoK
CQkJCUJVRygpOwoJCQl9CgkJCWJyZWFrOwoJCWRlZmF1bHQ6CgkJCUJVRygpOwoJCX0KCX0KfQoK
Ly8gVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBhY3RpdmF0aW9uIG9mIHRoZSBkZXZpY2UKc3Rh
dGljIGludCB4ZW5fdmRldmJfYmVfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKCQkJ
Y29uc3Qgc3RydWN0IHhlbmJ1c19kZXZpY2VfaWQgKmlkKQp7CglzdHJ1Y3QgdmRldmJia19pbmZv
ICppbmZvID0gTlVMTDsKCWludCByZXQgPSAwOwoKCXByX2xvZygiUHJvYmUgY2FsbGVkLiBXZSBh
cmUgZ29vZCB0byBnby5cbiIpOwoJcHJfbG9nKCIgJXAgJWRcbiIsIGRldiwgZGV2LT5vdGhlcmVu
ZF9pZCk7CgoJLyogQWxsb2NhdGluZyBtZW1vcnkgZm9yIHByaXZhdGUgc3RydWN0dXJlICovCglp
bmZvID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHZkZXZiYmtfaW5mbyksIEdGUF9LRVJORUwpOwoJ
aWYgKCFpbmZvKSB7CgkJeGVuYnVzX2Rldl9mYXRhbChkZXYsIC1FTk9NRU0sIAoJCQkJImFsbG9j
YXRpbmcgYmFja2VuZCBzdHJ1Y3R1cmUiKTsKICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
OwogICAgICAgIH0KCWluZm8tPmRldiA9IGRldjsKCWRldl9zZXRfZHJ2ZGF0YSgmZGV2LT5kZXYs
IGluZm8pOwoJaW5mby0+ZG9taWQgPSBkZXYtPm90aGVyZW5kX2lkOwoJcHJfbG9nKCJpbmZvLT5k
b21pZDogJWRcbiIsIGluZm8tPmRvbWlkKTsKCXByX2xvZygiZGV2aWNldHlwZTogJXMsIG5vZGVu
YW1lOiAlcywgb3RoZXJlbmQ6ICVzXG4iLCBkZXYtPmRldmljZXR5cGUsIGRldi0+bm9kZW5hbWUs
IGRldi0+b3RoZXJlbmQpOwoKI2lmIDAKCXNwaW5fbG9ja19pbml0KCZpbmZvLT5yaW5nX2xvY2sp
OwoJaW5mby0+cmluZ19lcnJvciA9IDA7CglhdG9taWNfc2V0KCZpbmZvLT5ucl91bnJlcGxpZWRf
cmVxcywgMCk7Cglpbml0X3dhaXRxdWV1ZV9oZWFkKCZpbmZvLT53YWl0aW5nX3RvX2ZyZWUpOwoJ
aW5mby0+aXJxID0gMDsKCUlOSVRfTElTVF9IRUFEKCZpbmZvLT52ZGV2Yl9lbnRyeV9saXN0cyk7
CglzcGluX2xvY2tfaW5pdCgmaW5mby0+dmRldmJfbG9jayk7CiNlbmRpZgoJCglyZXQgPSB4ZW5i
dXNfcHJpbnRmKFhCVF9OSUwsIGRldi0+bm9kZW5hbWUsICJ2ZGV2Yi12ZXJzaW9uIiwgIiVzIiwg
IjAuMSIpOwoJaWYgKHJldCkKICAgICAgICAgICAgICAgIHhlbmJ1c19kZXZfZXJyb3IoZGV2LCBy
ZXQsICJ3cml0aW5nIHZkZXZiLXZlcnNpb24iKTsKCglyZXQgPSB4ZW5idXNfc3dpdGNoX3N0YXRl
KGRldiwgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcpOwoJaWYgKHJldCkKCQlnb3RvIGVycm9yOwoJ
cmV0dXJuIDA7CgogZXJyb3I6Cglwcl93YXJuKCIlcyBmYWlsZWRcbiIsIF9fZnVuY19fKTsKCWtm
cmVlKGluZm8pOwoJZGV2X3NldF9kcnZkYXRhKCZkZXYtPmRldiwgTlVMTCk7CglyZXR1cm4gcmV0
Owp9CgpzdGF0aWMgaW50IHhlbl92ZGV2Yl9iZV9yZW1vdmUoc3RydWN0IHhlbmJ1c19kZXZpY2Ug
KmRldikKewoJcHJfbG9nKCJcbiIpOwoJcmV0dXJuIDA7Cn0KCi8vIFRoZSBmdW5jdGlvbiBpcyBj
YWxsZWQgb24gYSBzdGF0ZSBjaGFuZ2Ugb2YgdGhlIGZyb250ZW5kIGRyaXZlcgpzdGF0aWMgdm9p
ZCB4ZW5fdmRldmJfYmVfZnJvbnRlbmRfY2hhbmdlZChzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2
LAoJCQllbnVtIHhlbmJ1c19zdGF0ZSBmcm9udGVuZF9zdGF0ZSkKewoJc3RydWN0IHZkZXZiYmtf
aW5mbyAqaW5mbyA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOwpwcl9sb2coImRldi0+c3Rh
dGU6ICVzLSVkLCBmcm9udGVuZF9zdGF0ZTogJXMtJWRcbiIsIHhlbmJ1c19zdGF0ZV9hcnJheVtk
ZXYtPnN0YXRlXSwgZGV2LT5zdGF0ZSwgeGVuYnVzX3N0YXRlX2FycmF5W2Zyb250ZW5kX3N0YXRl
XSwgZnJvbnRlbmRfc3RhdGUpOwoKCXN3aXRjaCAoZnJvbnRlbmRfc3RhdGUpIHsKCQljYXNlIFhl
bmJ1c1N0YXRlSW5pdGlhbGlzaW5nOgoJCQlzZXRfYmFja2VuZF9zdGF0ZShkZXYsIFhlbmJ1c1N0
YXRlSW5pdFdhaXQpOwoJCQlicmVhazsKCgkJY2FzZSBYZW5idXNTdGF0ZUluaXRpYWxpc2VkOgoJ
CQlicmVhazsKCgkJY2FzZSBYZW5idXNTdGF0ZUNvbm5lY3RlZDoKCQkJc2V0X2JhY2tlbmRfc3Rh
dGUoZGV2LCBYZW5idXNTdGF0ZUNvbm5lY3RlZCk7CgkJCWJyZWFrOwoKCQljYXNlIFhlbmJ1c1N0
YXRlQ2xvc2luZzoKCQkJc2V0X2JhY2tlbmRfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3Npbmcp
OwoJCQlicmVhazsKCgkJY2FzZSBYZW5idXNTdGF0ZUNsb3NlZDoKCQkJc2V0X2JhY2tlbmRfc3Rh
dGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CgkJCWlmICh4ZW5idXNfZGV2X2lzX29ubGluZShk
ZXYpKQoJCQkJYnJlYWs7CgkJCS8qIGZhbGwgdGhyb3VnaCBpZiBub3Qgb25saW5lICovCgkJY2Fz
ZSBYZW5idXNTdGF0ZVVua25vd246CgkJCXNldF9iYWNrZW5kX3N0YXRlKGRldiwgWGVuYnVzU3Rh
dGVDbG9zZWQpOwoJCQlkZXZpY2VfdW5yZWdpc3RlcigmZGV2LT5kZXYpOwoJCQlicmVhazsKCgkJ
ZGVmYXVsdDoKCQkJeGVuYnVzX2Rldl9mYXRhbChkZXYsIC1FSU5WQUwsCgkJCQkgICAgICAgICJz
YXcgc3RhdGUgJXMgKCVkKSBhdCBmcm9udGVuZCIsCgkJCQkJeGVuYnVzX3N0cnN0YXRlKGZyb250
ZW5kX3N0YXRlKSwKCQkJCQlmcm9udGVuZF9zdGF0ZSk7CgkJCWJyZWFrOwoJfQp9CgovLyBUaGlz
IGRlZmluZXMgdGhlIG5hbWUgb2YgdGhlIGRldmljZXMgdGhlIGRyaXZlciByZWFjdHMgdG8Kc3Rh
dGljIGNvbnN0IHN0cnVjdCB4ZW5idXNfZGV2aWNlX2lkIHhlbl92ZGV2Yl9iZV9pZHNbXSA9IHsK
CXsgInZkZXZiIiB9LAoJeyAiIiB9Cn07CgovLyBXZSBzZXQgdXAgdGhlIGNhbGxiYWNrIGZ1bmN0
aW9ucwpzdGF0aWMgc3RydWN0IHhlbmJ1c19kcml2ZXIgeGVuX3ZkZXZiX2JlX2RyaXZlciA9IHsK
CS5pZHMgID0geGVuX3ZkZXZiX2JlX2lkcywKCS5wcm9iZSA9IHhlbl92ZGV2Yl9iZV9wcm9iZSwK
CS5yZW1vdmUgPSB4ZW5fdmRldmJfYmVfcmVtb3ZlLAoJLm90aGVyZW5kX2NoYW5nZWQgPSB4ZW5f
dmRldmJfYmVfZnJvbnRlbmRfY2hhbmdlZCwKfTsKCi8vIE9uIGxvYWRpbmcgdGhpcyBrZXJuZWwg
bW9kdWxlLCB3ZSByZWdpc3RlciBhcyBhIGZyb250ZW5kIGRyaXZlcgpzdGF0aWMgaW50IF9faW5p
dCB4ZW5fdmRldmJfYmVfaW5pdCh2b2lkKQp7Cglwcl9sb2coInhlbl9kb21haW5fdHlwZTogJWQs
IHhlbl9kb21haW46ICVkXG4iLCB4ZW5fZG9tYWluX3R5cGUseGVuX2RvbWFpbigpKTsKCXByX2xv
ZygiSGVsbG8gV29ybGQhXG4iKTsKCglyZXR1cm4geGVuYnVzX3JlZ2lzdGVyX2JhY2tlbmQoJnhl
bl92ZGV2Yl9iZV9kcml2ZXIpOwp9Cm1vZHVsZV9pbml0KHhlbl92ZGV2Yl9iZV9pbml0KTsKCi8v
IC4uLmFuZCBvbiB1bmxvYWQgd2UgdW5yZWdpc3RlcgpzdGF0aWMgdm9pZCBfX2V4aXQgeGVuX3Zk
ZXZiX2JlX2V4aXQodm9pZCkKewoJeGVuYnVzX3VucmVnaXN0ZXJfZHJpdmVyKCZ4ZW5fdmRldmJf
YmVfZHJpdmVyKTsKCXByX2xvZygiR29vZGJ5ZSB3b3JsZC5cbiIpOwp9Cm1vZHVsZV9leGl0KHhl
bl92ZGV2Yl9iZV9leGl0KTsKCk1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKTU9EVUxFX0FMSUFTKCJ4
ZW4tY2xrLWJhY2tlbmQgOnZkZXZiIik7Cg==
--000000000000a0fa920576edf7f3
Content-Type: text/x-chdr; charset="US-ASCII"; name="xen_buf.h"
Content-Disposition: attachment; filename="xen_buf.h"
Content-Transfer-Encoding: base64
Content-ID: <f_jmm0bgi52>
X-Attachment-Id: f_jmm0bgi52

I2lmbmRlZiBfX1hFTl9CVUZfXwoKI2RlZmluZSBwcl9sb2coZm10LCAuLi4pIHsgXApwcl9pbmZv
KCJbWEVOX0JVRl0lcygpOiAlZDogImZtdCwgX19mdW5jX18sIF9fTElORV9fLCAjI19fVkFfQVJH
U19fKTsgXAp9CgpzdGF0aWMgY2hhciAqeGVuYnVzX3N0YXRlX2FycmF5W10gPSB7CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAoJIlhlbmJ1c1N0YXRlVW5rbm93biIsCgkiWGVuYnVzU3Rh
dGVJbml0aWFsaXNpbmciLAoJIlhlbmJ1c1N0YXRlSW5pdFdhaXQiLCAgICAgICAgLyogRmluaXNo
ZWQgZWFybHkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbml0aWFs
aXNhdGlvbiwgYnV0IHdhaXRpbmcKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmb3IgaW5mb3JtYXRpb24gZnJvbSB0aGUgcGVlcgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9yIGhvdHBsdWcgc2NyaXB0cy4gKi8KCSJYZW5idXNTdGF0ZUlu
aXRpYWxpc2VkIiwgICAgIC8qIEluaXRpYWxpc2VkIGFuZCB3YWl0aW5nIGZvciBhCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdGlvbiBmcm9tIHRoZSBwZWVy
LiAqLwoJIlhlbmJ1c1N0YXRlQ29ubmVjdGVkIiwKCSJYZW5idXNTdGF0ZUNsb3NpbmciLCAgICAg
ICAgIC8qIFRoZSBkZXZpY2UgaXMgYmVpbmcgY2xvc2VkCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZHVlIHRvIGFuIGVycm9yIG9yIGFuIHVucGx1ZwogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50LiAqLwoJIlhlbmJ1c1N0YXRlQ2xv
c2VkIiwKICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgLyogICAgICAgICAgICAgICAg
ICAgICAgCiAgICAgICAgKiBSZWNvbmZpZ3VyaW5nOiBUaGUgZGV2aWNlIGlzIGJlaW5nIHJlY29u
ZmlndXJlZC4KICAgICAgICAqLyAgICAgICAgICAgICAgCiAgICAgICAgIlhlbmJ1c1N0YXRlUmVj
b25maWd1cmluZyIsCiAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICJYZW5idXNTdGF0
ZVJlY29uZmlndXJlZCIsCn07CgojZW5kaWYgLyogX19YRU5fQlVGX18gKi8K
--000000000000a0fa920576edf7f3
Content-Type: application/x-shellscript; name="activate.sh"
Content-Disposition: attachment; filename="activate.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_jmm0dfw73>
X-Attachment-Id: f_jmm0dfw73

RE9NVV9JRD0kMQoKaWYgWyAteiAiJERPTVVfSUQiICAgXTsgdGhlbgogICAgICAgICAgZWNobyAi
VXNhZ2U6ICQwIFtkb21VIElEXV0iCiAgICAgICAgICAgIGVjaG8KICAgICAgICAgICAgICBlY2hv
ICJDb25uZWN0cyB0aGUgbmV3IGRldmljZSwgd2l0aCBkb20wIGFzIGJhY2tlbmQsIGRvbVUgYXMg
ZnJvbnRlbmQiCiAgICAgICAgICAgICAgICBleGl0IDEKICAgICAgICBmaQpERVZJQ0U9dmRldmIK
RE9NVV9LRVk9L2xvY2FsL2RvbWFpbi8kRE9NVV9JRC9kZXZpY2UvJERFVklDRS8wCkRPTTBfS0VZ
PS9sb2NhbC9kb21haW4vMC9iYWNrZW5kLyRERVZJQ0UvJERPTVVfSUQvMAoKICAgICAgICAjIFRl
bGwgdGhlIGRvbVUgYWJvdXQgdGhlIG5ldyBkZXZpY2UgYW5kIGl0cyBiYWNrZW5kCnhlbnN0b3Jl
LXdyaXRlICRET01VX0tFWS9iYWNrZW5kLWlkIDAKeGVuc3RvcmUtd3JpdGUgJERPTVVfS0VZL2Jh
Y2tlbmQgIi9sb2NhbC9kb21haW4vMC9iYWNrZW5kLyRERVZJQ0UvJERPTVVfSUQvMCIKCiAgICAg
ICAgIyBUZWxsIHRoZSBkb20wIGFib3V0IHRoZSBuZXcgZGV2aWNlIGFuZCBpdHMgZnJvbnRlbmQK
eGVuc3RvcmUtd3JpdGUgJERPTTBfS0VZL2Zyb250ZW5kLWlkICRET01VX0lECnhlbnN0b3JlLXdy
aXRlICRET00wX0tFWS9mcm9udGVuZCAiL2xvY2FsL2RvbWFpbi8kRE9NVV9JRC9kZXZpY2UvJERF
VklDRS8wIgoKICAgICAgICAjIE1ha2Ugc3VyZSB0aGUgZG9tVSBjYW4gcmVhZCB0aGUgZG9tMCBk
YXRhCnhlbnN0b3JlLWNobW9kICRET00wX0tFWSByCgp4bCBwYXVzZSBkZWJpYW4KICAgICAgICAj
IEFjdGl2YXRlIHRoZSBkZXZpY2UsIGRvbTAgbmVlZHMgdG8gYmUgYWN0aXZhdGVkIGxhc3QKeGVu
c3RvcmUtd3JpdGUgJERPTVVfS0VZL3N0YXRlIDEKeGVuc3RvcmUtd3JpdGUgJERPTTBfS0VZL3N0
YXRlIDEKeGwgdW5wYXVzZSBkZWJpYW4K
--000000000000a0fa920576edf7f3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--000000000000a0fa920576edf7f3--
