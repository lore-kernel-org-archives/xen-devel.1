From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 13/20] xen/arm32: mm: Avoid to zero and
 clean cache for CPU0 domheap
Date: Fri, 3 May 2019 18:57:31 +0300
Message-ID: <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-14-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaZ5-00078b-Nl
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:35 +0000
Received: by mail-lf1-x142.google.com with SMTP id h126so4763366lfh.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:34 -0700 (PDT)
In-Reply-To: <20190422164937.21350-14-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29uZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVh
YmlsaXR5IGFuZAo+IGNhY2hlYWJpbGl0eSBhcyB0aGUgYWNjZXNzIHBlcmZvcm1lZCB3aGVuIHVw
ZGF0aW5nIHRoZSBwYWdlLXRhYmxlcy4gVGhpcwo+IG1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBm
b3IgQ1BVMCBkb21oZWFwIGlzIHVubmVjZXNzYXJ5Lgo+IAo+IEZ1cnRoZXJtb3JlLCBDUFUwIHBh
Z2UtdGFibGVzIGFyZSBwYXJ0IG9mIFhlbiBiaW5hcnkgYW5kIHdpbGwgYWxyZWFkeSBiZQo+IHpl
cm9lZCBiZWZvcmVoYW5kLgoKSU1PIGl0IGlzIGEgYml0IGNvbmZ1c2luZy4KQXMgSSB1bmRlcnN0
YW5kLCBgY3B1MF9kb21tYXBgIHJlc2lkZXMgaW4gQlNTIHdoaWNoIGlzIG5vdCBhIHBhcnQgb2Yg
dGhlIGJpbmFyeSB1bmxpa2UgaW5pdGlhbGl6ZWQgZGF0YS4gWWV0IGl0IGlzIHVuY29uZGl0aW9u
YWxseSBjbGVhcmVkIGR1cmluZyB0aGUgYm9vdCBvbiBBUk0zMi4KCj4gIFNvIGl0IGlzIHBvaW50
bGVzcyB0byB6ZXJvIHRoZSBkb21oZWFwIGFnYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCgpUaG91Z2g6CgpSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
