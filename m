From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 62/62] Switch to Debian Stretch
Date: Wed, 10 Apr 2019 15:24:08 +0100
Message-ID: <20190410142408.22848-63-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEDG-0003Kw-PD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:28:30 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QucG0gICAgICAgIHwgMiArLQogcHJv
ZHVjdGlvbi1jb25maWcgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QucG0gYi9Pc3N0ZXN0LnBtCmluZGV4
IDkyYjFhMGVhLi43Y2U1M2ZjYiAxMDA2NDQKLS0tIGEvT3NzdGVzdC5wbQorKysgYi9Pc3N0ZXN0
LnBtCkBAIC04Nyw3ICs4Nyw3IEBAIG91ciAlYyA9IHF3KAogCiAgICAgSW1hZ2VzIGltYWdlcwog
Ci0gICAgRGViaWFuU3VpdGUgamVzc2llCisgICAgRGViaWFuU3VpdGUgc3RyZXRjaAogICAgIERl
Ymlhbk1pcnJvclN1YnBhdGggZGViaWFuCiAKICAgICBUZXN0SG9zdEtleXBhaXJQYXRoIGlkX3Jz
YV9vc3N0ZXN0CmRpZmYgLS1naXQgYS9wcm9kdWN0aW9uLWNvbmZpZyBiL3Byb2R1Y3Rpb24tY29u
ZmlnCmluZGV4IGZhZGZlOGI5Li41YjlmNWM4MiAxMDA2NDQKLS0tIGEvcHJvZHVjdGlvbi1jb25m
aWcKKysrIGIvcHJvZHVjdGlvbi1jb25maWcKQEAgLTkwLDEyICs5MCwxNCBAQCBUZnRwTmV0Ym9v
dEdyb3VwIG9zc3Rlc3QKICMgVXBkYXRlIHdpdGggLi9tZy1kZWJpYW4taW5zdGFsbGVyLXVwZGF0
ZSgtYWxsKQogVGZ0cERpVmVyc2lvbl93aGVlenkgMjAxNi0wNi0wOAogVGZ0cERpVmVyc2lvbl9q
ZXNzaWUgMjAxOC0wNi0yNgorVGZ0cERpVmVyc2lvbl9zdHJldGNoIDIwMTgtMTEtMjcKIAogRGVi
aWFuU25hcHNob3RCYWNrcG9ydHNfamVzc2llIGh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2Fy
Y2hpdmUvZGViaWFuLzIwMTkwMjA2VDIxMTMxNFovCiAKICMgRm9yIElTTyBpbnN0YWxscwogRGVi
aWFuSW1hZ2VWZXJzaW9uX3doZWV6eSA3LjIuMAogRGViaWFuSW1hZ2VWZXJzaW9uX2plc3NpZSA4
LjIuMAorRGViaWFuSW1hZ2VWZXJzaW9uX3N0cmV0Y2ggOS40LjAKIAogIyBUaGVzZSBzaG91bGQg
bm9ybWFsbHkgYmUgdGhlIHNhbWUuCiAjIFVwZGF0ZSB3aXRoIC4vbWctY3B1LW1pY3JvY29kZS11
cGRhdGUKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
