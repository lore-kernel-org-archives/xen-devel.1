From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 2/8] x86/vlapic: use apic_id array to
 set initial (x2)APIC ID
Date: Mon, 23 Apr 2018 10:04:56 -0600
Message-ID: <5ADE042802000078001BDA86@prv1-mh.provo.novell.com>
References: <1515384090-175916-1-git-send-email-chao.gao@intel.com>
 <1515384090-175916-3-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515384090-175916-3-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE4IGF0IDA1OjAxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL2RvbWFpbi5oCj4gQEAgLTIxMyw2ICsyMTMsOSBAQCBzdHJ1Y3QgaHZtX2Rv
bWFpbiB7Cj4gICAgICB1aW50OF90IHRocmVhZF9wZXJfY29yZTsKPiAgfTsKPiAgCj4gKyNkZWZp
bmUgaHZtX3ZjcHVfeDJhcGljX2lkKHYpICh2LT5kb21haW4tPmFyY2guaHZtX2RvbWFpbi5hcGlj
X2lkW3YtPnZjcHVfaWRdKQoKSSBjYW4ndCBzZWVtIHRvIGZpbmQgd2hlcmUgeW91IHNldCB1cCB0
aGlzIGFycmF5LgoKPiArI2RlZmluZSBodm1fdmNwdV9hcGljX2lkKHYpIChodm1fdmNwdV94MmFw
aWNfaWQodikgJSAyNTUpCgpJIGRvbid0IHRoaW5rIHRoZSAlIDI1NSBpcyBhcHByb3ByaWF0ZSBo
ZXJlIC0gdGhlIG1hY3JvIHNpbXBseSBzaG91bGRuJ3QgYmUKaW52b2tlZCBpbiBzdWNoIGEgY2Fz
ZS4KCk9uIHRoZSB3aG9sZSBJJ20gbm90IGNvbnZpbmNlZCB1c2luZyBhIGFycmF5IGlzIGFwcHJv
cHJpYXRlIC0gY2FsY3VsYXRpbmcKdGhlIEFQSUMgSUQgc2hvdWxkIGJlIHZlcnkgaW52b2x2ZWQs
IGFuZCByZXF1aXJlIG11Y2ggbGVzcyB0aGFuIHBvc3NpYmx5Cm11bHRpcGxlIGtiIG9mIHN0b3Jh
Z2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
