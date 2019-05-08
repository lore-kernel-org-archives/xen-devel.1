From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH RFC V2 02/45] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Wed, 8 May 2019 17:35:38 +0100
Message-ID: <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUHD=TI=citrix.com=prvs=024c7dee5=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOPXo-0002WZ-Pj
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:35:48 +0000
In-Reply-To: <20190506065644.7415-3-jgross@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gSW4gb3JkZXIgdG8gcHJl
cGFyZSBjb3JlLSBhbmQgc29ja2V0LXNjaGVkdWxpbmcgdXNlIGEgbmV3IHN0cnVjdAo+IHNjaGVk
X2l0ZW0gaW5zdGVhZCBvZiBzdHJ1Y3QgdmNwdSBmb3IgaW50ZXJmYWNlcyBvZiB0aGUgZGlmZmVy
ZW50Cj4gc2NoZWR1bGVycy4KPiAKPiBSZW5hbWUgdGhlIHBlci1zY2hlZHVsZXIgZnVuY3Rpb25z
IGluc2VydF92Y3B1IGFuZCByZW1vdmVfdmNwdSB0bwo+IGluc2VydF9pdGVtIGFuZCByZW1vdmVf
aXRlbSB0byByZWZsZWN0IHRoZSBjaGFuZ2Ugb2YgdGhlIHBhcmFtZXRlci4KPiBJbiB0aGUgc2No
ZWR1bGVycyByZW5hbWUgbG9jYWwgZnVuY3Rpb25zIHN3aXRjaGVkIHRvIHNjaGVkX2l0ZW0sIHRv
by4KPiAKPiBGb3Igbm93IHRoaXMgbmV3IHN0cnVjdCB3aWxsIGNvbnRhaW4gYSB2Y3B1IHBvaW50
ZXIgb25seSBhbmQgaXMKPiBhbGxvY2F0ZWQgb24gdGhlIHN0YWNrLiBUaGlzIHdpbGwgYmUgY2hh
bmdlZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgpPeSwgSSByZWFsaXplIHRoaXMgY29tbWVudCBpcyBnb2luZyB0byBiZSBzb21ld2hh
dCBwYWluZnVsLCBidXQuLi4KJ2l0ZW0nIHJlYWxseSBzZWVtcyBsaWtlIHRoZSB3cm9uZyB3b3Jk
IGhlcmUuICBUbyBtZSAnaXRlbScgYWx3YXlzIG1lYW5zCm9uZSB0aGluZzsgd2hlcmVhcyB3aGF0
IHlvdSdyZSBwbGFubmluZyBvbiBkb2luZyBpcyBncm91cGluZyB0b2dldGhlcgp2Y3B1cyB0byBz
Y2hlZHVsZSB0b2dldGhlcjsgd2hpY2ggd291bGQgbWVhbiAidW5pdCIgKGFzIGluLCBhIG1pbGl0
YXJ5CnVuaXQpLgoKSSByZWFsaXplIGNoYW5naW5nIGl0IGhlcmUgcHJvYmFibHkgbWVhbnMgYWxz
byBjaGFuZ2luZyBpdCBpbiB0aGUgbmV4dAo0MyBwYXRjaGVzIGFzIHdlbGwuCgogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
