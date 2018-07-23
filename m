From: sepanta s <sapanta992@gmail.com>
Subject: An issue in sharing the pages again in xen-memshare
Date: Mon, 23 Jul 2018 07:07:27 +0430
Message-ID: <CABaiLQ959qf8fDZSV5-G1utG3mZUB2WMmw+HaMjfXC0PXtkzhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6361325670804138342=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <Xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6361325670804138342==
Content-Type: multipart/alternative; boundary="0000000000002505d50571a54d12"

--0000000000002505d50571a54d12
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have written a program that can share memory pages of two VMs every x
milliseconds. To do so, I modified xen and added an unshare event to be
able to capture it. However,  for some pages, when I receive the unshare
event that contains the information about the pages which was about to be
written on and put it on a buffer for sharing them again after x
milliseconds, I cannot nominate them again and an error occurs. So, the
sharing mechanism I have built can partially share pages. I guess the
problem might be because of internal structure of sharing mechanism in the
Xen but can't figure out the problem.
Do you  have any idea what can cause this problem? Or what should I check
to get closer to any solution?


Thanks,
Sepanta

--0000000000002505d50571a54d12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all, <br></div><div><br></div><div>I have written =
a program that can share memory pages of two VMs every x milliseconds. To d=
o so, I modified xen and added an unshare event to be able to capture it. H=
owever,=C2=A0
for some pages, when I receive the unshare event that contains the informat=
ion about the pages which was about to be written on and put it on a buffer=
 for sharing them again after x milliseconds, I cannot nominate them again =
and an error occurs. So, the sharing mechanism I have built can partially s=
hare pages. I guess the problem might be because of internal structure of s=
haring mechanism in the Xen but can&#39;t figure out the problem. <br></div=
><div>Do you=C2=A0 have any idea what can cause this problem? Or what shoul=
d I check to get closer to any solution? <br></div><div><br></div><div><br>=
</div><div>Thanks,</div><div>Sepanta<br></div></div>

--0000000000002505d50571a54d12--


--===============6361325670804138342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6361325670804138342==--
