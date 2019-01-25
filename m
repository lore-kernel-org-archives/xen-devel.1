From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/15] x86/pv: Add Hygon Dhyana support to
 emulate MSRs access
Date: Fri, 25 Jan 2019 10:00:54 -0700
Message-ID: <5C4B40C602000078002113CA@prv1-mh.provo.novell.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <93aea88af6dcc70b24b8d5195bef026629f52170.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gn4qe-0004td-45
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 17:00:56 +0000
In-Reply-To: <93aea88af6dcc70b24b8d5195bef026629f52170.1545284932.git.puwen@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDE0OjE0LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IFRoZSBI
eWdvbiBEaHlhbmEgQ1BVIHN1cHBvcnRzIGxvdHMgb2YgTVNScyhzdWNoIGFzIHBlcmYgZXZlbnQg
c2VsZWN0IGFuZAo+IGNvdW50ZXIgTVNScywgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBNU1IsIE1N
SU8gY29uZmlndXJhdGlvbiBiYXNlIGFkZHJlc3MKPiBNU1IsIE1QRVJGL0FQRVJGIE1TUnMpIGFz
IEFNRCBDUFUgZG9lcywgc28gYWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IHRvIHRoZQo+IFBWIGVt
dWxhdGlvbiBpbmZyYXN0cnVjdHVyZSBieSB1c2luZyB0aGUgY29kZSBwYXRoIG9mIEFNRC4KPiAK
PiBBcyBoeWdvbi5jIG5lZWRzIHRvIHdyaXRlIHRoZSBsb2FkLXN0b3JlIGNvbmZpZ3VyYXRpb24o
TFNfQ0ZHKSBNU1IsIHNvIGFkZAo+IG5ldyBjYXNlIGluIHdyaXRlX21zciB0byBoYW5kbGUgdGhp
cyBzaXR1YXRpb24uCgpXaGljaCBoeWdvbi5jIGRvIHlvdSBtZWFuIGhlcmU/IFRoaXMgYWRkaXRp
b24sIGlmIHZhbGlkIGF0IGFsbCwgY2xlYXJseQpuZWVkcyBpdHMgb3duIHBhdGNoIGFuZCBqdXN0
aWZpY2F0aW9uLCB0aGUgbW9yZSB0aGF0IHlvdSBwZXJtaXQgYWNjZXNzCihldmVuIGlmIG9ubHkg
Zm9yIERvbTApIG9uIEFNRCBhcyB3ZWxsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
