From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 01/55] x86/mm: defer clearing page in
 virt_to_xen_lXe
Date: Fri, 15 Mar 2019 08:38:38 -0600
Message-ID: <5C8BB8EE020000780021F594@prv1-mh.provo.novell.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4nyt-0005mA-Th
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 14:38:43 +0000
In-Reply-To: <20190207164456.9260-2-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC00
NzUyLDEzICs0NzUyLDEzIEBAIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wzZSh1
bnNpZ25lZCBsb25nIHYpCj4gIAo+ICAgICAgICAgIGlmICggIXBsM2UgKQo+ICAgICAgICAgICAg
ICByZXR1cm4gTlVMTDsKPiAtICAgICAgICBjbGVhcl9wYWdlKHBsM2UpOwo+ICAgICAgICAgIGlm
ICggbG9ja2luZyApCj4gICAgICAgICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwo+
ICAgICAgICAgIGlmICggIShsNGVfZ2V0X2ZsYWdzKCpwbDRlKSAmIF9QQUdFX1BSRVNFTlQpICkK
PiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIGw0X3BnZW50cnlfdCBsNGUgPSBsNGVfZnJvbV9w
YWRkcihfX3BhKHBsM2UpLCBfX1BBR0VfSFlQRVJWSVNPUik7Cj4gIAo+ICsgICAgICAgICAgICBj
bGVhcl9wYWdlKHBsM2UpOwoKSXMgdGhpcyByZWFsbHkgYW4gb3B0aW1pemF0aW9uPyBZb3UgdHJl
YXQgYXZvaWRpbmcgdG8gY2xlYXIgdGhlIHBhZ2UKaW4gYSBob3BlZnVsbHkgaW5mcmVxdWVudCBj
YXNlIG9mIGEgcmFjZSBmb3IgaG9sZGluZyB0aGUgc3BpbiBsb2NrCmZvciBxdWl0ZSBhIGJpdCBs
b25nZXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
