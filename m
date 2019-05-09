From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Thu, 9 May 2019 07:32:22 +0200
Message-ID: <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hObfS-0007UC-7K
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 05:32:30 +0000
In-Reply-To: <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
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

T24gMDgvMDUvMjAxOSAxODoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA1LzYvMTkgNzo1
NiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW5zdGVhZCBvZiB1c2luZyB0aGUgU0NIRURf
T1AoKSBtYWNybyB0byBjYWxsIHRoZSBkaWZmZXJlbnQgc2NoZWR1bGVyCj4+IHNwZWNpZmljIGZ1
bmN0aW9ucyBhZGQgaW5saW5lIHdyYXBwZXJzIGZvciB0aGF0IHB1cnBvc2UuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBUaGlzIHNlZW1z
IGxpa2UgYSBncmVhdCBpZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPiAKPj4gK3N0YXRpYyBp
bmxpbmUgaW50IHNjaGVkX2luaXQoc3RydWN0IHNjaGVkdWxlciAqcykKPj4gK3sKPj4gKyAgICBB
U1NFUlQocy0+aW5pdCk7Cj4+ICsgICAgcmV0dXJuIHMtPmluaXQocyk7Cj4+ICt9Cj4+ICsKPj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9kZWluaXQoc3RydWN0IHNjaGVkdWxlciAqcykKPj4g
K3sKPj4gKyAgICBBU1NFUlQocy0+ZGVpbml0KTsKPj4gKyAgICBzLT5kZWluaXQocyk7Cj4+ICt9
Cj4gCj4gSSB0aGluayB0aGVzZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClzLiAgVGhlc2UgYXJl
bid0IGhvdCBwYXRocywgYW5kIGlmCj4gd2UgZG8gc29tZWhvdyBoaXQgdGhpcyBzaXR1YXRpb24g
aW4gcHJvZHVjdGlvbiwgMSkgaXQncyBzYWZlciB0bwo+IEJVR19PTigpIHRoYW4gZGVyZWZlcmVu
Y2luZyBOVUxMLCBhbmQgMikgeW91J2xsIGdldCBhIG1vcmUgaGVscGZ1bCBlcnJvcgo+IG1lc3Nh
Z2UuCgpPbmx5IGZvciB0aG9zZSAyIGluc3RhbmNlcyBhYm92ZT8gT3Igd291bGQgeW91IGxpa2Ug
QlVHX09OKCkgaW5zdGVhZCBvZgpBU1NFUlQoKSBpbiB0aGUgb3RoZXIgYWRkZWQgaW5saW5lcywg
dG9vIChtYXliZSBub3QgZm9yIHBpY2tfY3B1LCBidXQKZS5nLiB0aGUgb25lcyBpbiBmcmVlXyop
ID8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
