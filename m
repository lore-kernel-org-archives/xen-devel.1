From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/shadow: adjust minimum allocation
 calculations
Date: Wed, 06 Feb 2019 05:53:16 -0700
Message-ID: <5C5AD8BC020000780021446B@prv1-mh.provo.novell.com>
References: <5C5ABD7102000078002143B1@prv1-mh.provo.novell.com>
 <20190206115205.3awoolhiqayqy46k@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grMhh-0006Zk-BI
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 12:53:25 +0000
In-Reply-To: <20190206115205.3awoolhiqayqy46k@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE5IGF0IDEyOjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDA2LCAyMDE5IGF0IDAzOjU2OjQ5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBAQCAtMTM3Myw5ICsxMzc3LDE1IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2hfbWlu
X2FsbG9jYXRpb24oY28KPj4gIHsKPj4gICAgICAvKgo+PiAgICAgICAqIERvbid0IGFsbG9jYXRl
IGxlc3MgdGhhbiB0aGUgbWluaW11bSBhY2NlcHRhYmxlLCBwbHVzIG9uZSBwYWdlIHBlcgo+PiAt
ICAgICAqIG1lZ2FieXRlIG9mIFJBTSAoZm9yIHRoZSBwMm0gdGFibGUpLgo+PiArICAgICAqIG1l
Z2FieXRlIG9mIFJBTSAoZm9yIHRoZSBwMm0gdGFibGUsIG1pbmltYWxseSBlbm91Z2ggZm9yIEhW
TSdzIHNldHRpbmcKPj4gKyAgICAgKiB1cCBvZiBzbG90IHplcm8gYW5kIFZNWCdzIHNldHRpbmcg
dXAgb2YgdGhlIExBUElDIHBhZ2UpLCBwbHVzIG9uZSBmb3IKPj4gKyAgICAgKiBIVk0ncyAxLXRv
LTEgcGFnZXRhYmxlLgo+PiAgICAgICAqLwo+PiAtICAgIHJldHVybiBzaGFkb3dfbWluX2FjY2Vw
dGFibGVfcGFnZXMoZCkgKyAoZC0+dG90X3BhZ2VzIC8gMjU2KTsKPj4gKyAgICByZXR1cm4gc2hh
ZG93X21pbl9hY2NlcHRhYmxlX3BhZ2VzKGQpICsKPj4gKyAgICAgICAgICAgbWF4KGQtPnRvdF9w
YWdlcyAvIDI1NiwKPj4gKyAgICAgICAgICAgICAgIGlzX2h2bV9kb21haW4oZCkgPyBDT05GSUdf
UEFHSU5HX0xFVkVMUyArICEhY3B1X2hhc192bXggKiAyCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDogMFUpICsKPj4gKyAgICAgICAgICAgaXNfaHZtX2RvbWFpbihkKTsKPiAK
PiBTaG91bGQgdGhlIGNhbGwgdG8gc2hhZG93X3NldF9hbGxvY2F0aW9uIGJlIGNoYW5nZWQgc28g
aXQgYXR0ZW1wdHMgdG8KPiBhbGxvY2F0ZSBzaF9taW5fYWxsb2NhdGlvbihkKSArIGQtPmFyY2gu
cGFnaW5nLnNoYWRvdy5wMm1fcGFnZXM/Cj4gCj4gSXQgc2VlbXMgYSBsaXR0bGUgbWlzbGVhZGlu
ZyB0byBjaGVjayB3aGV0aGVyIHRoZXJlJ3MgYSBjZXJ0YWluIGFtb3VudAo+IG9mIHBhZ2VzIGlu
IHRoZSBwb29sIChzaF9taW5fYWxsb2NhdGlvbihkKSArCj4gZC0+YXJjaC5wYWdpbmcuc2hhZG93
LnAybV9wYWdlcykgYW5kIHRoZW4gc2V0IHRoZSBhbGxvY2F0aW9uIHRvIDRNCj4gdW5jb25kaXRp
b25hbGx5LgoKV2VsbCwgYXMgc2FpZCBpbiB0aGUgcG9zdC1jb21taXQtbWVzc2FnZSByZW1hcmss
IEkgdGhpbmsgd2Ugd2FudCB0bwpnZXQgcmlkIG9mIHRoaXMsIGJ1dCBvbmx5IHdpdGggaXQgcHJv
cGVybHkgcmVwbGFjZWQgKHdoaWNoIHdvdWxkIGxpa2VseQpyZXF1aXJlIGhvb2tpbmcgaW50byBw
YXRocyBpbmNyZWFzaW5nIGQtPnRvdF9wYWdlcykuIFJpZ2h0IG5vdyBhbGwKd2UncmUgYWZ0ZXIg
aXMgZGVhbGluZyB3aXRoIHRoZSByZWdyZXNzaW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
