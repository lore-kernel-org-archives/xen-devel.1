From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 09/14] libxl_dm: Pre-open QMP socket for
 QEMU
Date: Fri, 21 Dec 2018 16:01:13 +0000
Message-ID: <23581.3657.703601.323575@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-10-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaNEs-0003Gn-33
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:01:26 +0000
In-Reply-To: <20181123135355.6001-10-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY3IDA5LzE0XSBsaWJ4bF9kbTogUHJlLW9w
ZW4gUU1QIHNvY2tldCBmb3IgUUVNVSIpOgo+IFRoaXMgcGF0Y2ggbW92ZXMgdGhlIGNyZWF0aW9u
IG9mIHRoZSBRTVAgdW5peCBzb2NrZXQgZnJvbSBRRU1VIHRvIGxpYnhsLgo+IEJ1dCBsaWJ4bCBk
b2Vzbid0IHJlbHkgb24gdGhpcyB5ZXQuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
