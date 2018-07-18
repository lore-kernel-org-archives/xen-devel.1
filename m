From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 9/9] osstest: add FreeBSD Xen build job
Date: Wed, 18 Jul 2018 18:44:26 +0200
Message-ID: <20180718164426.gjlezrcdroewtcck@mac.bytemobile.com>
References: <20180717160347.60140-1-roger.pau@citrix.com>
 <20180717160347.60140-10-roger.pau@citrix.com>
 <23375.22850.689507.77514@mariner.uk.xensource.com>
 <23375.23085.795016.699173@mariner.uk.xensource.com>
 <20180718160319.r6nwgo6ohlzjbob6@mac.bytemobile.com>
 <23375.26610.375795.469542@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lpv/=kc=citrix.com=prvs=730b0b06a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffpZ7-0000oS-Jb
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 16:44:37 +0000
Content-Disposition: inline
In-Reply-To: <23375.26610.375795.469542@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDU6MTY6NTBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIIHY0IDkvOV0gb3NzdGVz
dDogYWRkIEZyZWVCU0QgWGVuIGJ1aWxkIGpvYiIpOgo+ID4gT24gV2VkLCBKdWwgMTgsIDIwMTgg
YXQgMDQ6MTg6MDVQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiA+IFRoZSByZWFzb24g
eW91IHdhbnQgdGhlIG9zc3Rlc3QgYnJhbmNoIHRvIGJlIGNvdmVyZWQgaXMgdGhhdCBpdCBpcyBh
bgo+ID4gPiBpbnB1dCB0byB0aGlzIGpvYi4gIFRoZXJlIGlzIG5vIHByb3RlY3Rpb24gYWdhaW5z
dCBhbiB1bi1jb3ZlcmVkIGlucHV0Cj4gPiA+IGJyYW5jaGVzIGludHJvZHVjaW5nIGEgcmVncmVz
c2lvbi4KPiA+IAo+ID4gSSdtIGF0dGFjaGluZyBhIHBhdGNoIGJlbG93IHRoYXQgYWRkcyBhIEZy
ZWVCU0QgWGVuIGJ1aWxkIGpvYiB0byB0aGUKPiA+IG9zc3Rlc3QgZmxpZ2h0cy4gSSd2ZSBhbHNv
IHB1c2hlZCB0aGUgdXBkYXRlZCBicmFuY2ggdG8gbXkgZ2l0IHJlcG86Cj4gCj4gVGhhbmtzLiAg
VGhhdCBMR1RNLgo+IAo+ID4gPiBEbyB5b3Uga25vdyB3aGF0IHByb3BvcnRpb24gb2YgdGhlc2Ug
YXJlIGFjdHVhbGx5IHVzZWQgYnkgdGhlIEZyZWVCU0QKPiA+ID4gWGVuIGJ1aWxkID8gIEFsbCB0
aGF0IGFyZSBuZWVkIHRoaXMgam9iIGFkZGluZyB0byB0aGVpciBvd24gZmxpZ2h0cy4KPiA+IAo+
ID4gbWluaW9zLCBvdm1mIGFuZCBxZW11IGlzIG5vdCB1c2VkLiBJIHBsYW4gdG8gYWRkIHN1cHBv
cnQgZm9yIG92bWYsIGJ1dAo+ID4gdGhlIHJlc3QgKHNwZWNpYWxseSBxZW11LXRyYWQpIHdpbGwg
bGlrZWx5IHJlbWFpbiB1bnVzZWQuCj4gCj4gT0ssIGdvb2QuCj4gCj4gRmVlbCBmcmVlIHRvIGFk
ZCBteSBhY2tzIGV2ZXJ5d2hlcmUgdGhleSdyZSBtaXNzaW5nIGFuZCB1cGRhdGUgeW91cgo+IGJy
YW5jaC4KCkkndmUgcHVzaGVkIGl0IHRvOgoKZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9y
b3lnZXIvb3NzdGVzdC5naXQgZnJlZWJzZF9pbXByb3ZlbWVudF92NgoKPiBJJ20gYWZyYWlkIEkn
bSBnb2luZyB0byBxdWV1ZSB0aGlzIGJlaGluZCBhIHNlcmllcyBJIGFtIHdvcmtpbmcgb24gdG8K
PiBhZGRyZXNzIGNvbnRpbnVlZCBwb29yIHRocm91Z2hwdXQgZHVlIHRvIHNob3J0YWdlIG9mIHdv
cmtpbmcgYXJtaGYKPiBob3N0cy4KCk5QLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
