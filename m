From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Wed, 23 May 2018 01:17:39 -0600
Message-ID: <5B05159302000078001C4FBE__20570.5148670406$1527059803$gmane$org@prv1-mh.provo.novell.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
 <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
 <5B0421E502000078001C4B91@prv1-mh.provo.novell.com>
 <CAMzpN2gRvYMmaf2+Fpi2wkAV_rcH=uDfM8sQQaaGGK2U=7XqMA@mail.gmail.com>
 <5B04410D02000078001C4CC5@prv1-mh.provo.novell.com>
 <70aad5f3-67b9-b1fa-d39c-cfa8615f38da@oracle.com>
 <5B04463502000078001C4CEE@prv1-mh.provo.novell.com>
 <1bb1b3b0-fae1-9c2e-f5b8-0c51f06d6fa9@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=f/rg=ik=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLO1o-0006ic-CQ
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 07:17:44 +0000
In-Reply-To: <1bb1b3b0-fae1-9c2e-f5b8-0c51f06d6fa9@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, brgerst@gmail.com, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE5OjEwLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzIyLzIwMTggMTI6MzIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAyMi4wNS4xOCBhdCAxODoyMCwgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IFdlIGFyZSBsb2FkaW5nIHZpcnR1YWwgYWRkcmVzcyBmb3IgJGNhbmFyeSBzbyB3ZSB3aWxs
IGFsd2F5cyBoYXZlIEVEWAo+Pj4gc2V0IHRvIDB4ZmZmZmZmZmYuIElzbid0IHRoYXQgd2hhdCB3
ZSB3YW50Pwo+PiBPaCwgdGhhdCdzIHJhdGhlciBjb25mdXNpbmcgLSB3ZSdyZSBzdGlsbCBydW5u
aW5nIG9uIHRoZSBsb3cgMToxCj4+IG1hcHBpbmcgd2hlbiB3ZSdyZSBoZXJlLiBCdXQgeWVzLCBi
eSB0aGUgdGltZSB3ZSBlbnRlciBDIGNvZGUKPj4gKHdoZXJlIHRoZSBHUyBiYXNlIHN0YXJ0cyB0
byBtYXR0ZXIpIHdlIG91Z2h0IHRvIGJlIG9uIHRoZSBoaWdoCj4+IG1hcHBpbmdzIC0gaWYgb25s
eSB0aGVyZSB3YXNuJ3QgeGVuX3ByZXBhcmVfcHZoKCkuCj4gCj4geGVuX3ByZXBhcmVfcHZoKCkg
KGFuZCB3aGF0ZXZlciBpdCBtaWdodCBjYWxsKSBpcyB0aGUgb25seSByZWFzb24gZm9yCj4gdGhp
cyBwYXRjaCB0byBleGlzdC4gSXQncyB0aGUgb25seSBDIGNhbGwgdGhhdCB3ZSBhcmUgbWFraW5n
IGJlZm9yZQo+IGp1bXBpbmcgdG8gc3RhcnR1cF82NCwgd2hpY2ggSSBhc3N1bWUgd2lsbCBoYXZl
IHRvIHNldCB1cCBHUyBpdHNlbGYKPiBiZWZvcmUgY2FsbGluZyBpbnRvIEMuCj4gCj4gSSBkaWRu
J3QgcmVhbGl6ZSB3ZSBhcmUgc3RpbGwgb24gaWRlbnRpdHkgbWFwcGluZy4gSSdsbCBjbGVhciBF
RFggKGFuZAo+IGxvYWQgJF9wYShjYW5hcnkpKSB0aGVuLgo+IAo+IEJUVywgZG9uJ3Qgd2UgaGF2
ZSB0aGUgc2FtZSBpc3N1ZSBpbiBzdGFydHVwX3hlbigpPwoKSSBkb24ndCB0aGluayBzbywgbm8g
LSB0aGVyZSB3ZSdyZSBvbiB0aGUgaGlnaCBtYXBwaW5ncyBhbHJlYWR5ICh0aGUKRUxGIG5vdGUg
c3BlY2lmaWVzIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2YgdGhlIGVudHJ5IHBvaW50LCBhZnRlciBh
bGwpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
