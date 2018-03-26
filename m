From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v1.1 for-4.11 1/3] vpci/bars: fix error message
Date: Mon, 26 Mar 2018 12:28:24 +0100
Message-ID: <20180326112826.80443-2-roger.pau@citrix.com>
References: <20180326112826.80443-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QJC-0006kH-Pp
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:29:02 +0000
In-Reply-To: <20180326112826.80443-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RXJyb3IgbWVzc2FnZSBpcyBpbmNvcnJlY3RseSB1c2luZyBtYXAgd2hlbiBpdCBzaG91bGQgYmUg
dXNpbmcKbWFwLT5tYXAgaW5zdGVhZC4KClJlcG9ydGVkLWJ5OiBDb3Zlcml0eQpTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8
R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9o
ZWFkZXIuYwppbmRleCA5MWE3MWNhNjZlLi4wZWM0YzA4MmE2IDEwMDY0NAotLS0gYS94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKQEAgLTYz
LDcgKzYzLDcgQEAgc3RhdGljIGludCBtYXBfcmFuZ2UodW5zaWduZWQgbG9uZyBzLCB1bnNpZ25l
ZCBsb25nIGUsIHZvaWQgKmRhdGEsCiAgICAgICAgIHsKICAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfR19XQVJOSU5HCiAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBpZGVudGl0eSAlc21h
cCBbJWx4LCAlbHhdIGZvciBkJWQ6ICVkXG4iLAotICAgICAgICAgICAgICAgICAgIG1hcCA/ICIi
IDogInVuIiwgcywgZSwgbWFwLT5kLT5kb21haW5faWQsIHJjKTsKKyAgICAgICAgICAgICAgICAg
ICBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwgbWFwLT5kLT5kb21haW5faWQsIHJjKTsKICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgICB9CiAgICAgICAgIEFTU0VSVChyYyA8IHNpemUpOwot
LSAKMi4xNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
