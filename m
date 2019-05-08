From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Wed, 8 May 2019 17:24:53 +0100
Message-ID: <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUHD=TI=citrix.com=prvs=024c7dee5=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOPNa-0001Pq-9O
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:25:14 +0000
In-Reply-To: <20190506065644.7415-2-jgross@suse.com>
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

T24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gSW5zdGVhZCBvZiB1c2lu
ZyB0aGUgU0NIRURfT1AoKSBtYWNybyB0byBjYWxsIHRoZSBkaWZmZXJlbnQgc2NoZWR1bGVyCj4g
c3BlY2lmaWMgZnVuY3Rpb25zIGFkZCBpbmxpbmUgd3JhcHBlcnMgZm9yIHRoYXQgcHVycG9zZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpUaGlz
IHNlZW1zIGxpa2UgYSBncmVhdCBpZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KCj4gK3N0YXRp
YyBpbmxpbmUgaW50IHNjaGVkX2luaXQoc3RydWN0IHNjaGVkdWxlciAqcykKPiArewo+ICsgICAg
QVNTRVJUKHMtPmluaXQpOwo+ICsgICAgcmV0dXJuIHMtPmluaXQocyk7Cj4gK30KPiArCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9kZWluaXQoc3RydWN0IHNjaGVkdWxlciAqcykKPiArewo+
ICsgICAgQVNTRVJUKHMtPmRlaW5pdCk7Cj4gKyAgICBzLT5kZWluaXQocyk7Cj4gK30KCkkgdGhp
bmsgdGhlc2Ugd291bGQgYmV0dGVyIGFzIEJVR19PTigpcy4gIFRoZXNlIGFyZW4ndCBob3QgcGF0
aHMsIGFuZCBpZgp3ZSBkbyBzb21laG93IGhpdCB0aGlzIHNpdHVhdGlvbiBpbiBwcm9kdWN0aW9u
LCAxKSBpdCdzIHNhZmVyIHRvCkJVR19PTigpIHRoYW4gZGVyZWZlcmVuY2luZyBOVUxMLCBhbmQg
MikgeW91J2xsIGdldCBhIG1vcmUgaGVscGZ1bCBlcnJvcgptZXNzYWdlLgoKRXZlcnl0aGluZyBl
bHNlIExHVE0uCgogLUdlb3JnZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
