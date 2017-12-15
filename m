From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PULL 5/6] xenfb: activate input handlers for raw
	pointer devices
Date: Thu, 14 Dec 2017 16:28:02 -0800
Message-ID: <1513297683-14295-5-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1712141612170.3857@sstabellini-ThinkPad-X260>
 <1513297683-14295-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=itxh=dl=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ePdvO-00075l-LY
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 00:32:26 +0000
In-Reply-To: <1513297683-14295-1-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: peter.maydell@linaro.org, stefanha@gmail.com
Cc: sstabellini@kernel.org, Owen Smith <owen.smith@citrix.com>, qemu-devel@nongnu.org, stefanha@redhat.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT3dlbiBTbWl0aCA8b3dlbi5zbWl0aEBjaXRyaXguY29tPgoKSWYgdGhlIGZyb250ZW5k
IHJlcXVlc3RzIHJhdyBwb2ludGVycywgdGhlIGlucHV0IGhhbmRsZXJzIG11c3QgYmUKYWN0aXZh
dGVkIHRvIGhhdmUgdGhlIGlucHV0IGV2ZW50cyBkZWxpdmVyZWQgdG8gdGhlIHhlbmZiIGJhY2tl
bmQuCldpdGhvdXQgYWN0aXZhdGlvbiwgdGhlIGlucHV0IGV2ZW50cyBhcmUgZGVsaXZlcmVkIHRv
IGhhbmRsZXJzCnJlZ2lzdGVyZWQgZWFybGllciwgd2hpY2ggd291bGQgYmUgdGhlIGVtdWxhdGVk
IFVTQiB0YWJsZXQgb3IKZW11bGF0ZWQgUFMvMiBtb3VzZS4KSFZNIHhlbl9rYmRmcm9udCBjYW4g
aW5jb3JyZWN0bHkgc2NhbGUgYWJzb2x1dGUgY29vcmRpbmF0ZXMgd2hlbgp0aGUgZGlzcGxheSBy
ZXNvbHV0aW9uIGlzIG5vdCA4MDB4NjAwLgoKU2lnbmVkLW9mZi1ieTogT3dlbiBTbWl0aCA8b3dl
bi5zbWl0aEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KLS0tCiBody9kaXNwbGF5L3hlbmZiLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaHcvZGlzcGxheS94ZW5mYi5jIGIv
aHcvZGlzcGxheS94ZW5mYi5jCmluZGV4IDc3NmEyY2UuLmQ0ZmMwZmEgMTAwNjQ0Ci0tLSBhL2h3
L2Rpc3BsYXkveGVuZmIuYworKysgYi9ody9kaXNwbGF5L3hlbmZiLmMKQEAgLTM4Nyw2ICszODcs
MTEgQEAgc3RhdGljIHZvaWQgaW5wdXRfY29ubmVjdGVkKHN0cnVjdCBYZW5EZXZpY2UgKnhlbmRl
dikKICAgICBpbi0+cWtiZCA9IHFlbXVfaW5wdXRfaGFuZGxlcl9yZWdpc3RlcigoRGV2aWNlU3Rh
dGUgKilpbiwgJnhlbmZiX2tleWJvYXJkKTsKICAgICBpbi0+cW1vdSA9IHFlbXVfaW5wdXRfaGFu
ZGxlcl9yZWdpc3RlcigoRGV2aWNlU3RhdGUgKilpbiwKICAgICAgICAgICAgICAgIGluLT5hYnNf
cG9pbnRlcl93YW50ZWQgPyAmeGVuZmJfYWJzX21vdXNlIDogJnhlbmZiX3JlbF9tb3VzZSk7CisK
KyAgICBpZiAoaW4tPnJhd19wb2ludGVyX3dhbnRlZCkgeworICAgICAgICBxZW11X2lucHV0X2hh
bmRsZXJfYWN0aXZhdGUoaW4tPnFrYmQpOworICAgICAgICBxZW11X2lucHV0X2hhbmRsZXJfYWN0
aXZhdGUoaW4tPnFtb3UpOworICAgIH0KIH0KIAogc3RhdGljIHZvaWQgaW5wdXRfZGlzY29ubmVj
dChzdHJ1Y3QgWGVuRGV2aWNlICp4ZW5kZXYpCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
