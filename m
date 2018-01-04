From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6.5 24/26] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Thu, 04 Jan 2018 03:25:28 -0700
Message-ID: <5A4E0F28020000780019ADCC@prv-mh.provo.novell.com>
References: <1515024955-13390-1-git-send-email-andrew.cooper3@citrix.com>
 <1515024955-13390-25-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515024955-13390-25-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDA0LjAxLjE4IGF0IDAxOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L3NwZWNfY3RybC5jCj4gQEAgLTMyLDcgKzMyLDcgQEAgZW51bSBpbmRfdGh1bmsgewo+ICAgICAg
VEhVTktfTEZFTkNFLAo+ICAgICAgVEhVTktfSk1QLAo+ICB9IG9wdF90aHVuayBfX2luaXRkYXRh
ID0gVEhVTktfREVGQVVMVDsKPiAtaW50IG9wdF9pYnJzIF9faW5pdGRhdGEgPSAtMTsKPiAraW50
IG9wdF9pYnJzIF9faW5pdGRhdGEgPSAtMSwgb3B0X2licGIgX19pbml0ZGF0YSA9IC0xOwoKc3Rh
dGljLCBidXQgc2VlIGJlbG93LgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWZlYXR1
cmUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZS5oCj4gQEAgLTEwOSw2
ICsxMDksNyBAQAo+ICAjZGVmaW5lIGNwdV9oYXNfYXBlcmZtcGVyZiAgICAgIGJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9BUEVSRk1QRVJGKQo+ICAjZGVmaW5lIGNwdV9oYXNfeGVuX3NtZXAgICAg
ICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9YRU5fU01FUCkKPiAgI2RlZmluZSBjcHVfaGFz
X2xmZW5jZV9kaXNwYXRjaCBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfTEZFTkNFX0RJU1BBVENI
KQo+ICsjZGVmaW5lIGNwdV9oYXNfeGVuX2licGIgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVB
VFVSRV9YRU5fSUJQQikKClVwb24gc2Vjb25kIGxvb2sgSSdtIGFjdHVhbGx5IG5vdCBjb252aW5j
ZWQgdXNpbmcgYSBDUFUgZmVhdHVyZQpmbGFnIGhlcmUgaXMgd2FycmFudGVkOiBZb3UgZG9uJ3Qg
a2V5IGFueSBwYXRjaGluZyBvZmYgb2YgaXQsCnNvIHNpbXBseSBtYWtpbmcgb3B0X2licGIgZ2xv
YmFsIChhbmQgbm9uLWluaXQpIHNob3VsZCBzdWZmaWNlLiBJCmRvIHJlYWxpemUgdGhhdCB0aGlz
IHdvdWxkIG1lYW4gYSBjaGFuZ2UgdG8gYW4gZWFybGllciBwYXRjaC4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
