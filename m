From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen-netfront: Fix hang on device removal
Date: Wed, 28 Feb 2018 10:21:07 -0500
Message-ID: <79cf073e-6b72-f139-46d3-79322d16209f__30016.601473517$1519831114$gmane$org@oracle.com>
References: <20180228122323.3914-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ivaa=fw=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1er3WJ-0008Ru-AC
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 15:19:51 +0000
In-Reply-To: <20180228122323.3914-1-jandryuk@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAwNzoyMyBBTSwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBBIHRvb2xzdGFj
ayBtYXkgZGVsZXRlIHRoZSB2aWYgZnJvbnRlbmQgYW5kIGJhY2tlbmQgeGVuc3RvcmUgZW50cmll
cwo+IHdoaWxlIHhlbi1uZXRmcm9udCBpcyBpbiB0aGUgcmVtb3ZhbCBjb2RlIHBhdGguICBJbiB0
aGF0IGNhc2UsIHRoZQo+IGNoZWNrcyBmb3IgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlIHdvdWxk
IHJldHVybiBYZW5idXNTdGF0ZVVua25vd24sIGFuZAo+IHhlbm5ldF9yZW1vdmUgd291bGQgaGFu
ZyBpbmRlZmluaXRlbHkuICBUaGlzIGhhbmcgcHJldmVudHMgc3lzdGVtCj4gc2h1dGRvd24uCj4K
PiB4ZW5uZXRfcmVtb3ZlIG11c3QgYmUgYWJsZSB0byBoYW5kbGUgWGVuYnVzU3RhdGVVbmtub3du
LCBhbmQKPiBuZXRiYWNrX2NoYW5nZWQgbXVzdCBhbHNvIHdha2UgdXAgdGhlIHdha2VfcXVldWUg
Zm9yIHRoYXQgc3RhdGUgYXMgd2VsbC4KPgo+IEZpeGVzOiA1YjU5NzFkZjNiYzIgKCJ4ZW4tbmV0
ZnJvbnQ6IHJlbW92ZSB3YXJuaW5nIHdoZW4gdW5sb2FkaW5nIG1vZHVsZSIpCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+Cj4gQ2M6IEVkdWFyZG8g
T3R1Ym8gPG90dWJvQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
