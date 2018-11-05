From: Rishi <2rushikeshj@gmail.com>
Subject: Re: Dom0 kernel 4.14 with SMP randomly crashing
Date: Mon, 5 Nov 2018 18:00:10 +0530
Message-ID: <CAO9XypVrwzvC4iNP9HR63kjj_n-Ju30mvptd89GtK6TYO0yUTQ@mail.gmail.com>
References: <CAO9XypUsz-e3vmX-n5eSMz7rG2aZpDG1h03CMRAAT2X=TpZNNw@mail.gmail.com>
 <20181105101938.mj2c6l4nx5sbsk2n@zion.uk.xensource.com>
 <CAO9XypWZ=Qr4Bo9Km_MUeod3cCHOnA=SonXXRF95zeeu0+RNHQ@mail.gmail.com>
 <20181105105852.ae4sjkkcm6eumpwr@zion.uk.xensource.com>
 <CAO9XypUXJkhGEiH14HuMW8zOha9mRQh0+kpMa_0b2doHhjJUCQ@mail.gmail.com>
 <20181105114127.s57z7n7p4pmix5b5@zion.uk.xensource.com>
 <CAO9XypV42TO8c=26dRJSNnFukXDfWp_0rM3McRBKZs1crT1qEA@mail.gmail.com>
 <20181105115850.f677uvjmm7vqfikc@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0287050578245869222=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181105115850.f677uvjmm7vqfikc@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0287050578245869222==
Content-Type: multipart/alternative; boundary="00000000000075bce50579ea0c87"

--00000000000075bce50579ea0c87
Content-Type: text/plain; charset="UTF-8"

I'm using a XenServer Host and XCP-NG on it as HVM. I used xencons=tty
console=ttyS0 on XCP-NG dom0 kernel line, to obtain serial console.
I'm working on to build a more recent dom0 kernel for improved support of
Ceph in XenServer/XCP-NG.



On Mon, Nov 5, 2018 at 5:28 PM Wei Liu <wei.liu2@citrix.com> wrote:

> On Mon, Nov 05, 2018 at 05:18:43PM +0530, Rishi wrote:
> > Yes, I'm running it in a HVM domU for development purpose.
>
> What is your exact setup?
>
> Wei.
>
> >
> > On Mon, Nov 5, 2018 at 5:11 PM Wei Liu <wei.liu2@citrix.com> wrote:
> >
> > > On Mon, Nov 05, 2018 at 04:58:35PM +0530, Rishi wrote:
> > > > Alright, I got the serial console and following is the crash log.
> Thank
> > > you
> > > > for pointing that out.
> > > >
> > > > [  133.594852] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
> > > > [ksoftirqd/2:22]
> > > >
> > > > [  133.599232] Kernel panic - not syncing: softlockup: hung tasks
> > > >
> > > > [  133.602275] CPU: 2 PID: 22 Comm: ksoftirqd/2 Tainted: G
> > > > L    4.19.1
> > > > #1
> > > >
> > > > [  133.606620] Hardware name: Xen HVM domU, BIOS 4.4.1-xs132257
> > > 12/12/2016
> > >
> > > Is this serial log from the host? It says it is running as a HVM DomU.
> > > Maybe you have mistaken guest serial log with host serial log?
> > >
> > > This indicates your machine runs XenServer, which has its own patch
> > > queues on top of upstream Xen. You may also want to report to xs-devel
> > > mailing list.
> > >
> > > Wei.
> > >
>

--00000000000075bce50579ea0c87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m using a XenServer Host and XCP-NG on it as HVM. I =
used=C2=A0<span style=3D"font-variant-ligatures:no-common-ligatures;color:r=
gb(0,0,0);font-family:Menlo;font-size:11px">xencons=3Dtty console=3DttyS0=
=C2=A0</span>on XCP-NG dom0 kernel line, to obtain serial console.<div>I&#3=
9;m working on to build a more recent dom0 kernel for improved support of C=
eph in XenServer/XCP-NG.</div><div><br></div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 5, 2018 at 5:28 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu2@citrix.com">wei.liu2@citrix.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Mon, Nov 05, 2018 at 05:18=
:43PM +0530, Rishi wrote:<br>
&gt; Yes, I&#39;m running it in a HVM domU for development purpose.<br>
<br>
What is your exact setup?<br>
<br>
Wei.<br>
<br>
&gt; <br>
&gt; On Mon, Nov 5, 2018 at 5:11 PM Wei Liu &lt;<a href=3D"mailto:wei.liu2@=
citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Nov 05, 2018 at 04:58:35PM +0530, Rishi wrote:<br>
&gt; &gt; &gt; Alright, I got the serial console and following is the crash=
 log. Thank<br>
&gt; &gt; you<br>
&gt; &gt; &gt; for pointing that out.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [=C2=A0 133.594852] watchdog: BUG: soft lockup - CPU#2 stuck=
 for 22s!<br>
&gt; &gt; &gt; [ksoftirqd/2:22]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [=C2=A0 133.599232] Kernel panic - not syncing: softlockup: =
hung tasks<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [=C2=A0 133.602275] CPU: 2 PID: 22 Comm: ksoftirqd/2 Tainted=
: G<br>
&gt; &gt; &gt; L=C2=A0 =C2=A0 4.19.1<br>
&gt; &gt; &gt; #1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [=C2=A0 133.606620] Hardware name: Xen HVM domU, BIOS 4.4.1-=
xs132257<br>
&gt; &gt; 12/12/2016<br>
&gt; &gt;<br>
&gt; &gt; Is this serial log from the host? It says it is running as a HVM =
DomU.<br>
&gt; &gt; Maybe you have mistaken guest serial log with host serial log?<br=
>
&gt; &gt;<br>
&gt; &gt; This indicates your machine runs XenServer, which has its own pat=
ch<br>
&gt; &gt; queues on top of upstream Xen. You may also want to report to xs-=
devel<br>
&gt; &gt; mailing list.<br>
&gt; &gt;<br>
&gt; &gt; Wei.<br>
&gt; &gt;<br>
</blockquote></div>

--00000000000075bce50579ea0c87--


--===============0287050578245869222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0287050578245869222==--
