From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v17 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Wed, 03 Jan 2018 08:48:10 -0700
Message-ID: <5A4D094A020000780019A91D@prv-mh.provo.novell.com>
References: <20180103121942.3524-1-paul.durrant@citrix.com>
 <20180103121942.3524-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gnxr=d6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eWlHD-00011F-VO
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2018 15:48:23 +0000
In-Reply-To: <20180103121942.3524-7-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjAxLjE4IGF0IDEzOjE5LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ICtzdGF0aWMgdm9pZCBodm1fZnJlZV9pb3JlcV9tZm4oc3RydWN0IGh2bV9pb3JlcV9zZXJ2
ZXIgKnMsIGJvb2wgYnVmKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gcy0+ZG9tYWlu
Owo+ICsgICAgc3RydWN0IGh2bV9pb3JlcV9wYWdlICppb3JwID0gYnVmID8gJnMtPmJ1ZmlvcmVx
IDogJnMtPmlvcmVxOwo+ICsKPiArICAgIGlmICggIWlvcnAtPnBhZ2UgKQo+ICsgICAgICAgIHJl
dHVybjsKPiArCj4gKyAgICBwYWdlX2xpc3RfYWRkX3RhaWwoaW9ycC0+cGFnZSwgJmQtPmFyY2gu
aHZtX2RvbWFpbi5pb3JlcV9zZXJ2ZXIucGFnZXMpOwoKQWZhaWN0IHMtPmRvbWFpbiBpcyB0aGUg
Z3Vlc3QsIG5vdCB0aGUgZG9tYWluIGNvbnRhaW5pbmcgdGhlCmVtdWxhdG9yLiBIZW5jZSB0aGlz
IG5ldyBtb2RlbCBvZiBmcmVlaW5nIHRoZSBwYWdlcyBpcyBzYWZlIG9ubHkKd2hlbiB0aGUgZW11
bGF0b3IgZG9tYWluIGlzIGRlYWQgYnkgdGhlIHRpbWUgdGhlIGd1ZXN0IGlzIGJlaW5nCmNsZWFu
ZWQgdXAuIEknbSBub3Qgb25seSB1bmF3YXJlIG9mIHRoaXMgYmVpbmcgZW5mb3JjZWQgYW55d2hl
cmUsCmJ1dCBhbHNvIHVuY29udmluY2VkIHRoaXMgaXMgYSBkZXNpcmFibGUgcmVzdHJpY3Rpb246
IFdoeSBzaG91bGRuJ3QKZW11bGF0b3IgZG9tYWlucyBiZSBhbGxvd2VkIHRvIGJlIGxvbmcgbGl2
ZWQsIHNlcnZpY2luZyBtb3JlIHRoYW4KYSBzaW5nbGUgZ3Vlc3QgaWYgc28gZGVzaXJlZCBieSB0
aGUgYWRtaW4/CgpXaGF0IGlzIGFkZGl0aW9uYWxseSBjb25mdXNpbmcgbWUgaXMgdGhlIHBhZ2Ug
b3duZXJzaGlwOiBXYXNuJ3QKdGhlIChvcmlnaW5hbCkgaW50ZW50aW9uIHRvIG1ha2UgdGhlIHBh
Z2VzIG93bmVkIGJ5IHRoZSBlbXVsYXRvcgpkb21haW4gcmF0aGVyIHRoYW4gdGhlIGd1ZXN0PyBJ
IHNlZW0gdG8gcmVjYWxsIHlvdSByZWZlcnJpbmcgdG8KcmVzdHJpY3Rpb25zIGluIGRvX21tdV91
cGRhdGUoKSwgYnV0IGEgZG9tYWluIHNob3VsZCBhbHdheXMgYmUKYWJsZSB0byBtYXAgcGFnZXMg
aXQgb3ducywgc2hvdWxkbid0IGl0PwoKRnVydGhlcm1vcmUgeW91IGNvbnRpbnVlIHRvIHVzZSBY
ZW4gaGVhcCBwYWdlcyByYXRoZXIgdGhhbgpkb21haW4gaGVhcCBvbmVzLgoKQW5kIGZpbmFsbHkg
SSdtIHN0aWxsIG1pc3NpbmcgdGhlIGlzX2h2bV9kb21haW4oKSBjaGVjayBpbgpodm1fZ2V0X2lv
cmVxX3NlcnZlcl9mcmFtZSgpLiBOb3IgaXMgdGhlcmUgYSBOVUxMIGNoZWNrIGZvcgp0aGUgcmV0
dXJuIHZhbHVlIG9mIGdldF9pb3JlcV9zZXJ2ZXIoKSwgYXMgSSBub3RpY2Ugb25seSBub3cuCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
