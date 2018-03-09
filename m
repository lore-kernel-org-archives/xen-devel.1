From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] cpufreq/ondemand: fix race while offlining
	CPU
Date: Fri, 9 Mar 2018 15:37:44 +0000
Message-ID: <20180309153744.scokc3tovbyfjr7t@citrix.com>
References: <5AA2633802000078001B0163@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ymxc=f7=citrix.com=prvs=599389b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1euK5g-0001vt-1H
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 15:37:52 +0000
Content-Disposition: inline
In-Reply-To: <5AA2633802000078001B0163@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDI6MzQ6MzJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT2ZmbGluaW5nIGEgQ1BVIGludm9sdmVzIHN0b3BwaW5nIHRoZSBjcHVmcmVxIGdvdmVy
bm9yLiBUaGUgb24tZGVtYW5kCj4gZ292ZXJub3Igd2lsbCBraWxsIHRoZSB0aW1lciBiZWZvcmUg
bGV0dGluZyBnZW5lcmljIGNvZGUgcHJvY2VlZCwgYnV0Cj4gc2luY2UgdGhhdCBnZW5lcmFsbHkg
aXNuJ3QgaGFwcGVuaW5nIG9uIHRoZSBzdWJqZWN0IENQVSwKPiBjcHVmcmVxX2Ric190aW1lcl9y
ZXN1bWUoKSBtYXkgcnVuIGluIHBhcmFsbGVsLiBJZiB0aGF0IG1hbmFnZWQgdG8KPiBpbnZva2Ug
dGhlIHRpbWVyIGhhbmRsZXIsIHRoYXQgaGFuZGxlciBuZWVkcyB0byBydW4gdG8gY29tcGxldGlv
biBiZWZvcmUKPiBkYnNfdGltZXJfZXhpdCgpIG1heSBzYWZlbHkgZXhpdC4KPiAKPiBNYWtlIHRo
ZSAic3RvcHBhYmxlIiBmaWVsZCBhIHRyaXN0YXRlLCBjaGFuZ2luZyBpdCBmcm9tICsxIHRvIC0x
IGFyb3VuZAo+IHRoZSB0aW1lciBmdW5jdGlvbiBpbnZvY2F0aW9uLCBhbmQgbWFrZSBkYnNfdGlt
ZXJfZXhpdCgpIHdhaXQgZm9yIGl0IHRvCj4gYmVjb21lIG5vbi1uZWdhdGl2ZSAoc3RpbGwgd3Jp
dGluZyB6ZXJvIGlmIGl0J3MgKzEpLgo+IAo+IEFsc28gYWRqdXN0IGNvZGluZyBzdHlsZSBpbiBj
cHVmcmVxX2Ric190aW1lcl9yZXN1bWUoKS4KPiAKPiBSZXBvcnRlZC1ieTogTWFydGluIENlcnZl
bnkgPG1hcnRpbkBjLWhvbWUuY3o+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IFRlc3RlZC1ieTogTWFydGluIENlcnZlbnkgPG1hcnRpbkBjLWhvbWUu
Y3o+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
