From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] iommu: fix order of arguments in
 iommu_map call at iommu_hwdom_init
Date: Thu, 24 Jan 2019 11:08:17 +0100
Message-ID: <7f8d5f68-41e0-0743-ff42-fbb43ac9ee33@suse.com>
References: <20190123180818.78684-1-roger.pau@citrix.com>
 <5C498A460200007800210BB4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O3D+=QA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gmbvq-0005YM-Ao
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 10:08:22 +0000
In-Reply-To: <5C498A460200007800210BB4@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAxMDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDEuMTkg
YXQgMTk6MDgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZSBvcmRlciBvZiB0
aGUgcGFnZV9vcmRlciBhbmQgdGhlIGZsYWdzIHBhcmFtZXRlcnMgYXJlIGludmVydGVkIGluCj4+
IHRoZSBjYWxsIHRvIGlvbW11X21hcCBtYWRlIGluIGlvbW11X2h3ZG9tX2luaXQuCj4+Cj4+IEZp
eGVzOiBlOGFmZTExMjRjYzEgKCJpb21tdTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hlciBvcmRl
ciBtYXAvdW5tYXAgb3BlcmF0aW9ucyIpCj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IEkgbm90aWNlIHlvdSBkaWRuJ3QgQ2MgSsO8
cmdlbiAtIG5vdyBkb25lLgoKVGhhbmtzLgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
