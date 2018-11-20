From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V7 3/5] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Tue, 20 Nov 2018 02:12:24 -0700
Message-ID: <5BF3CFF802000078001FDD90@prv1-mh.provo.novell.com>
References: <1542648412-2711-1-git-send-email-rcojocaru@bitdefender.com>
 <1542648412-2711-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP258-0000TY-Q0
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 09:12:30 +0000
In-Reply-To: <1542648412-2711-4-git-send-email-rcojocaru@bitdefender.com>
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

Pj4+IE9uIDE5LjExLjE4IGF0IDE4OjI2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gV2hlbiBhbiBuZXcgYWx0cDJtIHZpZXcgaXMgY3JlYXRlZCB2ZXJ5IGVhcmx5IG9uIGd1
ZXN0IGJvb3QsIHRoZQo+IGRpc3BsYXkgd2lsbCBmcmVlemUgKGFsdGhvdWdoIHRoZSBndWVzdCB3
aWxsIHJ1biBub3JtYWxseSkuIFRoaXMKPiBtYXkgYWxzbyBoYXBwZW4gb24gcmVzaXppbmcgdGhl
IGRpc3BsYXkuIFRoZSByZWFzb24gaXMgdGhlIHdheQo+IFhlbiBjdXJyZW50bHkgKG1pcyloYW5k
bGVzIGxvZ2RpcnR5IFZHQTogaXQgaW50ZW50aW9uYWxseQo+IG1pc2NvbmZpZ3VyZXMgVkdBIHBh
Z2VzIHNvIHRoYXQgdGhleSB3aWxsIGZhdWx0Lgo+IAo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQg
b25seSBkb2VzIHRoaXMgaW4gdGhlIGhvc3QgcDJtLiBPbmNlIHdlCj4gc3dpdGNoIHRvIGEgbmV3
IGFsdHAybSwgdGhlIG1pc2NvbmZpZ3VyZWQgZW50cmllcyB3aWxsIG5vIGxvbmdlcgo+IGZhdWx0
LCBzbyB0aGUgZGlzcGxheSB3aWxsIG5vdCBiZSB1cGRhdGVkLgo+IAo+IFRoaXMgcGF0Y2g6Cj4g
KiB1cGRhdGVzIGVwdF9oYW5kbGVfbWlzY29uZmlnKCkgdG8gdXNlIHRoZSBhY3RpdmUgYWx0cDJt
IGluc3RlYWQKPiAgIG9mIHRoZSBob3N0cDJtOwo+ICogbW9kaWZpZXMgcDJtX2NoYW5nZV9lbnRy
eV90eXBlX2dsb2JhbCgpLAo+ICAgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoKSwgcDJtX2NoYW5n
ZV90eXBlX3JhbmdlKCkgYW5kCj4gICBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkgdG8gcHJvcGFn
YXRlIHRoZWlyIGNoYW5nZXMgdG8gYWxsCj4gICB2YWxpZCBhbHRwMm1zLgo+IAo+IFdpdGggdGhl
IGludHJvZHVjdGlvbiBvZiBhbHRwMm0gZmllbGRzIGluIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2Vk
KCkKPiB0aGUgd2hvbGUgZnVuY3Rpb24gaGFzIGJlZW4gcHV0IHVuZGVyIENPTkZJR19IVk0uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIu
Y29tPgo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgoKSnVkZ2luZyBmcm9tIEdlb3JnZSdzIGVhcmxpZXIgYW5hbHlzaXMgSSB3b25kZXIgd2hl
dGhlciB0aGUgcGF0Y2gKb3JkZXJpbmcgaXMgY29ycmVjdDogSSd2ZSBnb3QgdGhlIGltcHJlc3Np
b24gdGhhdCB0aGUgcGF0Y2ggaGVyZSBzaG91bGQKYmUgbGFzdCBpbiB0aGUgc2VyaWVzLCBmb3Ig
aXQgdG8gYmUgY29ycmVjdCBhbmQgZWZmaWNpZW50IGluIGFsbCBjYXNlcy4KCkZ1cnRoZXJtb3Jl
IChtaW5vciwgYnV0IHRoaXMgYXBwZWFycyB0byByZWN1ciksIG1heSBJIGFzayB0aGF0IHlvdQpz
d2l0Y2ggYXJvdW5kIHRhZ3MgbGlrZSB0aGUgYWJvdmUgb25lcyBpbiB0aGUgZnV0dXJlPyBBcyBw
cmV2aW91c2x5CmV4cHJlc3NlZCAoaW4gb3RoZXIgY29udGV4dHMpIEknbSBvZiB0aGUgb3Bpbmlv
biB0aGF0IHRoZSBzZXF1ZW5jZQpvZiB0YWdzIHNob3VsZCByZXByZXNlbnQgdGhlIGZsb3cgb2Yg
ZXZlbnRzLCBhbmQgYSBidWcgcmVwb3J0IGFzCm11Y2ggYXMgYSBzdWdnZXN0aW9uIG9mIGEgY2hh
bmdlIGNhbid0IGhhdmUgaGFwcGVuZWQgYmVmb3JlIHRoZQp3cml0aW5nIG9mIGEgcGF0Y2guCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
