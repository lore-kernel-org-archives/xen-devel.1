From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] idle/x86: remove the call to
 boot_init_stack_canary() from cpu_startup_entry()
Date: Fri, 19 Oct 2018 12:01:58 +0200
Message-ID: <b9727c41-8278-7b83-e5e1-61268dc768d5@suse.com>
References: <f1b058d6a73cfb68b36dc755df5aaa7a064875b1.1539935852.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+uyp=m7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gDRbW-0006Kt-FP
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 10:02:02 +0000
In-Reply-To: <f1b058d6a73cfb68b36dc755df5aaa7a064875b1.1539935852.git.christophe.leroy@c-s.fr>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMjAxOCAxMToyOSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiBjb21taXQgZDc4
ODA4MTJiMzU5ICgiaWRsZTogQWRkIHRoZSBzdGFjayBjYW5hcnkgaW5pdCB0bwo+IGNwdV9zdGFy
dHVwX2VudHJ5KCkiKSBhZGRlZCB0aGUgY2FsbCB0byBib290X2luaXRfc3RhY2tfY2FuYXJ5KCkK
PiBpbiBjcHVfc3RhcnR1cF9lbnRyeSgpIGluIGFuICNpZmRlZiBDT05GSUdfWDg2IHN0YXRlbWVu
dCwgd2l0aAo+IHRoZSBpbnRlbnRpb24gdG8gcmVtb3ZlIHRoYXQgI2lmZGVmIGxhdGVyLgo+IAo+
IFdoaWxlIGltcGxlbWVudGluZyBzdGFjayBwcm90ZWN0b3IgZm9yIHBvd2VycGMsIGl0IGhhcyBi
ZWVuCj4gb2JzZXJ2ZWQgdGhhdCBjYWxsaW5nIGJvb3RfaW5pdF9zdGFja19jYW5hcnkoKSBpcyBh
bHNvIG5lZWRlZAo+IGZvciBwb3dlcnBjIHdoaWNoIHVzZXMgcGVyIHRhc2sgKFRMUykgc3RhY2sg
Y2FuYXJ5IGxpa2UgdGhlIFg4Ni4KPiAKPiBIb3dldmVyLCBjYWxsaW5nIGJvb3RfaW5pdF9zdGFj
a19jYW5hcnkoKSB3b3VsZCBicmVhayBhcmNoZXMKPiB1c2luZyBnbG9iYWwgc3RhY2sgY2FuYXJ5
IChBUk0sIFNILCBNSVBTIGFuZCBYVEVOU0EpLgo+IAo+IEluc3RlYWQgb2YgYWRkaW5nIG1vZGlm
eWluZyB0aGUgI2lmZGVmIGluIGEKPiBpbXBsZW1lbnRlZCB0aGUgY2FsbCB0byBib290X2luaXRf
c3RhY2tfY2FuYXJ5KCkgaW4gdGhlIGZ1bmN0aW9uCj4gY2FsbGluZyBjcHVfc3RhcnR1cF9lbnRy
eSgpCgpJIGNhbid0IHBhcnNlIHRoaXMgc2VudGVuY2UuCgo+IAo+IE9uIHg4Niwgd2UgaGF2ZSB0
d28gZnVuY3Rpb25zIGNhbGxpbmcgY3B1X3N0YXJ0dXBfZW50cnkoKToKPiAtIHN0YXJ0X3NlY29u
ZGFyeSgpCj4gLSBjcHVfYnJpbmd1cF9hbmRfaWRsZSgpCj4gCj4gc3RhcnRfc2Vjb25kYXJ5KCkg
YWxyZWFkeSBjYWxscyBib290X2luaXRfc3RhY2tfY2FuYXJ5KCkuCj4gCj4gVGhpcyBwYXRjaCBh
ZGRzIHRoZSBjYWxsIHRvIGJvb3RfaW5pdF9zdGFja19jYW5hcnkoKSBpbgo+IGNwdV9icmluZ3Vw
X2FuZF9pZGxlKCkgYW5kIHJlbW92ZXMgaXQgZnJvbSBjcHVfc3RhcnR1cF9lbnRyeSgpCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+
CgpXaXRoIHRoZSBjb21taXQgbWVzc2FnZSBtYWRlIHVuZGVyc3RhbmRhYmxlIHlvdSBjYW4gYWRk
IG15CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
