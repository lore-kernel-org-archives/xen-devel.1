From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Tue, 17 Apr 2018 09:16:41 +0200
Message-ID: <e63f261b-9ef3-5750-20df-555291a8a0d8__5683.49609752676$1523949352$gmane$org@suse.com>
References: <20180413221146.28476-1-labbott@redhat.com>
 <7cf66c00-74c2-62bb-81f5-4332313a5a6e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8Kr8-0000sh-1w
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 07:16:46 +0000
In-Reply-To: <7cf66c00-74c2-62bb-81f5-4332313a5a6e@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Laura Abbott <labbott@redhat.com>
Cc: kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDQvMTggMTU6MjcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNC8xMy8yMDE4
IDA2OjExIFBNLCBMYXVyYSBBYmJvdHQgd3JvdGU6Cj4+IFRoZXJlJ3MgYW4gb25nb2luZyBlZmZv
cnQgdG8gcmVtb3ZlIFZMQXNbMV0gZnJvbSB0aGUga2VybmVsIHRvIGV2ZW50dWFsbHkKPj4gdHVy
biBvbiAtV3ZsYS4gVGhlIGZldyBWTEFzIGluIHVzZSBoYXZlIGFuIHVwcGVyIGJvdW5kIGJhc2Vk
IG9uIGEgc2l6ZQo+PiBvZiA2NEsuIFRoaXMgZG9lc24ndCBwcm9kdWNlIGFuIGV4Y2Vzc2l2ZWx5
IGxhcmdlIHN0YWNrIHNvIGp1c3Qgc3dpdGNoCj4+IHRoZSB1cHBlciBib3VuZC4KPj4KPj4gWzFd
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzMvNy82MjEKPj4KPj4gU2lnbmVkLW9mZi1ieTog
TGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jIHwgNiArKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPj4gaW5kZXggYzM2ZDIz
YWE2YzM1Li5kOTZhNWE1MzVjYmIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW5fcHYuYwo+PiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPj4gQEAgLTQyMSw4
ICs0MjEsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fbG9hZF9nZHQoY29uc3Qgc3RydWN0IGRlc2NfcHRy
ICpkdHIpCj4+ICB7Cj4+ICAJdW5zaWduZWQgbG9uZyB2YSA9IGR0ci0+YWRkcmVzczsKPj4gIAl1
bnNpZ25lZCBpbnQgc2l6ZSA9IGR0ci0+c2l6ZSArIDE7Cj4+IC0JdW5zaWduZWQgcGFnZXMgPSBE
SVZfUk9VTkRfVVAoc2l6ZSwgUEFHRV9TSVpFKTsKPiAKPiAKPiAKPiBJc24ndCBkdHItPnNpemUg
YWx3YXlzIGVpdGhlciBHRFRfU0laRSBvciAwPwoKR0RUX1NJWkUgLSAxIDotKQoKPj4gLQl1bnNp
Z25lZCBsb25nIGZyYW1lc1twYWdlc107Cj4+ICsJdW5zaWduZWQgbG9uZyBmcmFtZXNbRElWX1JP
VU5EX1VQKFNaXzY0SywgUEFHRV9TSVpFKV07CgpTbyB3ZSBjb3VsZCBqdXN0IGdvIHdpdGggb25l
IGZyYW1lIGFuZCBtb2RpZnkgdGhlIEJVR19PTigpIGZ1cnRoZXIgYmVsb3cKYWNjb3JkaW5nbHku
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
