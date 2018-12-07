From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Fri, 7 Dec 2018 11:07:54 -0500
Message-ID: <e6b86f5a-ef90-8770-8091-5a143ab00754__11953.4789039337$1544198851$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <20181206213752.GL3986@zn.tnic>
 <147cc043-b0af-74e9-5259-8c7854f82d8b@oracle.com>
 <63756df6-6f0b-fdfa-932e-b53d173da5be@redhat.com>
 <20181207102546.GC9385@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xdxm=OQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gVIgG-0003vX-5V
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 16:08:44 +0000
In-Reply-To: <20181207102546.GC9385@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, Maran Wilson <maran.wilson@oracle.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNy8xOCA1OjI1IEFNLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gT24gVGh1LCBEZWMg
MDYsIDIwMTggYXQgMTE6MTQ6MzRQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4+IFRo
ZXJlIGFyZSBzb21lIG1pbm9yIGNoYW5nZXMgaW4gbm9uLXhlbiB4ODYgY29kZSBzbyBpdCB3b3Vs
ZCBiZSBnb29kIHRvCj4+PiBnZXQgeDg2IG1haW50YWluZXJzJyBhY2suCj4+IEl0J3Mgbm90IHJl
YWxseSBjb2RlLCBvbmx5IEtjb25maWcgKGFuZCBJIHJlbWFya2VkIG9uIGl0IGp1c3Qgbm93KSwg
YnV0Cj4+IGl0IGRvZXNuJ3QgaHVydCBvZiBjb3Vyc2UuCj4gWWVhaCwgSSBkb24ndCBzZWUgYW55
dGhpbmcgb2JqZWN0aW9uYWJsZS4KCgpDYW4gdGhpcyBiZSBjb25zaWRlcmVkIGFzIGFuIEFDSyBm
cm9tIHlvdT8KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
