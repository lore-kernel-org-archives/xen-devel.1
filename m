From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 57/62] platforms: Honour suite in
 get_arch_platforms
Date: Wed, 10 Apr 2019 15:24:03 +0100
Message-ID: <20190410142408.22848-58-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAc-00078w-GP
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:46 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGF2YWlsYWJsZSBwbGF0Zm9ybXMgbWF5IGRlcGVuZCBvbiB0aGUgc3VpdGUgdG8gYmUgdXNl
ZC4KCkFjdHVhbGx5IGltcGxlbWVudCB0aGF0IGZvciBIb3N0REI6OkV4ZWN1dGl2ZS4KRm9yIFN0
YXRpYywgd2UgbGVhdmUgaXQgdG8gdGhlIHVzZXIuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0hvc3REQi9FeGVjdXRp
dmUucG0gfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0gYi9Pc3N0
ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0KaW5kZXggYmY2ZWM1N2QuLjdmZmNhNmM0IDEwMDY0NAot
LS0gYS9Pc3N0ZXN0L0hvc3REQi9FeGVjdXRpdmUucG0KKysrIGIvT3NzdGVzdC9Ib3N0REIvRXhl
Y3V0aXZlLnBtCkBAIC05OSwxOCArOTksMjAgQEAgU0VMRUNUIERJU1RJTkNUIGhvc3RmbGFnCiAg
ICAgICAgICAgIEZST00gaG9zdGZsYWdzIGgwCiAgICBXSEVSRSBFWElTVFMgKAogICAgICAgIFNF
TEVDVCAqCi0gICAgICAgICBGUk9NIGhvc3RmbGFncyBoMSwgaG9zdGZsYWdzIGgyLCBob3N0Zmxh
Z3MgaDMKKyAgICAgICAgIEZST00gaG9zdGZsYWdzIGgxLCBob3N0ZmxhZ3MgaDIsIGhvc3RmbGFn
cyBoMywgaG9zdGZsYWdzIGg0CiAgICAgICAgIFdIRVJFIGgwLmhvc3RuYW1lID0gaDEuaG9zdG5h
bWUKICAgICAgICAgICBBTkQgaDEuaG9zdG5hbWUgPSBoMi5ob3N0bmFtZQogICAgICAgICAgIEFO
RCBoMi5ob3N0bmFtZSA9IGgzLmhvc3RuYW1lCisgICAgICAgICAgQU5EIGgzLmhvc3RuYW1lID0g
aDQuaG9zdG5hbWUKICAgICAgICAgICBBTkQgaDEuaG9zdGZsYWcgPSA/CiAgICAgICAgICAgQU5E
IGgyLmhvc3RmbGFnID0gPwogICAgICAgICAgIEFORCBoMy5ob3N0ZmxhZyA9ICdwdXJwb3NlLXRl
c3QnCisgICAgICAgICAgQU5EIGg0Lmhvc3RmbGFnID0gPwogICAgKQogICAgQU5EIGhvc3RmbGFn
IGxpa2UgJ3BsYXRmb3JtLSUnOwogRU5ECiAKLSAgICAkcGxhdHNxLT5leGVjdXRlKCJibGVzc2Vk
LSRibGVzc2luZyIsICJhcmNoLSRhcmNoIik7CisgICAgJHBsYXRzcS0+ZXhlY3V0ZSgiYmxlc3Nl
ZC0kYmxlc3NpbmciLCAiYXJjaC0kYXJjaCIsICJzdWl0ZS0kc3VpdGUiKTsKIAogICAgIHdoaWxl
IChteSAoJHBsYXQpID0gJHBsYXRzcS0+ZmV0Y2hyb3dfYXJyYXkoKSkgewogCSRwbGF0ID1+IHMv
XnBsYXRmb3JtLS8vZyBvciBkaWU7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
