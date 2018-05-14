From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 04/10] x86/spec_ctrl: Fold the XEN_IBRS_{SET,
 CLEAR} ALTERNATIVES together
Date: Mon, 14 May 2018 16:20:40 +0100
Message-ID: <20180514152040.5qhfrlfeifoagvmu@citrix.com>
References: <1526035094-14343-1-git-send-email-andrew.cooper3@citrix.com>
 <1526035094-14343-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1526035094-14343-5-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTE6Mzg6MDhBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDdXJyZW50bHksIHRoZSBTUEVDX0NUUkxfe0VOVFJZLEVYSVR9XyogbWFjcm9zIGVu
Y29kZSBYZW4ncyBjaG9pY2Ugb2YKPiBNU1JfU1BFQ19DVFJMIGFzIGFuIGltbWVkaWF0ZSBjb25z
dGFudCwgYW5kIGNob29zZXMgYmV0d2VlbiBJQlJTIG9yIG5vdCBieQo+IGRvdWJsaW5nIHVwIHRo
ZSBlbnRpcmUgYWx0ZXJuYXRpdmUgYmxvY2suCj4gCj4gVGhlcmUgaXMgbm93IGEgdmFyaWFibGUg
aG9sZGluZyBYZW4ncyBjaG9pY2Ugb2YgdmFsdWUsIHNvIHVzZSB0aGF0IGFuZAo+IHNpbXBsaWZ5
IHRoZSBhbHRlcm5hdGl2ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
