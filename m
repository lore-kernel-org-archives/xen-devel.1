From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/3] ts-livepatch-run: Print a message
 about expected failures
Date: Wed, 16 Jan 2019 11:36:36 +0000
Message-ID: <20190116113637.10819-2-ian.jackson@eu.citrix.com>
References: <20190116113637.10819-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2owm=PY=citrix.com=prvs=912d934db=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gjjVD-0002jA-1D
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 11:36:59 +0000
In-Reply-To: <20190116113637.10819-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

dGFyZ2V0X2NtZF9vdXRwdXRfcm9vdF9zdGF0dXMgcHJpbnRzIHRoZSBjb21tYW5kIGV4aXQgc3Rh
dHVzLiAgSWYgdGhhdAp3YXMgYSBmYWlsdXJlIGFuZCB0aGUgZmFpbHVyZSB3YXMgYXMgZXhwZWN0
ZWQsIHRoaXMgY2FuIGJlIGNvbmZ1c2luZwp0byByZWFkZXJzIHdobyBkbyBub3Qga25vdyB0aGF0
IHRoaXMgaXMgYSBwb3NzaWJpbGl0eS4gIFNvIHByaW50IGEKbWVzc2FnZSBhYm91dCBpdC4KClNp
Z25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgotLS0KIHRzLWxp
dmVwYXRjaC1ydW4gfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3RzLWxpdmVwYXRjaC1ydW4gYi90cy1saXZlcGF0Y2gtcnVuCmluZGV4IDhmZGI4
MDA0Li5mMDExZTY0ZSAxMDA3NTUKLS0tIGEvdHMtbGl2ZXBhdGNoLXJ1bgorKysgYi90cy1saXZl
cGF0Y2gtcnVuCkBAIC0xNTIsNiArMTUyLDkgQEAgc3ViIGxpdmVwYXRjaF90ZXN0ICgpIHsKICAg
ICAgICAgICAgICAgICBkaWUgIkZBSUxFRCEgT3V0cHV0Q2hlY2s9JHRlc3QtPntPdXRwdXRDaGVj
a30sIGlucHV0PSRvdXRwdXRcbiI7CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KKwlpZiAoJGV4
cGVjdGVkX3JjKSB7CisJICAgIGxvZ20gIi4uLiB0aGF0IGZhaWx1cmUgKCRyYykgd2FzIGFzIHJl
cXVpcmVkOyBhbGwgaXMgd2VsbC4iOworICAgICAgICB9CiAgICB9CiAgICByZXR1cm4gMDsKIH0K
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
