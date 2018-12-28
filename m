From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 5/6] x86/AMD: Fix handling of FPU pointer on
 Zen hardware
Date: Fri, 28 Dec 2018 16:43:23 +0100
Message-ID: <20181228154323.yxireqgxl3eh6mcx@mac>
References: <1546000776-23378-1-git-send-email-andrew.cooper3@citrix.com>
 <1546000776-23378-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1546000776-23378-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Pu Wen <puwen@hygon.cn>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjgsIDIwMTggYXQgMTI6Mzk6MzVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBTUQgaGFyZHdhcmUgYmVmb3JlIFplbiBkb2Vzbid0IHNhZmUvcmVzdG9yZSB0aGUg
RlBVIGVycm9yIHBvaW50ZXJzCj4gdW5sZXNzIGFuIHVubWFza2VkIEZQVSBleGNlcHRpb24gaXMg
cGVuZGluZy4gIFplbiBwcm9jZXNzb3JzIGhhdmUgYQo+IGZlYXR1cmUgYml0IGluZGljYXRpbmcg
dGhhdCB0aGlzIChtaXMpYmVoYXZpb3VyIG5vIGxvbmdlciBleGlzdHMuCj4gCj4gRXhwcmVzcyB0
aGUgY29tbW9uIGxvZ2ljIGluIHRlcm1zIG9mIGNwdV9idWdfZnB1X2Vycl9wdHIgYXMgSHlnb24K
PiBwcm9jZXNzb3JzIChiZWluZyBaZW4gZGVyaXZhdGl2ZXMpIHdvbid0IGluaGVyaXQgdGhpcyBi
ZWhhdmlvdXIuCj4gCj4gV2hpbGUgYXQgaXQsIGZpeCBhIHBlcmZvcm1hbmNlIGlzc3VlIHdpdGgg
dGhlIHdvcmthcm91bmQsIHdoaWNoIEkgc2hvdWxkCj4gaGF2ZSBub3RpY2VkIGJ5IG5vdy4gIExv
b2tpbmcgYXQgdGhlIEZQVSBzdGF0ZSBzbG93cyB0aGUgY29udGV4dCBzd2l0Y2gKPiBwYXRoIGRv
d24sIGFzIGl0IGlzIGEgbW9kZXJhdGVseSBjb21wbGljYXRlZCB1bnByZWRpY3RhYmxlIGNvbmRp
dGlvbgo+IHdoaWNoIHdpbGwgZXZhbHVhdGUgdG8gdHJ1ZSBmb3IgYWxsIDY0Yml0IE9TZXMgYW5k
IG1vc3QgMzJiaXQgb25lcy4KPiAKPiBMZWF2ZSB0aGUgc29sZSBjb25kaXRpb24gYmVpbmcgdGhl
IGVhc2lseS1wcmVkaWN0YWJsZQo+IGNwdV9idWdfZnB1X2Vycl9wdHIgYXMgdGhlIGFzbSBzZXF1
ZW5jZSBpcyBuZWVkZWQgaW4gfjEwMCUgb2YgY2FzZXMKPiB0aGVzZSBkYXlzIG9uIGFmZmVjdGVk
IGhhcmR3YXJlLgoKSSdtIG5vdCB0aGF0IGZhbWlsaWFyIHdpdGggdGhlIEZQVSByZWdpc3RlcnMs
IGJ1dCBJIGFzc3VtZSBjdXJyZW50CmNvZGUgY2hlY2tzIHdoZXRoZXIgdGhlcmUncyBhbiBleGNl
cHRpb24gcGVuZGluZyBiZWZvcmUgZGVjb2RpbmcKd2hldGhlciB0aGUgZXJyb3IgcG9pbnRlcnMg
c2hvdWxkIGJlIGNsZWFyZWQ/Cgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpBcGFydCBmcm9tIHRoZSBxdWVzdGlvbiBhYm92ZSwgTEdU
TToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
