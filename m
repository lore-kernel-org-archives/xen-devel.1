From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 4/4] build/clang: add a check whether the
	assembler supports .skip with labels
Date: Mon, 19 Feb 2018 14:16:20 +0000
Message-ID: <20180219141620.20008-5-roger.pau@citrix.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1enmFS-0000sx-Kw
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 14:16:54 +0000
In-Reply-To: <20180219141620.20008-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSBzd2l0Y2ggb2ZmIHRoZSBpbnRlZ3JhdGVkIGFzc2VtYmxlci4gVGhpcyBpcyByZWxl
dmFudCBmb3IKb2xkZXIgY2xhbmcgdmVyc2lvbnMgd2hpY2ggaW50ZWdyYXRlZCBhc3NlbWJsZXIg
ZG9uJ3Qgc3VwcG9ydCAuc2tpcAp3aXRoIGxhYmVscy4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vUnVsZXMubWsgfCA2ICsrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCAzMjJlMTFkYmEyLi40MTVi
MzYzODU5IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC03
Miw3ICs3MiwxMSBAQCBBRkxBR1MteSAgICAgICAgICAgICAgICArPSAtRF9fQVNTRU1CTFlfXwog
CiAjIE9sZGVyIGNsYW5nJ3MgYnVpbHQtaW4gYXNzZW1ibGVyIGRvZXNuJ3QgdW5kZXJzdGFuZCAu
c2tpcCB3aXRoIGxhYmVsczoKICMgaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9p
ZD0yNzM2OQotQUZMQUdTLSQoY2xhbmcpICAgICAgICAgKz0gLW5vLWludGVncmF0ZWQtYXMKK2lm
ZXEgKCQoY2xhbmcpLHkpCitpZmVxICgkKGNhbGwgYXMtaW5zbiwkKENDKSAkKEFGTEFHUyksIi5M
MDpcbi5MMTpcbi5za2lwICguTDEgLSAuTDApIix5LG4pLG4pCisgICAgICAgIEFGTEFHUyArPSAt
bm8taW50ZWdyYXRlZC1hcworZW5kaWYKK2VuZGlmCiAKIEFMTF9PQkpTIDo9ICQoQUxMX09CSlMt
eSkKIAotLSAKMi4xNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
