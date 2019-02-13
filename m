From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 3/7] x86/pvh: reorder PVH dom0
 iommu initialization
Date: Wed, 13 Feb 2019 08:58:43 -0700
Message-ID: <5C643EB3020000780021662F@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtwvu-0001ad-6x
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 15:58:46 +0000
In-Reply-To: <20190211174642.38046-4-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNvIHRoYXQgdGhlIGlvbW11IGlzIGluaXRpYWxpemVkIGJlZm9yZSBwb3B1bGF0aW5nIHRoZSBw
Mm0sIGFuZAo+IGVudHJpZXMgYWRkZWQgZ2V0IHRoZSBjb3JyZXNwb25kaW5nIGlvbW11IHBhZ2Ug
dGFibGUgZW50cmllcyBpZgo+IHJlcXVpcmVkLiBUaGlzIHJlcXVpcmVzIHNwbGl0dGluZyB0aGUg
Y3VycmVudCBwdmhfc2V0dXBfcDJtIGludG8gdHdvCj4gZGlmZmVyZW50IGZ1bmN0aW9ucy4gT25l
IHRoYXQgY3JhZnRzIGRvbTAgcGh5c21hcCBhbmQgc2V0cyB0aGUgcGFnaW5nCj4gYWxsb2NhdGlv
biwgYW5kIGFub3RoZXIgb25lIHRoYXQgYWN0dWFsbHkgcG9wdWxhdGVzIHRoZSBwMm0gd2l0aCBS
QU0KPiByZWdpb25zLgo+IAo+IE5vdGUgdGhhdCB0aGlzIGFsbG93cyB0byByZW1vdmUgdGhlIHNw
ZWNpYWwgY2FzaW5nIGRvbmUgZm9yIHRoZSBsb3cKPiAxTUIgaW4gaHdkb21faW9tbXVfbWFwLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
