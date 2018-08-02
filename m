From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/vmx: Avoid using
 domain_crash_syncrhonous() in vmx_vmentry_failure()
Date: Thu, 2 Aug 2018 07:32:15 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191291534@SHSMSX101.ccr.corp.intel.com>
References: <1533128106-5545-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533128106-5545-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0K
PiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxLCAyMDE4IDg6NTUgUE0KPiAKPiBUaGVyZSBpcyBu
byBuZWVkIGZvciB0aGUgc3luY3Job25vdXMgdmFyaWVudCwgYXMgdGhlIHZtZW50cnkgZmFpbHVy
ZSBwYXRoCj4gY2FuCj4ganVzdCByZXR1cm4gdG8gcHJvY2Vzc2luZyBzb2Z0aXJxcy4KPiAKPiBU
aGlzIGlzIGluIGFpZCBvZiB0cnlpbmcgdG8gcmVtb3ZlIGRvbWFpbl9jcmFzaF9zeW5jcmhvbm91
cygpIGZyb20gdGhlCj4gY29kZWJhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
