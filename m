From: Christophe LEROY <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] idle/x86: remove the call to
 boot_init_stack_canary() from cpu_startup_entry()
Date: Fri, 19 Oct 2018 12:33:03 +0200
Message-ID: <be4bccb4-9573-360d-5c49-d0bf1a3ecf70__28868.6073422015$1539945118$gmane$org@c-s.fr>
References: <f1b058d6a73cfb68b36dc755df5aaa7a064875b1.1539935852.git.christophe.leroy@c-s.fr>
 <b9727c41-8278-7b83-e5e1-61268dc768d5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jbyp=m7=c-s.fr=christophe.leroy@srs-us1.protection.inumbo.net>)
 id 1gDS5b-0000No-11
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 10:33:07 +0000
In-Reply-To: <b9727c41-8278-7b83-e5e1-61268dc768d5@suse.com>
Content-Language: fr
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
List-Id: xen-devel@lists.xenproject.org

CgpMZSAxOS8xMC8yMDE4IMOgIDEyOjAxLCBKdWVyZ2VuIEdyb3NzIGEgw6ljcml0wqA6Cj4gT24g
MTkvMTAvMjAxOCAxMToyOSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4gY29tbWl0IGQ3ODgw
ODEyYjM1OSAoImlkbGU6IEFkZCB0aGUgc3RhY2sgY2FuYXJ5IGluaXQgdG8KPj4gY3B1X3N0YXJ0
dXBfZW50cnkoKSIpIGFkZGVkIHRoZSBjYWxsIHRvIGJvb3RfaW5pdF9zdGFja19jYW5hcnkoKQo+
PiBpbiBjcHVfc3RhcnR1cF9lbnRyeSgpIGluIGFuICNpZmRlZiBDT05GSUdfWDg2IHN0YXRlbWVu
dCwgd2l0aAo+PiB0aGUgaW50ZW50aW9uIHRvIHJlbW92ZSB0aGF0ICNpZmRlZiBsYXRlci4KPj4K
Pj4gV2hpbGUgaW1wbGVtZW50aW5nIHN0YWNrIHByb3RlY3RvciBmb3IgcG93ZXJwYywgaXQgaGFz
IGJlZW4KPj4gb2JzZXJ2ZWQgdGhhdCBjYWxsaW5nIGJvb3RfaW5pdF9zdGFja19jYW5hcnkoKSBp
cyBhbHNvIG5lZWRlZAo+PiBmb3IgcG93ZXJwYyB3aGljaCB1c2VzIHBlciB0YXNrIChUTFMpIHN0
YWNrIGNhbmFyeSBsaWtlIHRoZSBYODYuCj4+Cj4+IEhvd2V2ZXIsIGNhbGxpbmcgYm9vdF9pbml0
X3N0YWNrX2NhbmFyeSgpIHdvdWxkIGJyZWFrIGFyY2hlcwo+PiB1c2luZyBnbG9iYWwgc3RhY2sg
Y2FuYXJ5IChBUk0sIFNILCBNSVBTIGFuZCBYVEVOU0EpLgo+Pgo+PiBJbnN0ZWFkIG9mIGFkZGlu
ZyBtb2RpZnlpbmcgdGhlICNpZmRlZiBpbiBhCj4+IGltcGxlbWVudGVkIHRoZSBjYWxsIHRvIGJv
b3RfaW5pdF9zdGFja19jYW5hcnkoKSBpbiB0aGUgZnVuY3Rpb24KPj4gY2FsbGluZyBjcHVfc3Rh
cnR1cF9lbnRyeSgpCj4gCj4gSSBjYW4ndCBwYXJzZSB0aGlzIHNlbnRlbmNlLgoKT29wcywgZ2l0
IGNvbW1pdCB0b29rIHRoZSAjaWYgZm9yIGEgY29tbWVudCBhbmQgZHJvcGVkIGl0LiBGaXhlZCBp
biB2Mi4KCj4gCj4+Cj4+IE9uIHg4Niwgd2UgaGF2ZSB0d28gZnVuY3Rpb25zIGNhbGxpbmcgY3B1
X3N0YXJ0dXBfZW50cnkoKToKPj4gLSBzdGFydF9zZWNvbmRhcnkoKQo+PiAtIGNwdV9icmluZ3Vw
X2FuZF9pZGxlKCkKPj4KPj4gc3RhcnRfc2Vjb25kYXJ5KCkgYWxyZWFkeSBjYWxscyBib290X2lu
aXRfc3RhY2tfY2FuYXJ5KCkuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgY2FsbCB0byBib290
X2luaXRfc3RhY2tfY2FuYXJ5KCkgaW4KPj4gY3B1X2JyaW5ndXBfYW5kX2lkbGUoKSBhbmQgcmVt
b3ZlcyBpdCBmcm9tIGNwdV9zdGFydHVwX2VudHJ5KCkKPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+Cj4gCj4gV2l0aCB0aGUgY29t
bWl0IG1lc3NhZ2UgbWFkZSB1bmRlcnN0YW5kYWJsZSB5b3UgY2FuIGFkZCBteQo+IAo+IFJldmll
d2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCgpUaGFua3MKQ2hyaXN0
b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
