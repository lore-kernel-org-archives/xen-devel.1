From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/HVM: drop
 hvm_fetch_from_guest_linear()
Date: Thu, 30 Aug 2018 13:22:44 +0100
Message-ID: <7b6af386-5dab-0693-12e7-176a7f803ac7@citrix.com>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B87D04F02000078001E37B5@prv1-mh.provo.novell.com>
 <a103cabc-b562-f519-8d48-4eeca8ab25f3@citrix.com>
 <5B87DCDF02000078001E37E8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ohfx=ln=citrix.com=prvs=773039ca7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fvLyK-0006TM-3b
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 12:22:48 +0000
In-Reply-To: <5B87DCDF02000078001E37E8@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA4LjE4IGF0
IDEzOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDMwLzA4LzE4
IDEyOjA5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEBAIC0yNTEyLDkgKzI1MTIsMTAgQEAgdm9p
ZCBodm1fZW11bGF0ZV9pbml0X3Blcl9pbnNuKAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBodm1fYWNjZXNzX2luc25fZmV0Y2gsCj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZodm1lbXVsX2N0eHQtPnNlZ19yZWdbeDg2X3Nl
Z19jc10sCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhZGRy
KSAmJgo+Pj4gLSAgICAgICAgICAgICBodm1fZmV0Y2hfZnJvbV9ndWVzdF9saW5lYXIoaHZtZW11
bF9jdHh0LT5pbnNuX2J1ZiwgYWRkciwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVvZihodm1lbXVsX2N0eHQtPmluc25fYnVmKSwKPj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmZWMsIE5VTEwpID09IEhWTVRSQU5T
X29rYXkpID8KPj4+ICsgICAgICAgICAgICAgaHZtX2NvcHlfZnJvbV9ndWVzdF9saW5lYXIoaHZt
ZW11bF9jdHh0LT5pbnNuX2J1ZiwgYWRkciwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYpLAo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZmVjIHwgUEZFQ19pbnNuX2ZldGNo
LCBOVUxMLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxM
KSA9PSBIVk1UUkFOU19va2F5KSA/Cj4+IERvZXMgdGhpcyBldmVuIGNvbXBpbGU/ICBZb3Ugc2Vl
bSB0byBoYXZlIGFuIGV4dHJhIE5VTEwgaGVyZSBhbmQgc2V2ZXJhbAo+PiBsYXRlciBwbGFjZXMu
Cj4gSXQgZG9lcyAtIHdpdGggIng4Ni9IVk06IGltcGxlbWVudCBtZW1vcnkgcmVhZCBjYWNoaW5n
IiBhbHNvCj4gYXBwbGllZC4gSU9XIC0gSSdtIHNvcnJ5LCBpbnN1ZmZpY2llbnQgcmUtb3JkZXJp
bmcgd29yayBkb25lCj4gd2hlbiBtb3ZpbmcgdGhlc2UgdHdvIGFoZWFkLgoKRG9lcyBpdD/CoCBU
aGlzIHBhdGNoIGhhcyBhIG1peCBvZiBjYWxsZXJzIHdpdGggNCBhbmQgNSBwYXJhbWV0ZXJzLCB3
aGljaAppcyB3aHkgSSBub3RpY2VkIGl0IGluIHRoZSBmaXJzdCBwbGFjZS4KCldpdGggaXQgZml4
ZWQgdXAgdG8gY29tcGlsZSwgYW5kIHByZWZlcmFibHkgd2l0aCB0aGUgb3RoZXIgYWRqdXN0bWVu
dAppbmNsdWRlZCwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
