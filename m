From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 1/3] dataplane/xen-block: remove dead code
Date: Fri, 15 Feb 2019 16:25:31 +0000
Message-ID: <20190215162533.19475-2-paul.durrant@citrix.com>
References: <20190215162533.19475-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skQ2=QW=citrix.com=prvs=9420f6528=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gugJL-0006Rp-6d
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 16:25:59 +0000
In-Reply-To: <20190215162533.19475-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, xen-devel@lists.xenproject.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGlmKCkgc3RhdGVtZW50IGlzIGNsZWFybHkgYm9ndXMgKGRlYWQgY29kZSB3aGljaCBzaG91
bGQgaGF2ZSBiZWVuCmNsZWFuZWQgdXAgd2hlbiBncmFudCBtYXBwaW5nIHdhcyByZW1vdmVkKS4K
ClNwb3R0ZWQgYnkgQ292ZXJpdHk6IENJRCAxMzk4NjM1CgpXaGlsZSBpbiB0aGUgbmVpZ2hib3Vy
aG9vZCwgYWRkIGEgbWlzc2luZyAnZmFsbCB0aHJvdWdoJyBhbm5vdGF0aW9uLgoKUmVwb3J0ZWQt
Ynk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBTdGVmYW4g
SGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KQ2M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+CkNjOiBNYXggUmVp
dHogPG1yZWl0ekByZWRoYXQuY29tPgotLS0KIGh3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2su
YyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9ody9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmMgYi9ody9ibG9j
ay9kYXRhcGxhbmUveGVuLWJsb2NrLmMKaW5kZXggYzZhMTVkYTAyNC4uZjE1MjNjNWI0NSAxMDA2
NDQKLS0tIGEvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jCisrKyBiL2h3L2Jsb2NrL2Rh
dGFwbGFuZS94ZW4tYmxvY2suYwpAQCAtMjgxLDEwICsyODEsNiBAQCBzdGF0aWMgdm9pZCB4ZW5f
YmxvY2tfY29tcGxldGVfYWlvKHZvaWQgKm9wYXF1ZSwgaW50IHJldCkKICAgICAgICAgYnJlYWs7
CiAgICAgY2FzZSBCTEtJRl9PUF9XUklURToKICAgICBjYXNlIEJMS0lGX09QX0ZMVVNIX0RJU0tD
QUNIRToKLSAgICAgICAgaWYgKCFyZXF1ZXN0LT5yZXEubnJfc2VnbWVudHMpIHsKLSAgICAgICAg
ICAgIGJyZWFrOwotICAgICAgICB9Ci0gICAgICAgIGJyZWFrOwogICAgIGRlZmF1bHQ6CiAgICAg
ICAgIGJyZWFrOwogICAgIH0KQEAgLTI5OCw2ICsyOTQsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxv
Y2tfY29tcGxldGVfYWlvKHZvaWQgKm9wYXF1ZSwgaW50IHJldCkKICAgICAgICAgaWYgKCFyZXF1
ZXN0LT5yZXEubnJfc2VnbWVudHMpIHsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICB9Cisg
ICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwogICAgIGNhc2UgQkxLSUZfT1BfUkVBRDoKICAgICAg
ICAgaWYgKHJlcXVlc3QtPnN0YXR1cyA9PSBCTEtJRl9SU1BfT0tBWSkgewogICAgICAgICAgICAg
YmxvY2tfYWNjdF9kb25lKGJsa19nZXRfc3RhdHMoZGF0YXBsYW5lLT5ibGspLCAmcmVxdWVzdC0+
YWNjdCk7Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
