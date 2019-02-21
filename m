From: Julien Grall <julien.grall@gmail.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Thu, 21 Feb 2019 08:38:39 +0000
Message-ID: <CAF3u54Ct7nBjoLw9Vzb=aZVu=N5Ccp5_k6GxLo_ZSA=YCsco6A@mail.gmail.com>
References: <5e256d9a-572c-e01e-7706-407f99245b00@arm.com>
 <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <1574a7fe-a5ac-4bc2-d3f0-967d8d01e5f1@oracle.com>
 <1100e6b1-6fa8-06f0-8ecc-b0699a2ce5f4@arm.com>
 <20190221080752.zy2qlzb4vi7tbu3p@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0893561625914154609=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kaJ0=Q4=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gwjsc-0003He-Bg
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 08:38:54 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id e81so12565487vsd.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Feb 2019 00:38:53 -0800 (PST)
In-Reply-To: <20190221080752.zy2qlzb4vi7tbu3p@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dave P Martin <dave.martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============0893561625914154609==
Content-Type: multipart/alternative; boundary="0000000000007293380582636702"

--0000000000007293380582636702
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,

On Thu, 21 Feb 2019, 08:08 Roger Pau Monn=C3=A9, <roger.pau@citrix.com> wro=
te:

> FWIW, you can also mask the interrupt while waiting for the thread to
> execute the interrupt handler. Ie:
>

Thank you for providing steps, however where would the masking be done? By
the irqchip or a custom solution?


> 1. Interrupt injected
> 2. Execute guest event channel callback
> 3. Scan for pending interrupts
> 4. Mask interrupt
> 5. Clear pending field
> 6. Queue threaded handler
> 7. Go to 3 until all interrupts are drained
> [...]
> 8. Execute interrupt handler in thread
> 9. Unmask interrupt
>
> That should prevent you from stacking interrupts?
>
> Roger.
>

--0000000000007293380582636702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 21 Feb=
 2019, 08:08 Roger Pau Monn=C3=A9, &lt;<a href=3D"mailto:roger.pau@citrix.c=
om">roger.pau@citrix.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
FWIW, you can also mask the interrupt while waiting for the thread to<br>
execute the interrupt handler. Ie:<br></blockquote></div><div><br></div><di=
v>Thank you for providing steps, however where would the masking be done? B=
y the irqchip or a custom solution?</div><div><br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
1. Interrupt injected<br>
2. Execute guest event channel callback<br>
3. Scan for pending interrupts<br>
4. Mask interrupt<br>
5. Clear pending field<br>
6. Queue threaded handler<br>
7. Go to 3 until all interrupts are drained<br>
[...]<br>
8. Execute interrupt handler in thread<br>
9. Unmask interrupt<br>
<br>
That should prevent you from stacking interrupts?<br>
<br>
Roger.<br>
</blockquote></div>

--0000000000007293380582636702--


--===============0893561625914154609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0893561625914154609==--
