From: Tim Deegan <tim@xen.org>
Subject: Re: Ping: [PATCH] x86: improve vCPU selection in
 pagetable_dying()
Date: Wed, 3 Oct 2018 21:52:36 +0100
Message-ID: <20181003205236.GA87361@deinos.phlegethon.org>
References: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
 <5BA0F33302000078001E9717@prv1-mh.provo.novell.com>
 <15752d56-8300-698d-085a-6795bd75f634@citrix.com>
 <5BAB2F6202000078001EBF97@prv1-mh.provo.novell.com>
 <6f305020-9b75-c1a8-7f55-2b1d5926aaf4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bcme=mp=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1g7o8X-0000cG-MQ
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 20:52:49 +0000
Content-Disposition: inline
In-Reply-To: <6f305020-9b75-c1a8-7f55-2b1d5926aaf4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QXQgMTc6NTYgKzAxMDAgb24gMDMgT2N0ICgxNTM4NTg5MzY2KSwgR2VvcmdlIER1bmxhcCB3cm90
ZToKPiBPbiAwOS8yNi8yMDE4IDA4OjA0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IExvb2tp
bmcgYXQgdGhpbmdzIGFnYWluIChpbiBwYXJ0aWN1bGFyCj4gPiB0aGUgY29tbWVudCBhaGVhZCBv
ZiBwYWdldGFibGVfZHlpbmcoKSkgSSBub3cgYWN0dWFsbHkgd29uZGVyIHdoeQo+ID4gSFZNT1Bf
cGFnZXRhYmxlX2R5aW5nIGlzIHBlcm1pdHRlZCB0byBiZSBjYWxsZWQgYnkgb3RoZXIgdGhhbiBh
IGRvbWFpbgo+ID4gZm9yIGl0c2VsZi4gVGhlcmUncyBubyB1c2Ugb2YgaXQgaW4gdGhlIHRvb2wg
c3RhY2suIERpc2FsbG93aW5nIHRoZSB1bnVzZWQKPiA+IGNhc2Ugd291bGQgbWVhbiB0aGUgZmFz
dC1wYXRoIGxvZ2ljIGluIHNoX3BhZ2V0YWJsZV9keWluZygpIGNvdWxkCj4gPiBiZWNvbWUgdGhl
IG9ubHkgdmFsaWQvaW1wbGVtZW50ZWQgY2FzZS4gVGltPwo+IAo+IE5vdCBzbyAtLSBhIGd1ZXN0
IGNvdWxkIHN0aWxsIGNhbGwgcGFnZXRhYmxlX2R5aW5nKCkgb24gdGhlIHRvcCBsZXZlbCBQVAo+
IG9mIGEgcHJvY2VzcyBub3QgY3VycmVudGx5IHJ1bm5pbmcuCj4gCj4gSSB3b3VsZCBiZSB0b3Rh
bGx5IGluIGZhdm9yIG9mIGxpbWl0aW5nIHRoaXMgY2FsbCB0byB0aGUgZ3Vlc3QgaXRzZWxmLAo+
IGhvd2V2ZXIgLS0gdGhhdCB3b3VsZCBzaW1wbGlmeSB0aGUgbG9naWMgZXZlbiBtb3JlLgoKWWVz
LCBJIHRoaW5rIHRoYXQgdGhpcyBjYW4gYmUgcmVzdHJpY3RlZCB0byB0aGUgY2FsbGVyJ3MgZG9t
YWluLCBhbmQKc28gYWx3YXlzIHVzZSBjdXJyZW50IGFzIHRoZSB2Y3B1LiAgSSBkb24ndCByZWNh
bGwgYSB1c2UgY2FzZSBmb3IKc2V0dGluZyB0aGlzIGZyb20gb3V0c2lkZSB0aGUgVk0uCgpJIGNh
bid0IGZpbmQgcmVhc29uIGZvciB0aGUgdmNwdVswXSBpbiB0aGUgaGlzdG9yeSwgYnV0IGl0IGRv
ZXMgbG9vawp3cm9uZy4gIEkgc3VzcGVjdCB0aGlzIHBhdGNoIG1pZ2h0IGhhdmUgYmVlbiBpbiBh
IFhlblNlcnZlciBwYXRjaApxdWV1ZSBmb3IgYSB3aGlsZSwgYW5kIHBlcmhhcHMgdGhlIHBsdW1i
aW5nIHdhcyBmaXhlZCB1cCBpbmNvcnJlY3RseQp3aGVuIGl0IHdhcyB1cHN0cmVhbWVkLgoKQ2hl
ZXJzLAoKVGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
