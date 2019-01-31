From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v6 00/27] x86: PIE support and option to
 extend KASLR randomization
Date: Thu, 31 Jan 2019 16:40:38 -0500
Message-ID: <20190131214038.GI28234__38024.8753399187$1548970939$gmane$org@char.us.oracle.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OC3Y=QH=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1gpK59-00018Y-Np
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 21:41:11 +0000
Content-Disposition: inline
In-Reply-To: <20190131192533.34130-1-thgarnie@chromium.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@chromium.org>
Cc: kernel-hardening@lists.openwall.com, Jan Kiszka <jan.kiszka@siemens.com>, Pavel Machek <pavel@ucw.cz>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Christoph Lameter <cl@linux.com>, Rafael =?iso-8859-1?Q?=C1vila_de_Esp=EDndola?= <rafael@espindo.la>, linux-arch@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-sparse@vger.kernel.org, xen-devel@lists.xenproject.org, Alexander Popov <alex.popov@linux.com>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Dennis Zhou <dennis@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, nixiaoming <nixiaoming@huawei.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulnier>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTE6MjQ6MDdBTSAtMDgwMCwgVGhvbWFzIEdhcm5pZXIg
d3JvdGU6Cj4gVGhlcmUgaGFzIGJlZW4gbm8gbWFqb3IgY29uY2VybiBpbiB0aGUgbGF0ZXN0IGl0
ZXJhdGlvbnMuIEkgYW0gaW50ZXJlc3RlZCBvbgo+IHdoYXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5
IHRvIHNsb3dseSBpbnRlZ3JhdGUgdGhpcyBwYXRjaHNldCB1cHN0cmVhbS4KCk9uZSBxdWVzdGlv
biB0aGF0IEkgd2FzIHNvbWVob3cgZXhwZWN0ZWQgaW4gdGhpcyBjb3ZlciBsZXR0ZXIgLSB3aGF0
CmFib3V0IGFsbCB0aG9zZSBsb3ZlbHkgc3BlY3VsYXRpdmUgYnVncz8gQXMgaW4gc2F5IHNvbWUg
b25lIGhhc24ndAp1cGRhdGVkIHRoZWlyIG1hY2hpbmUgd2l0aCB0aGUgU3BlY3RyZSB2M2EgbWlj
cm9jb2RlIC0gd291bGRuJ3QgdGhleQpiZSBhYmxlIHRvIGdldCB0aGUga2VybmVsIHZpcnR1YWwg
YWRkcmVzcyBzcGFjZT8KCkluIGVmZmVjdCByZW5kZXJpbmcgYWxsIHRoaXMgaGFyZC13b3JrIG5v
dCBuZWVkZWQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
