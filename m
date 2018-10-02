From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Tue, 2 Oct 2018 15:33:12 +0530
Message-ID: <CAC4nxbsBox=FgCBx5KwkkvCHwyX2MvBGoGpa1sDyS2cF0itT=Q@mail.gmail.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
 <CAC4nxbvh6LA=t2iEdiw2UrqrQP3Zf2NtRcViJ1YNGZkyLZqYHg@mail.gmail.com>
 <d130b853-0e33-ecb7-5598-d99791a5f2bf@suse.com>
 <CAC4nxbuTQ1uP6rKiCAp7hDe-ygq9LKHQw8ggVM+fOVH-VvU8Tw@mail.gmail.com>
 <d2b9cd5a-2768-60bd-07bd-2055d1490399@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1622781045472374045=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d2b9cd5a-2768-60bd-07bd-2055d1490399@suse.com>
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

--===============1622781045472374045==
Content-Type: multipart/alternative; boundary="0000000000004995b605773c0894"

--0000000000004995b605773c0894
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks,
Basic state change is working now, after using above script.

As I said, I want to share buffer between two domains.
Could you please suggest outlines, how can I share buffer between 2
domains(Guest and Host)?

Thanks,
Omkar B

On Fri, Sep 28, 2018 at 7:12 PM Juergen Gross <jgross@suse.com> wrote:

> On 28/09/2018 14:55, Omkar Bolla wrote:
> > Hi,
> > I tried to run script after pause the domain and unpause domain after
> > run script. But I ended up with same error
>
> I looked at the script again, it is wrong. The permissions should
> be set for each node under the root path of the respective domains,
> the first permission should be "n$domid" ($domid is the owner who
> can always read/write, the n is "no access" for all domains not
> explicitly listed), the second permission should be "r$domid" as
> the other side should be able to read only.
>
> In order to do it correctly the script should be:
>
> #!/bin/bash
>
> DOMU_ID=$1
>
> if [ -z "$DOMU_ID"  ]; then
>   echo "Usage: $0 [domU ID]]"
>   echo
>   echo "Connects the new device, with dom0 as backend, domU as frontend"
>   exit 1
> fi
>
> # Pause domU as a script can't write an entry and set permission
> # in a single operation.
> xl pause $DOMU_ID
>
> DEVICE=mydevice
> DOMU_KEY=/local/domain/$DOMU_ID/device/$DEVICE/0
> DOM0_KEY=/local/domain/0/backend/$DEVICE/$DOMU_ID/0
>
> # Tell the domU about the new device and its backend
> xenstore-write $DOMU_KEY/backend-id 0
> xenstore-write $DOMU_KEY/backend
> "/local/domain/0/backend/$DEVICE/$DOMU_ID/0"
>
> # Tell the dom0 about the new device and its frontend
> xenstore-write $DOM0_KEY/frontend-id $DOMU_ID
> xenstore-write $DOM0_KEY/frontend "/local/domain/$DOMU_ID/device/$DEVICE/0"
>
> # Activate the device, dom0 needs to be activated last
> xenstore-write $DOMU_KEY/state 1
> xenstore-write $DOM0_KEY/state 1
>
> # Make sure the domU can read the dom0 data
> xenstore-chmod -r $DOM0_KEY n0 r$DOMU_ID
> xenstore-chmod -r $DOMU_KEY n$DOMU_ID r0
>
> xl unpause $DOMU_ID
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

--0000000000004995b605773c0894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:#0b5394">Hi,</=
div><div class=3D"gmail_default" style=3D"color:#0b5394"><br></div><div cla=
ss=3D"gmail_default" style=3D"color:#0b5394">Thanks,</div><div class=3D"gma=
il_default" style=3D"color:#0b5394">Basic state change is working now, afte=
r using above script.</div><div class=3D"gmail_default" style=3D"color:#0b5=
394"><br></div><div class=3D"gmail_default" style=3D"color:#0b5394">As I sa=
id, I want to share buffer between two domains.</div><div class=3D"gmail_de=
fault" style=3D"color:#0b5394">Could you please suggest outlines, how can I=
 share buffer between 2 domains(Guest and Host)?</div><div class=3D"gmail_d=
efault" style=3D"color:#0b5394"><br></div><div class=3D"gmail_default" styl=
e=3D"color:#0b5394">Thanks,</div><div class=3D"gmail_default" style=3D"colo=
r:#0b5394">Omkar B</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Fri, Sep 28, 2018 at 7:12 PM Juergen Gross &lt;<a href=3D"mailto:jgro=
ss@suse.com">jgross@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On 28/09/2018 14:55, Omkar Bolla wrote:<br>
&gt; Hi,<br>
&gt; I tried to run script after pause the domain and unpause domain after<=
br>
&gt; run script. But I ended up with same error<br>
<br>
I looked at the script again, it is wrong. The permissions should<br>
be set for each node under the root path of the respective domains,<br>
the first permission should be &quot;n$domid&quot; ($domid is the owner who=
<br>
can always read/write, the n is &quot;no access&quot; for all domains not<b=
r>
explicitly listed), the second permission should be &quot;r$domid&quot; as<=
br>
the other side should be able to read only.<br>
<br>
In order to do it correctly the script should be:<br>
<br>
#!/bin/bash<br>
<br>
DOMU_ID=3D$1<br>
<br>
if [ -z &quot;$DOMU_ID&quot;=C2=A0 ]; then<br>
=C2=A0 echo &quot;Usage: $0 [domU ID]]&quot;<br>
=C2=A0 echo<br>
=C2=A0 echo &quot;Connects the new device, with dom0 as backend, domU as fr=
ontend&quot;<br>
=C2=A0 exit 1<br>
fi<br>
<br>
# Pause domU as a script can&#39;t write an entry and set permission<br>
# in a single operation.<br>
xl pause $DOMU_ID<br>
<br>
DEVICE=3Dmydevice<br>
DOMU_KEY=3D/local/domain/$DOMU_ID/device/$DEVICE/0<br>
DOM0_KEY=3D/local/domain/0/backend/$DEVICE/$DOMU_ID/0<br>
<br>
# Tell the domU about the new device and its backend<br>
xenstore-write $DOMU_KEY/backend-id 0<br>
xenstore-write $DOMU_KEY/backend<br>
&quot;/local/domain/0/backend/$DEVICE/$DOMU_ID/0&quot;<br>
<br>
# Tell the dom0 about the new device and its frontend<br>
xenstore-write $DOM0_KEY/frontend-id $DOMU_ID<br>
xenstore-write $DOM0_KEY/frontend &quot;/local/domain/$DOMU_ID/device/$DEVI=
CE/0&quot;<br>
<br>
# Activate the device, dom0 needs to be activated last<br>
xenstore-write $DOMU_KEY/state 1<br>
xenstore-write $DOM0_KEY/state 1<br>
<br>
# Make sure the domU can read the dom0 data<br>
xenstore-chmod -r $DOM0_KEY n0 r$DOMU_ID<br>
xenstore-chmod -r $DOMU_KEY n$DOMU_ID r0<br>
<br>
xl unpause $DOMU_ID<br>
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
--0000000000004995b605773c0894--


--===============1622781045472374045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1622781045472374045==--
