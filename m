From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 9/9] x86: move declaration of
 arch_set_info_hvm_guest and provide stub
Date: Tue, 07 Aug 2018 05:46:06 -0600
Message-ID: <5B69867E02000078001DB851@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <db8890926bbfd8ac9381eb767d1bff362bcaf9c0.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fn0RI-00075V-KV
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 11:46:12 +0000
In-Reply-To: <db8890926bbfd8ac9381eb767d1bff362bcaf9c0.1533636027.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS9kb21haW4uaAo+IEBAIC0zNCw2ICszNCw3IEBACj4gICNpbmNsdWRlIDxw
dWJsaWMvaHZtL3NhdmUuaD4KPiAgI2luY2x1ZGUgPHB1YmxpYy9odm0vaHZtX29wLmg+Cj4gICNp
bmNsdWRlIDxwdWJsaWMvaHZtL2RtX29wLmg+Cj4gKyNpbmNsdWRlIDxwdWJsaWMvaHZtL2h2bV92
Y3B1Lmg+CgpXaHk/IHN0cnVjdCB2Y3B1X2h2bV9jb250ZXh0IG9ubHkgbmVlZHMgYSBmb3J3YXJk
IGRlY2xhcmF0aW9uLCBqdXN0Cmxpa2Ugd2FzIHRoZSBjYXNlIG9yaWdpbmFsbHkuIEZ1bGwgc3Ry
dWN0dXJlL3VuaW9uIGRlZmluaXRpb25zIGFyZSBuZWVkZWQKb25seSBpZiB5b3UgZGUtcmVmZXJl
bmNlIHRoZSB0eXBlLCBpbnN0YW50aWF0ZSBpdCwgb3IgYXBwbHkgc2l6ZW9mKCkgYW5kCmFsaWtl
IHRvIGl0LgoKSW4gZmFjdCBJIHN1c3BlY3Qgd2UgY291bGQgcmVkdWNlIGhlYWRlciBkZXBlbmRl
bmNpZXMgcXVpdGUgYSBiaXQgaWYKd2UgZm9sbG93ZWQgdGhhdCBtb2RlbCBtb3JlIHdpZGVseS4K
Cj4gQEAgLTIwNCw2ICsyMDUsMjIgQEAgc3RydWN0IGh2bV9kb21haW4gewo+ICAKPiAgI2RlZmlu
ZSBoYXBfZW5hYmxlZChkKSAgKChkKS0+YXJjaC5odm1fZG9tYWluLmhhcF9lbmFibGVkKQo+ICAK
PiArI2lmIENPTkZJR19IVk0KPiArCj4gK2ludCBhcmNoX3NldF9pbmZvX2h2bV9ndWVzdChzdHJ1
Y3QgdmNwdSAqdiwgY29uc3Qgc3RydWN0IHZjcHVfaHZtX2NvbnRleHQgKmN0eCk7Cj4gKwo+ICsj
ZWxzZQo+ICsKPiArI2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+ICsKPiArc3RhdGljIGlubGluZQo+
ICtpbnQgYXJjaF9zZXRfaW5mb19odm1fZ3Vlc3Qoc3RydWN0IHZjcHUgKnYsIGNvbnN0IHN0cnVj
dCB2Y3B1X2h2bV9jb250ZXh0ICpjdHgpCj4gK3sKPiArICAgIHJldHVybiAtRUlOVkFMOwo+ICt9
Cj4gKwo+ICsjZW5kaWYKCkFsbCB1c2VzIHNpdCBlaXRoZXIgaW4gSFZNLXNwZWNpZmljIGNvZGUg
b3IgaW5zaWRlIGlzX2h2bV8uLi4oKQpjb25kaXRpb25hbHM6IFdoeSBkbyB3ZSBuZWVkIHRoZSBp
bmxpbmUgc3R1Yj8gSWYgdGhlIGRlY2xhcmF0aW9uCndhcyB2aXNpYmxlIGluZGVwZW5kZW50IG9m
IENPTkZJR19IVk0sIGNvZGUgd291bGQgY29tcGlsZQpmaW5lLCBhbmQgcmVmZXJlbmNlcyB0byB0
aGUgZnVuY3Rpb24gd291bGQgYmUgcmVtb3ZlZCBieSB0aGUKY29tcGlsZXIsIHNvIGxpbmtpbmcg
d291bGQgYWxzbyBzdWNjZWVkIGRlc3BpdGUgdGhlcmUgbm90IGJlaW5nCmFueSBkZWZpbml0aW9u
IG9mIHRoZSBmdW5jdGlvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
