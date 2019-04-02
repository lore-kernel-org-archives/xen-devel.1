From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/4] More python fixes
Date: Tue, 2 Apr 2019 09:18:33 +0100
Message-ID: <20190402081833.GU14641@zion.uk.xensource.com>
References: <20190401103238.15649-1-wei.liu2@citrix.com>
 <alpine.LFD.2.21.1904012117030.3030@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6BbX=SE=citrix.com=prvs=988f77682=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hBEd6-00058q-Hn
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 08:18:48 +0000
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1904012117030.3030@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDg6MzY6NDRQTSArMDAwMCwgWU9VTkcsIE1JQ0hBRUwg
QS4gd3JvdGU6Cj4gT24gTW9uLCAxIEFwciAyMDE5LCBXZWkgTGl1IHdyb3RlOgo+IAo+ID4gV2Vp
IExpdSAoNCk6Cj4gPiAgcHlncnViOiBmaXggbWVzc2FnZSBpbiBncnViIHBhcnNlcgo+ID4gIHB5
Z3J1Yi9ncnViOiBhbHdheXMgdXNlIGludGVnZXIgZm9yIGRlZmF1bHQgZW50cnkKPiA+ICBweWdy
dWI6IGRlY29kZSBzdHJpbmcgaW4gUHl0aG9uIDMKPiA+ICB0b29scy9vY2FtbDogbWFrZSBweXRo
b24gc2NyaXB0cyAyIGFuZCAzIGNvbXBhdGlibGUKPiA+Cj4gPiB0b29scy9vY2FtbC9saWJzL3hl
bnRvb2xsb2cvZ2VubGV2ZWxzLnB5IHwgIDUgKysrKy0KPiA+IHRvb2xzL29jYW1sL2xpYnMveGwv
Z2Vud3JhcC5weSAgICAgICAgICAgfCAxNyArKysrKysrKysrLS0tLS0tLQo+ID4gdG9vbHMvcHln
cnViL3NyYy9HcnViQ29uZi5weSAgICAgICAgICAgICB8ICA4ICsrKysrKy0tCj4gPiB0b29scy9w
eWdydWIvc3JjL3B5Z3J1YiAgICAgICAgICAgICAgICAgIHwgIDUgKysrKy0KPiA+IDQgZmlsZXMg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gVGhlcmUgaXMg
YSBiaXQgbWlzc2luZyBjb21wYXJlZCB0byBteSBvcmlnaW5hbCBwYXRjaCB3aGljaCBpcyB0byBj
b252ZXJ0IAo+IHRoZSBzdHJpbmcgYmFjayB0byBieXRlcyBmb3IgdGhlIGZpbmFsIHdyaXRlIG91
dCBhbmQgYXZvaWQgdGhlIGVycm9yCj4gCj4gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOgo+ICAgIEZpbGUgIi90bXAveGVuY29kZS91c3IvbGliZXhlYy94ZW4vYmluL3B5Z3J1YiIs
IGxpbmUgOTY3LCBpbiA8bW9kdWxlPgo+ICAgICAgb3Mud3JpdGUoZmQsIG9zdHJpbmcpCj4gVHlw
ZUVycm9yOiBhIGJ5dGVzLWxpa2Ugb2JqZWN0IGlzIHJlcXVpcmVkLCBub3QgJ3N0cicKPiAKPiBU
aGUgYXR0YWNoZWQgcGF0Y2ggd29ya3MgZm9yIG1lIGluIGEgcXVpY2sgdGVzdCBvbiBweXRob24z
IHRob3VnaCBJIAo+IGhhdmVuJ3QgdGVzdGVkIGl0IG9uIHB5dGhvbjIgeWV0Lgo+IAo+ICAJTWlj
aGFlbCBZb3VuZwoKPiAtLS0geGVuLTQuMTIuMC90b29scy9weWdydWIvc3JjL3B5Z3J1Yi5vcmln
CTIwMTktMDQtMDEgMjE6MjU6MzMuMjA2NDA1OTk1ICswMTAwCj4gKysrIHhlbi00LjEyLjAvdG9v
bHMvcHlncnViL3NyYy9weWdydWIJMjAxOS0wNC0wMSAyMToyNzozNi4xNzk5MjkxMDUgKzAxMDAK
PiBAQCAtOTYzLDUgKzk2Myw4IEBACj4gICAgICAgICAgb3N0cmluZyA9IGZvcm1hdF9zaW1wbGUo
Ym9vdGNmZ1sia2VybmVsIl0sIGJvb3RjZmdbInJhbWRpc2siXSwgYXJncywgIlwwIikKPiAgCj4g
ICAgICBzeXMuc3Rkb3V0LmZsdXNoKCkKPiAtICAgIG9zLndyaXRlKGZkLCBvc3RyaW5nKQo+ICsg
ICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8IDM6Cj4gKyAgICAgICAgb3Mud3JpdGUoZmQsIG9z
dHJpbmcpCj4gKyAgICBlbHNlOgo+ICsgICAgICAgIG9zLndyaXRlKGZkLCBvc3RyaW5nLmVuY29k
ZSgpKQo+ICAgICAgCgoKVGhpcyBzaG91bGQgd29yay4gSSB3aWxsIGZvbGQgdGhpcyBpbiB0byB0
aGUgcHlncnViIHBhdGNoLgoKVGhhbmtzIGZvciBzcG90dGluZyBteSBtaXN0YWtlLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
