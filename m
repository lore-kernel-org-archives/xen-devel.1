From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 6 Dec 2018 22:21:12 +0100
Message-ID: <e8ed34e7-f82a-2314-9919-185d48510715__638.253047555004$1544131227$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NSIP=OP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gV15J-0001MS-Gd
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 21:21:25 +0000
In-Reply-To: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, mchehab@kernel.org, jpoimboe@redhat.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, dave.hansen@linux.intel.com, hch@infradead.org, mingo@redhat.com, tglx@linutronix.de, rdunlap@infradead.org, luto@kernel.org, hpa@zytor.com, boris.ostrovsky@oracle.com, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMTggMDc6MDIsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBGb3IgY2VydGFpbiBhcHBs
aWNhdGlvbnMgaXQgaXMgZGVzaXJhYmxlIHRvIHJhcGlkbHkgYm9vdCBhIEtWTSB2aXJ0dWFsCj4g
bWFjaGluZS4gSW4gY2FzZXMgd2hlcmUgbGVnYWN5IGhhcmR3YXJlIGFuZCBzb2Z0d2FyZSBzdXBw
b3J0IHdpdGhpbiB0aGUKPiBndWVzdCBpcyBub3QgbmVlZGVkLCBRZW11IHNob3VsZCBiZSBhYmxl
IHRvIGJvb3QgZGlyZWN0bHkgaW50byB0aGUKPiB1bmNvbXByZXNzZWQgTGludXgga2VybmVsIGJp
bmFyeSB3aXRob3V0IHRoZSBuZWVkIHRvIHJ1biBmaXJtd2FyZS4KPiAKPiBUaGVyZSBhbHJlYWR5
IGV4aXN0cyBhbiBBQkkgdG8gYWxsb3cgdGhpcyBmb3IgWGVuIFBWSCBndWVzdHMgYW5kIHRoZSBB
QkkKPiBpcyBzdXBwb3J0ZWQgYnkgTGludXggYW5kIEZyZWVCU0Q6Cj4gCj4gICAgaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3B2aC5odG1sCj4gCj4gVGhpcyBwYXRj
aCBzZXJpZXMgd291bGQgZW5hYmxlIFFlbXUgdG8gdXNlIHRoYXQgc2FtZSBlbnRyeSBwb2ludCBm
b3IKPiBib290aW5nIEtWTSBndWVzdHMuCgpUaGFua3MhICBJIHNob3VsZCBiZSBhYmxlIHRvIHBv
c3QgYSBUZXN0ZWQtYnkgbmV4dCBNb25kYXkuICBCb3JpcywgYXJlCnlvdSBnb2luZyB0byBwaWNr
IGl0IHVwIGZvciA0LjIxPwoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
