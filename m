From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/6] add check to cpumask_of()
Date: Fri, 19 Jan 2018 17:43:00 +0000
Message-ID: <ed869af3-3cd9-5f3f-8226-afbbbe392dab@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A62252102000078001A078E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rwd1=eo=citrix.com=prvs=5503b2e3b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ecawu-00009o-5y
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 17:59:32 +0000
In-Reply-To: <5A62252102000078001A078E@prv-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDEvMTggMTY6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEp1c3QgbGlrZSBhbnkgb3Ro
ZXIgZnVuY3Rpb24ncyBDUFUgaW5wdXRzLCB0aGUgb25lIGhlcmUgc2hvdWxkbid0IGdvCj4gdW5j
aGVja2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NwdW1hc2suaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9jcHVtYXNrLmgKPiBAQCAtMzA0LDcgKzMwNCw5IEBAIGV4dGVybiBjb25zdCB1bnNpZ25l
ZCBsb25nCj4gIAo+ICBzdGF0aWMgaW5saW5lIGNvbnN0IGNwdW1hc2tfdCAqY3B1bWFza19vZih1
bnNpZ25lZCBpbnQgY3B1KQo+ICB7Cj4gLQljb25zdCB1bnNpZ25lZCBsb25nICpwID0gY3B1X2Jp
dF9iaXRtYXBbMSArIGNwdSAlIEJJVFNfUEVSX0xPTkddOwo+ICsJY29uc3QgdW5zaWduZWQgbG9u
ZyAqcCA9IGNwdV9iaXRfYml0bWFwWzEgKyBjcHVtYXNrX2NoZWNrKGNwdSkgJQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUU19QRVJfTE9O
R107Cj4gKwo+ICAJcmV0dXJuIChjb25zdCBjcHVtYXNrX3QgKikocCAtIGNwdSAvIEJJVFNfUEVS
X0xPTkcpOwo+ICB9CgpUaGlzIHdvdWxkIGJlIHNsaWdodGx5IGVhc2llciB0byByZWFkIGFzCgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2NwdW1hc2suaCBiL3hlbi9pbmNsdWRlL3hlbi9j
cHVtYXNrLmgKaW5kZXggM2YzNDBkNi4uNzUwN2FlOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2NwdW1hc2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1bWFzay5oCkBAIC0zMDQsNyAr
MzA0LDkgQEAgZXh0ZXJuIGNvbnN0IHVuc2lnbmVkIGxvbmcKwqAKwqBzdGF0aWMgaW5saW5lIGNv
bnN0IGNwdW1hc2tfdCAqY3B1bWFza19vZih1bnNpZ25lZCBpbnQgY3B1KQrCoHsKLcKgwqDCoMKg
wqDCoCBjb25zdCB1bnNpZ25lZCBsb25nICpwID0gY3B1X2JpdF9iaXRtYXBbMSArIGNwdSAlIEJJ
VFNfUEVSX0xPTkddOworwqDCoMKgwqDCoMKgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKnAgPQorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjcHVfYml0X2JpdG1hcFsxICsgY3B1bWFza19jaGVjayhjcHUp
ICUgQklUU19QRVJfTE9OR107CisKwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChjb25zdCBjcHVtYXNr
X3QgKikocCAtIGNwdSAvIEJJVFNfUEVSX0xPTkcpOwrCoH0KwqAKCk90aGVyd2lzZSwgUmV2aWV3
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
