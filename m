From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v4 9/9] osstest: add FreeBSD Xen build job
Date: Wed, 18 Jul 2018 16:18:05 +0100
Message-ID: <23375.23085.795016.699173@mariner.uk.xensource.com>
References: <20180717160347.60140-1-roger.pau@citrix.com>
 <20180717160347.60140-10-roger.pau@citrix.com>
 <23375.22850.689507.77514@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ndva=kc=citrix.com=prvs=7304e4abf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ffoDx-0000p7-4d
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 15:18:41 +0000
In-Reply-To: <23375.22850.689507.77514@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2NCA5LzldIG9zc3Rlc3Q6IGFkZCBGcmVl
QlNEIFhlbiBidWlsZCBqb2IiKToKPiBSb2dlciBQYXUgTW9ubmUgd3JpdGVzICgiW1BBVENIIHY0
IDkvOV0gb3NzdGVzdDogYWRkIEZyZWVCU0QgWGVuIGJ1aWxkIGpvYiIpOgo+ID4gVG8gYm90aCB0
aGUgRnJlZUJTRCBhbmQgdGhlIHhlbi11bnN0YWJsZSBmbGlnaHRzLgo+IAo+IFBsZWFzZSBhZGQg
dGhpcyB0byB0aGUgb3NzdGVzdCBmbGlnaHRzIHRvbyEKCkkgc2hvdWxkIGV4cGFuZCBvbiB0aGlz
OgoKVGhlIHJlYXNvbiB5b3Ugd2FudCB0aGUgb3NzdGVzdCBicmFuY2ggdG8gYmUgY292ZXJlZCBp
cyB0aGF0IGl0IGlzIGFuCmlucHV0IHRvIHRoaXMgam9iLiAgVGhlcmUgaXMgbm8gcHJvdGVjdGlv
biBhZ2FpbnN0IGFuIHVuLWNvdmVyZWQgaW5wdXQKYnJhbmNoZXMgaW50cm9kdWNpbmcgYSByZWdy
ZXNzaW9uLgoKTG9va2luZyBhdCB0aGUgcnVudmFycywgdGhlIGRlY2xhcmVkIGlucHV0cyBhcmU6
CgorZnJlZWJzZC1tYXN0ZXIgYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgIGZyZWVic2RidWls
ZGpvYiAgICBidWlsZC1hbWQ2NC1mcmVlYnNkCitmcmVlYnNkLW1hc3RlciBidWlsZC1hbWQ2NC14
ZW4tZnJlZWJzZCAgICAgcmV2aXNpb25fbWluaW9zCitmcmVlYnNkLW1hc3RlciBidWlsZC1hbWQ2
NC14ZW4tZnJlZWJzZCAgICAgcmV2aXNpb25fb3ZtZgorZnJlZWJzZC1tYXN0ZXIgYnVpbGQtYW1k
NjQteGVuLWZyZWVic2QgICAgIHJldmlzaW9uX3FlbXUKK2ZyZWVic2QtbWFzdGVyIGJ1aWxkLWFt
ZDY0LXhlbi1mcmVlYnNkICAgICByZXZpc2lvbl9xZW11dSAgICAgYXAtZmV0Y2gtdmVyc2lvbi1i
YXNlbGluZTpxZW11LXVwc3RyZWFtLXVuc3RhYmxlCitmcmVlYnNkLW1hc3RlciBidWlsZC1hbWQ2
NC14ZW4tZnJlZWJzZCAgICAgcmV2aXNpb25fc2VhYmlvcworZnJlZWJzZC1tYXN0ZXIgYnVpbGQt
YW1kNjQteGVuLWZyZWVic2QgICAgIHJldmlzaW9uX3hlbiAgICAgICBhcC1mZXRjaC12ZXJzaW9u
LWJhc2VsaW5lOnhlbi11bnN0YWJsZQoKRG8geW91IGtub3cgd2hhdCBwcm9wb3J0aW9uIG9mIHRo
ZXNlIGFyZSBhY3R1YWxseSB1c2VkIGJ5IHRoZSBGcmVlQlNEClhlbiBidWlsZCA/ICBBbGwgdGhh
dCBhcmUgbmVlZCB0aGlzIGpvYiBhZGRpbmcgdG8gdGhlaXIgb3duIGZsaWdodHMuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
