From: Spencer Michaels <sxmichaels@gmail.com>
Subject: Re: Reading guest page flags
Date: Fri, 14 Sep 2018 01:01:33 -0700
Message-ID: <CAMf-k8F6NFiPsm_ezQObZFQoVovW1Ot4_Q+G=ugoxz4zPYESSQ@mail.gmail.com>
References: <CAMf-k8GVDLxt4hS9TngxxEb9Sn+jRM7Ecjfk__wL6xwbdKZKJw@mail.gmail.com>
 <daf65b86-e750-5544-9c5b-fd7ecb977738@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5930791900962056223=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=awal=l4=gmail.com=sxmichaels@srs-us1.protection.inumbo.net>)
 id 1g0j2y-0003wi-Pz
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 08:01:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id 20-v6so9350239wrb.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Sep 2018 01:01:47 -0700 (PDT)
In-Reply-To: <daf65b86-e750-5544-9c5b-fd7ecb977738@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5930791900962056223==
Content-Type: multipart/alternative; boundary="00000000000022b6810575d03c01"

--00000000000022b6810575d03c01
Content-Type: text/plain; charset="UTF-8"

Thanks! Sorry, I should have been more specific - I do indeed mean the
regular guest PTEs (and I'm using PV guests which as I understand don't use
EPT anyway). So, it seems I'll have to write my own code for this. I'll
take a look at libvmi's implementation; if anyone knows any other libraries
/ programs that read guest PTEs, that would be helpful to know as well.

On Thu, Sep 13, 2018, 10:47 AM Razvan Cojocaru <rcojocaru@bitdefender.com>
wrote:

> On 9/13/18 8:29 PM, Spencer Michaels wrote:
> > I'm writing an application that can read/write guest memory, and as part
> > of that I need to check whether the page being manipulated is
> > readable/writable by the guest itself. Does Xen have an API that would
> > allow me to read the flags of an arbitrary page on a guest, given either
> > its address or its PFN? I've only been able to find functions that
> > update the existing memory mappings, but none to read them.
>
> If you mean EPT, yes: look at xc_get_mem_access() in xenctrl.h / libxc.
> If you mean "regular" PTEs, no - you'd have to write your own code to
> retrieve that.
>

--00000000000022b6810575d03c01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks! Sorry, I should have been more specific - I =
do indeed mean the regular guest PTEs (and I&#39;m using PV guests which as=
 I understand don&#39;t use EPT anyway). So, it seems I&#39;ll have to writ=
e my own code for this. I&#39;ll take a look at libvmi&#39;s implementation=
; if anyone knows any other libraries / programs that read guest PTEs, that=
 would be helpful to know as well.<br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Thu, Sep 13, 2018, 10:47 AM Razvan Cojocaru &lt;<a href=3D"ma=
ilto:rcojocaru@bitdefender.com" target=3D"_blank" rel=3D"noreferrer">rcojoc=
aru@bitdefender.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On 9/13/18 8:29 PM, Spencer Michaels wrote:<br>
&gt; I&#39;m writing an application that can read/write guest memory, and a=
s part<br>
&gt; of that I need to check whether the page being manipulated is<br>
&gt; readable/writable by the guest itself. Does Xen have an API that would=
<br>
&gt; allow me to read the flags of an arbitrary page on a guest, given eith=
er<br>
&gt; its address or its PFN? I&#39;ve only been able to find functions that=
<br>
&gt; update the existing memory mappings, but none to read them.<br>
<br>
If you mean EPT, yes: look at xc_get_mem_access() in xenctrl.h / libxc.<br>
If you mean &quot;regular&quot; PTEs, no - you&#39;d have to write your own=
 code to<br>
retrieve that.<br>
</blockquote></div></div></div>

--00000000000022b6810575d03c01--


--===============5930791900962056223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5930791900962056223==--
