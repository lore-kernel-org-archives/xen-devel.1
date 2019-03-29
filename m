From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 08/49] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Fri, 29 Mar 2019 18:42:53 +0000
Message-ID: <4570eeac-64a8-f424-28df-883347c69f15@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-9-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vMr=SA=citrix.com=prvs=9848b938e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9wSx-0000HC-5v
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 18:42:59 +0000
In-Reply-To: <20190329150934.17694-9-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxNTowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4gaW5kZXggNmI1
ZDQ1NDYzMC4uZDFhOTU4MTQzYSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMK
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMjU2LDYgKzI1Niw3IEBAIHN0YXRp
YyB2b2lkIHNjaGVkX3NwaW5fdW5sb2NrX2RvdWJsZShzcGlubG9ja190ICpsb2NrMSwgc3Bpbmxv
Y2tfdCAqbG9jazIsCj4gIGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2ln
bmVkIGludCBwcm9jZXNzb3IpCj4gIHsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21h
aW47Cj4gKyAgICBzdHJ1Y3Qgc2NoZWRfaXRlbSBpdGVtID0geyAudmNwdSA9IHYgfTsKPiAgCj4g
ICAgICB2LT5wcm9jZXNzb3IgPSBwcm9jZXNzb3I7Cj4gIAo+IEBAIC0yNjcsNyArMjY4LDcgQEAg
aW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHByb2Nlc3Nv
cikKPiAgICAgIGluaXRfdGltZXIoJnYtPnBvbGxfdGltZXIsIHBvbGxfdGltZXJfZm4sCj4gICAg
ICAgICAgICAgICAgIHYsIHYtPnByb2Nlc3Nvcik7Cj4gIAo+IC0gICAgdi0+c2NoZWRfcHJpdiA9
IFNDSEVEX09QKGRvbV9zY2hlZHVsZXIoZCksIGFsbG9jX3ZkYXRhLCB2LAo+ICsgICAgdi0+c2No
ZWRfcHJpdiA9IFNDSEVEX09QKGRvbV9zY2hlZHVsZXIoZCksIGFsbG9jX3ZkYXRhLCAmaXRlbSwK
PiAgICAgICAgICAgICAgICAgICAgICAgZC0+c2NoZWRfcHJpdik7CgpJIHJlYWxpc2UgdGhpcyBp
cyBwZXJoYXBzIGFuIG92ZXItdGhlLXRvcCByZXF1ZXN0LCBidXQgY2FuIHdlIHNlZSBhYm91dApk
b2luZyBtb3JlIGhlcmU/CgpTQ0hFRF9PUCgpIGlzIGEgdGhvcm91Z2hseSBvYmplY3Rpb25hYmxl
IHBpZWNlIG9mIG9iZnVzY2F0aW9uLCB3aGljaApicmVha3MgY3Njb3BlL2N0YWdzIGFuZCBhbHNv
IHJlc3VsdHMgaW4gZXNwZWNpYWxseSBwb29yIGNvZGUgZ2VuZXJhdGlvbi4KCkdpdmVuIHRoYXQg
d2UgYXJlIGNoYW5naW5nIHRoZSBpbnRlcmZhY2UgYW55d2F5IGFuZCB0b3VjaGluZyBhbGwKY29k
ZXBhdGhzLCB3b3VsZCB5b3UgbWluZCBhbHNvIGFkZGluZyBzdGF0aWMgaW5saW5lIHdyYXBwZXJz
IGxpa2UgSQpzdGFydGVkIHdpdGggMzQwZWRjMyA/CgpUQkgsIEknbSBldmVuIGhhcHB5IHRvIGdp
dmUgdGhpcyBhIGdvIGFuZCBnaXZlIHlvdSB0aGUgYmFjayB0aGUKcmVzdWx0aW5nIHRyZWUsIGlm
IHlvdSdkIHByZWZlci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
