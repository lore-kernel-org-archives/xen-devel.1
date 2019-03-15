From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 11/12] x86/microcode: Synchronize late
 microcode loading
Date: Fri, 15 Mar 2019 09:40:28 +0000
Message-ID: <c8c5efb3-2126-dd26-37a5-4dff263842b7@citrix.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-12-git-send-email-chao.gao@intel.com>
 <20190313000751.GF11608@araj-mobl1.jf.intel.com>
 <20190313050241.GA24657@gao-cwp>
 <5C88B746020000780021DF4D@prv1-mh.provo.novell.com>
 <5C88B92F020000780021DF64@prv1-mh.provo.novell.com>
 <d55bb90e-5ca4-0544-be5f-bbd0168c060a@citrix.com>
 <20190314185712.GA20889@araj-mobl1.jf.intel.com>
 <alpine.DEB.2.21.1903141306180.1948@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OIle=RS=citrix.com=prvs=970d66146=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4jKf-0006fu-H8
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 09:40:53 +0000
In-Reply-To: <alpine.DEB.2.21.1903141306180.1948@nanos.tec.linutronix.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Raj, Ashok" <ashok.raj@intel.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Borislav Petkov <bp@suse.de>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, "Mallick,
 Asit K" <asit.k.mallick@intel.com>, Peter Zijlstra <peterz@infradead.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAyMDoyNSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IEFzaG9rLAo+Cj4g
