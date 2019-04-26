From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 04/15] arch replumbing: Provide
 $ho->{Arch} and $gho->{Arch}
Date: Fri, 26 Apr 2019 17:39:51 +0100
Message-ID: <20190426164002.22381-5-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ui-00085i-Rb
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:28 +0000
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2l0aCBleGlzdGluZyBmbGlnaHRzIHRoZXNlIGFyZSAkcnthcmNofSBhbmQgR1VFU1RfYXJjaC4K
Tm90aGluZyB1c2VzIHRoZXNlIHlldC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggNmFiNjRkNTYuLjE2
YzE3ZTM3IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3Qv
VGVzdFN1cHBvcnQucG0KQEAgLTExNjQsNiArMTE2NCw3IEBAIHN1YiBzZWxlY3Rob3N0ICgkKSB7
CiAgICAgICAgIE5lc3RpbmdMZXZlbCA9PiAwLAogICAgICAgICBJbmZvID0+IFtdLAogICAgIH07
CisgICAgJGhvLT57QXJjaH0gPSB0YXJnZXRfdmFyKCRobywgJ2FyY2gnKSBvciB3YXJuICJ1bmtu
b3duIGFyY2ggZm9yICRpZGVudCI7CiAgICAgaWYgKGRlZmluZWQgJGpvYikgewogCSRoby0+e1N1
aXRlfSA9IHRhcmdldF92YXIoJGhvLCAic3VpdGUiKSAvLyAkY3tEZWJpYW5TdWl0ZX07CiAJJGhv
LT57RGlWZXJzaW9ufSA9IHRhcmdldF92YXIoJGhvLCAiZGlfdmVyc2lvbiIpCkBAIC0xNzk1LDYg
KzE3OTYsNyBAQCBzdWIgc2VsZWN0Z3Vlc3QgKCQkKSB7CiAJSG9zdCA9PiAkaG8sCiAJU3VpdGUg
PT4gJHJ7IiR7Z259X3N1aXRlIn0sCiAgICAgfTsKKyAgICAkaG8tPntBcmNofSA9IHRhcmdldF92
YXIoJGhvLCAnYXJjaCcpIG9yIHdhcm4gInVua25vd24gYXJjaCBmb3IgJGduIjsKICAgICBmb3Jl
YWNoIG15ICRvcHQgKGd1ZXN0X3Zhcl9jb21tYWxpc3QoJGdobywnb3B0aW9ucycpKSB7CiAgICAg
ICAgICRnaG8tPntPcHRpb25zfXskb3B0fSsrOwogICAgIH0KLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
