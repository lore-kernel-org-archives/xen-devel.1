From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 05/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Thu, 25 Jan 2018 07:36:49 -0700
Message-ID: <5A69F99102000078001A2685@prv-mh.provo.novell.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-6-git-send-email-andrew.cooper3@citrix.com>
 <5A69E4CA02000078001A25D4@prv-mh.provo.novell.com>
 <7b4f1324-d60b-8fba-35dc-8f6db949b5df@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7b4f1324-d60b-8fba-35dc-8f6db949b5df@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE4IGF0IDE1OjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDEvMTggMTM6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJdCBtYXkgYWxz
byBiZSB3b3J0aHdoaWxlIGFnYWluIHRvIHB1bGwgdXAgdGhlIHplcm9pbmcgb2YgJWVkeCwKPj4g
dXNpbmcgJWRsIGluc3RlYWQgb2YgJDAgaW4gdGhlIG1vdmIgKGFuZCBtYXliZSB0aGVuIGFsc28K
Pj4gc2ltaWxhcmx5IGluIERPX1NQRUNfQ1RSTF9FWElUX1RPX1hFTiwgYnV0IHRoZXJlIEknbSBs
ZXNzCj4+IGNlcnRhaW4gaXQgY291bGRuJ3QgaGF2ZSBhIG5lZ2F0aXZlIGVmZmVjdCkuCj4gCj4g
V2hhdCBuZWdhdGl2ZSBlZmZlY3RzIGFyZSB5b3Ugd29ycmllZCBhYm91dD8gIFRoZXNlIG1hY3Jv
cyBhcmUgc2VsZgo+IGNvbnRhaW5lZC4KClRoZSByZXN1bHQgb2YgdGhlIHhvciB0aGVuIGlzIGFu
IGlucHV0IHRvIHRoZSBjbXAsIHdoaWNoIG1heSBiZQpvbmUgY3ljbGUgbW9yZSBsYXRlbmN5IHRo
YW4gd2l0aCB0aGUgaW1tZWRpYXRlIHplcm8uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
