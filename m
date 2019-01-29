From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v5 6/8] microcode: delete microcode pointer
 and size from microcode_info
Date: Tue, 29 Jan 2019 22:11:22 +0800
Message-ID: <20190129141120.GA9218@gao-cwp>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-7-git-send-email-chao.gao@intel.com>
 <20190129101051.uoqvzsphjouwwyz2@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1edO=QF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1goU2r-00066I-UZ
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 14:07:21 +0000
Content-Disposition: inline
In-Reply-To: <20190129101051.uoqvzsphjouwwyz2@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjksIDIwMTkgYXQgMTE6MTA6NTFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIE1vbiwgSmFuIDI4LCAyMDE5IGF0IDAzOjA2OjQ4UE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBtaWNyb2NvZGUgcG9pbnRlciBhbmQgc2l6ZSB3ZXJlIHBhc3NlZCB0byBv
dGhlciBDUFVzIHRvIHBhcnNlCj4+IG1pY3JvY29kZSBsb2NhbGx5LiBOb3csIHBhcnNpbmcgbWlj
cm9jb2RlIGlzIGRvbmUgb24gb25lIENQVS4KPj4gT3RoZXIgQ1BVcyBuZWVkbid0IHBhcnNlIHRo
ZSBtaWNyb2NvZGUgYmxvYjsgdGhlIHBvaW50ZXIgYW5kCj4+IHNpemUgY2FuIGJlIHJlbW92ZWQu
Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+PiAt
LS0KPj4gIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyB8IDMzICsrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyBi
L3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+PiBpbmRleCA5MzZmMGI4Li4zYzIyNzRmIDEwMDY0
NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZS5jCj4+IEBAIC0xOTAsOSArMTkwLDcgQEAgREVGSU5FX1BFUl9DUFUoc3RydWN0
IHVjb2RlX2NwdV9pbmZvLCB1Y29kZV9jcHVfaW5mbyk7Cj4+ICAKPj4gIHN0cnVjdCBtaWNyb2Nv
ZGVfaW5mbyB7Cj4+ICAgICAgdW5zaWduZWQgaW50IGNwdTsKPgo+SSB0aGluayBjcHUgY2FuIGFs
c28gYmUgcmVtb3ZlZCBhcyBteSBwcmV2aW91cyByZXBseSB0byBwYXRjaCA1LCBhdAo+d2hpY2gg
cG9pbnQgeW91IG9ubHkgbmVlZCB0byBzdG9yZSBhbiBlcnJvcj8gSW4gd2hpY2ggY2FzZSB5b3Ug
c2hvdWxkCj5hbHNvIHJlbW92ZSB0aGlzIHN0cnVjdCB0aGVuLgoKSSBhZ3JlZSB0byBhbGwgeW91
ciBjb21tZW50cyBvbiB0aGlzIHBhdGNoLiBXaWxsIGNvcnJlY3QgdGhlbS4KClRoYW5rcwpDaGFv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
