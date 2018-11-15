From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 15:13:07 +0100
Message-ID: <20181115141307.GH26448__12542.3762867742$1542291121$gmane$org@zn.tnic>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
 <20181115111023.GC26448@zn.tnic>
 <4aa5d39d-a923-87de-d646-70b9cbfe62f0@redhat.com>
 <20181115115213.GE26448@zn.tnic>
 <20181115121102.GP23831@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyhb=n2=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gNIOM-0000MV-Kr
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 14:13:10 +0000
Content-Disposition: inline
In-Reply-To: <20181115121102.GP23831@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDE6MTE6MDJQTSArMDEwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IEkgYW0gbm90IGZhbWlsaWFyIHdpdGgga2V4ZWMgdG8ganVkZ2UgdGhpcyBwYXJ0aWN1
bGFyIHBhdGNoIGJ1dCB3ZQo+IGNhbm5vdCBzaW1wbHkgZGVmaW5lIGFueSByYW5nZSBmb3IgdGhl
c2UgcGFnZXMgKHNhbWUgYXMgZm9yIGh3cG9pc29uCj4gb25lcykgYmVjYXVzZSB0aGV5IGNhbiBi
ZSBhbG1vc3QgYW55d2hlcmUgaW4gdGhlIGF2YWlsYWJsZSBtZW1vcnkgcmFuZ2UuCj4gVGhlbiB0
aGVyZSBjYW4gYmUgY291bnRsZXNzIG9mIHRoZW0uIFRoZXJlIGlzIG5vIG90aGVyIHdheSB0byBy
dWxlIHRoZW0KPiBvdXQgYnV0IHRvIGNoZWNrIHRoZSBwYWdlIHN0YXRlLgoKSSBndWVzcywgZXNw
ZWNpYWxseSBpZiBpdCBpcyBhIG1vbnN0ZXIgYm94IHdpdGggYSBsb3Qgb2YgbWVtb3J5IGluIGl0
LgoKPiBJIGFtIG5vdCByZWFsbHkgc3VyZSB3aGF0IGlzIHRoZSBjb25jZXJuIGhlcmUgZXhhY3Rs
eS4gS2R1bXAgaXMgc28KPiBjbG9zbHkgdGlnaHQgdG8gdGhlIHNwZWNpZmljIGtlcm5lbCB2ZXJz
aW9uIHRoYXQgdGhlIGFwaSBleHBvcnRlZAo+IHNwZWNpZmljYWxseSBmb3IgaXRzIHB1cnBvc2Ug
Y2Fubm90IGJlIHNlcmlvdXNseSBjb25zaWRlcmVkIGFuIEFCSS4KPiBLZHVtcCBoYXMgdG8gYWRv
cHQgYWxsIHRoZSB0aW1lLgoKUmlnaHQuLi4KCkV4Y2VwdCwgd2hlbiBwZW9wbGUgc3RhcnQgb2ds
aW5nIHZtY29yZWluZm8gZm9yIG90aGVyIHRoaW5ncyBhbmQgc3RhcnQKZXhwb3J0aW5nIGFsbCBr
aW5kcyBvZiBrZXJuZWwgaW50ZXJuYWxzIGluIHRoZXJlLCBteSBhbGFybSBiZWxscyBzdGFydApy
aW5naW5nLgoKQnV0IG9rLCBrZHVtcCAqaXMqIHNwZWNpYWwgYW5kIEkgZ3Vlc3MgdGhhdCdzIGZp
bmUuCgotLSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoKR29vZCBtYWlsaW5nIHByYWN0aWNl
cyBmb3IgNDAwOiBhdm9pZCB0b3AtcG9zdGluZyBhbmQgdHJpbSB0aGUgcmVwbHkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
