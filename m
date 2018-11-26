From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] pvcalls-front: fixes incorrect error
 handling
Date: Mon, 26 Nov 2018 15:31:39 -0500
Message-ID: <1f765e81-ed89-d110-74b1-cc8029a4555f__40599.3609376766$1543264244$gmane$org@oracle.com>
References: <1542852432-30019-1-git-send-email-bianpan2016@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vusb=of=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gRNXz-0002T1-RX
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 20:31:59 +0000
In-Reply-To: <1542852432-30019-1-git-send-email-bianpan2016@163.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pan Bian <bianpan2016@163.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggOTowNyBQTSwgUGFuIEJpYW4gd3JvdGU6Cj4ga2ZyZWUoKSBpcyBpbmNvcnJl
Y3RseSB1c2VkIHRvIHJlbGVhc2UgdGhlIHBhZ2VzIGFsbG9jYXRlZCBieQo+IF9fZ2V0X2ZyZWVf
cGFnZSgpIGFuZCBfX2dldF9mcmVlX3BhZ2VzKCkuIFVzZSB0aGUgbWF0Y2hpbmcgZGVhbGxvY2F0
b3JzCj4gaS5lLiwgZnJlZV9wYWdlKCkgYW5kIGZyZWVfcGFnZXMoKSwgcmVzcGVjdGl2ZWx5Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogUGFuIEJpYW4gPGJpYW5wYW4yMDE2QDE2My5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwo+IGluZGV4
IDJmMTFjYTcuLjc3MjI0ZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9u
dC5jCj4gKysrIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCj4gQEAgLTM4NSw4ICszODUs
OCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9hY3RpdmUoc3RydWN0IHNvY2tfbWFwcGluZyAqbWFwLCBp
bnQgKmV2dGNobikKPiAgb3V0X2Vycm9yOgo+ICAJaWYgKCpldnRjaG4gPj0gMCkKPiAgCQl4ZW5i
dXNfZnJlZV9ldnRjaG4ocHZjYWxsc19mcm9udF9kZXYsICpldnRjaG4pOwo+IC0Ja2ZyZWUobWFw
LT5hY3RpdmUuZGF0YS5pbik7Cj4gLQlrZnJlZShtYXAtPmFjdGl2ZS5yaW5nKTsKPiArCWZyZWVf
cGFnZXMoKHVuc2lnbmVkIGxvbmcpbWFwLT5hY3RpdmUuZGF0YS5pbiwgUFZDQUxMU19SSU5HX09S
REVSKTsKCklzIG1hcC0+YWN0aXZlLmRhdGEuaW4gZ3VhcmFudGVlZCB0byBiZSBOVUxMIHdoZW4g
ZW50ZXJpbmcgdGhpcyByb3V0aW5lPwoKLWJvcmlzCgo+ICsJZnJlZV9wYWdlKCh1bnNpZ25lZCBs
b25nKW1hcC0+YWN0aXZlLnJpbmcpOwo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
