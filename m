From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/6] x86: log XPTI enabled status
Date: Thu, 15 Mar 2018 10:35:34 -0600
Message-ID: <5AAAAEE602000078001B255E@prv-mh.provo.novell.com>
References: <5AA7E24402000078001B0F41@prv-mh.provo.novell.com>
 <5AA7E4D902000078001B0F56@prv-mh.provo.novell.com>
 <d598be7c-a12e-0c5b-684a-112da90ecb60@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewVqw-0005Qi-KD
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:35:42 +0000
In-Reply-To: <d598be7c-a12e-0c5b-684a-112da90ecb60@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE2OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMTggMTM6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBdCB0aGUgc2Ft
ZSB0aW1lIGFsc28gcmVwb3J0IHRoZSBzdGF0ZSBvZiB0aGUgdHdvIGRlZmluZWQKPj4gQVJDSF9D
QVBBQklMSVRJRVMgTVNSIGJpdHMuIFRvIGF2b2lkIGZ1cnRoZXIgY29tcGxpY2F0aW5nIHRoZQo+
PiBjb25kaXRpb25hbCBhcm91bmQgdGhhdCBwcmludGsoKSwgZHJvcCBpdCAoaXQncyBhIGRlYnVn
IGxldmVsIG9uZSBvbmx5Cj4+IGFueXdheSkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gVGVzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gCj4gSW4gcHJpbmNpcGxlLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBIb3dldmVyLCBkb24ndCB3ZSB3YW50IHRvIHRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvIHJhaXNlIHRoZSBYRU5MT0dfSU5GTwo+IHRvIHNvbWV0aGluZyB3
aGljaCB3aWxsIGJlIHByaW50ZWQgYnkgZGVmYXVsdCBpbiBhIHJlbGVhc2UgYnVpbGQsIHNlZWlu
Zwo+IGFzIHRoYXQgcGxhbiBmZWxsIHRocm91Z2ggdGhlIGZpcnN0IHRpbWU/CgpXZWxsLCBzdHJp
Y3RseSBzcGVha2luZyBJIGRvbid0IHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGFsdGVyIHRoZQpC
VEkgcmVsYXRlZCBwcmludGsoKSwgYW5kIEkgZG8gdGhpbmsgdGhlIG9uZSBhZGRlZCBoZXJlIHNo
b3VsZApiZSBpbiBzeW5jIHdpdGggdGhlIG90aGVyIG9uZS4gQnV0IEkgd291bGRuJ3QgbWluZCBt
YWtpbmcgYm90aApYRU5MT0dfV0FSTklORyAob3IgcGVyaGFwcyBiZXR0ZXIgb21pdCBYRU5MT0df
KiBhbHRvZ2V0aGVyCmZyb20gdGhlc2UgdHdvKS4gSSBjb3VsZCBlYXNpbHkgYWx0ZXIgdGhpcyBi
ZWZvcmUgY29tbWl0dGluZywgYnV0Cm5vbmUgb2YgdGhlc2UgY2FuIGJlIGNvbW1pdHRlZCBhZmFp
Y3Qgd2l0aG91dCB1cyByZWFjaGluZwphZ3JlZW1lbnQgb24gcGF0Y2ggMSAodGhlIGRlcGVuZGVu
Y2llcyBiZXR3ZWVuIHRoZSBwYXRjaGVzCmFyZSBhbHNvIHRoZSByZWFzb24gd2h5IEkgZGlkbid0
IHJlLW9yZGVyIHdoYXQgaXMgc3RpbGwgcGF0Y2ggMSwKb3RoZXIgdGhhbiBJIGhhZCBmaXJzdCBp
bnRlbmRlZCB0byBkbyBmb3IgdjMpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
