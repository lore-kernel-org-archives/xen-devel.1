From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 5/7] add spin_sleep function to time
 manager
Date: Fri, 13 Apr 2018 14:52:35 +0100
Message-ID: <20180413135235.onc4yski3cuacp5m@MacBook-Pro-de-Roger.local>
References: <20180410191701.17203-1-semelpaul@gmail.com>
 <20180410191701.17203-5-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aili=hc=citrix.com=prvs=63401f18f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f6z87-0000OZ-6i
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 13:52:43 +0000
Content-Disposition: inline
In-Reply-To: <20180410191701.17203-5-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: xen-devel@lists.xenproject.org, Paul Semel <phentex@amazon.de>, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDk6MTY6NTlQTSArMDIwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiB0aGlzIGZ1bmN0aW9uIHVzZXMgbnNwaW5fc2xlZXAgdG8gc3BpbiBzbGVlcCBmb3IgdCBz
ZWNvbmRzCgpJTU8geW91IGNhbiBzcXVhc2ggdGhpcyBpbnRvIHRoZSBwcmV2aW91cyBwYXRjaC4K
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cj4gLS0tCj4g
Cj4gTm90ZXM6Cj4gICAgIHY0Ogo+ICAgICAtIG5ldyBwYXRjaCB2ZXJzaW9uCj4gCj4gIGNvbW1v
bi90aW1lLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1lLmMgYi9jb21tb24vdGltZS5jCj4gaW5kZXggMjMy
ZTEzNC4uODdkYjEyNCAxMDA2NDQKPiAtLS0gYS9jb21tb24vdGltZS5jCj4gKysrIGIvY29tbW9u
L3RpbWUuYwo+IEBAIC0xNTEsNiArMTUxLDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBuc3Bpbl9z
bGVlcCh1aW50NjRfdCB0KQo+ICAgICAgICAgIGFzbSB2b2xhdGlsZSAoInBhdXNlIik7Cj4gIH0K
PiAgCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzcGluX3NsZWVwKHVpbnQ2NF90IHQpCj4gK3sKPiAr
ICAgIHVpbnQ2NF90IG5zZWMgPSBTRUNfVE9fTlNFQyh0KTsKCk5ld2xpbmUuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
