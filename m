From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: keep assigned pci devices across
 domain reboots
Date: Thu, 20 Sep 2018 11:58:19 +0100
Message-ID: <23459.32075.39970.382880@mariner.uk.xensource.com>
References: <20180920104025.88948-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lmio=mc=citrix.com=prvs=794f17c5a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g2wg2-0003NT-FW
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 10:59:18 +0000
In-Reply-To: <20180920104025.88948-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Andreas Kinzler <hfp@posteo.de>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSF0gbGlieGw6IGtlZXAgYXNzaWduZWQgcGNp
IGRldmljZXMgYWNyb3NzIGRvbWFpbiByZWJvb3RzIik6Cj4gRmlsbCB0aGUgZnJvbV94ZW5zdG9y
ZSBsaWJ4bF9kZXZpY2VfdHlwZSBob29rIGZvciBQQ0kgZGV2aWNlcyBzbyB0aGF0Cj4gbGlieGxf
cmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb24gY2FuIHByb3Blcmx5IHJldHJpZXZlIFBDSSBk
ZXZpY2VzCj4gZnJvbSB4ZW5zdG9yZS4KPiAKPiBUaGlzIGZpeGVzIGRpc2FwcGVhcmluZyBwY2kg
ZGV2aWNlcyBhY3Jvc3MgZG9tYWluIHJlYm9vdHMuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJdCB3b3VsZCBoYXZlIGJlZW4gbmljZSB0byBtZW50
aW9uLCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIHRoZSByZWFzb24KZm9yIHN3YXBwaW5nIHRoZSBh
cmd1bWVudHMgdG8gbGlieGxfX2RldmljZV9wY2lfZnJvbV94c19iZS4gIEJ1dCBpdCdzCmZpbmUg
YXMgaXQgaXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
