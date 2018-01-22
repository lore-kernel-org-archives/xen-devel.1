From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/shutdown: Use ACPI reboot method for
 Dell PowerEdge R740
Date: Mon, 22 Jan 2018 05:29:50 -0700
Message-ID: <5A65E74E02000078001A1062@prv-mh.provo.novell.com>
References: <20180119165711.16615-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edbEe-0007cO-M0
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 12:30:00 +0000
In-Reply-To: <20180119165711.16615-1-ross.lagerwall@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE3OjU3LCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NodXRkb3duLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
c2h1dGRvd24uYwo+IEBAIC01MTEsNiArNTExLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgZG1pX3N5c3Rl
bV9pZCBfX2luaXRkYXRhIHJlYm9vdF9kbWlfdGFibGVbXSA9IHsKPiAgICAgICAgICAgICAgRE1J
X01BVENIKERNSV9QUk9EVUNUX05BTUUsICJMYXRpdHVkZSBFNjUyMCIpLAo+ICAgICAgICAgIH0s
Cj4gICAgICB9LAo+ICsgICAgeyAgICAvKiBIYW5kbGUgcHJvYmxlbXMgd2l0aCByZWJvb3Rpbmcg
b24gRGVsbCBQb3dlckVkZ2UgUjc0MC4gKi8KPiArICAgICAgICAuY2FsbGJhY2sgPSBvdmVycmlk
ZV9yZWJvb3QsCj4gKyAgICAgICAgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikobG9uZylCT09UX0FD
UEksCj4gKyAgICAgICAgLmlkZW50ID0gIkRlbGwgUG93ZXJFZGdlIFI3NDAiLAo+ICsgICAgICAg
IC5tYXRjaGVzID0gewo+ICsgICAgICAgICAgICBETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJE
ZWxsIEluYy4iKSwKPiArICAgICAgICAgICAgRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJQ
b3dlckVkZ2UgUjc0MCIpLAo+ICsgICAgICAgIH0sCj4gKyAgICB9LAoKSnVkZ2luZyBmcm9tIHRo
ZSBkZXNjcmlwdGlvbiB5b3UgZG9uJ3QgcmVhbGx5IHdhbnQgb3IgbmVlZCB0bwpvdmVycmlkZSB0
aGUgcmVib290IG1ldGhvZCBpZiBub3QgcnVubmluZyB1bmRlciBFRkksIG9yIGlmIHRoZXJlCndh
cyBhbiBvdmVycmlkZSBvbiB0aGUgY29tbWFuZCBsaW5lIGFscmVhZHkuIG92ZXJyaWRlX3JlYm9v
dCgpLApob3dldmVyLCBvdmVycmlkZXMgZXZlcnl0aGluZyBhbmQgdW5kZXIgYWxsIGNpcmN1bXN0
YW5jZXMuIEkKdGhlcmVmb3JlIHRoaW5rIHlvdSBtYXkgd2FudCB0byBpbnRyb2R1Y2UgYSBuZXcg
Y2FsbGJhY2sKZnVuY3Rpb24uCgpBcyBhbiBhc2lkZSAtIGhvdyBjb21lIHRoZSBwYWdlIGF0IGFk
ZHJlc3MgemVybyBpcyBhY3R1YWxseQptYXBwZWQgYXQgdGhlIHRpbWUgb2YgdGhlIHJlYm9vdCBh
dHRlbXB0PwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
