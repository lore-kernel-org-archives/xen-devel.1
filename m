From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 13:12:09 +0000
Message-ID: <31862adc-57a4-8648-29c9-018ea84caa97@citrix.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <5C6BBAA50200007800217DCE@prv1-mh.provo.novell.com>
 <1df95f34-34c8-88cd-6971-748d565f34a8@citrix.com>
 <5C6D146602000078002183D2@prv1-mh.provo.novell.com>
 <df8a00b2-2c53-307c-e459-d1180a2b785a@citrix.com>
 <5C6FC65E0200007800219095@prv1-mh.provo.novell.com>
 <94ee97ef-ce41-0940-3c7f-3b4cf2258bed@citrix.com>
 <5C6FF06F020000780021925E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3YMO=Q5=citrix.com=prvs=949a3c8b6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gxAcf-0006FX-Oi
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:12:13 +0000
In-Reply-To: <5C6FF06F020000780021925E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMjAxOSAxMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDIuMTkg
YXQgMTM6NDAsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gVGhlcmUgYXJl
IHNldmVyYWwgcmVhc29ucyB3aHkgaXQncyBiZXR0ZXI6Cj4+IGEpIGtlcm5lbCBpcyBhYmxlIHRv
IHBlcmZvcm0gZGV2aWNlIHJlc2V0IHByb3Blcmx5IGFzIGl0IGhhcyBidXMKPj4gc3BlY2lmaWMg
Y29kZSB0aGF0IGRvZXMgdGhpcy4gVGhlcmUgaXMgZXZlbiBhIGNvbW1lbnQgaW4gdGhlIGNvZGUK
Pj4gbWVudGlvbmluZyB0aGF0IGF0IHRoZSBtb21lbnQgaXQgZGlzYWJsZXMgdGhlIHRyYW5zbGF0
aW9uIGJ1cy1zcGVjaWZpYwo+PiByZXNldCBpcyBmaW5pc2hlZCBhbmQgaXQncyBzYWZlciAoYXMg
ZGV2aWNlcyBsaWtlbHkgc3RvcHBlZCBETUEgYXQgdGhpcwo+PiBwb2ludCkgdG8gZG8gaXQgbm93
Lgo+PiBiKSBrZXJuZWwgaGFzIHRoZSBkcml2ZXJzIHRoYXQgZG8gcGVyLWRyaXZlci1zcGVjaWZp
YyByZXNldCBvZiB0aGUKPj4gZGV2aWNlcyB0aGF0IGRvIG5vdCB3b3JrIHdlbGwgd2l0aCBidXMt
c3BlY2lmaWMgcmVzZXQuIEl0J3Mgc2ltcGx5Cj4+IGltcG9zc2libGUgdG8gaW1wbGVtZW50IHRo
YXQgaW4gWGVuCj4+IGMpIGV2ZW4gaWYgYSBkZXZpY2UgaXMgdW5jb29wZXJhdGl2ZSBhbmQga2Vl
cHMgc2VuZGluZyBidXMgdHJhbnNhY3Rpb25zLAo+PiBhbiBlcnJvciBldmVudCB0aGF0IEkgbWVu
dGlvbmVkIGVhcmxpZXIgd2lsbCBiZSBwcm9wZXJseSBoYW5kbGVkIGFzIHdlCj4+IGhhdmUgZmFj
aWxpdGllcyBmb3IgaXQgaW4gdGhlIGtlcm5lbCBhdCB0aGF0IHBvaW50Cj4gCj4gT2theSwgYykg
aXMgYSBjb252aW5jaW5nIGFyZ3VtZW50LiBhKSBhbmQgYikgYXJlIHBhcnRseSBvbmx5OiBJaXJj
Cj4gY3Jhc2gga2VybmVscyBkb24ndCBsb2FkIHVubmVjZXNzYXJ5IGRyaXZlcnMsIHNvIGEgYmFi
YmxpbmcgZGV2aWNlCj4gbWF5IGJlIGxlZnQgdW50b3VjaGVkIHVubGVzcyBnZW5lcmljIGtlcm5l
bCBjb2RlIGNhbiByZXNldCBvcgo+IG90aGVyd2lzZSBzaWxlbmNlIGl0LgoKQ3Jhc2gga2VybmVs
IGxvYWRzIHdoYXRldmVyIGRyaXZlcnMgYXJlIG5lY2Vzc2FyeSB0byBzYXZlIGNyYXNoIGR1bXBz
OgppZiBpdCBuZWVkcyB0byBsb2FkIFJBSUQgY29udHJvbGxlciBkcml2ZXJzIHdoaWNoIGlzIHN0
aWxsIHNlbmRpbmcgRE1BcwppdCB3aWxsIGRvIGl0IC0gdGhlcmVmb3JlIGl0IHdpbGwgdHJ5IHRv
IHJlc2V0IHRoZSBkZXZpY2UuCgpJbiBvcmRlciB0byBhdm9pZCBzY2VuYXJpbyBpbiAoYykgaWYg
dGhlIGRldmljZSBpcyB1bnRvdWNoZWQgaXQncyBzdGlsbAp1bnNhZmUgdG8gZGlzYWJsZSB0cmFu
c2xhdGlvbiB3aGlsZSBhbnkgb2YgdGhlIGRldmljZXMgb24gYSBidXMgaGF2ZW4ndApiZWVuIHBy
b3Blcmx5IHJlc2V0LiBTbyB0aGUga2VybmVsIHdpbGwgdHJ5IGl0J3MgYmVzdCB0byBhdm9pZCAo
YykgYW5kCndpbGwgcmVzZXQgYWxsIHRoZSBkZXZpY2VzLgoKSSB3YW50IHRvIGFsc28gbWVudGlv
biB0aGF0IEkndmUgdGVzdGVkIHRoaXMgcGFydGljdWxhciBjaGFuZ2UgaW4gb3VyCmxhYiBvbiBh
Ym91dCA1MDAgb2YgbWFjaGluZXMgb2YgZGlmZmVyZW50IGFnZXMgYW5kIGNsYXNzZXMuIEl0CmRl
ZmluaXRlbHkgbWFrZXMgdGhlIGNyYXNoIHBhdGggbW9yZSByZWxpYWJsZSAtIGJlZm9yZSB0aGlz
IGNoYW5nZQplbnRlcmluZyB0aGUgY3Jhc2ggZHVtcCBmYWlsZWQgaW4gfjI1LTMwJSBvZiB0aGUg
Y2FzZXMgd2hpbGUgd2l0aCB0aGlzCmNoYW5nZSByZWxpYWJpbGl0eSBpcyBjbG9zZSB0byA5OC05
OSUuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
