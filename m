From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 03 Sep 2018 07:27:22 -0600
Message-ID: <5B8D36BA02000078001E49FC@prv1-mh.provo.novell.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ymad=lr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fwot7-0000LW-7Q
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 13:27:29 +0000
In-Reply-To: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDEwOjI1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gV2hlbiBhbiBuZXcgYWx0cDJtIHZpZXcgaXMgY3JlYXRlZCB2ZXJ5IGVhcmx5IG9uIGd1
ZXN0IGJvb3QsIHRoZQo+IGRpc3BsYXkgd2lsbCBmcmVlemUgKGFsdGhvdWdoIHRoZSBndWVzdCB3
aWxsIHJ1biBub3JtYWxseSkuIFRoaXMKPiBtYXkgYWxzbyBoYXBwZW4gb24gcmVzaXppbmcgdGhl
IGRpc3BsYXkuIFRoZSByZWFzb24gaXMgdGhlIHdheQo+IFhlbiBjdXJyZW50bHkgKG1pcyloYW5k
bGVzIGxvZ2RpcnR5IFZHQTogaXQgaW50ZW50aW9uYWxseQo+IG1pc2NvbmZpZ3VyZXMgVkdBIHBh
Z2VzIHNvIHRoYXQgdGhleSB3aWxsIGZhdWx0Lgo+IAo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQg
b25seSBkb2VzIHRoaXMgaW4gdGhlIGhvc3QgcDJtLiBPbmNlIHdlCj4gc3dpdGNoIHRvIGEgbmV3
IGFsdHAybSwgdGhlIG1pc2NvbmZpZ3VyZWQgZW50cmllcyB3aWxsIG5vIGxvbmdlcgo+IGZhdWx0
LCBzbyB0aGUgZGlzcGxheSB3aWxsIG5vdCBiZSB1cGRhdGVkLgo+IAo+IFRoaXMgcGF0Y2g6Cj4g
Cj4gKiB1cGRhdGVzIGVwdF9oYW5kbGVfbWlzY29uZmlnKCkgdG8gdXNlIHRoZSBhY3RpdmUgYWx0
cDJtIGluc3RlYWQKPiAgIG9mIHRoZSBob3N0cDJtOwoKV291bGRuJ3QgeW91LCBhcyBhIHByZXJl
cSB0byB0aGlzLCBmaXJzdCBuZWVkIHRvIG1ha2Ugc3VyZSBnbG9iYWwKY2hhbmdlcyBsZWFkaW5n
IHRvIEVQVCBtaXNjb25maWcgZXhpdHMgZ2V0IG1pcnJvcmVkIHRvIGFsbCBhbHRwMm0tcz8KVGhl
IHByaW1lIGV4YW1wbGUgaXMgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoKSwgd2hpY2ggb25seQph
Y3RzIG9uIHRoZSBob3N0cDJtIGFzIHdlbGwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
