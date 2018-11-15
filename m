From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 3/3] x86/shadow: emulate_gva_to_mfn()
 should respect p2m_ioreq_server
Date: Thu, 15 Nov 2018 15:25:23 +0000
Message-ID: <20181115152523.GC18152@deinos.phlegethon.org>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
 <5BED6BE402000078001FC625@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bxfe=n2=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1gNJWJ-0007bI-JJ
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:25:27 +0000
Content-Disposition: inline
In-Reply-To: <5BED6BE402000078001FC625@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDU6NTEgLTA3MDAgb24gMTUgTm92ICgxNTQyMjYxMTA4KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gV3JpdGVzIHRvIHN1Y2ggcGFnZXMgbmVlZCB0byBiZSBoYW5kZWQgdG8gdGhlIGVtdWxhdG9y
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFj
a2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
