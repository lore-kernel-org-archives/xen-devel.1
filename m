From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH L1TF v8 1/9] xen/evtchn: block speculative
 out-of-bound accesses
Date: Mon, 25 Feb 2019 21:02:32 +0100
Message-ID: <6c404b29-fe3b-e3a2-a3ad-fbb9a75351a9@suse.com>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
 <1551101683-996-2-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gyMTR-0000dL-3e
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 20:03:37 +0000
In-Reply-To: <1551101683-996-2-git-send-email-nmanthey@amazon.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDIvMjAxOSAxNDozNCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IEd1ZXN0cyBjYW4g
aXNzdWUgZXZlbnQgY2hhbm5lbCBpbnRlcmFjdGlvbiB3aXRoIGd1ZXN0IHNwZWNpZmllZCBkYXRh
Lgo+IFRvIGF2b2lkIHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3Nlcywgd2UgdXNlIHRo
ZSBub3NwZWMgbWFjcm9zLAo+IG9yIHRoZSBkb21haW5fdmNwdSBmdW5jdGlvbi4gV2hlcmUgYXBw
cm9wcmlhdGUsIHdlIHVzZSB0aGUgdmNwdV9pZCBvZgo+IHRoZSBzZWxlY2V0ZWQgdmNwdSBpbnN0
ZWFkIG9mIHRoZSBwYXJhbWV0ZXIgdGhhdCBjYW4gYmUgaW5mbHVlbmNlZCBieQo+IHRoZSBndWVz
dCwgc28gdGhhdCBvbmx5IG9uZSBhY2Nlc3MgbmVlZHMgdG8gYmUgcHJvdGVjdGVkLgo+IAo+IFRo
aXMgaXMgcGFydCBvZiB0aGUgc3BlY3VsYXRpdmUgaGFyZGVuaW5nIGVmZm9ydC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
