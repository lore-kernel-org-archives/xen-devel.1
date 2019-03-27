From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v4] x86/mm: Clean up
 p2m_finish_type_change return value
Date: Wed, 27 Mar 2019 10:07:09 -0600
Message-ID: <5C9B9FAD0200007800222328@prv1-mh.provo.novell.com>
References: <20190327152107.29288-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9B57-0003R1-Mh
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:07:13 +0000
In-Reply-To: <20190327152107.29288-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE5IGF0IDE2OjIxLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC02MjEsNyArNjIzLDcgQEAgYm9vbF90IGVwdF9oYW5kbGVfbWlzY29uZmlnKHVpbnQ2
NF90IGdwYSkKPiAgCj4gICAgICBwMm1fdW5sb2NrKHAybSk7Cj4gIAo+IC0gICAgcmV0dXJuIHNw
dXJpb3VzID8gKHJjID49IDApIDogKHJjID4gMCk7Cj4gKyAgICByZXR1cm4gc3B1cmlvdXMgJiYg
IXJjOwo+ICB9CgpJIHRoaW5rIHlvdSd2ZSBnb25lIHRvbyBmYXIgbm93OiBUaGlzIGlzIC0gYWZh
aWN0IC0gdGhlIG9uZSBwbGFjZQp3aGVyZSB0aGUgZGlzdGluY3Rpb24gbWF0dGVycy4gTG9va2lu
ZyBiYWNrIGF0IFBhdWwncyByZXBseSBhbmQKbXkgc3Vic2VxdWVudCBvbmUgb24gdjMsIEknbSBh
ZnJhaWQgSSd2ZSBtYW5hZ2VkIHRvIG1pc2d1aWRlCnlvdSBieSBub3QgbG9va2luZyBjbG9zZWx5
IGVub3VnaCBhdCB3aGF0IFBhdWwgZGlkIHNrZXRjaCBvdXQuCkknbSBzb3JyeSBmb3IgdGhpcy4K
CkkgdGhpbmsgeW91IGVpdGhlciB3YW50IHRvIGxlYXZlIEVQVCBjb2RlIHVudG91Y2hlZCwgYW5k
IHphcAp0aGUgcG9zaXRpdmUgcmV0dXJuIHZhbHVlIGluIGZpbmlzaF90eXBlX2NoYW5nZSgpIGlu
c3RlYWQuIE9yCkVQVCdzIHJlc29sdmVfbWlzY29uZmlnKCkgd291bGQgbmVlZCB0byBnYWluIGEg
d3JhcHBlciBmb3IgdXNlCmFzIHRoZSAtPnJlY2FsYyBob29rLCB0byBzcXVhc2ggdGhlIHBvc2l0
aXZlIHZhbHVlIGZvciB0aGUgb3V0c2lkZQp3b3JsZC4gSWlyYyBJJ3ZlIGF2b2lkZWQgaW50cm9k
dWNpbmcgc3VjaCBhIHdyYXBwZXIgb3JpZ2luYWxseQpqdXN0IHRvIGxpbWl0IHRoZSBudW1iZXIg
b2YgZnVuY3Rpb25zIGxheWVyZWQgb24gdG9wIG9mIG9uZQphbm90aGVyLCB3aGlsZSB1c2luZyBy
ZXNvbHZlX21pc2NvbmZpZygpIGRpcmVjdGx5IGFwcGVhcmVkIHRvCmJlIGZpbmUuCgo+IEBAIC02
NjgsNyArNjcwLDcgQEAgZXB0X3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBnZm5f
dCBnZm5fLCBtZm5fdCBtZm4sCj4gIAo+ICAgICAgLyogQ2Fycnkgb3V0IGFueSBldmVudHVhbGx5
IHBlbmRpbmcgZWFybGllciBjaGFuZ2VzIGZpcnN0LiAqLwo+ICAgICAgcmV0ID0gcmVzb2x2ZV9t
aXNjb25maWcocDJtLCBnZm4pOwo+IC0gICAgaWYgKCByZXQgPCAwICkKPiArICAgIGlmICggcmV0
ICkKPiAgICAgICAgICByZXR1cm4gcmV0OwoKVGhpcyB3b3VsZCB0aGVuIG5lZWQgdW5kb2luZyBh
cyB3ZWxsLgoKPiBAQCAtMTIwMSw3ICsxMjAxLDcgQEAgaW50IHAybV9maW5pc2hfdHlwZV9jaGFu
Z2Uoc3RydWN0IGRvbWFpbiAqZCwKPiAgCj4gICAgICByYyA9IGZpbmlzaF90eXBlX2NoYW5nZSho
b3N0cDJtLCBmaXJzdF9nZm4sIG1heF9ucik7Cj4gIAo+IC0gICAgaWYgKCByYyA8IDAgKQo+ICsg
ICAgaWYgKCByYyApCj4gICAgICAgICAgZ290byBvdXQ7CgpXaGlsZSBJIGRvbid0IHJlYWxseSBv
YmplY3QgdG8gdGhpcyBjaGFuZ2UsIEkgYWxzbyBkb24ndCB0aGluayBpdCdzCnN0cmljdGx5IG5l
Y2Vzc2FyeS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
