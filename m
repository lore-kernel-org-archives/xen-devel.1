From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] xen/domain: Block more speculative
 out-of-bound accesses
Date: Wed, 24 Apr 2019 19:10:57 +0100
Message-ID: <1556129458-11418-2-git-send-email-andrew.cooper3@citrix.com>
References: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPtL=S2=citrix.com=prvs=0106169aa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJMMz-00064m-LA
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:11:45 +0000
In-Reply-To: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Yy9zIGY4MzAzNDU4IHJlc3RyaWN0ZWQgc3BlY3VsYXRpdmUgYWNjZXNzIGZvciBkb192Y3B1X29w
KCksIGJ1dCBuZWdsZWN0ZWQgaXRzCmNvbXBhdCBjb3VudGVycGFydCwgd2hpY2ggaXMgcmVhY2hh
YmxlIGJ5IGd1ZXN0cyB1c2luZyB0aGUgMzJiaXQgQUJJLgoKTWFrZSBhbiBpZGVudGljYWwgYWRq
dXN0bWVudC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IE5vcmJlcnQg
TWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgotLS0KIHhlbi9jb21tb24vY29tcGF0L2RvbWFp
bi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jb21wYXQvZG9tYWluLmMgYi94ZW4vY29tbW9uL2Nv
bXBhdC9kb21haW4uYwppbmRleCA4OGJmZGM4Li4zOTg3N2IzIDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL2NvbXBhdC9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2NvbXBhdC9kb21haW4uYwpAQCAt
MzksNyArMzksNyBAQCBpbnQgY29tcGF0X3ZjcHVfb3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZj
cHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcgogICAgIHN0cnVjdCB2Y3B1ICp2
OwogICAgIGludCByYyA9IDA7CiAKLSAgICBpZiAoIHZjcHVpZCA+PSBkLT5tYXhfdmNwdXMgfHwg
KHYgPSBkLT52Y3B1W3ZjcHVpZF0pID09IE5VTEwgKQorICAgIGlmICggKHYgPSBkb21haW5fdmNw
dShkLCB2Y3B1aWQpKSA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CiAKICAgICBz
d2l0Y2ggKCBjbWQgKQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
