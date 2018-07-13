From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 01/11] x86/cpu: Introduce
 vmce_save_vcpu_ctxt_one() func
Date: Fri, 13 Jul 2018 04:29:44 -0600
Message-ID: <5B487F1802000078001D3C13@prv1-mh.provo.novell.com>
References: <1531472650-6718-1-git-send-email-aisaila@bitdefender.com>
 <1531472650-6718-2-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1531472650-6718-2-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA3LjE4IGF0IDExOjA0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IENoYW5nZXMgc2luY2UgVjEwOgo+IAktIEFkZCBtZW1zZXQgdG8gMCBmb3IgY3R4dC4KCldo
eT8gV2hhdCdzIHdyb25nIHdpdGggLi4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNr
L3ZtY2UuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYwo+IEBAIC0zNDks
NiArMzQ5LDIwIEBAIGludCB2bWNlX3dybXNyKHVpbnQzMl90IG1zciwgdWludDY0X3QgdmFsKQo+
ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3RhdGljIGludCB2bWNlX3NhdmVfdmNwdV9j
dHh0X29uZShzdHJ1Y3QgdmNwdSAqdiwgaHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpCj4gKyB7Cj4g
KyAgICBzdHJ1Y3QgaHZtX3ZtY2VfdmNwdSBjdHh0Owo+ICsKPiArICAgIG1lbXNldCgmY3R4dCwg
MCwgc2l6ZW9mKGN0eHQpKTsKCiAgICBzdHJ1Y3QgaHZtX3ZtY2VfdmNwdSBjdHh0ID0ge307Cgpp
bnN0ZWFkPyBPciBldmVuIHB1bGxpbmcgYWxsIG9mIHRoaXMgLi4uCgo+ICsgICAgY3R4dC5jYXBz
ID0gdi0+YXJjaC52bWNlLm1jZ19jYXA7Cj4gKyAgICBjdHh0Lm1jaV9jdGwyX2JhbmswID0gdi0+
YXJjaC52bWNlLmJhbmtbMF0ubWNpX2N0bDI7Cj4gKyAgICBjdHh0Lm1jaV9jdGwyX2JhbmsxID0g
di0+YXJjaC52bWNlLmJhbmtbMV0ubWNpX2N0bDI7Cj4gKyAgICBjdHh0Lm1jZ19leHRfY3RsID0g
di0+YXJjaC52bWNlLm1jZ19leHRfY3RsOwoKLi4uIGludG8gdGhlIGluaXRpYWxpemVyLCB3aGlj
aCB3aWxsIG1ha2Ugc3VyZSBwYWRkaW5nIGZpZWxkcyBhcmUgemVyby4KSSBjYW4gc2VlIHRoYXQg
YSBtZW1zZXQoKSBpcyB3YXJyYW50ZWQgaW4gX3NvbWVfIGNhc2VzLCBidXQgbm90CnVuaWZvcm1s
eS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
