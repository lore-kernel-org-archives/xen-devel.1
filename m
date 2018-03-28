From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.11 1/2] libxc/x86: fix mapping of the
 start_info area
Date: Wed, 28 Mar 2018 08:48:46 +0100
Message-ID: <20180328074846.2w6j64p2bpryrbgm@MacBook-Pro-de-Roger.local>
References: <20180321144211.57274-1-roger.pau@citrix.com>
 <20180321144211.57274-2-roger.pau@citrix.com>
 <20180321180957.v6unr7yhw564i2b4@citrix.com>
 <20180322091003.44yo2xopar2ktzoa@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jcus=gs=citrix.com=prvs=618139c40=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f15pQ-0003im-4G
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 07:49:04 +0000
Content-Disposition: inline
In-Reply-To: <20180322091003.44yo2xopar2ktzoa@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGluZz8KCk9uIFRodSwgTWFyIDIyLCAyMDE4IGF0IDA5OjEwOjAzQU0gKzAwMDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDY6MDk6NTdQTSArMDAw
MCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDIxLCAyMDE4IGF0IDAyOjQyOjEwUE0g
KzAwMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4gVGhlIHN0YXJ0X2luZm8gc2l6ZSBj
YWxjdWxhdGVkIGluIGJvb3RsYXRlX2h2bSBpcyB3cm9uZy4gSXQgc2hvdWxkIHVzZQo+ID4gPiBI
Vk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVCBpbnN0ZWFkIG9mIGRvbS0+bnVtX21vZHVsZXMgYW5k
IGl0IGRvZXNuJ3QKPiA+ID4gdGFrZSBpbnRvIGFjY291bnQgdGhlIHNpemUgb2YgdGhlIG1vZHVs
ZXMgY29tbWFuZCBsaW5lLgo+ID4gPiAKPiA+ID4gVGhpcyBpcyBub3QgYSBwcm9ibGVtIHNvIGZh
ciBiZWNhdXNlIHRoZSBhY3R1YWxseSB1c2VkIGFtb3VudCBvZgo+ID4gPiBtZW1vcnkgZG9lc24n
dCBjcm9zcyBhIHBhZ2UgYm91bmRhcnksIGFuZCBzbyBubyBwYWdlLWZhdWx0IGlzCj4gPiA+IHRy
aWdnZXJlZC4KPiA+IAo+ID4gSSBnZXQgdGhlIGNtZGxpbmUgYml0Lgo+ID4gCj4gPiBXaGF0IGRv
ZXMgaXQgbmVlZCB0byBiZSBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVD8gSXNuJ3QgYmV0dGVy
IHRvIGp1c3QKPiA+IG1hcCB3aGF0IHdlIG5lZWQgaGVyZT8KPiAKPiBCZWNhdXNlIHRoZSBwb3Np
dGlvbiBvZiB0aGUgbW9kdWxlcyBjb21tYW5kIGxpbmUgaXM6Cj4gCj4gbW9kbGlzdF9wYWRkciAr
IHNpemVvZihzdHJ1Y3QgaHZtX21vZGxpc3RfZW50cnkpICogSFZNTE9BREVSX01PRFVMRV9NQVhf
Q09VTlQ7Cj4gCj4gKFRoaXMgaXMgZnJvbSBhZGRfbW9kdWxlX3RvX2xpc3QpLgo+IAo+IFNvIGlm
IGRvbS0+bnVtX21vZHVsZXMgPCBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVCB0aGUgbWFwcGVk
IHJlZ2lvbgo+IGlzIHNtYWxsZXIgdGhhdCB3aGF0IHdlIG1pZ2h0IGVuZCB1cCB1c2luZy4KPiAK
PiBJJ20gbm90IHN1cmUgd2h5IEhWTUxPQURFUl9NT0RVTEVfTUFYX0NPVU5UIGlzIHVzZWQgd2hl
biBhbGxvY2F0aW5nCj4gbWVtb3J5IChpbiBhbGxvY19tYWdpY19wYWdlc19odm0pIGluc3RlYWQg
b2YgdGhlIGFjdHVhbCBudW1iZXIgb2YKPiBtb2R1bGVzIChkb20tPm51bV9tb2R1bGVzKSwgYnV0
IHRoZSBwcm9wb3NlZCBjaGFuZ2Ugc2VlbXMgdG8gYmUgdGhlCj4gZWFzaWVyIHdheSB0byBmaXgg
dGhlIG1hcHBpbmcgaXNzdWUuCj4gCj4gSSd2ZSBDQydlZCB0aGUgb3JpZ2luYWwgYXV0aG9ycyBv
ZiB0aGlzIGNvZGUgaW4gYW5vdGhlciB0aHJlYWQsIGJ1dAo+IGdvdCBubyByZXNwb25zZS4KPiAK
PiBUaGFua3MsIFJvZ2VyLgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
