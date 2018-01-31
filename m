From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86/emul: Improvements to internal
 users of decode_register()
Date: Wed, 31 Jan 2018 04:17:28 -0700
Message-ID: <5A71B3D802000078001A3FC7@prv-mh.provo.novell.com>
References: <1517327772-22297-1-git-send-email-andrew.cooper3@citrix.com>
 <1517327772-22297-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1517327772-22297-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE4IGF0IDE2OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC0xOTU3LDkgKzE5
NTcsOCBAQCBjb25zdCB1aW50OF90IGNwdV91c2VyX3JlZ3NfZ3ByX29mZnNldHNbXSA9IHsKPiAg
I2VuZGlmCj4gIH07Cj4gIAo+IC12b2lkICoKPiAtZGVjb2RlX3JlZ2lzdGVyKAo+IC0gICAgdWlu
dDhfdCBtb2RybV9yZWcsIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBpbnQgaGlnaGJ5dGVf
cmVncykKPiArc3RhdGljIHZvaWQgKmRlY29kZV9ncHJfYnl0ZW9wKAo+ICsgICAgc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCBtb2RybV9yZWcsIGJvb2wgbGVnYWN5X2J5
dGVvcCkKCkFnYWluIEknbSBub3QgcmVhbGx5IGhhcHB5IGFib3V0ICJvcCIgaGVyZS4gV2h5IG5v
dCBmb2xsb3cgdGhlCm1vZGVsIG9mIG15IG9yaWdpbmFsIHBhdGNoIGFuZCBtYWtlIHRoaXMKCnN0
YXRpYyB2b2lkICpfZGVjb2RlX2dwcigKICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1
bnNpZ25lZCBpbnQgbW9kcm1fcmVnLCBib29sIGxlZ2FjeSkKCj8gV2l0aCB0aGF0IG9yIGEgc3Vi
c3RhbnRpYWxseSBzaW1pbGFyIGFkanVzdG1lbnQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
