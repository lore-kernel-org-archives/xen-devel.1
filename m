From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v4 00/20] x86: emulator enhancements
Date: Wed, 28 Feb 2018 05:50:49 -0700
Message-ID: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er1CF-0000Ek-IU
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 12:50:59 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MDE6IGV4dGVuZCB2YnJvYWRjYXN0c3tzLGR9IHRvIEFWWDIKMDI6IHN1cHBvcnQgbW9zdCByZW1h
aW5pbmcgQVZYMiBpbnNucwowMzogc3VwcG9ydCBBVlgyIGdhdGhlciBpbnNucwowNDogc3VwcG9y
dCBYT1AgaW5zbnMKMDU6IHN1cHBvcnQgM0ROb3chIGluc25zCjA2OiBwbGFjZSB0ZXN0IGJsb2Jz
IGluIGV4ZWN1dGFibGUgc2VjdGlvbgowNzogbW92ZSBhbmQgcmVuYW1lIFhTVEFURV8qCjA4OiBh
YnN0cmFjdCBvdXQgWENSbiBhY2Nlc3NlcwowOTogYWRqdXN0X2JuZCgpIHNob3VsZCBjaGVjayBY
Q1IwCjEwOiBtYWtlIGFsbCBGUFUgZW11bGF0aW9uIHVzZSB0aGUgc3R1YgoxMTogZWxpbWluYXRl
IGN1c3RvbSAjTUYvI1hNIGhhbmRsaW5nCjEyOiBzdXBwb3J0IFNXQVBHUwoxMzogdGVsbCBjbXB4
Y2hnIGhvb2sgd2hldGhlciBMT0NLIGlzIGluIGVmZmVjdAoxNDogY29udmVydCBwYWdlIHRhYmxl
IGVtdWxhdGlvbiBjb2RlIGZyb20gcGFkZHJfdCB0byBpbnRwdGVfdAoxNTogY29ycmVjdGx5IGhh
bmRsZSBDTVBYQ0hHKiBjb21wYXJpc29uIGZhaWx1cmVzCjE2OiBhZGQgcmVhZC1tb2RpZnktd3Jp
dGUgaG9vawoxNzogeDg2L0hWTTogZG8gYWN0dWFsIENNUFhDSEcgaW4gaHZtZW11bF9jbXB4Y2hn
KCkKMTg6IHg4Ni9IVk06IG1ha2UgdXNlIG9mIG5ldyByZWFkLW1vZGlmeS13cml0ZSBlbXVsYXRv
ciBob29rCjE5OiB4ODYvc2hhZG93OiBmdWxseSBtb3ZlIHVubWFwLWRlc3QgaW50byBjb21tb24g
Y29kZQoyMDogeDg2L3NoYWRvdzogZm9sZCBzaF94ODZfZW11bGF0ZV97d3JpdGUsY21weGNoZ30o
KSBpbnRvIHRoZWlyIG9ubHkgY2FsbGVycwoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKdjQ6IEEgZmV3IHBhdGNoIHNwbGl0czsgcmV2aWV3IGNvbW1lbnRz
IGFuZCB0YWdzIGFkZGVkLgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
