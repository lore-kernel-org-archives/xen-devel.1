From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 21/23] x86: expose CONFIG_HVM
Date: Tue, 28 Aug 2018 07:33:06 -0600
Message-ID: <5B854F1202000078001E29A4@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <2e3eb53f8cc359ece0f19647247a5911fc6f003b.1535285866.git-series.wei.liu2@citrix.com>
 <5B8536FF02000078001E2905@prv1-mh.provo.novell.com>
 <85724013-8858-66b4-1790-9c6c3db7b9da@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fue7L-00008q-Cz
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 13:33:11 +0000
In-Reply-To: <85724013-8858-66b4-1790-9c6c3db7b9da@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE0OjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDgvMTggMTI6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNi4w
OC4xOCBhdCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0tIGEveGVu
L2FyY2gveDg2L0tjb25maWcKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+PiBAQCAt
NjAsNiArNjAsMTIgQEAgY29uZmlnIFBWX0xJTkVBUl9QVAo+Pj4gIAo+Pj4gIGNvbmZpZyBIVk0K
Pj4+ICAJZGVmX2Jvb2wgeQo+Pj4gKwlwcm9tcHQgIkhWTSAvIFBWSCBzdXBwb3J0Igo+Pj4gKwkt
LS1oZWxwLS0tCj4+PiArCSAgSW50ZXJmYWNlcyB0byBzdXBwb3J0IEhWTSBhbmQgUFZIIGd1ZXN0
cy4KPiAKPiBUaGlzIGRlZmluaXRlbHkgbmVlZHMgbW9yZSB0aGFuIGEgc2luZ2xlIGxpbmUuLi4K
PiAKPj4+ICsKPj4+ICsJICBJZiB1bnN1cmUsIHNheSBZLgo+Pj4gKwo+Pj4gIAo+Pj4gIGNvbmZp
ZyBTSEFET1dfUEFHSU5HCj4+IE5vIGRvdWJsZSBibGFuayBsaW5lcyBwbGVhc2UuCj4+Cj4+IE15
IHByZXZpb3VzbHkgdm9pY2VkIHJlc2VydmF0aW9ucyB3cnQgdGhlIHNoaW0gcmVtYWluLiBJIGNv
bnRpbnVlCj4+IHRvIGRpc2FncmVlIHdpdGggQW5kcmV3IHRoYXQgdGhlIHN5bWJvbCBuZWVkcyB0
byBiZSB2aXNpYmxlIGluIGEKPj4gc2hpbS1vbmx5IGNvbmZpZywgYW5kIEkgY29udGludWUgdG8g
ZGVtYW5kIGFzIGEgbWluaW11bSB0aGF0IHRoZQo+PiBkZWZhdWx0IGhlcmUgYmUgTiBpbiB0aGF0
IGNhc2UgaWYgdGhlIHN5bWJvbCByZWFsbHkgaXMgdG8gcmVtYWluIHZpc2libGUuCj4gCj4gQ29u
ZGl0aW9uYWxseSBpbmZsdWVuY2luZyB0aGUgZGVmYXVsdCBpcyBmaW5lLiAgSGlkaW5nIHRoZSBz
eW1ib2wgaXMgbm90Lgo+IAo+IFRvIGJlIHZlcnkgdmVyeSBjbGVhciwgSSB3aWxsIG5hY2svcmV2
ZXJ0IGFueSBwYXRjaCB3aGljaCB0cmllcyB0bwo+IGluc2VydCBhIGRlcGVuZGVuY3kgaGVyZS4g
IEkgZmluZCB5b3VyIHJlYXNvbmluZyB0byBiZSB3cm9uZywgYW5kCj4gc3VmZmljaWVudGx5IHNo
b3J0IHNpZ2h0ZWQgYW5kIGRldHJpbWVudGFsIHRvIHVzZXJzLCB0aGF0IEknbSBub3QgZ29pbmcK
PiB0byBsZXQgdGhlIHBhdGNoIGluLgoKU2luY2UgaWlyYyB5b3UgZGlkbid0IHJlc3BvbmQgdG8g
bXkgbW9zdCByZWNlbnQgY29tbWVudCBvbiB2MSBoZXJlLApJIHdvdWxkIGhhdmUgdmVyeSBtdWNo
IGhvcGVkIHlvdSdkIGV4cGxhaW4geW91ciBwb3NpdGlvbiBhIGxpdHRsZQpiZXR0ZXIgdGhhbiBq
dXN0IGNsYWltaW5nIHRoYXQgdGhlIHN5bWJvbCBiZWNvbWluZyBpbnZpc2libGUgd2l0aCBhCmRl
cGVuZGVuY3kgYWRkZWQgaXMgYSBiYWQgdGhpbmcuIEknbSBjZXJ0YWlubHkgb3BlbiB0byAoZ29v
ZCkKYXJndW1lbnRzLCBidXQgSSdtIG5vdCBhY2NlcHRpbmcgYSBwbGFpbiBzdGF0ZW1lbnQgd2l0
aG91dCBwcm9wZXIKZXhwbGFuYXRpb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
