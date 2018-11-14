From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/8] x86/vvmx: correct vmfail() usage for
 vmptrld and vmclear
Date: Wed, 14 Nov 2018 03:13:35 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49B6D@SHSMSX101.ccr.corp.intel.com>
References: <20181106120759.8789-1-sergey.dyasli@citrix.com>
 <20181106120759.8789-5-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106120759.8789-5-sergey.dyasli@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBTZXJnZXkgRHlhc2xpIFttYWlsdG86c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tXQo+
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDYsIDIwMTggODowOCBQTQo+IAo+IENhbGxpbmcgdm1m
YWlsX3ZhbGlkKCkgaXMgY29ycmVjdCBvbmx5IGlmIHZ2bWN4IGlzIHZhbGlkLiBNb2RpZnkKPiBm
dW5jdGlvbnMgdG8gdXNlIHZtZmFpbCgpIGluc3RlYWQgd2hpY2ggcGVyZm9ybXMgdGhlIG5lY2Vz
c2FyeSBjaGVjay4KPiAKPiBXaGlsZSBhdCBpdCwgYWRkIEFTU0VSVHMgaW50byB2bWZhaWxfdmFs
aWQvaW52YWxpZCgpIHRvIHF1aWNrbHkgY2F0Y2gKPiBhbiBpbmNvcnJlY3QgdXNhZ2UgaW4gdGhl
IGZ1dHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xp
QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
