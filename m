From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12 5/8] pvh/dom0: warn when dom0_mem
 is not set to a fixed value
Date: Thu, 7 Feb 2019 18:48:17 +0100
Message-ID: <20190207174817.bwnuaief4cvnvjbu@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-6-roger.pau@citrix.com>
 <CAFLBxZbG2+tuM4Hs11c1U9QebnPyar1EiMWqtV6Wz3VbMRBc4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9m6e=QO=citrix.com=prvs=934266883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grnmk-0001Zg-BE
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:48:26 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZbG2+tuM4Hs11c1U9QebnPyar1EiMWqtV6Wz3VbMRBc4g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDU6MDk6MTRQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBXZWQsIEphbiAzMCwgMjAxOSBhdCAxMDozNyBBTSBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBUaGVyZSBoYXZlIGJlZW4gc2V2
ZXJhbCByZXBvcnRzIG9mIHRoZSBkb20wIGJ1aWxkZXIgcnVubmluZyBvdXQgb2YKPiA+IG1lbW9y
eSB3aGVuIGJ1aWxkaWduIGEgUFZIIGRvbTAgd2l0aG91dCBoYXZpbmdmIHNwZWNpZmllZCBhIGRv
bTBfbWVtCj4gPiB2YWx1ZS4gUHJpbnQgYSB3YXJuaW5nIG1lc3NhZ2UgaWYgZG9tMF9tZW0gaXMg
bm90IHNldCB0byBhIGZpeGVkIHZhbHVlCj4gPiB3aGVuIGJvb3RpbmcgaW4gUFZIIG1vZGUuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4gPiAtLS0KPiA+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPiA+IC0tLQo+ID4gV2l0aG91dCB0aGlzIHBhdGNoIGNyZWF0aW5nIGEgUFZIIGRv
bTAgd2l0aG91dCBhIGRvbTBfbWVtIHBhcmFtZXRlcgo+ID4gY2FuIHJlc3VsdCBpbiB0aGUgZG9t
MCBidWlsZGVyIHJ1bm5pbmcgb3V0IG9mIG1lbW9yeSB0aHVzIGxlYWRpbmcgdG8gYQo+ID4gWGVu
IGNyYXNoLiBUaGUgYWRkZWQgbWVzc2FnZSBnaXZlcyBhIGhpdCB0byB0aGUgdXNlciBhYm91dCBh
IHBvc3NpYmxlCj4gPiBmaXguCj4gCj4gQnV0IHdoeSB3b3VsZCBpdCBydW4gb3V0IG9mIG1lbW9y
eT8gIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBmaW5kIGFuZAo+IGZpeCB0aGUgcm9vdCBjYXVz
ZT8KClRoZSByb290IGNhdXNlIGlzIHRoYXQgZG9tMF9jb21wdXRlX25yX3BhZ2VzIGlzIG5vdCB2
ZXJ5IGdvb2QgYXQKYXBwcm94aW1hdGluZyB0aGUgaW50ZXJuYWwgbWVtb3J5IG5lZWRlZCB0byBi
dWlsZCBhIFBWSCBkb20wLCBpdCBvbmx5CnRha2VzIGludG8gYWNjb3VudCB0aGUgUkFNIHJlZ2lv
bnMgb2YgdGhlIHAybSwgYnV0IG5vdCB0aGUgTU1JTwpyZWdpb25zLCBuZWl0aGVyIHRoZSBmYWN0
IHRoYXQgdGhlIHAybSB3aWxsIGxpa2VseSBjb250YWluIGhvbGVzLgoKSSd2ZSBoYWQgYSBwYXRj
aCBzZXJpZXMgdG8gZml4IHRoaXM6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTIvbXNnMDA0MzcuaHRtbAoKQnV0IEknbSBhZnJhaWQg
d2UgZGlkbid0IHJlYWNoIGNvbnNlbnN1cyB3aXRoIEphbiBhbmQgYXQgdGhpcyBwb2ludCBpbgp0
aGUgcmVsZWFzZSBhZGRpbmcgYSB3YXJuaW5nIG1lc3NhZ2Ugc2VlbXMgbGlrZSB0aGUgbGVzcyBj
b250cm92ZXJzaWFsCm9wdGlvbiB3aGlsZSBJIGZpZ3VyZSBvdXQgaG93IHRvIHByb2NlZWQgaW4g
b3JkZXIgdG8gZml4IHRoaXMuIFN1Y2gKbWVzc2FnZSB3aWxsIGF0IGxlYXN0IGdpdmUgYSBoaW50
IHRvIHVzZXJzIGFib3V0IGEgcG9zc2libGUgZml4LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
