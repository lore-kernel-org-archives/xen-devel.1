From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 14/14] libxl: Re-implement
 domain_suspend_device_model using libxl__ev_qmp
Date: Fri, 21 Dec 2018 16:12:44 +0000
Message-ID: <23581.4348.340974.11594@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-15-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaNQC-0004k5-VL
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:13:08 +0000
In-Reply-To: <20181123135355.6001-15-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY3IDE0LzE0XSBsaWJ4bDogUmUtaW1wbGVt
ZW50IGRvbWFpbl9zdXNwZW5kX2RldmljZV9tb2RlbCB1c2luZyBsaWJ4bF9fZXZfcW1wIik6Cj4g
VGhlIHJlLWltcGxlbWVudGF0aW9uIGlzIGRvbmUgYmVjYXVzZSB3ZSB3YW50IHRvIGJlIGFibGUg
dG8gc2VuZCB0aGUKPiBmaWxlIGRlc2NyaXB0aW9uIHRoYXQgUUVNVSBjYW4gdXNlIHRvIHNhdmUg
aXRzIHN0YXRlLiBXaGVuIFFFTVUgaXMKPiByZXN0cmljdGVkLCBpdCB3b3VsZCBub3QgYmUgYWJs
ZSB0byB3cml0ZSB0byBhIHBhdGguCj4gCj4gVGhpcyByZXBsYWNlIGJvdGggbGlieGxfX3FtcF9z
dG9wKCkgYW5kIGxpYnhsX19xbXBfc2F2ZSgpLgo+IAo+IHFtcF9xZW11X2NoZWNrX3ZlcnNpb24o
KSB3YXMgb25seSB1c2VkIGJ5IGxpYnhsX19xbXBfc2F2ZSgpLCBzbyBpdCBpcwo+IHJlcGxhY2Ug
YnkgYSB2ZXJzaW9uIHVzaW5nIGxpYnhsX19ldl9xbXAgaW5zdGVhZC4KPiAKPiBDb2Rpbmcgc3R5
bGUgZml4ZWQgaW4gbGlieGxfX2RvbWFpbl9zdXNwZW5kX2RldmljZV9tb2RlbCgpIGZvciB0aGUK
PiByZXR1cm4gdmFsdWUuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
