From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Thu, 21 Mar 2019 11:08:15 +0900
Message-ID: <20190321020815.zkeqwrdjqmtda6ok@Air-de-Roger>
References: <20190318173731.14494-1-roger.pau@citrix.com>
 <20190318214312.GB2014@mail-itl>
 <20190319141644.GK11621@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T10P=RY=citrix.com=prvs=97654d8fe=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h6n8I-0003CH-FA
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 02:08:38 +0000
Content-Disposition: inline
In-Reply-To: <20190319141644.GK11621@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDI6MTY6NDRQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMTA6NDM6MTJQTSArMDEwMCwgTWFyZWsg
TWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+ID4gT24gTW9uLCBNYXIgMTgsIDIwMTkgYXQg
MDY6Mzc6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBPciBpZiBpdCdz
IG5vdCBwb3NzaWJsZSB0byBob25vciB0aGUgaGludGVkIGFkZHJlc3MgYW4gZXJyb3IgaXMgcmV0
dXJuZWQKPiA+ID4gaW5zdGVhZC4gCj4gPiAKPiA+IEp1c3QgdG8gYmUgc3VyZTogTUFQX0ZJWEVE
IHdpbGwgY2F1c2UgdG8gbWFwIGF0IHNwZWNpZmllZCBhZGRyZXNzLCBldmVuCj4gPiBpZiBzb21l
dGhpbmcgaXMgbWFwcGVkIHRoZXJlIGFscmVhZHkuIEZyb20gbW1hcCgyKToKPiAKPiBUaGF0IHNo
b3VsZCBiZSBmaW5lLiBXZSBkbyB3YW50IHRvIHJlcGxhY2UgYW4gZXhpdGluZyBtYXBwaW5nICh3
aGljaCBpcwo+IG11bm1hcCBiZWZvcmUgdGhlIG1tYXAgY2FsbCksIGJ1dCBpdCB3b3VsZCBoYXZl
IGJlZW4gbmljZSB0byBrbm93IHdoZW4KPiBzb21ldGhpbmcgaXMgYWxyZWFkeSBtYXBwZWQsIHRv
IGRldGVjdCBwcm9ncmFtbWluZyBlcnJvci4KCkZyZWVCU0QgaGFzIE1BUF9FWENMIHRvIGJlIHVz
ZWQgaW4gY29uanVuY3Rpb24gd2l0aCBNQVBfRklYRUQsIGFuZApMaW51eCBoYXMgTUFQX0ZJWEVE
X05PUkVQTEFDRSB0byBhY2hpZXZlIHRoaXMgYmVoYXZpb3IuIEkgdGhpbmsgdGhlCmN1cnJlbnQg
Zml4IGlzIGZpbmUgZm9yIG5vdywgYnV0IHdlIG1pZ2h0IHdhbnQgdG8gbG9vayBpbnRvIHVzaW5n
CnRob3NlIGlmIGZ1cnRoZXIgaXNzdWVzIGFyZSBmb3VuZC4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
