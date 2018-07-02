From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/4] tests: disable x86 emulator test harness
 when using clang
Date: Mon, 2 Jul 2018 10:28:24 +0200
Message-ID: <20180702082826.90272-3-roger.pau@citrix.com>
References: <20180702082826.90272-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n1b/=js=citrix.com=prvs=714d6e1f6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fZuCM-0005FI-HI
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 08:28:38 +0000
In-Reply-To: <20180702082826.90272-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Y2xhbmcgaXMgbm90IGNhcGFibGUgb2YgYnVpbGRpbmcgdGhlIHg4NiBlbXVsYXRvciB0ZXN0IGhh
cm5lc3MsIHNvCmRpc2Nvbm5lY3QgaXQgZnJvbSB0aGUgY2xhbmcgYnVpbGQgdW50aWwgaXQgY2Fu
IGJlIGZpeGVkLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHRvb2xzL3Rlc3RzL01ha2Vm
aWxlIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3RzL01ha2VmaWxlIGIvdG9vbHMvdGVzdHMvTWFrZWZpbGUKaW5kZXggZjY5NDJh
OTNmYi4uMjUyMmVhNTA2MyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMvTWFrZWZpbGUKKysrIGIv
dG9vbHMvdGVzdHMvTWFrZWZpbGUKQEAgLTEwLDcgKzEwLDkgQEAgU1VCRElSUy15ICs9IG1lbS1z
aGFyaW5nCiBpZmVxICgkKFhFTl9UQVJHRVRfQVJDSCksX19maXhtZV9fKQogU1VCRElSUy15ICs9
IHJlZ3Jlc3Npb24KIGVuZGlmCitpZm5lcSAoJChjbGFuZykseSkKIFNVQkRJUlMtJChDT05GSUdf
WDg2KSArPSB4ODZfZW11bGF0b3IKK2VuZGlmCiBTVUJESVJTLXkgKz0geGVuLWFjY2VzcwogU1VC
RElSUy15ICs9IHhlbnN0b3JlCiBTVUJESVJTLSQoQ09ORklHX0hBU19QQ0kpICs9IHZwY2kKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
