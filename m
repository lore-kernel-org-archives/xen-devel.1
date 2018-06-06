From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/3] mfi-*: Provide hostflags_strip
Date: Wed, 6 Jun 2018 12:04:55 +0100
Message-ID: <1528283096-15007-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1528283096-15007-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2s+0=iy=citrix.com=prvs=688608ebc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fQWFc-0001it-Cb
 for xen-devel@lists.xenproject.org; Wed, 06 Jun 2018 11:05:12 +0000
In-Reply-To: <1528283096-15007-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB1dGlsaXR5IGZ1bmN0aW9uIHNhdmVzIHVzIGhhdmluZyB0byBmcmFnbWVudCB0aGUgKl9o
b3N0ZmxhZ3MKdmFyaWFibGVzIGFueSBmdXJ0aGVyIHdoZW4gYWRkaW5nIHNwZWNpYWwgY2FzZXMu
ICBBIHBhcnRpY3VsYXIgc3BlY2lhbApjYXNlIGNhbiBzdHJpcCBvdXQgdGhpbmdzIGl0IGRvZXNu
J3QgbGlrZS4KCk5vIGNhbGxlcnMgeWV0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWZpLWNvbW1vbiB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbWZpLWNvbW1v
biBiL21maS1jb21tb24KaW5kZXggZmRkZDFjZS4uYTQ4MjQ2MyAxMDA2NDQKLS0tIGEvbWZpLWNv
bW1vbgorKysgYi9tZmktY29tbW9uCkBAIC0xMDIsNiArMTAyLDE2IEBAIGpvYl9jcmVhdGVfYnVp
bGQgKCkgewogICAuL2NzLWpvYi1jcmVhdGUgJGZsaWdodCAkam9iICRyZWNpcGUgJGdsb2JhbF9y
dW52YXJzICIkQCIKIH0KIAoraG9zdGZsYWdzX3N0cmlwICgpIHsKKyAgIyBwcmludHMgJDEsIHdo
aWNoIGlzIGEgbGlzdCBvZiBob3N0ZmxhZ3MsIHdpdGggaG9zdGZsYWdzCisgICMgbWF0Y2hpbmcg
dGhlIHBlcmwgcmVnZXhwICQyIHJlbW92ZWQKKyAgcGVybCAtTXN0cmljdCAtd2UgJworICAgICAg
ICAgICBteSBAZiA9IHNwbGl0IC9cLC8sICRBUkdWWzBdOworICAgICAgICAgICBAZiA9IGdyZXAg
eyAhbXskQVJHVlsxXX0gfSBAZjsKKyAgICAgICAgICAgcHJpbnQgam9pbiAiLCIsIEBmIG9yIGRp
ZSAkITsKKyAgICAgICAgICcgIiRAIgorfQorCiBzZXRfaG9zdG9zX3J1bnZhcnMgKCkgewogICAj
IGNhbGxlciBzaG91bGQgaGF2ZSBkb25lCiAgICMgICAgbG9jYWwgaG9zdG9zX3J1bnZhcnMKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
