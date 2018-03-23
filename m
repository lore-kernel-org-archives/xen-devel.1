From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 12/20] xen/domctl: Merge max_vcpus into
 createdomain
Date: Fri, 23 Mar 2018 16:14:54 +0000
Message-ID: <5AB5360E02000078001B5A2E@gwmail.emea.novell.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, =?UTF-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Christian Lindig <christian.lindig@citrix.com>, DavidScott <dave@recoil.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE4IGF0IDIwOjEzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTU1MSw2ICs1NTUsMzcgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+ICAgICAgICAgIGlmICggIXJldCApCj4g
ICAgICAgICAgICAgIGdvdG8gY3JlYXRlZG9tYWluX2ZhaWxfbGF0ZTsKPiAgCj4gKyAgICAgICAg
cmV0ID0gLUVJTlZBTDsKPiArICAgICAgICBpZiAoIHZjcHVzID4gZG9tYWluX21heF92Y3B1cyhk
KSApCj4gKyAgICAgICAgICAgIGdvdG8gY3JlYXRlZG9tYWluX2ZhaWxfbGF0ZTsKPiArCj4gKyAg
ICAgICAgcmV0ID0gLUVOT01FTTsKPiArICAgICAgICBvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9j
cHVtYXNrKGQpOwo+ICsKPiArICAgICAgICBCVUdfT04oZC0+dmNwdSk7Cj4gKyAgICAgICAgQlVH
X09OKGQtPm1heF92Y3B1cyk7Cj4gKwo+ICsgICAgICAgIGQtPnZjcHUgPSB4emFsbG9jX2FycmF5
KHN0cnVjdCB2Y3B1ICosIHZjcHVzKTsKPiArICAgICAgICAvKiBJbnN0YWxsIHZjcHUgYXJyYXkg
L3RoZW4vIHVwZGF0ZSBtYXhfdmNwdXMuICovCj4gKyAgICAgICAgc21wX3dtYigpOwo+ICsgICAg
ICAgIGlmICggIWQtPnZjcHUgKQo+ICsgICAgICAgICAgICBnb3RvIGNyZWF0ZWRvbWFpbl9mYWls
X2xhdGU7Cj4gKyAgICAgICAgZC0+bWF4X3ZjcHVzID0gdmNwdXM7Cj4gKwo+ICsgICAgICAgIGNw
dSA9IGNwdW1hc2tfYW55KG9ubGluZSk7Cj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCB2Y3B1
czsgKytpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIEJVR19PTihkLT52Y3B1W2ldKTsK
PiArCj4gKyAgICAgICAgICAgIGlmICggYWxsb2NfdmNwdShkLCBpLCBjcHUpID09IE5VTEwgKQo+
ICsgICAgICAgICAgICAgICAgZ290byBjcmVhdGVkb21haW5fZmFpbF9sYXRlOwo+ICsKPiArICAg
ICAgICAgICAgQlVHX09OKCFkLT52Y3B1W2ldKTsKPiArCj4gKyAgICAgICAgICAgIGNwdSA9IGNw
dW1hc2tfY3ljbGUoZC0+dmNwdVtpXS0+cHJvY2Vzc29yLCBvbmxpbmUpOwo+ICsgICAgICAgIH0K
PiArCj4gKyAgICAgICAgcmV0ID0gMDsKPiAgICAgICAgICBkID0gTlVMTDsKPiAgICAgICAgICBi
cmVhazsKClNhbWUgcXVlc3Rpb24gaGVyZSByZWdhcmRpbmcgdGhlIGxhdGUgcGxhY2VtZW50LiBB
ZGRpdGlvbmFsbHksIGJ5CmRvaW5nIHRoaXMgYWZ0ZXIgaW5zZXJ0aW9uIG9udG8gdGhlIGxpc3Qs
IHlvdSBzdGlsbCBsZWF2ZSBhIHdpbmRvdwp3aGVyZSB0aGUgZG9tYWluIGNhbiBiZSBmb3VuZCBi
dXQgaGFzIGEgTlVMTCB2Y3B1cyBwb2ludGVyLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
