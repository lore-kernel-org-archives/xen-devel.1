From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RESEND] compat-ioctl/Xen: support at least
 some IOCTLs of evtchn and privcmd
Date: Wed, 15 Aug 2018 07:16:43 -0600
Message-ID: <5B7427BB02000078001DE675@prv1-mh.provo.novell.com>
References: <5B30C6E202000078001CD724@prv1-mh.provo.novell.com>
 <5B73C5D402000078001DE189@prv1-mh.provo.novell.com>
 <20180815125114.GV6515@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e0/s=k6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fpvfN-000577-8X
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 13:16:49 +0000
In-Reply-To: <20180815125114.GV6515@ZenIV.linux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: viro@zeniv.linux.org.uk
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-fsdevel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA4LjE4IGF0IDE0OjUxLCA8dmlyb0BaZW5JVi5saW51eC5vcmcudWs+IHdyb3Rl
Ogo+IE9uIFdlZCwgQXVnIDE1LCAyMDE4IGF0IDEyOjE5OjAwQU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiBXaGlsZSB0aGlzIGlzIG9ubHkgYSBzdGFydCAoSU9DVExfUFJJVkNNRF9NTUFQ
KiBhbmQgSU9DVExfUFJJVkNNRF9ETV9PUAo+PiByZXF1aXJlIG1vcmUgd29yayksIGl0IGF0IGxl
YXN0IGFsbG93cyBzb21lIHNpbXBsZSBvcGVyYXRpb25zIChsaWtlCj4+ICJ4bCBkbWVzZyIpIHdo
aWNoIGhhdmUgYWx3YXlzIGJlZW4gYXZhaWxhYmxlIG9uIFhlbm9MaW51eCB0byB3b3JrIGFnYWlu
Cj4+IHdpdGggYSA2NC1iaXQga2VybmVsIHVuZGVybmVhdGggYSAzMi1iaXQgZGlzdHJvLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBBY2tl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IAo+IE5hY2tlZC1ieTog
QWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+Cj4gCj4gCVRoaXMgYmVsb25ncyBpbiBk
cml2ZXJzL3hlbi9wcml2Y21kLmMsIG5vdCBpbiBmcy9jb21wYXRfaW9jdGwuYwo+ICpBTlkqIHNp
bmdsZS1kcml2ZXIgaW9jdGwgZGVmaW5pdGVseSBzaG91bGQgYmUgaGFuZGxlZCBieSAtPmNvbXBh
dF9pb2N0bCgpCj4gbWV0aG9kIGFuZCBhbnkgcGF0Y2hlcyBkdW1waW5nIHN1Y2ggc3R1ZmYgaW50
byBmcy9jb21wYXRfaW9jdGwuYyB3aWxsIGJlCj4gcmVqZWN0ZWQuCgpPa2F5LCBJJ2xsIHNlZSBh
Ym91dCBkb2luZyB0aGlzOyBJIGhhdmUgdG8gYWRtaXQgSSB3YXMgdW5hd2FyZSBvZgotPmNvbXBh
dF9pb2N0bCgpJ3MgZXhpc3RlbmNlLiBJdCB3b3VsZCBiZSByYXRoZXIgaGVscGZ1bCBpZiB0aGUg
aGVhZGVyCm9mIGNvbXBhdF9pb2N0bC5jIGluZGljYXRlZCB3aGF0IHlvdSBzYXkuIFdpdGhvdXQg
dGhhdCwgSSd2ZSBzaW1wbHkKZ29uZSBieSB0aGUgb2JzZXJ2YXRpb24gdGhhdCB0aGVyZSBhcmUg
dGhpbmdzIGluIHRoZSBmaWxlIHdoaWNoCmFjY29yZGluZyB0byB3aGF0IHlvdSBzYXkgc2hvdWxk
bid0IGJlIHRoZXJlLCBhbmQgSSd2ZSB0aGVuIHdyb25nbHkKaW1wbGllZCBhZGRpbmcgdGhlIFhl
biBzdHVmZiBoZXJlIHdvdWxkIGJlIGZpbmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
