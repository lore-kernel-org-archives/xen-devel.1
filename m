From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 00/15] Add support for Hygon Dhyana
 Family 18h processor
Date: Wed, 03 Apr 2019 09:33:27 -0600
Message-ID: <5CA4D247020000780022457E@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <af3a73b3-d1d3-4cd0-0758-d457e1a6549a@citrix.com>
 <07149eb5-7025-d069-a7d1-6bf271e630a5@hygon.cn>
 <5CA38A8D0200007800223FC4@prv1-mh.provo.novell.com>
 <1eb44fcb-6cf1-3f1c-f5c5-70a235149d00@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBhtT-0001Zd-5e
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 15:33:39 +0000
In-Reply-To: <1eb44fcb-6cf1-3f1c-f5c5-70a235149d00@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA0LjE5IGF0IDE3OjIxLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvNC8zIDA6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMi4wNC4xOSBhdCAxODowMCwg
PHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4+IE9uIDIwMTkvNC8yIDIzOjE0LCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4+IE9uIDMwLzAzLzIwMTkgMTA6NDAsIFB1IFdlbiB3cm90ZToKPj4+Pj4g
VGhpcyBwYXRjaCBzZXJpZXMgaGF2ZSBiZWVuIGFwcGxpZWQgYW5kIHRlc3RlZCBzdWNjZXNzZnVs
bHkgb24gSHlnb24KPj4+Pj4gRGh5YW5hIHByb2Nlc3NvciwgYWxzbyBiZWVuIHRlc3RlZCBvbiBB
TUQgRVBZQyAoZmFtaWx5IDE3aCkgcHJvY2Vzc29yLgo+Pj4+PiBJdCB3b3JrcyBmaW5lIGFuZCBt
YWtlcyBubyBoYXJtIHRvIHRoZSBleGlzdGluZyBjb2RlLgo+Pj4+IE9uZSB0aGluZyBJIGRvbid0
IHNlZSBpbiB0aGlzIHNlcmllcyBpcyBhbnl0aGluZyBhYm91dCBtaWNyb2NvZGUKPj4+PiBsb2Fk
aW5nLiAgUHJlc3VtYWJseSB5b3UnbGwgZm9sbG93IHRoZSBBTUQgcGF0Y2hsb2FkaW5nIG1lY2hh
bmlzbSwgd2l0aAo+Pj4+IGEgYmxvYiB5b3UgcHJvdmlkZSB5b3Vyc2VsZj8KPj4+IFdoZW4gdGhl
IEh5Z29uIHBhdGNobG9hZGluZyBtZWNoYW5pc20gaXMgcHJhY3RpY2FibGUgYW5kIGl0J3MgbmVj
ZXNzYXJ5Cj4+PiB0byBsb2FkIHRoZSBIeWdvbiBtaWNyb2NvZGUgb3V0c2lkZSBvZiBCSU9TLCB3
ZSdsbCBzZW5kIHRoZSBwYXRjaGxvYWRpbmcKPj4+IHBhdGNoZXMgdG8gWGVuIGFuZCBMaW51eCBt
YWlsaW5nIGxpc3RzLgo+PiAKPj4gSSBzdXBwb3NlIGJvdGggSW50ZWwgYW5kIEFNRCBoYWQgdGhp
cyBzYW1lIGludGVudGlvbiBvZiB1Y29kZSBsb2FkaW5nCj4+IGJlaW5nIGEgZmlybXdhcmUgam9i
IG9ubHksIGFuZCB3ZSBzZWUgd2hlcmUgd2UgYXJlIHJpZ2h0IG5vdy4gQXMgbG9uZwo+PiBhcyB1
cGRhdGVkIGZpcm13YXJlIGRvZXMgbm90IGJlY29tZSBhdmFpbGFibGUgaW4gYSB0aW1lbHkgbWFu
bmVyIChvcgo+PiBwZXJoYXBzIG5vdCBhdCBhbGwsIGJlY2F1c2Ugb2YgYSB2ZW5kb3IgY29uc2lk
ZXJpbmcgYSBjZXJ0YWluIHN5c3RlbQo+PiBFT0wpLCB0aGVyZSdzIGdvaW5nIHRvIGJlIGEgbmVl
ZCB0byBiZSBhYmxlIHRvIGxvYWQgaXQgZnJvbSB0aGUgT1MuCj4gCj4gSXQncyByZWFzb25hYmxl
LiBCdXQgSSdsbCBub3QgcHV0IHRoZSBtaWNyb2NvZGUgbG9hZGluZyBwYXRjaCBpbiB0aGlzCj4g
c2VyaWVzLCBhbmQgd2lsbCBzZW50IGl0IGluZGl2aWR1YWxseSBsYXRlciBhZnRlciBzdWZmaWNp
ZW50bHkgdGVzdGVkLgoKRmluZSB3aXRoIG1lLCBidXQgQW5kcmV3IHdpbGwgc3BlYWsgZm9yIGhp
bXNlbGYuCgo+IE9yIGp1c3QgYWRkIEh5Z29uIHZlbmRvciBjaGVja2luZyB0byBmb2xsb3cgdGhl
IEFNRCBwYXRjaGxvYWRpbmcKPiBtZWNoYW5pc20gcmlnaHQgbm93IGFuZCBkbyB0aGUgYWRqdXN0
bWVudCBmb3IgSHlnb24gaWYgbmVlZGVkIGluIHRoZQo+IGZ1dHVyZT8KCkknZCBwcmVmZXIgbm90
IHRvIHNlZSB0aGlzICJibGluZGx5IiBlbmFibGVkLiBBcyB5b3Ugc2F5LCBpdCBzaG91bGQKYmUg
dGVzdGVkLiBJZiBubyBvdGhlciBjaGFuZ2VzIGFyZSBuZWVkZWQsIHRoZSBwYXRjaCB3aWxsIGJl
CmVhc3kgdG8gY3JlYXRlZCBhbmQgcHJvY2Vzcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
