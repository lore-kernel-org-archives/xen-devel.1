From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v17 12/13] x86/hvm: Remove redundant save
 functions
Date: Wed, 22 Aug 2018 17:26:10 +0200
Message-ID: <20180822152610.r7vlc4vp2tsbbevs@mac>
References: <1534946563-12084-1-git-send-email-aisaila@bitdefender.com>
 <1534946563-12084-13-git-send-email-aisaila@bitdefender.com>
 <20180822150423.4gb4q66guorbgupb@mac>
 <1534951335.20997.14.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1534951335.20997.14.camel@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Isaila Alexandru <aisaila@bitdefender.com>
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, paul.durrant@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDY6MjI6MTVQTSArMDMwMCwgSXNhaWxhIEFsZXhhbmRy
dSB3cm90ZToKPiA+ID4gwqAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICggaGFu
ZGxlcihkLCBoKSAhPSAwICkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICggaGFu
ZGxlcihkLT52Y3B1WzBdLCBoKSAhPSAwICkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcmludGsoWEVOTE9H
X0dfRVJSCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIkhWTSVkIHNhdmU6IGZhaWxlZCB0byBzYXZlIHR5cGUKPiA+ID4gJSJQUkl1MTYiXG4iLAo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJIVk0g
ZCVkIHNhdmU6IGZhaWxlZCB0byBzYXZlIHR5cGUKPiA+ID4gJSJQUkl1MTYiXG4iLAo+ID4gVGhp
cyBsb29rcyBsaWtlIGFuIHVucmVsYXRlZCBjaGFuZ2UuCj4gSSB3YW50ZWQgdG8gY2hhbmdlIHRo
aXMgc28gaXQgY291bGQgYmUgaW4gdGhlIHNhbWUgb3JkZXIgYXMgdGhlCj4gcGVyX3ZjcHUgcHJp
bnQgdGhhdCB3YXMgbW9kaWZpZWQgYXQgSmFuJ3MgcmVxdWVzdC4KPiBOb3cgdGhlIHByaW50IGlz
IHNvbWV0aGluZyBsaWtlOgo+IAo+ICIKPiAoWEVOKSBIVk0gZDJ2MCBzYXZlOiBDUFUKPiAoWEVO
KSBIVk0gZDJ2MSBzYXZlOiBDUFUKPiAoWEVOKSBIVk0gZDIgc2F2ZTogUElDCj4gKFhFTikgSFZN
IGQyIHNhdmU6IElPQVBJQwo+IChYRU4pIEhWTSBkMnYwIHNhdmU6IExBUElDCj4gIgo+IGluIG9w
cG9zZSB0byBoYXZpbmcgIihYRU4pIEhWTTIgc2F2ZTogUElDIi4KPiAKPiBJZiB0aGUgY2hhbmdl
IGlzIG5vdCBuZWVkZWQgSSBjYW4gZHJvcCBpdC4KCkp1c3QgYWRkIGEgc21hbGwgY29tbWVudCBv
biB0aGUgY29tbWl0IHNheWluZyB0aGF0IHdoaWxlIHRoZXJlIHlvdQphbHNvIGZpeCB0aGUgcHJp
bnRpbmcgb2YgYSBtZXNzYWdlIGluIG9yZGVyIHRvIG1hdGNoIHRoZSBmb3JtYXQgb2YgdGhlCm90
aGVyIHNhdmUgcmVsYXRlZCBtZXNzYWdlcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
