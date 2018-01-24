From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1 1/4] libxl: use libxl__device_kind to get
 device XS entry
Date: Wed, 24 Jan 2018 17:33:31 +0000
Message-ID: <20180124173331.3nqs6uwqfjbv4nzg@citrix.com>
References: <1516814399-8597-1-git-send-email-al1img@gmail.com>
 <1516814399-8597-2-git-send-email-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeOvb-0003R7-Eq
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 17:33:39 +0000
Content-Disposition: inline
In-Reply-To: <1516814399-8597-2-git-send-email-al1img@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Grytsov <al1img@gmail.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMDc6MTk6NTZQTSArMDIwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgo+IAo+IE9uIGFkZGluZyB0byBYUyBuYW1lIG9mIGRldmljZSBpcyB0YWtlbiBmcm9t
Cj4gbGlieGxfX2RldmljZV9raW5kIGVudW0uIE9uIGdldHRpbmcgZGV2aWNlIGZyb20gWFMKPiB0
aGUgbmFtZSBpcyBoYXJkY29kZWQuIEl0IGxlYWRzIHRvIHBvdGVudGlhbAo+IG1pc3RtYXRjaCBl
cnJvcnMuIFRoZSBwYXRjaCBpcyB1c2luZyBsaWJ4bF9fZGV2aWNlX2tpbmQKPiBldmVyeXdlcmUg
dG8gaGF2ZSBvbmUgc291cmNlIG9mIGRldmljZSBuYW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KCkFja2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKVGhhbmtzIGZvciB0aGUgcXVpY2sgdHVybmFy
b3VuZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
