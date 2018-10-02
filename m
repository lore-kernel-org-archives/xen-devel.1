From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 2 Oct 2018 14:36:25 +0100
Message-ID: <d4c125cc-bcd0-94c1-d176-4e9631af6b9f@arm.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
 <7977a721-e2f6-db00-ee6a-2744cde3cc66@arm.com>
 <01503197-8c8f-921b-7a13-f4862777f1a3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf1e=mo=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g7Kqk-0000bs-Mg
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 13:36:30 +0000
In-Reply-To: <01503197-8c8f-921b-7a13-f4862777f1a3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8xMC8yMDE4IDE0OjM1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDAyLzEwLzE4
IDE0OjI4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEFuZHJldywKPj4KPj4gT24gMDIvMTAv
MjAxOCAxNDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDAyLzEwLzE4IDExOjEyLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPj4+PiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPj4+PiBAQCAtNjYsNiArNjYsMTAgQEAKPj4+PiAg
wqAgwqAgI2RlZmluZSBST1VORFVQKHgsIGEpICgoKHgpICsgKGEpIC0gMSkgJiB+KChhKSAtIDEp
KQo+Pj4+ICDCoCArI2RlZmluZSBjb3VudF92YV9hcmdfKGRvdCwgYTEsIGEyLCBhMywgYTQsIGE1
LCBhNiwgYTcsIGE4LCB4LCAuLi4pIHgKPj4+PiArI2RlZmluZSBjb3VudF92YV9hcmcoYXJncy4u
LikgXAo+Pj4+ICvCoMKgwqAgY291bnRfdmFfYXJnXyguLCAjIyBhcmdzLCA4LCA3LCA2LCA1LCA0
LCAzLCAyLCAxLCAwKQo+Pj4KPj4+IFRoaXMgcGFydGljdWxhciBiaXQgb2YgcmV2aWV3IHNwbGl0
IG91dCBmb3Igb2J2aW91cyByZWFzb25zLgo+Pj4KPj4+IFdlIGFscmVhZHkgaGF2ZSBfX2NvdW50
X2FyZ3MoKSBpbiB0aGUgQVJNIFNNQ0NDIGluZnJhc3RydWN0dXJlLsKgIFBsZWFzZQo+Pj4gY2Fu
IHdlIGRlZHVwIHRoYXQgKGJyb2tlbiBvdXQgaW50byBhIHNlcGFyYXRlIHBhdGNoKSByYXRoZXIg
dGhhbgo+Pj4gaW50cm9kdWNpbmcgYSBjb21wZXRpbmcgdmVyc2lvbi4KPj4+Cj4+PiBUaGUgQVJN
IHZlcnNpb24gaXMgYnVnZ3kuwqAgSXQgaXMgb2ZmLWJ5LXR3byBpbiB0aGUgYmFzZSBjYXNlLCBh
bmQKPj4+IGRvZXNuJ3QgY29tcGlsZSBpZiBmZXdlciB0aGFuIHR3byBwYXJhbWV0ZXJzIGFyZSBw
YXNzZWQuwqAgVGhpcyB2ZXJzaW9uCj4+PiBmdW5jdGlvbnMgY29ycmVjdGx5LCBidXQgc2hvdWxk
IGJlIG5hbWVkIHdpdGggYSBwbHVyYWwuCj4+Cj4+IFRoZSBBUk0gdmVyc2lvbiBpcyAqbm90KiBi
dWdneS4gV2hhdCB0aGUgQVJNIHZlcnNpb24gY291bnQgaXMgdGhlCj4+IG51bWJlciBvZiBwYXJh
bWV0ZXJzIGZvciB0aGUgU01DQ0MgZnVuY3Rpb24sICpub3QqIHRoZSBudW1iZXIgb2YKPj4gcGFy
YW1ldGVyIGZvciB0aGUgY2FsbC4KPj4KPj4gVGhpcyBtYXRjaGVzIHRoZSBTTUNDQyB3aGVyZSB0
aGUgZmlyc3QgcGFyYW1ldGVyIGlzIGFsd2F5cyB0aGUKPj4gZnVuY3Rpb24gSUQsIHRoZSBsYXN0
IHBhcmFtZXRlciBpcyBhbHdheXMgdGhlIHJlc3VsdCBzdHJ1Y3R1cmUuCj4+Cj4+IFRoZSBjb2Rl
IHdpbGwgZW5kIHVwIHRvIGJlIGxlc3MgcmVhZGFibGUgdXNpbmcgYSBnZW5lcmljIGNvdW50LiBJ
IGFtCj4+IHBsYW5uaW5nIHRvIE5hY2sgYW55dGhpbmcgdHJ5aW5nIHRvIHVzZSBhIGdlbmVyaWMg
Y291bnQgaW4gdGhlIFNNQ0NDCj4+IGNvZGUuCj4gCj4gWWVzIGl0IGlzIGJ1Z2d5LCBiZWNhdXNl
IGl0IGRvZXNuJ3QgYmVoYXZlIGFzIHRoZSBuYW1lIHN1Z2dlc3RzLgo+IAo+IElmIHlvdSBtZWFu
IHRoZSBpbmZyYXN0cnVjdHVyZSB0byBoYXZlIFNNQ0NDIHNwZWNpZmljIGJlaGF2aW91ciwgdGhl
Cj4gbWFjcm9zIHNob3VsZCBiZSBuYW1lZCBzdWl0YWJseSwgdG8gYXZvaWQgaW50ZXJmZXJpbmcg
d2l0aCBjb21tb24gY29kZS4KCldlbGwgdGhlIGNvZGUgaXMgY29taW5nIGZyb20gTGludXguIEZl
ZWwgZnJlZSB0byBzZW5kIGEgcGF0Y2ggdG8gZml4IHRoZSAKbmFtZSBpbiBMaW51eCBhbmQgWGVu
LgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
