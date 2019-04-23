From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Tue, 23 Apr 2019 09:50:21 +0000
Message-ID: <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GOvG=SZ=citrix.com=prvs=0096ed56b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hIs4H-0002Ik-Cb
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:50:25 +0000
In-Reply-To: <155577388740.25746.3780283868034526234.stgit@wayrath>
Content-Language: en-US
Content-ID: <C3D0AC04F9955D45967DC0051FD9E7CE@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gQXByIDIwLCAyMDE5LCBhdCA0OjI0IFBNLCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IEluIHNjaGVkdWxlKCksIGlmIHdlIHBpY2ssIGFz
IHRoZSBuZXh0IHZjcHUgdG8gcnVuIChuZXh0KSB0aGUgc2FtZSBvbmUNCj4gdGhhdCBpcyBydW5u
aW5nIGFscmVhZHkgKHByZXYpLCB3ZSBuZXZlciBnZXQgdG8gY2FsbCBjb250ZXh0X3N3aXRjaCgp
Lg0KPiANCj4gV2UgY2FuLCB0aGVyZWZvcmUsIGdldCByaWQgb2YgYWxsIHRoZSBgaWZgLXMgdGVz
dGluZyBwcmV2IGFuZCBuZXh0IGJlaW5nDQo+IGRpZmZlcmVudCwgdHJhZGluZyB0aGVtIHdpdGgg
YW4gQVNTRVJUKCkgKG9uIEFSTSwgdGhlIEFTU0VSVCgpIHdhcyBldmVuDQo+IGFscmVhZHkgdGhl
cmUhKQ0KDQpLZWVwaW5nIGluIG1pbmQgdGhhdCBBU1NFUlQoKSBpcyBtZXJlbHkgYSBkZWJ1Z2dp
bmcgYWlkOiBzdXBwb3NlIHRoYXQgdGVzdGluZyBkaWRu4oCZdCBkaXNjb3ZlciB0aGlzLCBhbmQg
YSBidWcgdGhhdCB2aW9sYXRlZCB0aGlzIGFzc3VtcHRpb24gc2xpcHBlZCBpbnRvIHByb2R1Y3Rp
b24uICBXb3VsZCB0aGUgcGF0Y2hlZCBjb2RlIERUUlQ/DQoNCkl0IHNvcnQgb2YgbG9va3MgbGlr
ZSB0aGUgcHJldi9uZXh0IGNoZWNraW5nIGlzIGFuIG9wdGltaXphdGlvbiwgYW5kIHRoYXQgZHVw
bGljYXRlIGNoZWNraW5nIHNob3VsZG7igJl0IGNhdXNlIGFueSBwcm9ibGVtcy4gIElzIHRoYXQg
dGhlIGNhc2U/DQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
