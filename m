From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: fix dom0 boot on huge systems
Date: Thu, 07 Mar 2019 03:45:54 -0700
Message-ID: <5C80F662020000780021C674__35515.562414524$1551955621$gmane$org@prv1-mh.provo.novell.com>
References: <20190307091119.6700-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1qXK-0001cD-Qe
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:46:02 +0000
In-Reply-To: <20190307091119.6700-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE5IGF0IDEwOjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBDb21t
aXQgZjdjOTBjMmFhNDAwNDggKCJ4ODYveGVuOiBkb24ndCB3cml0ZSBwdGVzIGRpcmVjdGx5IGlu
IDMyLWJpdAo+IFBWIGd1ZXN0cyIpIGludHJvZHVjZWQgYSByZWdyZXNzaW9uIGZvciBib290aW5n
IGRvbTAgb24gaHVnZSBzeXN0ZW1zCj4gd2l0aCBsb3RzIG9mIFJBTSAoaW4gdGhlIFRCIHJhbmdl
KS4KPiAKPiBSZWFzb24gaXMgdGhhdCBvbiB0aG9zZSBob3N0cyB0aGUgcDJtIGxpc3QgbmVlZHMg
dG8gYmUgbW92ZWQgZWFybHkgaW4KPiB0aGUgYm9vdCBwcm9jZXNzIGFuZCB0aGlzIHJlcXVpcmVz
IHRlbXBvcmFyeSBwYWdlIHRhYmxlcyB0byBiZSBjcmVhdGVkLgo+IFNhaWQgY29tbWl0IG1vZGlm
aWVkIHhlbl9zZXRfcHRlX2luaXQoKSB0byB1c2UgYSBoeXBlcmNhbGwgZm9yIHdyaXRpbmcKPiBh
IFBURSwgYnV0IHRoaXMgcmVxdWlyZXMgdGhlIHBhZ2UgdGFibGUgYmVpbmcgaW4gdGhlIGRpcmVj
dCBtYXBwZWQKPiBhcmVhLCB3aGljaCBpcyBub3QgdGhlIGNhc2UgZm9yIHRoZSB0ZW1wb3Jhcnkg
cGFnZSB0YWJsZXMgdXNlZCBpbgo+IHhlbl9yZWxvY2F0ZV9wMm0oKS4KPiAKPiBBcyB0aGUgcGFn
ZSB0YWJsZXMgYXJlIGNvbXBsZXRlbHkgd3JpdHRlbiBiZWZvcmUgYmVpbmcgbGlua2VkIHRvIHRo
ZQo+IGFjdHVhbCBhZGRyZXNzIHNwYWNlIGluc3RlYWQgb2Ygc2V0X3B0ZSgpIGEgcGxhaW4gd3Jp
dGUgdG8gbWVtb3J5IGNhbgo+IGJlIHVzZWQgaW4geGVuX3JlbG9jYXRlX3AybSgpLgo+IAo+IEZp
eGVzOiBmN2M5MGMyYWE0MDA0OCAoIng4Ni94ZW46IGRvbid0IHdyaXRlIHB0ZXMgZGlyZWN0bHkg
aW4gMzItYml0IFBWIGd1ZXN0cyIpCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
