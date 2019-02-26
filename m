From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 07:58:46 -0700
Message-ID: <5C755426020000780021A5AB@prv1-mh.provo.novell.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyeC6-00077N-0X
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 14:58:54 +0000
In-Reply-To: <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDE0OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDIvMjAxOSAxMzoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gCj4+IEBA
IC0zMjMsNiArMzI3LDEwIEBAIHN0YXRpYyB2b2lkIHNldHVwX3A2X3dhdGNoZG9nKHVuc2lnbmVk
IGNvdW50ZXIpCj4+ICAgICAgdW5zaWduZWQgaW50IGV2bnRzZWw7Cj4+ICAKPj4gICAgICBubWlf
cGVyZmN0cl9tc3IgPSBNU1JfUDZfUEVSRkNUUigwKTsKPj4gKyAgICBpZiAoIGN1cnJlbnRfY3B1
X2RhdGEuY3B1aWRfbGV2ZWwgPj0gMHhhICkKPj4gKyAgICAgICAgbm1pX3A2X2V2ZW50X3dpZHRo
ID0gTUFTS19FWFRSKGNwdWlkX2VheCgweGEpLCBQNl9FVkVOVF9XSURUSF9NQVNLKTsKPj4gKyAg
ICBpZiAoICFubWlfcDZfZXZlbnRfd2lkdGggKQo+PiArICAgICAgICBubWlfcDZfZXZlbnRfd2lk
dGggPSBQNl9FVkVOVF9XSURUSF9ERUZBVUxUOwo+IAo+IFRoaXMgaXMgY2FsbGVkIG9uIGVhY2gg
Y3B1LCBidXQgd3JpdGVzIHRvIGEgc2hhcmVkIHZhcmlhYmxlLiAgVGhpcwo+IGVudGlyZSBibG9j
ayB3YW50cyB0byBiZSBzb21ldGhpbmcgbGlrZToKPiAKPiBpZiAoICFubWlfcDZfZXZlbnRfd2lk
dGggKQo+ICAgICBubWlfcDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9jcHVfZGF0YS5jcHVpZF9s
ZXZlbCA+PSAweGEpID8KPiBNQVNLX0VYVFIoY3B1aWRfZWF4KDB4YSksIFA2X0VWRU5UX1dJRFRI
X01BU0spIDogUDZfRVZFTlRfV0lEVEhfREVGQVVMVDsKPiAKPiAoc3VpdGFibHkgd3JhcHBlZCkg
c28gaXQgZ2V0cyBmaWxsZWQgb25seSBvbmNlLgoKUGx1cyB0aGUgbG93IGFuZCBoaWdoIGNhcHBp
bmcgb2YgdGhlIHZhbHVlIHJlYWQsIGFzIHJlcXVlc3RlZCBpbgpyZXBseSB0byB2MS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