T24gVGh1LCAxNCBNYXIgMjAxOSwgUmFqLCBBc2hvayB3cm90ZToKPj4gT24gVGh1LCBNYXIgMTQs
IDIwMTkgYXQgMTI6Mzk6NDZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIGxh
dGUgbG9hZCBmYWlsdXJlLCB3ZSBzaG91bGQgZHVtcCBlbm91Z2ggaW5mb3JtYXRpb24gdG8gd29y
ayBvdXQKPj4+IGV4YWN0bHkgd2hhdCB3ZW50IG9uLCB0byBkZXRlcm1pbmUgaG93IGJlc3QgdG8g
cHJvY2VlZCwgYnV0IHRoZSBzZXJ2ZXIKPj4+IGlzIGVmZmVjdGl2ZWx5IGxvc3QgdG8gdXMuwqAg
T24gbGF0ZSBsb2FkIHN1Y2Nlc3MsIHRoZSBwcm9wb3NlZCBuZXcKPj4+ICJ2ZXJzaW9uIiByZXBs
YWNlcyB0aGUgY3VycmVudCAidmVyc2lvbiIuCj4+Pgo+Pj4gQW5kIGFnYWluIC0gSSByZWl0ZXJh
dGUgdGhlIHBvaW50IHRoYXQgSSB0aGluayBpdCBpcyBmaW5lIHRvIGhhdmUgYQo+Pj4gc2ltcGxp
ZnlpbmcgYXNzdW1wdGlvbiB0aGF0IHdlIGRvbid0IGhhdmUgbWl4ZWQgc3RlcHBpbmcgc3lzdGVt
cyB0bwo+Pj4gc3RhcnQgd2l0aCwgcHJlc3VtaW5nIHRoaXMgaXMgZ2VuZXJhbGx5IGluIGxpbmUg
d2l0aCBJbnRlbCdzIHN1cHBvcnQKPj4+IHN0YXRlbWVudC7CoCBJZiBpbiBwcmFjdGljZSB3ZSBm
aW5kIG1peGVkIHN0ZXBwaW5nIHN5c3RlbXMgd2hpY2ggYXJlCj4+PiBzdXBwb3J0ZWQgYnkgYW4g
T0VNL0ludGVsLCB3ZSBjYW4gc2VlIGFib3V0IGV4dGVuZGluZyB0aGUgbG9naWMuCj4+IENoZWNr
aW5nIHdpdGggQXNpdCBoZSBzYXlzIGl0IGlzIGluIGZhY3QgcGVybWl0dGVkIHRvIGhhdmUgMSBz
dGVwIGJlaGluZAo+PiBldmVuIG9uIGEgbXVsdGktc29ja2V0IHN5c3RlbS4gT25lIGNvdWxkIGJl
IE4gYW5kIG90aGVyIE4tMSBzaG91bGQgYmUgCj4+IHN1cHBvcnRlZC4KPiBUaGF0IHR1cm5zIGlu
dG8gYSB0b3RhbCBkaXNhc3RlciBpZiBOIGhhcyBhbiBpc3N1ZSBmaXhlZCBhbnQgTi0xIHJlcXVp
cmVzCj4gbWljcm9jb2RlICsgc29mdHdhcmUgd29ya2Fyb3VuZC4KPgo+IFNvIGlmIE4gaXMgb24g
dGhlIGJvb3Qgc29ja2V0LCB0aGVuIHdlIGZhaWwgdG8gZW5hYmxlIHRoZSB3b3JrYXJvdW5kCj4g
YmVjYXVzZSBDUFUwIGhhcyB0aGUgJ0lzc3VlIGZpeGVkJyBiaXQgc2V0Lgo+Cj4gSWYgTi0xIGlz
IG9uIHRoZSBib290IHNvY2tldCwgdGhlbiB3ZSBnbyB0byBkbyB0aGUgd29ya2Fyb3VuZCBuZXZl
cnRoZWxlc3MKPiBvbiBOIGFuZCB0aGF0IG1pZ2h0IGRlcGVuZGVuZCBvbiB0aGUgaXNzdWUganVz
dCBiZSBzb21lIHBvaW50bGVzcyBleGVyY2lzZQo+IG9yIGV2ZW4gdHJ5IHRvIGFjY2VzcyBzb21l
IE1TUiB3aGljaCBpcyBub3QgYXZhaWxhYmxlLgo+Cj4gKlNodWRkZXIqCgpJbnRlbDogQXJlIHlv
dSBzYXlpbmcgdGhhdCBTa3lsYWtlICgwNi01NS0wNCkgaXMgc3VwcG9ydGVkIGluCmNvbWJpbmF0
aW9uIHdpdGggQ2FzY2FkZSBMYWtlIEIwICgwNi01NS0wNSkgYW5kL29yIENhc2NhZGUgTGFrZSBC
MQooMDYtNTUtMDYpID8KClRoZSBtb3N0IGluc2lkaW91cyBwcm9ibGVtIGlzIFRTWF9GT1JDRV9B
Qk9SVCBiZXR3ZWVuIHRoZSB0d28gQ2FzY2FkZQpMYWtlcy7CoCBUaGVyZSByZWFsbHkgd2lsbCBi
ZSBhbiBhc3ltbWV0cmljIGV4aXN0ZW5jZSBvZiBhbiBNU1IgcmVxdWlyZWQKZm9yIHVzZSBpbiBv
bmUgcGFydCBvZiB0aGUgc3lzdGVtLCBhbmQgdW5hdmFpbGFibGUgaW4gdGhlIG90aGVyIHBhcnQg
b2YKdGhlIHN5c3RlbS4KClRvIGEgY2VydGFpbiBkZWdyZWUsIHdoYXQgaXMgdGVjaG5pY2FsbHkg
c3VwcG9ydGVkIGJ5IEludGVsIGlzIGFsc28KdGVtcGVyZWQgYnkgd2hhdCB0aGUgbWFqb3IgT1Mv
Vk1NIHZlbmRvcnMgYXJlIHdpbGxpbmcgdG8gYm9vdCBvbiwgYXMKdGhhdCBpcyB1bHRpbWF0ZWx5
IHdoYXQgdGhlIGN1c3RvbWVyIGlzIHBheWluZyBmb3IuwqAgV2hlbiB0aGUgc3RlcHBpbmdzCmRp
ZmZlcmVkIG9ubHkgYnkgdGhlIGVycmF0YSBmaXhlZCwgYW5kIHRoZSBzaWxpY29uIHdhcyBvdGhl
cndpc2UKaWRlbnRpY2FsIGZyb20gc29mdHdhcmUncyBwb2ludCBvZiB2aWV3LCBzdXBwb3J0aW5n
IGEgcmFuZ2Ugb2YgYWRqYWNlbnQKc3RlcHBpbmdzIHNlZW1zIGVudGlyZWx5IHJlYXNvbmFibGUu
CgpJbiB0aGlzIGNhc2UgeW91J3ZlIGdvdCAzIGFkamFjZW50IHN0ZXBwaW5ncywgKmFsbCogb2Yg
d2hpY2ggb2ZmZXIKZGlmZmVyZW50IGFyY2hpdGVjdHVyYWxseSBkZWZpbmVkIGZlYXR1cmVzLCBh
bmQgd2lsbCBpbnZvbHZlIHNvZnR3YXJlCmNoYW5nZXMgdG8gYWxsb3cgbWl4ZWQgc3lzdGVtcyB0
byBmdW5jdGlvbiBpbiBhIHNhZmUgd2F5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
