From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Xen project CI systems and committer workflow
Date: Tue, 23 Apr 2019 10:12:02 +0100
Message-ID: <20190423091202.GF30543@zion.uk.xensource.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XF9G=SZ=citrix.com=prvs=009e2af65=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hIrTC-0006pG-T0
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:12:06 +0000
Content-Disposition: inline
In-Reply-To: <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Committers <committers@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDI6NTk6MTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8wNC8yMDE5IDEzOjMxLCBXZWkgTGl1IHdyb3RlOgo+ID4gSGkgYWxsCj4g
Pgo+ID4gV2Ugbm93IGhhdmUgR2l0bGFiIENJIGFzIGEgY29tcGxlbWVudGFyeSBzeXN0ZW0gdG8g
T3NzdGVzdCBhbmQgaGF2ZSBwbGFubmVkIHRvCj4gPiBhZGQgYm90cy4gSXQncyBoaWdoIHRpbWUg
d2UgdGhpbmsgYWJvdXQgaG93IHdlIGludGVncmF0ZSB0aGVtIGFuZCBob3cgaXQgbWF5Cj4gPiBp
bXByb3ZlIG91ciB3b3JrZmxvdy4KPiA+Cj4gPiAjIyBSZXF1aXJlbWVudHMKPiA+Cj4gPiAxLiBX
ZSB3YW50IHRvIGhhdmUgbGlnaHQgd2VpZ2h0IGJ1aWxkIHRlc3RzIGJlZm9yZSBhIHBhdGNoIHNl
cmllcyBpcyByZXZpZXdlZAo+ID4gb3IgY29tbWl0dGVkLgo+ID4KPiA+IDIuIFdlIGRvbid0IHdh
bnQgdG8gcHVzaCBicm9rZW4gcGF0Y2hlcyB0byBjZW50cmFsIHJlcG9zaXRvcnkgc3VjaCB0aGF0
Cj4gPiBldmVyeW9uZSBpcyBibG9ja2VkLgo+ID4KPiA+IDMuIFdlIGRvbid0IHdhbnQgdG8gc2ln
bmlmaWNhbnRseSBjaGFuZ2UgY29tbWl0dGVyIHdvcmtmbG93Lgo+ID4KPiA+IFJlcXVpcmVtZW50
IDIgbWVhbnMgdGhhdCBvdXIgY3VycmVudCBicmFuY2hpbmcgbW9kZWwgd2lsbCBuZWVkIHRvIGJl
IGNoYW5nZWQuCj4gPiBEZXRhaWxzIHdpbGwgZm9sbG93Lgo+IAo+IFdoaWxlIGV2ZXJ5dGhpbmcg
cHJlc2VudGVkIGhlcmUgaXMgZmluZSB0byBkbyBhcyBhIG1hdHRlciBvZiBwb2xpY3ksIHRoZQo+
IGNvbW1pdHRlcnMgc3RpbGwgbmVlZCB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gYWN0dWFsbHkg
cHVzaCBkaXJlY3RseSB0bwo+IHRoZSBzdGFnaW5nIGJyYW5jaGVzIG9uIHhlbi5naXQKPiAKCkJ1
dCB0aGF0IHdvdWxkIG1lYW4gc2tpcHBpbmcgYWxsIHRlc3RzPyBJIGRvbid0IHRoaW5rIHRoYXQn
cyBkZXNpcmFibGUuCgo+IFRoZSBzZWN1cml0eSB0ZWFtIG5lZWRzIHRvIGJlIGFibGUgdG8gbWFr
ZSBlbWJhcmdvZWQgY29udGVudCBhcHBlYXIgYXQKPiB0aGUgcG9pbnQgb2YgcHVibGljIGRpc2Ns
b3N1cmUuwqAgVGhlIHNlY3VyaXR5IHRlYW0gYWxyZWFkeSB0YWtlcwo+IHJlc3BvbnNpYmlsaXR5
IGZvciBhbGwgdGVzdGluZyBvZiB0aGlzIGNvbnRlbnQgYmVmb3JlIHRoZSBwdWJsaWMgZW1iYXJn
bwo+IHBvaW50LCBhbmQgdGhpcyBwb2xpY3kgd2lsbCBuZWVkIHRvIGNvbnRpbnVlLgoKSSB0aGlu
ayBhcyBsb25nIGFzIHRoZSBzeXN0ZW0gcHJvdmlkZXMgdGhlIGNhcGFiaWxpdHkgdG8gMSkgcnVu
IGZsaWdodHMKaW4gc2VjcmV0IGFuZCAyKSBleHBlZGl0ZSBjZXJ0YWluIGZsaWdodHMsIGVuZm9y
Y2luZyB0aGlzIHBvbGljeSBldmVuIG9uCnNlY3VyaXR5IHRlYW0gc2hvdWxkIGJlIGZpbmUuCgoj
MSBtYWtlcyBzdXJlIHNlY3VyaXR5IHBhdGNoZXMgY2FuIGJlIHRlc3RlZCBiZWZvcmUgdGhleSBh
cmUgcHVibGlzaGVkLgojMiBtYWtlcyBzdXJlIG9uY2UgdGhleSBhcmUgcHVibGlzaGVkLCB0aGV5
IHdpbGwgYmUgdGVzdGVkIGF0IHRoZQpoaWdoZXN0IHByaW9yaXR5LgoKV2VpLgoKPiAKPiB+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
