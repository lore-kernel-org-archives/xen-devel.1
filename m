From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 48/62] dm restrict audit: actually
 install right package for fishdescriptor
Date: Wed, 10 Apr 2019 15:23:54 +0100
Message-ID: <20190410142408.22848-49-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAV-0006rp-ED
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:39 +0000
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4KICBkbSByZXN0cmljdCBhdWRpdDogaW5zdGFsbCBuZXdlciBjaGlhcmstc2NyaXB0cyBmb3Ig
ZmlzaGRlc2NyaXB0b3IKYSBsb2NhbGx5LXByb3ZpZGVkIGNoaWFyay1zY3JpcHRzXzYuMC4yX2Fs
bC5kZWIgd2FzIGluc3RhbGxlZCBmb3IKamVzc2llLiAgRm9yIHN0cmV0Y2ggYSBiYWNrcG9ydCB3
YXMgaW5zdGFsbGVkLCBidXQgbWlzdGFrZW5seQpvZiBjaGlhcmstdXRpbHMtYmluIHJhdGhlciB0
aGFuIGNoaWFyay1zY3JpcHRzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0
ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDc5Yjc5NjBkLi45YWE4ODgy
MiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0K
QEAgLTEwNjAsNyArMTA2MCw3IEBAIHN1YiBwcmVzZWVkX2NyZWF0ZV9ndWVzdCAoJCQkO0ApIHsK
ICAgICBpZiAoZ3JlcCB7IG0vX2RtcmVzdHJpY3QkLyAmJiAkcnskX30gfSBrZXlzICVyIGFuZAog
CSRzdWl0ZSA9fiBtL3N0cmV0Y2gvKSB7CiAJcHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMoJGhv
LCAkc2Z4LCBcJXhvcHRzLCAkc3VpdGUsCi0JCQkJICAgcXcoY2hpYXJrLXV0aWxzLWJpbikpOwor
CQkJCSAgIHF3KGNoaWFyay1zY3JpcHRzKSk7CiAgICAgfQogCiAgICAgbXkgJHByZXNlZWRfZmls
ZT0gcHJlc2VlZF9iYXNlKCRobywgJHNmeCwgJGV4dHJhX3BhY2thZ2VzLCAleG9wdHMpOwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
