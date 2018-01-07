From: Matt Wilson <msw@amzn.com>
Subject: Re: [PATCH 07/22] vixen: introduce is_vixen() to allow
 altering behavior
Date: Sat, 6 Jan 2018 16:06:18 -0800
Message-ID: <20180107000618.GB13546@ued668862963453.ant.amazon.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-8-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rs9j=ec=amzn.com=prvs=538413ddc=msw@srs-us1.protection.inumbo.net>)
 id 1eXyTt-0006d4-JJ
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 00:06:29 +0000
Content-Disposition: inline
In-Reply-To: <1515279277-16301-8-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDI6NTQ6MjJQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBWaXhlbiAoVmlydHVhbGl6ZWQgWGVuKSBpcyBhIHBhcmF2aXJ0dWFsIG1vZGUgb2YgWGVuIHdo
ZXJlCj4gcGFyYXZpcnR1YWwgSS9PIGlzIHBhc3NlZCB0aHJvdWdoIGZyb20gdGhlIHBhcmVudCBo
eXBlcnZpc29yCj4gYWxsIHRoZSB3YXkgdGhyb3VnaCB0aGUgZG9tMCBndWVzdC4gIFRoZSBkb20w
IGd1ZXN0IGlzIGFsc28KPiBkZXByaXZpbGVnZWQgYW5kIHJlbnVtYmVyZWQgdG8gZ2l2ZSB0aGUg
YXBwZWFyYW5jZSB0aGF0IGl0Cj4gaXMgcnVubmluZyBhcyBhIG5vcm1hbCBQViBndWVzdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5jb20+Cj4g
LS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAgICB8ICAxICsKPiAgeGVuL2Fy
Y2gveDg2L2d1ZXN0L3ZpeGVuLmMgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKwo+ICB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3ZpeGVuLmggfCA3MyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMDQgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L3ZpeGVuLmMKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qvdml4ZW4uaAoKVGhpcyB3aWxs
IGJyZWFrIEFSTSBidWlsZHMgaW4gZnV0dXJlIHBhdGNoZXMgdGhhdCB1c2UgaXNfdml4ZW4oKS4K
Ci0tbXN3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
