From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] tools: libxenstat: fix format string
	overflow
Date: Fri, 16 Feb 2018 18:39:35 +0000
Message-ID: <20180216183935.kal22nfhx5pdgil2@citrix.com>
References: <151880632858.7225.12179941056303264938.stgit@Solace.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ljqo=fk=citrix.com=prvs=578ce87c4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emkvA-0002wt-M1
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 18:39:44 +0000
Content-Disposition: inline
In-Reply-To: <151880632858.7225.12179941056303264938.stgit@Solace.fritz.box>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDc6Mzg6NDhQTSArMDEwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gV2l0aCBnY2MgNy4zLjAsIHRoZSBidWlsZCBmYWlscyBsaWtlIHRoaXM6Cj4gCj4g
c3JjL3hlbnN0YXRfbGludXguYzogSW4gZnVuY3Rpb24g4oCYZ2V0QnJpZGdl4oCZCj4gc3JjL3hl
bnN0YXRfbGludXguYzo3ODozNDogd2FybmluZzog4oCYJXPigJkgZGlyZWN0aXZlIHdyaXRpbmcg
dXAgdG8gMjU1IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSAyNDEgWy1XZm9ybWF0LW92ZXJm
bG93PV0KPiAgICAgIHNwcmludGYodG1wLCAiL3N5cy9jbGFzcy9uZXQvJXMvYnJpZGdlIiwgZGUt
PmRfbmFtZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gc3JjL3hl
bnN0YXRfbGludXguYzo3ODo1OiBub3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCBiZXR3ZWVuIDIz
IGFuZCAyNzggYnl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgMjU2Cj4gICAgICBzcHJp
bnRmKHRtcCwgIi9zeXMvY2xhc3MvbmV0LyVzL2JyaWRnZSIsIGRlLT5kX25hbWUpOwo+ICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+
IEZpeCBieSBtYWtpbmcgdGhlIGJ1ZmZlciBiaWdnZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
