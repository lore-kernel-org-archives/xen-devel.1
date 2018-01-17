From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Wed, 17 Jan 2018 17:32:05 +0000
Message-ID: <20180117173205.h2etk5yh3se4e5hj@MacBook-Pro-de-Roger.local>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ebriW-0006an-8E
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 17:41:40 +0000
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
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
cyBta2RpciAtcAoKSSB0aGluayBJIHdpbGwgZ28gd2l0aCB0aGlzIG9uZS4uLgoKPiBTdWJzdGl0
dXRpbmcge30gaW50byB0aGUgbWlkZGxlIG9mIHRoZSBzaGVsbCBydW5lIGlzIGJhZCBwcmFjdGlj
ZSBpbgo+IGdlbmVyYWwgYmVjYXVzZSBpdCBtaWdodCBjb250YWluIG1ldGFjaGFyYWN0ZXJzIG9y
IHNwYWNlcy4gIEluIG91cgo+IGJ1aWxkIHN5c3RlbSB0aGlzIGRvZXNuJ3QgbWF0dGVyIGJlY2F1
c2UgdGhhdCBicmVha3MgYW55d2F5LCBidXQgaXQncwo+IHZlcnkgcG9vciBzdHlsZSAoYW5kIGFs
c28gaXQgYnVyaWVzIHRoZSBhY3R1YWwgZGF0YSBmbG93IHBhdGggaW50byB0aGUKPiBtaWRkbGUg
b2YgYSBjb21wbGljYXRlZCBtYW5nbGVtZW50KS4KPiAKPiBJZiB5b3Ugd2FudGVkIHRvIHVzZSAt
ZXhlYyBhbmQgc2gsIHlvdSBjb3VsZCBkbyBzb21ldGhpbmcgbGlrZSB0aGlzCj4gICAgLWV4ZWMg
c2ggLWMgJ2V4ZWMgbWtkaXIgIiR7MSMkKFhFTl9ST09UfS8kKGQpL30iJyB4IHt9Cj4gbWF5YmUu
CgouLi4gYmVjYXVzZSBJIGNhbm5vdCByZWFsbHkgbWFrZSAjMiB3b3JrLCBhbmQgSSdtIG5vdCBz
dXJlIEkgZnVsbHkKdW5kZXJzdGFuZCBpdC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
