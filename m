From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Tue, 08 Jan 2019 09:47:47 -0700
Message-ID: <5C34D433020000780020B7E8@prv1-mh.provo.novell.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <cover.1545245243.git.ppircalabu@bitdefender.com>
 <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
 <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mQY=PQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gguXi-0004t6-A0
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 16:47:54 +0000
In-Reply-To: <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE5IGF0IDE3OjM3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMS84LzE5IDY6MjcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOS4x
Mi4xOCBhdCAxOTo1MiwgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+IFNp
Z25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+
Cj4+IAo+PiBBbiBlbXB0eSBkZXNjcmlwdGlvbiBpcyBub3QgaGVscGZ1bC4gVGhlIGltbWVkaWF0
ZSBxdWVzdGlvbiBpczogV2h5Pwo+PiBXZSBkb24ndCBkbyB0aGlzIGZvciBvdGhlciBpbnRlcmZh
Y2UgdmVyc2lvbnMuIEknbSB1bmNvbnZpbmNlZCBhCj4+IHNwZWNpYWwgcHVycG9zZSBwaWVjZSBv
ZiBpbmZvcm1hdGlvbiBsaWtlIHRoaXMgb25lIGJlbG9uZ3MgaW50byB0aGUKPj4gcmF0aGVyIGdl
bmVyaWMgdmVyc2lvbiBoeXBlcmNhbGwuCj4gCj4gRm9yIGFuIGludHJvc3BlY3Rpb24gYXBwbGlj
YXRpb24gbWVhbnQgdG8gYmUgZGVwbG95ZWQgb24gc2V2ZXJhbCBYZW4gCj4gdmVyc2lvbnMgd2l0
aG91dCByZWNvbXBpbGluZywgaXQgaXMgaW1wb3J0YW50IHRvIGJlIGFibGUgdG8gZGVjaWRlIGF0
IAo+IHJ1bnRpbWUgd2hhdCBzaXplIGFuZCBsYXlvdXQgdGhlIHZtX2V2ZW50IHN0cnVjdCBoYXMu
Cj4gCj4gQ3VycmVudGx5IHRoaXMgY2FuIHNvbWV3aGF0IGJlIGRvbmUgYnkgYXNzb2NpYXRpbmcg
dGhlIGN1cnJlbnQgdmVyc2lvbiAKPiB3aXRoIHRoZSB2bV9ldmVudCB2ZXJzaW9uLCBidXQgdGhh
dCBpcyBub3QgaWRlYWwgZm9yIG9idmlvdXMgcmVhc29ucy4gCj4gUmVhZGluZyB0aGUgdm1fZXZl
bnQgdmVyc2lvbiBmcm9tIGFuIGFjdHVhbCB2bV9ldmVudCBpcyBhbHNvIG91dCBvZiB0aGUgCj4g
cXVlc3Rpb24sIGJlY2F1c2UgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byByZWNlaXZlIHRoZSBmaXJz
dCB2bV9ldmVudCB3ZSAKPiBoYXZlIHRvIHNldCB0aGUgcmluZyBidWZmZXIgdXAsIGFuZCB0aGF0
IHJlcXVpcmVzIGtub3dsZWRnZSBvZiB0aGUgc2l6ZSAKPiBvZiB0aGUgdm1fZXZlbnQuIFNvIGEg
cnVuLXRpbWUgbWVjaGFuaXNtIGZvciBxdWVyeWluZyB0aGUgdm1fZXZlbnQgCj4gdmVyc2lvbiBp
cyBuZWVkZWQuCj4gCj4gV2UganVzdCB0aG91Z2h0IHRoYXQgdGhpcyB3YXMgdGhlIG1vc3QgZmxl
eGlibGUgcGxhY2UgdG8gYWRkIGl0LgoKSG93IGFib3V0IGEgbmV3IFhFTl9ET01DVExfVk1fRVZF
TlRfR0VUX1ZFUlNJT04/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
