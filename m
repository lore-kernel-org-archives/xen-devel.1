From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Tue, 26 Feb 2019 10:14:20 +0100
Message-ID: <20190226091420.klgldhotiecezw6h__8028.23338178627$1551172623$gmane$org@Air-de-Roger>
References: <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <f7e78bf6-6e65-6d6c-c1ad-dca7f1e66b17@gmail.com>
 <fe44917f-bbe9-3e0e-fdda-2eb4db9f25c2@arm.com>
 <13a9616c-2d9a-f90b-3358-f2dcadbbb64d@gmail.com>
 <dbfd87e9-48fc-f641-9e24-ddb6c4f61135@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNg/=RB=citrix.com=prvs=953f30066=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gyYq6-0000xN-Ae
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 09:15:50 +0000
Content-Disposition: inline
In-Reply-To: <dbfd87e9-48fc-f641-9e24-ddb6c4f61135@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dave P Martin <Dave.Martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjUsIDIwMTkgYXQgMDE6NTU6NDJQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIE9sZWtzYW5kciwKPiAKPiBPbiAyNS8wMi8yMDE5IDEzOjI0LCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyB3cm90ZToKPiA+IE9uIDIvMjIvMTkgMzozMyBQTSwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDIyLzAyLzIwMTkgMTI6MzgsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+ID4gPiA+IE9uIDIvMjAvMTkgMTA6NDYgUE0sIEp1
bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+IERpc2N1c3Npbmcgd2l0aCBteSB0ZWFtLCBhIHNv
bHV0aW9uIHRoYXQgY2FtZSB1cCB3b3VsZCBiZSB0bwo+ID4gPiA+ID4gaW50cm9kdWNlIG9uZSBh
dG9taWMgZmllbGQgcGVyIGV2ZW50IHRvIHJlY29yZCB0aGUgbnVtYmVyIG9mCj4gPiA+ID4gPiBl
dmVudCByZWNlaXZlZC4gSSB3aWxsIGV4cGxvcmUgdGhhdCBzb2x1dGlvbiB0b21vcnJvdy4KPiA+
ID4gPiBIb3cgd2lsbCB0aGlzIGhlbHAgaWYgZXZlbnRzIGhhdmUgc29tZSBwYXlsb2FkPwo+ID4g
PiAKPiA+ID4gV2hhdCBwYXlsb2FkPyBUaGUgZXZlbnQgY2hhbm5lbCBkb2VzIG5vdCBjYXJyeSBh
bnkgcGF5bG9hZC4gSXQgb25seQo+ID4gPiBub3RpZnkgeW91IHRoYXQgc29tZXRoaW5nIGhhcHBl
bi4gVGhlbiB0aGlzIGlzIHVwIHRvIHRoZSB1c2VyIHRvCj4gPiA+IGRlY2lkZSB3aGF0IHRvIHlv
dSB3aXRoIGl0Lgo+ID4gU29ycnksIEkgd2FzIHByb2JhYmx5IG5vdCBwcmVjaXNlIGVub3VnaC4g
SSBtZWFuIHRoYXQgYW4gZXZlbnQgbWlnaHQgaGF2ZQo+ID4gYXNzb2NpYXRlZCBwYXlsb2FkIGlu
IHRoZSByaW5nIGJ1ZmZlciwgZm9yIGV4YW1wbGUgWzFdLiBTbywgY291bnRpbmcgZXZlbnRzCj4g
PiBtYXkgaGVscCBzb21laG93LCBidXQgdGhlIHJpbmcncyBkYXRhIG1heSBzdGlsbCBiZSBsb3N0
Cj4gCj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIG9mIGV2ZW50IGNoYW5uZWxzIGFyZSBlZGdlIGlu
dGVycnVwdHMuIEJ5IGRlZmluaXRpb24sCgpJTU8gZXZlbnQgY2hhbm5lbHMgYXJlIGFjdGl2ZSBo
aWdoIGxldmVsIGludGVycnVwdHMuCgpMZXQncyB0YWtlIGludG8gYWNjb3VudCB0aGUgZm9sbG93
aW5nIHNpdHVhdGlvbjogeW91IGhhdmUgYW4gZXZlbnQKY2hhbm5lbCBtYXNrZWQgYW5kIHRoZSBl
dmVudCBjaGFubmVsIHBlbmRpbmcgYml0IChha2luIHRvIHRoZSBsaW5lIG9uCmJhcmUgbWV0YWwp
IGdvZXMgZnJvbSBsb3cgdG8gaGlnaCAoMCAtPiAxKSwgdGhlbiB5b3UgdW5tYXNrIHRoZQppbnRl
cnJ1cHQgYW5kIHlvdSBnZXQgYW4gZXZlbnQgaW5qZWN0ZWQuIElmIGl0IHdhcyBhbiBlZGdlIGlu
dGVycnVwdAp5b3Ugd29udCBnZXQgYW4gZXZlbnQgaW5qZWN0ZWQgYWZ0ZXIgdW5tYXNraW5nLCBi
ZWNhdXNlIHlvdSB3b3VsZApoYXZlIGxvc3QgdGhlIGVkZ2UuIEkgdGhpbmsgdGhlIHByb2JsZW0g
aGVyZSBpcyB0aGF0IExpbnV4IHRyZWF0cwpldmVudCBjaGFubmVscyBhcyBlZGdlIGludGVycnVw
dHMsIHdoZW4gdGhleSBhcmUgYWN0dWFsbHkgbGV2ZWwuCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
