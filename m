From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/5] x86: split out cpuid objects and helpers
Date: Fri, 25 May 2018 11:41:04 +0200
Message-ID: <20180525094104.5ogk4qzcya5pfucc@MacBook-Pro-de-Roger.local>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifz/=im=citrix.com=prvs=676f710cf=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fM9Dn-0005YP-0G
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 09:41:15 +0000
Content-Disposition: inline
In-Reply-To: <20180524160522.757-3-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, sergey.dyasli@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMDU6MDU6MTlQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGV5IGFyZSBtb3ZlZCB0byBhIG5ldyBoZWFkZXIgd2hpY2ggaXMgZ29pbmcgdG8gYmUgY29u
c3VtZWQgYnkgYm90aAo+IHRoZSBoeXBlcnZpc29yIGFuZCB0b29sc3RhY2suCj4gCj4gQ3JlYXRl
IGEgbmV3IGRpcmVjdG9yeSBmb3IgdGhpcyBraW5kIG9mIGhlYWRlcnMgaW4gYW50aWNpcGF0aW9u
IG9mCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF50aGF0Pwo+IG1vcmUgd2lsbCBjb21lLgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4gLS0tCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBBbnkgc3VnZ2VzdGlvbiBv
biB0aGUgZGlyZWN0b3J5IG5hbWU/Cj4gLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvYXJjaC1z
aGFyZWQvY3B1aWQuaCB8IDIxMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB4
ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkLmggICAgICAgICAgICAgfCAyMTAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQoKSSB3b3VsZCBoYXZlIHBsYWNlZCB0aG9zZSBpbnNpZGUgb2Y6
Cgp4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1aWQuaAoKUHJvdGVjdGVkIHdpdGggYSAj
aWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pPwoKVGhhdCdzIGhv
dyBzdHJ1Y3R1cmVzIGFyZSBnZW5lcmFsbHkgc2hhcmVkIGJldHdlZW4gdGhlIHRvb2xzdGFjayBh
bmQKdGhlIGh5cGVydmlzb3IuIEJ1dCB0aGVuIHRoYXQgd291bGQgYWxzbyByZXF1aXJlIHlvdSB0
byBwcmVmaXggdGhvc2UKc3RydWN0dXJlcyB3aXRoICd4ZW5fJywgd2hpY2ggd2lsbCBhZGQgbW9y
ZSBjaHVybiB0byB0aGUgcGF0Y2guLi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
