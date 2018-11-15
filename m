From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 5/5] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Thu, 15 Nov 2018 09:13:28 -0700
Message-ID: <5BED9B2802000078001FC82F@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-6-roger.pau@citrix.com>
 <5BED935B02000078001FC7A4@prv1-mh.provo.novell.com>
 <20181115154808.s5natbctutnd7ztd@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wsre=n2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNKGr-0004v2-8C
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 16:13:33 +0000
In-Reply-To: <20181115154808.s5natbctutnd7ztd@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjExLjE4IGF0IDE2OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTm92IDE1LCAyMDE4IGF0IDA4OjQwOjExQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMTEuMTggYXQgMTI6NTcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQnJpZGdlcyBhcmUgbm90IGJlaGluZCBhbiBJT01NVSwgYW5kIGFyZSBhbHJl
YWR5IHNwZWNpYWwgY2FzZWQgYW5kCj4+ID4gc2lsZW50bHkgc2tpcHBlZCBpbiBhbWRfaW9tbXVf
YWRkX2RldmljZS4gQXBwbHkgdGhlIHNhbWUgc3BlY2lhbAo+PiA+IGNhc2luZyB3aGVuIHVwZGF0
aW5nIHBhZ2UgdGFibGVzLgo+PiAKPj4gQnV0IGJyaWRnZXMgYWxzbyBkb24ndCBpc3N1ZSBJL08g
b24gdGhlaXIgb3duIGlmIEknbSBub3QgbWlzdGFrZW4uIFNvCj4+IHdoYXQgSSdtIG1pc3Npbmcg
aGVyZSBpcyBhIHdvcmQgb24gdGhlIGJlbmVmaXQgb2YgdGhpcyBjaGFuZ2UuIEkgYWxzbwo+PiBx
dWVzdGlvbiB0aGUgInNpbGVudGx5IiBpbiB5b3VyIHdvcmRpbmcsIHNlZWluZyB0aGUgQU1EX0lP
TU1VX0RFQlVHKCkKPj4gdGhlcmUuCj4gCj4gSSBzZWUsIGJ5IHNpbGVudGx5IEkgbWVhbnQgd2l0
aG91dCB0aHJvd2luZyBhbiBlcnJvciwgYnV0IEkgdGhpbmsganVzdAo+IHVzaW5nICdza2lwcGVk
JyB3b3VsZCBiZSBjbGVhcmVyLgo+IAo+IFRoZSBiZW5lZml0IGlzIHRoYXQgdXBkYXRlX3BhZ2lu
Z19tb2RlIGRvZXNuJ3QgcmV0dXJuIGFuIGVycm9yIHdoZW4gaXQKPiBmaW5kcyBhIGJyaWRnZSBh
dHRhY2hlZCB0byBEb20wLCB3aGljaCB3b3VsZCBjYXVzZSB0aGUgY2FsbGVyIG9mCj4gdXBkYXRl
X3BhZ2luZ19tb2RlIChhbWRfaW9tbXVfe3VufW1hcF9wYWdlKSB0byBjcmFzaCB0aGUgZG9tYWlu
Lgo+IAo+IEllOiB3aXRob3V0IHRoaXMgY2hhbmdlIGEgUFZIIERvbTAgcnVubmluZyBvbiBBTUQg
aGFyZHdhcmUgY3Jhc2hlcwo+IHdoZW4gdGhlIElPTU1VIHBhZ2UgdGFibGUgaXMgZXhwYW5kZWQu
CgpZb3Ugd2FudCB0byBzYXkgc28gaW4gdGhlIGRlc2NyaXB0aW9uIHRoZW4uCgo+PiBUaGUgY29k
ZSBjaGFuZ2UgaXRzZWxmIGxvb2tzIGZpbmUgdG8gbWUsIGFsYmVpdCBwZXJzb25hbGx5IEknZCBw
cmVmZXIKPj4gaWYgaXQgZnVsbHkgbWF0Y2hlZCB0aGUgb3RoZXIgY29uZGl0aW9uYWwgKGkuZS4g
aWYgeW91IGZsaXBwZWQgdGhlCj4+IG9wZXJhbmRzIG9mICYmICkuIE9mIGNvdXJzZSB0aGUgc3Bl
Y2lhbCBjYXNpbmcgb2YgdGhlIGhhcmR3YXJlCj4+IGRvbWFpbiBoZXJlIGlzIHNvbWV3aGF0IG9k
ZCBhbnl3YXkuCj4gCj4gRG8geW91IG1lYW4gYmVjYXVzZSBicmlkZ2VzIHdvdWxkIG9ubHkgYmUg
ZXZlciBhc3NpZ25lZCB0byB0aGUKPiBoYXJkd2FyZSBkb21haW4/CgpObywgYmVjYXVzZSBldmVu
IGlmIHRoZXkgd2VyZSBhc3NpZ25lZCB0byBhbm90aGVyIGRvbWFpbiB0aGV5IHN0aWxsCnNob3Vs
ZCBiZSBza2lwcGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
