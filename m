From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 6/9] libxl: Move qmp cleanup into
 devicemodel destroy function
Date: Wed, 28 Nov 2018 16:39:57 +0000
Message-ID: <23550.50397.904912.139088@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-6-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bc+K=OH=citrix.com=prvs=863aa12bc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gS2sd-0007cs-Mt
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:40:03 +0000
In-Reply-To: <20181123171502.29519-6-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggNi85XSBsaWJ4bDogTW92ZSBxbXAgY2xlYW51
cCBpbnRvIGRldmljZW1vZGVsIGRlc3Ryb3kgZnVuY3Rpb24iKToKPiBSZW1vdmluZyB0aGUgcW1w
IGNvbm5lY3Rpb24gaXMgbG9naWNhbGx5IHBhcnQgb2YgdGhlIGRldmljZSBtb2RlbAo+IGRlc3Ry
dWN0aW9uOyBoYXZpbmcgdGhlIGNhbGxlciBkZXN0cm95IGl0IGlzIGEgbWlsZCBsYXllcmluZwo+
IHZpb2xhdGlvbi4KPiAKPiBNb3ZlIGxpYnhsX19xbXBfY2xlYW51cCgpIGludG8gbGlieGxfX2Rl
c3Ryb3lfZGV2aWNlX21vZGVsKCkuICBUaGlzCj4gd2lsbCBtYWtlIGl0IGVhc2llciB3aGVuIHdl
IG1ha2UgZGV2aWNlbW9kZWwgZGVzdHJ1Y3Rpb24gYXN5bmNocm9ub3VzLgoKQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
