From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v4] memory_hotplug: Free pages as higher
 order
Date: Thu, 4 Oct 2018 16:51:08 +0200
Message-ID: <20181004145108.GH22173__10552.3677579642$1538664594$gmane$org@dhcp22.suse.cz>
References: <1538573979-28365-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etb5=mq=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g84y9-0000Y3-Qz
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 14:51:13 +0000
Content-Disposition: inline
In-Reply-To: <1538573979-28365-1-git-send-email-arunks@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDAzLTEwLTE4IDE5OjA5OjM5LCBBcnVuIEtTIHdyb3RlOgpbLi4uXQo+ICtzdGF0aWMg
aW50IG9ubGluZV9wYWdlc19ibG9ja3ModW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9u
ZyBucl9wYWdlcykKPiArewo+ICsJdW5zaWduZWQgbG9uZyBlbmQgPSBzdGFydCArIG5yX3BhZ2Vz
Owo+ICsJaW50IG9yZGVyLCByZXQsIG9ubGluZWRfcGFnZXMgPSAwOwo+ICsKPiArCXdoaWxlIChz
dGFydCA8IGVuZCkgewo+ICsJCW9yZGVyID0gbWluKE1BWF9PUkRFUiAtIDFVTCwgX19mZnMoc3Rh
cnQpKTsKPiArCj4gKwkJd2hpbGUgKHN0YXJ0ICsgKDFVTCA8PCBvcmRlcikgPiBlbmQpCj4gKwkJ
CW9yZGVyLS07Cgp0aGlzIHJlYWxseSBtYWRlIG1lIHNjcmF0Y2ggbXkgaGVhZC4gV291bGRuJ3Qg
aXQgYmUgbXVjaCBzaW1wbGVyIHRvIGRvCnRoZSBmb2xsb3dpbmc/CgkJb3JkZXIgPSBtaW4oTUFY
X09SREVSIC0gMSwgZ2V0X29yZGVyKGVuZCAtIHN0YXJ0KSk/Cgo+ICsKPiArCQlyZXQgPSAoKm9u
bGluZV9wYWdlX2NhbGxiYWNrKShwZm5fdG9fcGFnZShzdGFydCksIG9yZGVyKTsKPiArCQlpZiAo
IXJldCkKPiArCQkJb25saW5lZF9wYWdlcyArPSAoMVVMIDw8IG9yZGVyKTsKPiArCQllbHNlIGlm
IChyZXQgPiAwKQo+ICsJCQlvbmxpbmVkX3BhZ2VzICs9IHJldDsKPiArCj4gKwkJc3RhcnQgKz0g
KDFVTCA8PCBvcmRlcik7Cj4gKwl9Cj4gKwlyZXR1cm4gb25saW5lZF9wYWdlczsKPiAgfQpbLi4u
XQo+IC1zdGF0aWMgdm9pZCBfX2luaXQgX19mcmVlX3BhZ2VzX2Jvb3RfY29yZShzdHJ1Y3QgcGFn
ZSAqcGFnZSwgdW5zaWduZWQgaW50IG9yZGVyKQo+ICt2b2lkIF9fZnJlZV9wYWdlc19jb3JlKHN0
cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gIHsKPiAgCXVuc2lnbmVkIGlu
dCBucl9wYWdlcyA9IDEgPDwgb3JkZXI7Cj4gIAlzdHJ1Y3QgcGFnZSAqcCA9IHBhZ2U7Cj4gIAl1
bnNpZ25lZCBpbnQgbG9vcDsKPiAgCj4gLQlwcmVmZXRjaHcocCk7Cj4gLQlmb3IgKGxvb3AgPSAw
OyBsb29wIDwgKG5yX3BhZ2VzIC0gMSk7IGxvb3ArKywgcCsrKSB7Cj4gLQkJcHJlZmV0Y2h3KHAg
KyAxKTsKPiArCWZvciAobG9vcCA9IDA7IGxvb3AgPCBucl9wYWdlczsgbG9vcCsrLCBwKyspIHsK
PiAgCQlfX0NsZWFyUGFnZVJlc2VydmVkKHApOwo+ICAJCXNldF9wYWdlX2NvdW50KHAsIDApOwo+
ICAJfQo+IC0JX19DbGVhclBhZ2VSZXNlcnZlZChwKTsKPiAtCXNldF9wYWdlX2NvdW50KHAsIDAp
Owo+ICAKPiAgCXBhZ2Vfem9uZShwYWdlKS0+bWFuYWdlZF9wYWdlcyArPSBucl9wYWdlczsKPiAg
CXNldF9wYWdlX3JlZmNvdW50ZWQocGFnZSk7CgpJIHRoaW5rIHRoaXMgaXMgd29ydCBhIHNlcGFy
YXRlIHBhdGNoIGFzIGl0IGlzIHVucmVsYXRlZCB0byB0aGUgcGF0Y2guCgotLSAKTWljaGFsIEhv
Y2tvClNVU0UgTGFicwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
