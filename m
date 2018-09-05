From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] osstest: add missing disk driver name
Date: Wed, 5 Sep 2018 16:11:39 +0200
Message-ID: <20180905141139.36689-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=myqw=lt=citrix.com=prvs=779943e21=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fxYXb-0000W3-HN
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 14:12:19 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ZWxibGluZyBib3hlcyB1c2VzIHRoZSBtZmkgZHJpdmVyIGFuZCBoYXZlIHRoZSBoYXJkIGRpc2tz
IGluCnBhc3N0aHJvdWdoIG1vZGUsIHdoaWNoIG1lYW5zIHRoZSBtZmkgZHJpdmVyIHdpbGwgZXhw
b3NlIHRoZW0gYXMKbWZpc3lzcGQ/IGluc3RlYWQgb2YgbWZpZD8uIEluIG9yZGVyIGZvciB0aGUg
aW5zdGFsbGVyIHRvIGRldGVjdCBzdWNoCmRpc2tzIGFkZCBtZmlzeXNwZDAgdG8gdGhlIGxpc3Qg
b2YgZGlza3MgdG8gcHJvYmUuCgpUaGlzIHNob3VsZCBmaXggdGhlIGhvc3QtaW5zdGFsbCBpc3N1
ZXMgcmVwb3J0ZWQgb24gZWxibGluZyBib3hlczoKCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMjczMDQvCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB0cy1mcmVlYnNkLWhvc3QtaW5zdGFs
bCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3RzLWZyZWVic2QtaG9zdC1pbnN0YWxsIGIvdHMtZnJlZWJzZC1ob3N0LWlu
c3RhbGwKaW5kZXggODYyYTI1ZTcuLjUzZGFlZWZjIDEwMDc1NQotLS0gYS90cy1mcmVlYnNkLWhv
c3QtaW5zdGFsbAorKysgYi90cy1mcmVlYnNkLWhvc3QtaW5zdGFsbApAQCAtMTIzLDcgKzEyMyw3
IEBAIHN1YiBpbnN0YWxsICgpIHsKICAgICBteSAka25vd25ob3N0cyA9IGtub3duX2hvc3RzKCk7
CiAgICAgbXkgJHNzaGRfa2V5c191cmwgPSBjcmVhdGVfc3NoX292ZXJsYXkoKTsKICAgICBteSBA
ZGlza19uYW1lcyA9Ci0gICAgICAgIHF3KGFkYTAgZGEwIGFkMCBhYWNkMCBhbXJkMCBpZGFkMCBp
cHNkMCBtZmlkMCBtbHhkMCB0d2VkMCk7CisgICAgICAgIHF3KGFkYTAgZGEwIGFkMCBhYWNkMCBh
bXJkMCBpZGFkMCBpcHNkMCBtZmlkMCBtZmlzeXNwZDAgbWx4ZDAgdHdlZDApOwogICAgIG15ICR0
YXJnZXRfc2V0cyA9ICIvcm9vdC9vc3N0ZXN0X3NldHMiOwogICAgIG15ICRkaXNrOwogICAgIG15
ICRuaWM7Ci0tIAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
