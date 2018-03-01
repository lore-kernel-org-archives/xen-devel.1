From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: get_page_from_gfn() for foreign pages
Date: Thu, 1 Mar 2018 11:39:15 +0000
Message-ID: <0c720c97bfdd476695368cd777576e0d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s+6d=fx=citrix.com=prvs=591d9ebe8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1erMYV-0008Cw-G0
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 11:39:23 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel (xen-devel@lists.xenproject.org)" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2hpbHN0IGRlYnVnZ2luZyBteSBQVi1JT01NVSBjb2RlIEkgcmFuIGludG8gYW4gaXNzdWUgd2l0
aCBnZXRfcGFnZV9mcm9tX2dmbigpOiBJdCBpcyBmYWlsaW5nIHdoZW4gdGhlIGdmbiBpbiBxdWVz
dGlvbiBpcyBhY3R1YWxseSBhIGdyYW50IG1hcCBmcm9tIGFub3RoZXIgZG9tYWluLCBhbmQgdGhl
IHJlYXNvbiBmb3IgdGhpcyBpcyB0aGF0IGdldF9wYWdlKHBhZ2UsIGRvbWFpbikgZXhwbGljaXRs
eSBmYWlscyBpZiB0aGUgcGFnZSBvd25lciBpcyBub3QgdGhlIGRvbWFpbiBzcGVjaWZpZWQgdG8g
dGhlIGNhbGwuIEhvd2V2ZXIsIEkgZmluZCB0aGF0IEFSTSBpbXBsZW1lbnRhdGlvbiBvZiBnZXRf
cGFnZV9mcm9tX2dmbigpIGhhcyBhIHRlc3QgZm9yIGZvcmVpZ24gcDJtIGVudHJpZXMgYW5kIGNv
bXBsZXRlcyBzdWNjZXNzZnVsbHkgKGJ5IGF2b2lkaW5nIGEgY2FsbCB0byBnZXRfcGFnZSgpIGFu
ZCBpbnN0ZWFkIGNhbGxpbmcgcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVyZW5jZSgpIGRpcmVjdGx5
KS4KCkkgY2FuJ3QgdGhpbmsgb2YgYW55IHBhcnRpY3VsYXIgcmVhc29uIHdoeSwgb24geDg2LCBn
ZXRfcGFnZV9mcm9tX2dmbigpIHNob3VsZCBub3Qgd29yayBmb3IgZm9yZWlnbiBtYXBwZWQgb3Ig
Z3JhbnQgbWFwcGVkIHBhZ2VzLiBEb2VzIGFueW9uZSBrbm93IHdoeSB0aGUgcmVzdHJpY3Rpb24g
aXMgdGhlcmU/CgogIENoZWVycywKCiAgICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
