From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Wed, 17 Jan 2018 16:28:55 +0000
Message-ID: <20180117162855.itzoanq67fn442er@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s8/r=em=citrix.com=prvs=5488b24bb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ebqaF-0007TZ-Sh
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 16:29:03 +0000
Content-Disposition: inline
In-Reply-To: <23135.30907.66445.273053@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMDQ6MjQ6MjdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCA2LzZdIGZpcm13YXJlL3NoaW06
IGZpeCBidWlsZCBwcm9jZXNzIHRvIHVzZSBQT1NJWCBmaW5kIG9wdGlvbnMiKToKPiA+IFRoZSAt
cHJpbnRmIGZpbmQgb3B0aW9uIGlzIG5vdCBQT1NJWCBjb21wYXRpYmxlLCBzbyByZXBsYWNlIGl0
IHdpdGgKPiA+IGFub3RoZXIgcnVuZS4KPiAuLi4KPiA+ICAJCSAgY2QgJChEKS8kKGQpOyBcCj4g
PiAtCQkgIGZpbmQgJChYRU5fUk9PVCkvJChkKS8gLXR5cGUgZCAtcHJpbnRmICIuLyVQXG4iIHwg
IHhhcmdzIG1rZGlyIC1wKTspCj4gPiArCQkgIGZpbmQgJChYRU5fUk9PVCkvJChkKS8gLXR5cGUg
ZCAtZXhlYyBzaCAtYyBcCj4gPiArCQkgICAgICAiZWNobyB7fSB8IHNlZCAncyxeJChYRU5fUk9P
VCkvJChkKS8sLGcnIHwgeGFyZ3MgbWtkaXIgLXAiIFw7KTspCj4gCj4gVGhpcyBpcyBub3cgYSBw
cmV0dHkgbmFzdHkgc2hlbGwgY29uc3RydWN0Lgo+IAo+IElmIHlvdSdyZSBnb2luZyB0byB1c2Ug
c2VkLCB5b3UgY291bGQganVzdAo+ICAgIGZpbmQgLi4uIC1wcmludCB8IHNlZCAuLi4gfCB4YXJn
cyBta2RpciAtcAo+IAo+IFN1YnN0aXR1dGluZyB7fSBpbnRvIHRoZSBtaWRkbGUgb2YgdGhlIHNo
ZWxsIHJ1bmUgaXMgYmFkIHByYWN0aWNlIGluCj4gZ2VuZXJhbCBiZWNhdXNlIGl0IG1pZ2h0IGNv
bnRhaW4gbWV0YWNoYXJhY3RlcnMgb3Igc3BhY2VzLiAgSW4gb3VyCj4gYnVpbGQgc3lzdGVtIHRo
aXMgZG9lc24ndCBtYXR0ZXIgYmVjYXVzZSB0aGF0IGJyZWFrcyBhbnl3YXksIGJ1dCBpdCdzCj4g
dmVyeSBwb29yIHN0eWxlIChhbmQgYWxzbyBpdCBidXJpZXMgdGhlIGFjdHVhbCBkYXRhIGZsb3cg
cGF0aCBpbnRvIHRoZQo+IG1pZGRsZSBvZiBhIGNvbXBsaWNhdGVkIG1hbmdsZW1lbnQpLgo+IAo+
IElmIHlvdSB3YW50ZWQgdG8gdXNlIC1leGVjIGFuZCBzaCwgeW91IGNvdWxkIGRvIHNvbWV0aGlu
ZyBsaWtlIHRoaXMKPiAgICAtZXhlYyBzaCAtYyAnZXhlYyBta2RpciAiJHsxIyQoWEVOX1JPT1R9
LyQoZCkvfSInIHgge30KPiBtYXliZS4KPiAKPiBBbmQgZmluYWxseSwgSSBkb24ndCByZWFsbHkg
dW5kZXJzdGFuZCB3aHkgaXQgaXMgbmVjZXNzYXJ5IHRvIHN0cmlwCj4gJChYRU5fUk9PVCkvJChk
KS8gb3V0IGF0IGFsbC4KPiAKCldlIHdhbnQgdGhlIHBhdGggd2l0aG91dCAkKFhFTl9ST09UKS8k
KGQpIHNvIHdlIGNhbiBjb25zdHJ1Y3QgdGhlIHNhbWUKdHJlZSB1bmRlciAkKGQpLiBJdCBpcyBi
ZXR0ZXIgdG8ganVzdCBsb29rIGF0IHRoZSB0cmVlIHN0cnVjdHVyZSBhZnRlcgpydW5uaW5nIHRo
ZSBsaW5rZmFybSBydW5lLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
