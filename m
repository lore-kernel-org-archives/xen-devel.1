From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v6] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 08:54:32 -0500
Message-ID: <20180725135432.wgg7iwe6tsfs72fq@doug-macbook.localdomain>
References: <20180725092424.31707-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9jwp=kj=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fiKFP-0004gE-Ek
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:54:35 +0000
Received: by mail-yw0-x244.google.com with SMTP id y203-v6so2873060ywd.9
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 06:54:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180725092424.31707-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTA6MjQ6MjRBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IFRo
aXMgaXMgYSBzY3JpcHQgSSB3cm90ZSBwcmV2aW91c2x5IGZvciBidWlsZCB0ZXN0Lgo+IAo+IEdp
dmVuIGl0IGJhc2ljYWxseSBydW5zIGEgc2V0IG9mIGNvbW1hbmRzIG9uIGV2ZXJ5IGNvbW1pdCwg
bWF5YmUgaXQgc2hvdWxkCj4gYmUgbmFtZWQgZm9yLWVhY2gtY29tbWl0LnNoID8KClNvIGlmIHdl
IGRvIHRoYXQgY2FuIHdlIG1ha2UgaXQgY2xlYXIgdGhhdCB0aGVyZSdzIGEgZGVmYXVsdCBhY3Rp
b24KdGhhdCdzIGdvaW5nIHRvIGJlIHJ1bj8gTWVudGFsbHkgSSdkIGV4cGVjdCBhIHNjcmlwdCBj
YWxsZWQgbGlrZSB0aGF0CndvdWxkIHJlcXVpcmUgYSBjb21tYW5kIHRoYXQgaXQgd291bGQgZXhl
Y3V0ZSBidXQgeW91IGRvIGhhdmUgYSBkZWZhdWx0LgoKPiArCj4gK3doaWxlIHJlYWQgbnVtIHJl
djsgZG8KPiArICAgIGVjaG8gIlRlc3RpbmcgJG51bSAkcmV2Igo+ICsKPiArICAgIGdpdCBjaGVj
a291dCAkcmV2Cj4gKyAgICByZXQ9JD8KPiArICAgIGlmIHRlc3QgJHJldCAtbmUgMDsgdGhlbgo+
ICsgICAgICAgIGVjaG8gIkZhaWxlZCB0byBjaGVja291dCAkbnVtICRyZXYgd2l0aCAkcmV0Igo+
ICsgICAgICAgIGJyZWFrCj4gKyAgICBmaQo+ICsKPiArICAgIGlmIHRlc3QgJCMgLWVxIDAgOyB0
aGVuCj4gKyAgICAgICAgZ2l0IGNsZWFuIC1mZHggJiYgLi9jb25maWd1cmUgJiYgbWFrZSAtajQK
Cm1heWJlIHNvbWUgY29tbWVudCBpbiB0aGUgY29kZSBsaWtlICJoZXkgc29tZW9uZSByZWFkaW5n
IG1lIHRoaXMgaXMgdGhlCmRlZmF1bHQgY29tbWFuZCIKCk92ZXJhbGwgSSB0aGluayB0aGlzIGlz
IGEgZ29vZCBhZGRpdGlvbiB0byB0aGUgdHJlZS4gSWYgcGVvcGxlIGZlZWwKZGlmZmVyZW50IHRo
YW4gSSBkbyBhYm91dCB0aGUgZGVmYXVsdCBjb21tYW5kIHRoZW4gZmVlbCBmcmVlIHRvIGNvbW1p
dAp3aXRoIG15OgoKUmV2aWV3ZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNv
bT4KCi0tCkRvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
