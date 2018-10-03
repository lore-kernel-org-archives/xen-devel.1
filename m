From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 02/12] x86/HVM: patch indirect calls
 through hvm_funcs to direct ones
Date: Wed, 3 Oct 2018 19:55:29 +0100
Message-ID: <6000eb35-ed80-c2af-2e2d-45da502c71eb@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB344A702000078001EDA0B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=twgs=mp=citrix.com=prvs=8071b990d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7mJ3-00007v-8v
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 18:55:33 +0000
In-Reply-To: <5BB344A702000078001EDA0B@prv1-mh.provo.novell.com>
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMTggMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMgaW50ZW50aW9u
YWxseSBub3QgdG91Y2hpbmcgaG9va3MgdXNlZCByYXJlbHkgKG9yIG5vdCBhdCBhbGwpCj4gZHVy
aW5nIHRoZSBsaWZldGltZSBvZiBhIFZNLCBsaWtlIHtkb21haW4sdmNwdX1faW5pdGlhbGlzZSBv
ciBjcHVfdXAsCj4gYXMgd2VsbCBhcyBuZXN0ZWQsIFZNIGV2ZW50LCBhbmQgYWx0cDJtIG9uZXMg
KHRoZXkgY2FuIGFsbCBiZSBkb25lCj4gbGF0ZXIsIGlmIHNvIGRlc2lyZWQpLiBWaXJ0dWFsIElu
dGVycnVwdCBkZWxpdmVyeSBvbmVzIHdpbGwgYmUgZGVhbHQKPiB3aXRoIGluIGEgc3Vic2VxdWVu
dCBwYXRjaC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSXQgaXMgYSBzaGFt
ZSB0aGF0IHdlIGRvbid0IGhhdmUgYSB2YXJpYXRpb24gc3VjaCBhcyBjb25kX2FsdF92Y2FsbCgp
CndoaWNoIG5vcHMgb3V0IHRoZSBlbnRpcmUgY2FsbCB3aGVuIHRoZSBmdW5jdGlvbiBwb2ludGVy
IGlzIE5VTEwsIGJ1dCBJCmNhbid0IHRoaW5rIG9mIGFueSBzYW5lIHdheSBvZiB0cnlpbmcgdG8g
bWFrZSB0aGF0IGhhcHBlbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
