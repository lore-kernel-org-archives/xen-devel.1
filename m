From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 22/31] libxl_qmp: Simplify
 qmp_response_type() prototype
Date: Wed, 27 Jun 2018 17:03:39 +0100
Message-ID: <23347.46427.803469.598566@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-23-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYCv1-0007BL-PG
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:03:43 +0000
In-Reply-To: <20180601143720.24637-23-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDIyLzMxXSBsaWJ4bF9xbXA6IFNpbXBs
aWZ5IHFtcF9yZXNwb25zZV90eXBlKCkgcHJvdG90eXBlIik6Cj4gUmVtb3ZlIHRoZSBsaWJ4bF9f
cW1wX2hhbmRsZXIqIGFyZ3VtZW50IHNvIHRoZSBmdW5jdGlvbiBjYW4gYmUgcmV1c2VkCj4gbGF0
ZXIgaW4gYSBkaWZmZXJlbnQgY29udGV4dC4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
