From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC 4/4] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Tue, 27 Mar 2018 15:48:29 +0100
Message-ID: <23226.22973.741253.350174@mariner.uk.xensource.com>
References: <20180326183401.17249-1-anthony.perard@citrix.com>
 <20180326183401.17249-5-anthony.perard@citrix.com>
 <23226.7824.260388.684497@mariner.uk.xensource.com>
 <20180327111303.GA5743@perard>
 <23226.19066.774399.262624@mariner.uk.xensource.com>
 <20180327142054.GE2208@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2rlr=gr=citrix.com=prvs=617832343=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f0puQ-0003u4-JP
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:49:10 +0000
In-Reply-To: <20180327142054.GE2208@perard>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtSRkMgNC80XSBIQUNLIGxp
YnhsX2V4ZWM6IENoZWNrIFFFTVUgc3RhdHVzIHZpYSBRTVAgaW5zdGVhZCBvZiB4ZW5zdG9yZSIp
Ogo+IE9uIFR1ZSwgTWFyIDI3LCAyMDE4IGF0IDAyOjQzOjIyUE0gKzAxMDAsIElhbiBKYWNrc29u
IHdyb3RlOgo+ID4gUmlnaHQsIGJ1dCBkb2Vzbid0IG9uZSBzdGlsbCBoYXZlIHRvIHBvbGwgb24g
Y29ubmVjdCgpID8KPiAKPiBZZXMsIHdlIG5lZWQgdG8gcG9sbCBvbiBjb25uZWN0KCkuCj4gCj4g
bGlidmlydCB0aG9zZSBpdCBhbHNvIHRvIG9wZW4gdGhlIHNvY2tldDoKPiBodHRwczovL2xpYnZp
cnQub3JnL2dpdC8/cD1saWJ2aXJ0LmdpdDthPWJsb2I7Zj1zcmMvcWVtdS9xZW11X21vbml0b3Iu
YztoPWUxNjk1NTNiN2UxNzgxZGEzMDdkZGIwYmUyM2ZlZDU1NDBiYWYzNmM7aGI9SEVBRCNsMzc1
CgpVcmdoLiAgTWF5YmUgd2UgY291bGQgZml4IHRoaXMgaW4gcWVtdSwgb3IgZG8gc29tZSBraW5k
IG9mIGhhY2suCgpGb3IgZXhhbXBsZSwgbWF5YmUgd2UgY291bGQgaW5zdHJ1Y3QgcWVtdSB0byBv
cGVuIHNvbWUgZmlsZSBvciBvdGhlciwKd2hpY2ggaXMgYWN0dWFsbHkgYSBwaXBlLiAgSWYgaXQg
d291bGQgaGFwcGVuIGxhdGUgZW5vdWdodCAoYWZ0ZXIgdGhlCnFtcCBzb2NrZXQgaXMgc2V0IHVw
KS4KCk9yIHdlIGNvdWxkIGFkZCBzb21ldGhpbmcgdG8gdGhlIFhlbiBtYWNoaW5lLCBlZyB3aGlj
aCBsaXN0ZW5zIHRvIGFuCmVudiB2YXIgYW5kIGNsb3NlcyBhbiBmZC4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
