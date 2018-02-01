From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v10 08/11] x86/boot: Calculate the most
 appropriate BTI mitigation to use
Date: Thu, 1 Feb 2018 13:58:39 +0000
Message-ID: <f138067e-b1d2-3489-7d18-55ca5144ee59@citrix.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-9-git-send-email-andrew.cooper3@citrix.com>
 <5A72E0C102000078001A437D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A72E0C102000078001A437D@prv-mh.provo.novell.com>
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
Cc: Asit K Mallick <asit.k.mallick@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMTggMDg6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjAxLjE4IGF0
IDE0OjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ICB2b2lkIF9faW5p
dCBpbml0X3NwZWN1bGF0aW9uX21pdGlnYXRpb25zKHZvaWQpCj4+ICB7Cj4+ICAgICAgZW51bSBp
bmRfdGh1bmsgdGh1bmsgPSBUSFVOS19ERUZBVUxUOwo+PiArICAgIGJvb2wgaWJycyA9IGZhbHNl
Owo+PiAgCj4+ICAgICAgLyoKPj4gICAgICAgKiBIYXMgdGhlIHVzZXIgc3BlY2lmaWVkIGFueSBj
dXN0b20gQlRJIG1pdGlnYXRpb25zPyAgSWYgc28sIGZvbGxvdyB0aGVpcgo+PiAgICAgICAqIGlu
c3RydWN0aW9ucyBleGFjdGx5IGFuZCBkaXNhYmxlIGFsbCBoZXVyaXN0aWNzLgo+PiAgICAgICAq
Lwo+PiAtICAgIGlmICggb3B0X3RodW5rICE9IFRIVU5LX0RFRkFVTFQgKQo+PiArICAgIGlmICgg
b3B0X3RodW5rICE9IFRIVU5LX0RFRkFVTFQgfHwgb3B0X2licnMgIT0gLTEgKQo+PiAgICAgIHsK
Pj4gICAgICAgICAgdGh1bmsgPSBvcHRfdGh1bms7Cj4+ICsgICAgICAgIGlicnMgID0gISFvcHRf
aWJyczsKPj4gICAgICB9Cj4gVGhlIGNvbW1lbnQgYWJvdmUgaGFzIGJlY29tZSBzdGFsZSB3aXRo
IGxhdGVyIGFkZGl0aW9ucy4gUXVlc3Rpb24KPiBpcyB3aGF0IHRoZSBpbnRlbnRpb25zIGFyZSwg
aS5lLiB3aGV0aGVyIGl0IGlzIHRoZSBjb21tZW50IG9yIHRoZSBjb2RlCj4gdGhhdCBzaG91bGQg
YmUgY2hhbmdlZC4KCkhtbSB0cnVlLsKgIFRoZSBjb21tZW50IHVzZWQgdG8gYmUgdHJ1ZSwgYnV0
IEkgY2hhbmdlZCBpdCBiYXNlZCBvbgppbnRlcm5hbCBmZWVkYmFjay7CoCBUaGUgbmV3IGxvZ2lj
IG1lYW5zIHRoYXQgZXhwbGljaXQgY2hvaWNlcyBvbmx5CmFmZmVjdCB0aGUgZGVmYXVsdHMgb2Yg
dGhlaXIgcmVsYXRlZCBhcmVhLgoKZS5nLiB0aGUgY2hvaWNlIG9mIHdoZXRoZXIgdG8gdXNlIElC
UEIgb3Igbm90ICh3aGljaCByZWFsbHkgaXMgYW4KaXNvbGF0ZWQgZGVjaXNpb24gaGVyZSkgc2hv
dWxkbid0IG92ZXJyaWRlIHRoZSBkZWZhdWx0IGNob2ljZSBmb3IKd2hldGhlciB0byB1c2UgSUJS
Uy9yZXRwb2xpbmUvZXRjLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
