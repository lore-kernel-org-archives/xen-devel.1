From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11 v2] x86/EFI: further correct FPU
 state handling around runtime calls
Date: Tue, 26 Jun 2018 13:16:35 +0200
Message-ID: <7bee268d-0de3-f828-299d-a43e2b98a0c8@suse.com>
References: <5B30DD5A02000078001CD80E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6jkz=jm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fXlxf-0008SP-AZ
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 11:16:39 +0000
In-Reply-To: <5B30DD5A02000078001CD80E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDYvMTggMTQ6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlIG11c3Qgbm90IGxlYXZl
IGEgdkNQVSB3aXRoIENSMC5UUyBjbGVhciB3aGVuIGl0IGlzIG5vdCBpbiBmdWxseSBlYWdlcgo+
IG1vZGUgYW5kIGhhcyBub3QgdG91Y2hlZCBub24tbGF6eSBzdGF0ZS4gSW5zdGVhZCBvZiBhZGRp
bmcgYSAzcmQKPiBpbnZvY2F0aW9uIG9mIHN0dHMoKSB0byB2Y3B1X3Jlc3RvcmVfZnB1X2VhZ2Vy
KCksIGNvbnNvbGlkYXRlIGFsbCBvZgo+IHRoZW0gaW50byBhIHNpbmdsZSBvbmUgZG9uZSBhdCB0
aGUgZW5kIG9mIHRoZSBmdW5jdGlvbi4KPiAKPiBSZW5hbWUgdGhlIGZ1bmN0aW9uIGF0IHRoZSBz
YW1lIHRpbWUgdG8gYmV0dGVyIHJlZmxlY3QgaXRzIHB1cnBvc2UsIGFzCj4gdGhlIHBhdGNoZXMg
dG91Y2hlcyBhbGwgb2YgaXRzIG9jY3VyZW5jZXMgYW55d2F5Lgo+IAo+IFRoZSBuZXcgZnVuY3Rp
b24gcGFyYW1ldGVyIGlzIG5vdCByZWFsbHkgd2VsbCBuYW1lZCwgYnV0Cj4gIm5lZWRfc3R0c19p
Zl9ub3RfZnVsbHlfZWFnZXIiIHNlZW1lZCBleGNlc3NpdmUgdG8gbWUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
