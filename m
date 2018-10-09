From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 2/2] xen/arm: Add MESON UART driver for
 Amlogic S905 SoC
Date: Tue, 9 Oct 2018 11:25:57 +0100
Message-ID: <8f61a00d-b5e7-6b83-e6e4-1bf2473f4576@arm.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-3-git-send-email-amittomer25@gmail.com>
 <82dda81f-14e1-612f-fe94-5db78c1bd520@arm.com>
 <CABHD4K8zq_yfX4v130tiZMU-Mm4xhCQsuVEYG47U8kdDJ+jkPg@mail.gmail.com>
 <5f06b4fa-a026-8d46-de17-6887db429ae5@arm.com>
 <CABHD4K-zACRqA2mRNnALY3s5ZrReMYe2g67WLf9rA_U8q=wfNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iduh=mv=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g9pDG-00020F-5V
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 10:26:02 +0000
In-Reply-To: <CABHD4K-zACRqA2mRNnALY3s5ZrReMYe2g67WLf9rA_U8q=wfNA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George Dunlap <George.Dunlap@eu.citrix.com>, ian.jackson@eu.citrix.com, tim@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNC8xMC8yMDE4IDA4OjExLCBBbWl0IFRvbWVyIHdyb3RlOgo+Pj4+PiArICAgIHJl
ZyA9IG1lc29uX3M5MDVfcmVhZCh1YXJ0LCBVQVJUX0NPTlRST0wpOwo+Pj4+PiArICAgIHJlZyAm
PSB+KFVBUlRfUlhfUlNUIHwgVUFSVF9UWF9SU1QgfCBVQVJUX0NMRUFSX0VSUik7Cj4+Pj4KPj4+
Pgo+Pj4+IEkgYW0gbm90IHN1cmUgd2h5IHlvdSBhcmUgY2xlYXJpbmcgdGhvc2UgYml0cy4gQUZB
SVUsIGluaXRfcHJlaXJxIHdpbGwgcmVzZXQKPj4+PiB0aGUgc2VyaWFscywgc28geW91IHdhbnQg
dG8gc2V0IHRob3NlcyBiaXRzLiBUaGlzIHNlZW1zIHRvIGJlIGNvbmZpcm1lZCBieQo+Pj4+IExp
bnV4IGluIG1lc29uX3VhcnRfcmVzZXQuCj4+Pgo+Pj4gSWRlYSBoZXJlIGlzIHRvIHNldCB0aGVz
ZSBiaXRzIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzKHdoaWNoIGlzIDAgKSBhbmQgaWYgeW91Cj4+
PiBsb29rIGF0IG90aGVyIGRyaXZlcnMgaW4gWEVOLCBpdCBzZWVtcyB0byBiZSBkb25lIHNhbWUg
dGhpbmcoY2xlYXIKPj4+IHRob3NlIGJpdHMpIHdpdGggdGhlbS4KPj4KPj4gQXJlIHlvdSBzdXJl
IGFib3V0IHRoaXM/IFJYX1JTVCBhbmQgVFhfUlNUIGFyZSBiaXQgdG8gcmVzZXQgdGhlCj4+IHRy
YW5zbWlzc2lvbiBhbmQgcmVjZWl2ZSBwYXRoLiBMb29raW5nIGF0IGEgY291cGxlIG9mIGRpZmZl
cmVudCBkcml2ZXJzCj4+IChjYWNoZS11YXJ0LmMgYW5kIG12ZWJ1LXVhcnQuYyksIHRob3NlIDIg
Yml0cyBhcmUgc2V0IGFuZCBJIHN1c3BlY3QgYmUKPj4gY2xlYXJlZCBieSB0aGUgaGFyZHdhcmUg
b25jZSByZXNldC4KPiAKPiBJdCdzIGJpdCBjb25mdXNpbmcgdG8gbWUsIGV2ZW50dWFsbHkgTGlu
dXggZHJpdmVyIHNlZW1zIHRvIGNsZWFyIHRob3NlIGJpdHMKCkJ1dCBpdCBzZXRzIHRoZW0gcmln
aHQgYmVmb3JlIGhhbmQuIFdoYXQgZG9lcyB0aGUgc3BlYyBzYXlzIGFib3V0IHRob3NlIApiaXRz
PwoKT3ZlcmFsbCwgSSBmZWVscyB0byBtZSBpdCBpcyBiZXR0ZXIgdG8gbWltaWMgdGhlIExpbnV4
IGRyaXZlciBhcyBJIGFtIApxdWl0ZSBjb25maWRlbnQgdGhhdCB0aGUgZHJpdmVyIGlzIGRvaW5n
IHRoZSByaWdodCB0aGluZy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
