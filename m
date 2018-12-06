From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 6 Dec 2018 23:11:41 +0100
Message-ID: <d532f023-85f9-62b9-ca56-53a619fdcd1e__2239.84885165027$1544134239$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NSIP=OP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gV1s9-0006IY-JO
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:11:53 +0000
In-Reply-To: <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMTggMDc6MDQsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiArY29uZmlnIFBWSAo+ICsJ
Ym9vbCAiU3VwcG9ydCBmb3IgcnVubmluZyBQVkggZ3Vlc3RzIgo+ICsJLS0taGVscC0tLQo+ICsJ
ICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBQVkggZW50cnkgcG9pbnQgZm9yIGd1ZXN0IHZpcnR1
YWwgbWFjaGluZXMKPiArCSAgYXMgc3BlY2lmaWVkIGluIHRoZSB4ODYvSFZNIGRpcmVjdCBib290
IEFCSS4KPiArCgpJSVVDIHRoaXMgYnJlYWtzICJub3JtYWwiIGJ6SW1hZ2UgYm9vdCwgc28gd2Ug
c2hvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2UKCglUaGUgcmVzdWx0aW5nIGtlcm5lbCB3aWxsIG5v
dCBib290IHdpdGggbW9zdCB4ODYgYm9vdCBsb2FkZXJzCglzdWNoIGFzIEdSVUIgb3IgU1lTTElO
VVguICBVbmxlc3MgeW91IHBsYW4gdG8gc3RhcnQgdGhlIGtlcm5lbAoJdXNpbmcgUUVNVSBvciBY
ZW4sIHlvdSBwcm9iYWJseSB3YW50IHRvIHNheSBOIGhlcmUuCgphbmQgYWxzbwoKCWRlcGVuZHMg
b24gIUVGSQoKYmVjYXVzZSBldmVuIHRob3VnaCBpbiBwcmluY2lwbGUgaXQgd291bGQgYmUgcG9z
c2libGUgdG8gd3JpdGUgYSBQVkgKbG9hZGVyIGZvciBVRUZJLCBQVkgncyBzdGFydCBpbmZvIGRv
ZXMgbm90IHN1cHBvcnQgdGhlIEVGSSBoYW5kb3Zlcgpwcm90b2NvbC4KClBhb2xvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
