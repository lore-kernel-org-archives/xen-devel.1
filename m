From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] x86/shutdown: Use ACPI reboot method for
 Dell PowerEdge R740
Date: Tue, 23 Jan 2018 16:05:06 +0000
Message-ID: <fe725c6f-5ea3-568f-1c8c-95f310338991@citrix.com>
References: <20180119165711.16615-1-ross.lagerwall@citrix.com>
 <5A65E74E02000078001A1062@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3fqo=es=citrix.com=prvs=55476ae8b=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1ee155-0003CQ-2I
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 16:05:51 +0000
In-Reply-To: <5A65E74E02000078001A1062@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjIvMjAxOCAxMjoyOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMDEu
MTggYXQgMTc6NTcsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L3NodXRkb3duLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3NodXRkb3duLmMK
Pj4gQEAgLTUxMSw2ICs1MTEsMTUgQEAgc3RhdGljIHN0cnVjdCBkbWlfc3lzdGVtX2lkIF9faW5p
dGRhdGEgcmVib290X2RtaV90YWJsZVtdID0gewo+PiAgICAgICAgICAgICAgIERNSV9NQVRDSChE
TUlfUFJPRFVDVF9OQU1FLCAiTGF0aXR1ZGUgRTY1MjAiKSwKPj4gICAgICAgICAgIH0sCj4+ICAg
ICAgIH0sCj4+ICsgICAgeyAgICAvKiBIYW5kbGUgcHJvYmxlbXMgd2l0aCByZWJvb3Rpbmcgb24g
RGVsbCBQb3dlckVkZ2UgUjc0MC4gKi8KPj4gKyAgICAgICAgLmNhbGxiYWNrID0gb3ZlcnJpZGVf
cmVib290LAo+PiArICAgICAgICAuZHJpdmVyX2RhdGEgPSAodm9pZCAqKShsb25nKUJPT1RfQUNQ
SSwKPj4gKyAgICAgICAgLmlkZW50ID0gIkRlbGwgUG93ZXJFZGdlIFI3NDAiLAo+PiArICAgICAg
ICAubWF0Y2hlcyA9IHsKPj4gKyAgICAgICAgICAgIERNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwg
IkRlbGwgSW5jLiIpLAo+PiArICAgICAgICAgICAgRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUs
ICJQb3dlckVkZ2UgUjc0MCIpLAo+PiArICAgICAgICB9LAo+PiArICAgIH0sCj4gCj4gSnVkZ2lu
ZyBmcm9tIHRoZSBkZXNjcmlwdGlvbiB5b3UgZG9uJ3QgcmVhbGx5IHdhbnQgb3IgbmVlZCB0bwo+
IG92ZXJyaWRlIHRoZSByZWJvb3QgbWV0aG9kIGlmIG5vdCBydW5uaW5nIHVuZGVyIEVGSSwgb3Ig
aWYgdGhlcmUKPiB3YXMgYW4gb3ZlcnJpZGUgb24gdGhlIGNvbW1hbmQgbGluZSBhbHJlYWR5LiBv
dmVycmlkZV9yZWJvb3QoKSwKPiBob3dldmVyLCBvdmVycmlkZXMgZXZlcnl0aGluZyBhbmQgdW5k
ZXIgYWxsIGNpcmN1bXN0YW5jZXMuIEkKPiB0aGVyZWZvcmUgdGhpbmsgeW91IG1heSB3YW50IHRv
IGludHJvZHVjZSBhIG5ldyBjYWxsYmFjawo+IGZ1bmN0aW9uLgoKQWdyZWVkLCBpdCBzaG91bGQg
b25seSBhcHBseSB3aGVuIHJ1bm5pbmcgdW5kZXIgRUZJLiBOb3RlIHRoYXQgdGhlIApjb21tYW5k
LWxpbmUgdGFrZXMgcHJpb3JpdHkgb3ZlciBvdmVycmlkZV9yZWJvb3QoKSAtLSBzZWUgdGhlIG5v
dGUgYXQgCnRoZSBzdGFydCBvZiByZWJvb3RfaW5pdCgpLgoKPiAKPiBBcyBhbiBhc2lkZSAtIGhv
dyBjb21lIHRoZSBwYWdlIGF0IGFkZHJlc3MgemVybyBpcyBhY3R1YWxseQo+IG1hcHBlZCBhdCB0
aGUgdGltZSBvZiB0aGUgcmVib290IGF0dGVtcHQ/Cj4gCgpObyBpZGVhLi4uCgotLSAKUm9zcyBM
YWdlcndhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
