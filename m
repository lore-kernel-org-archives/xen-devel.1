From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 06/12] xen-blkfront: add callbacks for
 PM suspend and hibernation
Date: Thu, 14 Jun 2018 10:43:13 +0200
Message-ID: <20180614084313.43njg3hbhqoptlqc__41327.883458189$1528965735$gmane$org@mac>
References: <20180612205619.28156-1-anchalag@amazon.com>
 <20180612205619.28156-7-anchalag@amazon.com>
 <20180613082428.bjdko4k6cnq6eid3@mac>
 <20180613222048.GB33296@kaos-source-ops-60001.pdx1.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdtr=ja=citrix.com=prvs=696376585=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fTNqk-0005l9-VS
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 08:43:22 +0000
Content-Disposition: inline
In-Reply-To: <20180613222048.GB33296@kaos-source-ops-60001.pdx1.amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anchal Agarwal <anchalag@amazon.com>
Cc: jgross@suse.com, len.brown@intel.com, kamatam@amazon.com, eduval@amazon.com, vallish@amazon.com, netdev@vger.kernel.org, fllinden@amazon.com, x86@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, guruanb@amazon.com, cyberax@amazon.com, mingo@redhat.com, pavel@ucw.cz, hpa@zytor.com, linux-pm@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

UGxlYXNlIHRyeSB0byBhdm9pZCB0b3AgcG9zdGluZy4KCk9uIFdlZCwgSnVuIDEzLCAyMDE4IGF0
IDEwOjIwOjQ4UE0gKzAwMDAsIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOgo+IEhpIFJvZ2VyLAo+IFRv
IGFuc3dlciB5b3VyIHF1ZXN0aW9uLCBkdWUgdG8gdGhlIGxhY2sgb2YgbWVudGlvbmVkIGNvbW1p
dAo+IChjb21taXQgMTJlYTcyOTY0NWFjICgieGVuL2Jsa2JhY2s6IHVubWFwIGFsbCBwZXJzaXN0
ZW50IGdyYW50cyB3aGVuCj4gZnJvbnRlbmQgZ2V0cyBkaXNjb25uZWN0ZWQiKSBpbiB0aGUgb2xk
ZXIgZG9tMCBrZXJuZWxzKDwzLjIpLHJlc3VtZSBmcm9tCgpUaGlzIGZpeCB0aGF0IHlvdSBtZW50
aW9uIGlzIG9ubHkgcHJlc2VudCBpbiBrZXJuZWxzID49IDMuMTggQUZBSUNULAphbmQgcGVyc2lz
dGVudCBncmFudHMgd2hlcmUgaW50cm9kdWNlZCBpbiAzLjggKDBhODcwNGE1MWYzOCksIHNvCmFu
eXRoaW5nIDwgMy44IHNob3VsZCB3b3JrIGZpbmUuIE5vdCBzdXJlIHdoeSB5b3UgbWVudGlvbiAz
LjIgaGVyZS4KCj4gaGliZXJuYXRpb24gY2FuIGZhaWwgb24gZ3Vlc3Qgc2lkZS4gSW4gdGhlIGFi
c2VuY2Ugb2YgdGhlIGNvbW1pdCwKPiBQZXJzaXN0YW50IEdyYW50cyBhcmUgbm90IHVubWFwcGVk
IGltbWVkaWF0ZWx5IHdoZW4gZnJvbnRlbmQgaXMgCj4gZGlzY29ubmVjdGVkIGZyb20gYmFja2Vu
ZCBhbmQgaGVuY2UgbGVhdmUgdGhlIGJsb2NrIGRldmljZSBpbiBhbiAKPiBpbmNvbnNpc3RlbnQg
c3RhdGUuIFRvIGF2b2lkIHRoaXMgdW5zdGFiaWxpdHkgYW5kIHdvcmsgd2l0aCBsYXJnZXIgc2V0
IAo+IG9mIGtlcm5lbCB2ZXJzaW9ucywgdGhpcyBhcHByb2FjaCBoYWQgYmVlbiB1c2VkLiBPbmNl
IHlvdSBkb24ndCBoYXZlIAo+IGFueSBwZW5kaW5nIHJlcS9yZXNwIGl0IGlzIHNhZmVyIGZvciBn
dWVzdCB0byByZXN1bWUgZnJvbSBoaWJlcm5hdGlvbi4KCkkgdGhpbmsgdGhlIGZpeCBzaG91bGQg
YmUgYmFja3BvcnRlZCAoaWYgaXQgaGFzbid0IGJlZW4gZG9uZSB5ZXQpIHRvCmtlcm5lbHMgYmV0
d2VlbiAzLjggYW5kIDMuMTguIEkgZG9uJ3QgbGlrZSB0byBhZGQgYWxsIHRoaXMgY29kZSBqdXN0
CnRvIHdvcmsgYXJvdW5kIGEgTGludXggYmFja2VuZCBrZXJuZWwgYnVnLgoKQUZBSUNUIGlmIHBl
cnNpc3RlbnQgZ3JhbnRzIHdvcmsgYXMgZXhwZWN0ZWQgeW91IGNvdWxkIHVzZSBhbG1vc3QgdGhl
CnNhbWUgcGF0aCB0aGF0J3MgdXNlZCBmb3IgbWlncmF0aW9uLCBncmVhdGx5IHJlZHVjaW5nIHRo
ZSBhbW91bnQgb2YKY29kZSB0aGF0IHlvdSBuZWVkIHRvIGFkZC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
