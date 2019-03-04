From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v4 5/6] xen/x86: add PHYSDEVOP_msi_set_enable
Date: Mon, 04 Mar 2019 03:22:37 -0700
Message-ID: <5C7CFC6D020000780014FA38@prv1-mh.provo.novell.com>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <cc240476d615c05925891d33fc83be3e1801b52d.1549498018.git-series.marmarek@invisiblethingslab.com>
 <5C767771020000780021AB12@prv1-mh.provo.novell.com>
 <20190227150508.GE19265@mail-itl>
 <5C77BEDD020000780021B030@prv1-mh.provo.novell.com>
 <20190228122546.GN5348@mail-itl> <20190303011024.GP19265@mail-itl>
 <20190304101914.5c4t52232l4oajix@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h0kkA-0006Tz-Bb
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 10:22:46 +0000
In-Reply-To: <20190304101914.5c4t52232l4oajix@Air-de-Roger>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: roger.pau@citrix.com, marmarek@invisiblethingslab.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, dgdegra@tycho.nsa.gov
List-Id: xen-devel@lists.xenproject.org

Pj4+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiAwMy8wNC8xOSAxMTox
OSBBTSA+Pj4KPk9uIFN1biwgTWFyIDAzLCAyMDE5IGF0IDAyOjEwOjI0QU0gKzAxMDAsIE1hcmVr
IE1hcmN6eWtvd3NraSB3cm90ZToKPj4gT24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMDE6MjU6NTBQ
TSArMDEwMCwgTWFyZWsgTWFyY3p5a293c2tpIHdyb3RlOgo+PiA+IE9uIFRodSwgRmViIDI4LCAy
MDE5IGF0IDAzOjU4OjM3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiA+ID4gQW5vdGhl
ciB0aGluZzogWW91J3JlIGFsc28gYnlwYXNzaW5nIHRoZSBNU0l7LC1YfS1hbHJlYWR5LWVuYWJs
ZWQKPj4gPiA+IGNoZWNrcyB0aGF0IF9fcGNpX2VuYWJsZV9tc2l7LHh9KCkgZG8sIHlldCBhbGxv
d2luZyB0byBlbmFibGUgYm90aAo+PiA+ID4gb24gYSBkZXZpY2Ugd291bGQgYmUgYSBzZWN1cml0
eSBpc3N1ZS4KPj4gPiAKPj4gPiBPay4KPj4gCj4+IEhtbSwgY291bGQgeW91IGV4cGxhaW4gbW9y
ZT8gSXMgdGhhdCBvbmx5IHRoZSBjYXNlIHdoZW4gaW50ZXJydXB0Cj4+IHJlbWFwcGluZyBpcyBt
aXNzaW5nPwo+Cj5JIHRoaW5rIHdoYXQgSmFuIG1lbnRpb25zIGlzIHRoYXQgdGhlIGh5cGVyY2Fs
bCB0byBlbmFibGUgTVNJKC1YKQo+c2hvdWxkIG1ha2Ugc3VyZSBQQ0kgSU5UeCBpcyBkaXNhYmxl
ZCwgYW5kIHByZXZlbnQgZW5hYmxpbmcgYm90aCBNU0kKPmFuZCBNU0ktWCBvbiB0aGUgc2FtZSBk
ZXZpY2UuCj4KPlRoZSBkZXZpY2UgbW9kZWwgdGhhdCBtYW5hZ2VzIHRoZSBwYXNzdGhyb3VnaCBk
ZXZpY2Ugc2hvdWxkIGFscmVhZHkKPm1ha2Ugc3VyZSBvZiB0aGF0LCBidXQgWGVuIHNob3VsZCBh
bHNvIHByb3RlY3QgaXRzZWxmIGFnYWluc3QKPmJhZC1iZWhhdmVkIGRldmljZSBtb2RlbHMgd2hl
biBwb3NzaWJsZS4KClJpZ2h0LCBhbmQgc3BlY2lmaWNhbGx5IGluIHRoZSBjYXNlIHdoZXJlIHRo
ZSBkZXZpY2UgbW9kZWwgaXRzZWxmIHJ1bnMgd2l0aApsaW1pdGVkIHByaXZpbGVnZXMuCgpKYW4K
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
