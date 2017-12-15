From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v3 2/2] KVM: x86: Allow Qemu/KVM to use
 PVH entry point
Date: Fri, 15 Dec 2017 18:25:34 +0100
Message-ID: <72846976-b3c3-ceca-8168-d50bcad5993e__28156.257820274$1513358805$gmane$org@redhat.com>
References: <1513122151-5371-1-git-send-email-maran.wilson@oracle.com>
 <1513122151-5371-3-git-send-email-maran.wilson@oracle.com>
 <d63fa041-ce36-3c1b-3d8b-87b4c5c4b84f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hp5g=dl=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ePtk3-0007sX-7v
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 17:25:47 +0000
In-Reply-To: <d63fa041-ce36-3c1b-3d8b-87b4c5c4b84f@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Maran Wilson <maran.wilson@oracle.com>, boris.ostrovsky@oracle.com, roger.pau@citrix.com, andrew.cooper3@citrix.com, hch@infradead.org, JBeulich@suse.com, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, rkrcmar@redhat.com, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTIvMjAxNyAxNjo1NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJJ20gZmluZSB3aXRo
IHRoZSBnZW5lcmFsIGlkZWEuCj4gCj4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIHlvdSByZWFsbHkg
d2FudCB0byByZXF1aXJlIENPTkZJR19YRU4gZm9yIHRoZQo+IEtWTSBjYXNlLCB0aG91Z2guCj4g
Cj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHJlbmFtZSBhcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2aC5jIHRvCj4gYXJjaC94ODYvcHZoLmMgYW5kIGFyY2gveDg2L3hlbi94ZW4tcHZoLlMgdG8g
YXJjaC94ODYvcHZoLWhlYWQuUywKClllcywgc291bmRzIGdvb2QuCgo+IHB1dCBib3RoIHVuZGVy
IENPTkZJR19QVkggdW1icmVsbGEgYW5kIHNlbGVjdCB0aGlzIGZyb20gQ09ORklHX1hFTl9QVkgK
PiBhbmQgS1ZNX1BWSCAob3Igd2hhdCB5b3UgbGlrZSB0byBjYWxsIGl0KT8KCkNPTkZJR19LVk1f
R1VFU1Qgd2lsbCBiZSBnb29kIGVub3VnaC4KCj4gSW4gdGhlIHR3byBtb3ZlZCBzb3VyY2UgZmls
ZXMgeW91IGNhbiBtYWtlIFhlbi9LVk0tc3BlY2lmaWMgcGFydHMKPiBvcHRpb25hbCB2aWEgdGhl
aXIgQ09ORklHXyBvcHRpb25zLgo+IAo+IEFuZCB5b3UgbWlnaHQgd2FudCB0byBhZGQgYW4gb3du
IEVMRiBub3RlIGZvciB0aGUgS1ZNIGNhc2U/CgpBcyBsb25nIGFzIGl0J3MgY29tcGF0aWJsZSB3
aXRoIFhlbiwgaXQncyBub3QgbmVlZGVkLiAgT25seSB0aGUgc3RhcnR1cApjb2RlIGNoYW5nZXMg
YmV0d2VlbiBhIEtWTSAiUFZIIiBrZXJuZWwgYW5kIGEgS1ZNICJIVk0iIGtlcm5lbC4KClBhb2xv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
