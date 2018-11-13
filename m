From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH 4/3] x86/HVM: hvm_map_guest_frame_rw()
 should respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 13:39:36 +0000
Message-ID: <cfa8240e-69cb-7ce6-7f58-a34e9a4ed7da@citrix.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pmsg=ny=citrix.com=prvs=848afb93d=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gMYuv-0005Oi-QS
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 13:39:45 +0000
In-Reply-To: <5BEAAB8802000078001FB62A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMTEvMjAxOCAxMDo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV3JpdGVzIHRvIHN1Y2gg
cGFnZXMgd291bGQgbmVlZCB0byBiZSBoYW5kZWQgdG8gdGhlIGVtdWxhdG9yLCB3aGljaCB3ZSdy
ZQo+IG5vdCBwcmVwYXJlZCB0byBkbyBhdCB0aGlzIHBvaW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IEBAIC0yNTU2LDcgKzI1
NTYsOCBAQCBzdGF0aWMgdm9pZCAqX2h2bV9tYXBfZ3Vlc3RfZnJhbWUodW5zaWduCj4gIAo+ICAg
ICAgaWYgKCB3cml0YWJsZSApCj4gICAgICB7Cj4gLSAgICAgICAgaWYgKCB1bmxpa2VseShwMm1f
aXNfZGlzY2FyZF93cml0ZShwMm10KSkgKQo+ICsgICAgICAgIGlmICggdW5saWtlbHkocDJtX2lz
X2Rpc2NhcmRfd3JpdGUocDJtdCkpIHx8Cj4gKyAgICAgICAgICAgICB1bmxpa2VseShwMm10ID09
IHAybV9pb3JlcV9zZXJ2ZXIpICkKClNob3VsZG4ndCB3ZSBpbnRyb2R1Y2UgcDJtX2lzX2lvcmVx
X3NlcnZlcigpIGZvciBjb25zaXN0ZW5jeSBhbmQgdXNlIGl0CmV2ZXJ5d2hlcmU/CgpJZ29yCgo+
ICAgICAgICAgICAgICAqd3JpdGFibGUgPSAwOwo+ICAgICAgICAgIGVsc2UgaWYgKCAhcGVybWFu
ZW50ICkKPiAgICAgICAgICAgICAgcGFnaW5nX21hcmtfcGZuX2RpcnR5KGQsIF9wZm4oZ2ZuKSk7
Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
