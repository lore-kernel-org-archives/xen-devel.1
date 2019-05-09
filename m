From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Thu, 9 May 2019 12:56:26 +0200
Message-ID: <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOgj4-0008Lt-5b
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 10:56:34 +0000
In-Reply-To: <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMjAxOSAxMjowNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA1LzkvMTkgNjoz
MiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDgvMDUvMjAxOSAxODoyNCwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDUvNi8xOSA3OjU2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IEluc3RlYWQgb2YgdXNpbmcgdGhlIFNDSEVEX09QKCkgbWFjcm8gdG8gY2FsbCB0aGUg
ZGlmZmVyZW50IHNjaGVkdWxlcgo+Pj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdy
YXBwZXJzIGZvciB0aGF0IHB1cnBvc2UuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gVGhpcyBzZWVtcyBsaWtlIGEgZ3JlYXQg
aWRlYS4gIE9uZSBtaW5vciBjb21tZW50Li4uCj4+Pgo+Pj4+ICtzdGF0aWMgaW5saW5lIGludCBz
Y2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4gK3sKPj4+PiArICAgIEFTU0VSVChz
LT5pbml0KTsKPj4+PiArICAgIHJldHVybiBzLT5pbml0KHMpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+
Pj4gK3sKPj4+PiArICAgIEFTU0VSVChzLT5kZWluaXQpOwo+Pj4+ICsgICAgcy0+ZGVpbml0KHMp
Owo+Pj4+ICt9Cj4+Pgo+Pj4gSSB0aGluayB0aGVzZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClz
LiAgVGhlc2UgYXJlbid0IGhvdCBwYXRocywgYW5kIGlmCj4+PiB3ZSBkbyBzb21laG93IGhpdCB0
aGlzIHNpdHVhdGlvbiBpbiBwcm9kdWN0aW9uLCAxKSBpdCdzIHNhZmVyIHRvCj4+PiBCVUdfT04o
KSB0aGFuIGRlcmVmZXJlbmNpbmcgTlVMTCwgYW5kIDIpIHlvdSdsbCBnZXQgYSBtb3JlIGhlbHBm
dWwgZXJyb3IKPj4+IG1lc3NhZ2UuCj4+Cj4+IE9ubHkgZm9yIHRob3NlIDIgaW5zdGFuY2VzIGFi
b3ZlPyBPciB3b3VsZCB5b3UgbGlrZSBCVUdfT04oKSBpbnN0ZWFkIG9mCj4+IEFTU0VSVCgpIGlu
IHRoZSBvdGhlciBhZGRlZCBpbmxpbmVzLCB0b28gKG1heWJlIG5vdCBmb3IgcGlja19jcHUsIGJ1
dAo+PiBlLmcuIHRoZSBvbmVzIGluIGZyZWVfKikgPwo+IAo+IFdoeSBub3QgZm9yIHBpY2tfY3B1
KCk/ICBJdCdzIHRoZSBzYW1lIGJhc2ljIGxvZ2ljIC0tIGluIHByb2R1Y3Rpb24sIGlmCj4gaXQg
KmlzKiBOVUxMLCB0aGVuIHlvdSdsbCBlaXRoZXIgY3Jhc2ggd2l0aCBhIHNlZ2ZhdWx0LCBvciBz
dGFydAo+IGV4ZWN1dGluZyBhbiBleHBsb2l0LiAgTXVjaCBiZXR0ZXIgdG8gQlVHX09OKCkuCgpw
aWNrX2NwdSBpcyBjYWxsZWQgcmF0aGVyIG9mdGVuLCBzbyBtYXliZSB3ZSBzaG91bGQgYXZvaWQg
YWRkaXRpb25hbAp0ZXN0cy4KCkhtbSwgdGhpbmtpbmcgbW9yZSBhYm91dCBpdDogd2h5IGRvbid0
IHdlIGp1c3QgZHJvcCB0aG9zZSBBU1NFUlQvQlVHX09OCmZvciBtYW5kYXRvcnkgZnVuY3Rpb25z
IGFuZCB0ZXN0IHRoZW0gd2hlbiBkb2luZyB0aGUgZ2xvYmFsX2luaXQoKSBsb29wCm92ZXIgYWxs
IHNjaGVkdWxlcnMuIFdlIGNvdWxkIGp1c3QgcmVqZWN0IHNjaGVkdWxlcnMgd2l0aCBtaXNzaW5n
CmZ1bmN0aW9ucy4KCj4gQXMgZm9yIHRoZSBgQVNTRVJUKCFkYXRhKWAsIGluc3RhbmNlcywgSSB0
aGluayBpdCdzIHRoZSByZXZlcnNlOiBJZgo+IGBkYXRhYCB0dXJucyBvdXQgdG8gYmUgbm9uLW51
bGwsIHRoZW4geW91J2xsIGxlYWsgbWVtb3J5LCBidXQgb3RoZXJ3aXNlCj4ga2VlcCB3b3JraW5n
IHVudGlsIHlvdSBydW4gb3V0LiAgSWYgeW91IG1ha2UgdGhvc2UgQlVHX09OKClzLCB0aGVuCj4g
ZXZlcnl0aGluZyBzdG9wcyBpbW1lZGlhdGVseS4gIEkgdGhpbmsgQVNTRVJUKCkgaXMgdGhlIHJp
Z2h0IHRoaW5nIGluCj4gdGhvc2UgY2FzZXMuCgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
