From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Tue, 8 Jan 2019 18:37:52 +0200
Message-ID: <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <cover.1545245243.git.ppircalabu@bitdefender.com>
 <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PPOx=PQ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gguO4-000277-HO
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 16:37:56 +0000
In-Reply-To: <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMS84LzE5IDY6MjcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjEyLjE4IGF0
IDE5OjUyLCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBTaWduZWQtb2Zm
LWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgo+IAo+IEFu
IGVtcHR5IGRlc2NyaXB0aW9uIGlzIG5vdCBoZWxwZnVsLiBUaGUgaW1tZWRpYXRlIHF1ZXN0aW9u
IGlzOiBXaHk/Cj4gV2UgZG9uJ3QgZG8gdGhpcyBmb3Igb3RoZXIgaW50ZXJmYWNlIHZlcnNpb25z
LiBJJ20gdW5jb252aW5jZWQgYQo+IHNwZWNpYWwgcHVycG9zZSBwaWVjZSBvZiBpbmZvcm1hdGlv
biBsaWtlIHRoaXMgb25lIGJlbG9uZ3MgaW50byB0aGUKPiByYXRoZXIgZ2VuZXJpYyB2ZXJzaW9u
IGh5cGVyY2FsbC4KCkZvciBhbiBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uIG1lYW50IHRvIGJl
IGRlcGxveWVkIG9uIHNldmVyYWwgWGVuIAp2ZXJzaW9ucyB3aXRob3V0IHJlY29tcGlsaW5nLCBp
dCBpcyBpbXBvcnRhbnQgdG8gYmUgYWJsZSB0byBkZWNpZGUgYXQgCnJ1bnRpbWUgd2hhdCBzaXpl
IGFuZCBsYXlvdXQgdGhlIHZtX2V2ZW50IHN0cnVjdCBoYXMuCgpDdXJyZW50bHkgdGhpcyBjYW4g
c29tZXdoYXQgYmUgZG9uZSBieSBhc3NvY2lhdGluZyB0aGUgY3VycmVudCB2ZXJzaW9uIAp3aXRo
IHRoZSB2bV9ldmVudCB2ZXJzaW9uLCBidXQgdGhhdCBpcyBub3QgaWRlYWwgZm9yIG9idmlvdXMg
cmVhc29ucy4gClJlYWRpbmcgdGhlIHZtX2V2ZW50IHZlcnNpb24gZnJvbSBhbiBhY3R1YWwgdm1f
ZXZlbnQgaXMgYWxzbyBvdXQgb2YgdGhlIApxdWVzdGlvbiwgYmVjYXVzZSBpbiBvcmRlciB0byBi
ZSBhYmxlIHRvIHJlY2VpdmUgdGhlIGZpcnN0IHZtX2V2ZW50IHdlIApoYXZlIHRvIHNldCB0aGUg
cmluZyBidWZmZXIgdXAsIGFuZCB0aGF0IHJlcXVpcmVzIGtub3dsZWRnZSBvZiB0aGUgc2l6ZSAK
b2YgdGhlIHZtX2V2ZW50LiBTbyBhIHJ1bi10aW1lIG1lY2hhbmlzbSBmb3IgcXVlcnlpbmcgdGhl
IHZtX2V2ZW50IAp2ZXJzaW9uIGlzIG5lZWRlZC4KCldlIGp1c3QgdGhvdWdodCB0aGF0IHRoaXMg
d2FzIHRoZSBtb3N0IGZsZXhpYmxlIHBsYWNlIHRvIGFkZCBpdC4KCgpUaGFua3MsClJhenZhbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
