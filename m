From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 02/14] libxl_qmp: Separate QMP message
 generation from qmp_send_prepare
Date: Fri, 21 Dec 2018 14:32:10 +0000
Message-ID: <23580.63850.771756.145262@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-3-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaLr2-0001JV-Bp
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:32:44 +0000
In-Reply-To: <20181123135355.6001-3-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY3IDAyLzE0XSBsaWJ4bF9xbXA6IFNlcGFy
YXRlIFFNUCBtZXNzYWdlIGdlbmVyYXRpb24gZnJvbSBxbXBfc2VuZF9wcmVwYXJlIik6Cj4gLi4g
dG8gYmUgYWJsZSB0byByZS11c2UgcW1wX3ByZXBhcmVfY21kIHdpdGggbGlieGxfX2V2X3FtcC4K
PiAKPiBUaGlzIHBhdGNoIGFsc28gYWRkIHRoZSBRTVAgZW5kIG9mIGNvbW1hbmQgJ1xyXG4nIGlu
dG8gdGhlIGdlbmVyYXRlZAo+IHN0cmluZyBhcyBldmVyeSBjYWxsZXIgd2lsbCBuZWVkcyB0aGlz
Lgo+IAo+IFRoZXJlIHNob3VsZCBiZSBubyBmdW5jdGlvbmFsIGNoYW5nZS4KCkFja2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
