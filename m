From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/6] x86/vmx: Simplfy the default cases in
 vmx_msr_{read, write}_intercept()
Date: Tue, 27 Feb 2018 13:47:58 +0000
Message-ID: <20180227134758.zlungzupbg3qao4a@MacBook-Pro-de-Roger.local>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-2-git-send-email-andrew.cooper3@citrix.com>
 <20180227124321.zwlwuapk7oyazqt7@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180227124321.zwlwuapk7oyazqt7@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMTI6NDM6MjFQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEZlYiAyNiwgMjAxOCBhdCAwNTozNToxNFBNICswMDAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+ID4gVGhlIGRlZmF1bHQgY2FzZSBvZiB2bXhfbXNyX3dyaXRlX2lu
dGVyY2VwdCgpIGluIHBhcnRpY3VsYXIgaXMgdmVyeSB0YW5nbGVkLgo+ID4gCj4gPiBGaXJzdCBv
ZiBhbGwsIGZvbGQgbG9uZ19tb2RlX2RvX21zcl97cmVhZCx3cml0ZX0oKSBpbnRvIHRoZWlyIGNh
bGxlcnMuICBUaGVzZQo+ID4gZnVuY3Rpb25zIHdlcmUgc3BsaXQgb3V0IGluIHRoZSBwYXN0IGJl
Y2F1c2Ugb2YgdGhlIDMyYml0IGJ1aWxkIG9mIFhlbiwgYnV0IGl0Cj4gPiBpcyB1bmNsZWFyIHdo
eSB0aGUgY2FzZXMgd2VyZW4ndCBzaW1wbHkgI2lmZGVmJ2QgaW4gcGxhY2UuCj4gPiAKPiA+IE5l
eHQsIGludmVydCB0aGUgdm14X3dyaXRlX2d1ZXN0X21zcigpL2lzX2xhc3RfYnJhbmNoX21zcigp
IGxvZ2ljIHRvIGJyZWFrIGlmCj4gPiB0aGUgY29uZGl0aW9uIGlzIHNhdGlzZmllZCwgcmF0aGVy
IHRoYW4gbmVzdGluZyBpZiBpdCB3YXNuJ3QuICBUaGlzIGFsbG93cyB0aGUKPiA+IHdybXNyX2h5
cGVydmlzb3JfcmVncygpIGNhbGwgdG8gYmUgdW4tbmVzdGVkIHdpdGggcmVzcGVjdCB0byB0aGUg
b3RoZXIgZGVmYXVsdAo+ID4gbG9naWMuCj4gPiAKPiA+IE5vIHByYWN0aWNhbCBkaWZmZXJlbmNl
IGZyb20gYSBndWVzdHMgcG9pbnQgb2Ygdmlldy4KPiAKPiBJIHRoaW5rIHRoZXJlJ3MgYSBkaWZm
ZXJlbmNlIGZyb20gZ3Vlc3QgUG9WIG5vdywgZ3Vlc3Qgd3Jtc3Igb2YKPiBHUy9GUy9MU1RBUi9D
U1RBUiB3aXRoIG5vbi1jYW5vbmljYWwgYWRkcmVzc2VzIHdpbGwgZ2V0IGEgI0dQLgoKRm9yZ2V0
IGFib3V0IHRoaXMsIEkndmUganVzdCByZWFsaXplZCB0aGlzIGlzIGNvbXBsZXRlbHkgd3Jvbmcu
CgpBbmQgSSd2ZSBhbHNvIGZpZ3VyZWQgb3V0IG15IHF1ZXN0aW9uIHRvIENTVEFSLCBzbzoKClJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
