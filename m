From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 4/5] tools: xenpm: continue to support
 {set, get}-vcpu-migration-delay
Date: Wed, 28 Feb 2018 15:02:00 +0000
Message-ID: <1bcdf046-581e-d055-c954-80ddcb45451f@citrix.com>
References: <151940399656.10991.13321858263862527366.stgit@Palanthas.fritz.box>
 <151940411577.10991.534361130254778056.stgit@Palanthas.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6du4=fw=citrix.com=prvs=5908710b3=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1er3GB-0007NG-Oe
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 15:03:11 +0000
In-Reply-To: <151940411577.10991.534361130254778056.stgit@Palanthas.fritz.box>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwNDo0MSBQTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gTm93IHRoYXQg
aXQgaXMgcG9zc2libGUgdG8gZ2V0IGFuZCBzZXQgdGhlIG1pZ3JhdGlvbgo+IGRlbGF5IHZpYSB0
aGUgU0NIRURPUCBzeXNjdGwsIHVzZSB0aGF0IGluIHhlbnBtLCBpbnN0ZWFkCj4gb2YgdGhlIHNw
ZWNpYWwgcHVycG9zZSBsaWJ4YyBpbnRlcmZhY2UgKHdoaWNoIHdpbGwgYmUKPiByZW1vdmVkIGlu
IGEgZm9sbG93aW5nIGNvbW1pdCkuCj4gCj4gVGhlIHN5c2N0bCwgaG93ZXZlciwgcmVxdWlyZXMg
YSBjcHVwb29sLWlkIGFyZ3VtZW50LAo+IGZvciBrbm93aW5nIG9uIHdoaWNoIHNjaGVkdWxlciBp
dCBpcyBvcGVyYXRpbmcgb24uIEluCj4gdGhpcyBjYXNlLCBzaW5jZSB3ZSBkb24ndCB3YW50IHRv
IGFsdGVyIHhlbnBtJ3MgY29tbWFuZAo+IGxpbmUgaW50ZXJmYWNlLCB3ZSBhbHdheXMgdXNlICcw
Jywgd2hpY2ggbWVhbnMgeGVucG0KPiB3aWxsIGFsd2F5cyBhY3Qgb24gdGhlIGRlZmF1bHQgY3B1
cG9vbCAoJ1Bvb2wtMCcpLgo+IAo+PkZyb20gdGhpcyBjb21taXQgb24sIGB4ZW5wbSB7c2V0LGdl
dH0tdmNwdS1taWdyYXRpb24tZGVsYXknCj4gY29tbWFuZHMgd29yayBhZ2Fpbi4gQnV0IHRoYXQg
aXMgb25seSBmb3IgdGhlIHNha2Ugb2YKPiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCBhbmQgdGhl
aXIgdXNlIGlzIGRlcHJlY2F0ZWQsIGluCj4gZmF2b3VyIG9mICd4bCBzY2hlZC1jcmVkaXQgLXMg
Wy1jIDxwb29saWQ+XSAtbSA8ZGVsYXk+Jy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdn
aW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKSWYgd2UgY2FyZWQgYWJvdXQgc3RyaWN0IGJlaGF2aW9yYWwgY29tcGF0aWJp
bGl0eSwgd2Ugd291bGQgbW9kaWZ5IHRoZQp4ZW5wbSBmdW5jdGlvbiB0byBzZXQgdGhlIG1pZ3Jh
dGlvbiBkZWxheSBmb3IgYWxsIGNwdXBvb2xzOyBidXQgSSB0aGluawp3ZSBjYW4gd29ycnkgYWJv
dXQgdGhhdCBpZiBhbnlvbmUgY29tcGxhaW5zLiA6LSkKCk9uZSBjb21tZW50Li4uCgo+IEBAIC0x
MDg3LDEzICsxMDk3LDE3IEBAIHZvaWQgc2V0X3ZjcHVfbWlncmF0aW9uX2RlbGF5X2Z1bmMoaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgCj4gIHZvaWQgZ2V0X3ZjcHVfbWlncmF0aW9uX2RlbGF5
X2Z1bmMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgewo+IC0gICAgdWludDMyX3QgdmFsdWU7
Cj4gKyAgICBzdHJ1Y3QgeGVuX3N5c2N0bF9jcmVkaXRfc2NoZWR1bGUgc3BhcmFtOwo+ICsKPiAr
ICAgIHByaW50ZigiV0FSTklORzogdXNpbmcgeGVucG0gZm9yIHRoaXMgcHVycG9zZSBpcyBkZXBy
ZWNhdGVkLiIKPiArICAgICAgICAgICAiIENoZWNrIG91dCBgeGwgc2NoZWQtY3JlZGl0IC1zJ1xu
Iik7CgpTaG91bGQgdGhlc2Ugd2FybmluZ3MgYmUgdG8gc3RkZXJyIHJhdGhlciB0aGFuIHN0ZG91
dCwgc28gdGhhdCBpZgphbnl0aGluZyBpcyBtYW51YWxseSBwYXJzaW5nIHN0b3V0IGl0IHdpbGwg
Y29udGludWUgdG8gd29yaz8KCkV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBnb29kLCB0aGFua3MuCgog
LUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
