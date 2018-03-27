From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC 4/4] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Tue, 27 Mar 2018 14:43:22 +0100
Message-ID: <23226.19066.774399.262624@mariner.uk.xensource.com>
References: <20180326183401.17249-1-anthony.perard@citrix.com>
 <20180326183401.17249-5-anthony.perard@citrix.com>
 <23226.7824.260388.684497@mariner.uk.xensource.com>
 <20180327111303.GA5743@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2rlr=gr=citrix.com=prvs=617832343=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f0otc-0006zR-9D
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 13:44:16 +0000
In-Reply-To: <20180327111303.GA5743@perard>
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
Ogo+IEFjdHVhbGx5LCBJIHRoaW5rIHRoYXQgb25jZSBjb25uZWN0ZWQgdG8gUU1QLCB3ZSBjYW4g
Z2V0ICJldmVudHMiIGZyb20KPiBRRU1VLiBBbmQgdGhlcmUgaXMgYW4gZXZlbnQgZm9yIHdoZW4g
cWVtdSBjaGFuZ2VzIGl0J3Mgc3RhdHVzLgoKUmlnaHQsIGJ1dCBkb2Vzbid0IG9uZSBzdGlsbCBo
YXZlIHRvIHBvbGwgb24gY29ubmVjdCgpID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
