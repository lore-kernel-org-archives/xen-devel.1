From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: vpci: deferral of register write until p2m changes
 are done
Date: Wed, 28 Nov 2018 10:04:33 -0700
Message-ID: <5BFECAA10200007800200E9E@prv1-mh.provo.novell.com>
References: <20181128100949.us5zjhswmxx42635@mac>
 <5BFE91980200007800200BDF@prv1-mh.provo.novell.com>
 <20181128154124.6iyz44hsvm7diovj@mac>
 <5BFEC0B80200007800200DBA@prv1-mh.provo.novell.com>
 <20181128165430.mgirjhqupxjh6nrg@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gS3GS-0003pY-5C
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:04:40 +0000
In-Reply-To: <20181128165430.mgirjhqupxjh6nrg@mac>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDE3OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDA5OjIyOjE2QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjguMTEuMTggYXQgMTY6NDEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gTXkgcGxhbiBpcyB0aGF0IERvbVVzIHdvbid0IGJlIGFsbG93ZWQgdG8gdG9n
Z2xlIHRoZSBtZW1vcnkgZGVjb2RpbmcKPj4gPiBiaXQsIGFuZCBpdCdzIGdvaW5nIHRvIGJlIGFs
d2F5cyBlbmFibGVkLCBsaWtlIGl0J3MgY3VycmVudGx5IGRvbmUgZm9yCj4+ID4gcGNpLXBhc3N0
aHJvdWdoIGluIFFFTVUuIFRvZ2dsaW5nIHRoZSBtZW1vcnkgZGVjb2RpbmcgYml0IGluIGEgRG9t
VSBpcwo+PiA+IGdvaW5nIHRvIHRyaWdnZXIgYSBjaGFuZ2UgdG8gdGhlIHAybSAobWFwIG9yIHVu
bWFwKSBidXQgdGhlIGNvbW1hbmQKPj4gPiByZWdpc3RlciB3aWxsIGFsd2F5cyBoYXZlIHRoZSBt
ZW1vcnkgZGVjb2RpbmcgYml0IGVuYWJsZWQuCj4+IAo+PiBCdXQgdGhpcyBpc24ndCBlbnRpcmVs
eSBjb3JyZWN0LCBldmVuIGlmIHdlJ3ZlIGdvdCBhd2F5IHdpdGggdGhpcwo+PiBzbyBmYXIuIEJ1
dCB3ZSdyZSBtb3N0bHkgY29uc2lkZXJpbmcgd2VsbC1iZWhhdmVkIGd1ZXN0cyBhbmQKPj4gZGV2
aWNlcy4gV2hhdCBpZiBvbmUgYWN0dWFsbHkgdHJpZ2dlcnMgYnVzIGFjdGl2aXR5IGluIHBhcmFs
bGVsIHRvCj4+IGEgQkFSIGNoYW5nZT8KPiAKPiBXZWxsLCB0aGF0J3MgbGlrZWx5IHRvIG5vdCB3
b3JrIHByb3Blcmx5IGluIGFueSBjYXNlIHdpdGggb3Igd2l0aG91dAo+IGRpc2FibGluZyB0aGUg
bWVtb3J5IGRlY29kaW5nIGJpdD8KCk9mIGNvdXJzZSBub3QuCgo+IEJ1dCBJIGRvbid0IHNlZSBo
b3cgdGhhdCdzIGdvaW5nIHRvIGFmZmVjdCBYZW4gc3RhYmlsaXR5IChvciB3aGF0IHRoZQo+IGRv
bWFpbiBpcyBhdHRlbXB0aW5nIHRvIGFjaGlldmUgd2l0aCBpdCkuCgoiSSBkb24ndCBzZWUgaG93
IC4uLiIgIT0gIlRoYXQncyBub3QgZ29pbmcgdG8gLi4uIi4gQW5kIGluIGNhc2UgbXkKcHJpb3Ig
d2F5IG9mIHdvcmRpbmcgaXQgd2FzIGFtYmlndW91czogV2UgdmVyeSBtdWNoIG5lZWQgdG8KdGhp
bmsgYWJvdXQgbWFsaWNpb3VzIGd1ZXN0cyAob25jZSBhbnkgb2YgdGhpcyBpcyB0byBiZSBleHRl
bmRlZAp0byBEb21VLXMpLiBIZW5jZSBhIGdvYWwgb2YgIkkgd2FudCB0byBjcmFzaCBYZW4iIG5l
ZWRzIHRvIGJlCnRha2VuIGludG8gY29uc2lkZXJhdGlvbi4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
