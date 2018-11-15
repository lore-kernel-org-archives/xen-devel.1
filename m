From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/4] x86/vvmx: Correct the INVALID_PADDR
 checks for VMPTRLD/VMCLEAR
Date: Thu, 15 Nov 2018 15:50:55 +0100
Message-ID: <20181115145055.lizbqw3twaxa2bcg@mac>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
 <1542289970-32709-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1542289970-32709-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDE6NTI6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgcmVmZXJlbmNlZCBhZGRyZXNzZXMgYWxzbyBuZWVkIGNoZWNraW5nIGFnYWlu
c3QgTUFYUEhZU0FERFIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdl
eS5keWFzbGlAY2l0cml4LmNvbT4KPiBDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50
ZWwuY29tPgo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiAtLS0KPiAg
eGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+IGluZGV4
IGMyOTY2NjAuLjVkYWFiODIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCj4gQEAgLTE2NzIsNyArMTY3
Miw3IEBAIHN0YXRpYyBpbnQgbnZteF9oYW5kbGVfdm1wdHJsZChzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyAqcmVncykKPiAgICAgIGlmICggcmMgIT0gWDg2RU1VTF9PS0FZICkKPiAgICAgICAgICByZXR1
cm4gcmM7Cj4gIAo+IC0gICAgaWYgKCBncGEgJiAweGZmZiApCj4gKyAgICBpZiAoIChncGEgJiB+
UEFHRV9NQVNLKSB8fCAhZ2ZuX3ZhbGlkKHYtPmRvbWFpbiwgZ2FkZHJfdG9fZ2ZuKGdwYSkpICkK
ClNlZWluZyB0aGlzIGlzIHJlcGVhdGVkIGluIHNldmVyYWwgcGxhY2VzLCBpdCBtaWdodCBiZSBo
ZWxwZnVsIHRvCmludHJvZHVjZSBhIGhlbHBlcj8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
