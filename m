From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 2/2] x86/dump_pagetables: Fix LDT remap
 address marker
Date: Fri, 30 Nov 2018 23:23:28 +0300
Message-ID: <20181130202328.65359-3-kirill.shutemov__3119.68303653902$1543609414$gmane$org@linux.intel.com>
References: <20181130202328.65359-1-kirill.shutemov@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o/3g=oj=linux.intel.com=kirill.shutemov@srs-us1.protection.inumbo.net>)
 id 1gSpLK-0001Lj-Fl
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 20:24:54 +0000
In-Reply-To: <20181130202328.65359-1-kirill.shutemov@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org
Cc: jgross@suse.com, bhe@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, hans.van.kranenburg@mendix.com, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIExEVCByZW1hcCBwbGFjZW1lbnQgaGFzIGJlZW4gY2hhbmdlZC4gSXQncyBub3cgcGxhY2Vk
IGJlZm9yZSBkaXJlY3QKbWFwcGluZyBpbiB0aGUga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBzcGFj
ZSBmb3IgYm90aCBwYWdpbmcgbW9kZXMuCgpDaGFuZ2UgYWRkcmVzcyBtYXJrZXJzIG9yZGVyIGFj
Y29yZGluZ2x5LgoKU2lnbmVkLW9mZi1ieTogS2lyaWxsIEEuIFNodXRlbW92IDxraXJpbGwuc2h1
dGVtb3ZAbGludXguaW50ZWwuY29tPgpGaXhlczogZDUyODg4YWEyNzUzICgieDg2L21tOiBNb3Zl
IExEVCByZW1hcCBvdXQgb2YgS0FTTFIgcmVnaW9uIG9uIDUtbGV2ZWwgcGFnaW5nIikKLS0tCiBh
cmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9t
bS9kdW1wX3BhZ2V0YWJsZXMuYyBiL2FyY2gveDg2L21tL2R1bXBfcGFnZXRhYmxlcy5jCmluZGV4
IGRhZDE1M2U1YTQyNy4uYWJjYjhkMDBiMDE0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9kdW1w
X3BhZ2V0YWJsZXMuYworKysgYi9hcmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuYwpAQCAtNTUs
MTAgKzU1LDEwIEBAIHN0cnVjdCBhZGRyX21hcmtlciB7CiBlbnVtIGFkZHJlc3NfbWFya2Vyc19p
ZHggewogCVVTRVJfU1BBQ0VfTlIgPSAwLAogCUtFUk5FTF9TUEFDRV9OUiwKLQlMT1dfS0VSTkVM
X05SLAotI2lmIGRlZmluZWQoQ09ORklHX01PRElGWV9MRFRfU1lTQ0FMTCkgJiYgZGVmaW5lZChD
T05GSUdfWDg2XzVMRVZFTCkKKyNpZmRlZiBDT05GSUdfTU9ESUZZX0xEVF9TWVNDQUxMCiAJTERU
X05SLAogI2VuZGlmCisJTE9XX0tFUk5FTF9OUiwKIAlWTUFMTE9DX1NUQVJUX05SLAogCVZNRU1N
QVBfU1RBUlRfTlIsCiAjaWZkZWYgQ09ORklHX0tBU0FOCkBAIC02Niw5ICs2Niw2IEBAIGVudW0g
YWRkcmVzc19tYXJrZXJzX2lkeCB7CiAJS0FTQU5fU0hBRE9XX0VORF9OUiwKICNlbmRpZgogCUNQ
VV9FTlRSWV9BUkVBX05SLAotI2lmIGRlZmluZWQoQ09ORklHX01PRElGWV9MRFRfU1lTQ0FMTCkg
JiYgIWRlZmluZWQoQ09ORklHX1g4Nl81TEVWRUwpCi0JTERUX05SLAotI2VuZGlmCiAjaWZkZWYg
Q09ORklHX1g4Nl9FU1BGSVg2NAogCUVTUEZJWF9TVEFSVF9OUiwKICNlbmRpZgotLSAKMi4xOS4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
