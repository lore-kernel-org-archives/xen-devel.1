From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 10/11] x86/hvm/hpet: block
 speculative out-of-bound accesses
Date: Fri, 25 Jan 2019 09:50:10 -0700
Message-ID: <5C4B3E4202000078002113B4@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244655-32180-10-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gn4gJ-0003f0-PB
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 16:50:15 +0000
In-Reply-To: <1548244655-32180-10-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE5IGF0IDEyOjU3LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBX
aGVuIGludGVyYWN0aW5nIHdpdGggaHBldCwgcmVhZCBhbmQgd3JpdGUgb3BlcmF0aW9ucyBjYW4g
YmUgZXhlY3V0ZWQKPiBkdXJpbmcgaW5zdHJ1Y3Rpb24gZW11bGF0aW9uLCB3aGVyZSB0aGUgZ3Vl
c3QgY29udHJvbHMgdGhlIGRhdGEgdGhhdAo+IGlzIHVzZWQuIEFzIGl0IGlzIGhhcmQgdG8gcHJl
ZGljdCB0aGUgbnVtYmVyIG9mIGluc3RydWN0aW9ucyB0aGF0IGFyZQo+IGV4ZWN1dGVkIHNwZWN1
bGF0aXZlbHksIHdlIHByZXZlbnQgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGJ5IHVzaW5nIHRoZQo+
IGFycmF5X2luZGV4X25vc3BlYyBmdW5jdGlvbiBmb3IgZ3Vlc3Qgc3BlY2lmaWVkIGFkZHJlc3Nl
cyB0aGF0IHNob3VsZAo+IGJlIHVzZWQgZm9yIGhwZXQgb3BlcmF0aW9ucy4KPiAKPiBUaGlzIGNv
bW1pdCBpcyBwYXJ0IG9mIHRoZSBTcGVjdHJlVjErTDFURiBtaXRpZ2F0aW9uIHBhdGNoIHNlcmll
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5k
ZT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggb25l
IGZ1cnRoZXIgcmVtYXJrOgoKPiBAQCAtNTIzLDcgKzUyNiw3IEBAIHN0YXRpYyBpbnQgaHBldF93
cml0ZSgKPiAgICAgIGNhc2UgSFBFVF9Ubl9ST1VURSgwKToKPiAgICAgIGNhc2UgSFBFVF9Ubl9S
T1VURSgxKToKPiAgICAgIGNhc2UgSFBFVF9Ubl9ST1VURSgyKToKPiAtICAgICAgICB0biA9IEhQ
RVRfVE4oUk9VVEUsIGFkZHIpOwo+ICsgICAgICAgIHRuID0gYXJyYXlfaW5kZXhfbm9zcGVjKEhQ
RVRfVE4oUk9VVEUsIGFkZHIpLCBBUlJBWV9TSVpFKGgtPmhwZXQudGltZXJzKSk7Cj4gICAgICAg
ICAgaC0+aHBldC50aW1lcnNbdG5dLmZzYiA9IG5ld192YWw7Cj4gICAgICAgICAgYnJlYWs7CgpU
aGlzIG9uZSwgdW5saWtlIHRoZSBvdGhlciB0d28gaW4gdGhpcyBmdW5jdGlvbiwgd291bGQgYmUg
YSBmYWlyCmNhbmRpZGF0ZSBmb3IgdXNlIG9mIGFycmF5X2FjY2Vzc19ub3NwZWMoKSAtIHRuIGlz
IHVzZWQganVzdApvbmNlIGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
