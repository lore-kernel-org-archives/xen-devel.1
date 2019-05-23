From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] x86/pv: Fix error handling in
 dom0_construct_pv()
Date: Thu, 23 May 2019 07:03:55 -0600
Message-ID: <5CE69A3B0200007800231B81@prv1-mh.provo.novell.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
 <1558347494-21640-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTnO6-0001He-QR
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 13:04:02 +0000
In-Reply-To: <1558347494-21640-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA1LjE5IGF0IDEyOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT25lIHBhdGggaW4gZG9tMF9jb25zdHJ1Y3RfcHYoKSByZXR1cm5zIC0xIHVubGlrZSBh
bGwgb3RoZXIgZXJyb3IgcGF0aHMuCj4gU3dpdGNoIGl0IHRvIHJldHVybmluZyAtRUlOVkFMLgo+
IAo+IFRoaXMgd2FzIGxhc3QgbW9kaWZpZWQgYnkgYy9zIGM4NDQ4MWZiIFhTQS01NSwgYnV0IHRo
ZSBidWcgcHJlZGF0ZXMgdGhhdAo+IHNlcmllcy4gIEhvd2V2ZXIsIHRoaXMgcGF0Y2ggZGlkIChm
b3Igbm8gb2J2aW91cyByZWFzb24pIGludHJvZHVjZSBhCj4gYmlmdXJjYXRlZCB0YWlsIHRvIHRo
ZSBmdW5jdGlvbiB3aXRoIHR3byBzdWJ0bHkgZGlmZmVyZW50IGVsZl9jaGVja19icm9rZW4oKQo+
IGNsYXVzZXMuCj4gCj4gQXMgdGhlIGVsZl9jaGVja19icm9rZW4oKSBpcyBqdXN0IGEgd2Fybmlu
ZyBhbmQgZG9lc24ndCBpbmZsdWVuY2UgdGhlIGZ1cnRoZXIKPiBib290LCBmb2xkIHRoZSBleGl0
IHBhdGhzIHRvZ2V0aGVyIGFuZCB1c2UgYSBzaW5nbGUgY2xhdXNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
