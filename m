From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v5 2/2] mm/page_alloc: remove software
 prefetching in __free_pages_core
Date: Wed, 10 Oct 2018 18:36:52 +0200
Message-ID: <e8afbe5e-06b1-f179-6292-1a5967432849__35539.5468337976$1539189507$gmane$org@suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <1538727006-5727-2-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0ojh=mw=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1gAHWO-0003fm-2q
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 16:39:40 +0000
In-Reply-To: <1538727006-5727-2-git-send-email-arunks@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>, kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, boris.ostrovsky@oracle.com, jgross@suse.com, akpm@linux-foundation.org, dan.j.williams@intel.com, mhocko@suse.com, iamjoonsoo.kim@lge.com, gregkh@linuxfoundation.org, osalvador@suse.de, malat@debian.org, kirill.shutemov@linux.intel.com, jrdr.linux@gmail.com, yasu.isimatu@gmail.com, mgorman@techsingularity.net, aaron.lu@intel.com, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org
Cc: vinmenon@codeaurora.org, vatsa@codeaurora.org, getarunks@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvNS8xOCAxMDoxMCBBTSwgQXJ1biBLUyB3cm90ZToKPiBUaGV5IG5vdCBvbmx5IGluY3Jl
YXNlIHRoZSBjb2RlIGZvb3RwcmludCwgdGhleSBhY3R1YWxseSBtYWtlIHRoaW5ncwo+IHNsb3dl
ciByYXRoZXIgdGhhbiBmYXN0ZXIuIFJlbW92ZSB0aGVtIGFzIGNvbnRlbXBvcmFyeSBoYXJkd2Fy
ZSBkb2Vzbid0Cj4gbmVlZCBhbnkgaGludC4KPiAKPiBTdWdnZXN0ZWQtYnk6IERhbiBXaWxsaWFt
cyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFydW4gS1MgPGFy
dW5rc0Bjb2RlYXVyb3JhLm9yZz4KClllYWgsIGEgdGlnaHQgbG9vcCB3aXRoIGZpeGVkIHN0cmlk
ZSBpcyBhIHRyaXZpYWwgY2FzZSBmb3IgaHcgcHJlZmV0Y2hlci4KCkFja2VkLWJ5OiBWbGFzdGlt
aWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6PgoKPiAtLS0KPiAgbW0vcGFnZV9hbGxvYy5jIHwgNiAr
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBpbmRl
eCA3YWI1Mjc0Li45MGRiNDMxIDEwMDY0NAo+IC0tLSBhL21tL3BhZ2VfYWxsb2MuYwo+ICsrKyBi
L21tL3BhZ2VfYWxsb2MuYwo+IEBAIC0xMjU4LDE0ICsxMjU4LDEwIEBAIHZvaWQgX19mcmVlX3Bh
Z2VzX2NvcmUoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGludCBvcmRlcikKPiAgCXN0cnVj
dCBwYWdlICpwID0gcGFnZTsKPiAgCXVuc2lnbmVkIGludCBsb29wOwo+ICAKPiAtCXByZWZldGNo
dyhwKTsKPiAtCWZvciAobG9vcCA9IDA7IGxvb3AgPCAobnJfcGFnZXMgLSAxKTsgbG9vcCsrLCBw
KyspIHsKPiAtCQlwcmVmZXRjaHcocCArIDEpOwo+ICsJZm9yIChsb29wID0gMDsgbG9vcCA8IG5y
X3BhZ2VzIDsgbG9vcCsrLCBwKyspIHsKPiAgCQlfX0NsZWFyUGFnZVJlc2VydmVkKHApOwo+ICAJ
CXNldF9wYWdlX2NvdW50KHAsIDApOwo+ICAJfQo+IC0JX19DbGVhclBhZ2VSZXNlcnZlZChwKTsK
PiAtCXNldF9wYWdlX2NvdW50KHAsIDApOwo+ICAKPiAgCXBhZ2Vfem9uZShwYWdlKS0+bWFuYWdl
ZF9wYWdlcyArPSBucl9wYWdlczsKPiAgCXNldF9wYWdlX3JlZmNvdW50ZWQocGFnZSk7Cj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
