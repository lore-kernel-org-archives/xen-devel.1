From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 8/8] x86/vvmx: fix I/O and MSR bitmaps
 mapping
Date: Wed, 14 Nov 2018 05:29:09 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49D5E@SHSMSX101.ccr.corp.intel.com>
References: <20181106120759.8789-1-sergey.dyasli@citrix.com>
 <20181106120759.8789-9-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106120759.8789-9-sergey.dyasli@citrix.com>
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
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDYsIDIwMTggODowOCBQTQo+IAo+IEN1cnJlbnRseSBY
ZW4gdHJpZXMgdG8gbWFwIGJpdG1hcHMgZHVyaW5nIGVtdWxhdGlvbiBvZiB2bXB0cmxkIGFuZAo+
IHZtd3JpdGUuIFRoaXMgaXMgd3Jvbmc6IGEgZ3Vlc3QgY2FuIHN0b3JlIGFyYml0cmFyeSB2YWx1
ZXMgaW4gdGhvc2UKPiBmaWVsZHMuCj4gCj4gTWFrZSBiaXRtYXBzIG1hcHBpbmcgaGFwcGVuIG9u
bHkgZHVyaW5nIGEgbmVzdGVkIHZtZW50cnkgYW5kIG9ubHkgaWYKPiB0aGUgYXBwcm9wcmlhdGUg
ZXhlY3V0aW9uIGNvbnRyb2xzIGFyZSB0dXJuZWQgb24gYnkgTDEgaHlwZXJ2aXNvci4KPiAKPiBG
b3IgcGVyZm9ybWFuY2UgcmVhc29ucywgWGVuIG1hcHMgYml0bWFwcyBvbmx5Ogo+IAo+ICAgICAx
LiBEdXJpbmcgdGhlIGZpcnN0IG5lc3RlZCB2bWVudHJ5Cj4gICAgIDIuIEFmdGVyIEwxIGhhcyBj
aGFuZ2VkIGFuIGFwcHJvcHJpYXRlIHZtY3MgZmllbGQKPiAgICAgMy4gQWZ0ZXIgbnZteF9wdXJn
ZV92dm1jcygpIHdhcyBwcmV2aW91c2x5IGNhbGxlZAo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdl
eSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
