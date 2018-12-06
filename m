From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 6 Dec 2018 22:37:52 +0100
Message-ID: <20181206213752.GL3986__44288.7846650139$1544132209$gmane$org@zn.tnic>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TkPa=OP=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gV1LJ-0002PL-Vf
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 21:37:58 +0000
Content-Disposition: inline
In-Reply-To: <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, boris.ostrovsky@oracle.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, Maran Wilson <maran.wilson@oracle.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMTA6MjE6MTJQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBUaGFua3MhICBJIHNob3VsZCBiZSBhYmxlIHRvIHBvc3QgYSBUZXN0ZWQtYnkgbmV4
dCBNb25kYXkuICBCb3JpcywgYXJlCj4geW91IGdvaW5nIHRvIHBpY2sgaXQgdXAgZm9yIDQuMjE/
CgpCb3JpcyBtZSBvciBCb3JpcyBPLj8KCjotKQoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jp
cy4KCkdvb2QgbWFpbGluZyBwcmFjdGljZXMgZm9yIDQwMDogYXZvaWQgdG9wLXBvc3RpbmcgYW5k
IHRyaW0gdGhlIHJlcGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
