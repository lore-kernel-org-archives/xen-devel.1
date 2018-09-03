From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 3 Sep 2018 16:48:18 +0300
Message-ID: <541fc291-0be8-55b3-f6ff-8380a3ee3c76@bitdefender.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <5B8D36BA02000078001E49FC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j1gd=lr=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fwpDT-0002HP-Is
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 13:48:31 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 1595E301AB30
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 16:48:30 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (unknown [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 01ABA7FC2A
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 16:48:30 +0300 (EEST)
In-Reply-To: <5B8D36BA02000078001E49FC@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8zLzE4IDQ6MjcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAzLjA5LjE4IGF0
IDEwOjI1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IFdoZW4gYW4gbmV3
IGFsdHAybSB2aWV3IGlzIGNyZWF0ZWQgdmVyeSBlYXJseSBvbiBndWVzdCBib290LCB0aGUKPj4g
ZGlzcGxheSB3aWxsIGZyZWV6ZSAoYWx0aG91Z2ggdGhlIGd1ZXN0IHdpbGwgcnVuIG5vcm1hbGx5
KS4gVGhpcwo+PiBtYXkgYWxzbyBoYXBwZW4gb24gcmVzaXppbmcgdGhlIGRpc3BsYXkuIFRoZSBy
ZWFzb24gaXMgdGhlIHdheQo+PiBYZW4gY3VycmVudGx5IChtaXMpaGFuZGxlcyBsb2dkaXJ0eSBW
R0E6IGl0IGludGVudGlvbmFsbHkKPj4gbWlzY29uZmlndXJlcyBWR0EgcGFnZXMgc28gdGhhdCB0
aGV5IHdpbGwgZmF1bHQuCj4+Cj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQgb25seSBkb2VzIHRo
aXMgaW4gdGhlIGhvc3QgcDJtLiBPbmNlIHdlCj4+IHN3aXRjaCB0byBhIG5ldyBhbHRwMm0sIHRo
ZSBtaXNjb25maWd1cmVkIGVudHJpZXMgd2lsbCBubyBsb25nZXIKPj4gZmF1bHQsIHNvIHRoZSBk
aXNwbGF5IHdpbGwgbm90IGJlIHVwZGF0ZWQuCj4+Cj4+IFRoaXMgcGF0Y2g6Cj4+Cj4+ICogdXBk
YXRlcyBlcHRfaGFuZGxlX21pc2NvbmZpZygpIHRvIHVzZSB0aGUgYWN0aXZlIGFsdHAybSBpbnN0
ZWFkCj4+ICAgb2YgdGhlIGhvc3RwMm07Cj4gCj4gV291bGRuJ3QgeW91LCBhcyBhIHByZXJlcSB0
byB0aGlzLCBmaXJzdCBuZWVkIHRvIG1ha2Ugc3VyZSBnbG9iYWwKPiBjaGFuZ2VzIGxlYWRpbmcg
dG8gRVBUIG1pc2NvbmZpZyBleGl0cyBnZXQgbWlycm9yZWQgdG8gYWxsIGFsdHAybS1zPwo+IFRo
ZSBwcmltZSBleGFtcGxlIGlzIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKCksIHdoaWNoIG9ubHkK
PiBhY3RzIG9uIHRoZSBob3N0cDJtIGFzIHdlbGwuCgpSaWdodCwgSSB0aGluayB0aGF0IG1pZ2h0
IGJlIG5lZWRlZCBhcyB3ZWxsLiBUaGVyZSdzIGFsd2F5cyBhIGNvcm5lcgpjYXNlIHRoZXJlIHRv
bywgSSB0aGluazogdGhlIHVzZXJzcGFjZSBhZ2VudCBtYXkgYWx3YXlzIGFjdGl2YXRlIGFsdHAy
bQpvbiBhIGRvbWFpbiBfYWZ0ZXJfIHRoZSBtaXNjb25maWd1cmF0aW9uIGhhcyBhbHJlYWR5IGhh
cHBlbmVkIChvbiB0aGUKaG9zdHAybSBvbmx5KSwgc28gbm90aGluZyBnb3QgcHJvcGFnYXRlZCB3
aGVuIGl0IHNob3VsZCBoYXZlLgoKSWRlYWxseSBhbGwgdGhlIGNvZGUgd291bGQgYmUgdXBkYXRl
ZCB0byB1c2UgdGhlIGFjdGl2ZSAoYWx0KXAybSBpbnN0ZWFkCm9mIHRoZSBob3N0cDJtLiBIb3dl
dmVyLCBhbHRwMm1zIGFyZSBzZWNvbmQtY2xhc3MgY2l0aXplbnMgaW4gWGVuIC0gZm9yCmV4YW1w
bGUgdGhlIGN1cnJlbnQgY29kZSBwYXlzIG5vIGF0dGVudGlvbiB0byBhbHRwMm0tPmxvZ2RpcnR5
X3Jhbmdlcwood2hpY2ggaXMgb25seSBhbGxvY2F0ZWQgaW4gcDJtX2luaXRfaG9zdHAybSgpLCBh
bmQgbGVmdCBhcyAwIC0gb3IgTlVMTAotIGJ5IHAybV9pbml0X2FsdHAybSgpKS4KCkkgdGhpbmsg
d2hhdCB3ZSBuZWVkIGlzOgoKMS4gQ3JlYXRlIGFsdHAybXMgd2l0aCBhcyBtdWNoIGluZm9ybWF0
aW9uIGFzIHRoZSBob3N0cDJtLgoKMi4gT24gc3dpdGNoLCBjb3B5IG92ZXIgYWxsIHJlbGV2YW50
IGluZm9ybWF0aW9uIGZyb20gdGhlIGN1cnJlbnRseQphY3RpdmUgcDJtICh3aGljaCBtYXkgb3Ig
bWF5IG5vdCBiZSB0aGUgaG9zdCBwMm0pLgoKVGhpcyBjYW4gZ2V0IHZlcnkgc3VidGxlLCBzaW5j
ZSBvbmUgYXBwcm9hY2ggd291bGQgYmUgdG8gZHVwbGljYXRlCmluZm9ybWF0aW9uIGluIGFsdHAy
bXMsIGFub3RoZXIgd291bGQgYmUgdG8gc2hhcmUgKGFuZCB0aHVzIGhhdmUgdG8Kc3luY2hyb25p
emUgYWNjZXNzIHRvKSB0aGF0IGluZm9ybWF0aW9uIGJldHdlZW4gdmlld3MgKGkuZS4KcG9pbnRl
ci10by1zdHJ1Y3QpLiBsb2dkaXJ0eV9yYW5nZXMgaXMgdGhlIGJlc3QgZXhhbXBsZSBvZiB0aGF0
IC0gaXQKc2hvdWxkIGhhdmUgdGhlIGV4YWN0IHNhbWUgY29udGVudHMgZm9yIGFsbCB2aWV3cyBh
cyBmYXIgYXMgSSBjYW4gdGVsbC4KVGhlIEVQVCBpbmZvcm1hdGlvbiBmb3IgbWlzY29uZmlndXJh
dGlvbnMgaXMgYW5vdGhlciBleGFtcGxlLgoKQ2xlYXJseSB0aGlzIGlzIHF1aXRlIGNvbXBsaWNh
dGVkIGNvZGUsIGhvcGVmdWxseSBHZW9yZ2Ugd2lsbCBjaGltZSBpbgp3aGVuIGhlIGdldHMgYSBj
aGFuY2UuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
