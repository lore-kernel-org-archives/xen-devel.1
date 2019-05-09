From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Thu, 9 May 2019 11:04:31 +0100
Message-ID: <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYh4=TJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOgcW-0007aJ-L5
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 10:49:48 +0000
In-Reply-To: <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS85LzE5IDY6MzIgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDgvMDUvMjAxOSAx
ODoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBJbnN0ZWFkIG9mIHVzaW5nIHRoZSBTQ0hFRF9PUCgpIG1hY3JvIHRv
IGNhbGwgdGhlIGRpZmZlcmVudCBzY2hlZHVsZXIKPj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQg
aW5saW5lIHdyYXBwZXJzIGZvciB0aGF0IHB1cnBvc2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+PiBUaGlzIHNlZW1zIGxpa2UgYSBn
cmVhdCBpZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPj4KPj4+ICtzdGF0aWMgaW5saW5lIGlu
dCBzY2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+PiArewo+Pj4gKyAgICBBU1NFUlQo
cy0+aW5pdCk7Cj4+PiArICAgIHJldHVybiBzLT5pbml0KHMpOwo+Pj4gK30KPj4+ICsKPj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+PiAr
ewo+Pj4gKyAgICBBU1NFUlQocy0+ZGVpbml0KTsKPj4+ICsgICAgcy0+ZGVpbml0KHMpOwo+Pj4g
K30KPj4KPj4gSSB0aGluayB0aGVzZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClzLiAgVGhlc2Ug
YXJlbid0IGhvdCBwYXRocywgYW5kIGlmCj4+IHdlIGRvIHNvbWVob3cgaGl0IHRoaXMgc2l0dWF0
aW9uIGluIHByb2R1Y3Rpb24sIDEpIGl0J3Mgc2FmZXIgdG8KPj4gQlVHX09OKCkgdGhhbiBkZXJl
ZmVyZW5jaW5nIE5VTEwsIGFuZCAyKSB5b3UnbGwgZ2V0IGEgbW9yZSBoZWxwZnVsIGVycm9yCj4+
IG1lc3NhZ2UuCj4gCj4gT25seSBmb3IgdGhvc2UgMiBpbnN0YW5jZXMgYWJvdmU/IE9yIHdvdWxk
IHlvdSBsaWtlIEJVR19PTigpIGluc3RlYWQgb2YKPiBBU1NFUlQoKSBpbiB0aGUgb3RoZXIgYWRk
ZWQgaW5saW5lcywgdG9vIChtYXliZSBub3QgZm9yIHBpY2tfY3B1LCBidXQKPiBlLmcuIHRoZSBv
bmVzIGluIGZyZWVfKikgPwoKV2h5IG5vdCBmb3IgcGlja19jcHUoKT8gIEl0J3MgdGhlIHNhbWUg
YmFzaWMgbG9naWMgLS0gaW4gcHJvZHVjdGlvbiwgaWYKaXQgKmlzKiBOVUxMLCB0aGVuIHlvdSds
bCBlaXRoZXIgY3Jhc2ggd2l0aCBhIHNlZ2ZhdWx0LCBvciBzdGFydApleGVjdXRpbmcgYW4gZXhw
bG9pdC4gIE11Y2ggYmV0dGVyIHRvIEJVR19PTigpLgoKQXMgZm9yIHRoZSBgQVNTRVJUKCFkYXRh
KWAsIGluc3RhbmNlcywgSSB0aGluayBpdCdzIHRoZSByZXZlcnNlOiBJZgpgZGF0YWAgdHVybnMg
b3V0IHRvIGJlIG5vbi1udWxsLCB0aGVuIHlvdSdsbCBsZWFrIG1lbW9yeSwgYnV0IG90aGVyd2lz
ZQprZWVwIHdvcmtpbmcgdW50aWwgeW91IHJ1biBvdXQuICBJZiB5b3UgbWFrZSB0aG9zZSBCVUdf
T04oKXMsIHRoZW4KZXZlcnl0aGluZyBzdG9wcyBpbW1lZGlhdGVseS4gIEkgdGhpbmsgQVNTRVJU
KCkgaXMgdGhlIHJpZ2h0IHRoaW5nIGluCnRob3NlIGNhc2VzLgoKKEkgZG8gaGF2ZSBhIGRyYWZ0
IG9mIHNvbWUgZ3VpZGVsaW5lcyBmb3IgdGhpcyBzb3J0IG9mIHRoaW5nLi4uCmhvcGVmdWxseSBJ
J2xsIGZpbmQgdGltZSB0byByZS1wb3N0IHRoZW0gc29tZXRpbWUgaW4gdGhlIG5leHQgbW9udGgg
b3IgdHdvLikKCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
