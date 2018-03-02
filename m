From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] x86/xpti: don't map stack guard pages
Date: Fri, 2 Mar 2018 16:43:09 +0100
Message-ID: <4a2caefc-4ad7-7e23-37aa-a500f118f879@suse.com>
References: <5A996DF202000078001ADD10@prv-mh.provo.novell.com>
 <5A996F3302000078001ADD40@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ermq2-0001UT-RC
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 15:43:14 +0000
In-Reply-To: <5A996F3302000078001ADD40@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTU6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE90aGVyIHRoYW4gZm9yIHRo
ZSBtYWluIG1hcHBpbmdzLCBkb24ndCBldmVuIGRvIHRoaXMgaW4gcmVsZWFzZSBidWlsZHMsCj4g
YXMgdGhlcmUgYXJlIG5vIGh1Z2UgcGFnZSBzaGF0dGVyaW5nIGNvbmNlcm5zIGhlcmUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IHYy
OiBOZXcuCj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMKPiBAQCAtNzk5LDcgKzc5OSw4IEBAIHN0YXRpYyBpbnQgc2V0dXBfY3B1
X3Jvb3RfcGd0KHVuc2lnbmVkIGkKPiAgCj4gICAgICAvKiBJbnN0YWxsIGRpcmVjdCBtYXAgcGFn
ZSB0YWJsZSBlbnRyaWVzIGZvciBzdGFjaywgSURULCBhbmQgVFNTLiAqLwo+ICAgICAgZm9yICgg
b2ZmID0gcmMgPSAwOyAhcmMgJiYgb2ZmIDwgU1RBQ0tfU0laRTsgb2ZmICs9IFBBR0VfU0laRSAp
Cj4gLSAgICAgICAgcmMgPSBjbG9uZV9tYXBwaW5nKF9fdmEoX19wYShzdGFja19iYXNlW2NwdV0p
KSArIG9mZiwgcnB0KTsKPiArICAgICAgICBpZiAoICFtZW1ndWFyZF9pc19zdGFja19ndWFyZF9w
YWdlKG9mZikgKQo+ICsgICAgICAgICAgICByYyA9IGNsb25lX21hcHBpbmcoX192YShfX3BhKHN0
YWNrX2Jhc2VbY3B1XSkpICsgb2ZmLCBycHQpOwo+ICAKPiAgICAgIGlmICggIXJjICkKPiAgICAg
ICAgICByYyA9IGNsb25lX21hcHBpbmcoaWR0X3RhYmxlc1tjcHVdLCBycHQpOwo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtNTU3Niw2ICs1
NTc2LDE0IEBAIHZvaWQgbWVtZ3VhcmRfdW5ndWFyZF9zdGFjayh2b2lkICpwKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTVEFDS19TSVpFIC0gUFJJTUFSWV9TVEFDS19TSVpFIC0gSVNU
X01BWCAqIFBBR0VfU0laRSk7Cj4gIH0KPiAgCj4gK2Jvb2wgbWVtZ3VhcmRfaXNfc3RhY2tfZ3Vh
cmRfcGFnZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4gK3sKPiArICAgIGFkZHIgJj0gU1RBQ0tfU0la
RSAtIDE7Cj4gKwo+ICsgICAgcmV0dXJuIGFkZHIgPj0gSVNUX01BWCAqIFBBR0VfU0laRSAmJgo+
ICsgICAgICAgICAgIGFkZHIgPCBTVEFDS19TSVpFIC0gUFJJTUFSWV9TVEFDS19TSVpFOwo+ICt9
Cj4gKwoKV2hhdCBhYm91dCBtYWtpbmcgdXNlIG9mIG1lbWd1YXJkX2lzX3N0YWNrX2d1YXJkX3Bh
Z2UoKSBpbgptZW1ndWFyZF9bdW5dZ3VhcmRfc3RhY2soKSA/IFRoaXMgd291bGQgYXQgb25jZSBl
bnN1cmUgdGhlIG90aGVyIHVudXNlZApwYWdlcyB3b24ndCBiZSBhY2Nlc3NlZCBhY2NpZGVudGFs
bHkgc29tZXdoZXJlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
