From: Minjun Hong <nickeysgo@gmail.com>
Subject: where can I find the 'address translation' code in Xen?
Date: Sun, 29 Apr 2018 19:11:30 +0900
Message-ID: <CAFX_q-EPQuiEV4SBSFnCagEhx8pgTBWe6K-1FUP0sfMaLA5Kmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5145412462683802226=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============5145412462683802226==
Content-Type: multipart/alternative; boundary="001a114561d40728ac056af9f63a"

--001a114561d40728ac056af9f63a
Content-Type: text/plain; charset="UTF-8"

Hi.
I'm looking for a point where address translation (guest virtual address to
machine address) occurs in Xen.
Of course, I mean when TLB miss has occured.
I'm using a PV guest and I've found 'guest_walk_tables()' function in
"xen/arch/x86/mm/guest_walk.c".
However, in the comment of the function, it says "Walk the guest
pagetables, after the manner of a hardware walker".
I'm confused because I'm not sure if the function is called after the
'hardware page table walker'.

My question is,

1. Is it sure that the function will be called even though the HW already
translates the address and populates the TLB entry?

2. I'm just asking, is there any code in Xen that is related to the
behavior of the 'hardware walker'?

Thanks for your reading.

--001a114561d40728ac056af9f63a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi.</div><div>I&#39;m looking for a point where addre=
ss translation (guest virtual address to machine address) occurs in Xen.</d=
iv><div>Of course, I mean when TLB miss has occured.</div><div>I&#39;m usin=
g a PV guest and I&#39;ve found &#39;guest_walk_tables()&#39; function in &=
quot;xen/arch/x86/mm/guest_walk.c&quot;.</div><div>However, in the comment =
of the function, it says &quot;Walk the guest pagetables, after the manner =
of a hardware walker&quot;.</div><div>I&#39;m confused because I&#39;m not =
sure if the function is called after the &#39;hardware page table walker&#3=
9;.</div><div><br></div><div>My question is,</div><div><br></div><div>1. Is=
 it sure that the function will be called even though the HW already transl=
ates the address and populates the TLB entry?<br></div><div><br></div><div>=
2. I&#39;m just asking, is there any code in Xen that is related to the beh=
avior of the &#39;hardware walker&#39;?</div><div><br></div><div>Thanks for=
 your reading.</div><div><br></div><div><br></div></div>

--001a114561d40728ac056af9f63a--


--===============5145412462683802226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5145412462683802226==--
