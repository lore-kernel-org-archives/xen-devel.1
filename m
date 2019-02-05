From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH svm] svm: fix p2mt type
Date: Tue, 5 Feb 2019 09:29:35 +0000
Message-ID: <0c4bc88a-7734-ad25-759d-9924a9d6fb83@citrix.com>
References: <1549355393-7820-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/kp=QM=citrix.com=prvs=93293e290=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gqx2z-0001wS-Ki
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 09:29:41 +0000
In-Reply-To: <1549355393-7820-1-git-send-email-nmanthey@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <jbeulich@suse.com>, Michael Tautschnig <tautschn@amazon.co.uk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOSAwODoyOSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IEEgcG9pbnRlciBt
aXNtYXRjaCBoYXMgYmVlbiByZXBvcnRlZCB3aGVuIGNvbXBpbGluZyB3aXRoIHRoZQo+IGNvbXBp
bGVyIGdvdG8tZ2NjIG9mIHRoZSBib3VuZGVkIG1vZGVsIGNoZWNrZXIgQ0JNQy4KPgo+IEZpeGVz
OiA5YTc3OWU0ZiAoSW1wbGVtZW50IFNWTSBzcGVjaWZpYyBwYXJ0IGZvciBOZXN0ZWQgVmlydHVh
bGl6YXRpb24pCj4KPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFt
YXpvbi5kZT4KPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9z
dm0uYwo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS9zdm0vc3ZtLmMKPiBAQCAtMTc5NCw3ICsxNzk0LDcgQEAgc3RhdGljIHZvaWQgc3Zt
X2RvX25lc3RlZF9wZ2ZhdWx0KHN0cnVjdCB2Y3B1ICp2LAo+ICAgICAgICAgICAgICB1aW50NjRf
dCBncGE7Cj4gICAgICAgICAgICAgIHVpbnQ2NF90IG1mbjsKPiAgICAgICAgICAgICAgdWludDMy
X3QgcXVhbGlmaWNhdGlvbjsKPiAtICAgICAgICAgICAgdWludDMyX3QgcDJtdDsKPiArICAgICAg
ICAgICAgcDJtX3R5cGVfdCBwMm10OwoKWW91IGNhbid0IGNoYW5nZSB0aGlzIHR5cGUsIGZvciB0
aGUgc2FtZSByZWFzb24gdGhhdCB0aGUgY29tcGlsZXIKY29tcGxhaW5lZC7CoCBlbnVtIGhhcyBh
biBpbXBsZW1lbnRhdGlvbiBkZWZpbmVkIHdpZHRoIHdoaWNoIG1heSBub3QgYmUKNCwgYW5kIHRo
aXMgd291bGQgYnJlYWsgdGhlIHRyYWNlIHJlY29yZC4KClRoZSBiZXN0IGNvdXJzZSBvZiBhY3Rp
b24gaXMgdG8gcGFzcyB0aGUgZXhpc3RpbmcgJnAybXQgaW50byB0aGUgbG9va3VwLAphbmQgYXNz
aWduIGJhY2sgdG8gX2QucDJtdCBhbG9uZ3NpZGUgdGhlIG1mbi7CoCBBIGRlY2VudCBvcHRpbWlz
aW5nCmNvbXBpbGVyIHdpbGwgYmUgYWJsZSB0byBzaW1wbGlmeSB0aGlzIHdoZW4gZW51bSogYW5k
IHVpbnQzMl90KiBhcmUKY29uc2lkZXJlZCB0byBiZSBjb21wYXRpYmxlLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
