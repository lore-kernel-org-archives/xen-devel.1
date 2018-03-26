From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 19/20] xen/domain: Call arch_domain_create()
 as early as possible in domain_create()
Date: Mon, 26 Mar 2018 09:58:03 -0600
Message-ID: <5AB934AB02000078001B634F@prv1-mh.provo.novell.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-20-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-20-git-send-email-andrew.cooper3@citrix.com>
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
Cc: JulienGrall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE4IGF0IDIwOjEzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0byBzZXQgdXAgZC0+bWF4X2NwdXMgYW5kIGQt
PnZjcHVbXSBpbgo+IGFyY2hfZG9tYWluX2NyZWF0ZSgpLCBhbmQgYWxsb3cgbGF0ZXIgcGFydHMg
b2YgZG9tYWluIGNvbnN0cnVjdGlvbiB0byBoYXZlCj4gYWNjZXNzIHRvIHRoZSB2YWx1ZXMuCgpJ
J20gbm90IGNvbnZpbmNlZCBvZiB0aGUgYWxsb2NhdGlvbiB0byBiZSBkb25lIGluIGFyY2hfZG9t
YWluX2NyZWF0ZSgpCihpbiB0aGUgbmV4dCBwYXRjaCksIGFuZCBoZW5jZSBJJ20gbm90IHN1cmUg
d2UgbmVlZCB3aGF0IHlvdSBkbyBoZXJlLgpJIGNhbiBzZWUgdGhhdCB5b3Ugd2FudCBhcmNoIGNv
ZGUgdG8gYXVkaXQgdGhlIHZDUFUgY291bnQsIGJ1dCB3aHkKZG9lcyBhcmNoIGNvZGUgbmVlZCB0
byBzZXQgdXAgdGhlIGFycmF5IGFuZCBzdG9yZSAtPm1heF92Y3B1cz8gWW91CmNvdWxkIHNpbXBs
eSBjYWxsIGEgcGVyLWFyY2ggYXVkaXRpbmcgZnVuY3Rpb24gZWFybHkgKGV2ZW4gdGhlIGxvd2Vy
CmJvdW5kIGNoZWNrIGNvdWxkIGJlIGRvbmUgaW4gY29tbW9uIGNvZGUpLCBzZXQgdXAgYm90aCBm
aWVsZHMgZWFybHkgaW4KZG9tYWluX2NyZWF0ZSgpLCBhbmQgbGVhdmUgdGhlIGNhbGwgdG8gYXJj
aF9kb21haW5fY3JlYXRlKCkgd2hlcmUgaXQgaXMKbm93LCBjb3VsZG4ndCB5b3U/IEFzIHRoZSBB
Uk0gYXVkaXRpbmcgbWF5IG5lZWQgdG8gZG8gbW9yZSB0aGFuIGp1c3QKYXVkaXRpbmcgKHRvIHNl
bGVjdCB0aGUgdkdJQyB2YXJpYW50KSwgcGVyaGFwcyB0aGlzIGNvdWxkIGJlCmFyY2hfZG9tYWlu
X2NvbmZpZ3VyZSgpLCBkb2luZyB0aGUgYXVkaXRpbmcgYW5kIGFsbCBuZWNlc3Nhcnkgc2V0dXAK
bmVlZGVkIGZvciB0aGUgYXVkaXRpbmcgdG8gYmUgcG9zc2libGUuCgpKYW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
