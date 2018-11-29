From: "Jan Beulich" <JBeulich@suse.com>
Subject: PCI BAR sizing quirks
Date: Thu, 29 Nov 2018 06:29:39 -0700
Message-ID: <5BFFE9C30200007800201371@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suqh=oi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSMPw-0003QP-4S
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 13:31:44 +0000
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIsCgppbiB0aGUgY29udGV4dCBvZiBzb21lIG90aGVyIGJ1ZyByZXBvcnQgaGVyZSBJJ3Zl
IGJlZW4gcG9pbnRlZAphdCBMaW51eCBjb21taXQgNmFmN2U0Zjc3MjU5ZWU5NDYxMDMzODczNzJj
YjE1OWYyZTk5YTZkNC4KSSB0aGluayB3ZSB3aWxsIG5lZWQgdG8gaW1wbGVtZW50IHNvbWV0aGlu
ZyBzaW1pbGFyIGZvciBhbnkKZGV2aWNlcyB0aGF0IG1heSBiZSBwcmVzZW50IG9uIHg4NiBzeXN0
ZW1zLCBidXQgZG9uJ3QgaGF2ZQpzdGFuZGFyZCBjb21wbGlhbnQgYmVoYXZpb3Igb2YgcmVnaXN0
ZXJzIGluIHdoYXQgbm9ybWFsbHkgaXMgdGhlCkJBUiByYW5nZSBpbiBjb25maWcgc3BhY2UsIGZv
ciB5b3VyIFBWSCBCQVIgaGFuZGxpbmcgdG8gbm90CmNhdXNlIGJvb3QgZmFpbHVyZXMuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
