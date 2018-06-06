From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 02/11] x86/vmx: Don't clobber %dr6 while
 debugging state is lazy
Date: Wed, 6 Jun 2018 12:16:29 +0200
Message-ID: <20180606101629.tjliwedxfq75vfwb@MacBook-Pro-de-Roger.local>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMDQsIDIwMTggYXQgMDI6NTk6MDZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgNGYzNjQ1MmI2MyBpbnRyb2R1Y2VkIGEgd3JpdGUgdG8gJWRyNiBpbiB0aGUg
I0RCIGludGVyY2VwdCBjYXNlLCBidXQgdGhlCj4gZ3Vlc3RzIGRlYnVnIHJlZ2lzdGVycyBtYXkg
YmUgbGF6eSBhdCB0aGlzIHBvaW50LCBhdCB3aGljaCBwb2ludCB0aGUgZ3Vlc3RzCj4gbGF0ZXIg
YXR0ZW1wdCB0byByZWFkICVkcjYgd2lsbCBkaXNjYXJkIHRoaXMgdmFsdWUgYW5kIHVzZSB0aGUg
b2xkZXIgc3RhbGUKPiB2YWx1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogSnVuIE5ha2FqaW1hIDxq
dW4ubmFrYWppbWFAaW50ZWwuY29tPgo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9o
dm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiBpbmRleCAzM2QzOWY2
Li44ZGJlODM4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiBAQCAtMzY5Niw2ICszNjk2LDcgQEAgdm9p
ZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gICAgICAg
ICAgICAgICAqLwo+ICAgICAgICAgICAgICBfX3ZtcmVhZChFWElUX1FVQUxJRklDQVRJT04sICZl
eGl0X3F1YWxpZmljYXRpb24pOwo+ICAgICAgICAgICAgICBIVk1UUkFDRV8xRChUUkFQX0RFQlVH
LCBleGl0X3F1YWxpZmljYXRpb24pOwo+ICsgICAgICAgICAgICBfX3Jlc3RvcmVfZGVidWdfcmVn
aXN0ZXJzKHYpOwoKSWYgSSB1bmRlcnN0b29kIHRoaXMgY29ycmVjdGx5LCB5b3Ugb25seSBjYWxs
Cl9fcmVzdG9yZV9kZWJ1Z19yZWdpc3RlcnMgaW4gb3JkZXIgdG8gbWFrZSBzdXJlIHRoZSBEUiBy
ZWdpc3RlcnMgYXJlCm1hcmtlZCBhcyBkaXJ0eT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
