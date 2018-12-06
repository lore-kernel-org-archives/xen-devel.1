From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 6 Dec 2018 23:49:00 +0100
Message-ID: <e76da394-c721-87ae-c721-1f6efdc93a50__35976.4737230309$1544136482$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <3b4fdddd-67d8-30d3-2a5d-c4d07b6f31c9@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NSIP=OP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gV2SH-0001MZ-Ik
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:49:13 +0000
In-Reply-To: <3b4fdddd-67d8-30d3-2a5d-c4d07b6f31c9@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMTggMjM6MzQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMi82LzE4IDU6
MTEgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+IE9uIDA2LzEyLzE4IDA3OjA0LCBNYXJhbiBX
aWxzb24gd3JvdGU6Cj4+PiArY29uZmlnIFBWSAo+Pj4gKwlib29sICJTdXBwb3J0IGZvciBydW5u
aW5nIFBWSCBndWVzdHMiCj4+PiArCS0tLWhlbHAtLS0KPj4+ICsJICBUaGlzIG9wdGlvbiBlbmFi
bGVzIHRoZSBQVkggZW50cnkgcG9pbnQgZm9yIGd1ZXN0IHZpcnR1YWwgbWFjaGluZXMKPj4+ICsJ
ICBhcyBzcGVjaWZpZWQgaW4gdGhlIHg4Ni9IVk0gZGlyZWN0IGJvb3QgQUJJLgo+Pj4gKwo+PiBJ
SVVDIHRoaXMgYnJlYWtzICJub3JtYWwiIGJ6SW1hZ2UgYm9vdCwgc28gd2Ugc2hvdWxkIGhhdmUg
c29tZXRoaW5nIGxpa2UKPj4KPj4gCVRoZSByZXN1bHRpbmcga2VybmVsIHdpbGwgbm90IGJvb3Qg
d2l0aCBtb3N0IHg4NiBib290IGxvYWRlcnMKPj4gCXN1Y2ggYXMgR1JVQiAKPiAKPiAKPiBHcnVi
IHN1cHBvcnQgZm9yIFBWSCBndWVzdHMgKGZvciBYZW4pIGlzIHdlbGwgdW5kZXIgd2F5LgoKT2gs
IG5pY2UuIDopCgo+PiBvciBTWVNMSU5VWC4gIFVubGVzcyB5b3UgcGxhbiB0byBzdGFydCB0aGUg
a2VybmVsCj4+IAl1c2luZyBRRU1VIG9yIFhlbiwgeW91IHByb2JhYmx5IHdhbnQgdG8gc2F5IE4g
aGVyZS4KPiAKPiBJIHRoaW5rIFBWSCBzaG91bGQgbm90IGJlIHVzZXItc2VsZWN0YWJsZSBhdCBh
bGwuIEl0IHNob3VsZCBiZSBzZWxlY3RlZAo+IGJ5IGVpdGhlciBYRU5fUFZIIG9yIEtWTV9HVUVT
VF9QVkggKHdoaWNoIHlvdSBzdWdnZXN0ZWQgdG8gZHJvcCkuCgpLVk1fR1VFU1RfUFZIIGlzIG5v
dCBlbnRpcmVseSBhY2N1cmF0ZSBiZWNhdXNlIGl0J3Mgbm90IGp1c3QgZm9yIEtWTSAoaXQKY2Fu
IGJlIHVzZWQgd2l0aCBRRU1VIGFuZCBBcHBsZSdzIEh5cGVydmlzb3IuZnJhbWV3b3JrIGZvciBl
eGFtcGxlKS4KCkl0J3MgYWxzbyBub3QgbmVjZXNzYXJpbHkganVzdCBmb3IgUUVNVSAoaXQgY291
bGQgYmUgaW1wbGVtZW50ZWQgZm9yCmt2bXRvb2wgaWYgZGVzaXJlZCksIGJ1dCBhcyBsb25nIGFz
IGl0J3MgaW4gdGhlIGhlbHAgSSBndWVzcyBpdCdzCmFjY2VwdGFibGUuCgpJIHRoaW5rIHdlIGNv
dWxkIGp1c3QgZHJvcCB0aGUgc2VudGVuY2UgYWJvdXQgYm9vdCBsb2FkZXJzIGZyb20gbXkKc3Vn
Z2VzdGlvbi4KCj4+Cj4+IGFuZCBhbHNvCj4+Cj4+IAlkZXBlbmRzIG9uICFFRkkKPj4KPj4gYmVj
YXVzZSBldmVuIHRob3VnaCBpbiBwcmluY2lwbGUgaXQgd291bGQgYmUgcG9zc2libGUgdG8gd3Jp
dGUgYSBQVkgKPj4gbG9hZGVyIGZvciBVRUZJLCBQVkgncyBzdGFydCBpbmZvIGRvZXMgbm90IHN1
cHBvcnQgdGhlIEVGSSBoYW5kb3Zlcgo+PiBwcm90b2NvbC4KPiAKPiBCdXQgd2Ugc2hvdWxkIGJl
IGFibGUgdG8gYnVpbGQgdGhlIGJpbmFyeSB3aXRoIGJvdGggRUZJIGFuZCBQVkg/CgpDYW4geW91
PyAgSXQncyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGJpbmFyeSBmb3JtYXQsIHRoZSBFRkkgaGFu
ZG92ZXIKcHJvdG9jb2wgaXMgaW52b2tlZCB2aWEgYSBzcGVjaWFsIGVudHJ5IHBvaW50IGFuZCBu
ZWVkcyB0aGUgTGludXggaGVhZGVyCmZvcm1hdCwgbm90IEVMRi4KClBhb2xvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
