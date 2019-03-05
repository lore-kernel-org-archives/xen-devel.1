From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] IOMMU/x86: make page type checks
 consistent when mapping pages
Date: Tue, 5 Mar 2019 16:23:21 +0100
Message-ID: <97686474-f14b-efe6-82b7-5d58b6462ec5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1Bui-0001Tl-9j
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 15:23:28 +0000
References: =?UTF-8?Q?=3c5C7E77D1020000780021BB0B=40prv1=ef=bf=bdmh=2eprovo?=
 =?UTF-8?Q?=2enovell=2ecom=3e_=3c5C7E78F6020000780021BB21=40suse=2ecom=3e_?=
 =?UTF-8?Q?=3c5c1f67ea-59e1-6acd-840a-5c359bb663db=40suse=2ecom=3e_=3c5C7E94?=
 =?UTF-8?Q?01020000780021BC5A=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMDMuMTkg
YXQgMTQ6NTAsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwNS8wMy8yMDE5IDE0OjI2
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoZXJlIGFyZSBjdXJyZW50bHkgdGhyZWUgbW9yZSBv
ciBsZXNzIGRpZmZlcmVudCBjaGVja3M6Cj4+PiAtIF9nZXRfcGFnZV90eXBlKCkgYWRqdXN0cyB0
aGUgSU9NTVUgbWFwcGluZ3MgYWNjb3JkaW5nIHRvIHRoZSBuZXcgdHlwZQo+Pj4gICBhbG9uZSwK
Pj4+IC0gYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgd2FudHMganVzdCB0aGUgdHlw
ZSB0byBiZQo+Pj4gICBQR1Rfd3JpdGFibGVfcGFnZSwKPj4+IC0gaW9tbXVfaHdkb21faW5pdCgp
IGFkZGl0aW9uYWxseSBwZXJtaXRzIGFsbCBvdGhlciB0eXBlcyB3aXRoIGEgdHlwZQo+Pj4gICBy
ZWZjb3VudCBvZiB6ZXJvLgo+Pj4gVGhlIGNhbm9uaWNhbCBvbmUgaXMgaW4gX2dldF9wYWdlX3R5
cGUoKSwgYW5kIGFzIG9mIFhTQS0yODgKPj4+IGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJs
ZSgpIGFsc28gaGFzIG5vIG5lZWQgYW55bW9yZSB0byBkZWFsIHdpdGgKPj4+IFBHVF9ub25lIHBh
Z2VzLiBJbiB0aGUgUFYgRG9tMCBjYXNlLCBob3dldmVyLCBQR1Rfbm9uZSBwYWdlcyBhcmUgc3Rp
bGwKPj4+IG5lY2Vzc2FyeSB0byBjb25zaWRlciwgc2luY2UgaW4gdGhhdCBjYXNlIHBhZ2VzIGRv
bid0IGdldCBoYW5kZWQgdG8KPj4+IGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KCkuIEZ1cnRoZXJt
b3JlLCB0aGUgZnVuY3Rpb24gc28gZmFyIGFsc28KPj4+IGVzdGFibGlzaGVkIHIvbyBtYXBwaW5n
cywgd2hpY2ggaXMgbm90IGluIGxpbmUgd2l0aCB0aGUgcnVsZXMgc2V0IGZvcnRoCj4+PiBieSB0
aGUgWFNBLTI4OCBjaGFuZ2UuCj4+Pgo+Pj4gRm9yIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90
YWJsZSgpIHRvIG5vdCBlbmNvdW50ZXIgUEdUX25vbmUgcGFnZXMKPj4+IGFueW1vcmUgZXZlbiBp
biBjYXNlcyB3aGVyZSB0aGUgSU9NTVUgZ2V0cyBlbmFibGVkIGZvciBhIGRvbWFpbiBvbmx5Cj4+
PiB3aGVuIGl0IGlzIGFscmVhZHkgcnVubmluZywgcmVwbGFjZSB0aGUgSU9NTVUgZGVwZW5kZW5j
eSBpbgo+Pj4gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSdzIGhhbmRsaW5nIG9mIFBWIGd1ZXN0
cyB0byBjaGVjayBqdXN0IHRoZQo+Pj4gc3lzdGVtIHdpZGUgc3RhdGUgaW5zdGVhZCBvZiB0aGUg
ZG9tYWluIHByb3BlcnR5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4KPj4gSSdtIHVuYWJsZSB0byBkZWNpZGUgd2hldGhlciB0aGlzIHBh
dGNoIHNob3VsZCBtYWtlIGl0IGludG8gNC4xMiBvciBub3QKPj4gd2l0aCB0aGUgZ2l2ZW4gaW5m
b3JtYXRpb24uIFdoYXQgaGFwcGVucyB3aXRob3V0IHRoaXMgcGF0Y2ggKHdvcnN0Cj4+IGNhc2Up
Pwo+IAo+IEkgZG9uJ3QgdGhpbmsgYW55dGhpbmcgcmVhbGx5IGJhZCBjYW4gaGFwcGVuLCBvciBl
bHNlIHRoaXMgd291bGQgaGF2ZQo+IGJlZW4gcGFydCBvZiBvbmUgb2YgdGhlIFhTQXMuIFRoZSBw
YXRjaCBpcyBicmluZ2luZyB0aGluZ3MgaW4gbGluZSB3aXRoCj4gd2hhdCBYU0EtMjg4IGRpZCwg
d2l0aG91dCBpdCBiZWluZyBvYnZpb3VzIHdoYXQgYmFkIGNvdWxkIHJlc3VsdAo+IGZyb20gbm90
IGRvaW5nIHNvLiBUaGUgbGFyZ2VyIHBhcnQgb2YgY2hhbmdlIGhlcmUgaXMgZm9yIGh3ZG9tIG9u
bHkKPiBhbnl3YXkuCgpPa2F5LCB0aGFua3MuIEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgYmUg
ZGVmZXJyZWQgdGhlbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
