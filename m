From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/3] vpci/msi: fix update of bound MSI
 interrupts
Date: Wed, 16 May 2018 06:50:41 -0600
Message-ID: <5AFC292102000078001C3374@prv1-mh.provo.novell.com>
References: <20180515141008.69320-1-roger.pau@citrix.com>
 <20180515141008.69320-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iqfx=id=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIvtG-0006QV-Oa
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 12:50:46 +0000
In-Reply-To: <20180515141008.69320-4-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA1LjE4IGF0IDE2OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEN1cnJlbnQgdXBkYXRlIHByb2Nlc3Mgb2YgYWxyZWFkeSBib3VuZCBNU0kgaW50ZXJydXB0cyBp
cyB3cm9uZwo+IGJlY2F1c2UgdW5tYXBfZG9tYWluX3BpcnEgY2FsbHMgcGNpX2Rpc2FibGVfbXNp
LCB3aGljaCBkaXNhYmxlcyBNU0kKPiBpbnRlcnJ1cHRzIG9uIHRoZSBkZXZpY2UuIE9uIHRoZSBv
dGhlciBoYW5kIG1hcF9kb21haW5fcGlycSBkb2Vzbid0Cj4gZW5hYmxlIE1TSSwgc28gdGhlIGN1
cnJlbnQgdXBkYXRlIHByb2Nlc3Mgb2YgYWxyZWFkeSBlbmFibGVkIE1TSQo+IGVudHJpZXMgaXMg
d3JvbmcgYmVjYXVzZSBNU0kgY29udHJvbCBiaXQgd2lsbCBiZSBkaXNhYmxlZCBieQo+IHVubWFw
X2RvbWFpbl9waXJxIGFuZCBub3QgcmUtZW5hYmxlZCBieSBtYXBfZG9tYWluX3BpcnEuCj4gCj4g
SW4gb3JkZXIgdG8gZml4IHRoaXMgYXZvaWQgdW5tYXBwaW5nIHRoZSBQSVJRcyBhbmQganVzdCB1
cGRhdGUgdGhlCj4gYmluZGluZyBvZiB0aGUgUElSUS4gQSBuZXcgYXJjaCBoZWxwZXIgdG8gZG8g
dGhhdCBpcyBpbnRyb2R1Y2VkLgo+IAo+IE5vdGUgdGhhdCBNU0ktWCBpcyBub3QgYWZmZWN0ZWQg
YmVjYXVzZSB1bm1hcF9kb21haW5fcGlycSBvbmx5Cj4gZGlzYWJsZXMgdGhlIE1TSSBlbmFibGUg
Y29udHJvbCBiaXQgZm9yIHRoZSBNU0kgY2FzZSwgZm9yIE1TSS1YIHRoZQo+IGJpdCBpcyBsZWZ0
IHVudG91Y2hlZCBieSB1bm1hcF9kb21haW5fcGlycS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
