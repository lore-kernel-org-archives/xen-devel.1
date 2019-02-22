From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 02:52:30 -0700
Message-ID: <5C6FC65E0200007800219095@prv1-mh.provo.novell.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <5C6BBAA50200007800217DCE@prv1-mh.provo.novell.com>
 <1df95f34-34c8-88cd-6971-748d565f34a8@citrix.com>
 <5C6D146602000078002183D2@prv1-mh.provo.novell.com>
 <df8a00b2-2c53-307c-e459-d1180a2b785a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gx7VQ-0002Df-PN
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 09:52:32 +0000
In-Reply-To: <df8a00b2-2c53-307c-e459-d1180a2b785a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE5IGF0IDE5OjE5LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMDIvMjAxOSAwODo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IAo+PiBTb21l
IGVudGl0eSBuZWVkcyB0byBkZWNpZGUgd2hldGhlciB0byBhZGQgdGhlIHJlc3BlY3RpdmUgY29t
bWFuZAo+PiBsaW5lIG9wdGlvbiB0byB0aGUgY3Jhc2gga2VybmVsJ3MgY29tbWFuZCBsaW5lLiBJ
dCBzaG91bGQgYmUgdGhpcyBzYW1lCj4+IGVudGl0eSB0byB0ZWxsIFhlbiB3aGV0aGVyIHRvIGtl
ZXAgdGhlIElPTU1VIGVuYWJsZWQgd2hpbGUgaW52b2tpbmcKPj4gdGhlIGNyYXNoIGtlcm5lbC4g
SSBhbSBtZXJlbHkgZ3Vlc3NpbmcgdGhhdCB0aGlzIGVudGl0eSBpcyB0aGUga2V4ZWMKPj4gdG9v
bC4KPj4gCj4gCj4gSSB3YXMganVzdCBkb3VibGUgY2hlY2tpbmcgYW5kIGl0IHNlZW1zIChhc3N1
bWluZyB0aGUgZGV2aWNlIHJlc2V0Cj4gY29ycmVjdGx5IGluIHRoZSBjcmFzaCBrZXJuZWwpIGV2
ZXJ5dGhpbmcgc2VlbSB0byB3b3JrIGV2ZW4gd2l0aG91dAo+IGVuYWJsaW5nIGludGVsX2lvbW11
IGluIHRoZSBjb21tYW5kIGxpbmUgLSBuZXdlciBrZXJuZWxzIGhhbmRsZSB0aGlzCj4gY2FzZSBi
eSBleHBsaWNpdGx5IGRpc2FibGluZyB0cmFuc2xhdGlvbiBpbiBhbnkgY2FzZTogdGhleSBleHBl
Y3QgaXQgdG8KPiBiZSBlbmFibGVkIGJ5IHRoZSBwcmV2aW91cyBrZXJuZWwuCgpTbyBpZiB0aGV5
IGRpc2FibGUgdHJhbnNsYXRpb24sIGhvdyBpcyB0aGVtIGRvaW5nIHNvIGFueSBiZXR0ZXIgdGhh
biB1cwpkb2luZyBzbywgb3RoZXIgdGhhbiB0aGVpcnMgb2NjdXJyaW5nIHNsaWdodGx5IGxhdGVy
IG9uIHRoZSB0aW1lIHNjYWxlIGFuZApoZW5jZSB0aGVyZSBiZWluZyBiZXR0ZXIgY2hhbmNlcyBv
ZiBpbi1mbGlnaHQgKGF0IHRoZSB0aW1lIG9mIHRoZSBjcmFzaCkKRE1BIGhhdmluZyBjb21wbGV0
ZWQgbWVhbndoaWxlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
