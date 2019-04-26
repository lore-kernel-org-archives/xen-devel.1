From: Geoffrey Marr <gmarr@redhat.com>
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
Date: Fri, 26 Apr 2019 10:36:50 -0600
Message-ID: <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
References: <1499367541.22465.102.camel@fedoraproject.org> <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org> <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org> <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
Reply-To: For testing and quality assurance of Fedora releases <test@lists.fedoraproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3491000516847798279=="
Return-path: <test-bounces@lists.fedoraproject.org>
In-Reply-To: <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
List-Archive: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/>
List-Help: <mailto:test-request@lists.fedoraproject.org?subject=help>
List-Post: <mailto:test@lists.fedoraproject.org>
List-Subscribe: <mailto:test-join@lists.fedoraproject.org>
List-Unsubscribe: <mailto:test-leave@lists.fedoraproject.org>
To: For testing and quality assurance of Fedora releases <test@lists.fedoraproject.org>
Cc: "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============3491000516847798279==
Content-Type: multipart/alternative; boundary="000000000000583a510587718bae"

--000000000000583a510587718bae
Content-Type: text/plain; charset="UTF-8"

Since F24, I haven't seen or heard of anyone who uses Xen over KVM anywhere
other than this thread... I'm +1 for making this test an "Optional" one.

Geoff Marr
IRC: coremodule


On Fri, Apr 26, 2019 at 10:33 AM Adam Williamson <adamwill@fedoraproject.org>
wrote:

> On Thu, 2017-07-06 at 13:19 -0700, Adam Williamson wrote:
> > On Thu, 2017-07-06 at 15:59 -0400, Konrad Rzeszutek Wilk wrote:
> > > > > I would prefer for it to remain as it is.
> > > >
> > > > This is only practical if it's going to be tested, and tested
> regularly
> > > > - not *only* on the final release candidate, right before we sign off
> > > > on the release. It needs to be tested regularly throughout the
> release
> > > > cycle, on the composes that are "nominated for testing".
> > >
> > > Right, which is why I am happy that you have pointed me to the right
> > > place so I can be up-to-date.
> >
> > Great, thanks. So let's leave it as it is for now, but we'll keep an
> > eye on this during F27 cycle. If we get to, say, Beta and there are no
> > results for the test, that's gonna be a problem. Thanks!
>
> So, for Fedora 30, this was not tested throughout the whole cycle. I
> think we can consider the proposal to remove the criterion active
> again.
> --
> Adam Williamson
> Fedora QA Community Monkey
> IRC: adamw | Twitter: AdamW_Fedora | XMPP: adamw AT happyassassin . net
> http://www.happyassassin.net
> _______________________________________________
> test mailing list -- test@lists.fedoraproject.org
> To unsubscribe send an email to test-leave@lists.fedoraproject.org
> Fedora Code of Conduct: https://getfedora.org/code-of-conduct.html
> List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> List Archives:
> https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org
>

--000000000000583a510587718bae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Since F24, I haven&#39;t seen or heard of anyone who =
uses Xen over KVM anywhere other than this thread... I&#39;m +1 for making =
this test an &quot;Optional&quot; one.</div><div><br></div><div><div><div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div>Geoff Marr</div><div></div>IRC: coremodule<br></div=
></div></div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Apr 26, 2019 at 10:33 AM Adam William=
son &lt;<a href=3D"mailto:adamwill@fedoraproject.org">adamwill@fedoraprojec=
t.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, 2017-07-06 at 13:19 -0700, Adam Williamson wrote:<br>
&gt; On Thu, 2017-07-06 at 15:59 -0400, Konrad Rzeszutek Wilk wrote:<br>
&gt; &gt; &gt; &gt; I would prefer for it to remain as it is.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This is only practical if it&#39;s going to be tested, and t=
ested regularly<br>
&gt; &gt; &gt; - not *only* on the final release candidate, right before we=
 sign off<br>
&gt; &gt; &gt; on the release. It needs to be tested regularly throughout t=
he release<br>
&gt; &gt; &gt; cycle, on the composes that are &quot;nominated for testing&=
quot;.<br>
&gt; &gt; <br>
&gt; &gt; Right, which is why I am happy that you have pointed me to the ri=
ght<br>
&gt; &gt; place so I can be up-to-date.<br>
&gt; <br>
&gt; Great, thanks. So let&#39;s leave it as it is for now, but we&#39;ll k=
eep an<br>
&gt; eye on this during F27 cycle. If we get to, say, Beta and there are no=
<br>
&gt; results for the test, that&#39;s gonna be a problem. Thanks!<br>
<br>
So, for Fedora 30, this was not tested throughout the whole cycle. I<br>
think we can consider the proposal to remove the criterion active<br>
again.<br>
-- <br>
Adam Williamson<br>
Fedora QA Community Monkey<br>
IRC: adamw | Twitter: AdamW_Fedora | XMPP: adamw AT happyassassin . net<br>
<a href=3D"http://www.happyassassin.net" rel=3D"noreferrer" target=3D"_blan=
k">http://www.happyassassin.net</a><br>
_______________________________________________<br>
test mailing list -- <a href=3D"mailto:test@lists.fedoraproject.org" target=
=3D"_blank">test@lists.fedoraproject.org</a><br>
To unsubscribe send an email to <a href=3D"mailto:test-leave@lists.fedorapr=
oject.org" target=3D"_blank">test-leave@lists.fedoraproject.org</a><br>
Fedora Code of Conduct: <a href=3D"https://getfedora.org/code-of-conduct.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://getfedora.org/code-of-cond=
uct.html</a><br>
List Guidelines: <a href=3D"https://fedoraproject.org/wiki/Mailing_list_gui=
delines" rel=3D"noreferrer" target=3D"_blank">https://fedoraproject.org/wik=
i/Mailing_list_guidelines</a><br>
List Archives: <a href=3D"https://lists.fedoraproject.org/archives/list/tes=
t@lists.fedoraproject.org" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.fedoraproject.org/archives/list/test@lists.fedoraproject.org</a><br>
</blockquote></div>

--000000000000583a510587718bae--

--===============3491000516847798279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KdGVzdCBtYWls
aW5nIGxpc3QgLS0gdGVzdEBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIHRlc3QtbGVhdmVAbGlzdHMuZmVkb3JhcHJvamVjdC5vcmcKRmVkb3Jh
IENvZGUgb2YgQ29uZHVjdDogaHR0cHM6Ly9nZXRmZWRvcmEub3JnL2NvZGUtb2YtY29uZHVjdC5o
dG1sCkxpc3QgR3VpZGVsaW5lczogaHR0cHM6Ly9mZWRvcmFwcm9qZWN0Lm9yZy93aWtpL01haWxp
bmdfbGlzdF9ndWlkZWxpbmVzCkxpc3QgQXJjaGl2ZXM6IGh0dHBzOi8vbGlzdHMuZmVkb3JhcHJv
amVjdC5vcmcvYXJjaGl2ZXMvbGlzdC90ZXN0QGxpc3RzLmZlZG9yYXByb2plY3Qub3JnCg==

--===============3491000516847798279==--
