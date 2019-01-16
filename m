From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/1] xen-blkback: do not wake up shutdown_wq
 after xen_blkif_schedule() is stopped
Date: Wed, 16 Jan 2019 15:52:15 +0100
Message-ID: <20190116145215.igakzdkklc6f7h6k__46343.7887643979$1547650347$gmane$org@mac>
References: <1547646461-29803-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=66eY=PY=citrix.com=prvs=912d4b2fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjmZc-0006VO-Gu
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 14:53:44 +0000
Content-Disposition: inline
In-Reply-To: <1547646461-29803-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, axboe@kernel.dk, linux-kernel@vger.kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDk6NDc6NDFQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gd2FrZSB1cCB4ZW5fYmxraWZfc2NoZWR1bGUoKSBh
cyBrdGhyZWFkX3N0b3AoKSBpcyBhYmxlCj4gdG8gYWxyZWFkeSB3YWtlIHVwIHRoZSBrZXJuZWwg
dGhyZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9y
YWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgfCA0
ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJp
dmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+IGluZGV4IGE0YmM3NGUuLjM3YWM1OWUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ICsrKyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPiBAQCAtMjU0LDEwICsyNTQsOCBA
QCBzdGF0aWMgaW50IHhlbl9ibGtpZl9kaXNjb25uZWN0KHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lm
KQo+ICAJCWlmICghcmluZy0+YWN0aXZlKQo+ICAJCQljb250aW51ZTsKPiAgCj4gLQkJaWYgKHJp
bmctPnhlbmJsa2QpIHsKPiArCQlpZiAocmluZy0+eGVuYmxrZCkKPiAgCQkJa3RocmVhZF9zdG9w
KHJpbmctPnhlbmJsa2QpOwo+IC0JCQl3YWtlX3VwKCZyaW5nLT5zaHV0ZG93bl93cSk7CgpJJ3Zl
IG5vdyByZWFsaXplZCB0aGF0IHNodXRkb3duX3dxIGlzIGJhc2ljYWxseSB1c2VsZXNzLCBhbmQg
c2hvdWxkIGJlCnJlbW92ZWQsIGNvdWxkIHlvdSBwbGVhc2UgZG8gaXQgaW4gdGhpcyBwYXRjaD8K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
