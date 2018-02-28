From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/6] xen/domain: Reduce the quantity of
 initialisation for system domains
Date: Wed, 28 Feb 2018 15:22:35 +0000
Message-ID: <9bc4f99a-6da3-0fc4-b2b7-ca7fbb38ea63@citrix.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAwMjoxNCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAgKiBTeXN0ZW0g
ZG9tYWlucyBkb24ndCBuZWVkIHdhdGNoZG9nIGluaXRpYWxpc2F0aW9uIG9yIGlvbWVtL2lycSBy
YW5nZXNldHMsCj4gICAgYW5kIHdpbGwgbm90IHBsYXVzaWJseSBiZSBhIHhlbnN0b3JlIG9yIGhh
cmR3YXJlIGRvbWFpbi4KPiAgKiBUaGUgaWRsZSBkb21haW4gZG9lc24ndCBuZWVkIHNjaGVkdWxl
ciBpbml0aWFsaXNhdGlvbiAoYW5kIGluIHBhcnRpY3VsYXIsCj4gICAgcmVtb3ZpbmcgdGhpcyBw
YXRoIGFsbG93cyBmb3Igc3Vic3RhbnRpYWwgc2NoZWR1bGVyIGNsZWFudXApLCBhbmQgaXNuJ3QK
PiAgICBsaWFibGUgdG8gZXZlciBuZWVkIGxhdGVfaHdkb21faW5pdCgpLgo+IAo+IE1vdmUgYWxs
IG9mIHRoZXNlIGluaXRpYWxpc2F0aW9ucyBwYXNzIHRoZSBET01DUkZfZHVtbXkgZWFybHkgZXhp
dCwgYW5kIGludG8KPiBub24taWRsZSBwYXRocy4gIHJhbmdlc2V0X2RvbWFpbl9pbml0aWFsaXNl
KCkgcmVtYWlucyBiZWNhdXNlIGl0IG1ha2VzIG5vCj4gYWxsb2NhdGlvbnMsIGJ1dCBkb2VzIGlu
aXRpYWxpc2UgYSBsaW5rZWQgbGlzdCBhbmQgc3BpbmxvY2suICBUaGUgcG9vbGlkCj4gcGFyYW1l
dGVyIGNhbiBiZSBkcm9wcGVkIGFzIHNjaGVkX2luaXRfZG9tYWluKCkncyBwYXJhbWV0ZXIgaXMg
bm93Cj4gdW5jb25kaXRpb25hbGx5IDAuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkxvb2tzIGdvb2Q6CgpSZXZpZXdlZC1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
