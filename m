From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Mon, 05 Nov 2018 09:56:13 -0700
Message-ID: <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJiAo-0002Ma-U5
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 16:56:22 +0000
In-Reply-To: <20181030154123.4218-6-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDE2OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEJBUiBtYXAvdW5tYXAgaXMgYSBsb25nIHJ1bm5pbmcgb3BlcmF0aW9uIHRoYXQgbmVlZHMgdG8g
YmUgcHJlZW1wdGVkCj4gaW4gb3JkZXIgdG8gYXZvaWQgb3ZlcnJ1bm5pbmcgdGhlIGFzc2lnbmVk
IHZDUFUgdGltZSAob3IgZXZlbgo+IHRyaWdnZXJpbmcgdGhlIHdhdGNoZG9nKS4KPiAKPiBDdXJy
ZW50IGxvZ2ljIGZvciB0aGlzIHByZWVtcHRpb24gaXMgd3JvbmcsIGFuZCB3b24ndCB3b3JrIGF0
IGFsbCBmb3IKPiBBTUQgc2luY2Ugb25seSBJbnRlbCBtYWtlcyB1c2Ugb2YgaHZtX2lvX3BlbmRp
bmcgKGFuZCBldmVuIGluIHRoYXQKPiBjYXNlIHRoZSBjdXJyZW50IGNvZGUgaXMgd3JvbmcpLgoK
SSdtIGhhdmluZyB0cm91YmxlIHVuZGVyc3RhbmRpbmcgdGhpcywgYm90aCBmb3IgdGhlIEFNRCBh
c3BlY3QKKGl0IGlzIG9ubHkgdnZteC5jIHdoaWNoIGhhcyBhIGZ1bmN0aW9uIGNhbGwgbm90IG1p
cnJvcmVkIG9uIHRoZQpBTUQgc2lkZSkgYW5kIGZvciB0aGUgc3VwcG9zZWQgZ2VuZXJhbCBicm9r
ZW5uZXNzLiBXaXRob3V0CnNvbWUgY2xhcmlmaWNhdGlvbiBJIGNhbid0IGp1ZGdlIHdoZXRoZXIg
cmUtaW1wbGVtZW50aW5nIHZpYQp0YXNrbGV0IGlzIGFjdHVhbGx5IHRoZSBiZXN0IGFwcHJvYWNo
LgoKPiArdm9pZCB2cGNpX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdikKPiArewo+ICsgICAgdGFz
a2xldF9pbml0KCZ2LT52cGNpLnRhc2ssIHZwY2lfcHJvY2Vzc19wZW5kaW5nLCAodW5zaWduZWQg
bG9uZyl2KTsKPiAgfQoKU2luY2UgdGhlcmUncyBubyByZXNwZWN0aXZlIGNsZWFudXAgY29kZSBh
ZGRlZCBhZmFpY3MgLSB3aGF0CmlmIHRoZSBkb21haW4gZ2V0cyBjbGVhbmVkIHVwIGJlaGluZCB0
aGUgYmFjayBvZiB0aGUgKGxvbmcKcnVubmluZykgdGFza2xldD8gRG9uJ3QgeW91IHdhbnQgdG8g
YWNxdWlyZSAoYW5kIHRoZW4gcmVsZWFzZSkKYW4gZXh0cmEgZG9tYWluIHJlZmVyZW5jZSBzb21l
d2hlcmU/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
