From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 21/23] x86: expose CONFIG_HVM
Date: Tue, 28 Aug 2018 13:14:45 +0100
Message-ID: <85724013-8858-66b4-1790-9c6c3db7b9da@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <2e3eb53f8cc359ece0f19647247a5911fc6f003b.1535285866.git-series.wei.liu2@citrix.com>
 <5B8536FF02000078001E2905@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qctd=ll=citrix.com=prvs=771e299fc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fuctV-0001jR-A5
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 12:14:49 +0000
In-Reply-To: <5B8536FF02000078001E2905@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDgvMTggMTI6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjA4LjE4IGF0
IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9LY29uZmlnCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+IEBAIC02MCw2ICs2MCwx
MiBAQCBjb25maWcgUFZfTElORUFSX1BUCj4+ICAKPj4gIGNvbmZpZyBIVk0KPj4gIAlkZWZfYm9v
bCB5Cj4+ICsJcHJvbXB0ICJIVk0gLyBQVkggc3VwcG9ydCIKPj4gKwktLS1oZWxwLS0tCj4+ICsJ
ICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgSFZNIGFuZCBQVkggZ3Vlc3RzLgoKVGhpcyBkZWZpbml0
ZWx5IG5lZWRzIG1vcmUgdGhhbiBhIHNpbmdsZSBsaW5lLi4uCgo+PiArCj4+ICsJICBJZiB1bnN1
cmUsIHNheSBZLgo+PiArCj4+ICAKPj4gIGNvbmZpZyBTSEFET1dfUEFHSU5HCj4gTm8gZG91Ymxl
IGJsYW5rIGxpbmVzIHBsZWFzZS4KPgo+IE15IHByZXZpb3VzbHkgdm9pY2VkIHJlc2VydmF0aW9u
cyB3cnQgdGhlIHNoaW0gcmVtYWluLiBJIGNvbnRpbnVlCj4gdG8gZGlzYWdyZWUgd2l0aCBBbmRy
ZXcgdGhhdCB0aGUgc3ltYm9sIG5lZWRzIHRvIGJlIHZpc2libGUgaW4gYQo+IHNoaW0tb25seSBj
b25maWcsIGFuZCBJIGNvbnRpbnVlIHRvIGRlbWFuZCBhcyBhIG1pbmltdW0gdGhhdCB0aGUKPiBk
ZWZhdWx0IGhlcmUgYmUgTiBpbiB0aGF0IGNhc2UgaWYgdGhlIHN5bWJvbCByZWFsbHkgaXMgdG8g
cmVtYWluIHZpc2libGUuCgpDb25kaXRpb25hbGx5IGluZmx1ZW5jaW5nIHRoZSBkZWZhdWx0IGlz
IGZpbmUuwqAgSGlkaW5nIHRoZSBzeW1ib2wgaXMgbm90LgoKVG8gYmUgdmVyeSB2ZXJ5IGNsZWFy
LCBJIHdpbGwgbmFjay9yZXZlcnQgYW55IHBhdGNoIHdoaWNoIHRyaWVzIHRvCmluc2VydCBhIGRl
cGVuZGVuY3kgaGVyZS7CoCBJIGZpbmQgeW91ciByZWFzb25pbmcgdG8gYmUgd3JvbmcsIGFuZApz
dWZmaWNpZW50bHkgc2hvcnQgc2lnaHRlZCBhbmQgZGV0cmltZW50YWwgdG8gdXNlcnMsIHRoYXQg
SSdtIG5vdCBnb2luZwp0byBsZXQgdGhlIHBhdGNoIGluLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
