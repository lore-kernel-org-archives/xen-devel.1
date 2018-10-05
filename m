From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] fix uninitialized variable error in
 do_poll()
Date: Fri, 5 Oct 2018 11:28:55 +0100
Message-ID: <20181005102855.vldsq4kolbs2diuy@zion.uk.xensource.com>
References: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qudt=mr=citrix.com=prvs=80982b68a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g8NLw-0000ee-C4
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 10:29:00 +0000
Content-Disposition: inline
In-Reply-To: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDQ6MTI6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTm93IHRoYXQgQ09ORklHX0hWTSBjYW4gKGFuZCBzaG91bGQpIGJlIHR1cm5lZCBvZmYg
Zm9yIHRoZSBzaGltLCBnY2MgOC4yCj4gYXBwYXJlbnRseSBpcyBubyBsb25nZXIgc3VyZSB0aGF0
ICJwb3J0IiBpcyBpbmRlZWQgaW5pdGlhbGl6ZWQgYXQKPiAKPiAgICAgaWYgKCBzY2hlZF9wb2xs
LT5ucl9wb3J0cyA9PSAxICkKPiAgICAgICAgIHYtPnBvbGxfZXZ0Y2huID0gcG9ydDsKPiAKPiBJ
dCBkb2Vzbid0IGxvb2sgdG8gYmUgaW1wb3NzaWJsZSBmb3IgdGhlIGNvbXBpbGVyIHRvIHByb3Zl
IGl0IGlzIG5vdCwKPiBidXQgd2UgYWxzbyBjYW4ndCByZWx5IG9uIHRoYXQgdG8gYmUgdGhlIGNh
c2UuIEFkZCBhbiBpbml0aWFsaXplci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpUQkggSSBmYWlsIHRvIHNlZSBob3cgQ09ORklHX0hWTSB3b3Vs
ZCBhZmZlY3QgZG9fcG9sbC4gQWxzbyB0aGVyZSBpcwphbHJlYWR5IGJ1aWxkIHRlc3Qgd2l0aCBn
Y2MgOC4yIHdoaWNoIG5ldmVyIGRpc2NvdmVyZWQgdGhlIGlzc3VlIHlvdQpkZXNjcmliZWQuCgpU
aGUgY29kZSBpbiB0aGlzIHBhdGNoIGlzIHRyaXZpYWxseSBjb3JyZWN0LCBidXQgSSB0aGluayB0
aGUgY29tbWl0Cm1lc3NhZ2Ugc2hvdWxkIGJlIG1vcmUgc3RyYWlnaHRmb3J3YXJkLgoKV2VpLgoK
PiAKPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKPiBAQCAtMTAxNCw3ICsxMDE0LDcgQEAgc3RhdGljIGxvbmcgZG9fcG9sbChzdHJ1Y3Qg
c2NoZWRfcG9sbCAqcwo+ICB7Cj4gICAgICBzdHJ1Y3QgdmNwdSAgICp2ID0gY3VycmVudDsKPiAg
ICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47Cj4gLSAgICBldnRjaG5fcG9ydF90ICBw
b3J0Owo+ICsgICAgZXZ0Y2huX3BvcnRfdCAgcG9ydCA9IDA7Cj4gICAgICBsb25nICAgICAgICAg
ICByYzsKPiAgICAgIHVuc2lnbmVkIGludCAgIGk7Cj4gIAo+IAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
