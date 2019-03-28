From: Spencer Michaels <spmichaels.work@gmail.com>
Subject: Xendbg: a full-featured debugger for both PV & HVM Xen
 guests
Date: Thu, 28 Mar 2019 13:05:01 -0700
Message-ID: <CAAd-cWMGjKQ2TQ1VFz-EASij=d6vaNGGtoGFdCzwziE_=uWm9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8927265588038874869=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AjGe=R7=gmail.com=spmichaels.work@srs-us1.protection.inumbo.net>)
 id 1h9bH0-0006av-Gf
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 20:05:14 +0000
Received: by mail-vs1-xe42.google.com with SMTP id e1so12894786vsp.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2019 13:05:12 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============8927265588038874869==
Content-Type: multipart/alternative; boundary="00000000000063fb2105852d12b0"

--00000000000063fb2105852d12b0
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I'm Spencer Michaels, creator of Xendbg, a recently-released full-featured
debugger for both HVM and PV Xen guests. I developed Xendbg under the
auspices
of my company, NCC Group, and released it via a post on their blog about two
months ago. Andrew Cooper kindly pointed out to me today that I neglected to
cross-post to xen-devel, which in retrospect is obviously the best place
for a
Xen debugger release announcement! So, I thought I should do so now; my
apologies for not thinking of this sooner.

The original release blog post can be found here:
https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog/2019/january/xendbg-a-full-featured-debugger-for-the-xen-hypervisor/

The source is on Github (MIT licensed):
https://github.com/nccgroup/xendbg

A talk on unikernel security I gave late last year also has a bit about
Xendbg,
with a demo of an earlier prototype:
https://youtu.be/b68VFuB_y5M?t=1933

The blog post explains why and how I created Xendbg, and some of the
difficulties I faced in doing so. Basically, I was researching Xen-based
unikernels and ended up needing a full-featured debugger (gdbsx wasn't
sufficient); when I failed to find any, I ended up writing one myself. As
Andrew pointed out to me today, I had a few theoretical misconceptions about
Xen's architecture when I wrote the original post; in particular, I didn't
describe dom0 as being a Xen VM itself. On the whole, though, I think the
post
is a decent intro to what it's like to develop tooling based on the Xen VMI
APIs, and I hope Xendbg can serve as a reference implementation for others
who
want to do so as well.

In the near future, I will likely be contributing documentation on the VMI
APIs
I figured out how to use while developing Xendbg (most of which are totally
undocumented). I think this would be a big help for people like myself who
want
to write Xen debugging tools but don't know where to start.

Finally, I should note that while writing Xendbg, some of my questions about
the VMI APIs were answered on this very list by Andrew Cooper and Tamas
Lengyel, so special thanks to the both of you! Much of the page table
reading/writing functionality was built with their help.

If you have any questions about Xendbg or my experience with the Xen VMI
APIs,
I'd be happy to answer them.

Thanks,
Spencer


P.S. For those interested, the unikernel security whitepaper on which the
talk
I mentioned above is based is going to be published this coming Monday on
our
blog (link below). It's not about Xen specifically, but it is relatively
heavily
Xen-related because the unikernels I looked at were both Xen-based, so some
people here may be interested in it. Some of the test results were obtained
using Xendbg.
https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog/

--00000000000063fb2105852d12b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello everyone,</di=
v><div><br></div><div>I&#39;m Spencer Michaels, creator of Xendbg, a recent=
ly-released full-featured</div><div>debugger for both HVM and PV Xen guests=
. I developed Xendbg under the auspices</div><div>of my company, NCC Group,=
 and released it via a post on their blog about two</div><div>months ago. A=
ndrew Cooper kindly pointed out to me today that I neglected to</div><div>c=
ross-post to xen-devel, which in retrospect is obviously the best place for=
 a</div><div>Xen debugger release announcement! So, I thought I should do s=
o now; my</div><div>apologies for not thinking of this sooner.</div><div><b=
r></div><div>The original release blog post can be found here:</div><div><s=
pan style=3D"white-space:pre">	</span><a href=3D"https://www.nccgroup.trust=
/us/about-us/newsroom-and-events/blog/2019/january/xendbg-a-full-featured-d=
ebugger-for-the-xen-hypervisor/">https://www.nccgroup.trust/us/about-us/new=
sroom-and-events/blog/2019/january/xendbg-a-full-featured-debugger-for-the-=
xen-hypervisor/</a></div><div><br></div><div>The source is on Github (MIT l=
icensed):</div><div><span style=3D"white-space:pre">	</span><a href=3D"http=
s://github.com/nccgroup/xendbg">https://github.com/nccgroup/xendbg</a></div=
><div><br></div><div>A talk on unikernel security I gave late last year als=
o has a bit about Xendbg,</div><div>with a demo of an earlier prototype:</d=
iv><div><span style=3D"white-space:pre">	</span><a href=3D"https://youtu.be=
/b68VFuB_y5M?t=3D1933">https://youtu.be/b68VFuB_y5M?t=3D1933</a></div><div>=
<br></div><div>The blog post explains why and how I created Xendbg, and som=
e of the</div><div>difficulties I faced in doing so. Basically, I was resea=
rching Xen-based</div><div>unikernels and ended up needing a full-featured =
debugger (gdbsx wasn&#39;t</div><div>sufficient); when I failed to find any=
, I ended up writing one myself. As</div><div>Andrew pointed out to me toda=
y, I had a few theoretical misconceptions about</div><div>Xen&#39;s archite=
cture when I wrote the original post; in particular, I didn&#39;t</div><div=
>describe dom0 as being a Xen VM itself. On the whole, though, I think the =
post</div><div>is a decent intro to what it&#39;s like to develop tooling b=
ased on the Xen VMI</div><div>APIs, and I hope Xendbg can serve as a refere=
nce implementation for others who</div><div>want to do so as well.</div><di=
v><br></div><div>In the near future, I will likely be contributing document=
ation on the VMI APIs</div><div>I figured out how to use while developing X=
endbg (most of which are totally</div><div>undocumented). I think this woul=
d be a big help for people like myself who want</div><div>to write Xen debu=
gging tools but don&#39;t know where to start.</div><div><br></div><div><di=
v>Finally, I should note that while writing Xendbg, some of my questions ab=
out</div><div>the VMI APIs were answered on this very list by Andrew Cooper=
 and Tamas</div><div>Lengyel, so special thanks to the both of you! Much of=
 the page table</div><div>reading/writing functionality was built with thei=
r help.</div></div><div><br></div><div>If you have any questions about Xend=
bg or my experience with the Xen VMI APIs,</div><div>I&#39;d be happy to an=
swer them.</div><div><br></div><div>Thanks,</div><div>Spencer</div><div><br=
></div><div><br></div><div>P.S. For those interested, the unikernel securit=
y whitepaper on which the talk</div><div>I mentioned above is based is goin=
g to be published this coming Monday on our</div><div>blog (link below). It=
&#39;s not about Xen specifically, but it is relatively heavily</div><div>X=
en-related because the unikernels I looked at were both Xen-based, so some<=
/div><div>people here may be interested in it. Some of the test results wer=
e obtained</div><div>using Xendbg.</div><div><span style=3D"white-space:pre=
">	</span><a href=3D"https://www.nccgroup.trust/us/about-us/newsroom-and-ev=
ents/blog/">https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog=
/</a></div><div><br></div></div></div></div>

--00000000000063fb2105852d12b0--


--===============8927265588038874869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8927265588038874869==--
