From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC QEMU PATCH v4 00/10] Implement vNVDIMM for Xen
	HVM guest
Date: Tue, 27 Feb 2018 17:22:23 +0000
Message-ID: <20180227172223.GD1799@perard.uk.xensource.com>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20171207101812.23602-1-haozhong.zhang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0sft=fv=citrix.com=prvs=5899da973=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1eqixT-0000jM-C4
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 17:22:31 +0000
Content-Disposition: inline
In-Reply-To: <20171207101812.23602-1-haozhong.zhang@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haozhong Zhang <haozhong.zhang@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Chao Peng <chao.p.peng@linux.intel.com>, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDcsIDIwMTcgYXQgMDY6MTg6MDJQTSArMDgwMCwgSGFvemhvbmcgWmhhbmcg
d3JvdGU6Cj4gVGhpcyBpcyB0aGUgUUVNVSBwYXJ0IHBhdGNoZXMgdGhhdCB3b3JrcyB3aXRoIHRo
ZSBhc3NvY2lhdGVkIFhlbgo+IHBhdGNoZXMgdG8gZW5hYmxlIHZOVkRJTU0gc3VwcG9ydCBmb3Ig
WGVuIEhWTSBkb21haW5zLiBYZW4gcmVsaWVzIG9uCj4gUUVNVSB0byBidWlsZCBndWVzdCBORklU
IGFuZCBOVkRJTU0gbmFtZXNwYWNlIGRldmljZXMsIGFuZCBhbGxvY2F0ZQo+IGd1ZXN0IGFkZHJl
c3Mgc3BhY2UgZm9yIHZOVkRJTU0gZGV2aWNlcy4KCkkndmUgZ290IG90aGVyIHF1ZXN0aW9uLCBh
bmQgbWF5YmUgcG9zc2libGUgaW1wcm92ZW1lbnRzLgoKV2hlbiBRRU1VIGJ1aWxkIHRoZSBBQ1BJ
IHRhYmxlcywgaXQgYWxzbyBpbml0aWFsaXplIHNvbWUgTWVtb3J5UmVnaW9uLAp3aGljaCB1c2Ug
bW9yZSBndWVzdCBtZW1vcnkuIERvIHlvdSBrbm93IGlmIHRob3NlIHJlZ2lvbnMgYXJlIHVzZWQg
d2l0aAp5b3VyIHBhdGNoIHNlcmllcyBvbiBYZW4/IE90aGVyd2lzZSwgd2UgY291bGQgdHJ5IHRv
IGF2b2lkIHRoZWlyCmNyZWF0aW9uIHdpdGggdGhpczoKSW4geGVuZnZfbWFjaGluZV9vcHRpb25z
KCkKbS0+cm9tX2ZpbGVfaGFzX21yID0gZmFsc2U7CihzZXR0aW5nIHRoaXMgaW4geGVuX2h2bV9p
bml0KCkgd291bGQgcHJvYmFibHkgYmUgYmV0dGVyLCBidXQgSSBoYXZuJ3QKdHJ5KQoKSWYgdGhp
cyBpcyBwb3NzaWJsZSwgbGlieGwgd291bGQgbm90IG5lZWQgdG8gYWxsb2NhdGUgbW9yZSBtZW1v
cnkgZm9yCnRoZSBndWVzdCAoZG1fYWNwaV9zaXplKS4KCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
