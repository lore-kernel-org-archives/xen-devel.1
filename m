From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/xen: dont add memory above max
 allowed allocation
Date: Tue, 22 Jan 2019 01:52:32 -0700
Message-ID: <5C46D9D00200007800210007__36656.1461052456$1548147219$gmane$org@prv1-mh.provo.novell.com>
References: <20190122080628.7238-1-jgross@suse.com>
 <20190122080628.7238-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1glrnS-0001nd-NZ
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 08:52:38 +0000
In-Reply-To: <20190122080628.7238-3-jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE5IGF0IDA5OjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBEb24n
dCBhbGxvdyBtZW1vcnkgdG8gYmUgYWRkZWQgYWJvdmUgdGhlIGFsbG93ZWQgbWF4aW11bSBhbGxv
Y2F0aW9uCj4gbGltaXQgc2V0IGJ5IFhlbi4KClRoaXMgcmVhZHMgYXMgaWYgdGhlIGh5cGVydmlz
b3Igd2FzIGltcG9zaW5nIGEgbGltaXQgaGVyZSwgYnV0IGxvb2tpbmcgYXQKeGVuX2dldF9tYXhf
cGFnZXMoKSwgeGVuX2ZvcmVhY2hfcmVtYXBfYXJlYSgpLCBhbmQKeGVuX2NvdW50X3JlbWFwX3Bh
Z2VzKCkgSSB0YWtlIGl0IHRoYXQgaXQncyBhIHJlc3RyaWN0aW9uIGVuZm9yY2VkIGJ5CnRoZSBY
ZW4gc3Vic3lzdGVtIGluIExpbnV4LiBGdXJ0aGVybW9yZSBmcm9tIHRoZSBjb3ZlciBsZXR0ZXIg
SSBpbXBseQp0aGF0IHRoZSBvYnNlcnZlZCBpc3N1ZSB3YXMgb24gYSBEb20wLCB5ZXQgeGVuX2dl
dF9tYXhfcGFnZXMoKSdzCnVzZSBvZiBYRU5NRU1fbWF4aW11bV9yZXNlcnZhdGlvbiB3b3VsZG4n
dCBpbXBvc2UgYW55IGxpbWl0IHRoZXJlCmF0IGFsbCAod2l0aG91dCB1c2Ugb2YgdGhlIGh5cGVy
dmlzb3Igb3B0aW9uICJkb20wX21lbT1tYXg6Li4uIiksCndvdWxkIGl0PwoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
