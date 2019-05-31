From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
Date: Fri, 31 May 2019 11:03:00 +0100
Message-ID: <c77d9ace-20bb-94a4-b566-57a290b9b293@arm.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWeNN-0006zm-E9
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:03:05 +0000
In-Reply-To: <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKVGhlIEFybSBjb2RlIGxvb2tzIGdvb2QgdG8gbWUuIEkgaGF2ZSBmZXcgY29tbWVu
dHMgcmVnYXJkaW5nIHRoZSBjb21tb24gCmNoYW5nZXMuCgpPbiA1LzMxLzE5IDEwOjM1IEFNLCBK
YW4gQmV1bGljaCB3cm90ZToKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysrIGIveGVu
L2NvbW1vbi9kb21haW4uYwo+IEBAIC03MSw2ICs3MSwxMSBAQCBkb21pZF90IGhhcmR3YXJlX2Rv
bWlkIF9fcmVhZF9tb3N0bHk7Cj4gICBpbnRlZ2VyX3BhcmFtKCJoYXJkd2FyZV9kb20iLCBoYXJk
d2FyZV9kb21pZCk7Cj4gICAjZW5kaWYKPiAgIAo+ICsvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3Rz
IGZvciBET01JRF9YRU4sIERPTUlEX0lPLCBldGMuICovCj4gK3N0cnVjdCBkb21haW4gKl9fcmVh
ZF9tb3N0bHkgZG9tX3hlbjsKPiArc3RydWN0IGRvbWFpbiAqX19yZWFkX21vc3RseSBkb21faW87
Cj4gK3N0cnVjdCBkb21haW4gKl9fcmVhZF9tb3N0bHkgZG9tX2NvdzsKClRoZSBfX3JlYWRfbW9z
dGx5IG1ha2VzIHNlbnNlIGhlcmUsIGhvd2V2ZXIgcGxlYXNlIG1lbnRpb24gaXQgaW4gdGhlIApj
b21taXQgbWVzc2FnZS4KClsuLi5dCgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+IEBAIC01OTUsOCArNTk1LDYgQEAgdW5z
aWduZWQgaW50IGRvbWFpbl9jbGFtcF9hbGxvY19iaXRzaXplKAo+ICAgCj4gICB1bnNpZ25lZCBs
b25nIGRvbWFpbl9nZXRfbWF4aW11bV9ncGZuKHN0cnVjdCBkb21haW4gKmQpOwo+ICAgCj4gLWV4
dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9tX2lvLCAqZG9tX2NvdzsJLyogZm9yIHZt
Y29yZWluZm8gKi8KPiAtCj4gICAvKiBEZWZpbml0aW9uIG9mIGFuIG1tIGxvY2s6IHNwaW5sb2Nr
IHdpdGggZXh0cmEgZmllbGRzIGZvciBkZWJ1Z2dpbmcgKi8KPiAgIHR5cGVkZWYgc3RydWN0IG1t
X2xvY2sgewo+ICAgICAgIHNwaW5sb2NrX3QgICAgICAgICBsb2NrOwo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9kb21haW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaAo+IEBAIC01
LDYgKzUsNyBAQAo+ICAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ICAgCj4gICAjaW5jbHVkZSA8
cHVibGljL3hlbi5oPgo+ICsKCldpdGhvdXQgYW4gZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLCB0aGlzIGxvb2tzIGxpa2UgYSBzcHVyaW91cyAKY2hhbmdlLgoKPiAgICNpbmNsdWRl
IDxhc20vZG9tYWluLmg+Cj4gICAjaW5jbHVkZSA8YXNtL251bWEuaD4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
