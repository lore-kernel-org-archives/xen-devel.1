From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC 2/3] automation: build stubdom and
 rombios, and tools on 32 bit
Date: Fri, 6 Jul 2018 15:28:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807061526220.13502@sstabellini-ThinkPad-X260>
References: <20180523102040.16299-1-wei.liu2@citrix.com>
 <20180523102040.16299-3-wei.liu2@citrix.com>
 <13b83460-a84b-0888-0261-2c7bb5085594@cardoe.com>
 <20180529232824.pd56wtwl5idqjubm@citrix.com>
 <20180706185243.ayme7uxq7axkr2ei@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mm3z=jw=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fbZCv-0005Jk-Tr
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 22:28:05 +0000
In-Reply-To: <20180706185243.ayme7uxq7axkr2ei@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCA2IEp1bCAyMDE4LCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPiBPbiBXZWQsIE1heSAz
MCwgMjAxOCBhdCAxMjoyODoyNEFNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVHVlLCBN
YXkgMjksIDIwMTggYXQgMTI6MTg6NDBBTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4g
PiA+IE9uIDUvMjMvMTggNToyMCBBTSwgV2VpIExpdSB3cm90ZToKPiA+ID4gCj4gPiA+ID4gIAo+
ID4gPiA+ICAjIFNlYUJJT1MgY2Fubm90IGJlIGJ1aWx0IHdpdGggY2xhbmcKPiA+ID4gPiBAQCAt
MjAsMTIgKzE4LDYgQEAgaWYgW1sgIiR7Q0N9IiA9PSAiY2xhbmciIF1dOyB0aGVuCj4gPiA+ID4g
ICAgICBjZmdhcmdzKz0oIi0td2l0aC1zeXN0ZW0tc2VhYmlvcz0vdXNyL3NoYXJlL3NlYWJpb3Mv
Ymlvcy5iaW4iKQo+ID4gPiA+ICBmaQo+ID4gPiA+ICAKPiA+ID4gPiAtaWYgW1sgIiR7WEVOX1RB
UkdFVF9BUkNIfSIgPT0gIng4Nl82NCIgXV07IHRoZW4KPiA+ID4gPiAtICAgIGNmZ2FyZ3MrPSgi
LS1lbmFibGUtdG9vbHMiKQo+ID4gPiA+IC1lbHNlCj4gPiA+ID4gLSAgICBjZmdhcmdzKz0oIi0t
ZGlzYWJsZS10b29scyIpICMgd2UgZG9uJ3QgaGF2ZSB0aGUgY3Jvc3MgZGVwZW5kcyBpbnN0YWxs
ZWQKPiA+ID4gPiAtZmkKPiA+ID4gPiAtCj4gPiA+IAo+ID4gPiBUaGlzIHN0aWxsIGhvcnJpYmx5
IGZhaWxzIHdoZW4gdGFyZ2V0aW5nIGFybSBiZWNhdXNlIHdlIGhhdmUgdG8gYWN0dWFsbHkKPiA+
ID4gZXhlY3V0ZSBhIGNvbXBpbGVkIGJpbmFyeSBvbiB0aGUgaG9zdC4gVGhlIHRvb2xzIGJ1aWxk
IHN5c3RlbSBkb2Vzbid0Cj4gPiA+IHNlZW0gdG8gY29tcHJlaGVuZCBob3N0ICE9IHRhcmdldC4K
PiA+ID4gCj4gPiAKPiA+IE9LLiBMZXQncyBvbmx5IGVuYWJsZSB0b29scyBidWlsZCBmb3IgeDg2
IGZvciBub3cuCj4gPiAKPiA+ID4gQSBmZXcgcGVvcGxlIGhhdmUgc3RlcHBlZCBmb3J3YXJkIHdp
dGggaWRlYXMgYW5kIHNhaWQgdGhleSdkIHRha2UgcG9pbnQKPiA+ID4gb24gdGhlIHBhdGNoZXMg
YnV0IEkgaGF2ZW4ndCBzZWVuIGFueXRoaW5nIGxhbmQgeWV0Lgo+ID4gPiAKPiA+IAo+ID4gQW55
IHJlZmVyZW5jZT8KPiA+IAo+ID4gV2VpLgo+IAo+IFN0ZWZhbm8gb3JpZ2luYWxseSBvZmZlcmVk
IEkgYmVsaWV2ZS4gSGUgYWxzbyBvZmZlcmVkIHRvIGhlbHAgd2l0aCBzb21lCj4gb2YgdGhlIGJp
dHMgYWdhaW4gYXQgdGhlIFN1bW1pdC4gCgpZZXMsIGNvbnRhaW5lcml6ZWQgYnVpbGRzIGFuZCBz
dHViZG9tcyBzdXBwb3J0IGFyZSBvbiB0aGUgVmlyeWFPUwpyb2FkbWFwIChhcyBtZW50aW9uZWQg
aW4gbXkgdGFsaykuIFdlIGFyZSBub3QgdGhlcmUgeWV0LCBidXQgd2Ugc2hvdWxkCmhhdmUgc29t
ZXRoaW5nIHRvIHNoYXJlIGJ5IHRoZSBlbmQgb2YgdGhlIHllYXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
