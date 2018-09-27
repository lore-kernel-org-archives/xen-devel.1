From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v3] memory_hotplug: Free pages as higher
 order
Date: Thu, 27 Sep 2018 13:39:41 +0530
Message-ID: <f56a750a54eadf76c45d3065622d4cbf__4835.51539150557$1538035720$gmane$org@codeaurora.org>
References: <1538031530-25489-1-git-send-email-arunks@codeaurora.org>
 <20180927070957.GA19369@techadventures.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jqq1=mj=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1g5RMm-0005EX-6Q
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 08:09:44 +0000
In-Reply-To: <20180927070957.GA19369@techadventures.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oscar Salvador <osalvador@techadventures.net>
Cc: mhocko@suse.com, vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0wOS0yNyAxMjozOSwgT3NjYXIgU2FsdmFkb3Igd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjcsIDIwMTggYXQgMTI6Mjg6NTBQTSArMDUzMCwgQXJ1biBLUyB3cm90ZToKPj4gKwlfX2ZyZWVf
cGFnZXNfYm9vdF9jb3JlKHBhZ2UsIG9yZGVyKTsKPiAKSGksCgo+IEkgYW0gbm90IHN1cmUsIGJ1
dCBpZiB3ZSBhcmUgZ29pbmcgdG8gdXNlIHRoYXQgZnVuY3Rpb24gZnJvbSB0aGUKPiBtZW1vcnkt
aG90cGx1ZyBjb2RlLAo+IHdlIG1pZ2h0IHdhbnQgdG8gcmVuYW1lIHRoYXQgZnVuY3Rpb24gdG8g
c29tZXRoaW5nIG1vcmUgZ2VuZXJpYz8KPiBUaGUgd29yZCAiYm9vdCIgc3VnZ2VzdHMgdGhhdCB0
aGlzIGlzIG9ubHkgY2FsbGVkIGZyb20gdGhlIGJvb3Qgc3RhZ2UuCkkgbGwgcmVuYW1lIGl0IHRv
IF9fZnJlZV9wYWdlc19jb3JlKCkKCj4gCj4gQW5kIHdoYXQgYWJvdXQgdGhlIHByZWZldGNoIG9w
ZXJhdGlvbnM/Cj4gSSBzYXcgdGhhdCB5b3UgcmVtb3ZlZCB0aGVtIGluIHlvdXIgcHJldmlvdXMg
cGF0Y2ggYW5kIHRoYXQgaGFkIHNvbWUKPiBiZW5lZml0cyBbMV0uCj4gCj4gU2hvdWxkIHdlIHJl
bW92ZSB0aGVtIGhlcmUgYXMgd2VsbD8KU3VyZS4gV2lsbCB1cGRhdGUgdGhpcyBhcyB3ZWxsLgoK
VGhhbmtzLApBcnVuCj4gCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTA2MTMzNTkvCj4gCj4gVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
