From: Aishwarya Pant <aishpant@gmail.com>
Subject: [PATCH] xen/blkback: update sysfs interface
	documentation
Date: Tue, 20 Feb 2018 15:23:19 +0530
Message-ID: <20180220095319.GA29360@mordor.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hcwr=fo=gmail.com=aishpant@srs-us1.protection.inumbo.net>)
 id 1eo4c3-00035a-UV
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 09:53:28 +0000
Received: by mail-io0-x241.google.com with SMTP id e7so14301423ioj.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2018 01:53:26 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>
List-Id: xen-devel@lists.xenproject.org

QWRkIGRvY3VtZW50YXRpb24gZm9yIHN0YXRpc3RpYyBhdHRyaWJ1dGUgZHNfcmVxIC0gdGhlIG51
bWJlciBvZgpkaXNjYXJkZWQgcmVxdWVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBBaXNod2FyeWEgUGFu
dCA8YWlzaHBhbnRAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNm
cy1idXMteGVuLWJhY2tlbmQgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtYnVzLXhl
bi1iYWNrZW5kIGIvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy14ZW4tYmFja2Vu
ZAppbmRleCAzZDU5NTFjOGJmNWYuLjIwZWY4MzU3ODVlYyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy14ZW4tYmFja2VuZAorKysgYi9Eb2N1bWVudGF0aW9u
L0FCSS9zdGFibGUvc3lzZnMtYnVzLXhlbi1iYWNrZW5kCkBAIC03MywzICs3MywxMCBAQCBLZXJu
ZWxWZXJzaW9uOgkzLjAKIENvbnRhY3Q6CUtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KIERlc2NyaXB0aW9uOgogICAgICAgICAgICAgICAgIE51bWJlciBvZiBz
ZWN0b3JzIHdyaXR0ZW4gYnkgdGhlIGZyb250ZW5kLgorCitXaGF0OgkJL3N5cy9idXMveGVuLWJh
Y2tlbmQvZGV2aWNlcy92YmQtKi9zdGF0aXN0aWNzL2RzX3JlcQorRGF0ZToJCU9jdG9iZXIgMjAx
MQorS2VybmVsVmVyc2lvbjoJMy4xCitDb250YWN0OglLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+CitEZXNjcmlwdGlvbjoKKyAgICAgICAgICAgICAgICBOdW1i
ZXIgb2YgZGlzY2FyZCByZXF1ZXN0cyBmcm9tIHRoZSBmcm9udGVuZC4KLS0gCjIuMTYuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
