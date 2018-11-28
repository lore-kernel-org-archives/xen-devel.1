From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: vpci: deferral of register write until p2m changes
 are done
Date: Wed, 28 Nov 2018 18:48:32 +0100
Message-ID: <20181128174832.om7dtvdqu5xj6m64@mac>
References: <20181128100949.us5zjhswmxx42635@mac>
 <5BFE91980200007800200BDF@prv1-mh.provo.novell.com>
 <20181128154124.6iyz44hsvm7diovj@mac>
 <5BFEC0B80200007800200DBA@prv1-mh.provo.novell.com>
 <20181128165430.mgirjhqupxjh6nrg@mac>
 <5BFECAA10200007800200E9E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ir32=OH=citrix.com=prvs=8634c6f68=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gS3y0-0007y7-Qn
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:49:40 +0000
Content-Disposition: inline
In-Reply-To: <5BFECAA10200007800200E9E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMTA6MDQ6MzNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjExLjE4IGF0IDE3OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDk6MjI6MTZBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDI4LjExLjE4IGF0IDE2OjQxLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gTXkgcGxhbiBpcyB0aGF0IERvbVVzIHdvbid0IGJlIGFs
bG93ZWQgdG8gdG9nZ2xlIHRoZSBtZW1vcnkgZGVjb2RpbmcKPiA+PiA+IGJpdCwgYW5kIGl0J3Mg
Z29pbmcgdG8gYmUgYWx3YXlzIGVuYWJsZWQsIGxpa2UgaXQncyBjdXJyZW50bHkgZG9uZSBmb3IK
PiA+PiA+IHBjaS1wYXNzdGhyb3VnaCBpbiBRRU1VLiBUb2dnbGluZyB0aGUgbWVtb3J5IGRlY29k
aW5nIGJpdCBpbiBhIERvbVUgaXMKPiA+PiA+IGdvaW5nIHRvIHRyaWdnZXIgYSBjaGFuZ2UgdG8g
dGhlIHAybSAobWFwIG9yIHVubWFwKSBidXQgdGhlIGNvbW1hbmQKPiA+PiA+IHJlZ2lzdGVyIHdp
bGwgYWx3YXlzIGhhdmUgdGhlIG1lbW9yeSBkZWNvZGluZyBiaXQgZW5hYmxlZC4KPiA+PiAKPiA+
PiBCdXQgdGhpcyBpc24ndCBlbnRpcmVseSBjb3JyZWN0LCBldmVuIGlmIHdlJ3ZlIGdvdCBhd2F5
IHdpdGggdGhpcwo+ID4+IHNvIGZhci4gQnV0IHdlJ3JlIG1vc3RseSBjb25zaWRlcmluZyB3ZWxs
LWJlaGF2ZWQgZ3Vlc3RzIGFuZAo+ID4+IGRldmljZXMuIFdoYXQgaWYgb25lIGFjdHVhbGx5IHRy
aWdnZXJzIGJ1cyBhY3Rpdml0eSBpbiBwYXJhbGxlbCB0bwo+ID4+IGEgQkFSIGNoYW5nZT8KPiA+
IAo+ID4gV2VsbCwgdGhhdCdzIGxpa2VseSB0byBub3Qgd29yayBwcm9wZXJseSBpbiBhbnkgY2Fz
ZSB3aXRoIG9yIHdpdGhvdXQKPiA+IGRpc2FibGluZyB0aGUgbWVtb3J5IGRlY29kaW5nIGJpdD8K
PiAKPiBPZiBjb3Vyc2Ugbm90Lgo+IAo+ID4gQnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0J3MgZ29p
bmcgdG8gYWZmZWN0IFhlbiBzdGFiaWxpdHkgKG9yIHdoYXQgdGhlCj4gPiBkb21haW4gaXMgYXR0
ZW1wdGluZyB0byBhY2hpZXZlIHdpdGggaXQpLgo+IAo+ICJJIGRvbid0IHNlZSBob3cgLi4uIiAh
PSAiVGhhdCdzIG5vdCBnb2luZyB0byAuLi4iLiBBbmQgaW4gY2FzZSBteQo+IHByaW9yIHdheSBv
ZiB3b3JkaW5nIGl0IHdhcyBhbWJpZ3VvdXM6IFdlIHZlcnkgbXVjaCBuZWVkIHRvCj4gdGhpbmsg
YWJvdXQgbWFsaWNpb3VzIGd1ZXN0cyAob25jZSBhbnkgb2YgdGhpcyBpcyB0byBiZSBleHRlbmRl
ZAo+IHRvIERvbVUtcykuIEhlbmNlIGEgZ29hbCBvZiAiSSB3YW50IHRvIGNyYXNoIFhlbiIgbmVl
ZHMgdG8gYmUKPiB0YWtlbiBpbnRvIGNvbnNpZGVyYXRpb24uCgpSaWdodCwgc28gWGVuIG1pZ2h0
IHdoYXQgdG8gZGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgZm9yIERvbVVzIGFsc28uCgpCdXQgdGhh
dCdzIG9ydGhvZ29uYWwgdG8gd2hldGhlciB3ZSBhZ3JlZSB0aGF0IHRoZSB3cml0ZSB0byB0aGUK
Y29tbWFuZCByZWdpc3RlciBjYW4gaGFwcGVuIGJlZm9yZSB0aGUgcDJtIG1vZGlmaWNhdGlvbnMs
IGJvdGggaW4gdGhlCm1hcCBhbmQgdGhlIHVubWFwIGNhc2UuIEkgdGhpbmsgc28sIGJ1dCBJIHdv
dWxkIGxpa2UgdG8gYmUgc3VyZSB5b3UKYWdyZWUgYmVmb3JlIEkgY29kZSB0aGlzLgoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
