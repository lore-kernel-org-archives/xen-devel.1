From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: fix hvm_migrate_irq assertion
Date: Mon, 12 Nov 2018 15:52:32 +0100
Message-ID: <20181112145232.n53idduuatyohfhw@mac.citrite.net>
References: <20181112140459.23480-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dr1o=nx=citrix.com=prvs=847277b8a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gMDaI-0004At-UK
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 14:53:02 +0000
Content-Disposition: inline
In-Reply-To: <20181112140459.23480-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDI6MDQ6NTlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA3ODJjZjhiYTQ2ICgicGFzcy10aHJvdWdoOiBhZGp1c3QgcElSUSBtaWdyYXRpb24iKSBhZGRl
ZCBhbiBhc3NlcnRpb24KPiB0byBodm1fbWlncmF0ZV9pcnEuCj4gCj4gUFZIIERvbTAgaXMgYnJv
a2VuIGJlY2F1c2UgaXQgZG9lc24ndCBoYXZlIGRwY2kgYWxsb2NhdGVkLiBBZGQgYW4KPiBpc19o
YXJkd2FyZV9kb21haW4gY2hlY2sgdG8gdGhlIGFzc2VydGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS9o
dm0uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPiBpbmRleCA1MTkyODI5MzdiLi41ZDI2M2M0MDkwIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
Cj4gQEAgLTQ2NCw3ICs0NjQsOCBAQCB2b2lkIGh2bV9taWdyYXRlX3RpbWVycyhzdHJ1Y3QgdmNw
dSAqdikKPiAgCj4gIHZvaWQgaHZtX21pZ3JhdGVfcGlycShzdHJ1Y3QgaHZtX3BpcnFfZHBjaSAq
cGlycV9kcGNpLCBjb25zdCBzdHJ1Y3QgdmNwdSAqdikKPiAgewo+IC0gICAgQVNTRVJUKGlvbW11
X2VuYWJsZWQgJiYgaHZtX2RvbWFpbl9pcnEodi0+ZG9tYWluKS0+ZHBjaSk7Cj4gKyAgICBBU1NF
UlQoaW9tbXVfZW5hYmxlZCAmJgo+ICsgICAgICAgICAgIChpc19oYXJkd2FyZV9kb21haW4odi0+
ZG9tYWluKSB8fCBodm1fZG9tYWluX2lycSh2LT5kb21haW4pLT5kcGNpKSk7CgpBbGJlaXQgSSB3
b3VsZCBqdXN0IHJlbW92ZSB0aGUgaHZtX2RvbWFpbl9pcnEodi0+ZG9tYWluKS0+ZHBjaSBwYXJ0
IG9mCnRoZSBhc3NlcnQsIEFGQUlDVCB0aGUgZnVuY3Rpb24gZG9lc24ndCB1c2UgaXQgYXQgYWxs
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
