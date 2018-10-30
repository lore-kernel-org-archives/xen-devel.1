From: Vikram K <vikram.k@pathpartnertech.com>
Subject: Re: [Xen-users] [XEN][ARM] WiFi bridge creation
Date: Tue, 30 Oct 2018 19:43:30 +0530
Message-ID: <CAFsJcmbcCrpJkXqGs3mu=nMZA=2DNcOgf+s-jnNbWMAi1+Ri6A@mail.gmail.com>
References: <CAFsJcmYQRttza046T09sCBZzEs7pm31uxawQJHxsQySpyELkBQ@mail.gmail.com>
 <20181030080929.6d04a875@planb.netng.org>
 <CAFsJcmZFrpmattTzwkijF7Wz4cgXErg0090QBx1S-zJCRNnScg@mail.gmail.com>
 <20181030113408.74525d80@planb.netng.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6811234123922464269=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xqb5=nk=pathpartnertech.com=vikram.k@srs-us1.protection.inumbo.net>)
 id 1gHUm8-00048B-KG
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 14:13:44 +0000
Received: by mail-lf1-x130.google.com with SMTP id n3-v6so8981953lfe.7
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 07:13:42 -0700 (PDT)
In-Reply-To: <20181030113408.74525d80@planb.netng.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vladimir Botka <vbotka@gmail.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6811234123922464269==
Content-Type: multipart/alternative; boundary="000000000000ec46bd057972ca71"

--000000000000ec46bd057972ca71
Content-Type: text/plain; charset="UTF-8"

Thanks Vladimir.

Can some one provide pointer/reference on how to use NAT to share WiFi
between Dom0 and DomU.
Followed the instruction provided in the below link, but no success.
https://wiki.debian.org/BridgeNetworkConnections#Bridging_with_a_wireless_NIC




On Tue, Oct 30, 2018 at 4:04 PM Vladimir Botka <vbotka@gmail.com> wrote:

> > On Tue, Oct 30, 2018 at 12:39 PM Vladimir Botka <vbotka@gmail.com>
> wrote:
> > > On Tue, 30 Oct 2018 10:03:22 +0530
> > > Vikram K <vikram.k@pathpartnertech.com> wrote:
> > > > Hello,
> > > > We are using Hikey960 with Debian as Dom0 and DomU. This board has
> only
> > > > WiFi interface. We want to create bridge between Dom0 and DomU so
> that
> > > > DomU
> > > > has internet access. We tried to create bridge using brtcl command,
> but
> > > > it
> > > > is not working. Please provide pointers.
>
> > > AFAIK, it's not working
> > > https://marc.info/?l=linux-wireless&m=136743495526905&w=2
> > > "There is a proposed fix that is included in OpenWrt"
> > > https://marc.info/?l=linux-wireless&m=145591129008322&w=2
> > > More details are avilable in OpenWrt WiKi
> > > https://wiki.openwrt.org/doc/recipes/relayclient
> > > -vlado
>
> On Tue, 30 Oct 2018 15:01:39 +0530
> Vikram K <vikram.k@pathpartnertech.com> wrote:
> > Hi,
> > As per below link, it is possible to share Internet via WiFi between Dom0
> > and DomU,.
> > https://wiki.xenproject.org/wiki/Xen_in_WiFi_networks
> > Tried the suggested solution using ebtables, but it did not work.
> > * ebtables -t nat -A POSTROUTING -s 00:60:00:00:00:01 \
> >               -j snat --to-source 00:60:aa:bb:cc:dd*
> > In the configurations file we have added below configuration in DomU
> > config file.
> > * vif = ['mac=00:16:3e:64:b8:40']*
> > Apart from that do we need to add any addition configuration?
>
> NAT is a different story. Worked for me with Armbian(no XEN) and Atheros
> 9280
> couple of years ago. I used Ansible to configure it.
>
> https://github.com/vbotka/ansible-linux-postinstall/blob/master/templates/router1-iptables.j2
>
> HTH,
>
> - vlado
>


-- 
Thanks & Regards
Vikram KS

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

--000000000000ec46bd057972ca71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Thanks Vladimir.</div><div><br></div=
><div>Can some one provide pointer/reference on how to use NAT to share WiF=
i between Dom0 and DomU.</div><div>Followed the instruction provided in the=
 below link, but no success.</div><div><a href=3D"https://wiki.debian.org/B=
