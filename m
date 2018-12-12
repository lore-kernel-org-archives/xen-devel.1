From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 07/10] libxl: Make killing of device
 model asynchronous
Date: Wed, 12 Dec 2018 15:46:52 +0000
Message-ID: <23569.11628.588007.777395@mariner.uk.xensource.com>
References: <20181206150252.30766-1-george.dunlap@citrix.com>
 <20181206150252.30766-7-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AgIX=OV=citrix.com=prvs=8770bfd16=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gX6j0-0005DM-Dj
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 15:47:02 +0000
In-Reply-To: <20181206150252.30766-7-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggdjIgMDcvMTBdIGxpYnhsOiBNYWtlIGtpbGxp
bmcgb2YgZGV2aWNlIG1vZGVsIGFzeW5jaHJvbm91cyIpOgo+IE9yIGF0IGxlYXN0LCBnaXZlIGl0
IGFuIGFzeW5jaHJvbm91cyBpbnRlcmZhY2Ugc28gdGhhdCB3ZSBjYW4gbWFrZSBpdAo+IGFjdHVh
bGx5IGFzeW5jaHJvbm91cyBpbiBzdWJzZXF1ZW50IHBhdGNoZXMuCj4gCj4gQ3JlYXRlIHN0YXRl
IHN0cnVjdHVyZXMgYW5kIGNhbGxiYWNrIGZ1bmN0aW9uIHNpZ25hdHVyZXMuICBBZGQgdGhlCj4g
c3RhdGUgc3RydWN0dXJlIHRvIGxpYnhsX19kZXN0cm95X2RvbWlkX3N0YXRlLiAgQnJlYWsKPiBs
aWJ4bF9fZGVzdHJveV9kb21pZCBkb3duIGludG8gdHdvIGZ1bmN0aW9ucy4KCkFja2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
