From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH 4/4] x86/vvmx: Don't call vmsucceed() at the
 end of virtual_vmexit()
Date: Thu, 15 Nov 2018 15:28:49 +0000
Message-ID: <1210c5d3-2a61-1d66-4bf6-4e7e400829ec@citrix.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
 <1542289970-32709-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542289970-32709-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTEvMjAxOCAxMzo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGVuZHMgdXAg
Y29ycnVwdGluZyBMMSdzIHZpZXcgb2YgUkZMQUdTIGJ5IHNldHRpbmcgWkYuICBUaGUgY29ycmVj
dCB2YWx1ZQo+IGlzIGVzdGFibGlzaGVkIGVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9uLgoKdm1zdWNj
ZWVkKCkgZG9lc24ndCBzZXQgYW55IGZsYWdzLCBvbmx5IGNsZWFycyBzb21lLiBBbmQgaW4gdGhp
cyBmdW5jdGlvbiBpdCdzCmp1c3QgcmVkdW5kYW50LiBaRiBpcyBzZXQgYnkgVk1mYWlsVmFsaWQu
IFNvIEkgdGhpbmsgdGhlIGRlc2NyaXB0aW9uIG11c3QgYmUKY2hhbmdlZC4KCi0tClNlcmdleQoK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IENDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5j
b20+Cj4gQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KPiBDQzogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZt
L3ZteC92dm14LmMKPiBpbmRleCA0MWM0ZTJmLi5hNzJiNTE5IDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
Ywo+IEBAIC0xMzcxLDcgKzEzNzEsNiBAQCBzdGF0aWMgdm9pZCB2aXJ0dWFsX3ZtZXhpdChzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgICAgICAgICBudm14X3VwZGF0ZV9hcGljdih2KTsK
PiAgCj4gICAgICBudmNwdS0+bnZfdm1zd2l0Y2hfaW5fcHJvZ3Jlc3MgPSAwOwo+IC0gICAgdm1z
dWNjZWVkKHJlZ3MpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBudm14X2VwdHBfdXBkYXRlKHZv
aWQpCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
