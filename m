From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [VMI] How to add support for MOV-TO-DRx events ?
Date: Fri, 10 May 2019 02:29:49 -0600
Message-ID: <5CD5367D020000780022D6F4@prv1-mh.provo.novell.com>
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
 <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
 <5d1870c1-62f2-5939-82d1-01352542598f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP0uf-00046N-D1
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 08:29:53 +0000
In-Reply-To: <5d1870c1-62f2-5939-82d1-01352542598f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Mathieu Tarral <mathieu.tarral@protonmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDAwOjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSSB0aGluayB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgdG8gZG8gZmlyc3QgaXMgdG8g
dW5kZXJzdGFuZCBob3cgTU9WLURSCj4gZXZlbnRzIGFyZSBpbnRlbmRlZCB0byBiZSB1c2VkLCBh
bmQgd2hhdCBraW5kIG9mIGJlaGF2aW91ciB3ZSB3YW50LAo+IGdpdmVuIHRoYXQgdGhlIHR3byBj
YW4ndCBiZSBzaGFyZWQgaW4gcHJhY3RpY2UuCgpJIHRoaW5rIHRoZXkgY2FuIGJlIHNoYXJlZCwg
YnV0IGF0IGEgc2lnbmlmaWNhbnQgcHJpY2U6IFNpbmNlIERSbgpzcGVjaWZ5IGxpbmVhciBhZGRy
ZXNzZXMsIGF0IGxlYXN0IGluIHNoYWRvdyBtb2RlIHBhZ2VzIHdpdGgKZ3Vlc3Qgc3VwcGxpZWQg
YnJlYWtwb2ludHMgb24gdGhlbSBjb3VsZCBiZSB1bm1hcHBlZCwgc3VjaAp0aGF0IHdlIG5vdGlj
ZSBhY2Nlc3NlcyBhbmQgY2FuIHRoZW4gZW11bGF0ZSB0aGVtLiBCdXQgb2YKY291cnNlIHRoaXMs
IGFzIGFub3RoZXIgcHJlcmVxLCByZXF1aXJlcyBicmVha3BvaW50cyB0byBiZQpob25vcmVkIGlu
IHRoZSBmaXJzdCBwbGFjZSBieSBodm1lbXVsX3JlYWQoKSBhbmQgZnJpZW5kcy4KClNvIGZvciB0
aGUgdGltZSBiZWluZyBJIGFzc3VtZSB0aGUgdHdvIHVzZXMgYmVpbmcgZXhjbHVzaXZlIG9mCm9u
ZSBhbm90aGVyIGlzIHRoZSBvbmx5IHZpYWJsZSBvcHRpb24uIFF1ZXN0aW9uIGluIHRoaXMgY2Fz
ZSBpczoKV2hhdCBiZWhhdmlvciBpcyB0aGUgZ3Vlc3Qgc3VwcG9zZWQgdG8gb2JzZXJ2ZT8gRFJu
IHdyaXRlcwpzaW1wbHkgb25seSBnb2luZyB0byBhIHBsYWNlIHRvIGxhdGNoIHRoZSB3cml0dGVu
IHZhbHVlcyAoc3VjaAp0aGF0IHRoZSB3cml0dGVuIHZhbHVlcyBjYW4gYmUgc3VwcGxpZWQgYmFj
ayBmb3IgcmVhZHMpLCBhbmQKaGVuY2UgZ3Vlc3Qgc3BlY2lmaWVkIGJyZWFrcG9pbnRzIG5ldmVy
IHRyaWdnZXJpbmc/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