ridgeNetworkConnections#Bridging_with_a_wireless_NIC">https://wiki.debian.o=
rg/BridgeNetworkConnections#Bridging_with_a_wireless_NIC</a></div><div><br>=
</div><div><br></div><div><div><br></div></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 30, 2018 at 4:04 PM Vladimir =
Botka &lt;<a href=3D"mailto:vbotka@gmail.com">vbotka@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">&gt; On Tue, Oct 30, 2018 at 12:=
39 PM Vladimir Botka &lt;<a href=3D"mailto:vbotka@gmail.com" target=3D"_bla=
nk">vbotka@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Tue, 30 Oct 2018 10:03:22 +0530<br>
&gt; &gt; Vikram K &lt;<a href=3D"mailto:vikram.k@pathpartnertech.com" targ=
et=3D"_blank">vikram.k@pathpartnertech.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; We are using Hikey960 with Debian as Dom0 and DomU. This boa=
rd has only<br>
&gt; &gt; &gt; WiFi interface. We want to create bridge between Dom0 and Do=
mU so that=C2=A0 <br>
&gt; &gt; &gt; DomU=C2=A0 <br>
&gt; &gt; &gt; has internet access. We tried to create bridge using brtcl c=
ommand, but=C2=A0 <br>
&gt; &gt; &gt; it=C2=A0 <br>
&gt; &gt; &gt; is not working. Please provide pointers.=C2=A0 <br>
<br>
&gt; &gt; AFAIK, it&#39;s not working<br>
&gt; &gt; <a href=3D"https://marc.info/?l=3Dlinux-wireless&amp;m=3D13674349=
5526905&amp;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?=
l=3Dlinux-wireless&amp;m=3D136743495526905&amp;w=3D2</a><br>
&gt; &gt; &quot;There is a proposed fix that is included in OpenWrt&quot;<b=
r>
&gt; &gt; <a href=3D"https://marc.info/?l=3Dlinux-wireless&amp;m=3D14559112=
9008322&amp;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?=
l=3Dlinux-wireless&amp;m=3D145591129008322&amp;w=3D2</a><br>
&gt; &gt; More details are avilable in OpenWrt WiKi<br>
&gt; &gt; <a href=3D"https://wiki.openwrt.org/doc/recipes/relayclient" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.openwrt.org/doc/recipes/rela=
yclient</a><br>
&gt; &gt; -vlado<br>
<br>
On Tue, 30 Oct 2018 15:01:39 +0530<br>
Vikram K &lt;<a href=3D"mailto:vikram.k@pathpartnertech.com" target=3D"_bla=
nk">vikram.k@pathpartnertech.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt; As per below link, it is possible to share Internet via WiFi between D=
om0<br>
&gt; and DomU,.<br>
&gt; <a href=3D"https://wiki.xenproject.org/wiki/Xen_in_WiFi_networks" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Xen_in_W=
iFi_networks</a><br>
&gt; Tried the suggested solution using ebtables, but it did not work.<br>
&gt; * ebtables -t nat -A POSTROUTING -s 00:60:00:00:00:01 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-j snat --to-sou=
rce 00:60:aa:bb:cc:dd*<br>
&gt; In the configurations file we have added below configuration in DomU<b=
r>
&gt; config file.<br>
&gt; * vif =3D [&#39;mac=3D00:16:3e:64:b8:40&#39;]*<br>
&gt; Apart from that do we need to add any addition configuration?<br>
<br>
NAT is a different story. Worked for me with Armbian(no XEN) and Atheros 92=
80<br>
couple of years ago. I used Ansible to configure it.<br>
<a href=3D"https://github.com/vbotka/ansible-linux-postinstall/blob/master/=
templates/router1-iptables.j2" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/vbotka/ansible-linux-postinstall/blob/master/templates/router1-=
iptables.j2</a><br>
<br>
HTH,<br>
<br>
- vlado<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><span>Thanks &amp; Regards<br>Vikram KS<br></span><span styl=
e=3D"color:rgb(19,79,92)"></span></div></div></div></div>

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
--000000000000ec46bd057972ca71--


--===============6811234123922464269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6811234123922464269==--
