From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] xen/gntdev: Fix partial gntdev_mmap()
	cleanup
Date: Tue, 9 Jan 2018 20:22:56 -0500
Message-ID: <e2686907-2715-15e8-4cdf-3165903db3ee@oracle.com>
References: <20180109121022.11467-1-ross.lagerwall@citrix.com>
 <20180109121022.11467-2-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cign=ef=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eZ6hO-0007eW-It
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 03:05:06 +0000
In-Reply-To: <20180109121022.11467-2-ross.lagerwall@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8wOS8yMDE4IDA3OjEwIEFNLCBSb3NzIExhZ2Vyd2FsbCB3cm90ZToKPiBXaGVuIGNs
ZWFuaW5nIHVwIGFmdGVyIGEgcGFydGlhbGx5IHN1Y2Nlc3NmdWwgZ250ZGV2X21tYXAoKSwgdW5t
YXAgdGhlCj4gc3VjY2Vzc2Z1bGx5IG1hcHBlZCBncmFudCBwYWdlcyBvdGhlcndpc2UgWGVuIHdp
bGwga2lsbCB0aGUgZG9tYWluIGlmCj4gaW4gZGVidWcgbW9kZSAoQXR0ZW1wdCB0byBpbXBsaWNp
dGx5IHVubWFwIGEgZ3JhbnRlZCBQVEUpIG9yIExpbnV4IHdpbGwKPiBraWxsIHRoZSBwcm9jZXNz
IGFuZCBlbWl0ICJCVUc6IEJhZCBwYWdlIG1hcCBpbiBwcm9jZXNzIiBpZiBYZW4gaXMgaW4KPiBy
ZWxlYXNlIG1vZGUuCj4gCj4gVGhpcyBpcyBvbmx5IG5lZWRlZCB3aGVuIHVzZV9wdGVtb2QgaXMg
dHJ1ZSBiZWNhdXNlIGdudGRldl9wdXRfbWFwKCkKPiB3aWxsIHVubWFwIGdyYW50IHBhZ2VzIGl0
c2VsZiB3aGVuIHVzZV9wdGVtb2QgaXMgZmFsc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBM
YWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCmFsdGhvdWdoIEkgd29uZGVy
IHdoZXRoZXIgaXQgbWF5IGJlIHBvc3NpYmxlIHRvIGhhdmUgZ250ZGV2X3B1dF9tYXAoKSAKZmln
dXJlIHdoZXRoZXIgdG8gdW5tYXAgdGhlIHBhZ2VzIGlmIHVzZV9wdGVtb2QgaXMgc2V0LgoKPiAt
LS0KPiAgIGRyaXZlcnMveGVuL2dudGRldi5jIHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPiBpbmRleCBkMzM5MWExLi5iZDU2
NjUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRldi5jCj4gKysrIGIvZHJpdmVycy94
ZW4vZ250ZGV2LmMKPiBAQCAtMTA3MSw4ICsxMDcxLDEwIEBAIHN0YXRpYyBpbnQgZ250ZGV2X21t
YXAoc3RydWN0IGZpbGUgKmZsaXAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAgb3V0
X3VubG9ja19wdXQ6Cj4gICAJbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsKPiAgIG91dF9wdXRf
bWFwOgo+IC0JaWYgKHVzZV9wdGVtb2QpCj4gKwlpZiAodXNlX3B0ZW1vZCkgewo+ICAgCQltYXAt
PnZtYSA9IE5VTEw7Cj4gKwkJdW5tYXBfZ3JhbnRfcGFnZXMobWFwLCAwLCBtYXAtPmNvdW50KTsK
PiArCX0KPiAgIAlnbnRkZXZfcHV0X21hcChwcml2LCBtYXApOwo+ICAgCXJldHVybiBlcnI7Cj4g
ICB9Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
