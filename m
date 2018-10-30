From: Vikram K <vikram.k@pathpartnertech.com>
Subject: Re: [Xen-users] [XEN][ARM] WiFi bridge creation
Date: Tue, 30 Oct 2018 15:01:39 +0530
Message-ID: <CAFsJcmZFrpmattTzwkijF7Wz4cgXErg0090QBx1S-zJCRNnScg@mail.gmail.com>
References: <CAFsJcmYQRttza046T09sCBZzEs7pm31uxawQJHxsQySpyELkBQ@mail.gmail.com>
 <20181030080929.6d04a875@planb.netng.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7490816351798996701=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xqb5=nk=pathpartnertech.com=vikram.k@srs-us1.protection.inumbo.net>)
 id 1gHQNP-00018v-3W
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 09:31:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id p86so6085503lfg.5
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 02:31:53 -0700 (PDT)
In-Reply-To: <20181030080929.6d04a875@planb.netng.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: vbotka@gmail.com
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7490816351798996701==
Content-Type: multipart/alternative; boundary="000000000000055bbf05796edbbd"

--000000000000055bbf05796edbbd
Content-Type: text/plain; charset="UTF-8"

Hi,

  As per below link, it is possible to share Internet via WiFi between Dom0
and DomU,.
  https://wiki.xenproject.org/wiki/Xen_in_WiFi_networks

  Tried the suggested solution using ebtables, but it did not work.



* ebtables -t nat -A POSTROUTING -s 00:60:00:00:00:01 \
              -j snat --to-source 00:60:aa:bb:cc:dd*

 In the configurations file we have added below configuration in DomU
config file.
* vif = ['mac=00:16:3e:64:b8:40']*


Apart from that do we need to add any addition configuration?


On Tue, Oct 30, 2018 at 12:39 PM Vladimir Botka <vbotka@gmail.com> wrote:

> On Tue, 30 Oct 2018 10:03:22 +0530
> Vikram K <vikram.k@pathpartnertech.com> wrote:
>
> > Hello,
> > We are using Hikey960 with Debian as Dom0 and DomU. This board has only
> > WiFi interface. We want to create bridge between Dom0 and DomU so that
> DomU
> > has internet access. We tried to create bridge using brtcl command, but
> it
> > is not working. Please provide pointers.
>
> AFAIK, it's not working
> https://marc.info/?l=linux-wireless&m=136743495526905&w=2
> "There is a proposed fix that is included in OpenWrt"
> https://marc.info/?l=linux-wireless&m=145591129008322&w=2
> More details are avilable in OpenWrt WiKi
> https://wiki.openwrt.org/doc/recipes/relayclient
>
> HTH,
>
> -vlado
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

--000000000000055bbf05796edbbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
,</div><div><br></div><div>=C2=A0 As per below link, it is possible to shar=
e Internet via WiFi between Dom0 and DomU,.</div><div>=C2=A0 <a href=3D"htt=
ps://wiki.xenproject.org/wiki/Xen_in_WiFi_networks">https://wiki.xenproject=
.org/wiki/Xen_in_WiFi_networks</a><br></div><div><br></div><div>=C2=A0 Trie=
d the suggested solution using ebtables, but it did not work. <br></div><di=
v><pre><b> <span style=3D"font-family:arial,helvetica,sans-serif">ebtables =
-t nat -A POSTROUTING -s 00:60:00:00:00:01 \
              -j snat --to-source 00:60:aa:bb:cc:dd</span><br><br></b></pre=
><pre><span style=3D"font-family:arial,helvetica,sans-serif"> In the config=
urations file we have added below configuration in DomU config file.<br><b>=
 vif =3D [&#39;mac=3D00:16:3e:64:b8:40&#39;]</b></span><b><br></b></pre>=C2=
=A0 <br></div><div>Apart from that do we need to add any addition configura=
tion?<br></div><div><br></div></div></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr">On Tue, Oct 30, 2018 at 12:39 PM Vladimir Botka =
&lt;<a href=3D"mailto:vbotka@gmail.com">vbotka@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Tue, 30 Oct 2018 10:03:22 +0530<br>
Vikram K &lt;<a href=3D"mailto:vikram.k@pathpartnertech.com" target=3D"_bla=
nk">vikram.k@pathpartnertech.com</a>&gt; wrote:<br>
<br>
&gt; Hello,<br>
&gt; We are using Hikey960 with Debian as Dom0 and DomU. This board has onl=
y<br>
&gt; WiFi interface. We want to create bridge between Dom0 and DomU so that=
 DomU<br>
&gt; has internet access. We tried to create bridge using brtcl command, bu=
t it<br>
&gt; is not working. Please provide pointers.<br>
<br>
AFAIK, it&#39;s not working<br>
<a href=3D"https://marc.info/?l=3Dlinux-wireless&amp;m=3D136743495526905&am=
p;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dlinux-=
wireless&amp;m=3D136743495526905&amp;w=3D2</a><br>
&quot;There is a proposed fix that is included in OpenWrt&quot;<br>
<a href=3D"https://marc.info/?l=3Dlinux-wireless&amp;m=3D145591129008322&am=
p;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dlinux-=
wireless&amp;m=3D145591129008322&amp;w=3D2</a><br>
More details are avilable in OpenWrt WiKi<br>
<a href=3D"https://wiki.openwrt.org/doc/recipes/relayclient" rel=3D"norefer=
rer" target=3D"_blank">https://wiki.openwrt.org/doc/recipes/relayclient</a>=
<br>
<br>
HTH,<br>
<br>
-vlado<br>
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
--000000000000055bbf05796edbbd--


--===============7490816351798996701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7490816351798996701==--
