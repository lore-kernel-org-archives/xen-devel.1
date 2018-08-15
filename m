From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VMX: make vmx_read_guest_msr() cope with
 callers not checking its return value
Date: Wed, 15 Aug 2018 12:39:36 +0100
Message-ID: <afb291b3-1fe5-2c26-3dec-488edf359f4d@citrix.com>
References: <5B740FAC02000078001DE559@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwwv=k6=citrix.com=prvs=758086435=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fpu9M-0003nf-2v
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 11:39:40 +0000
In-Reply-To: <5B740FAC02000078001DE559@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDgvMTggMTI6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEl0IHRvb2sgdGlsbCB0aGUg
NC41IGJhY2twb3J0cyBvZiB0aGUgTDFURiBwcmVyZXFzIHRoYXQgZ2NjIDguMiBmaW5hbGx5Cj4g
bm90aWNlZCB0aGF0IHRoZSB2UE1VIGNhbGxlcnMsIG5vdCBjaGVja2luZyB0aGUgZnVuY3Rpb24n
cyByZXR1cm4gdmFsdWUsCj4gbWF5IGNvbnN1bWUgdW5pbml0aWFsaXplZCBkYXRhLiBHdWFyZCBh
Z2FpbnN0IHRoaXMgYnkgc3RvcmluZyB6ZXJvIG9uCj4gdGhlIGVycm9yIHBhdGguCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgp2UE1VIHJlYWxseSBp
cyB0aGUgZ2lmdCB3aGljaCBrZWVwcyBvbiBnaXZpbmcuLi4KCj4KPiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS92bXgvdm1jcy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
dm14L3ZtY3MuaAo+IEBAIC01ODYsNyArNTg2LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IHZteF9y
ZWFkX2d1ZXN0X21zcihjb24KPiAgICAgIGNvbnN0IHN0cnVjdCB2bXhfbXNyX2VudHJ5ICplbnQg
PSB2bXhfZmluZF9tc3IodiwgbXNyLCBWTVhfTVNSX0dVRVNUKTsKPiAgCj4gICAgICBpZiAoICFl
bnQgKQo+ICsgICAgewo+ICsgICAgICAgICp2YWwgPSAwOwo+ICAgICAgICAgIHJldHVybiAtRVNS
Q0g7Cj4gKyAgICB9Cj4gIAo+ICAgICAgKnZhbCA9IGVudC0+ZGF0YTsKPiAgCgpZb3Ugd2FudCBh
IHNpbWlsYXIgYWRqdXN0bWVudCBpbiB2bXhfcmVhZF9ndWVzdF9sb2Fkb25seV9tc3IoKQppbW1l
ZGlhdGVseSBiZWxvdywgd2hpY2ggSSBiZWxpZXZlIGlzIG9ubHkgYXBwbGljYWJsZSB0byBzdGFn
aW5nIGF0bS4KCldpdGggdGhhdCwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
