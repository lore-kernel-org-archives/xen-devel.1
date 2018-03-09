From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] x86/domctl: remove impossible condition
 in XEN_DOMCTL_getpageframeinfo3
Date: Fri, 9 Mar 2018 16:02:43 +0000
Message-ID: <35524832-2900-6a73-8bf3-1d6a5d92783b@citrix.com>
References: <20180309160116.16298-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180309160116.16298-1-olaf@aepfle.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xen.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDMvMTggMTY6MDEsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IFRoZSB2YWx1ZSBvZiBudW0g
aXMgYWx3YXlzIHRoZSBzYW1lIGFzIGRvbWN0bC0+dS5nZXRwYWdlZnJhbWVpbmZvMy5udW0sCj4g
aXQgd2FzIGFzc2lnbmVkIGp1c3QgYSBmZXcgbGluZXMgYmVmb3JlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgoKVGhpcyBpc24ndCBkZWFkIGNvZGUuwqAg
SXQgaXMgYSB0cnVuY2F0aW9uIGNoZWNrLgoKfkFuZHJldwoKPiAtLS0KPiAgeGVuL2FyY2gveDg2
L2RvbWN0bC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hlbi9h
cmNoL3g4Ni9kb21jdGwuYwo+IGluZGV4IDhmYmJmM2FlYjMuLjQ2ZDI4OGE0OTAgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5j
Cj4gQEAgLTQyMSw4ICs0MjEsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAgICAgICAgIC8q
IEdhbWVzIHRvIGFsbG93IHRoaXMgY29kZSBibG9jayB0byBoYW5kbGUgYSBjb21wYXQgZ3Vlc3Qu
ICovCj4gICAgICAgICAgdm9pZCBfX3VzZXIgKmd1ZXN0X2hhbmRsZSA9IGRvbWN0bC0+dS5nZXRw
YWdlZnJhbWVpbmZvMy5hcnJheS5wOwo+ICAKPiAtICAgICAgICBpZiAoIHVubGlrZWx5KG51bSA+
IDEwMjQpIHx8Cj4gLSAgICAgICAgICAgICB1bmxpa2VseShudW0gIT0gZG9tY3RsLT51LmdldHBh
Z2VmcmFtZWluZm8zLm51bSkgKQo+ICsgICAgICAgIGlmICggdW5saWtlbHkobnVtID4gMTAyNCkg
KQo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgcmV0ID0gLUUyQklHOwo+ICAgICAgICAgICAg
ICBicmVhazsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
