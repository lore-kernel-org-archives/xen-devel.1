From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/arm: Cap the number of interrupt
 lines for dom0
Date: Mon, 8 Apr 2019 11:24:41 +0100
Message-ID: <7aa5af51-2b28-fef6-1b71-50bc078c0069@arm.com>
References: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
 <e68dfbce-c369-eb90-97a8-894267351c8e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDRSH-0005PF-1F
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:24:45 +0000
In-Reply-To: <e68dfbce-c369-eb90-97a8-894267351c8e@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lukas Juenger <juenger@ice.rwth-aachen.de>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA0LzgvMTkgMTE6MTUgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBMdWthcywKPiAK
PiBPbiA0LzUvMTkgMjo1NCBQTSwgTHVrYXMgSnVlbmdlciB3cm90ZToKPj4gRG9tMCB2R0lDIHdp
bGwgdXNlIHRoZSBzYW1lIG51bWJlciBvZiBpbnRlcnJ1cHQgbGluZXMgYXMgdGhlIGhhcmR3YXJl
IAo+PiBHSUMuCj4+IFdoaWxlIHRoZSBoYXJkd2FyZSBHSUMgY2FuIHN1cHBvcnQgdXAgdG8gMTAy
MCBpbnRlcnJ1cHQgbGluZXMsCj4+IHRoZSB2R0lDIGlzIG9ubHkgc3VwcG9ydGluZyB1cCB0byA5
OTIgaW50ZXJydXB0IGxpbmVzLgo+PiBUaGlzIG1lYW5zIHRoYXQgWGVuIHdpbGwgbm90IGJlIGFi
bGUgdG8gYm9vdCBvbiBwbGF0Zm9ybXMgd2hlcmUgdGhlIAo+PiBoYXJkd2FyZQo+PiBHSUMgc3Vw
cG9ydHMgbW9yZSB0aGFuIDk5MiBpbnRlcnJ1cHQgbGluZXMuCj4+IFdoaWxlIGl0IHdvdWxkIG1h
a2Ugc2Vuc2UgdG8gaW5jcmVhc2UgdGhlIGxpbWl0cyBpbiB0aGUgdkdJQ3MsIHRoaXMgaXMgCj4+
IG5vdAo+PiB0cml2aWFsIGJlY2F1c2Ugb2YgdGhlIGRlc2lnbiBjaG9pY2VzLgo+PiBBdCB0aGUg
bW9tZW50LCBvbmx5IG1vZGVscyBzZWVtIHRvIHJlcG9ydCB0aGUgbWF4aW11bSBvZiBpbnRlcnJ1
cHQgbGluZXMuCj4+IFRoZXkgYWxzbyBkbyBub3QgaGF2ZSBhbnkgaW50ZXJydXB0IHdpcmVkIGFi
b3ZlIHRoZSA5OTIgbGltaXQuCj4+IFNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGNhcCB0aGUgbnVt
YmVyIG9mIGludGVycnVwdCBsaW5lcyBmb3IgZG9tMCB0byAKPj4gOTkyIGxpbmVzLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBMdWthcyBKdWVuZ2VyIDxqdWVuZ2VyQGljZS5yd3RoLWFhY2hlbi5kZT4K
PiAKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCk5vdyBw
dXNoZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
