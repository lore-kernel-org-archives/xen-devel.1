From: Tamas Lengyel <tamas.lengyel@zentific.com>
Subject: Re: [RFC PATCH 1/2] mem_access: Fix npfec.kind
 propagation
Date: Wed, 26 Sep 2018 10:51:47 -0600
Message-ID: <CABfawh=-rb1Bp_+szP995sBzfEx1MFqX7K+aDCPc_4gqtLgpgw@mail.gmail.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vm1o=mi=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g5D36-0005kj-9L
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 16:52:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id y8-v6so24098905wrh.7
 for <xen-devel@lists.xenproject.org>; Wed, 26 Sep 2018 09:52:27 -0700 (PDT)
In-Reply-To: <20180926164741.13405-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMTA6NDkgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IFRoZSBuYW1lIG9mIHRoZSAid2l0aF9nbGEiIGZs
YWcgaXMgY29uZnVzaW5nOyBpdCBoYXMgbm90aGluZyB0byBkbwo+IHdpdGggdGhlIGV4aXN0ZW5j
ZSBvciBsYWNrIHRoZXJlb2Ygb2YgYSBmYXVsdGluZyBHTEEsIGJ1dCByYXRoZXIgd2hlcmUKPiB0
aGUgZmF1bHQgb3JpZ2luYXRlZC4gIFRoZSBucGZlYy5raW5kIHZhbHVlIGlzIGFsd2F5cyB2YWxp
ZCwgYW5kCj4gc2hvdWxkIHRodXMgYmUgcHJvcGFnYXRlZCwgcmVnYXJkbGVzcyBvZiB3aGV0aGVy
IGdsYV92YWxpZCBpcyBzZXQgb3IKPiBub3QuCj4KPiBJbiBwYXJ0aWN1bGFyLCBnbGFfdmFsaWQg
d2lsbCBuZXZlciBiZSBzZXQgb24gQU1EIHN5c3RlbXM7IGJ1dAo+IG5wZmVjLmtpbmQgd2lsbCBz
dGlsbCBiZSB2YWxpZCBhbmQgc2hvdWxkIHN0aWxsIGJlIHByb3BhZ2F0ZWQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBY2tl
ZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
