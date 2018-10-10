From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Wed, 10 Oct 2018 17:30:11 +0200
Message-ID: <72215e75-6c7e-0aef-c06e-e3aba47cf806__39201.9552331933$1539185507$gmane$org@suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0ojh=mw=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1gAGTq-0005Ut-8D
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 15:32:58 +0000
In-Reply-To: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
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

T24gMTAvNS8xOCAxMDoxMCBBTSwgQXJ1biBLUyB3cm90ZToKPiBXaGVuIGZyZWUgcGFnZXMgYXJl
IGRvbmUgd2l0aCBoaWdoZXIgb3JkZXIsIHRpbWUgc3BlbmQgb24KPiBjb2FsZXNjaW5nIHBhZ2Vz
IGJ5IGJ1ZGR5IGFsbG9jYXRvciBjYW4gYmUgcmVkdWNlZC4gV2l0aAo+IHNlY3Rpb24gc2l6ZSBv
ZiAyNTZNQiwgaG90IGFkZCBsYXRlbmN5IG9mIGEgc2luZ2xlIHNlY3Rpb24KPiBzaG93cyBpbXBy
b3ZlbWVudCBmcm9tIDUwLTYwIG1zIHRvIGxlc3MgdGhhbiAxIG1zLCBoZW5jZQo+IGltcHJvdmlu
ZyB0aGUgaG90IGFkZCBsYXRlbmN5IGJ5IDYwJS4gTW9kaWZ5IGV4dGVybmFsCj4gcHJvdmlkZXJz
IG9mIG9ubGluZSBjYWxsYmFjayB0byBhbGlnbiB3aXRoIHRoZSBjaGFuZ2UuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQXJ1biBLUyA8YXJ1bmtzQGNvZGVhdXJvcmEub3JnPgoKWy4uLl0KCj4gQEAgLTY1
NSwyNiArNjU1LDQ0IEBAIHZvaWQgX19vbmxpbmVfcGFnZV9mcmVlKHN0cnVjdCBwYWdlICpwYWdl
KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKF9fb25saW5lX3BhZ2VfZnJlZSk7Cj4gIAo+IC1z
dGF0aWMgdm9pZCBnZW5lcmljX29ubGluZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICtzdGF0
aWMgaW50IGdlbmVyaWNfb25saW5lX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGlu
dCBvcmRlcikKPiAgewo+IC0JX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKHBhZ2UpOwoKVGhpcyBp
cyBub3cgbm90IGNhbGxlZCBhbnltb3JlLCBhbHRob3VnaCB0aGUgeGVuL2h2IHZhcmlhbnRzIHN0
aWxsIGRvCml0LiBUaGUgZnVuY3Rpb24gc2VlbXMgZW1wdHkgdGhlc2UgZGF5cywgbWF5YmUgcmVt
b3ZlIGl0IGFzIGEgZm9sbG93dXAKY2xlYW51cD8KCj4gLQlfX29ubGluZV9wYWdlX2luY3JlbWVu
dF9jb3VudGVycyhwYWdlKTsKPiAtCV9fb25saW5lX3BhZ2VfZnJlZShwYWdlKTsKPiArCV9fZnJl
ZV9wYWdlc19jb3JlKHBhZ2UsIG9yZGVyKTsKPiArCXRvdGFscmFtX3BhZ2VzICs9ICgxVUwgPDwg
b3JkZXIpOwo+ICsjaWZkZWYgQ09ORklHX0hJR0hNRU0KPiArCWlmIChQYWdlSGlnaE1lbShwYWdl
KSkKPiArCQl0b3RhbGhpZ2hfcGFnZXMgKz0gKDFVTCA8PCBvcmRlcik7Cj4gKyNlbmRpZgoKX19v
bmxpbmVfcGFnZV9pbmNyZW1lbnRfY291bnRlcnMoKSB3b3VsZCBoYXZlIHVzZWQKYWRqdXN0X21h
bmFnZWRfcGFnZV9jb3VudCgpIHdoaWNoIHdvdWxkIGRvIHRoZSBjaGFuZ2VzIHVuZGVyCm1hbmFn
ZWRfcGFnZV9jb3VudF9sb2NrLiBBcmUgd2Ugc2FmZSB3aXRob3V0IHRoZSBsb2NrPyBJZiB5ZXMs
IHRoZXJlCnNob3VsZCBwZXJoYXBzIGJlIGEgY29tbWVudCBleHBsYWluaW5nIHdoeS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
